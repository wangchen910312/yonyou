<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.tacticsDeliveryApprove' /></h1> <!-- 전략출고심사 -->
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12409" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnConfirm" class="btn_m"><spring:message code='global.btn.approval' /></button>        <!-- 승인 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12408" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnNonConfirm"  class="btn_m"><spring:message code='sal.btn.reject' /></button>         <!-- 거절 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12407" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button><!-- 조회 -->
        </dms:access>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.evalStatus' /></th> <!-- 심사상태 -->
                    <td>
                        <input id="sReqStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th> <!-- 신청일자 -->
                    <td class="bor_none">
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStrAskStratDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sStrAskDtEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.approveDt' /></th> <!-- 승인일자 -->
                    <td class="bor_none">
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sApproveStratDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sApproveEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.division' /></th>  <!-- 사업부 -->
                    <td>
                        <input id="sDiviCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.officeNm' /></th>     <!-- 사무소 -->
                    <td>
                        <input id="sOffCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>     <!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" class="form_input" onkeyup="this.value=this.value.toUpperCase()"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox" />
                        <input id="hiddenFscCode" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th>     <!-- VIN -->
                    <td>
                        <input id="sVinNo" class="form_input" maxlength="17" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
</section>
</div>

<script>
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

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

var toDay = "${toDay}";         //현재일자
var oneDay = "${oneDay}";       // 해당월 1일

//승인여부 SAL190
var approveDSList = [];
var approveCdObj = {};
<c:forEach var="obj" items="${approveDS}">
  <c:if test="${obj.cmmCd ne 'D' and obj.cmmCd ne 'E' and obj.cmmCd ne 'X' }">
      approveDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:if>
approveCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/**
 * 차종 콤보
 */
 var carLineCdList = [];
 <c:forEach var="obj" items="${carLineCdInfo}">
   carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
 </c:forEach>

//사업부
var divisionCdDs = [];
<c:forEach var="obj" items="${sdptCdList}">
    divisionCdDs.push({"diviCd":"${obj.sdptCd}", "diviNm":"${obj.sdptNm}"});
</c:forEach>
var divisionCdArr = dms.data.arrayToMap(divisionCdDs, function(obj){return obj.cmmCd});

$(document).ready(function() {

    $("#btnSearch").kendoButton({       // 조회
        enable:true,
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnConfirm").kendoButton({      // 승인
        enable:true,
        click:function(e){
            confirm('Y');
        }
    });

    $("#btnNonConfirm").kendoButton({   // 삭제:불승인
        enable:true,
        click:function(e){
            confirm('N');
        }
    });

    //승인 , 불승인
    confirm = function(appr){
        var vo = [], param = {}, saveUrl = "", isReqStatCd = "", msg = "";
        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();

        if(rows.length  == 0 ){
            dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
            return false;
        }

        rows.each(function(index, row) {
            var row = grid.dataItem(row);

            if( dms.string.strNvl(row.strStat) != "A"){
                isReqStatCd = dms.string.strNvl(row.strStat);
            }

            vo.push({dlrCd:row.dlrCd, vinNo:row.vinNo, strNo:row.strNo, carId:row.carId});
        });

        if(dms.string.isNotEmpty(isReqStatCd)){
            // [불승인 or 승인] 처리 건이 존재합니다.
            dms.notification.warning("["+approveCdObj[isReqStatCd]+"] <spring:message code='sal.info.CoercionApprovChkMsg' />" );
            return ;
        }

        param = {list:vo};

        if(appr == 'Y'){
            saveUrl = "<c:url value='/sal/dlv/vehicleDelivery/confirmDelivery.do' />";
            msg = "<spring:message code='global.btn.approval' var='btnApproval' /><spring:message code='global.info.cnfrmMsg' arguments='${btnApproval}' />";
        }else{
            saveUrl = "<c:url value='/sal/dlv/vehicleDelivery/rejectDelivery.do' />";
            msg = "<spring:message code='sal.btn.reject' var='btnReject' /><spring:message code='global.info.cnfrmMsg' arguments='${btnReject}' />";
        }

        dms.window.confirm({
            message:msg
            ,title :"<spring:message code='global.lbl.info' />"
            ,callback:function(result){
                if(result){
                    dms.loading.show();
                    $.ajax({
                        url:saveUrl,
                        data:JSON.stringify(param),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.loading.hide();
                            $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
                            $("#grid").data("kendoExtGrid").dataSource.page(1);
                            if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }else{
                                dms.notification.error(error);
                            }
                        },
                        success:function(jqXHR, textStatus) {
                            dms.loading.hide();
                            $("#grid").data("kendoExtGrid").dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });

                }else{
                    return false;
                }
            }

        });
    }

    //사업부
    $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"diviNm"
       ,dataValueField:"diviCd"
       ,dataSource:divisionCdDs
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOffCd").data("kendoExtDropDownList").enable(true);


           if(dataItem.diviCd == ""){
               $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOffCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
               ,data:JSON.stringify({"sSdptCd":dataItem.diviCd})
               ,async:false
           });
           $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           //$("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
       }
    });

    // 사무소
    $("#sOffCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
       ,dataValueField:"distOfficeCd"
       ,optionLabel:" "   // 전체
    });
    $("#sOffCd").data("kendoExtDropDownList").enable(false);

    // 승인여부
    $("#sReqStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:approveDSList
       ,optionLabel:" "
       ,index:1
    });

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
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // 신청일자:시작일
    $("#sStrAskStratDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });
    // 신청일자:종료일
    $("#sStrAskDtEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 승인일자:시작일
    $("#sApproveStratDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });
    // 승인일자:종료일
    $("#sApproveEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    // 메인 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-1129-172101"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/dlv/vehicleDelivery/selectTacticsDeliveryReq.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        var sModelCd = "";
                        var sFscCd = "";

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //심사상태
                        params["sReqStatCd"] = $("#sReqStatCd").data("kendoExtDropDownList").value();

                        // 신청일자
                        params["sStrAskStratDt"] = $("#sStrAskStratDt").data("kendoExtMaskedDatePicker").value();
                        params["sStrAskDtEndDt"] = $("#sStrAskDtEndDt").data("kendoExtMaskedDatePicker").value();

                        //심사일자
                        params["sApproveStratDt"] = $("#sApproveStratDt").data("kendoExtMaskedDatePicker").value();
                        params["sApproveEndDt"] = $("#sApproveEndDt").data("kendoExtMaskedDatePicker").value();

                        //사업부
                        params["sDiviCd"] = $("#sDiviCd").data("kendoExtDropDownList").value();

                        //판사처
                        params["sOffCd"] = $("#sOffCd").data("kendoExtDropDownList").value();

                        //딜러코드
                        params["sDlrCd"] = $("#sDlrCd").val();

                        //차형
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();

                        if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                            sModelCd = $("#hiddenFscCode").val();
                        }else{
                            sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                        }

                        params["sFscCd"]   = sFscCd;    // fsc코드
                        params["sModelCd"]   = sModelCd;    // 모델

                        //VIN_NO
                        params["sVinNo"] = $("#sVinNo").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"tatics",
                    fields:{
                     rownum        :{type:"string"}            //일련번호
                    ,strStat       :{type:"string"}            //요청상태(승인/불승인 상태 여부)
                    ,dlrCd         :{type:"string"}            //딜러코드
                    ,dlrNm         :{type:"string"}            //딜러명
                    ,sdptNm        :{type:"string"}            //사업부명
                    ,distOfficeNm  :{type:"string"}            //판사처명
                    ,vinNo         :{type:"string"}            //VIN NO
                    ,carlineNm     :{type:"string"}            //차종명
                    ,modelNm       :{type:"string"}            //차관명
                    ,strAskDt  :{type:"date"}              //심사일자
                    ,strConfirmDt  :{type:"date"}              //심사일자
                    ,custSaleDt    :{type:"date"}              //출고일자
                    ,carId         :{type:"string"}            //carId
                    }
                }
            }
            ,requestEnd:function(e){if(e.type =="read"){$(".checkAll").prop("checked", false);}}
        }
        ,change:function(e) {

            var that = this;
            var rows = this.select();
            $.each(rows, function(idx, row){
                if(that.dataItem(row).strStat != "A"){
                    that.clearSelection(row);
                }
            });

         }
         ,dataBound:function(e) {

            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);

                if(dataItem.strStat != "A"){
                    $(row).css("background-color", "#E0E0E0");
                    $(".grid-checkbox-item", row).each(function(){
                        $(this).prop("disabled", true);
                    });
                }
            });
        }
       ,multiSelectWithCheckbox:true
       ,editable:false
       ,pageable: {refresh: true}    //tianjx  出库审批管理 显示分页
       ,autoBind:false
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[
           {field:"rnum"       , title:"<spring:message code='sal.lbl.numberSeq' />", width:40, attributes:{"class":"ac"}}                               // 번호
          ,{field:"strStat"     ,title:"<spring:message code='sal.lbl.evalStatus' />",width:85, attributes:{"class":"al"}, template:"#=dms.string.strNvl(approveCdObj[strStat])#"}  // 심사상태
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:50, attributes:{"class":"ac"}}                                      // 딜러코드
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:150, attributes:{"class":"al"}}                                     // 딜러명
          ,{field:"sdptNm", title:"<spring:message code='sal.lbl.sdpt' />", width:80, attributes:{"class":"al"}}                                         // 사업부명
          ,{field:"distOfficeNm", title:"<spring:message code='sal.lbl.distOffice' />", width:80, attributes:{"class":"al"}}                             // 판사처명
          ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:140, attributes:{"class":"ac"}}                                     // vin
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine'/>", width:100, attributes:{"class":"al"}}                                // 차종
          ,{field:"modelNm", title:"<spring:message code='global.lbl.model'/>", width:120, attributes:{"class":"al"}}                                    // 차관

          ,{field:"strAskDt", title:"<spring:message code='global.lbl.fincReqDt' />", width:80, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"}    // 신청일자
          ,{field:"strConfirmDt", title:"<spring:message code='sal.lbl.confirmDt' />", width:80, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"}    // 심사일자

          ,{field:"custSaleDt", title:"<spring:message code='sal.lbl.saleDt'/>"//出场日期修改为零售日期
              ,width:90
              ,headerAttributes:{style:"text-align:center;"}
              ,format:"{0:<dms:configValue code='dateFormat' />}"
              ,attributes:{ "style":"text-align:center"}
           }                                                                                                                                              // 출고일자
          ,{field:"carId"         ,hidden:true  }
          //,{field:"reqDt", title:"<spring:message code='global.lbl.fincReqDt' />", width:80, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"}   // 신청일자
       ]
   });

    function checkBtn(){
        var isReqStatCd = "";
        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();

        rows.each(function(index, row) {
            var row = grid.dataItem(row);

            if( dms.string.strNvl(row.strStat) != "A"){
                isReqStatCd = dms.string.strNvl(row.strStat);
            }
        });

        if(dms.string.isNotEmpty(isReqStatCd)){
            $("#btnConfirm").data("kendoButton").enable(false);
            $("#btnNonConfirm").data("kendoButton").enable(false);
        }else{
            $("#btnConfirm").data("kendoButton").enable(true);
            $("#btnNonConfirm").data("kendoButton").enable(true);
        }
    }

});
</script>