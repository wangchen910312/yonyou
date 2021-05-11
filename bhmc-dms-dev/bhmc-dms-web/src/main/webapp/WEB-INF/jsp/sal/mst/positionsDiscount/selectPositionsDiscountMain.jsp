<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.positionsDiscount' /></h1><!-- 직책별 할인금액 관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11311" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="global.btn.search" /></button>     <!-- 조회 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11310" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_save" id="btnSave" type="button" ><spring:message code='global.btn.save' /></button>          <!-- 저장 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11309" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_cancel" id="btnCancel" type="button"><spring:message code="global.btn.cancel" /></button>     <!-- 취소 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.carLine' /></span></th><!-- 차종 -->
                    <td class="required_area">
                        <input id="sCarlineCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModelCd" type="text" class="form_comboBox">
                        <input id="hiddenFscCode" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                    <td>
                        <input id="sOcnCd" type="text" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.applyDate' /></th><!-- 적용일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" type="text" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" type="text" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="sal.title.discountInfo" /></h2> <!-- 할인정보 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11308" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button> <!-- 행추가 -->
            </dms:access>
            <dms:access viewId="VIEW-D-11307" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button> <!-- 행삭제 -->
            </dms:access>
        </div>
    </div>
    <div class="table_grid">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>



<!-- script -->
<script>
 var sysDate = "${toDay}";

 /**
  * 차종 콤보
  */
 var carLineCdList = [];
 <c:forEach var="obj" items="${carLineCdInfo}">
     carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
 </c:forEach>

//그리드 모델 콤보 DataSource
var modelCdDSList = [];
var modelCdObj = {};

// 그리드 OCN 콤보 DataSource
var ocnCdDSList = [];
var ocnCdObj = {};

//여부(Y/N) COM020
 var ynList = [];
 var ynObj = {};
 <c:forEach var="obj" items="${ynDs}">
     ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 validator = function() {

     var grid = $("#mainGrid").data("kendoExtGrid");
     var rows = grid.tbody.find("tr");
     var check = true;

     rows.each(function(index, row) {
         var dataItem = grid.dataItem(row);

         if( dataItem.isNew() || dataItem.dirty ){
             if( dataItem.carlineCd == null || dataItem.carlineCd == "" ){
                 dms.notification.info("<spring:message code='global.lbl.carLine' var='carLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${carLine},' />"); // 차종을 선택해주세요.
                 check = false;
                 return false;
             }
             if( dataItem.modelCd == null || dataItem.modelCd == "" ){
                 dms.notification.info("<spring:message code='global.lbl.model' var='model' /><spring:message code='global.info.chkSelectItemMsg' arguments='${model},' />"); // 모델을 선택해주세요.
                 check = false;
                 return false;
             }
             if( dataItem.ocnCd == null || dataItem.ocnCd == "" ){
                 dms.notification.info("<spring:message code='global.lbl.ocn' var='ocn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${ocn},' />"); // OCN을 선택해주세요.
                 check = false;
                 return false;
             }
             if( dataItem.startDt == null ){
                 dms.notification.info("<spring:message code='sal.lbl.startDt' var='startDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${startDt},' />"); // 적용시작일을 선택해주세요.
                 check = false;
                 return false;
             }
             if( dataItem.endDt == null ){
                 dms.notification.info("<spring:message code='sal.lbl.endDt' var='endDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${endDt},' />"); // 적용종료일을 선택해주세요.
                 check = false;
                 return false;
             }

             if( Number(sysDate.replace(/\-/gi,"")) - Number(kendo.toString(dataItem.startDt, "yyyyMMdd")) > 0 ){
                 dms.notification.info("<spring:message code='sal.lbl.startDt' var='startDt' /><spring:message code='global.info.confirmMsgParam' arguments='${startDt},' />"); // 적용시작일을 확인해주세요.
                 check = false;
                 return false;
             }
             if( Number(kendo.toString(dataItem.endDt, "yyyyMMdd")) - Number(kendo.toString(dataItem.startDt, "yyyyMMdd")) < 0 ){
                 dms.notification.info("<spring:message code='sal.lbl.applyDate' var='dt' /><spring:message code='global.info.confirmMsgParam' arguments='${dt},' />"); // 적용일을 확인해주세요.
                 check = false;
                 return false;
             }
         }
     });

     return check;
 }

$(document).ready(function () {

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#hiddenFscCode").val("");

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#hiddenFscCode").val("");

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcnCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.fscCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            $("#hiddenFscCode").val("");
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);


    //조회조건 - 적용시작일
    var sStartDtPicker = $("#sStartDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            sEndDtPicker.min(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
        }
    }).data("kendoExtMaskedDatePicker");


    //조회조건 - 적용종료일
    var sEndDtPicker = $("#sEndDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:function(){
            if(dms.string.isEmpty($("#sStartDt").data("kendoDatePicker").value())){
                dms.notification.warning("<spring:message code='global.info.fromDate.input' />");
                this.value("");
                return;
            }else{
                sStartDtPicker.max(kendo.parseDate(this.value(), "{0:<dms:configValue code='dateFormat' />}"));
            }
        }
    }).data("kendoExtMaskedDatePicker");


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            if( $("#sCarlineCd").data("kendoExtDropDownList").value() == "" || $("#sCarlineCd").data("kendoExtDropDownList").value() == null){
                //$("#sCarlineCd").focus();
                dms.notification.info("<spring:message code='global.lbl.carLine' var='carLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${carLine},' />"); // 차종을 선택해주세요.
                return false;
            }

            if( !($("#sStartDt").data('kendoExtMaskedDatePicker').value() == null && $("#sEndDt").data('kendoExtMaskedDatePicker').value() == null) ){
                if($("#sStartDt").data('kendoExtMaskedDatePicker').value() == null || $("#sEndDt").data('kendoExtMaskedDatePicker').value() == null){
                    //적용일을 모두 입력해 주세요
                    dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                    return false;
                }
            }

            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - 행추가
    $("#btnAdd").kendoButton({
        click:function(e){
            $('#mainGrid').data('kendoExtGrid').dataSource.insert(0, {
                 dlrCd:""
                ,carlineCd:""
                ,carlineNm:""
                ,modelCd:""
                ,modelNm:""
                ,ocnCd:""
                ,ocnNm:""
                ,prcNregYn:"Y"
                ,startDt:null
                ,endDt:null
                ,dcTotAmt1:0
                ,carDcAmt1:0
                ,goodsDcAmt1:0
                ,dcTotAmt2:0
                ,carDcAmt2:0
                ,goodsDcAmt2:0
                ,dcTotAmt3:0
                ,carDcAmt3:0
                ,goodsDcAmt3:0
            });

            var grid = $("#mainGrid").data("kendoExtGrid");
            var rows = grid.tbody.find("tr:eq(0)").closest('tr');
            rows.addClass("k-state-selected");
        }
    });

    //버튼 - 행삭제
    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#mainGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);

                if( dataItem.isNew() ){
                    grid.removeRow(row);
                }else{
                    // 저장된 내역은 삭제가 불가 합니다.
                    dms.notification.info("<spring:message code='sal.info.positionsDiscountDel' />");
                }
            });
        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#mainGrid').data('kendoExtGrid').cancelChanges();
        }
    });


    $("#btnSave").kendoButton({
        //icon:"plus",
        click:function(e){

            var grid = $("#mainGrid").data("kendoExtGrid");

            if(validator()){

                if(!confirm("<spring:message code='global.lbl.save' var='save' /><spring:message code='global.info.cnfrmMsg' arguments='${save},' />")){ //저장하시겠습니까?
                    return;
                }
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                if(grid.cudDataLength == 0){
                  //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                $.ajax({
                    url:"<c:url value='/sal/mst/positionsDiscount/multiPositionsDiscountAmt.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error){
                        dms.notification.error(error);
                    },
                    success:function(jqXHR, textStatus){
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        }
    });


    //그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0907-180505"
        ,dataSource:{

            transport:{
                read:{
                    url:"<c:url value='/sal/mst/positionsDiscount/selectPositionsDiscountAmt.do' />"
                }
               ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var sModelCd = "";
                        var sFscCd = "";

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarlineCd"] = $("#sCarlineCd").val();

                        if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                            sModelCd = $("#hiddenFscCode").val();
                        }else{
                            sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                        }

                        params["sFscCd"]   = sFscCd;    // fsc코드
                        params["sModelCd"]   = sModelCd;    // 모델

                        params["sOcnCd"] = $("#sOcnCd").val();
                        params["sStartDt"] = $("#sStartDt").data('kendoExtMaskedDatePicker').value();
                        params["sEndDt"] = $("#sEndDt").data('kendoExtMaskedDatePicker').value();

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
               ,model:{
                    id:"rnum"
                   ,fields:{
                        dlrCd      :{type:"string"}
                       ,carlineCd  :{type:"string"}
                       ,carlineNm  :{type:"string"}
                       ,modelCd    :{type:"string"}
                       ,modelNm    :{type:"string"}
                       ,ocnCd      :{type:"string"}
                       ,ocnNm      :{type:"string"}
                       ,prcNregYn  :{type:"string"}
                       ,startDt    :{type:"date"}
                       ,endDt      :{type:"date"}
                       ,dcTotAmt1  :{type:"number"}
                       ,carDcAmt1  :{type:"number"}
                       ,goodsDcAmt1:{type:"number"}
                       ,dcTotAmt2  :{type:"number"}
                       ,carDcAmt2  :{type:"number"}
                       ,goodsDcAmt2:{type:"number"}
                       ,dcTotAmt3  :{type:"number"}
                       ,carDcAmt3  :{type:"number"}
                       ,goodsDcAmt3:{type:"number"}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:475
       ,selectable:"row"
       ,autoBind:false
       ,scrollable:true
       ,filterable:false
       ,edit:function (e){

           var fieldName = e.container.find("input[name][data-bind]").attr("name");

           if (e.model.isNew()) {
               var selectedItem = e.sender.dataItem(e.sender.select()[0]);
               if(fieldName == "modelCd"){
                   if(selectedItem.carlineCd == "" || modelCdDSList == null || modelCdDSList.length == 0){
                       this.closeCell();
                   }
               }
               if(fieldName == "ocnCd"){
                   if(selectedItem.modelCd == "" || ocnCdDSList == null || ocnCdDSList.length == 0){
                       this.closeCell();
                   }
               }
           }else{
               if (fieldName == "carlineCd" || fieldName == "modelCd" || fieldName == "ocnCd" || fieldName == "endDt") {
                   this.closeCell();
               }
           }


           if( fieldName == "dcTotAmt1" || fieldName == "dcTotAmt2" || fieldName == "dcTotAmt3"){
               this.closeCell();
           }

           e.container.find("input[name=carDcAmt1]").keyup(function(){
               var data = e.model;

               data.set( "dcTotAmt1", Number($(this).val().replace(/\,/gi,"")) + Number(data.goodsDcAmt1) );
           });
           e.container.find("input[name=goodsDcAmt1]").keyup(function(){
               var data = e.model;

               data.set( "dcTotAmt1", Number(data.carDcAmt1) + Number($(this).val().replace(/\,/gi,"")) );
           });

           e.container.find("input[name=carDcAmt2]").keyup(function(){
               var data = e.model;

               data.set( "dcTotAmt2", Number($(this).val().replace(/\,/gi,"")) + Number(data.goodsDcAmt2) );
           });
           e.container.find("input[name=goodsDcAmt2]").keyup(function(){
               var data = e.model;

               data.set( "dcTotAmt2", Number(data.carDcAmt2) + Number($(this).val().replace(/\,/gi,"")) );
           });

           e.container.find("input[name=carDcAmt3]").keyup(function(){
               var data = e.model;

               data.set( "dcTotAmt3", Number($(this).val().replace(/\,/gi,"")) + Number(data.goodsDcAmt3) );
           });
           e.container.find("input[name=goodsDcAmt3]").keyup(function(){
               var data = e.model;

               data.set( "dcTotAmt3", Number(data.carDcAmt3) + Number($(this).val().replace(/\,/gi,"")) );
           });
       }
       ,columns:[
            {field:"dlrCd",  hidden:true} //딜러코드
            ,{      // 차종
                field:"carlineCd"
               ,title:"<spring:message code='global.lbl.carlineCd' />"
               ,width:90
               ,headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
               ,attributes:{"class":"ac"}
               ,template:"#=bf_selectCarLine(carlineCd)#"
               ,editor:function (container, options){

                   if( options.model.rnum == "" || options.model.carlineCd == ""){
                       $('<input name="carlineCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:false
                           , dataTextField:"carlineNm"
                           , dataValueField:"carlineCd"
                           , dataSource:carLineCdDSList
                           , select:selectGridCarlineCd
                           , change:function(e){
                               if(modelCdDSList == null){return false;}

                               var grid = $("#mainGrid").data("kendoExtGrid");
                               var modelCell = grid.tbody.find(">tr:eq("+ grid.select().index() + ") >td:eq(3)");
                               grid.editCell(modelCell);
                           }
                       });
                   }else{
                       container.context.innerText = dms.string.strNvl(carLineCdObj[options.model.carlineCd]);
                   }
               }
            }
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", hidden:true}       // 차종명
            ,{    // 모델
                field:"modelCd",   title:"<spring:message code='global.lbl.model' />", width:150
                , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                ,template:"#= bf_selectModel(modelCd, modelNm) #"
                ,editor:function (container, options){
                    $('<input name="modelCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"modelNm"
                        ,dataValueField:"modelCd"
                        ,dataSource:modelCdDSList
                        , select:selectGridModelCd
                        , change:function(e){
                            if(ocnCdDSList == null){return false;}

                            var grid = $("#mainGrid").data("kendoExtGrid");
                            var ocnCell = $("#mainGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(5)");
                            grid.editCell(ocnCell);
                        }
                    });
                }
            }
            ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", hidden:true}       // 모델명
            ,{    // OCN
                field:"ocnCd",   title:"<spring:message code='global.lbl.ocn' />", width:140
                , headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
                ,template:"#= bf_selectOcn(ocnCd, ocnNm) #"
                ,editor:function (container, options){
                    $('<input name="ocnCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"ocnNm"
                        ,dataValueField:"ocnCd"
                        ,dataSource:ocnCdDSList
                        ,select:function (e){
                            var dataItem = this.dataItem(e.item);
                            var grid = $("#mainGrid").data("kendoExtGrid");
                            var selectRow = grid.dataItem(grid.select());
                            selectRow.set("ocnNm", dataItem.ocnNm);
                            selectRow.set("dirty", "true");
                        }
                        ,change:function(e){
                            var grid = $("#mainGrid").data("kendoExtGrid");
                            var extColorCell = $("#mainGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(7)");
                            grid.editCell(extColorCell);
                        }
                    });
                }
            }
            ,{field:"ocnNm", title:"ocnNm", hidden:true}       // OCN명
            ,{field:"prcNregYn", title:"<spring:message code='sal.lbl.prcRegYn' />"
                ,width:130, attributes:{"class":"ac"}
                ,template:"#= dms.string.strNvl(ynObj[prcNregYn]) #"
                ,editor:function (container, options){
                    $('<input required name="prcNregYn" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                             autoBind:false
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,dataSource:dms.data.cmmCdFilter(ynList)
                            ,change:function(e){
                                var grid = $("#mainGrid").data("kendoExtGrid");
                                var extColorCell = $("#mainGrid tbody").find(">tr:eq("+ grid.select().index() + ") >td:eq(8)");
                                grid.editCell(extColorCell);
                            }
                    });
                }
            } //가격 미등록 대상여부
           ,{field:"startDt"
               ,title:"<spring:message code = 'sal.lbl.startDt'/>"
                   ,width:80
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input required name="startDt" data-name="<spring:message code='sal.lbl.startDt' />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"<dms:configValue code='dateFormat' />"
                          ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       });
                       $('<span class="k-invalid-msg" data-for="startDt"></span>').appendTo(container);
                    }
            }//적용시작일
           ,{field:"endDt"
               ,title:"<spring:message code = 'sal.lbl.endDt'/>"
                   ,width:80
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input name="endDt" idata-name="<spring:message code='sal.lbl.endDt' />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"<dms:configValue code='dateFormat' />"
                          ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       });
                       $('<span class="k-invalid-msg" data-for="endDt"></span>').appendTo(container);
                    }
            }//적용종료일
           ,{title:"<spring:message code = 'sal.lbl.salesAdvisor'/>"      ,attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //판매고문
               columns:[{field:"dcTotAmt1" ,title:"<spring:message code = 'global.lbl.dcAmt'/>"
                            , width:70, attributes:{"class":"ar"}, format:"{0:n2}"}   //할인금액
                       ,{field:"carDcAmt1"   ,title:"<spring:message code = 'sal.lbl.carDcAmt'/>"
                            , width:70, attributes:{"class":"ar"}, format:"{0:n2}"
                            , editor:function (container, options){
                                $('<input required name="carDcAmt1" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                    format:"n2"
                                   ,decimals:2                // 소숫점
                                   ,spinners:false             // 증,감 화살표
                                });
                                $('<span class="k-invalid-msg" data-for="carDcAmt1"></span>').appendTo(container);
                              }
                        }   //차값 할인
                       ,{field:"goodsDcAmt1"     ,title:"<spring:message code = 'sal.lbl.goodsDcAmt'/>"
                            , width:100, attributes:{"class":"ar"}, format:"{0:n2}"
                            , editor:function (container, options){
                                $('<input required name="goodsDcAmt1" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                    format:"n2"
                                   ,decimals:2                // 소숫점
                                   ,spinners:false             // 증,감 화살표
                                });
                                $('<span class="k-invalid-msg" data-for="goodsDcAmt1"></span>').appendTo(container);
                            }
                        } //용품/부가 할인
                       ]
            }
           ,{title:"<spring:message code = 'sal.lbl.salesFinanace'/>"      ,attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //판매고문
               columns:[{field:"dcTotAmt2" ,title:"<spring:message code = 'global.lbl.dcAmt'/>"
                            , width:70, attributes:{"class":"ar"}, format:"{0:n2}"}   //할인금액
                       ,{field:"carDcAmt2"   ,title:"<spring:message code = 'sal.lbl.carDcAmt'/>"
                            , width:70, attributes:{"class":"ar"}, format:"{0:n2}"
                            , editor:function (container, options){
                                $('<input required name="carDcAmt2" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                    format:"n2"
                                   ,decimals:2                // 소숫점
                                   ,spinners:false             // 증,감 화살표
                                });
                                $('<span class="k-invalid-msg" data-for="carDcAmt2"></span>').appendTo(container);
                            }
                        }   //차값 할인
                       ,{field:"goodsDcAmt2"     ,title:"<spring:message code = 'sal.lbl.goodsDcAmt'/>"
                            , width:100, attributes:{"class":"ar"}, format:"{0:n2}"
                            , editor:function (container, options){
                                $('<input required name="goodsDcAmt2" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                    format:"n2"
                                   ,decimals:2                // 소숫점
                                   ,spinners:false             // 증,감 화살표
                                });
                                $('<span class="k-invalid-msg" data-for="goodsDcAmt2"></span>').appendTo(container);
                            }
                       } //용품/부가 할인
                       ]
            }
           ,{title:"<spring:message code = 'sal.lbl.totFinanace'/>"      ,attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //판매고문
               columns:[{field:"dcTotAmt3" ,title:"<spring:message code = 'global.lbl.dcAmt'/>"
                            , width:70, attributes:{"class":"ar"}, format:"{0:n2}"
                        }   //할인금액
                       ,{field:"carDcAmt3"   ,title:"<spring:message code = 'sal.lbl.carDcAmt'/>"
                            , width:70, attributes:{"class":"ar"}, format:"{0:n2}"
                            , editor:function (container, options){
                                $('<input required name="carDcAmt3" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                    format:"n2"
                                   ,decimals:2                // 소숫점
                                   ,spinners:false             // 증,감 화살표
                                });
                                $('<span class="k-invalid-msg" data-for="carDcAmt3"></span>').appendTo(container);
                            }
                        }   //차값 할인
                       ,{field:"goodsDcAmt3"     ,title:"<spring:message code = 'sal.lbl.goodsDcAmt'/>"
                            , width:100, attributes:{"class":"ar"}, format:"{0:n2}"
                            , editor:function (container, options){
                                $('<input required name="goodsDcAmt3" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                    format:"n2"
                                   ,decimals:2                // 소숫점
                                   ,spinners:false             // 증,감 화살표
                                });
                                $('<span class="k-invalid-msg" data-for="goodsDcAmt3"></span>').appendTo(container);
                            }
                        } //용품/부가 할인
                       ]
            }
        ]
    });


});


/**
 * 차종에 따른 모델 조회
 */
function selectGridCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#mainGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("modelCd", "");
    selectRow.set("modelNm", "");
    selectRow.set("ocnCd", "");
    selectRow.set("ocnNm", "");
    selectRow.set("dirty", "true");

    var mData = [{"modelCd":"ALL", "modelNm":"ALL"}];

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/mst/positionsDiscount/selectModel.do"
        ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
        ,async:false
    });

    if(responseJson.total > 0){
        responseJson.data = mData.concat(responseJson.data);
    }
    modelCdDSList = responseJson.data;

    modelCdObj = [];
    if(modelCdDSList != null){
        $.each(modelCdDSList, function(idx, obj){
            modelCdObj[obj.modelCd] = obj.modelNm;
        });
    }
};

// 모델에 따른 OCN 조회
function selectGridModelCd(e) {
    var dataItem = this.dataItem(e.item);
    var grid = $("#mainGrid").data("kendoExtGrid");
    var selectRow = grid.dataItem(grid.select());
    selectRow.set("modelNm", dataItem.modelNm);
    selectRow.set("ocnCd", "");
    selectRow.set("ocnNm", "");
    selectRow.set("dirty", "true");

    var oData = [{"ocnCd":"ALL", "ocnNm":"ALL"}];

    var responseJson = dms.ajax.getJson({
        url:_contextPath + "/sal/mst/positionsDiscount/selectOcn.do"
        ,data:JSON.stringify({"modelCd":dataItem.modelCd})
        ,async:false
    });

    if(responseJson.total > 0){
        responseJson.data = oData.concat(responseJson.data);
    }

    ocnCdDSList = responseJson.data;

    ocnCdObj = [];
    if(ocnCdDSList != null){
        $.each(ocnCdDSList, function(idx, obj){
            ocnCdObj[obj.ocnCd] = obj.ocnNm;
        });
    }

    // 모델을 ALL을 선택 했을 시, OCN은 ALL 세팅
    if(dataItem.modelCd == "ALL"){
        ocnCdDSList = [{"ocnCd":"ALL", "ocnNm":"ALL"}];
        ocnCdObj["ALL"] = "ALL";

        selectRow.set("ocnCd", "ALL");
        selectRow.set("ocnNm", "ALL");
    }

};
//1 Grid- 차종의 template 정의
function bf_selectCarLine(carlineCd) {
    if(carlineCd == ""){
        return "";
    }else{
        return dms.string.strNvl(carLineCdObj[carlineCd]);
    }
}

//2 Grid- 모델의 template 정의
function bf_selectModel(modelCd, modelNm){
    if(modelNm != ""){
        return modelNm;
    }
    if(modelCd == ""){
        return "";
    }
    return dms.string.strNvl(modelCdObj[modelCd]);
}

//3 Grid - OCN의 template 정의
function bf_selectOcn(ocnCd, ocnNm){
    if(ocnNm != ""){
        return ocnNm;
    }
    if(ocnCd == ""){
        return "";
    }
    return dms.string.strNvl(ocnCdObj[ocnCd]);
}
</script>