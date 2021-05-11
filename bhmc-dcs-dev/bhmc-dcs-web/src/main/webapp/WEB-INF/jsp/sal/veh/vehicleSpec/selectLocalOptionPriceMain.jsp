<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
<%-- <dms:configValue code='defaultCurrency' var="_defaultCurrency" /> --%>


<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

//현재일자
var toDay = "${toDay}";
// 해당월 1일
var oneDay = "${oneDay}";

/**
 * 차종 콤보 (전체차종) -> 모델과 맵핑된 로컬옵션에 관한 차종만 조회 되도록 변경.
 * modelPackageMain.jsp 참조
 */
 var carLineCdList = [];
 <c:forEach var="obj" items="${carLineCdInfo}">
  carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
 </c:forEach>

 var carLineArray = [];
 $.each(carLineCdList, function(idx, obj){
     carLineArray[obj.carlineCd] = obj.carlineNm;
 });


 // 그리드 모델 콤보 dataSource
 var selectGridModelDSList = [];
 var selectGridModelArray  = [];


 // 그리드 옵션 콤보 dataSource
 var selectGridOptionDSList = [];
 var selectGridOptionArray  = [];


/**
 * 옵션 콤보
 */
 var selectOptionDSList = [];
 <c:forEach var="obj" items="${salesOptionList}">
     var bnDS = {};
     bnDS["optionCd"]    = "${obj.optionCd}";
     bnDS["optionNm"]  = "${obj.optionNm}";
     selectOptionDSList.push(bnDS);
 </c:forEach>

 /*
 var selectGridOptionArray = [];
 $.each(selectOptionDSList, function(idx, obj){
     selectGridOptionArray[obj.optionCd] = obj.optionNm;
 });
*/


// 사용여부
var useDS      = [{itemNm:"Y", itemCd:"Y"}, {itemNm:"N", itemCd:"N"}];
var useDSArray = [];
$.each(useDS, function(idx, obj){
    useDSArray[obj.itemCd] = obj.itemNm;
});

</script>

<!-- Vehicle Local Option Price -->
<section class="group">

    <!-- 타이틀 시작 -->
	<div class="header_area">
		<h1 class="title_basic">Vehicle Spec-Local Option Price</h1>
		<div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
			<button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>  <!-- 저장 -->
		</div>
	</div>
    <!-- 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <!--  해당 table_form div중 엔터이벤트 시 btnSearch 버튼 실행  -->
	<div class="table_form" role="search" data-btnid="btnSearch">
		<table>
			<caption></caption>
			<colgroup>
				<col style="width:10%;">
                <col style="width:30%;">
                <col style="width:8%;">
                <col style="width:22%;">
                <col style="width:8%;">
                <col>
			</colgroup>
			<tbody>
				<tr>
                    <th scope="row"><spring:message code="global.lbl.carLine" />/<spring:message code="global.lbl.model" /></th>    <!-- 차종/모델 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" style="width:49%">
                        <input id="sModelCd" class="form_comboBox" style="width:49%">
                    </td>
					<th scope="row"><spring:message code="global.lbl.option" /></th>    <!-- 옵션 -->
					<td>
                        <input id="sOption" class="form_comboBox">
                    </td>
					<th scope="row"><spring:message code="global.lbl.applyDt" /></th>  <!-- 적용일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
				</tr>
			</tbody>
		</table>
	</div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_add" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>           <!-- 행추가 -->
            <button class="btn_s btn_delete" id="btnDel"><spring:message code="global.btn.rowDel" /></button>        <!-- 행삭제 -->
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>
<!-- //Vehicle Local Option -->


<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--

$(document).ready(function() {

    // 검색 일자
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
   });

    /**
     * 차종 콤보박스
     */
     $("#sCarlineCd").kendoExtDropDownList({
         dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carLineCdList
        ,select:onSelectCarlineCd
        ,optionLabel:" "   // 전체
     });
     /**
      * 모델 콤보박스
      */
      $("#sModelCd").kendoExtDropDownList({
          dataTextField:"modelNm"
         ,dataValueField:"modelCd"
         ,optionLabel:" "   // 전체
      });

      $("#sModelCd").data("kendoExtDropDownList").wrapper.hide();

     /**
     * 옵션 콤보박스
     */
    $("#sOption").kendoExtDropDownList({
        dataTextField: "optionNm"
        ,dataValueField:"optionCd"
        ,dataSource:selectOptionDSList
        ,optionLabel:" "   // 전체
    });


    /**
     * 차종에 따른 모델 조회
     */
     function onSelectCarlineCd(e) {
         //console.log("##:" + $(e.sender.element).val());
         $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sModelCd").data("kendoExtDropDownList").wrapper.show();

         var dataItem = this.dataItem(e.item);

         var responseJson = dms.ajax.getJson({
             //url:_contextPath + "/sal/veh/vehicleSpec/selectVehicleSpecModel.do"
             url:_contextPath + "/sal/veh/localOptionPrice/selectLocalMappingModel.do"
             ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
             ,async:false
         });

         $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

     };

     /**
      * 차종에 따른 모델 조회
      */
      function onGridSelectCarlineCd(e) {
          var dataItem = this.dataItem(e.item);
          var responseJson = dms.ajax.getJson({
              //url:_contextPath + "/sal/veh/vehicleSpec/selectVehicleSpecModel.do"
              url:_contextPath + "/sal/veh/localOptionPrice/selectLocalMappingModel.do"
              ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
              ,async:false
          });

          //console.log(responseJson.data);
          selectGridModelDSList = responseJson.data;

          selectGridModelArray = [];
          $.each(selectGridModelDSList, function(idx, obj){
              selectGridModelArray[obj.modelCd] = obj.modelNm;
          });
      };

      /**
      * 모델에 따른 옵션조회
      */
      function onGridSelectModelCd(e){
          var dataItem = this.dataItem(e.item);
          var responseJson = dms.ajax.getJson({
              url:_contextPath + "/sal/veh/localOptionPrice/selectLocalMappingOption.do"
              //,data:JSON.stringify({"modelCd":this.options.dataSource[this.selectedIndex].modelCd})
              ,data:JSON.stringify({"modelCd":dataItem.modelCd})
              ,async:false
          });

          selectGridOptionDSList = responseJson.data;

          selectGridOptionArray = [];
          $.each(selectGridOptionDSList, function(idx, obj){
              selectGridOptionArray[obj.optionCd] = obj.optionNm;
          });

      }




    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if(grid.cudDataLength == 0){
                //globalNotification.show("저장할 정보가 없습니다.", "info");
                dms.notification.show("<spring:message code='global.btn.save' var='globalBtnSave' /><spring:message code='global.info.valNoMsg' arguments='${globalBtnSave}' />", "info");
                return;
            }

            if(grid.gridValidation()){
                $.ajax({

                    url:"<c:url value='/sal/veh/localOptionPrice/multiLocalOptionPrices.do' />"
                   ,data:JSON.stringify(saveData)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR,status,error){
                        //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                   ,success:function(jqXHR, textStatus){

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //globalNotification.show("처리가 완료 되었습니다.", "info");
                        dms.notification.success("<spring:message code='global.lbl.proce' var='globalLblProce' /><spring:message code='global.info.successMsg' arguments='${globalLblProce}' />", "info");
                   }
                });
            }else{
                //globalNotification.show("입력사항을 확인 하여 주십시오.", "error");
                dms.notification.warning("<spring:message code='global.info.check.input' />", "error");
            }
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                 dlrCd    :""
                ,carlineCd:""
                ,carlineNm:""
                ,modelCd  :""
                ,modelNm  :""
                ,optionCd :""
                ,optionNm :""
                ,useYn    :"Y"
             });
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
         dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/sal/veh/localOptionPrice/selectLocalOptionPrices.do' />"
                 },
                 parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["carlineCd"] = $("#sCarlineCd").val();
                         params["modelCd"]   = $("#sModelCd").val();

                         params["optionCd"] = $("#sOption").data("kendoExtDropDownList").value();

                         params["startDt"]  = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                         params["endDt"]    = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                         //params["startDt"]  = $("#sStartDt").val();
                         //params["endDt"]    = $("#sEndDt").val();

                         //console.log('params:',kendo.stringify(params) );
                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,batch:false
             ,schema:{
                 model:{
                     id:"dlrCd",
                     fields:{
                          id         :{type:"number", editable:false}
                         ,dlrCd      :{type:"string", editable:false}
                         ,carlineCd  :{type:"string"}
                         ,carlineNm  :{type:"string"}
                         ,modelCd    :{type:"string"}
                         ,modelNm    :{type:"string"}
                         ,optionCd   :{type:"string"}
                         ,optionNm   :{type:"string"}

                         ,startDt    :{type:"date"}
                         ,endDt      :{type:"date", validation:{required:true}}
                         ,purcPrc    :{type:"number"}
                         ,salePrc    :{type:"number"}
                         ,useYn      :{type:"string"}

                         ,regUsrId   :{type:"string", editable:false}
                         ,regDt      :{type:"date",   editable:false}
                         ,updtUsrId  :{type:"string", editable:false}
                         ,updtDt     :{type:"date",   editable:false}
                     }
                 }
             }
         }
        ,multiSelectWithCheckbox:true
        ,height:500
        ,resizable:true
        ,autoBind:true
        ,selectable:"multiple, row"
        ,navigatable:true
        ,sortable:false
        //,edit:onEditMainCd
        ,editable:{
            mode:"incell"
            ,confirmation:false
        }
        ,columns:[
           {field:"dlrCd",       title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드

           ,{field:"carlineCd",   title:"<spring:message code='global.lbl.carLine' />", width:100
               , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
               , template:"#= bf_selectCarLine(carlineCd)#"
               , editor:function (container, options){
                   //console.log("options.model.carlineCd:" +  options.model.carlineCd);

                   // 데이터가 없을 경우에만 dropdownList를 그려줌.
                   if(options.model.carlineCd == ""){
                       $('<input required name="carlineNm" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:false
                           , dataTextField:"carlineNm"
                           , dataValueField:"carlineCd"
                           , dataSource:carLineCdList
                           , select:onGridSelectCarlineCd
                       });
                   }else{
                       container.context.innerText = carLineArray[options.model.carlineCd];
                   }
               }
           } // 차종
           ,{field:"carlineNm",       title:"<spring:message code='global.lbl.carlineNm' />", hidden:true, width:10}       // 차종명

           ,{field:"modelCd",   title:"<spring:message code='global.lbl.model' />", width:100
               , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
               ,template:"#= bf_selectModel(modelCd, modelNm) #"
               ,editor:function (container, options){

                   if(options.model.modelCd == "" && options.model.carlineCd != ""){
                       $('<input required name="modelCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:false
                           ,dataTextField:"modelNm"
                           ,dataValueField:"modelCd"
                           ,dataSource:selectGridModelDSList
                           , select:onGridSelectModelCd
                       });
                   }else{
                       if(options.model.modelNm != ""){
                           container.context.innerText = options.model.modelNm;
                       }else{
                           container.context.innerText = selectGridModelArray[options.model.modelCd];
                       }
                   }
               }
           } // 모델
           ,{field:"modelNm",       title:"<spring:message code='global.lbl.modelNm' />", hidden:true, width:10}       // 모델명

           ,{field:"optionCd",   title:"<spring:message code='global.lbl.option' />", width:250
               , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
               ,template:"#=bf_selectOption(optionCd, optionNm)#"
               ,editor:function (container, options){
                   if(options.model.optionCd == "" && options.model.modelCd != ""){
                       $('<input required name="optionCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:false
                           , dataTextField: "optionNm"
                           , dataValueField:"optionCd"
                           , dataSource:selectGridOptionDSList
                       });
                   }else{
                       if(options.model.optionNm != ""){
                           container.context.innerText = options.model.optionNm;
                       }else{
                           container.context.innerText = selectGridOptionArray[options.model.optionCd];
                       }
                   }
               }
           } // 옵션
           ,{field:"optionNm",       title:"<spring:message code='global.lbl.optionNm' />", hidden:true, width:10}       // 옵션명

           // 적용시작일
           //,{field:"startDt",    title:"적용시작일", width:100, format:"{0:<dms:configValue code='dateFormat' />}"}    // 적용시작일
           ,{field:"startDt",    title:"<spring:message code='sal.lbl.startDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }

           // 적용종료일
           //,{field:"endDt",      title:"적용종료일", width:100, format:"{0:<dms:configValue code='dateFormat' />}"}    // 적용종료일
           ,{field:"endDt",      title:"<spring:message code='sal.lbl.endDt' />", attributes:{"class":"ac"}, width:100
               , format:"{0:"+vDtyyyyMMdd+"}"

           }

           ,{field:"purcPrc"   ,title:"<spring:message code='sal.lbl.purcPrc' />" ,width:80,attributes:{"validate-role":true,style:"text-align:right;"}  ,format:"{0:##,###}"}       //구매가격  /* TODO [sales] 김진석 시스템설정에서 정해놓은 포맷으로 변경 */
           ,{field:"salePrc"   ,title:"<spring:message code='global.lbl.retailPrice' />" ,width:80,attributes:{"validate-role":true,style:"text-align:right;"}  ,format:"{0:##,###}"}   //소매가격  /* TODO [sales] 김진석 시스템설정에서 정해놓은 포맷으로 변경 */

           ,{field:"useYn",   title:"<spring:message code='global.lbl.useYn' />", width:100
               , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
               ,template:"#=bf_selectUseYn(useYn)#"
               ,editor:function (container, options){
                   $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind:false
                       , dataTextField:"itemNm"
                       , dataValueField:"itemCd"
                       , dataSource:useDS
                       , valuePrimitive:true
                   });
               }
           } // 사용여부

           ,{field:"regUsrId",   title:"<spring:message code='global.lbl.regUsrId' />", attributes:{"class":"ac"}, width:100}    // 등록자
           ,{field:"regDt",      title:"<spring:message code='global.lbl.regDt' />", attributes:{"class":"ac"}, width:100, format:"{0:<dms:configValue code='dateTimeFormat' />}" }   //등록일
           ,{field:"updtUsrId",  title:"<spring:message code='global.lbl.updtUsrId' />", hidden:true, width:100}   //수정자
           ,{field:"updtDt",     title:"<spring:message code='global.lbl.updtDt' />", hidden:true, width:100, format:"{0:<dms:configValue code='dateTimeFormat' />}" } //수정일
        ]
    });

});


// Grid- 차종의 template 정의
 function bf_selectCarLine(carlineCd) {
     if(carlineCd == ""){
         return "";
     }else{
         return carLineArray[carlineCd];
     }
 }

//Grid- 모델의 template 정의
 function bf_selectModel(modelCd, modelNm){
     if(modelNm != ""){
         return modelNm;
     }
     if(modelCd == ""){
         return "";
     }
     return selectGridModelArray[modelCd];
 }

//Grid - 옵션의 template 정의
 function bf_selectOption(optionCd, optionNm){
     if(optionNm != ""){
         return optionNm;
     }
    if(optionCd == ""){
        return "";
    }
    return selectGridOptionArray[optionCd];
}

//Grid - 사용유무의 template 정의
function bf_selectUseYn(useYn){
    var returnVal = "";
    if(useYn != null && useYn != ""){
        returnVal = useDSArray[useYn];
    }
    return returnVal;
}

//-->
</script>