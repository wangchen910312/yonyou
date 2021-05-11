<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectCarSalesStatementRpt.jsp
    Description : 차량판매 명세서
    author choi Byunggwon
    since 2017. 3. 23.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 3. 23.    choi Byunggwon   최초 생성
--%>
<!-- [DMS] 차량판매 명세서 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.rpt.salescarsalesstatement" /></h1>
        <div class="btn_right">
            <%--<dms:access viewId="VIEW-D-13016" hasPermission="${dms:getPermissionMask('READ')}"> --%>
                <button class="btn_m" id="btnSearch" name="btnSearch"><spring:message code="global.btn.search" /></button>
            <%--</dms:access> --%>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.retlDt' /></span></th><!-- 소매일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" name="sStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" name="sEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.ordSetDt' /></th><!-- 오더배정일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartOrdAssDt" name="sStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndOrdAssDt" name="sEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.orderType' /></th><!-- 주문유형 -->
                    <td>
                        <input id="sOrdTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th> <!-- 판매담당자 -->
                    <td>
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 차관 -->
                    <td>
                        <input id="sFscCd" class="form_comboBox">
                        <input id="hiddenFscCode" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.enginNo' /></th><!-- 엔진번호 -->
                    <td>
                        <input id="sEnginNo" type="text" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                    <td>
                        <input type="text" id="sCustNm" name="sCustNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.channelType" /></th>  <!-- 채널유형 -->
                    <td>
                        <input id="sDstbChnCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.lv2DlrOrg" /></th>    <!-- 2급딜러 -->
                    <td>
                        <input id="sLv2DlrOrgCd" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>
                    <td class="bor_none"></td>
                </tr>
            </tbody>
        </table>
    </div>

    <br>
    <div class="table_info table_info_v1">
        <iframe id="iframeCarSalesStatementRpt" name="iframeCarSalesStatementRpt" src="" frameborder="0" scrolling="auto" width="100%" height="650" class='report'></iframe>
    </div>
</section>

<!-- script -->
<script type="text/javascript">
var dlrCd  = "${dlrCd}";

var dlrCd  = "${dlrCd}";
var userId = "${userId}";
var userNm = "${userNm}";

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매인전체 조회권한 여부
var saleAdminYn = "${saleAdminYn}";

function mainCall(){
    var rptUrl = "<c:url value='/ReportServer?reportlet=/sale/selectCarSalesStatementRpt.cpt' />";
    var param = "";

    var sVinNo = $("#sVinNo").val();
    var sCustNm = $("#sCustNm").val();
    var sStartDt = $("#sStartDt").val().replace("-","").replace("-","");
    var sEndDt = $("#sEndDt").val().replace("-","").replace("-","");
    var sCarlineCd = $("#sCarlineCd").val();
    var sFscCd = $("#sFscCd").val();
    var sEnginNo = $("#sEnginNo").val();
    var sOrdTp = $("#sOrdTp").data("kendoExtDropDownList").value();
    var sSaleEmpNo = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
    var sStartOrdAssDt = $("#sStartOrdAssDt").val().replace("-","").replace("-","");
    var sEndOrdAssDt = $("#sEndOrdAssDt").val().replace("-","").replace("-","");
    var sDstbChnCd = $("#sDstbChnCd").data("kendoExtDropDownList").value();
    var sLv2DlrOrgCd = $("#sLv2DlrOrgCd").data("kendoExtDropDownList").value();

    param += "&sVinNo="+sVinNo;                 //VIN NO
    param += "&sDlrCd="+dlrCd;                  //딜러코드
    param += "&sCustNm="+sCustNm;               //고객명
    param += "&sSearchDtFlag="+"04";            //날짜조회조건
    param += "&sStartDt="+sStartDt;             //From Dt
    param += "&sEndDt="+sEndDt;                 //TO Dt
    param += "&sCarlineCd="+sCarlineCd;         //차종
    param += "&sFscCd="+sFscCd;                 //차관
    param += "&sEnginNo="+sEnginNo;             //엔진번호
    param += "&sOrdTp="+sOrdTp;                 //주문유형
    param += "&sDateFormat="+"YYYYMMDD";
    param += "&sSaleEmpNo="+sSaleEmpNo;         //판매고문
    param += "&sStartOrdAssDt="+sStartOrdAssDt; //오더배정시작일
    param += "&sEndOrdAssDt="+sEndOrdAssDt;     //오더배정종료일
    param += "&sDstbChnCd="+sDstbChnCd;         //채널유형
    param += "&sLv2DlrOrgCd="+sLv2DlrOrgCd;     //2급딜러

    $("#iframeCarSalesStatementRpt").attr("src", rptUrl + param);
}

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
<c:if test="${saleAdminYn eq 'N' && obj.usrId eq usrId}">
    selectSaleEmpDSList.push({saleEmpNm : "[${obj.usrId}]${obj.usrNm}",saleEmpCd : "${obj.usrId}"});
</c:if>
<c:if test="${saleAdminYn eq 'Y'}">
    selectSaleEmpDSList.push({saleEmpNm : "[${obj.usrId}]${obj.usrNm}",saleEmpCd : "${obj.usrId}"});
</c:if>
</c:forEach>

//조회조건 : 날짜
var searchDtList = [];
<c:forEach var="obj" items="${searchDtList}">
    searchDtList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var searchDtMap = dms.data.arrayToMap(searchDtList, function(obj){return obj.cmmCd});

//조회조건 : 오더유형
var ordList = [];
<c:forEach var="obj" items="${ordList}">
    ordList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var ordMap = dms.data.arrayToMap(searchDtList, function(obj){return obj.cmmCd});

//차종조회
var carlineCdList = [];
var carlineCdMap = [];
<c:forEach var="obj" items="${carlineCdList}">
carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//채널유형 COM072
var dstbChnList = [];
<c:forEach var="obj" items="${dstbChnDs}">
    dstbChnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//2급딜러 리스트
var lvTwoDlrList = [];
<c:forEach var="obj" items="${lvTwoDlrDs}">
    lvTwoDlrList.push({"cmmCd":"${obj.sdlrCd}", "cmmCdNms":"${obj.sdlrNms}", "cmmCdNm":"${obj.sdlrNm}"});
</c:forEach>

$(document).ready(function() {

    //판매담당자
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    if(saleEmpYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").value(userId);
    }else{
        $("#sSaleEmpNo").data("kendoExtDropDownList").value("");
    }
    if(saleAdminYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(true);
    }else{
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(false);
    }

    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sEndDt}"
    });

    $("#sStartOrdAssDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#sEndOrdAssDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carlineCdList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);

           $("#hiddenFscCode").val("");

           if(dataItem.carlineCd == ""){
               $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sFscCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           $.ajax({
               url : "<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do'/>",
               data : JSON.stringify({"sCarlineCd" : dataItem.carlineCd}),
               type : "POST",
               dataType : "json",
               contentType : "application/json",
               async : false,
               error : function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               },
               success : function(data) {
                   var responseJson = JSON.parse(JSON.stringify(data));
                   $("#sFscCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
                   $("#sFscCd").data("kendoExtDropDownList").enable(true);
               }
           });
       }
    });

    // 모델
    $("#sFscCd").kendoExtDropDownList({
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,optionLabel:" "   // 전체
       ,enable:false
    });

    // 오더타입
    $("#sOrdTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , dataSource:ordList
       , optionLabel:" "
    });


    // 채널유형
    $("#sDstbChnCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(dstbChnList)
       ,optionLabel:" "
    });

    // 2급딜러
    $("#sLv2DlrOrgCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNms"
       ,dataValueField :"cmmCd"
       ,dataSource:lvTwoDlrList
       ,optionLabel:" "
    });

    var now = new Date();

    function leadingZeros(n, digits) {
        var zero = '';
        n = n.toString();
        if (n.length < digits) {
            for (i = 0; i < digits - n.length; i++)
                zero += '0';
        }
        return zero + n;
    }


    $("#btnSearch").kendoButton({
        click:function(e) {

            if (dms.string.isEmpty($("#sStartDt").val())){
                dms.notification.warning("<spring:message code='sal.lbl.retlDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#sStartDt").focus();
                return false;
            }

            if (dms.string.isEmpty($("#sEndDt").val())){
                dms.notification.warning("<spring:message code='sal.lbl.retlDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#sEndDt").focus();
                return false;
            }

            mainCall();
           }
    });

    mainCall();



});
</script>
<!-- //[DMS] 차량판매 명세서 -->