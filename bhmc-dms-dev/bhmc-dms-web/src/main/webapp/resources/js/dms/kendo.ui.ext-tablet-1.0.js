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
    ui = kendo.ui,
    Widget = ui.Grid,
    CHANGE = "change",
    CLICK = "click",
    DATABOUND = "dataBound",
    DATABINDING = "dataBinding",
    EDIT = "edit",
    COPYFROMEXCEL = "copyFromExcel",
    COLUMNHIDE = "columnHide",
    COLUMNSHOW = "columnShow",
    COLUMNREORDER = "columnReorder",
    NAVIGATE = "navigate",
    proxy = $.proxy,
    ns = ".kendoExtGrid";

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
                    ,pageSize:10
                    ,serverPaging:true
                    ,serverSorting:true
                    ,serverFiltering:false
                    ,schema:{
                        data:"data"
                        ,total:"total"
                    }
                }
                ,autoBind:true
                ,navigatable:true
//                ,navigate:function(e) {
//
//                    var row = e.element.closest("tr");
//
//                    if(row !== currentStateSelectedRow){
//                        if(currentStateSelectedRow){
//                            currentStateSelectedRow.removeClass("k-state-selected-ext");
//                        }
//                    }
//
//                    row.addClass("k-state-selected-ext");
//                    currentStateSelectedRow = row;
//                }
                ,editable:{
                    mode:"incell"
                    ,confirmation:false
                }
                ,reorderable:true
                ,sortable:{
                    mode:"multiple"
                    ,allowUnsort:true
                }
                ,height:380
                ,pageable:{
                    refresh:true
                    ,pageSizes:[10, 30, 50]
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
                ,selectable:"multiple, row"
                ,scrollable:true
                ,resizable:true
                ,filterable:{
                    mode:"row"
                }
                ,multiSelectWithCheckbox:false
                ,multiSelectLocked:false
                ,editableOnlyNew:false
                ,indvColumnVisible:true
                ,indvColumnReorderable:true
                ,indvColumnRows:10
                ,enableTooltip:false
                ,editableOnlyNewExcludeColumns:[]
                ,appendEmptyColumn:false
                ,visibleFilterRow:false
//                ,resizableHeight:true
                ,_columns:[]
            };

            if (dms.browser.isMobile()) {
                settings["mobile"] = true;
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
                    if(column.filterable !== false && column.field) {
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
    //                                ,dataSource:[]
    //                                ,dataTextField:column.field
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

            $.extend(true, settings, options);

            //멀티선택 컬럼 적용
            if (settings.multiSelectWithCheckbox) {
                settings.columns.unshift({
                    title:"&nbsp;"
                    ,width:30
                    ,sortable:false
                    ,attributes:{"class":"ac"}
                    ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' />"
                    ,headerTemplate:"<input type='checkbox' class='checkAll' />"
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
                    settings._columns = settings.columns.slice(0);

                    var showColumns = settings.columns.filter(function(column){
                        return !(("hidden" in column && column.hidden) || column._hidden);
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

                        $.each(showColumns, function(idx, column){
                            if(idx % colsSize  == 0){
                                cols = 0;
                                columnList += "<ul>";
                            }

                            columnList += "<li><label class=\"label_check\"><input type=\"checkbox\" class=\"form_check\" id=\"" + settings.gridId + "-" + column.field + "\" data-field=\"" + column.field + "\" checked> <span>" + column.title + "</span></label></li>";
                            cols++;

                            if(cols == colsSize || showColumnsLength == idx+1){
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

            if(!settings.visibleFilterRow){
                $("tr.k-filter-row", element).hide();
            }

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
            .on("focusout" + ns, function() {
                var current = that.current();
                if (current) {
                    current.closest("tr").removeClass("k-state-selected-ext");
                }
            });

            //그리드 개인화 적용
            that._gridIndividualization();
            //체크박스 선택 적용
            that._multiSelectWithCheckbox();
            //
            that._editableOnlyNew();
//            that._resizableHeight();

            if(that.options.copyFromExcel) {
                $(element).on("keydown", function(e){

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

            //TODO [한강석] 그리드 셀 툴립기능 보완후 [위치조정] 주석해제 필요
            if(settings.enableTooltip) {
                /*
                that.bind(EDIT, function(e){
                    $(e.sender.element.context).find("td.k-edit-cell input").bind("blur", function(){
                        var elem = $(this).closest("td");
                        if(elem.data("tooltip-enabled")){
                            elem.addClass("tooltip-enabled");
                        }
                    });

                    if(elem.hasClass("tooltip-enabled")){
                        elem.data("tooltip-enabled", true);
                        elem.removeClass("tooltip-enabled");
                    }
                });

                $(element).kendoTooltip({
                    filter:'td.tooltip-enabled'
                    ,showAfter:1000
                    ,width:400
                    ,position:"right"
                    ,content:function(e){
                        return "<div style='text-align:left'>"+e.target.text().replace(/\n/g, "<br/>")+"</div>";
                    }
                    ,show:function(e) {
                        $(this.popup.wrapper).css({
                            "top":dms.mouse.Y+10
                            ,"left":dms.mouse.X+10
                            ,"border":"1px solid #7d838d"
                            ,"background":"#fffad2"
                            ,"text-align":"left"
                            ,"white-space":"normal"
                        });
                    }
                }).data("kendoTooltip");
                */
            }
        },
//        events:[
//            CHANGE
//            ,DATABINDING
//            ,DATABOUND
//            ,EDIT
//            ,COPYFROMEXCEL
//        ],
        options:{
            name:"ExtGrid"
            ,useCopyFromExcel:false
            ,gridId:""
        },

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

        },

        _editableOnlyNew:function(){
            var that = this;

            if (that.options.editableOnlyNew) {
                that.bind(EDIT, function(e){
                    if(!e.model.isNew()) {

                        var fieldName = e.container.find("input[name][data-bind]").attr("name");

//                        var fieldName;
//                        if(e.sender.columns[e.container.index()].columns) {
//                            fieldName = e.sender.columns[e.container.index()].columns[e.sender._current.index() - e.container.index()].field;
//                        } else {
//                            fieldName = e.sender.columns[e.container.index()].field;
//                        }

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

//        _resizableHeight:function() {
//            var that = this;
//
//            if(that.options.resizableHeight) {
//                $(that.element).resizable({handles:"s,w"});
//            }
//        },

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
         * 그리드에 같은 데이터가 존재 하는지 여부를 반환한다.
         *
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
            /*
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
            */
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
    ns = ".kendoExtMultiSelectDropDownList";

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

        _stopScroll : function(element){
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
        proxy = $.proxy,
        NS = ".kendoExtMaskedDatePicker";

    var ExtMaskedDatePicker = Widget.extend({
        init:function (element, options) {
            var that = this,
                $element = $(element);

            that.options.format = that.options.format || "yyyy-MM-dd";
            that.options.parseFormats = that.options.parseFormats || [that.options.format];

            Widget.fn.init.call(this, element, options);


            $element.kendoMaskedTextBox({
                mask:that.options.format.replace(/[y|m|d|h|s]/gi, "0")
            })
            .add(element)
            .removeClass("k-textbox");

            $element.data("kendoMaskedTextBox").bind("change", function(){

                if(dms.string.isEmpty($element.val())){
                    return;
                }

                var d = kendo.parseDate($element.val(), that.options.format);

                if (d == null || !isInRange(d, that.options.min, that.options.max)) {
                    $element.val("");
                    $element.select();
                    dms.notification.warning(that.options.dateValidMessage);
                }

            });
        }
        ,options:{
            name:"ExtMaskedDatePicker"
            ,mask:"0000-00-00"
            ,format:"yyyy-MM-dd"
            ,parseFormats:["yyyy-MM-dd"]
            ,dateValidMessage:dms.settings.defaultMessage.invalidDateFormat
        }
        ,events:[
            CHANGE
        ]
    });

    ui.plugin(ExtMaskedDatePicker);

})(window.kendo.jQuery);

//ExtMaskedDateTimePicker
(function ($) {
    var kendo = window.kendo,
        ui = kendo.ui,
        Widget = ui.DateTimePicker,
        calendar = kendo.calendar,
        isInRange = calendar.isInRange,
        restrictValue = calendar.restrictValue,
        isEqualDatePart = calendar.isEqualDatePart,
        CHANGE = "change",
        proxy = $.proxy,
        NS = ".kendoExtMaskedDateTimePicker";

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

            $element.data("kendoMaskedTextBox").bind("change", function(){

                if(dms.string.isEmpty($element.val())){
                    return;
                }

                var d = kendo.parseDate($element.val(), that.options.format);

                if (d == null || !isInRange(d, that.options.min, that.options.max)) {
                    $element.val("");
                    $element.select();
                    dms.notification.warning(that.options.dateValidMessage);
                }

            });
        }
        ,options:{
            name:"ExtMaskedDateTimePicker"
            ,mask:"0000-00-00 00:00:00"
            ,format:"yyyy-MM-dd HH:mm:ss"
            ,parseFormats:["yyyy-MM-dd HH:mm:ss"]
        }
        ,events:[
            CHANGE
        ]
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

                    dms.notification.info(html);
                }
            });
        }
        ,options:{
            name:"ExtValidator"
            ,errorTemplate:''
            ,messages:{
                required:dms.settings.validationMessage.required,
                pattern:dms.settings.validationMessage.pattern,
                min:dms.settings.validationMessage.min,
                max:dms.settings.validationMessage.max,
                step:dms.settings.validationMessage.step,
                email:dms.settings.validationMessage.email,
                url:dms.settings.validationMessage.url,
                date:dms.settings.validationMessage.date
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
        ,destroy: function() {
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
        init: function(element, options) {
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
                global: true,
                allowSelection: true,
                filter: (!supportEventDelegation ? "." + SELECTABLE + " " : "") + that.options.filter,
                tap: proxy(that._tap, that)
            });

            if (multiple) {
                that.userEvents
                   .bind("start", proxy(that._start, that))
                   .bind("move", proxy(that._move, that))
                   .bind("end", proxy(that._end, that))
                   .bind("select", proxy(that._select, that));
            }
        },

        events: [CHANGE],

        options: {
            name: "ExtSelectable",
            filter: ">*",
            multiple: false,
            enableDragToSelectRows: false,
            relatedTarget: $.noop
        },

        _isElement: function(target) {
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

        _tap: function(e) {
//          console.log("_tab");
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

        _start: function(e) {
//          console.log("_start");
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
                        left: e.x.client + 1,
                        top: e.y.client + 1,
                        width: 0,
                        height: 0
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

        _move: function(e) {
//          console.log("_move");
            var that = this,
                position = {
                    left: e.x.startLocation > e.x.location ? e.x.location : e.x.startLocation,
                    top: e.y.startLocation > e.y.location ? e.y.location : e.y.startLocation,
                    width: abs(e.x.initialDelta),
                    height: abs(e.y.initialDelta)
                };

            if(that.enableDragToSelectRows){
                that._marquee.css(position);
            }

            that._invalidateSelectables(position, (e.event.ctrlKey || e.event.metaKey));

            e.preventDefault();

        },

        _end: function() {
//          console.log("_end");
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

        _invalidateSelectables: function(position, ctrlKey) {
//          console.log("_invalidateSelectables");
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

        value: function(val) {
//          console.log("value");
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

        _firstSelectee: function() {
//          console.log("_firstSelectee");
            var that = this,
                selected;

            if(that._lastActive !== null) {
                return that._lastActive;
            }

            selected = that.value();
            return selected.length > 0 ?
                    selected[0] :
                    that.element.find(that.options.filter)[0];
        },

        _selectElement: function(element, preventNotify) {
//          console.log("_selectElement");
            var toSelect = $(element),
                isPrevented =  !preventNotify && this._notify("select", { element: element });

            toSelect.removeClass(ACTIVE);
            if(!isPrevented) {
                 toSelect.addClass(SELECTED);

                if (this.options.aria) {
                    toSelect.attr(ARIASELECTED, true);
                }
            }
        },

        _notify: function(name, args) {
//          console.log("_notify");
            args = args || { };
            return this.trigger(name, args);
        },

        _unselect: function(element) {
//          console.log("_unselect");
            element.removeClass(SELECTED);

            if (this.options.aria) {
                element.attr(ARIASELECTED, false);
            }

            return element;
        },

        _select: function(e) {
//          console.log("_select");
            if (this._allowSelection(e.event.target)) {
                if (!msie || (msie && !$(kendo._activeElement()).is(INPUTSELECTOR))) {
                    if(this.enableDragToSelectRows || e.event.ctrlKey){
                        e.preventDefault();
                    }
                }
            }
        },

        _allowSelection: function(target) {
//          console.log("_allowSelection");
            if ($(target).is(INPUTSELECTOR)) {
                this.userEvents.cancel();
                this._downTarget = null;
                return false;
            }

            return true;
        },

        resetTouchEvents: function() {
//          console.log("resetTouchEvents");
            this.userEvents.cancel();
        },

        clear: function() {
            var items = this.element.find(this.options.filter + "." + SELECTED);
            this._unselect(items);
        },

        selectRange: function(start, end) {
//          console.log("selectRange");
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

        destroy: function() {
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
            multiple: asLowerString && asLowerString.indexOf("multiple") > -1,
            cell: asLowerString && asLowerString.indexOf("cell") > -1
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
