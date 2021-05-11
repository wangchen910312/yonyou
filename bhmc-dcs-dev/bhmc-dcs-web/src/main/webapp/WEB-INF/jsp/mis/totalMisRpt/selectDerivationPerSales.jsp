<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectDerivationPerSales.jsp
    Description : [DCS] 파생 제품 침투율(판매고문별)
    author chibeom.song
    since 2017. 1. 11.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 1. 11.   chibeom.song     최초 생성
--%>

<!-- [DCS] 파생 제품 침투율(판매고문별) -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.menu.derivationpersales" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12819" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m" id="btnSearch" name="btnSearch"><spring:message code="global.btn.search" /></button>
            </dms:access>
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.title.searchCondition" /></th>
                    <td>
                        <input type="text" id="sSrartYyMm" name="sSrartYyMm" value="" class="form_comboBox" style="width:80px;">
                        ~
                        <input type="text" id="sEndYyMm" name="sEndYyMm" value="" class="form_comboBox" style="width:80px;">
                    </td>
                    <th scope="row"><spring:message code="mis.lbl.division" /></th>
                    <td><input type="text" id="sSdptCd" name="sSdptCd" class="form_comboBox"></td>
                    <th scope="row"><spring:message code="mis.lbl.officeNm" /></th>
                    <td><input type="text" id="sOfficeCd" name="sOfficeCd" class="form_comboBox" style="width:150px;"></td>
                    <th scope="row"><spring:message code="mis.lbl.dealerNm" /></th>
                    <td><input type="text" id="sDealerCd" name="sDealerCd" class="form_comboBox" style="width:150px;"></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="mis.lbl.empNm" /></th>
                    <td><input type="text" id="sEmpNm" name="sEmpNm" style="width:215px;"></td>
                </tr>
            </tbody>
        </table>
    </div>
    <br>
    <div class="table_info table_info_v1">
        <iframe id="iframeDerivationPerSales" name="iframeDerivationPerSales" src="" frameborder="0" scrolling="no" width="100%" height="750"></iframe>
    </div>
</section>


<!-- script -->
<script type="text/javascript">

function mainCall(){
    var derivationpersalesUrl = "<c:url value='/ReportServer?reportlet=/mis/selectDerivationPerSales.cpt' />";
    $("#iframeDerivationPerSales").attr("src", derivationpersalesUrl);
}

$(document).ready(function() {

    var sdptList = [{"sdptCd":"", "sdptNm":""}];
    <c:forEach var="obj" items="${sdptList}">
    sdptList.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
    </c:forEach>

    var officeList = [{"officeCd":"", "officeNm":""}];
    <c:forEach var="obj" items="${officeList}">
    officeList.push({"officeCd":"${obj.officeCd}", "officeNm":"${obj.officeNm}"});
    </c:forEach>

    var dealerList = [{"dlrCd":"", "dlrNm":""}];
    <c:forEach var="obj" items="${dealerList}">
    dealerList.push({"dlrCd":"${obj.dlrCd}", "dlrNm":"${obj.dlrNm}"});
    </c:forEach>

    $("#sSrartYyMm").kendoDatePicker({
         value:"${sysdate}"
        ,start:"year"
        ,depth:"year"
        ,format:"yyyyMM"
    });

    $("#sSrartYyMm").kendoMaskedTextBox({
        mask:"######"
    });

    $("#sEndYyMm").kendoDatePicker({
        value:"${sysdate}"
       ,start:"year"
       ,depth:"year"
       ,format:"yyyyMM"
   });

   $("#sEndYyMm").kendoMaskedTextBox({
       mask:"######"
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

    $("#sSrartYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));
    $("#sEndYyMm").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

    $("#sSdptCd").kendoExtDropDownList({
        dataSource:sdptList
        ,dataTextField:"sdptNm"
        ,dataValueField:"sdptCd"
        ,index:0
        ,select:function(e){

            var dataItem = this.dataItem(e.item);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/mis/rpt/selectTargetMonthRegOfficeCd.do' />"
                ,data:JSON.stringify({"sSdptCd":dataItem.sdptCd})
                ,async:false
            });

            $("#sOfficeCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });

    $("#sOfficeCd").kendoExtDropDownList({
        dataSource:officeList
        ,dataTextField:"officeNm"
        ,dataValueField:"officeCd"
        ,index:0
        ,optionLabel:" "
        ,select:function(e){

            var dataItem = this.dataItem(e.item);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/mis/rpt/selectTargetMonthRegDealerCd.do' />"
                ,data:JSON.stringify({"officeCd":dataItem.officeCd})
                ,async:false
            });

            $("#sDealerCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });

    $("#sDealerCd").kendoExtDropDownList({
        dataSource:dealerList
        ,dataTextField:"dlrNm"
        ,dataValueField:"dlrCd"
        ,index:0
        ,optionLabel:" "
    });

    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#frmDerivationPerSales').submit();
           }
    });

    mainCall();

});
</script>
<!-- //[DCS] 파생 제품 침투율(판매고문별) -->