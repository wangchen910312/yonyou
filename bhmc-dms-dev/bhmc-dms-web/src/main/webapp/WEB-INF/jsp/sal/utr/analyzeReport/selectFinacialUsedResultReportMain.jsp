<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="header_area">
    <div class="btn_right">
        <dms:access viewId="VIEW-D-11194" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_s btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
        </dms:access>
    </div>
</div>

<div class="table_form">
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
                <th scope="row"><spring:message code='global.lbl.contractDt' /></th>  <!-- 계약일자 -->
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
                <th scope="row"><spring:message code='global.lbl.customer' /></th>    <!-- 고객 -->
                <td>
                    <div class="form_float">
                        <div class="form_left">
                            <div class="form_search">
                                <input id="vContractCustNm" class="form_input onKey_up onKey_bulr" >
                                <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                <input id="sContractCustNm" type="hidden" />
                            </div>
                        </div>
                        <div class="form_right">
                            <input id="sContractCustNo" readonly class="form_input form_readonly">
                        </div>
                    </div>
                </td>
                <th scope="row"><spring:message code='global.lbl.carLine' /></th>  <!-- 차종 -->
                <td>
                    <input id="sCarlineCd" type="text" class="form_comboBox" />
                </td>
                <th scope="row"></th>
                <td></td>
            </tr>
        </tbody>
    </table>
</div>

<br>

<div class="table_info table_info_v1">
    <form id="frmTotalStatus" method="post">
        <iframe id="iframeSubTotalStatus" src="" frameborder="0" scrolling="auto" width="100%" height="600"></iframe>
    </form>
</div>

<!-- script -->
<script type="text/javascript">

var userId = "${userId}";
var userNm = "${userNm}";
var dlrCd  = "${dlrCd}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후

//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

$(document).ready(function() {


    // 계약 시작일
    $("#sStartContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    // 계약 종료일
    $("#sEndContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "
    });

    // 조회 - 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            subTotalStatusCall();
        }
    });

    subTotalStatusCall();

});

// 레포트화면 호출
function subTotalStatusCall(){
    var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=sale/selectFinacialUsedResult.cpt' />"
      , param = "";

    param += "&sDlrCd="+dlrCd;
    param += "&sCarlineCd="+$("#sCarlineCd").data("kendoExtDropDownList").value();
    param += "&sContractCustNo="+$("#sContractCustNo").val();
    param += "&sStartContractDt="+kendo.toString($("#sStartContractDt").data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");
    param += "&sEndContractDt="+kendo.toString($("#sEndContractDt").data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");

    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}


//고객명 enter
$(".onKey_bulr").blur(function(e){
    var cId = dms.string.strNvl($(this).context.id);
    if(cId != ""){
        $("#sContractCustNo").val('');
    }
});

// 고객명 enter
$(".onKey_up").keyup(function(e){
    var cId = dms.string.strNvl($(this).context.id);
    if(cId == ""){
        return ;
    }

    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchCustomer();
        }
    }else{
        $("#sContractCustNo").val('');
    }
});

//CRM 고객 데이터 조회
bf_searchCustomer = function(){

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":true
                , "closeYn":"Y"
                , "custNm":$("#vContractCustNm").val()
                , "type"  :null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                        $("#sContractCustNm").val(data[0].custNm);       // 고객명
                        $("#vContractCustNm").val(data[0].custNm);
                    }
                    //popupWindow.close();
                }
            }
        }
    });
}

</script>