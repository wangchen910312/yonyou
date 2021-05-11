<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 대행업무 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.lbl.subServices' /></h1> <!-- 대행업무 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13083" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnPrint" type="button" class="btn_m btn_print"><spring:message code='global.btn.print' /><!-- 인쇄 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12854" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th>   <!-- 계약번호 -->
                    <td>
                        <input id="sContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vContractCustNm" class="form_input" >
                                    <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                    <input id="sContractCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.wrkTp' /></th>   <!-- 업무유형 -->
                    <td>
                        <input id="sAapWorksTp" data-type="multicombo" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th> <!-- 판매담당자 -->
                    <td>
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.contractDt' /></th>       <!-- 계약일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartContractDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndContractDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 대행업무 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 대행업무 그리드 종료 -->
</section>
</div>
<!-- //대행업무 -->

<!-- hidden값  -->
<span style="display:none">

</span>
</section>
<!-- //계약관리 화면 -->

<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var userId = "${userId}";

var toDay = "${toDay}";         // 현재일자
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

//업무유형 SAL021
var aapWorkTpList = [];
var aapWorkTpObj = {};
<c:forEach var="obj" items="${aapWrkDstinCdList}">
    aapWorkTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    aapWorkTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

var popupWindow;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    $("#sAapWorksTp").kendoExtMultiSelectDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:aapWorkTpList
        ,dataBound:function(){
            var current = this.value();
            //this._savedOld = current.slice(0);
        }
    });

    //판매담당자
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });
    $("#sSaleEmpNo").data("kendoExtDropDownList").value(userId);

    // 계약 시작일
    $("#sStartContractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:threeMonthDay
    });

    // 계약 종료일
    $("#sEndContractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    //인쇄
    $("#btnPrint").kendoButton({
        click:function(e){

            var grid = $('#grid').data('kendoExtGrid');

            var selectedItem = grid.dataItem(grid.select());

            if(dms.string.isNotEmpty(selectedItem) && dms.string.isNotEmpty(selectedItem.contractNo)) {
                //parent._createOrReloadTabMenu("<spring:message code='sal.lbl.subServices'/>", "<c:url value='/ReportServer?reportlet=sale/selectAapInfoSearchsByCondition.cpt'/>&sDlrCd="+selectedItem.dlrCd+"&sContractNo="+selectedItem.contractNo);
                var iReportParam = "&sDlrCd="+selectedItem.dlrCd+"&sContractNo="+selectedItem.contractNo;
                var iReportUrl = "<c:url value='/ReportServer?reportlet=sale/selectAapInfoSearchsByCondition.cpt' />"+iReportParam;
                var newWindow=open(iReportUrl, "<spring:message code='sal.lbl.subServices' />", 'top=0,left=0,width=800,height=750,toolbar=no,menubar=no,location=no,status=yes,directories=yes,resizable=yes,scrolling=yes,scrollbars=1');
                
            } else {
                // {대행업무 목록}을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='sal.lbl.agencyBsiLIst' var='arg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arg}' />");
            };

        }
    });

    $("#btnSearch").kendoButton({ // 조회
         enable:true,
         click:function(e){
             $('#grid').data('kendoExtGrid').dataSource.page(1);
         }
    });

   // 메인 그리드
    $("#grid").kendoExtGrid({
        gridId :"G-SAL-02022-141308"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/aap/aapInfo/selectAapInfoSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 딜러코드
                        params["sDlrCd"] = dlrCd;
                        // 계약번호
                        params["sContractNo"] = $("#sContractNo").val();
                        // 업무유형
                        params["sAapWorksTp"] = $("#sAapWorksTp").data("kendoExtMultiSelectDropDownList").value();
                        // 고객명
                        params["vContractCustNm"] = $("#vContractCustNm").val();
                        //고객
                        params["sContractCustNo"] = $("#sContractCustNo").val();
                        // 판매사원
                        params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
                        // 계약일자
                        params["sStartContractDt"] = $("#sStartContractDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndContractDt"] = $("#sEndContractDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,schema :{
                model :{
                    id :"contractNo",
                    fields :{
                        dlrCd:{type:"string", editable:false} //딜러코드
                        ,contractNo:{type:"string"}            //계약번호
                        ,custNo:{type:"string"}                //계약고객번호
                        ,custNm:{type:"string"}
                        ,aapWorkTp:{type:"string"}             //대행업무유형
                        ,realAapAmt:{type:"number"}            //금액
                        ,contractDt:{type:"date"}              //계약일
                        ,saleEmpNo:{type:"string"}             //판매사원번호
                        ,rmk:{type:"string"}
                    }
                }
            }
            ,group:{field:"contractNo", dir: "desc"}
        }
       ,indvColumnVisible :true           //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable :true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox :false    //멀티선택 적용. default :false
       ,appendEmptyColumn :true           //빈컬럼 적용. default :false
       ,enableTooltip :false               //Tooltip 적용, default :false
       ,height :434
       ,editable:false
       ,resizable:true
       ,autoBind:true
       ,groupable:true
       ,navigatable:true
       ,selectable:"row"
       ,columns :[
          {field:"dlrCd",       title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
          ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", attributes:{"class":"al"}, width:100}               //계약번호
          ,{field:"custNo", title:"<spring:message code='global.lbl.contractCustNo' />", width:150}       //계약고객번호
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"al"}, width:100}        //고객명
          ,{
              field:"aapWorkTp", title:"<spring:message code='global.lbl.wrkTp' />", attributes:{"class":"al"}, width:130
              ,template :"#= dms.string.strNvl(aapWorkTpObj[aapWorkTp]) #"
          }      //업무유형
          ,{field:"realAapAmt", title:"<spring:message code='sal.lbl.realAmt' />", attributes:{"class":"ar"}, width:100,format:"{0:n2}"}                  // 실제금액
          ,{field:"contractDt", title:"<spring:message code='global.lbl.contractDt' />", attributes:{"class":"ac"}, width:90, format:"{0:"+vDtyyyyMMdd+"}"}       //계약일
          ,{field:"saleEmpNo", title:"<spring:message code='sal.lbl.saleEmp' />", attributes:{"class":"al"}, width:90 } //판매사원명
          ,{field:"rmk", title:"<spring:message code='sal.lbl.remark' />", attributes:{"class":"al"}, width:350}   // 비고
       ]
   });

});
/******************************************
 * ready () = End =
 ******************************************/

/******************************************
 * 함수영역 - start
 ******************************************/

//고객명 event
$("#vContractCustNm").blur(function(e){
    cleanCustCheck();
});

// 고객명 enter event
$("#vContractCustNm").keyup(function(e){
    if (e.keyCode != 13) {
        cleanCustCheck();
    }
});

//고객명 변경시 고객정보 clean
function cleanCustCheck(){
    if(dms.string.strNvl($("#vContractCustNm").val()) != dms.string.strNvl($("#sContractCustNm").val()) ){
        $("#sContractCustNo").val('');
        $("#sContractCustNm").val('');
    }
}

//CRM 고객 조회
bf_searchCustomer = function(){

    var responseJson = {};
    if( dms.string.trim($("#vContractCustNm").val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sCustNm":$("#vContractCustNm").val()})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        $("#sContractCustNo").val(responseJson.data[0].custNo);       // 고객코드
        $("#sContractCustNm").val(responseJson.data[0].custNm);       // 고객명
        $("#vsContractCustNm").val(responseJson.data[0].custNm);      // 고객명
    }else{
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , modal:true
            //, draggable:false
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "custNm":$("#vContractCustNm").val()
                    , "closeYn":"Y"
                    , "type":null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#sContractCustNm").val(data[0].custNm);       // 고객명
                            $("#vsContractCustNm").val(data[0].custNm);       // 고객명
                        }
                        //popupWindow.close();
                    }
                }
            }
        });
    }
}

//-->
</script>