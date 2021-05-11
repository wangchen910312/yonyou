<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 중고차 가격관리 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.usedCarPriceManagement' /></h1><!-- 중고차 가격 관리 -->
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:13%;">
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:24%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- Vin No -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" maxlength="17">
                    </td>
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
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button> <!-- 행추가 -->
            <button class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button> <!-- 행삭제 -->
            <button class="btn_s" id="btnCancel"><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
        </div>
    </div>
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>




<!-- script -->
<script>
 var sysDate = "${toDay}";


 validator = function() {

     var grid = $("#grid").data("kendoExtGrid");

     var rows = grid.tbody.find("tr");
     var check = true;

     rows.each(function(index, row) {
         var dataItem = grid.dataItem(row);

         if( dataItem.isNew() || dataItem.dirty ){
             if( dataItem.vinNo == null ){
                 dms.notification.info("<spring:message code='global.lbl.vinNum' var='vinNo' /><spring:message code='global.info.emptyCheckParam' arguments='${vinNo},' />"); // Vin No를 입력해주세요.
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
            if(dms.string.isEmpty($("#sStartDt").data("kendoExtMaskedDatePicker").value())){
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

            if( !($("#sStartDt").data('kendoExtMaskedDatePicker').value() == null && $("#sEndDt").data('kendoExtMaskedDatePicker').value() == null) ){
                if($("#sStartDt").data('kendoExtMaskedDatePicker').value() == null || $("#sEndDt").data('kendoExtMaskedDatePicker').value() == null){
                    //적용일을 모두 입력해 주세요
                    dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                    return false;
                }
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    $("#btnSave").kendoButton({
        //icon:"plus",
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");

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
//console.log(JSON.stringify(saveData));
                $.ajax({
                    url:"<c:url value='/sal/uva/usedCarPriceManagement/multiUsedCarPriceManagement.do' />",
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
            }
        }
    });

    //버튼 - 행추가
    $("#btnAdd").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                dlrCd     :""
                ,vinNo    :""
                ,startDt  :null
                ,endDt    :null
                ,retlPrc  :0
                ,useYn    :"Y"
            });
        }
    });

    //버튼 - 행삭제
    $("#btnDel").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);

                if( dataItem.isNew() ){
                    grid.removeRow(row);
                }
            });
        }
    });

    //취소 - 결재 양식  취소
    $("#btnCancel").kendoButton({
        click:function(e) {

            if(!confirm("<spring:message code='global.info.cancel' />")){ //취소 하시겠습니까?
                return;
            }

            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/uva/usedCarPriceManagement/selectUsedCarPriceManagement.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#sVinNo").val();
                        params["sStartDt"] = $("#sStartDt").data('kendoExtMaskedDatePicker').value();
                        params["sEndDt"] = $("#sEndDt").data('kendoExtMaskedDatePicker').value();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                    //dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"dlrCd"
                    ,fields:{
                        dlrCd     :{type:"string"}
                        ,vinNo    :{type:"string"}
                        ,startDt  :{type:"date",validation:{required:true}}
                        ,endDt    :{type:"date",validation:{required:true}}
                        ,retlPrc  :{type:"number"}
                        ,useYn    :{type:"string"}
                    }
                }
            }
        }
        ,height:450
        ,autoBind:false
        ,edit:function(e) {
            if (!e.model.isNew()) {
                var fieldName = e.container.find("input").attr("name");
                if (fieldName == "endDt" || fieldName == "vinNo") {
                    this.closeCell();
                }
            }
        }
        ,columns:[
             {field:"dlrCd",  hidden:true} //딜러코드
            ,{field:"vinNo",     title:"<spring:message code='global.lbl.vinNum' />"
                ,width:150, attributes:{"class":"ac"}
             }//Vin No
            ,{field:"startDt"
                ,title:"<spring:message code = 'sal.lbl.startDt'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,editor:function (container, options){
                       $('<input required name="startDt" id="startDt" data-name="<spring:message code='sal.lbl.startDt' />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                          ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       });
                       $('<span class="k-invalid-msg" data-for="startDt"></span>').appendTo(container);
                   }
             }//적용시작일
            ,{field:"endDt"
                ,title:"<spring:message code = 'sal.lbl.endDt'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,editor:function (container, options){
                        $('<input required name="endDt" id="endDt" data-name="<spring:message code='sal.lbl.endDt' />" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtMaskedDatePicker({
                            format:"{0:<dms:configValue code='dateFormat' />}"
                           ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                        });
                        $('<span class="k-invalid-msg" data-for="endDt"></span>').appendTo(container);
                     }
             }//적용종료일
            ,{field:"retlPrc",     title:"<spring:message code='sal.lbl.salePrice' />"
                ,width:120, attributes:{"class":"ar"}
             }//판매가
            ,{field:"useYn",     title:"<spring:message code='crm.lbl.useYn' />"
                ,width:70, attributes:{"class":"ac"}
                ,editor:function (container, options){
                    $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                             autoBind:false
                            ,dataTextField:"userCdNm"
                            ,dataValueField:"userCd"
                            ,dataSource:[{"userCd":"Y","userCdNm":"Y"},{"userCd":"N","userCdNm":"N"}]
                    });
                }
            } //사용여부
            ,{_field:"_field",width:200}
        ]
    });

});


</script>
<!-- //script -->










