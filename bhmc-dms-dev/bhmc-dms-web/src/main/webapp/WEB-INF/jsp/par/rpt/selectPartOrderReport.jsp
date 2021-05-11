<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 부품구매통계 -->
<div class="fsearch_area">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="par.title.partOrderReport" /></h1>
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
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                    <td>
                        <input id="sPurcOrdTp" data-type="combo" class="form_comboBox" />
                        <input type="hidden" id="sBpCd" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.ordReqDt" /><!-- 구매신청일 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPurcRegDtFr" class="form_datepicker" data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPurcRegDtTo" class="form_datepicker" data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
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
    var dlrCd       = "${dlrCd}"
       ,sessionBpCd = "${bpCd}"
       ,toDt        = "${toDt}"
       ,sevenDtBf   = "${sevenDtBf}"
       ,purcOrdTpList = [];

    //오더유형 선택
    purcOrdTpList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
        purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    $(document).ready(function() {
        //오더유형선택
        $("#sPurcOrdTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdTpList
            ,index:0
        });

        //오더일자(구매등록일)
        $("#sPurcRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sPurcRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
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
        var minDate   = new Date(sevenDtBf),
            maxDate   = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#sBpCd").val(sessionBpCd);  //공급업체코드 기본셋팅

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

    }

    // 레포트화면 호출
    function subTotalStatusCall(){
        var sBpCd,      //공급업체코드
            sPurcOrdTp,     //구매오더유형
            sPurcRegDtFr,   //구매오더시작일자
            sPurcRegDtTo;   //구매오더종료일자

        //1.공급상코드
        sBpCd = $("#sBpCd").val();
        //2.오더유형
        sPurcOrdTp = $("#sPurcOrdTp").val();
        //3.구매신청일자 시작
        sPurcRegDtFr = $("#sPurcRegDtFr").val();
        //4.구매신청일자 종료
        sPurcRegDtTo = $("#sPurcRegDtTo").val();

        //리포트 URL
        var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=par/selectPartOrderReport.cpt' />"
        ,param = "";
        //인자 구성.
        param += "&op=view";
        param += "&sDlrCd="+dlrCd;
        //param += "&sBpCd="+sBpCd;
        param += "&sPurcOrdTp="+sPurcOrdTp;
        param += "&sPurcRegDtFr="+sPurcRegDtFr;
        param += "&sPurcRegDtTo="+sPurcRegDtTo;

        //리포트 인자 전달 및 호출.
        $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
    }

    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        if(this.value() == null){
            if(id === 'sPurcRegDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sPurcRegDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sPurcRegDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sPurcRegDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }


     }

</script>
<!-- //script -->

