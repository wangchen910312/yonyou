(function ($, kendo) {


    //트리리스트
	var TreeList = kendo.ui.TreeList.extend({

		cudDataLength:0,
		getCUDData:function(insertedPropName, updatedPropName, deletedPropName){

			var i = insertedPropName? insertedPropName:"_inserted";
			var u = updatedPropName? updatedPropName:"_updated";
			var d = deletedPropName? deletedPropName:"_deleted";

			var o = {};
			o[i] = [];
			o[u] = [];
			o[d] = [];

			var gridDataSource = this.dataSource;

			o[d] = gridDataSource._destroyed;
			$(gridDataSource._flatData(gridDataSource._data)).each(function(idx, value){
				if(this.isNew()){
					o[i].push(value);
				}else if(this.dirty){
					o[u].push(value);
				}
			});


			this.cudDataLength = o[i].length + o[u].length +  o[d].length;

			return o;
	    },

	    gridValidation:function(){
	        var rows = this.tbody.find("tr");
	        for (var i = 0; i < rows.length; i++) {
	            var model = this.dataItem(rows[i]);

	            // 추가/수정된 목록 체크
	            if (model && model.id <= 0 && (model.isNew() || model.dirty)) {
	                var cols = $(rows[i]).find("td");
	                for (var j = 0; j < cols.length; j++) {
	                   	this.editCell($(cols[j]));
	                   	if(this.editable){
		                    if (!this.editable.end()) {
		                        return false;
		                    }
		                    else {
		                        this.closeCell();
		                    }
	                    }
	                }
	            }

	        }
	       return true;
		}
	});

    kendo.ui.plugin(TreeList);

}(window.kendo.jQuery, window.kendo));

//ExtGrid
(function ($) {

    var kendo = window.kendo,
    proxy = $.proxy,
    ui = kendo.ui,
    Widget = ui.Grid,
    keys = kendo.keys,
    inArray = $.inArray,
    CHANGE = "change",
    CLICK = "click",
    COPYFROMEXCEL = "copyFromExcel",
    COLUMNHIDE = "columnHide",
    COLUMNSHOW = "columnShow",
    COLUMNREORDER = "columnReorder",
    DATABOUND = "dataBound",
    DATABINDING = "dataBinding",
    EDIT = "edit",
    FOCUSED = "k-state-focused",
    NAVIGATE = "navigate",
    NS = ".kendoExtGrid",
    SELECTABLE = "k-selectable",
    SELECTION_CELL_SELECTOR = "tbody>tr:not(.k-grouping-row):not(.k-detail-row):not(.k-group-footer) > td:not(.k-group-cell):not(.k-hierarchy-cell)";

    var ExtGrid = Widget.extend({
        init:function(element, options){
            var that = this;
            var ctrlDown = false;
            var ctrlKey = 17;
            var vKey = 86;
            var gridWrapper = $(element.parentElement);
            var currentStateSelectedRow;
            var settings = {
                dataSource:{
                    error:function(e) {
                    	dms.notification.error(e.xhr.responseJSON.errors);
                    }
                    ,requestEnd:function(e) {
                    }
                    ,transport:{
                        read:{
                            dataType:"json"
                            ,type:"POST"
                            ,contentType:"application/json"
                        }
                    }
                    ,batch:true
                    ,pageSize:50
                    ,serverFiltering:false
                    ,serverPaging:true
                    ,serverSorting:true
                    ,schema:{
                        data:"data"
                        ,total:"total"
                    }
                }
                ,appendEmptyColumn:false            //빈컬럼 적용
                ,cellTextToClipboard:false          //그리드 셀에서 CTRL+더블클릭시 셀데이터를 클립보드에 복사한다.
                ,autoBind:true
                ,editable:{
                    mode:"incell"
                    ,confirmation:false
                }
                ,editableExcludeColumns:[]          //에디터 제외 컬럼 목록
                ,editableOnlyNew:false              //신규추가행만 에디터 적용여부
                ,editableOnlyNewExcludeColumns:[]   //신규추가 로우 에디터 제외 컬럼 목록
                ,enableDragToSelectRows:false       //드래그 컬럼 선택 - 드래그 컬럼 선택이 false 인 경우 멀티선택 그리드는 ctrl+drag로 선택가능 하다.
                ,enableTooltip:false                //컬럼 툴팁 출력 여부(마우스오버시)
                ,tooltipPosition:"left"             //컬럼 툴팁 표시 위치(left, right, top, bottom)
                ,filterable:{
                    mode:"row"
                }
                ,height:380
                ,indvColumnReorderable:true         //컬럼순서 변경 개인화 적용
                ,indvColumnRows:10                  //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수
                ,indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용 [중요 : columns.field 속성을 주지 않은 컬럼은 columns._field 속성을 반드시 부여해야 한다]
                ,multiSelectLocked:false            //멀티선택 컬럼 틀고정
                ,multiSelectWithCheckbox:false      //멀티선택 적용
                ,navigatable:true
                ,pageable:{
                    refresh:false
                    ,pageSizes:[50, 100, 300]
                    ,buttonCount:5
                    ,input:false
                    ,numeric:true
                    ,info:true
                    ,messages:{
                        itemsPerPage:""
                        ,display:"{0}-{1} of {2}"
                        ,empty:""
                    }
                }
                ,reorderable:true
                ,resizable:true
                ,scrollable:true
                ,selectable:"multiple, row"
                ,showAfterTooltip:500				//컬럼 툴팁 팝업 딜레이 시간(밀리초)
                ,sortable:{
                    mode:"multiple"
                        ,allowUnsort:true
                }
                ,visibleCheckAll:true               //전체 선택/해제 체크박스 출력여부
                ,visibleFilterRow:false             //필터로우 출력여부
                ,_columns:[]
            };

            if (dms.browser.isMobile()) {
                settings["mobile"] = true;
                settings["enableDragCopy"] = false;
            }

            var gridIndvHtml = "";
            gridIndvHtml += "<div class=\"grid_setting\">";
            gridIndvHtml += "<a href=\"javascript:;\" class=\"gridSetting_open\">Grid Setting</a>";
            gridIndvHtml += "<a href=\"javascript:;\" class=\"filterSearch_open\">Filter Search</a>";
            gridIndvHtml += "<a href=\"javascript:;\" class=\"colSetting_open\">" + dms.settings.defaultMessage.gridIndividualization + "</a>";
            gridIndvHtml += "{indvColumnList}";
            gridIndvHtml += "</div>";

            var applyFilter = false;
            //Client Side 필터적용
            if(options.filterable !== false
                    && options.dataSource.schema
                    && options.dataSource.schema.model
                    && options.dataSource.schema.model.fields) {

                applyFilter = true;

                $.each(options.columns, function(idx, column){
                    if(column.filterable !== false && !column.hasOwnProperty("filterable") && column.field) {
                        var field = options.dataSource.schema.model.fields[column.field];

                        var fieldType = "string";

                        if(field && field["type"]) {
                            fieldType = field["type"];
                        }

                        if (fieldType === "string") {
                            column["filterable"] = {
                                cell:{
                                    showOperators:false
                                    ,operator:"contains"
                                    ,suggestionOperator:"contains"
                                    ,dataSource:[]
                                    ,dataTextField:column.field
                                }
                            };
                        } else if (fieldType === "number") {
                            column["filterable"] = {
                                cell:{
                                    showOperators:false
                                    ,operator:"eq"
                                    ,suggestionOperator:"eq"
                                    ,template:function (container) {
                                        container.element.kendoNumericTextBox({
                                            format:"n0"
                                            ,spinners:false
                                        });
                                    }
                                }
                            };
                        } else if (fieldType === "date") {
                            column["filterable"] = {
                                cell:{
                                    showOperators:false
                                    ,operator:"equalTo"
                                    ,suggestionOperator:"equalTo"
                                    ,template:function (container) {
                                        container.element.kendoExtMaskedDatePicker({
                                            dateValidMessage:dms.settings.defaultMessage.invalidDateFormat
                                        });
                                    }
                                }
                            };
                        }
                    }
                });
            }

            //그리드 개인화 컬럼출력 행수 자동조정
            if(options.height && !options.indvColumnRows && options.height < settings.height){
                var indvHeight = options.height - 50;
                if(options.pageable !== false){
                    indvHeight = indvHeight - 33;
                }

                options["indvColumnRows"] = Math.max(Math.min(Math.floor(indvHeight/22), settings.indvColumnRows), 1);
            }

            $.extend(true, settings, options);

            //멀티선택 컬럼 적용
            if (settings.multiSelectWithCheckbox) {
                settings.columns.unshift({
                    title:"&nbsp;"
                    ,width:30
                    ,sortable:false
                    ,attributes:{"class":"ac"}
                    ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' />"
                    ,headerTemplate:settings.visibleCheckAll? "<input type='checkbox' class='checkAll' />":"&nbsp;"
                    ,_field:"_multiSelectWithCheckbox"
                    ,_hidden:true
                    ,filterable:false
                    ,locked:settings.multiSelectLocked
                });
            }

            //빈 컬럼 적용
            if (settings.appendEmptyColumn) {
                settings.columns.push({
                    title:"&nbsp;"
                    ,_field:"_empty"
                    ,_hidden:true
                    ,filterable:false
                });
            }

            var columnList = "";
            var applyIndvColumn = false;
            //그리드 개인화 적용
            if (settings.indvColumnVisible || settings.indvColumnReorderable) {
                if(settings.gridId) {

                    applyIndvColumn = true;

                    //초기화를 위한 초기설정 컬럼 정보를 저장한다.
                    //Array Deap Copy
                    settings._columns = JSON.parse(JSON.stringify(settings.columns));

                    var showColumns = settings.columns.filter(function(column){
                        if(column.field){
                            return !(("hidden" in column && column.hidden) || column._hidden);
                        }else{
                            return false;
                        }
                    });

                    var cols = 0;
                    var colsSize = Math.min(Math.ceil(showColumns.length / settings.indvColumnRows), 5);
                    var showColumnsLength = showColumns.length;

                    columnList += ""
                        + " <div class=\"columns_setting col_x" + colsSize + "\">"
                        + "     <div class=\"colSetting_box\">"
                        + "         <div class=\"colSetting_header\">"
                        + "             <h2>Columns Setting</h2>"
                        + "             <div class=\"colSetting_btn\">"
                        + "                 <button type=\"button\" class=\"btn_xs btn_clean_reorder\">" + dms.settings.defaultMessage.btnGridColumnSortInit + "</button>"
                        + "                 <button type=\"button\" class=\"btn_xs btn_clean_visable\">" + dms.settings.defaultMessage.btnGridColumnHideInit + "</button>"
                        + "             </div>"
                        + "         </div>"
                        + "         <div class=\"colSetting_list\">";

                        var columnField;
                        $.each(showColumns, function(idx, column){
                            if(idx % colsSize  == 0){
                                cols = 0;
                                columnList += "<ul>";
                            }

                            //columnField =  column.field||column._field;
                            if(column.field){
                                columnList += "<li><label class=\"label_check\"><input type=\"checkbox\" class=\"form_check\" id=\"" + settings.gridId + "-" + column.field + "\" data-field=\"" + column.field + "\" checked> <span>" + column.title + "</span></label></li>";
                                cols++;
                            }

                            if(cols == colsSize || showColumnsLength == idx+1){

                                while(colsSize-cols > 0){
                                    columnList += "<li></li>";
                                    cols++;
                                }

                                columnList += "</ul>";
                            }
                        });

                    columnList += ""
                        + "         </div>"
                        + "         <button type=\"button\" class=\"colSetting_close\">close</button>"
                        + "     </div>"
                        + "     <div class=\"bg_colSetting\"></div>"
                        + "</div>";

                    gridIndvHtml = gridIndvHtml.replace("{indvColumnList}", columnList);

                    //gridWrapper = $(element.parentElement);

                    //컬럼개인화 필드 설정
                    gridWrapper.append(gridIndvHtml);

                    $.ajax({
                        url:_contextPath + "/cmm/sci/gridIndividualization/selectGridIndividualizations.do"
                        ,data:JSON.stringify({"sGridId":settings.gridId})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {
                            //필드 보이기/감추기 개인화
                            if(settings.indvColumnVisible && jqXHR.columnHide){
                                var hiddenColumns = JSON.parse(jqXHR.columnHideFields);
                                $.each(settings.columns, function(gridColumnIdx, gridColumn){
                                    if(hiddenColumns.length == 0){
                                        gridColumn["hidden"] = false;
                                    }else{
                                        $.each(hiddenColumns, function(idx, field){
                                            if(gridColumn["field"] == field || gridColumn["_field"] == field) {
                                                gridColumn["hidden"] = true;
                                                gridWrapper.find("#" + settings.gridId + "-" + field).prop("checked", false);
                                            }
                                        });
                                    }
                                });
                            }

                            //필드 표시순서 개인화
                            if(settings.indvColumnReorderable && jqXHR.columnReorder){
                                var columns = new Array();
                                var columnReorders = JSON.parse(jqXHR.columnReorderFields);

                                $.each(columnReorders, function(idx, columnReorder){
                                    var column = $.grep(settings.columns, function(item) {
                                        if(columnReorder.field) {
                                            return item.field === columnReorder.field;
                                        }else if(columnReorder._field) {
                                            return item._field === columnReorder._field;
                                        }
                                        return false;
                                    })[0];

                                    columns[columnReorder.idx] = column;
                                });
                                settings.columns = columns;
                            }
                        }
                    });
                }
            }

            if(applyFilter && applyIndvColumn){
                $("div.grid_setting", gridWrapper).addClass("all");

                //grid setting hover
                gridWrapper.find("a.gridSetting_open").on("mouseenter", function(){
                    $(this).addClass("active");
                    $(this).siblings("a").show();
                });

                gridWrapper.find("div.grid_setting").on("mouseleave", function(){
                    $(".gridSetting_open").removeClass("active");
                    $("div.grid_setting.all a.colSetting_open, div.grid_setting.all a.filterSearch_open").hide();
                });

                gridWrapper.find("div.columns_setting input.form_check").bind("click", function(){
                    var field = $(this).data("field");

                    if ($(this).prop("checked")) {
                        that.showColumn(field);
                    } else {
                        that.hideColumn(field);
                    }
                });

                //필터로우 토글
                gridWrapper.find("a.filterSearch_open").bind("click", function(){
                    var filterRow = $("tr.k-filter-row", element);
                    var gridContent = $("div.k-grid-content", element);

                    if(filterRow.is(":visible")){
                        filterRow.hide();
                        gridContent.height(gridContent.height()+filterRow.height());
                    }else{
                        filterRow.show();
                        gridContent.height(gridContent.height()-filterRow.height());
                    }
                });


                //컬럼개인화 메뉴 열기
                gridWrapper.find("a.colSetting_open").bind("click", function(){
                    var colSettingArea = $(this).siblings("div.columns_setting");
                    var colSettingGrid = $(this).parents(".table_grid");

                    if(colSettingArea.is(":hidden")){
                        $(this).addClass("active");
                        if(colSettingArea.outerHeight() > colSettingGrid.outerHeight() && (colSettingGrid.offset().top + colSettingArea.outerHeight() + 18) > $("#content").height()){
                            colSettingArea.addClass("position_up");
                            if(colSettingArea.outerHeight() > colSettingGrid.offset().top){
                                colSettingArea.css("top", -colSettingGrid.offset().top + "px");
                            }else{
                                colSettingArea.css("top", -(colSettingArea.outerHeight()+3) + "px");
                            }
                        }else{
                            colSettingArea.removeClass("position_up").css("top", "18px");
                        }
                        $("div.columns_setting").hide();
                        colSettingArea.show();
                    }else{
                        $(this).removeClass("active");
                        colSettingArea.hide();
                    }
                });

                //컬럼개인화 메뉴 닫기
                gridWrapper.find("button.colSetting_close").bind("click", function(){
                    $(".colSetting_open").removeClass("active");
                    $("div.columns_setting").hide();
                });

                //컬럼개인화 정렬 초기화
                gridWrapper.find("button.btn_clean_reorder").bind("click", function(){
                    $.ajax({
                        url:_contextPath + "/cmm/sci/gridIndividualization/deleteGridIndividualization.do"
                        ,data:JSON.stringify({"gridId":settings.gridId, "gridIndvTp":"1"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {
                            $.each(that.options._columns, function(idx, column){
                                if(column.field){
                                    var lookupColumn = that.lookupColumn(column.field);
                                    that.reorderColumn(idx, lookupColumn);
                                }
                            });
                        }
                    });
                });

                //컬럼개인화 선택 초기화
                gridWrapper.find("button.btn_clean_visable").bind("click", function(){
                    $.ajax({
                        url:_contextPath + "/cmm/sci/gridIndividualization/deleteGridIndividualization.do"
                        ,data:JSON.stringify({"gridId":settings.gridId, "gridIndvTp":"2"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {
                            $.each(that.options._columns, function(idx, column){
                                if(column.field){
                                    var checkbox = $("#" + that.options.gridId + "-" + column.field);
                                    if(column.hidden){
                                        that.hideColumn(column.field);
                                        checkbox.prop("checked", false);
                                    }else{
                                        that.showColumn(column.field);
                                        checkbox.prop("checked", true);
                                    }
                                }
                            });
                        }
                    });
                });

            }else if(applyFilter){
                gridIndvHtml = gridIndvHtml.replace("{indvColumnList}", "");
                gridWrapper.append(gridIndvHtml);
                $("div.grid_setting", gridWrapper).addClass("only_filter");

                //grid setting hover
                gridWrapper.find("a.gridSetting_open").on("mouseenter", function(){
                    $(this).addClass("active");
                    $(this).siblings("a").show();
                });

                gridWrapper.find("div.grid_setting").on("mouseleave", function(){
                    $(".gridSetting_open").removeClass("active");
                    $("div.grid_setting.all a.colSetting_open, div.grid_setting.all a.filterSearch_open").hide();
                });

                //필터로우 토글
                gridWrapper.find("a.filterSearch_open").bind("click", function(){
                    var filterRow = $("tr.k-filter-row", element);
                    var gridContent = $("div.k-grid-content", element);

                    if(filterRow.is(":visible")){
                        filterRow.hide();
                        gridContent.height(gridContent.height()+filterRow.height());
                    }else{
                        filterRow.show();
                        gridContent.height(gridContent.height()-filterRow.height());
                    }
                });
            }else if(applyIndvColumn){
                $("div.grid_setting", gridWrapper).addClass("only_col");

                //grid setting hover
                gridWrapper.find("a.gridSetting_open").on("mouseenter", function(){
                    $(this).addClass("active");
                    $(this).siblings("a").show();
                });

                gridWrapper.find("div.grid_setting").on("mouseleave", function(){
                    $(".gridSetting_open").removeClass("active");
                    $("div.grid_setting.all a.colSetting_open, div.grid_setting.all a.filterSearch_open").hide();
                });

                gridWrapper.find("div.columns_setting input.form_check").bind("click", function(){
                    var field = $(this).data("field");

                    if ($(this).prop("checked")) {
                        that.showColumn(field);
                    } else {
                        that.hideColumn(field);
                    }
                });

                //컬럼개인화 메뉴 열기
                gridWrapper.find("a.colSetting_open").bind("click", function(){
                    var colSettingArea = $(this).siblings("div.columns_setting");
                    var colSettingGrid = $(this).parents(".table_grid");

                    if(colSettingArea.is(":hidden")){
                        $(this).addClass("active");
                        if(colSettingArea.outerHeight() > colSettingGrid.outerHeight() && (colSettingGrid.offset().top + colSettingArea.outerHeight() + 18) > $("#content").height()){
                            colSettingArea.addClass("position_up");
                            if(colSettingArea.outerHeight() > colSettingGrid.offset().top){
                                colSettingArea.css("top", -colSettingGrid.offset().top + "px");
                            }else{
                                colSettingArea.css("top", -(colSettingArea.outerHeight()+3) + "px");
                            }
                        }else{
                            colSettingArea.removeClass("position_up").css("top", "18px");
                        }
                        $("div.columns_setting").hide();
                        colSettingArea.show();
                    }else{
                        $(this).removeClass("active");
                        colSettingArea.hide();
                    }
                });

                //컬럼개인화 메뉴 닫기
                gridWrapper.find("button.colSetting_close").bind("click", function(){
                    $(".colSetting_open").removeClass("active");
                    $("div.columns_setting").hide();
                });

                //컬럼개인화 정렬 초기화
                gridWrapper.find("button.btn_clean_reorder").bind("click", function(){
                    $.ajax({
                        url:_contextPath + "/cmm/sci/gridIndividualization/deleteGridIndividualization.do"
                        ,data:JSON.stringify({"gridId":settings.gridId, "gridIndvTp":"1"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {
                            $.each(that.options._columns, function(idx, column){
                                if(column.field){
                                    var lookupColumn = that.lookupColumn(column.field);
                                    that.reorderColumn(idx, lookupColumn);
                                }
                            });
                        }
                    });
                });

                //컬럼개인화 선택 초기화
                gridWrapper.find("button.btn_clean_visable").bind("click", function(){
                    $.ajax({
                        url:_contextPath + "/cmm/sci/gridIndividualization/deleteGridIndividualization.do"
                        ,data:JSON.stringify({"gridId":settings.gridId, "gridIndvTp":"2"})
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {
                            $.each(that.options._columns, function(idx, column){
                                if(column.field){
                                    var checkbox = $("#" + that.options.gridId + "-" + column.field);
                                    if(column.hidden){
                                        that.hideColumn(column.field);
                                        checkbox.prop("checked", false);
                                    }else{
                                        that.showColumn(column.field);
                                        checkbox.prop("checked", true);
                                    }
                                }
                            });
                        }
                    });
                });
            }

            Widget.fn.init.call(this, element, settings);

            //그리드 셀이동시 해당 로우 배경색상 적용 해제
            that.bind(NAVIGATE, function(e){
                var row = e.element.closest("tr");

                if(row !== currentStateSelectedRow){
                    if(currentStateSelectedRow){
                        currentStateSelectedRow.removeClass("k-state-selected-ext");
                    }
                }
                row.addClass("k-state-selected-ext");
                currentStateSelectedRow = row;
            });

            that.table
            .on("focusout" + NS, function() {
                var current = that.current();
                if (current) {
                    current.closest("tr").removeClass("k-state-selected-ext");
                }
            });

            //그리드 개인화 적용
            that._gridIndividualization();

            //필터로우 출력 적용
            that._visibleFilterRow();

            //체크박스 선택 적용
            that._multiSelectWithCheckbox();

            //셀텍스트 클립보드 자동복사 적용
            that._cellTextToClipboard();

            //변경시 에디트 모드 예외 필드 설정
            that._editableOnlyNew();

            //에디트 모드 예외 필드 설정
            that._editableExcludeColumns();

            //엑셀 TO 그리드 데이터 복사
            that._copyFromExcel();

            //그리드 툴팁 기능 적용
            that._enableTooltip();

        },
        options:{
            name:"ExtGrid"
            ,useCopyFromExcel:false
            ,gridId:""
        },

        _enableTooltip:function(){
            var that = this;
            if(that.options.enableTooltip) {
                $(that.element).kendoTooltip({
                     filter:'td.tooltip-enabled'
                    ,showAfter:that.options.showAfterTooltip
                    ,position:that.options.tooltipPosition
                    ,content:function(e){
                    	if(dms.string.isEmpty(e.target.text())){
                    		return null;
                    	}

                    	var content = $("<div/>").css({
                    		"width":"250px"
                    		,"white-space":"normal"
                    		,"text-align":"left"
                    	}).text(e.target.text());

                    	return content[0];
                    }
                	,show:function(){
                		if(dms.string.isEmpty($(this.content).text())){
                			this.hide();
                		}
                	}
                }).data("kendoTooltip");
            }
        },

        /**
         * 필터로우 출력
         */
        _visibleFilterRow:function(){
            var that = this;
            if(!that.options.visibleFilterRow){
                $("tr.k-filter-row", that.element).hide();
            }
        },

        /**
         * 엑셀 To 그리드 데이터 복사
         */
        _copyFromExcel:function(){
            var that = this;
            if(that.options.copyFromExcel) {
                $(that.element).on("keydown", function(e){

                    if(e.keyCode == ctrlKey) {
                        ctrlDown = true;
                    }

                    if(ctrlDown && (e.keyCode == vKey)) {
                        var data = [];
                        var value = $.trim(window.clipboardData.getData("Text"));

                        if(!dms.string.isEmpty(value)){
                            var rows = value.split("\r\n");

                            for(var i=0; i<rows.length; i++) {
                               data[i] = rows[i].split("\t");
                            }

                            that.trigger(COPYFROMEXCEL, data);
                        }
                    }
                })
                .on("keyup", function(e){

                    if(e.keyCode == ctrlKey) {
                        ctrlDown = false;
                    }
                });
            }
        },

        /**
         * 멀티선택 체크박스 필드 적용
         */
        _multiSelectWithCheckbox:function(){
            var that = this;

            if(that.options.multiSelectWithCheckbox){

                that.bind(DATABOUND, function(){
                    that._checkboxToggle();
                });

                that.bind(CHANGE, function(){
                    that._rowSelect();
                });

                that.element.on(CLICK, ".grid-checkbox-item", function(e) {

                    var row = that.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");

                    if ($(this).is(":checked")) {
                        that.select(row);
                    } else {
                        $(e.currentTarget).closest("tr").removeClass("k-state-selected");
                        $(row).removeClass("k-state-selected");
                    }

                    if(!that.options.visibleCheckAll){
                        return;
                    }

                    var selectedRows = that.options.multiSelectLocked == true? that.select().length/2:that.select().length;

                    if(selectedRows == that.dataSource.view().length){
                        $(".checkAll", that.element).prop("checked", true);
                    }else{
                        $(".checkAll", that.element).prop("checked", false);
                    }

                });

            }
        },

        /**
         * 셀텍스트 클립보드 자동복사 적용
         */
        _cellTextToClipboard:function(){
            var that = this;

            if(that.options.cellTextToClipboard){
                that.bind(DATABOUND, function(e){
                    $("td", e.sender.tbody).bind("click", function(evt){
                        if(evt.ctrlKey){
                            console.log(evt);
                            dms.utils.copyToClipboard(this.innerText);
                        }
                    });
                });
            }
        },

        _checkboxToggle:function() {
            var that = this;

            $(".checkAll", that.element).click(function() {
                var checked = $(this).is(":checked");

                if (checked) {
                    that.select(that.tbody.find(">tr"));
                } else {
                    that.clearSelection();
                }
            });
        },

        _rowSelect:function(){
            var that = this;

            $(".grid-checkbox-item", $('#' + that.element[0].id)).prop("checked", false);

            var rows = that.select();
            rows.each(function(index, row) {
                $("input.grid-checkbox-item", row).prop("checked", true);
            });

            if(!that.options.visibleCheckAll){
                return;
            }

            var selectedRows = that.options.multiSelectLocked == true? that.select().length/2:that.select().length;

            if(selectedRows == that.dataSource.view().length){
                $(".checkAll", that.element).prop("checked", true);
            }else{
                $(".checkAll", that.element).prop("checked", false);
            }

        },

        _editableOnlyNew:function(){
            var that = this;

            if (that.options.editableOnlyNew) {
                that.bind(EDIT, function(e){
                    if(!e.model.isNew()) {
                        var fieldName = e.container.find("input[name][data-bind]").attr("name");

                        if(that.options.editableOnlyNewExcludeColumns.length > 0) {
                            if($.inArray(fieldName, that.options.editableOnlyNewExcludeColumns) == -1){
                                that.closeCell();
                            }
                        } else {
                            that.closeCell();
                        }
                    }
                });
            }
        },

        _editableExcludeColumns:function(){
            var that = this;

            that.bind(EDIT, function(e){
                var fieldName = e.container.find("input[name][data-bind]").attr("name");

                if(that.options.editableExcludeColumns.length > 0) {
                    if($.inArray(fieldName, that.options.editableExcludeColumns) != -1){
                        that.closeCell();
                    }
                }
            });
        },

        _gridIndividualization:function() {

            var that = this;

            var applyGridIndividualization = function(evt, gridIndvTp){
                var gridIndvCont = [];
                if(gridIndvTp == "1") {
                    var columns = [];
                    $.each(evt.sender.columns, function(idx, column){
                        var o = {};
                        if(column.field) {
                            o["field"] = column.field;
                        }

                        if(column._field) {
                            o["_field"] = column._field;
                        }
                        columns.push(o);
                    });

                    columns.splice(evt.oldIndex,1);
                    columns.splice(evt.newIndex,0, {"field":evt.column.field, "_field":evt.column._field});

                    $.each(columns, function(idx, column){
                        var columnReorder = {};
                        columnReorder["idx"] = idx;

                        if(column.field) {
                            columnReorder["field"] = column.field;
                        }

                        if(column._field) {
                            columnReorder["_field"] = column._field;
                        }

                        gridIndvCont.push(columnReorder);
                    });
                } else if(gridIndvTp == "2") {
                    $.each(evt.sender.columns, function(idx, column){
                        if(column.hidden) {
                            gridIndvCont.push(column.field);
                        }
                    });
                }

                $.ajax({
                    url:_contextPath + "/cmm/sci/gridIndividualization/insertOrUpdateGridIndividualization.do"
                    ,data:JSON.stringify({"gridId":that.options.gridId, "gridIndvTp":gridIndvTp, "gridIndvCont":JSON.stringify(gridIndvCont)})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                });

            };

            if (that.options.indvColumnVisible) {
                //ColumnHide 이벤트시 컬럼 개인화 정보를 갱신한다.
                that.bind(COLUMNHIDE, function(e){
                    applyGridIndividualization(e, "2");
                });

                //ColumnShow 이벤트시 컬럼 개인화 정보를 갱신한다.
                that.bind(COLUMNSHOW, function(e){
                    applyGridIndividualization(e, "2");
                });
            }

            if (that.options.indvColumnReorderable) {
                that.bind(COLUMNREORDER, function(e){
                    applyGridIndividualization(e, "1");
                });
            }
        },

        _selectable:function() {
            var that = this,
                multi,
                cell,
                notString = [],
                isLocked = that._isLocked(),
                selectable = that.options.selectable;

            if (selectable) {

                if (that.selectable) {
                    that.selectable.destroy();
                }

                selectable = kendo.ui.ExtSelectable.parseOptions(selectable);

                multi = selectable.multiple;
                cell = selectable.cell;

                if (that._hasDetails()) {
                    notString[notString.length] = ".k-detail-row";
                }
                if (that.options.groupable || that._hasFooters()) {
                    notString[notString.length] = ".k-grouping-row,.k-group-footer";
                }

                notString = notString.join(",");

                if (notString !== "") {
                    notString = ":not(" + notString + ")";
                }

                var elements = that.table;
                if (isLocked) {
                    elements = elements.add(that.lockedTable);
                }

                var filter = ">" + (cell ? SELECTION_CELL_SELECTOR:"tbody>tr" + notString);

                that.selectable = new kendo.ui.ExtSelectable(elements, {
                    filter:filter,
                    aria:true,
                    multiple:multi,
                    enableDragToSelectRows:that.options.enableDragToSelectRows,
                    change:function(e) {
                        that.trigger(CHANGE);
                    },
                    useAllItems:isLocked && multi && cell,
                    relatedTarget:function(items) {
                        if (cell || !isLocked) {
                            return;
                        }

                        var related;
                        var result = $();
                        for (var idx = 0, length = items.length; idx < length; idx ++) {
                            related = that._relatedRow(items[idx]);

                            if (inArray(related[0], items) < 0) {
                                result = result.add(related);
                            }
                        }

                        return result;
                    },
                    continuousItems:function() {
                        return that._continuousItems(filter, cell);
                    }
                });

                if (that.options.navigatable) {
                    elements.on("keydown" + NS, function(e) {
                        var current = that.current();
                        var target = e.target;
                        if (e.keyCode === keys.SPACEBAR && $.inArray(target, elements) > -1 &&
                            !current.is(".k-edit-cell,.k-header") &&
                            current.parent().is(":not(.k-grouping-row,.k-detail-row,.k-group-footer)")) {
                            e.preventDefault();
                            e.stopPropagation();
                            current = cell ? current:current.parent();

                            if (isLocked && !cell) {
                                current = current.add(that._relatedRow(current));
                            }

                            if(multi) {
                                if(!e.ctrlKey) {
                                    that.selectable.clear();
                                } else {
                                    if(current.hasClass(SELECTED)) {
                                        current.removeClass(SELECTED);
                                        that.trigger(CHANGE);
                                        return;
                                    }
                                }
                            } else {
                                that.selectable.clear();
                            }

                            that.selectable.value(current);
                        }
                    });
                }
            }
        },

        cudDataLength:0,

        getCUDData:function(insertedPropName, updatedPropName, deletedPropName, ignoreProperties){

            var i = insertedPropName? insertedPropName:"_inserted";
            var u = updatedPropName? updatedPropName:"_updated";
            var d = deletedPropName? deletedPropName:"_deleted";

            var o = {};
            o[i] = [];
            o[u] = [];
            o[d] = [];

            var gridDataSource = this.dataSource;

            o[d] = gridDataSource._destroyed;
            $(gridDataSource._flatData(gridDataSource._data)).each(function(idx, value){
                if(this.isNew()){
                    o[i].push(value);
                }else if(this.dirty){
                    o[u].push(value);
                }
            });

            this.cudDataLength = o[i].length + o[u].length +  o[d].length;

            if(ignoreProperties && ignoreProperties.length != 0) {
                $.each(o, function(idx, arr){
                    $.each(arr, function(idx2, dataObj){
                        $.each(ignoreProperties, function(idx2, ignoreProp){
                            delete dataObj[ignoreProp];
                        });
                    });
                });
            }

            return o;
        },

        /**
         * 그리드에 변경된 정보가 있는지 여부를 반환한다.
         */
        isModified:function(){
            this.getCUDData();

            return this.cudDataLength == 0? false:true;
        },

        /**
         * 그리드에 같은 데이터가 존재 하는지 여부를 반환한다.
         */
        exists:function(comparableFunc){
            var dataList = this.dataSource.data();
            var flag = false;
            $.each(dataList, function(idx, obj){
                if(comparableFunc(obj)){
                    flag = true;
                    return false;
                }
            });

            return flag;
        },

        gridValidation:function(){
            var rows = this.tbody.find("tr");
            for (var i = 0; i < rows.length; i++) {
                var model = this.dataItem(rows[i]);

                // 추가/수정된 목록 체크
                if (model && model.id <= 0 && (model.isNew() || model.dirty)) {
                    var cols = $(rows[i]).find("td");
                    for (var j = 0; j < cols.length; j++) {
                        this.editCell($(cols[j]));
                        if(this.editable){
                            if (!this.editable.end()) {
                                return false;
                            }
                            else {
                                this.closeCell();
                            }
                        }
                    }
                }

            }
            return true;
        },

        lookupColumn:function(field) {
            var col;
            $.each(this.columns, function(idx, column){
                if (column.field === field) {
                    col = column;
                    return false;
                }
            });

            return col;
        },

        /**
         * 그리드의 컬럼 헤더 텍스트를 설정한다.
         * @params settings 컬럼명과 컬럼헤더 텍스트를 포함하는 Object
         *         ex) {"fieldName1":"fieldName1Text", "fieldName2":"fieldName2Text", ...}
         */
        setColumnHeaderText:function(headerTextOptions) {
            var that = this;
            if (headerTextOptions) {
                $.each(headerTextOptions, function(fieldName, headerText) {
                    var field = $("#" + that.element.context.id + " th[data-field=" + fieldName + "]");
                    field.data("title", headerText);
                    field.html(headerText);
                });
            }
        }
    });

    ui.plugin(ExtGrid);

})(window.kendo.jQuery);


//ExtMultiSelectDropDownList
(function ($) {

    var kendo = window.kendo,
    ui = kendo.ui,
    Widget = ui.DropDownList,
    CHANGE = "change",
    proxy = $.proxy,
    NS = ".kendoExtMultiSelectDropDownList";

    var ExtMultiSelectDropDownList = Widget.extend({

        init:function (element, options) {
            var that = this;

            options.template = kendo.template(
                kendo.format('<input type="checkbox" name="{0}" value="#= {1} #" />&nbsp;<label for="{0}">#= {2} #</label>',
                    element.id + "_option_" + options.dataValueField,
                    options.dataValueField,
                    options.dataTextField
                )
            );

            options.selectedAllText = options.selectedAllText || "";

            Widget.fn.init.call(that, element, options);

            that.popup.bind('close', function () {
                var values = that.ul.find(":checked")
                            .map(function () { return this.value; })
                            .toArray();

                if (values < that.selectedIndexes || values > that.selectedIndexes) {
                    that._setText();
                    that._setValues();
                    that.trigger(CHANGE);
                }
            });
        },

        options:{
            name:"ExtMultiSelectDropDownList"
            ,selectedAllText:""
        },

        selectedIndexes:[],

        _accessor:function (vals, idx) {
            var that = this;
            if (vals === undefined) {
                return that.selectedIndexes;
            }
        },

        value:function (vals) {
            var that = this;
            if (vals === undefined) {
                return that._accessor();
            } else {
                var checkboxes = that.ul.find("input[type='checkbox']");
                if (vals.length > 0) {

                    var valArray = $(vals)
                        .map(function() { return this + ''; })
                        .toArray();

                    checkboxes.each(function () {
                        this.checked = $.inArray(this.value, valArray) !== -1;
                    });

                    that._setText();
                    that._setValues();
                } else {
                    that.text("");
                    that.selectedIndexes = [];
                    checkboxes.each(function () {
                        this.checked = false;
                    });
                }
            }
        },

        _select:function(li) { },
        _blur:function () { },

        _setText:function () {
            var that = this;
            var text = that.ul.find(":checked")
                .map(function () { return $(this).siblings("label").text(); })
                .toArray();

            if (that.dataSource._total == that.ul.find(":checked").length) {
                if(that.options.selectedAllText == "") {
                    that.text(text.toString().replace(/,/g, ', '));
                } else {
                    that.text(that.options.selectedAllText);
                }
            } else {
                that.text(text.toString().replace(/,/g, ', '));
            }

        },
        _setValues:function () {
            var that = this;
            var values = that.ul.find(":checked")
                .map(function () { return this.value; })
                .toArray();
            that.selectedIndexes = values;
        }

    });

    ui.plugin(ExtMultiSelectDropDownList);

})(window.kendo.jQuery);

//ExtDropDownList
(function ($) {

    var kendo = window.kendo,
    ui = kendo.ui,
    Widget = ui.DropDownList,
    NS = ".kendoExtDropDownList";

    var ExtDropDownList = Widget.extend({

        init:function (element, options) {
            var that = this;

            Widget.fn.init.call(that, element, options);

            if(that.options.stopScroll){
                that._stopScroll(that.ul.parent());
            }
        },

        options:{
            name:"ExtDropDownList"
            ,stopScroll:true
        },

        _stopScroll:function(element){
            var activeElement;

            $(element).bind('mousewheel DOMMouseScroll', function(e) {
                var scrollTo = null;

                if (!$(activeElement).closest(".k-popup").length) {
                  return;
                }

                if (e.type == 'mousewheel') {
                    scrollTo = (e.originalEvent.wheelDelta * -1);
                }
                else if (e.type == 'DOMMouseScroll') {
                    scrollTo = 40 * e.originalEvent.detail;
                }

                if (scrollTo) {
                    e.preventDefault();
                    element.scrollTop(scrollTo + element.scrollTop());
                }
            });

            $(element).on('mouseover', function(e) {
                activeElement = e.target;
            });
        }
    });

    ui.plugin(ExtDropDownList);

})(window.kendo.jQuery);

//ExtMaskedDatePicker
(function ($) {
    var kendo = window.kendo,
        ui = kendo.ui,
        Widget = ui.DatePicker,
        calendar = kendo.calendar,
        isInRange = calendar.isInRange,
        restrictValue = calendar.restrictValue,
        isEqualDatePart = calendar.isEqualDatePart,
        CHANGE = "change",
        OPEN = "open",
        CLOSE = "close",
        proxy = $.proxy,
        NS = ".kendoExtMaskedDatePicker";

    var ExtMaskedDatePicker = Widget.extend({
        init:function (element, options) {
            var that = this,
                $element = $(element);

            that.options.format = that.options.format || "yyyy-MM-dd";
            that.options.parseFormats = that.options.parseFormats || [that.options.format];

            Widget.fn.init.call(this, element, options);

            //팝업위치 적용
            /*
            {
                format:"<dms:configValue code='dateFormat' />"
                 ,popup:{
                     origin:"bottom left"
                     ,position:"bottom left"
                 }
                 ,top:78
            }
            */
            var top = that.options.top || 0;
            var left = that.options.left || 0;
            if(top != 0 || left != 0){
                that.bind(OPEN, function(e){
                    var popupWrapper = $(that.dateView.popup.element);

                    if(top != 0){
                        popupWrapper.css("margin-top", top + "px");
                    }
                    if(left != 0){
                        popupWrapper.css("margin-left", left + "px");
                    }
                });
            }

            $element.kendoMaskedTextBox({
                mask:that.options.format.replace(/[y|m|d|h|s]/gi, "0")
            })
            .add(element)
            .removeClass("k-textbox");

            $element.data("kendoMaskedTextBox").bind("change", function(e){

            	if(dms.string.isEmpty($element.val()) || $element.val() == e.sender._emptyMask){
            		$element.val("");
                    return;
                }

                var d = kendo.parseDate($element.val(), that.options.format);

                if (d == null || !isInRange(d, that.options.min, that.options.max)) {
                    $element.val("");
                    dms.notification.warning(that.options.dateValidMessage);
                }

                that.value(d);
            });
        }
        ,options:{
            name:"ExtMaskedDatePicker"
            ,mask:"0000-00-00"
            ,format:"yyyy-MM-dd"
            ,parseFormats:["yyyy-MM-dd"]
            ,dateValidMessage:dms.settings.defaultMessage.invalidDateFormat
            ,max:new Date(9999, 12, 31)
//            ,top:0
//            ,left:0
        }
        ,events:[
            CHANGE
            ,OPEN
            ,CLOSE
        ]
    });

    ui.plugin(ExtMaskedDatePicker);

})(window.kendo.jQuery);

//ExtMaskedDateTimePicker
//주석처리 2017.06.06 한강석 - 날짜/시간 함께 출력용으로 변경
/*
(function ($) {
    var kendo = window.kendo,
        ui = kendo.ui,
        Widget = ui.DateTimePicker,
        calendar = kendo.calendar,
        parse = kendo.parseDate,
        isInRange = calendar.isInRange,
        restrictValue = calendar.restrictValue,
        isEqualDatePart = calendar.isEqualDatePart,
        CHANGE = "change",
        OPEN = "open",
        CLOSE = "close",
        proxy = $.proxy,
        NS = ".kendoExtMaskedDateTimePicker";
        TimeView = kendo.TimeView,
        DATE = Date,
        MIN = new DATE(1900, 0, 1),
        MAX = new DATE(2099, 11, 31);
        ARIA_ACTIVEDESCENDANT = "aria-activedescendant",
        ARIA_EXPANDED = "aria-expanded",
        ARIA_HIDDEN = "aria-hidden",
        ARIA_OWNS = "aria-owns",
        ARIA_DISABLED = "aria-disabled",
        ARIA_READONLY = "aria-readonly",
        dateViewParams = { view:"date" },
        timeViewParams = { view:"time" },
        extend = $.extend;

    var ExtMaskedDateTimePicker = Widget.extend({
        init:function (element, options) {
            var that = this,
                $element = $(element);

            that.options.format = that.options.format || "yyyy-MM-dd HH:mm:ss";
            that.options.parseFormats = that.options.parseFormats || [that.options.format];

            Widget.fn.init.call(this, element, options);

            $element.kendoMaskedTextBox({
                mask:that.options.format.replace(/[y|m|d|h|s]/gi, "0")
            })
            .add(element)
            .removeClass("k-textbox");

            $element.data("kendoMaskedTextBox").bind("change", function(e){

            	if(dms.string.isEmpty($element.val()) || $element.val() == e.sender._emptyMask){
            		$element.val("");
                    return;
                }

                var d = kendo.parseDate($element.val(), that.options.format);

                if (d == null || !isInRange(d, that.options.min, that.options.max)) {
                    $element.val("");
                    $element.select();
                    dms.notification.warning(that.options.dateValidMessage);
                }

                that.value(d);
            });


        }
        ,options:{
            name:"ExtMaskedDateTimePicker"
            ,mask:"0000-00-00 00:00:00"
            ,format:"yyyy-MM-dd HH:mm:ss"
            ,parseFormats:["yyyy-MM-dd HH:mm:ss"]
            ,dateValidMessage:dms.settings.defaultMessage.invalidDateFormat
            ,minTime:"00:00"
            ,maxTime:"00:00"
            ,max:new Date(9999, 12, 31)
        }
        ,events:[
            CHANGE
            ,OPEN
            ,CLOSE
        ]
        ,_views:function() {
            var that = this,
            element = that.element,
            options = that.options,
            id = element.attr("id"),
            dateView, timeView,
            div, ul, msMin, minTime, maxTime,
            date;

            that.dateView = dateView = new kendo.DateView(extend({}, options, {
                id:id,
                anchor:that.wrapper,
                change:function() {
                    var value = dateView.calendar.value(),
                        msValue = +value,
                        msMin = +options.min,
                        msMax = +options.max,
                        current;

                    if (msValue === msMin || msValue === msMax) {
                        current = new DATE(+that._value);
                        current.setFullYear(value.getFullYear(), value.getMonth(), value.getDate());

                        if (isInRange(current, msMin, msMax)) {
                            value = current;
                        }
                    }

                    that._change(value);
                    that.close("date");
                },
                close:function(e) {
                    if (that.trigger(CLOSE, dateViewParams)) {
                        e.preventDefault();
                    } else {
                        element.attr(ARIA_EXPANDED, false);
                        div.attr(ARIA_HIDDEN, true);

                        if (!timeView.popup.visible()) {
                            element.removeAttr(ARIA_OWNS);
                        }
                    }
                },
                open: function(e) {
                    if (that.trigger(OPEN, dateViewParams)) {
                        e.preventDefault();
                    } else {

                        if (that.element.val() !== that._oldText) {
                            date = parse(element.val(), options.parseFormats, options.culture);

                            that.dateView[date ? "current":"value"](date);
                        }

                        div.attr(ARIA_HIDDEN, false);
                        element.attr(ARIA_EXPANDED, true)
                               .attr(ARIA_OWNS, dateView._dateViewID);

                        that._updateARIA(date);
                    }
                }
            }));
            div = dateView.div;

            //TimeView 시간범위 설정
            minTime = new DATE(MIN);
            maxTime = new DATE(MAX);
            if(options.minTime !== "00:00"){
                minTime.setMinutes(minTime.getMinutes() + that._parseTimeMinutes(options.minTime));
            }
            if(options.maxTime !== "00:00"){
                maxTime.setMinutes(maxTime.getMinutes() + that._parseTimeMinutes(options.maxTime));
            }

            msMin = options.min.getTime();
            that.timeView = timeView = new TimeView({
                id:id,
                value:options.value,
                anchor:that.wrapper,
                animation:options.animation,
                format:options.timeFormat,
                culture:options.culture,
                height:options.height,
                interval:options.interval,
                min:minTime,
                max:maxTime,
                dates:msMin === options.max.getTime() ? [new Date(msMin)]:[],
                parseFormats:options.parseFormats,
                change:function(value, trigger) {
                    value = timeView._parse(value);

                    if (value < options.min) {
                        value = new DATE(+options.min);

                        //TimeView 시간 범위 - 시작시간
                        if(options.minTime !== "00:00"){
                            minTime.setMinutes(minTime.getMinutes() + that._parseTimeMinutes(options.minTime));
                        }

                        timeView.options.min = minTime;
                    } else if (value > options.max) {
                        value = new DATE(+options.max);

                        //TimeView 시간 범위 - 종료시간
                        if(options.maxTime !== "00:00"){
                            maxTime.setMinutes(maxTime.getMinutes() + that._parseTimeMinutes(options.maxTime));
                        }

                        timeView.options.max = maxTime;
                    }

                    if (trigger) {
                        that._timeSelected = true;
                        that._change(value);
                    } else {
                        element.val(kendo.toString(value, options.format, options.culture));
                        dateView.value(value);
                        that._updateARIA(value);
                    }
                },
                close:function(e) {
                    if (that.trigger(CLOSE, timeViewParams)) {
                        e.preventDefault();
                    } else {
                        ul.attr(ARIA_HIDDEN, true);
                        element.attr(ARIA_EXPANDED, false);

                        if (!dateView.popup.visible()) {
                            element.removeAttr(ARIA_OWNS);
                        }
                    }
                },
                open: function(e) {
                    timeView._adjustListWidth();
                    if (that.trigger(OPEN, timeViewParams)) {
                        e.preventDefault();
                    } else {
                        ul.attr(ARIA_HIDDEN, false);
                        element.attr(ARIA_EXPANDED, true)
                               .attr(ARIA_OWNS, timeView._timeViewID);

                        timeView.options.active(timeView.current());
                    }
                },
                active:function(current) {
                    element.removeAttr(ARIA_ACTIVEDESCENDANT);
                    if (current) {
                        element.attr(ARIA_ACTIVEDESCENDANT, timeView._optionID);
                    }
                }
            });
            ul = timeView.ul;
        }
        ,_change:function(value) {
            var that = this;

            if(that.options.minTime !== "00:00" && kendo.toString(value, "HH:mm") === "00:00"){
                value.setMinutes(value.getMinutes() + that._parseTimeMinutes(that.options.minTime));
            }

            value = that._update(value);

            if (+that._old != +value) {
                that._old = value;
                that._oldText = that.element.val();

                that.trigger(CHANGE);

                // trigger the DOM change event so any subscriber gets notified
                that.element.trigger(CHANGE);
            }
        }
        ,_update:function(value) {
            var that = this,
            options = that.options,
            min = options.min,
            max = options.max,
            dates = options.dates,
            timeView = that.timeView,
            minTime = timeView.options.min,
            maxTime = timeView.options.max,
            current = that._value,
            date = parse(value, options.parseFormats, options.culture),
            isSameType = (date === null && current === null) || (date instanceof Date && current instanceof Date),
            rebind, timeViewOptions, old, skip, formattedValue;

            if (+date === +current && isSameType) {
                formattedValue = kendo.toString(date, options.format, options.culture);

                if (formattedValue !== value) {
                    that.element.val(date === null ? value:formattedValue);
                }

                return date;
            }

            if (date !== null && isEqualDatePart(date, min)) {
                date = restrictValue(date, min, max);
            } else if (!isInRange(date, min, max)) {
                date = null;
            }

            that._value = date;
            timeView.value(date);
            that.dateView.value(date);

            if (date) {
                old = that._old;
                timeViewOptions = timeView.options;

                if (dates[0]) {
                    dates = $.grep(dates, function(d) { return isEqualDatePart(date, d); });

                    if (dates[0]) {
                        timeView.dataBind(dates);
                        skip = true;
                    }
                }

                if (!skip) {
                    if (isEqualDatePart(date, min)) {
                        timeViewOptions.min = minTime;
                        timeViewOptions.max = lastTimeOption(options.interval);
                        rebind = true;
                    }

                    if (isEqualDatePart(date, max)) {
                        if (that._midnight) {
                            timeView.dataBind([maxTime]);
                            skip = true;
                        } else {
                            timeViewOptions.max = maxTime;
                            if (!rebind) {
                                timeViewOptions.min = minTime;
                            }
                            rebind = true;
                        }
                    }
                }

                if (!skip && ((!old && rebind) || (old && !isEqualDatePart(old, date)))) {
                    if (!rebind) {
                        timeViewOptions.max = maxTime;
                        timeViewOptions.min = minTime;
                    }

                    timeView.bind();
                }
            }

            that.element.val(date ? kendo.toString(date, options.format, options.culture):value);
            that._updateARIA(date);

            return date;
        }
        ,_parseTimeMinutes:function(stringMinutes){
            var minutes = 0;
            var stringMinuteList = stringMinutes.split(":");

            minutes += parseInt(stringMinuteList[0]) * 60;
            minutes += parseInt(stringMinuteList[1]);

            return minutes;
        }
    });

    ui.plugin(ExtMaskedDateTimePicker);

})(window.kendo.jQuery);
*/

/* ExtMaskedDateTimePicker */
(function($, undefined) {
    var kendo = window.kendo,
    ui = kendo.ui,
    Widget = ui.Widget,
    parse = kendo.parseDate,
    keys = kendo.keys,
    template = kendo.template,
    activeElement = kendo._activeElement,
    extractFormat = kendo._extractFormat,
    support = kendo.support,
    DIV = "<div />",
    SPAN = "<span />",
    ns = ".kendoExtMaskedDateTimePicker",
    CLICK = "click" + ns,
    OPEN = "open",
    CLOSE = "close",
    CHANGE = "change",
    DISABLED = "disabled",
    READONLY = "readonly",
    DEFAULT = "k-state-default",
    FOCUSED = "k-state-focused",
    SELECTED = "k-state-selected",
    STATEDISABLED = "k-state-disabled",
    HOVER = "k-state-hover",
    KEYDOWN = "keydown" + ns,
    HOVEREVENTS = "mouseenter" + ns + " mouseleave" + ns,
    MOUSEDOWN = "mousedown" + ns,
    LI = "li",
    ID = "id",
    MIN = "min",
    MAX = "max",
    DATE = Date,
    MINTIME = new DATE(1900, 0, 1),
    MAXTIME = new DATE(2099, 11, 31);
    MONTH = "month",
    MS_PER_MINUTE = 60000,
    MS_PER_DAY = 86400000,
    ARIA_SELECTED = "aria-selected",
    ARIA_DISABLED = "aria-disabled",
    ARIA_EXPANDED = "aria-expanded",
    ARIA_HIDDEN = "aria-hidden",
    ARIA_READONLY = "aria-readonly",
    calendar = kendo.calendar,
    isInRange = calendar.isInRange,
    restrictValue = calendar.restrictValue,
    isEqualDatePart = calendar.isEqualDatePart,
    extend = $.extend,
    proxy = $.proxy,
    TODAY = new DATE();
    TODAY = new DATE(TODAY.getFullYear(), TODAY.getMonth(), TODAY.getDate(), 0, 0, 0);

    function normalize(options) {
        var parseFormats = options.parseFormats,
            parseTimeFormats = options.parseFormats,
            patterns = kendo.getCulture(options.culture).calendars.standard.patterns,
            format = options.format;

        calendar.normalize(options);

        options.timeFormat = timeFormat = extractFormat(options.timeFormat || patterns.t);

        parseFormats = $.isArray(parseFormats) ? parseFormats:[parseFormats];
        if ($.inArray(format, parseFormats) === -1) {
            parseFormats.splice(0, 0, options.format);
        }

        parseTimeFormats = $.isArray(parseTimeFormats) ? parseTimeFormats:[parseTimeFormats];
        parseTimeFormats.splice(0, 0, options.timeFormat);

        options.parseFormats = parseFormats;
        options.parseTimeFormats = parseTimeFormats;
    }

    function preventDefault(e) {
        e.preventDefault();
    }

    var ExtDateTimeView = function(options) {
        var that = this, id,
            body = document.body,
            div = $(DIV).css({"width":"295px","padding":"1px solid #00ff00", "padding":"3px 3px 0 3px", "background-color":"#ffffff"})
                      .appendTo(body),
            divTime = $(DIV).addClass("time-container")
                         .css({"width":"88px","position":"absolute","right":"3px","height":"218px","overflow":"auto","border":"1px solid rgb(238,238,238)"})
                         .appendTo(div)
                         .on(MOUSEDOWN, preventDefault),
            divDate = $(DIV).attr(ARIA_HIDDEN, "true")
                        .addClass("k-calendar-container")
                        .appendTo(div);

        that.options = options = options || {};
        id = options.id;

        that.ul = $('<ul tabindex="-1" role="listbox" aria-hidden="false" unselectable="on" class="k-list k-reset"/>')
                    .css({ overflow:support.kineticScrollNeeded ? "":"auto" })
                    .on(CLICK, LI, proxy(that._clickLi, that))
                    .on("mouseenter" + ns, LI, function() { $(this).addClass(HOVER); })
                    .on("mouseleave" + ns, LI, function() { $(this).removeClass(HOVER); });

        that.template = kendo.template('<li tabindex="-1" role="option" class="k-item" unselectable="on" data-idx="#=data.idx#">#=data.timeValue#</li>', { useWithBlock:false });

        if (id) {
            id += "_datetimeview";

            div.attr(ID, id);
            that._dateTimeViewID = id;
        }

        that.popup = new ui.Popup(div, extend(options.popup, options, { name:"Popup", isRtl:kendo.support.isRtl(options.anchor) }));
        that.divDate = divDate;
        that.divTime = divTime;
        that.div = div;

        that.divTime.append(that.ul);

        that.value(options.value);
    };

    ExtDateTimeView.prototype = {
        _calendar:function() {
//          console.log("ExtDateTimeView _calendar");
            var that = this;
            var calendar = that.calendar;
            var options = that.options;
            var div;

            if (!calendar) {
                div = $(DIV).attr(ID, kendo.guid())
                            .appendTo(that.divDate)
                            .on(MOUSEDOWN, preventDefault)
                            .on(CLICK, "td:has(.k-link)", proxy(that._click, that));

                that.calendar = calendar = new ui.Calendar(div);
                that._setOptions(options);

                kendo.calendar.makeUnselectable(calendar.element);

                calendar.navigate(that._value || that._current, options.start);

                that.value(that._value);
            }
        }

        ,_setOptions:function(options) {
//             console.log("ExtDateTimeView _setOptions");
            this.calendar.setOptions({
                focusOnNav:false
                ,change:options.change
                ,culture:options.culture
                ,dates:options.dates
                ,depth:options.depth
                ,footer:options.footer
                ,format:options.format
                ,max:options.max
                ,min:options.min
                ,month:options.month
                ,start:options.start
            });
        }

        ,setOptions:function(options) {
//             console.log("ExtDateTimeView setOptions");
            var old = this.options;

            this.options = extend(old, options, {
                change:old.change
                ,close:old.close
                ,open:old.open
            });

            if (this.calendar) {
                this._setOptions(this.options);
            }
        }

        ,destroy:function() {
//             console.log("ExtDateTimeView destroy");
            this.popup.destroy();
        }

        ,open:function() {
//             console.log("ExtDateTimeView open");
            var that = this;

            that._calendar();

            //추가
            if (!that.ul[0].firstChild && !that._currentLi) {
                that.bind();
            }

            that.popup.open();
        }

        ,select:function(li) {
//             console.log("ExtDateTimeView select");
            var that = this,
                options = that.options,
                current = that._currentLi;

            if (li instanceof Date) {
                li = kendo.toString(li, options.format, options.culture);
            }

            if (typeof li === "string") {
                if (!current || current.text() !== li) {
                    li = $.grep(that.ul[0].childNodes, function(node) {
                        return (node.textContent || node.innerText) == li;
                    });

                    li = li[0] ? li:null;
                } else {
                    li = current;
                }
            }

            that.currentLi(li);
        }

        ,refresh:function() {
//             console.log("ExtDateTimeView refresh");
            var that = this,
                options = that.options,
                format = options.timeFormat,
                offset = dst(),
                ignoreDST = offset < 0,
                min = options.minTime,
                max = options.maxTime,
                msMin = getMilliseconds(min),
                msMax = getMilliseconds(max),
                msInterval = options.interval * MS_PER_MINUTE,
                toString = kendo.toString,
                template = that.template,
                start = new DATE(+min),
                startDay = start.getDate(),
                msStart, lastIdx,
                idx = 0, length,
                html = "";

            if (ignoreDST) {
                length = (MS_PER_DAY + (offset * MS_PER_MINUTE)) / msInterval;
            } else {
                length = MS_PER_DAY / msInterval;
            }


            if (msMin != msMax) {
                if (msMin > msMax) {
                    msMax += MS_PER_DAY;
                }

                length = ((msMax - msMin) / msInterval) + 1;
            }

            lastIdx = parseInt(length, 10);

            for (; idx < length; idx++) {
                if (idx) {
                    setTime(start, msInterval, ignoreDST);
                }

                if (msMax && lastIdx == idx) {
                    msStart = getMilliseconds(start);
                    if (startDay < start.getDate()) {
                        msStart += MS_PER_DAY;
                    }

                    if (msStart > msMax) {
                        start = new DATE(+max);
                    }
                }

                html += template({"idx":idx, "timeValue":toString(start, format, options.culture)});
            }

            that._html(html);
        }

        //추가
        ,bind:function() {
//             console.log("ExtDateTimeView bind");
            var that = this,
                dates = that.options.dates;

//             if (dates && dates[0]) {
//                 that.dataBind(dates);
//             } else {
                that.refresh();
//             }
        }

        //추가
        ,dataBind:function(dates) {
//             console.log("ExtDateTimeView dataBind");
            var that = this,
                options = that.options,
                format = options.format,
                toString = kendo.toString,
                template = that.template,
                length = dates.length,
                idx = 0,
                date,
                html = "";

            for (; idx < length; idx++) {
                date = dates[idx];

                if (isInRange(date, options.min, options.max)) {
                    html += template({"idx":idx, "timeValue":toString(date, format, options.culture)});
                }
            }

            that._html(html);
        }

        //추가
        ,_html:function(html) {
//             console.log("ExtDateTimeView _html");
            var that = this,
                options = that.options;

            that.ul[0].innerHTML = html;

           if(that._value && !that._currentLi){

                timeValue = kendo.toString(that._intervalDate(that._value), options.parseTimeFormats[0], options.culture);
                li = $("li:contains('"+timeValue+"')" , that.ul);

                that.select(li);
                //that.options.changeTime(li.text(), true);
           }
        }

        ,scroll:function(item) {
//             console.log("ExtDateTimeView scroll");
            if (!item) {
                return;
            }

            var ul = this.ul[0],
                itemOffsetTop = item.offsetTop,
                itemOffsetHeight = item.offsetHeight,
                ulScrollTop = ul.scrollTop,
                ulOffsetHeight = ul.clientHeight,
                bottomDistance = itemOffsetTop + itemOffsetHeight,
                touchScroller = this._touchScroller,
                elementHeight;

            if (touchScroller) {
                elementHeight = this.list.height();

                if (itemOffsetTop > elementHeight) {
                    itemOffsetTop = itemOffsetTop - elementHeight + itemOffsetHeight;
                }

                touchScroller.scrollTo(0, -itemOffsetTop);
            } else {
                ul.scrollTop = ulScrollTop > itemOffsetTop ?
                               itemOffsetTop:bottomDistance > (ulScrollTop + ulOffsetHeight) ?
                               bottomDistance - ulOffsetHeight:ulScrollTop;
            }
        }

        ,close:function() {
//             console.log("ExtDateTimeView close");
            this.popup.close();
        }

        ,min:function(value) {
//             console.log("ExtDateTimeView min");
            this._option(MIN, value);
        }

        ,max:function(value) {
//             console.log("ExtDateTimeView max");
            this._option(MAX, value);
        }

        ,toggle:function() {
//             console.log("ExtDateTimeView toggle");
            var that = this;

            that[that.popup.visible() ? CLOSE:OPEN]();
        }

        ,move:function(e) {
//             console.log("ExtDateTimeView move");
            var that = this,
                key = e.keyCode,
                calendar = that.calendar,
                selectIsClicked = e.ctrlKey && key == keys.DOWN || key == keys.ENTER;

            if (key == keys.ESC) {
                that.close();
                return;
            }

            if (e.altKey) {
                if (key == keys.DOWN) {
                    that.open();
                    e.preventDefault();
                } else if (key == keys.UP) {
                    that.close();
                    e.preventDefault();
                }
                return;
            }

            if (!that.popup.visible()){
                return;
            }

            if (selectIsClicked && calendar._cell.hasClass(SELECTED)) {
                that.close();
                e.preventDefault();
                return;
            }

            that._current = calendar._move(e);
        }

        ,current:function(date) {
//             console.log("ExtDateTimeView current");
            this._current = date;
            this.calendar._focus(date);
        }

        ,currentLi:function(candidate) {
//             console.log("ExtDateTimeView currentLi");
            var that = this,
                active = that.options.active;

            if (candidate !== undefined) {
                if (that._currentLi) {
                    that._currentLi
                        .removeClass(SELECTED)
                        .removeAttr(ARIA_SELECTED)
                        .removeAttr(ID);
                }

                if (candidate) {
                    candidate = $(candidate).addClass(SELECTED)
                                            .attr(ID, that._optionID)
                                            .attr(ARIA_SELECTED, true);

                    that.scroll(candidate[0]);
                }

                that._currentLi = candidate;

                if (active) {
                    active(candidate);
                }
            } else {
                return that._currentLi;
            }
        }

        ,value:function(value) {
//             console.log("ExtDateTimeView value");
            var that = this,
                calendar = that.calendar,
                options = that.options;

            that._value = value;
            that._current = new DATE(+restrictValue(value, options.min, options.max));


            if (calendar) {
                calendar.value(value);
            }
        }

        ,_click:function(e) {
//             console.log("ExtDateTimeView _click");
            if (e.currentTarget.className.indexOf(SELECTED) !== -1) {
                this.close();
            }
        }

        ,_clickLi:function(e) {
//          console.log("ExtDateTimeView _clickLi");
            var that = this,
                li = $(e.currentTarget);

            if (!e.isDefaultPrevented()) {
                that.select(li);
                that.options.changeTime(li.text(), true);
                that.close();
            }
        }

        ,_option:function(option, value) {
//             console.log("ExtDateTimeView _option");
            var that = this;
            var calendar = that.calendar;

            that.options[option] = value;

            if (calendar) {
                calendar[option](value);
            }
        }

        ,_parse:function(value) {
//             console.log("ExtDateTimeView _parse");
            var that = this,
                options = that.options,
                current = that._value || TODAY;

            if (value instanceof DATE) {
                return value;
            }

            value = parse(value, options.parseTimeFormats, options.culture);

            if (value) {
                value = new DATE(
                            current.getFullYear()
                            ,current.getMonth()
                            ,current.getDate()
                            ,value.getHours()
                            ,value.getMinutes()
                            ,value.getSeconds()
                            ,value.getMilliseconds()
                        );
            }

            return value;
        }

        ,_intervalDate:function(date){
            var that = this,
                options = that.options,
                minutes,
                mod;

            if(date == null){
                return date;
            }

            minutes = date.getMinutes(),
            mod = minutes % options.interval;

            if(mod == 0){
                return date;
            }

            return new DATE(
                date.getFullYear()
                ,date.getMonth()
                ,date.getDate()
                ,date.getHours()
                ,date.getMinutes() - mod
                ,date.getSeconds()
                ,date.getMilliseconds()
            );
        }
    };

    function setTime(date, time, ignoreDST) {
        var offset = date.getTimezoneOffset(),
            offsetDiff;

        date.setTime(date.getTime() + time);

        if (!ignoreDST) {
            offsetDiff = date.getTimezoneOffset() - offset;
            date.setTime(date.getTime() + offsetDiff * MS_PER_MINUTE);
        }
    }

    function dst() {
        var today = new DATE(),
            midnight = new DATE(today.getFullYear(), today.getMonth(), today.getDate(), 0, 0, 0),
            noon = new DATE(today.getFullYear(), today.getMonth(), today.getDate(), 12, 0, 0);

        return -1 * (midnight.getTimezoneOffset() - noon.getTimezoneOffset());
    }

    function getMilliseconds(date) {
        return date.getHours() * 60 * MS_PER_MINUTE + date.getMinutes() * MS_PER_MINUTE + date.getSeconds() * 1000 + date.getMilliseconds();
    }

    function isInRange(value, min, max) {
        var msMin = getMilliseconds(min),
            msMax = getMilliseconds(max),
            msValue;

        if (!value || msMin == msMax) {
            return true;
        }

        msValue = getMilliseconds(value);

        if (msMin > msValue) {
            msValue += MS_PER_DAY;
        }

        if (msMax < msMin) {
            msMax += MS_PER_DAY;
        }

        return msValue >= msMin && msValue <= msMax;
    }

    ExtDateTimeView.getMilliseconds = getMilliseconds;
    ExtDateTimeView.normalize = normalize;
    kendo.ExtDateTimeView = ExtDateTimeView;

    var ExtMaskedDateTimePicker = Widget.extend({
        init:function(element, options) {
            var that = this,
                disabled,
                div,
                $element = $(element);

            that.options.format = that.options.format || "yyyy-MM-dd HH:mm:ss";
            that.options.parseFormats = that.options.parseFormats || [that.options.format];

            Widget.fn.init.call(that, element, options);

            $element.kendoMaskedTextBox({
                mask:that.options.format.replace(/[y|m|d|h|s]/gi, "0")
            })
            .add(element)
            .removeClass("k-textbox");

            $element.data("kendoMaskedTextBox").bind("change", function(e){
                if(dms.string.isEmpty($element.val()) || $element.val() == e.sender._emptyMask){
                    $element.val("");
                    return;
                }

                var d = kendo.parseDate($element.val(), that.options.format);

                if (d == null || !isInRange(d, that.options.min, that.options.max)) {
                    $element.val("");
                    $element.select();
                    dms.notification.warning(that.options.dateValidMessage);
                }

                that.value(d);
            });

            element = that.element;
            options = that.options;

            options.min = parse(element.attr("min")) || parse(options.min);
            options.max = parse(element.attr("max")) || parse(options.max);

            normalize(options);

            that._wrapper();

            //TimeView 시간범위 설정
            minTime = new DATE(MINTIME);
            maxTime = new DATE(MAXTIME);
            if(options.minTime !== "00:00"){
                minTime.setMinutes(minTime.getMinutes() + that._parseTimeMinutes(options.minTime));
            }
            if(options.maxTime !== "00:00"){
                maxTime.setMinutes(maxTime.getMinutes() + that._parseTimeMinutes(options.maxTime));
            }

            that.extDateTimeView = new ExtDateTimeView(extend({}, options, {
                id:element.attr(ID)
                ,anchor:that.wrapper
                ,minTime:minTime
                ,maxTime:maxTime
                ,change:function() {
                    that._change(this.value());
                }
                ,changeTime:function(value, trigger) {
                    value = that.extDateTimeView._parse(value);

                    if (value < options.min) {
                        value = new DATE(+options.min);
                    } else if (value > options.max) {
                        value = new DATE(+options.max);
                    }

                    if (trigger) {
                        that._timeSelected = true;
                        that._change(value);
                        that.close();
                    } else {
                        element.val(kendo.toString(value, options.format, options.culture));
                    }
                }
                ,close:function(e) {
                    if (that.trigger(CLOSE)) {
                        e.preventDefault();
                    } else {
                        element.attr(ARIA_EXPANDED, false);
                        div.attr(ARIA_HIDDEN, true);
                    }
                }
                ,open:function(e) {
                    var options = that.options,
                        date;

                    if (that.trigger(OPEN)) {
                        e.preventDefault();
                    } else {
                        if (that.element.val() !== that._oldText) {
                            date = parse(element.val(), options.parseFormats, options.culture);

                            that.extDateTimeView[date ? "current":"value"](date);
                        }

                        element.attr(ARIA_EXPANDED, true);
                        div.attr(ARIA_HIDDEN, false);

                        that._updateARIA(date);

                    }
                }
            }));
            div = that.extDateTimeView.div;

            that._icon();

            try {
                element[0].setAttribute("type", "text");
            } catch(e) {
                element[0].type = "text";
            }

            element
                .addClass("k-input")
                .attr({
                    role:"combobox",
                    "aria-expanded":false,
                    "aria-owns":that.extDateTimeView._dateTimeViewID
                });

            that._reset();
            that._template();

            disabled = element.is("[disabled]");
            if (disabled) {
                that.enable(false);
            } else {
                that.readonly(element.is("[readonly]"));
            }

            that._old = that._update(options.value || that.element.val());
            that._oldText = element.val();

            kendo.notify(that);
        }
        ,events:[
             OPEN
             ,CLOSE
             ,CHANGE
        ]
        ,options:{
            name:"ExtMaskedDateTimePicker"
            ,mask:"0000-00-00 00:00:00"
            ,format:"yyyy-MM-dd HH:mm:ss"
            ,value:null
            ,footer:""
            ,format:""
            ,culture:""
            ,parseFormats:["yyyy-MM-dd HH:mm:ss"]
            ,dateValidMessage:dms.settings.defaultMessage.invalidDateFormat
            ,min:new Date(1900, 0, 1)
            ,max:new Date(9999, 12, 31)
            ,minTime:"00:00"
            ,maxTime:"00:00"
            ,start:MONTH
            ,depth:MONTH
            ,animation:{}
            ,month:{}
            ,dates:[]
            ,interval:30
            ,ARIATemplate:'Current focused date is #=kendo.toString(data.current, "D")#'
        }

        ,setOptions:function(options) {
//             console.log("ExtMaskedDateTimePicker setOptions");
            var that = this;
            var value = that._value;

            Widget.fn.setOptions.call(that, options);

            options = that.options;

            options.min = parse(options.min);
            options.max = parse(options.max);

            normalize(options);

            that.extDateTimeView.setOptions(options);

            if (value) {
                that.element.val(kendo.toString(value, options.format, options.culture));
                that._updateARIA(value);
            }
        }

        ,_editable:function(options) {
//             console.log("ExtMaskedDateTimePicker _editable");
            var that = this,
                icon = that._dateIcon.off(ns),
                element = that.element.off(ns),
                wrapper = that._inputWrapper.off(ns),
                readonly = options.readonly,
                disable = options.disable;

            if (!readonly && !disable) {
                wrapper
                    .addClass(DEFAULT)
                    .removeClass(STATEDISABLED)
                    .on(HOVEREVENTS, that._toggleHover);

                element.removeAttr(DISABLED)
                       .removeAttr(READONLY)
                       .attr(ARIA_DISABLED, false)
                       .attr(ARIA_READONLY, false)
                       .on("keydown" + ns, proxy(that._keydown, that))
                       .on("focusout" + ns, proxy(that._blur, that))
                       .on("focus" + ns, function() {
                           that._inputWrapper.addClass(FOCUSED);
                       });

               icon.on(CLICK, proxy(that._click, that))
                   .on(MOUSEDOWN, preventDefault);
            } else {
                wrapper
                    .addClass(disable ? STATEDISABLED:DEFAULT)
                    .removeClass(disable ? DEFAULT:STATEDISABLED);

                element.attr(DISABLED, disable)
                       .attr(READONLY, readonly)
                       .attr(ARIA_DISABLED, disable)
                       .attr(ARIA_READONLY, readonly);
            }
        }

        ,readonly:function(readonly) {
//             console.log("ExtMaskedDateTimePicker readonly");
            this._editable({
                readonly:readonly === undefined ? true:readonly
                ,disable:false
            });
        }

        ,enable:function(enable) {
//             console.log("ExtMaskedDateTimePicker enable");
            this._editable({
                readonly:false
                ,disable:!(enable = enable === undefined ? true:enable)
            });
        }

        ,destroy:function() {
//             console.log("ExtMaskedDateTimePicker destroy");
            var that = this;

            Widget.fn.destroy.call(that);

            that.extDateTimeView.destroy();

            that.element.off(ns);
            that._dateIcon.off(ns);
            that._inputWrapper.off(ns);

            if (that._form) {
                that._form.off("reset", that._resetHandler);
            }
        }

        ,open:function() {
//             console.log("ExtMaskedDateTimePicker open");
            this.extDateTimeView.open();
        }

        ,close:function() {
//             console.log("ExtMaskedDateTimePicker close");
            this.extDateTimeView.close();
        }

        ,min:function(value) {
//             console.log("ExtMaskedDateTimePicker min");
            return this._option(MIN, value);
        }

        ,max:function(value) {
//             console.log("ExtMaskedDateTimePicker max");
            return this._option(MAX, value);
        }

        ,value:function(value) {
//             console.log("ExtMaskedDateTimePicker value");
            var that = this;

            if (value === undefined) {
                return that._value;
            }

            that._old = that._update(value);

            if (that._old === null) {
                that.element.val("");
                that.extDateTimeView.currentLi(null);
            }

            that._oldText = that.element.val();
        }

        ,_toggleHover:function(e) {
//             console.log("ExtMaskedDateTimePicker _toggleHover");
            $(e.currentTarget).toggleClass(HOVER, e.type === "mouseenter");
        }

        ,_blur:function() {
//             console.log("ExtMaskedDateTimePicker _blur");
            var that = this,
                value = that.element.val();

            that.close();
            if (value !== that._oldText) {
                that._change(value);
            }

            that._inputWrapper.removeClass(FOCUSED);
        }

        ,_click:function() {
//             console.log("ExtMaskedDateTimePicker _click");
            var that = this,
                element = that.element;

            that.extDateTimeView.toggle();

            if (!kendo.support.touch && element[0] !== activeElement()) {
                element.focus();
            }
        }

        ,_change:function(value) {
//             console.log("ExtMaskedDateTimePicker _change");
            var that = this;

             if(that.options.minTime !== "00:00" && kendo.toString(value, "HH:mm") === "00:00"){
                 value.setMinutes(value.getMinutes() + that._parseTimeMinutes(that.options.minTime));
             }


            value = that._update(value);

            if (+that._old != +value) {
                that._old = value;
                that._oldText = that.element.val();

                // trigger the DOM change event so any subscriber gets notified
                that.element.trigger(CHANGE);

                that.trigger(CHANGE);
            }
        }

        ,_keydown:function(e) {
//             console.log("ExtMaskedDateTimePicker _keydown");
            var that = this,
                extDateTimeView = that.extDateTimeView,
                value = that.element.val();

            if (!extDateTimeView.popup.visible() && e.keyCode == keys.ENTER && value !== that._oldText) {
                that._change(value);
            } else {
                extDateTimeView.move(e);
                that._updateARIA(extDateTimeView._current);
            }
        }

        ,_icon:function() {
//             console.log("ExtMaskedDateTimePicker _icon");
            var that = this,
                element = that.element,
                icon;

            icon = element.next("span.k-select");

            if (!icon[0]) {
                icon = $('<span unselectable="on" class="k-select"><span unselectable="on" class="k-icon k-i-calendar">select</span></span>').insertAfter(element);
            }

            that._dateIcon = icon.attr({
                "role":"button"
                ,"aria-controls":that.extDateTimeView._dateTimeViewID
            });
        }

        ,_option:function(option, value) {
//             console.log("ExtMaskedDateTimePicker _option");
            var that = this,
                options = that.options;

            if (value === undefined) {
                return options[option];
            }

            value = parse(value, options.parseFormats, options.culture);

            if (!value) {
                return;
            }

            options[option] = new DATE(+value);
            that.extDateTimeView[option](value);
        }

        ,_update:function(value) {
//             console.log("ExtMaskedDateTimePicker _update");
            var that = this,
                options = that.options,
                min = options.min,
                max = options.max,
                current = that._value,
                date = parse(value, options.parseFormats, options.culture),
                isSameType = (date === null && current === null) || (date instanceof Date && current instanceof Date),
                formattedValue,
                timeValue,
                li;

            if (+date === +current && isSameType) {
                formattedValue = kendo.toString(date, options.format, options.culture);

                if (formattedValue !== value) {
                    that.element.val(date === null ? value:formattedValue);
                }

                return date;
            }

            if (date !== null && isEqualDatePart(date, min)) {
                date = restrictValue(date, min, max);
            } else if (!isInRange(date, min, max)) {
                date = null;
            }


            that._value = date;
            that.extDateTimeView.value(date);
            that.element.val(date ? kendo.toString(date, options.format, options.culture):value);
            that._updateARIA(date);

            if(that.extDateTimeView.ul[0].firstChild){
                timeValue = kendo.toString(that.extDateTimeView._intervalDate(date), options.parseTimeFormats[0], options.culture);
                li = $("li:contains('"+timeValue+"')" , that.extDateTimeView.ul);

                if(li.length > 0){
                    that.extDateTimeView.select(li);
//                     that.extDateTimeView.options.changeTime(li.text(), true);
                }
            }else{
                $("li."+SELECTED, that.extDateTimeView.ul)
                .removeClass(SELECTED)
                .removeAttr(ARIA_SELECTED)
                .removeAttr(ID);
            }

            return date;
        }

        ,_wrapper:function() {
//             console.log("ExtMaskedDateTimePicker _wrapper");
            var that = this,
                element = that.element,
                wrapper;

            wrapper = element.parents(".k-datepicker");

            if (!wrapper[0]) {
                wrapper = element.wrap(SPAN).parent().addClass("k-picker-wrap k-state-default");
                wrapper = wrapper.wrap(SPAN).parent();
            }

            wrapper[0].style.cssText = element[0].style.cssText;
            element.css({
                width:"100%",
                height:element[0].style.height
            });

            that.wrapper = wrapper.addClass("k-widget k-datepicker k-header")
                                  .addClass(element[0].className);

            that._inputWrapper = $(wrapper[0].firstChild);
        }

        ,_reset:function() {
//             console.log("ExtMaskedDateTimePicker _reset");
            var that = this,
                element = that.element,
                formId = element.attr("form"),
                form = formId ? $("#" + formId):element.closest("form");

            if (form[0]) {
                that._resetHandler = function() {
                    that.value(element[0].defaultValue);
                };

                that._form = form.on("reset", that._resetHandler);
            }
        }

        ,_template:function() {
//             console.log("ExtMaskedDateTimePicker _template");
            this._ariaTemplate = template(this.options.ARIATemplate);
        }

        ,_updateARIA:function(date) {
//             console.log("ExtMaskedDateTimePicker _updateARIA");
            var cell;
            var that = this;
            var calendar = that.extDateTimeView.calendar;

            that.element.removeAttr("aria-activedescendant");

            if (calendar) {
                cell = calendar._cell;
                cell.attr("aria-label", that._ariaTemplate({ current:date || calendar.current() }));

                that.element.attr("aria-activedescendant", cell.attr("id"));
            }
        }

        ,_parseTimeMinutes:function(stringMinutes){
            var minutes = 0;
            var stringMinuteList = stringMinutes.split(":");

            minutes += parseInt(stringMinuteList[0]) * 60;
            minutes += parseInt(stringMinuteList[1]);

            return minutes;
        }
    });

    ui.plugin(ExtMaskedDateTimePicker);

})(window.kendo.jQuery);

//ExtValidator
(function ($) {
    var kendo = window.kendo,
        ui = kendo.ui,
        Widget = ui.Validator,
        CHANGE = "change",
        VALIDATE = "validate",
        NS = ".kendoExtValidator";

    var ExtValidator = Widget.extend({
        init:function (element, options) {
            var that = this;

            Widget.fn.init.call(this, element, options);

            that.bind(VALIDATE, function(e){

                var html = "";
                if (!e.valid) {
                    var errors = this.errors();

                    html += "<ul>";

                    $.each(errors, function(idx, error){
                        html += "<li>" + error + "</li>";
                    });

                    html += "</ul>";

                    dms.notification.warning(html);
                }
            });
        }
        ,options:{
            name:"ExtValidator"
            ,errorTemplate:''
            ,rules:{
                radio:function(input) {
                    var that = this;
                    if(input.filter("[type=radio]").length > 0 && input.attr("required")) {
                        return $(that.element).find("[name=" + input.attr("name") + "]").is(":checked");
                    }
                    return true;
                }
            }
            ,messages:{
                required:dms.settings.validationMessage.required
                ,pattern:dms.settings.validationMessage.pattern
                ,min:dms.settings.validationMessage.min
                ,max:dms.settings.validationMessage.max
                ,step:dms.settings.validationMessage.step
                ,email:dms.settings.validationMessage.email
                ,url:dms.settings.validationMessage.url
                ,date:dms.settings.validationMessage.date
                ,radio:dms.settings.validationMessage.select
            }
            ,events:[
                CHANGE
                ,VALIDATE
            ]
        }
        ,_extractMessage:function(input, ruleKey) {
            var that = this,
            customMessage = that.options.messages[ruleKey],
            fieldName = input.data("name") || input.attr("name");

            customMessage = kendo.isFunction(customMessage) ? customMessage(input):customMessage;
            return kendo.format(input.attr(kendo.attr(ruleKey + "-msg")) || input.attr("validationMessage") || input.attr("title") || customMessage || "", fieldName, input.attr(ruleKey));
        }
    });

    ui.plugin(ExtValidator);

})(window.kendo.jQuery);

//ExtTabStrip
(function ($) {

    var kendo = window.kendo,
    ui = kendo.ui,
    Widget = ui.TabStrip,
    ACTIVATE = "activate",
    proxy = $.proxy,
    NS = ".kendoExtTabStrip";

    var ExtTabStrip = Widget.extend({

        init:function (element, options) {
        	var that = this;

        	that.options.scrollWidth = that.options.scrollWidth || 20;

            Widget.fn.init.call(that, element, options);

            //탭 목록 스크롤 적용
            if(that.options.displayScrollButton === true){
            	that._initScrollButton();
            }

            //탭 이동시 스크롤 위치 재조정
            that._resetScroll();
        }
        ,tabsWidth:0
        ,scrollButtonWrapper:null
        ,scrollLeft:0
        ,scrollTimer:null
        ,prevContentElementHeight:0
        ,options:{
            name:"ExtTabStrip"
            ,displayScrollButton:false
            ,scrollWidth:20
        }
        ,_resetScroll:function(){
            var that = this;
            that.bind(ACTIVATE, function(e){
                var contentElementHeight = $(e.contentElement).height();
                var scrollTop = $(window).scrollTop();
                var windowHeight = $(window).height();
                var documentHeight = $(document).height();
                var maxScrollTop = documentHeight>windowHeight? documentHeight-windowHeight:0;

                if(that.prevContentElementHeight != 0){
                    var offsetHeight = that.prevContentElementHeight - contentElementHeight;
                    if(scrollTop > 0 && scrollTop >= maxScrollTop){
                        window.scroll($(window).scrollLeft(), maxScrollTop-offsetHeight+(offsetHeight>=0? -10:10));
                    }
                }

                that.prevContentElementHeight = contentElementHeight;

                /*
                var contentElementHeight = $(e.contentElement).height();

                if(that.prevContentElementHeight != 0){
                    var offsetHeight = that.prevContentElementHeight - contentElementHeight;
                    var scrollTop = $(window).scrollTop();

                    if(offsetHeight > 0 && scrollTop > offsetHeight){
                        window.scroll($(window).scrollLeft(), scrollTop-(offsetHeight-10));
                    }
                }

                that.prevContentElementHeight = contentElementHeight;
                */
            });
        }
        ,_initScrollButton:function(){
        	var that = this;
        	var element = $(that.element);

        	that.scrollButtonWrapper = element.closest(".k-tabstrip-wrapper").siblings(".scrollbutton-wrapper");

        	if(that.scrollButtonWrapper.length != 0){
        	    return;
        	}

        	element.css({"overflow":"hidden"});

        	$("ul.k-tabstrip-items li", element).each(function(idx, elem){
        		that.tabsWidth += $(elem).width();
        	});

        	$("ul.k-tabstrip-items", element).css({"overflow-x":"hidden", "overflow-y":"hidden", "height":"26px", "margin-left":"0px"});

        	var scrollButtonWrapper = $("<div/>");
        	scrollButtonWrapper.addClass("scrollbutton-wrapper");

        	var scrollButtonLeft = $("<div/>");
        	scrollButtonLeft.addClass("scrollbutton-left");
        	scrollButtonLeft.bind("mousedown", function(){
        		that._scrollTo("R");

        		that.scrollTimer = window.setInterval(function(){
        			that._scrollTo("R");
        		}, 100);
        	});
        	scrollButtonLeft.bind("mouseup", function(){
        		if(that.scrollTimer != null){
        			window.clearInterval(that.scrollTimer);
        			that.scrollTimer = null;
        		}
        	});

        	var scrollButtonRight = $("<div/>");
        	scrollButtonRight.addClass("scrollbutton-right");
        	scrollButtonRight.bind("mousedown", function(){
        		that._scrollTo("L");

        		that.scrollTimer = window.setInterval(function(){
        			that._scrollTo("L");
        		}, 100);
        	});
        	scrollButtonRight.bind("mouseup", function(){
        		if(that.scrollTimer != null){
        			window.clearInterval(that.scrollTimer);
        			that.scrollTimer = null;
        		}
        	});

        	scrollButtonWrapper.append(scrollButtonLeft);
        	scrollButtonWrapper.append(scrollButtonRight);

        	that.scrollButtonWrapper = scrollButtonWrapper;
        	that._toggleScrollButton();

        	element.closest(".k-tabstrip-wrapper").before(scrollButtonWrapper);

        	$(window).resize(function(){
        		that._toggleScrollButton();
        	});
        }
        ,_toggleScrollButton:function(){
        	var that = this;
        	var element = $(that.element);

        	if(element.width() > that.tabsWidth){
        		that.scrollButtonWrapper.hide();
        	}else{
        		that.scrollButtonWrapper.show();
        	}
        }
        ,_scrollTo:function(direction){
        	var that = this;
        	var element = $(that.element);
        	var offset = that.tabsWidth - element.width() + 50;

        	if(offset <= 0){
        		that.scrollLeft = 0;
        	}else{
        		if(direction == "L"){
        			that.scrollLeft -= that.options.scrollWidth;

        			if(offset+that.scrollLeft < 0){
        				that.scrollLeft = -offset;
        			}
        		}else{
        			that.scrollLeft += that.options.scrollWidth;

        			if(that.scrollLeft > 0){
        				that.scrollLeft = 0;
        			}
        		}
        	}

        	$("ul.k-tabstrip-items", element).css({"margin-left":that.scrollLeft + "px"});
        }
        ,destroy:function() {
            var that = this;

            Widget.fn.destroy.call(that);
            kendo.destroy($(that.element).siblings(".scrollbutton-wrapper"));
        }
    });

    ui.plugin(ExtTabStrip);

})(window.kendo.jQuery);

/* ExtSelectable */
(function ($, undefined) {
    var kendo = window.kendo,
        Widget = kendo.ui.Widget,
        proxy = $.proxy,
        abs = Math.abs,
        shift = Array.prototype.shift,
        ARIASELECTED = "aria-selected",
        SELECTED = "k-state-selected",
        ACTIVE = "k-state-selecting",
        SELECTABLE = "k-selectable",
        CHANGE = "change",
        NS = ".kendoExtSelectable",
        UNSELECTING = "k-state-unselecting",
        INPUTSELECTOR = "input,a,textarea,.k-multiselect-wrap,select,button",
        CHECKBOXSELECTOR = ".grid-checkbox-item",
        msie = kendo.support.browser.msie,
        supportEventDelegation = false;

        (function($) {
            (function() {
                $('<div class="parent"><span /></div>')
                .on("click", ">*", function() {
                	supportEventDelegation = true;
                })
                .find("span")
                .click()
                .end()
                .off();
            })();
        })($);

    var ExtSelectable = Widget.extend({
        init:function(element, options) {
            var that = this,
                multiple;

            Widget.fn.init.call(that, element, options);

            that._marquee = $("<div class='k-marquee'><div class='k-marquee-color'></div></div>");
            that._lastActive = null;
            that.element.addClass(SELECTABLE);
            that.enableDragToSelectRows = that.options.enableDragToSelectRows || false;

            that.relatedTarget = that.options.relatedTarget;

            multiple = that.options.multiple;

            if (this.options.aria && multiple) {
                that.element.attr("aria-multiselectable", true);
            }

            that.userEvents = new kendo.UserEvents(that.element, {
                global:true
                ,allowSelection:true
                ,filter:(!supportEventDelegation ? "." + SELECTABLE + " ":"") + that.options.filter
                ,tap:proxy(that._tap, that)
            });

            if (multiple) {
                that.userEvents
                   .bind("start", proxy(that._start, that))
                   .bind("move", proxy(that._move, that))
                   .bind("end", proxy(that._end, that))
                   .bind("select", proxy(that._select, that));
            }
        },

        events:[CHANGE],

        options:{
            name:"ExtSelectable",
            filter:">*",
            multiple:false,
            enableDragToSelectRows:false,
            relatedTarget:$.noop
        },

        _isElement:function(target) {
            var elements = this.element;
            var idx, length = elements.length, result = false;

            target = target[0];

            for (idx = 0; idx < length; idx ++) {
                if (elements[idx] === target) {
                    result = true;
                    break;
                }
            }

            return result;
        },

        _tap:function(e) {
        	//console.log("_tab");
            var target = $(e.target),
                that = this,
                ctrlKey = e.event.ctrlKey || e.event.metaKey,
                multiple = that.options.multiple,
                shiftKey = multiple && e.event.shiftKey,
                selected,
                whichCode = e.event.which,
                buttonCode = e.event.button;

            //in case of hierarchy or right-click
            if (!that._isElement(target.closest("." + SELECTABLE)) || whichCode && whichCode == 3 || buttonCode && buttonCode == 2) {
                return;
            }

            if (!this._allowSelection(e.event.target)) {
                return;
            }

            selected = target.hasClass(SELECTED);
            if (!multiple || !ctrlKey) {
                that.clear();
            }

            target = target.add(that.relatedTarget(target));

            if (shiftKey) {
                that.selectRange(that._firstSelectee(), target);
            } else {
                if (selected && ctrlKey) {
                    that._unselect(target);
                    that._notify(CHANGE);
                } else {
                	that.value(target);
                }

                that._lastActive = that._downTarget = target;
            }
        },

        _start:function(e) {
        	//console.log("_start");
            var that = this,
                target = $(e.target),
                selected = target.hasClass(SELECTED),
                currentElement,
                ctrlKey = e.event.ctrlKey || e.event.metaKey;

            if(that.options.enableDragToSelectRows || e.event.ctrlKey){
            	that.enableDragToSelectRows = true;
            }else{
            	that.enableDragToSelectRows = false;
            }

            that.clear();
            $(CHECKBOXSELECTOR, this.element).prop("checked", false);
//            that._notify(CHANGE);
            selected = false;

            if (!this._allowSelection(e.event.target)) {
                return;
            }

            that._downTarget = target;

            //in case of hierarchy
            if (!that._isElement(target.closest("." + SELECTABLE))) {
                that.userEvents.cancel();
                return;
            }

            if (that.options.useAllItems) {
                that._items = that.element.find(that.options.filter);
            } else {
                currentElement = target.closest(that.element);
                that._items = currentElement.find(that.options.filter);
            }

            e.sender.capture();

            if(that.enableDragToSelectRows){
            	that._marquee
	            	.appendTo(document.body)
	            	.css({
	            		left:e.x.client + 1,
	            		top:e.y.client + 1,
	            		width:0,
	            		height:0
	            	});
            }

            if (!ctrlKey) {
                that.clear();
            }

            target = target.add(that.relatedTarget(target));
            if (selected) {
                that._selectElement(target, true);
                if (ctrlKey) {
                    target.addClass(UNSELECTING);
                }
            }
        },

        _move:function(e) {
        	//console.log("_move");
            var that = this,
                position = {
                    left:e.x.startLocation > e.x.location ? e.x.location:e.x.startLocation,
                    top:e.y.startLocation > e.y.location ? e.y.location:e.y.startLocation,
                    width:abs(e.x.initialDelta),
                    height:abs(e.y.initialDelta)
                };

            if(that.enableDragToSelectRows){
            	that._marquee.css(position);
            }

            that._invalidateSelectables(position, (e.event.ctrlKey || e.event.metaKey));

            e.preventDefault();

        },

        _end:function() {
        	//console.log("_end");
            var that = this;
            var target;

            if(that.enableDragToSelectRows){
            	that._marquee.remove();
            }

            that._unselect(that.element
                .find(that.options.filter + "." + UNSELECTING))
                .removeClass(UNSELECTING);

            if(that.enableDragToSelectRows){
            	target = that.element.find(that.options.filter + "." + ACTIVE);
            	target = target.add(that.relatedTarget(target));
            }

            that.value(target);

            that._lastActive = that._downTarget;
            that._items = null;
        },

        _invalidateSelectables:function(position, ctrlKey) {
        	//console.log("_invalidateSelectables");
            var idx,
                length,
                target = this._downTarget[0],
                items = this._items,
                related,
                toSelect;

            for (idx = 0, length = items.length; idx < length; idx ++) {
                toSelect = items.eq(idx);
                related = toSelect.add(this.relatedTarget(toSelect));

                if (collision(toSelect, position)) {
                    if(toSelect.hasClass(SELECTED)) {
                        if(ctrlKey && target !== toSelect[0]) {
                            related.removeClass(SELECTED).addClass(UNSELECTING);
                        }
                    } else if (!toSelect.hasClass(ACTIVE) && !toSelect.hasClass(UNSELECTING)) {
                        related.addClass(ACTIVE);
                    }
                } else {
                    if (toSelect.hasClass(ACTIVE)) {
                        related.removeClass(ACTIVE);
                    } else if(ctrlKey && toSelect.hasClass(UNSELECTING)) {
                        related.removeClass(UNSELECTING).addClass(SELECTED);
                    }
                }
            }
        },

        value:function(val) {
        	//console.log("value");
            var that = this,
                selectElement = proxy(that._selectElement, that);

            if(val) {
                val.each(function() {
                    selectElement(this);
                });

                that._notify(CHANGE);
                return;
            }

            return that.element.find(that.options.filter + "." + SELECTED);
        },

        _firstSelectee:function() {
        	//console.log("_firstSelectee");
            var that = this,
                selected;

            if(that._lastActive !== null) {
                return that._lastActive;
            }

            selected = that.value();
            return selected.length > 0 ? selected[0]:that.element.find(that.options.filter)[0];
        },

        _selectElement:function(element, preventNotify) {
        	//console.log("_selectElement");
            var toSelect = $(element),
                isPrevented =  !preventNotify && this._notify("select", { element:element });

            toSelect.removeClass(ACTIVE);
            if(!isPrevented) {
                 toSelect.addClass(SELECTED);

                if (this.options.aria) {
                    toSelect.attr(ARIASELECTED, true);
                }
            }
        },

        _notify:function(name, args) {
        	//console.log("_notify");
            args = args || { };
            return this.trigger(name, args);
        },

        _unselect:function(element) {
        	//console.log("_unselect");
            element.removeClass(SELECTED);

            if (this.options.aria) {
                element.attr(ARIASELECTED, false);
            }

            return element;
        },

        _select:function(e) {
        	//console.log("_select");
            if (this._allowSelection(e.event.target)) {
                if (!msie || (msie && !$(kendo._activeElement()).is(INPUTSELECTOR))) {
                	if(this.enableDragToSelectRows || e.event.ctrlKey){
                		e.preventDefault();
                	}
                }
            }
        },

        _allowSelection:function(target) {
        	//console.log("_allowSelection");
            if ($(target).is(INPUTSELECTOR)) {
                this.userEvents.cancel();
                this._downTarget = null;
                return false;
            }

            return true;
        },

        resetTouchEvents:function() {
        	//console.log("resetTouchEvents");
            this.userEvents.cancel();
        },

        clear:function() {
            var items = this.element.find(this.options.filter + "." + SELECTED);
            this._unselect(items);
        },

        selectRange:function(start, end) {
        	//console.log("selectRange");
            var that = this,
                idx,
                tmp,
                items;

            that.clear();

            if (that.element.length > 1) {
                items = that.options.continuousItems();
            }

            if (!items || !items.length) {
                items = that.element.find(that.options.filter);
            }

            start = $.inArray($(start)[0], items);
            end = $.inArray($(end)[0], items);

            if (start > end) {
                tmp = start;
                start = end;
                end = tmp;
            }

            if (!that.options.useAllItems) {
                end += that.element.length - 1;
            }

            for (idx = start; idx <= end; idx ++ ) {
                that._selectElement(items[idx]);
            }

            that._notify(CHANGE);
        },

        destroy:function() {
            var that = this;

            Widget.fn.destroy.call(that);

            that.element.off(NS);

            that.userEvents.destroy();

            that._marquee = that._lastActive = that.element = that.userEvents = null;
        }
    });

    ExtSelectable.parseOptions = function(selectable) {
        var asLowerString = typeof selectable === "string" && selectable.toLowerCase();

        return {
            multiple:asLowerString && asLowerString.indexOf("multiple") > -1,
            cell:asLowerString && asLowerString.indexOf("cell") > -1
        };
    };

    function collision(element, position) {
        var elementPosition = kendo.getOffset(element),
            right = position.left + position.width,
            bottom = position.top + position.height;

        elementPosition.right = elementPosition.left + element.outerWidth();
        elementPosition.bottom = elementPosition.top + element.outerHeight();

        return !(elementPosition.left > right||
            elementPosition.right < position.left ||
            elementPosition.top > bottom ||
            elementPosition.bottom < position.top);
    }

    kendo.ui.plugin(ExtSelectable);
})(window.kendo.jQuery);

//ExtNumericTextBox
(function ($) {
    var kendo = window.kendo,
    ui = kendo.ui,
    Widget = ui.NumericTextBox,
    ns = ".kendoExtNumericTextBox";

    var ExtNumericTextBox = Widget.extend({
        init:function(element, options) {
            var that = this;

            Widget.fn.init.call(that, element, options);
        }
        ,options:{
            name:"ExtNumericTextBox"
        }
        ,_update:function(value) {
            var that = this;
            Widget.fn._update.call(that, value);

            that.wrapper
            .find(".k-formatted-value")
            .attr("title", that.value());
        }
    });

    kendo.ui.plugin(ExtNumericTextBox);
})(window.kendo.jQuery);