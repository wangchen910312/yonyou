<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 구매현황조회 -->
<div class="fsearch_area">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="par.title.partStockReport" /></h1>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11581" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
        </dms:access>
        </div>
    </div>

    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.strge" /><!-- 창고 --></th>
                    <td>
                        <input id="sGrStrgeCd" class="form_comboBox">
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
            </tbody>
        </table>
    </div>
</div>
<div class="table_info table_info_v1">
    <form id="frmTotalStatus" method="post">
        <iframe id="iframeSubTotalStatus" src="" frameborder="0" scrolling="no" width="100%" height="650" class="report"></iframe>
    </form>
</div>


<!-- script -->
<script>
var dlrCd  = "${dlrCd}";
var toDt            = "${toDt}"
   ,sevenDtBf       = "${sevenDtBf}"
   ,grStrgeTpList   = []
   ,grStrgeTpObj    = {};

   //입고창고
   grStrgeTpObj[' '] = "";
   <c:forEach var="obj" items="${storageList}" varStatus="status">
       grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
       grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
   </c:forEach>

    $(document).ready(function() {
        // 입고창고 선택
        $("#sGrStrgeCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:grStrgeTpList
            ,index:0
            ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        });

        $("#btnSearch").kendoButton({
            click:function(e){
                subTotalStatusCall();
            }
        });

    initPage();
    subTotalStatusCall();

    });

    function initPage(){

     //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    partsJs.validate.groupObjAllDataInit();

    }

    // 레포트화면 호출
    function subTotalStatusCall(){
        var sGrStrgeCd;

        //1.창고
        sGrStrgeCd = $("#sGrStrgeCd").val();

        var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=par/selectPartStockReport.cpt' />"
          , param = "";

        param += "&op=view";
        param += "&sDlrCd="+dlrCd;
        param +="&sGrStrgeCd="+sGrStrgeCd;
        $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
    }
</script>
<!-- //script -->

