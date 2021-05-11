<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 완성차 정산순위 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.vehicleSttlOrd" /></h1> <!-- 완성차 정산순위 -->
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                <button class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>  <!-- 추가 -->
                <button class="btn_m btn_delete" id="btnDel"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>  <!-- 취소 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.useYn" /></th> <!-- 사용여부 -->
                        <td>
                            <input name="sUseYn" id="sUseYn" type="text" class="form_comboBox">
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->
        <div class="table_grid mt10">
            <div id="grid"></div>
        </div>
    </section>

<script  type="text/javascript">

	/**
	 * 사용여부
	 */
	 $("#sUseYn").kendoExtDropDownList({
	     dataTextField:"userCdNm",
	     dataValueField:"userCd",
	     dataSource:[{"userCd":"","userCdNm":"<spring:message code='global.lbl.all' />"},{"userCd":"Y","userCdNm":"<spring:message code='global.lbl.use' />"},{"userCd":"N","userCdNm":"<spring:message code='global.lbl.notUse' />"}],
	     index:0
	 }); //전체, 사용, 미사용
	 /*
	 var useYnCdList = [];
	 <c:forEach var="obj" items="${useYnCdInfo}">
	  useYnCdList.push({carlineNm:"${obj.useYnNm}", carlineCd:"${obj.useYnCd}"});
	 </c:forEach>
	 */
     /************* 세금구분 SELECT BOX  *******************/
	 var taxAtcDstinCdList = [];
     <c:forEach var="obj" items="${taxAtcDstinCdInfo}">
     taxAtcDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var taxAtcDstinCdArr = dms.data.arrayToMap(taxAtcDstinCdList, function(obj){return obj.cmmCd});
     /************* 세금구분 SELECT BOX  *******************/

     /************* 정산구분 SELECT BOX  *******************/
     var calcAtcDstinCdList = [];
     <c:forEach var="obj" items="${calcAtcDstinCdInfo}">
     calcAtcDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var calcAtcDstinCdArr = dms.data.arrayToMap(calcAtcDstinCdList, function(obj){return obj.cmmCd});
     /************* 정산구분 SELECT BOX  *******************/

	$(document).ready(function () {

	    taxAtcDstinCdDropDownEditor = function(container, options) {
	        $('<input required data-text-field="cmmCdNm" data-value-field="cmmCd" data-bind="value:' + options.field + '"/>')
	             .appendTo(container)
	             .kendoExtDropDownList({
	                  autoBind:false
	                 ,dataTextField:"cmmCdNm"
	                 ,dataValueField:"cmmCd"
	                 ,dataSource:taxAtcDstinCdList
	             });
	        $('<span class="k-invalid-msg" data-for="taxAtcDstinCd"></span>').appendTo(container);
	     }

	    // 세금구분
	    changeTaxAtcDstinCdReason = function(val){
	        var returnVal = "";
	        if(val != null && val != ""){
	            returnVal = taxAtcDstinCdArr[val].cmmCdNm;
	        }
	        return returnVal;
	    }
	    calcAtcDstinCdDropDownEditor = function(container, options) {
	          $('<input required data-text-field="cmmCdNm" data-value-field="cmmCd" data-bind="value:' + options.field + '"/>')
	              .appendTo(container)
	              .kendoExtDropDownList({
	                   autoBind:false
	                  ,dataTextField:"cmmCdNm"
	                  ,dataValueField:"cmmCd"
	                  ,dataSource:calcAtcDstinCdList
	              });
	          $('<span class="k-invalid-msg" data-for="calcAtcDstinCd"></span>').appendTo(container);
	      }

	    // 정산구분
	    changeCalcAtcDstinCdReason = function(val){
	        var returnVal = "";
	        if(val != null && val != ""){
	            returnVal = calcAtcDstinCdArr[val].cmmCdNm;
	        }
	        return returnVal;
	    }

		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

	    $("#btnSave").kendoButton({
	        //icon:"plus",
	        click:function(e){

	            var grid = $("#grid").data("kendoExtGrid");

	            if(grid.gridValidation()){
	                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

	                if(grid.cudDataLength == 0){
	                  //변경된 정보가 없습니다.
	                    dms.notification.info("<spring:message code='global.info.required.change'/>");
	                    return;
	                }

	                $.ajax({
	                    url:"<c:url value='/sal/btc/vehicleSettlementOrder/multiVehicleSettlementOrder.do' />",
	                    data:JSON.stringify(saveData),
	                    type:'POST',
	                    dataType:'json',
	                    contentType:'application/json',
	                    error:function(jqXHR,status,error){
	                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
	                    },
	                    success:function(jqXHR, textStatus){

	                        grid.dataSource._destroyed = [];
	                        grid.dataSource.page(1);

	                      //정상적으로 반영 되었습니다.
	                        dms.notification.success("<spring:message code='global.info.success'/>");
	                    }
	                });
	            }else{
	                dms.notification.warning("<spring:message code='global.info.check.input' />"); //입력값을 확인하여 주십시오.
	            }
	        }
	    });

	    $("#btnCancel").kendoButton({
	        //icon:"undo",
	        click:function(e){
	            $('#grid').data('kendoExtGrid').cancelChanges();
	        }
	    });

	    $("#btnDel").kendoButton({
	        //icon:"close",
	        click:function(e){

	            var grid = $("#grid").data("kendoExtGrid");
	            var rows = grid.select();

	            rows.each(function(index, row) {

	                grid.removeRow(row);
	            });
	        }
	    });

	    $("#btnAdd").kendoButton({
	        //icon:"plus",
	        click:function(e){
	            $('#grid').data('kendoExtGrid').dataSource.insert(0,
	                    {calcAtcDstinCd:""
    	                ,taxAtcDstinCd:""
    	                ,calcId:""
    	                ,calcAtcNm:""
	                    ,fmulaCont:""
	                    ,calcOrder:1
	                    ,displayOrder:1
	                    ,sboIfYn:"N"
                        ,dprecvYn:"N"
                        ,displayYn:"N"
                        ,useYn:"N"
                        ,remark:""});

	        }
	    });

        //그리드 1번
    	$("#grid").kendoExtGrid({
           	dataSource:{
           	 transport:{
                 read:{
                     url:"<c:url value='/sal/btc/vehicleSettlementOrder/selectVehicleSettlementOrder.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};
                         params["sort"] = options.sort;

                         params["sUseYn"] = $("#sUseYn").val();

                         console.log(kendo.stringify(params));

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,error:function(e){

             }
             ,schema:{
                  data:"data"
                 ,total:"total"
                 ,model:{
                      id:"calcId"
                     ,fields:{
                          calcAtcDstinCd:{type:"string", validation:{required:true}} //정산구분
                         ,taxAtcDstinCd:{type:"string", validation:{required:true}} //세금구분
                         ,calcId:{type:"string", validation:{required:true} } //정산ID
                         ,calcAtcNm:{type:"string", validation:{required:true}} //항목
                         ,fmulaCont:{type:"string", validation:{required:true}} //계산
                         ,calcOrder:{type:"number",validation:{required:true, min:1, max:999}} //계산순서
                         ,displayOrder:{type:"number",validation:{required:true, min:1,max:999}} //표시순서
                         ,sboIfYn:{type:"string", editable:false, validation:{required:true}} //sbo연동
                         ,dprecvYn:{type:"string", editable:false, validation:{required:true}} //예수금여부
                         ,displayYn:{type:"string", editable:false, validation:{required:true}} //표시여부
                         ,useYn:{type:"string", editable:false, validation:{required:true}} // 사용여부
                         ,remark:{type:"string"} // 비고
                     }
                 }
             }
           }
           ,autoBind:false
           ,scrollable:true
           ,pageable:false
           ,change:function(e){

           }
           ,edit:onEditGrid
    	   ,columns:[
                   {
                       title:"<spring:message code='global.lbl.calcGb' />"
                      ,field:"calcAtcDstinCd"
                      ,width:55
                      ,headerAttributes:{style:"text-align:center;"}
                      ,editor:calcAtcDstinCdDropDownEditor
                      ,template:"#=changeCalcAtcDstinCdReason(calcAtcDstinCd)#"
                   }  // 정산구분-대금,할인,세금
                  ,{
                       title:"<spring:message code='global.lbl.taxGb' />", field:"taxAtcDstinCd", width:70
                      ,headerAttributes:{style:"text-align:center;"}
                      ,editor:taxAtcDstinCdDropDownEditor
                      ,template:"#=changeTaxAtcDstinCdReason(taxAtcDstinCd)#"
                   }  // 세금구분
                  ,{
                       title:"<spring:message code='global.lbl.key' />", field:"calcId", width:80
                      ,headerAttributes:{style:"text-align:center;"}
                   }  // KEY
                  ,{
                       title:"<spring:message code='global.lbl.item' />", field:"calcAtcNm", width:140
                      ,headerAttributes:{style:"text-align:center;"}
                   }  // 항목
                  ,{
                       title:"<spring:message code='global.lbl.calculation' />", field:"fmulaCont", width:120
                      ,headerAttributes:{style:"text-align:center;"}
                   }  // 계산
                  ,{
                       title:"<spring:message code='global.lbl.calcOrder' />", field:"calcOrder", width:75
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{style:"text-align:right;"}
                   }  // 계산순서
                  ,{
                       title:"<spring:message code='global.lbl.displayOrder' />", field:"displayOrder", width:75
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{style:"text-align:right;"}
                   }  // 표시순서
                  ,{
                       title:"<spring:message code='sal.lbl.sboInterLock' />", field:"sboIfYn", width:60
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{style:"text-align:center;"}
                      ,template:'<input type="checkbox" class="checkbox"  id="sboIfYn" #= sboIfYn=="Y"? checked="checked":"" #  />'
                   }  // sbo연동
                  ,{
                       title:"<spring:message code='global.lbl.dprecvYn' />", field:"dprecvYn", width:75
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{style:"text-align:center;"}
                      ,template:'<input type="checkbox" class="checkbox"  id="dprecvYn" #= dprecvYn=="Y"? checked="checked":"" #  />'
                   }  // 예수금여부
                  ,{
                       title:"<spring:message code='global.lbl.displayYn' />", field:"displayYn", width:60
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{style:"text-align:center;"}
                      ,template:'<input type="checkbox" class="checkbox"  id="displayYn" #= displayYn=="Y"? checked="checked":"" #  />'
                   }  // 표시여부
                  ,{
                       title:"<spring:message code='global.lbl.useYn' />", field:"useYn", width:60
                      ,headerAttributes:{style:"text-align:center;"}
                      ,attributes:{style:"text-align:center;"}
                      ,template:'<input type="checkbox" class="checkbox"  id="useYn" #= useYn=="Y"? checked="checked":"" #  />'
                   }  // 사용여부
                  ,{
                       title:"<spring:message code='global.lbl.remark' />", field:"remark", width:140
                      ,headerAttributes:{style:"text-align:center;"}
                   }  // 비고
              ]
    	});

    	var grid = $("#grid").data("kendoExtGrid");
    	grid.table.on("click", ".checkbox" , selectRow);

    	function selectRow() {

    	    var checked = this.checked,
    	    row = $(this).closest("tr"),
    	    grid = $("#grid").data("kendoExtGrid"),
    	    dataItem = grid.dataItem(row);
    	    var id = this.id;
    	    if (checked) {
    	        row.addClass("k-state-selected");
    	        dataItem.dirty = true;
    	        if (id == "sboIfYn") dataItem.sboIfYn = "Y";
    	        if (id == "dprecvYn") dataItem.dprecvYn = "Y";
    	        if (id == "displayYn") dataItem.displayYn = "Y";
    	        if (id == "useYn") dataItem.useYn = "Y";
    	    } else {
    	        row.removeClass("k-state-selected");
    	        dataItem.dirty = true;
    	        if (id == "sboIfYn") dataItem.sboIfYn = "N";
    	        if (id == "dprecvYn") dataItem.dprecvYn = "N";
    	        if (id == "displayYn") dataItem.displayYn = "N";
    	        if (id == "useYn") dataItem.useYn = "N";
    	    }
    	}
	}); //document.ready End

	function onEditGrid(e){
        var fieldName = e.container.find("input").attr("name");

        if(!e.model.isNew()){
            if(fieldName=="calcId"){
                this.closeCell();
            }
        }
    }

	function complete(jqXHR, textStatus){
		var response = jQuery.parseJSON(jqXHR.responseText);
		globalNotification.show(response["result"], "info");
	}
</script>