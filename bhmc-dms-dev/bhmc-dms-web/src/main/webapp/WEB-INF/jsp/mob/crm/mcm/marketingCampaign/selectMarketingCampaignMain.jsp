<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript"
    src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content">
<!-- content_list -->
<section id="content_list">
<div class="content_title conttitlePrev">
    <h2 id="content_list_title">
        <spring:message code="crm.title.campaign" />
        <!-- 캠페인 목록 -->
    </h2>
</div>

<div class="listarea01">
    <div class="listhead dlistitem">
        <span style="width: 100%"><spring:message code="global.lbl.crNm" /></span> <!-- 캠페인 명 -->
        <span style="width: 40%"><spring:message code="global.lbl.hostCd" /></span> <!-- 주최 -->
        <span style="width: 40%"><spring:message code="global.lbl.statNm" /></span> <!-- 상태 -->
        <span style="width: 20%"><spring:message code="crm.lbl.blueMemMthCd" /></span> <!-- 유형 -->
        <span class="clboth" style="width: 40%"><spring:message code="crm.lbl.startDt" /></span> <!-- 시작일 -->
        <span style="width: 60%"><spring:message code="crm.lbl.endDt" /></span> <!-- 종료일 -->
    </div>
    <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
    <div class="dlistitem bgNone" style="display: none;" id="mainList_noData">
        <span></span>
    </div>
</div>
</section> <!-- content_search -->
<section id="content_search" class="content_search" style="display:none;">
<div class="content_title conttitlePrev">
    <h2>
        <spring:message code="crm.title.campaign" />
        <!-- 캠페인 관리  -->
    </h2>
</div>
<div class="formarea">
    <input type="hidden" id="sDlrCd" name="sDlrCd" value="${dlrCd}" />
    <input type="hidden" id="sMakCd" name="sMakCd" />
    <input type="hidden" id="sActiveFileDocNo" name="sActiveFileDocNo" />
    <table class="flist01">
        <caption></caption>
        <colgroup>
            <col style="width: 30%;">
            <col style="">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><spring:message code="global.lbl.crNm" /> <!-- 캠페인 명 --></th>
                <td>
                    <div class="f_text">
                        <input type="text" id="sMakNm" name="sMakNm" />
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row"><spring:message code="global.lbl.cpiCd" /> <!-- 캠페인 코드 --></th>
                <td>
                    <div class="f_text">
                        <input type="text" id="sMakCd2" name="sMakCd" />
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row"><spring:message code="global.lbl.hostCd" /> <!-- 주최 --></th>
                <td>
                    <div class="f_text">
                        <input type="text" id="sHostCd" name="sHostCd" class="form_combo" />
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row"><spring:message code="global.lbl.campaignDt" /> <!-- 캠페인 일자 --></th>
                <td class="f_term">
                    <div class="f_item01" style="width: 82%">
                        <input type="search" id="sStartDt" style="width: 140px" class="" />
                        <span class="date" onclick="calpicker('sStartDt');">날짜선택</span>
                    </div> <span class="termtext"> ∼</span>
                    <div class="f_item01" style="width: 82%">
                        <input type="search" id="sEndDt" style="width: 140px" class="" />
                        <span class="date" onclick="calpicker('sEndDt');">날짜선택</span>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row"><spring:message code="crm.lbl.blueMemMthCd" /> <!-- 유형 --></th>
                <td>
                    <div class="f_text">
                        <input type="text" id="sMakTpCd" name="sMakTpCd" class="form_combo" />
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row"></th>
                <td>
                    <div class="f_text">
                        <input type="text" id="sMakSubTpCd" name="sMakSubTpCd" class="form_combo" />
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row"><spring:message code="global.lbl.statNm" /> <!-- 상태 --> </th>
                <td>
                    <div class="f_text">
                        <input type="text" id="sStatCd" name="sStatCd" class="form_combo" />
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<div class="con_btnarea">
    <dms:access viewId="VIEW-D-12720" hasPermission="${dms:getPermissionMask('READ')}">
    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
    </dms:access>
</div>
</section> <!-- content_detail -->
<div class="content_right" id="itemForm">
    <section id="content_detail" class="content_detail"
        style="display:none">
    <div class="co_group">
        <div class="content_title conttitlePrev">
            <h2>
                <spring:message code="global.title.defaultInfo" />
                <!-- 기본 정보 -->
            </h2>
        </div>
        <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width: 30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message
                                code="global.lbl.crNo" /> <!-- 캠페인 번호 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="makCd"
                                    disabled="disabled" />
                            </div> <input type="hidden" id="signDocId" /> <!-- 정주영 작성 -->
                            <input type="hidden" id="apprDocNo" /></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="global.lbl.crNm" /> <!-- 캠페인 명 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="makNm"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="global.lbl.hostCd" /> <!-- 주최 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="hostCd"
                                    class="form_comboBox"
                                    data-type="combo"
                                    data-mandatory="true" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="crm.lbl.blueMemMthCd" /> <!-- 유형 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="makTpCd"
                                    class="form_comboBox"
                                    data-type="combo"
                                    data-mandatory="true" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"></th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="makSubTpCd"
                                    class="form_comboBox"
                                    data-type="combo"
                                    data-mandatory="true" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="crm.lbl.startDt" /> <!-- 시작일 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="startDt"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="crm.lbl.endDt" /> <!-- 종료일 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="endDt"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="crm.lbl.period" /> <!-- 일수 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="prid"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="ser.lbl.endYn" /> <!-- 종료여부 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="rcpeAutoYn"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="global.lbl.aapCmpNm" /> <!-- 대행업체 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="aapCmpNm"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="global.lbl.budgetAmt" /> <!-- 예산 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="budgetAmt"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="global.lbl.statNm" /> <!-- 상태 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="statCd"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="global.lbl.targCustCnt" /> <!-- 목표 인수 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="targCustCnt"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="global.lbl.pgssRate" /> <!-- 진도 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="pgssRate"
                                    disabled="disabled" />
                            </div></td>
                    </tr>

                    <tr>
                        <th scope="row"><spring:message
                                code='ser.lbl.creStartDt' /> <!-- 생산시작일자 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="creStartDt"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code='ser.lbl.creEndDt' /> <!-- 생산종료일자 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="creEndDt"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="ser.lbl.endYn" /> <!-- 종료여부 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="crEndTp"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code='ser.lbl.saleStartDt' /> <!-- 판매시작일자 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="saleStartDt"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code='ser.lbl.saleEndDt' /> <!-- 판매종료일자 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="saleEndDt"
                                    disabled="disabled" />
                            </div></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message
                                code="ser.lbl.crIsaNm" /> <!-- 시행처 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="crIsaNm"
                                    disabled="disabled" />
                            </div></td>
                    </tr>


                    <tr>
                        <th scope="row"><spring:message code="global.lbl.regDt" /> <!-- 등록일 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="regDt" disabled="disabled" />
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th scope="row"><spring:message code="global.lbl.updtDt" /> <!-- 수정일 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="updtDt" disabled="disabled" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.regUsrId" /> <!-- 등록자 -->
                        </th>
                        <td>
                            <div class="f_text f_disabled">
                                <input type="text" id="regUsrId" disabled="disabled" />
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="global.title.plan" /><!-- 방안 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="formarea" id="formarea3">
                        <table  class="flist01">
                            <caption></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.crNm" /><!-- 활동명칭 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="activeNm" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="crm.lbl.detail" /><!-- 요약설명 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="makCont" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.talkPlan" /><!-- 화술방안 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="talkPlan" disabled="disabled"/></div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- 첨부파일  -->
                    <div class="subListarea">
                        <div class="listhead dlistitem">
                            <span style="width:70%"><spring:message code="global.lbl.fileNm" /><!-- 파일명 --></span>
                            <span style="width:30%"><spring:message code="global.lbl.fileSize" /><!-- 파일크기 --></span>
                        </div>
                        <iframe id="fileList" name="fileList" border="1" frameborder="0" width="100%" height="200px"></iframe>
                        <div class="dlistitem bgNone" style="display:none;" id="fileList_noData"><span></span></div>
                    </div>
                    <!-- //첨부파일 -->
                </div>
            </div>
    <div class="co_group">
        <div class="content_title" id="carHistTitle">
            <h2>
                <spring:message code="global.title.goal" />
                <!-- 목표 -->
            </h2>
            <div class="title_btn">
                <span class="co_open co_close"><span></span> </span>
            </div>
        </div>
        <div class="co_view" style="display: none;">
            <div class="subListarea">
                <div class="listhead dlistitem">
                    <span style="width: 15%"><spring:message
                            code="global.lbl.no" /> <!-- 번호 --> </span> <span
                        style="width: 50%"><spring:message
                            code="global.lbl.targ" /> <!-- 목표 --> </span> <span
                        style="width: 35%"><spring:message
                            code="global.lbl.targCntVal" /> <!-- 목표수치 -->
                    </span>
                </div>

                <iframe id="detailList" name="detailList" border="1"
                    frameborder="0" width="100%" height="200px"></iframe>
                <div class="dlistitem bgNone" style="display: none;"
                    id="detailList_noData5">
                    <span></span>
                </div>
            </div>
        </div>
    </div>
    <div class="co_group">
        <div class="content_title" id="signTitle">
            <h2>
                <spring:message code="crm.title.sign" />
                <!-- 결재 -->
            </h2>
            <div class="title_btn">
                <h2 id="btnSign" onclick="btnSign()" style = "display:none" >
                    +
                    <spring:message code="crm.title.sign" />
                    <!-- 결재 -->
                </h2>

                &nbsp;&nbsp;<span id="flagBtnSign" class="co_open co_close"><span></span>
                </span>
            </div>
        </div>

        <div class="co_view" style="display: none;">
            <div class="subListarea">
                <!-- dlistitem  -->
                <div class="listhead dlistitem">
                    <span style="width: 10%"><spring:message code='crm.lbl.abbreviationForNumber' /></span><!-- 번호 -->
<%--                     <span style="width: 25%"><spring:message code='global.lbl.statNm' /></span><!-- 상태 --> --%>
                    <span style="width: 20%"><spring:message code='global.lbl.result' /></span><!-- 결과 -->
                    <span style="width: 23%"><spring:message code='crm.lbl.applyUsr' /></span> <!-- 승인자 -->
                    <span style="width: 47%"><spring:message code='crm.lbl.cont' /></span> <!-- 의견 -->
                </div>
                <!--  리스트 삽입 -->
                <iframe id="signLineList" name="signLineList" border="1" frameborder="0" width="100%" height="200px"></iframe>
                <div class="checkitem bgNone" style="display: none;" id="detailList_noData">
                    <span></span>
                </div>
            </div>

            <!-- 명세와 같은 html 태그 삽입 필요 02.25 18:00  -->
            <section id="layerPopup" class="lay_pop">
                <div class="lay_cont">
                    <h2>
                        <spring:message code='crm.lbl.cont' />
                    </h2>
                    <textarea id="signCmt" data-json-obj="true"></textarea>
                </div>
                <div class="btnarea">
                    <button type="button" class="btnd1" style="font-size:0.9em;"
                        onclick="layerClose2('#layerPopup')">
                        <spring:message code='global.btn.close' />
                        <!-- 닫기 -->
                    </button>
                    <dms:access viewId="VIEW-D-12903" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" onclick="btnEval()" id="btnEval" style="font-size:0.9em;"
                        class="btnd1">
                        <spring:message code='crm.btn.eval' />
                        <!-- 심사 -->
                    </button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12902" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" onclick="btnReject()" style="font-size:0.9em;"
                        id="btnReject" class="btnd1">
                        <spring:message code='global.btn.appRollback' />
                        <!-- 반려 -->
                    </button>
                    </dms:access>
                </div>
            </section>
        </div>
    </div>

    <div class="con_btnarea">
        <div>
            <span class="btnd1" id="detailConfirmBtn"><spring:message
                    code='global.btn.close' /> <!-- 닫기 --> </span>
        </div>
    </div>
    </section>
</div>

<div id="docu_prev">
    <spring:message code="global.btn.pre" />
    <!-- 이전 -->
</div>

<!--  첨부파일 Image 팝업  --> <section class="lay_pop" id="lay_01"
    style="display:none;left:25px;top:40px">
<div id="imgArea" class="imgViewr"
    style="overflow: auto; max-height: 400px;"></div>
<div class="btnarea">
    <span class="btnd1t2" onclick="layerClose('.lay_pop')"><spring:message
            code="global.btn.close" /> </span>
</div>
</section> <!--  // 첨부파일 Image 팝업  --> <script type="text/javascript">





   var userId = "${userId}";
   var userNm = "${userNm}";


    var dateFormat =  '<dms:configValue code="dateFormat" />';

    var hostList     = [];
    var hostTeamList = [];
    var makTpList    = [];
    var makSubTpList = [];
    var statList     = [];

    var hostTeamListObj = {};
    var statCdObj       = {};
    var makTpCdObj      = {};

    var searchFile = false;

    var toDate;
    toDate = new Date();
    _signDocId="";
    var childData={};
    var btnFlag = false;

    /* $(".skeyarea .btnarea .sbtn").click(function() {
        var obj = $(this).parent().parent();

        $(".skeyarea").hide();

        $("#sMakNm").val("");
        $("#sHostCd").data("kendoExtDropDownList").value("");
        $("#sMakTpCd").data("kendoExtDropDownList").value("");
        $("#sMakSubTpCd").data("kendoExtDropDownList").value("");
        $("#sStatCd").data("kendoExtDropDownList").value("");
        $("#sStartDt").val("");
        $("#sEndDt").val("");

        obj.find("span[name='searchStr']").text("");

        fnSetSearchBox();
        contentList();
    });

    $(".skeyarea .btn_delete").click(function(){
        var obj = $(this).parent().parent();
        switch(obj.attr("id")){
            case "search1Area" :
                $("#sMakNm").val("");
                break;
            case "search2Area" :
                $("#sHostCd").data("kendoExtDropDownList").value("");
                break;
            case "search3Area" :
                $("#sMakTpCd").data("kendoExtDropDownList").value("");
                $("#sMakSubTpCdk").data("kendoExtDropDownList").value("");
                break;
            case "search4Area" :
                $("#sStatCd").data("kendoExtDropDownList").value("");
                break;
            case "search5Area" :
                $("#sStartDt").val("");
                $("#sEndDt").val("");
                break;
            default :
                break;
        }

        obj.find("span[name='searchStr']").text("");

        fnSetSearchBox();
        contentList();
    }); */

    /**
    * 유형에 따른 유형 Sub 조회(조회조건)
    */
    fnSelectMakTpCdSearch = function (e) {
        var dataItem = this.dataItem(e.item);

        $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sMakSubTpCd").data("kendoExtDropDownList").enable(true);

        if(dataItem.cmmCd == ""){
            $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/crm/mcm/marketingCampaign/selectMakTpCdList.do"
            ,data:JSON.stringify({"cmmCd":dataItem.cmmCd})
            ,async:false
        });

        $("#sMakSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    };

    //주최
    <c:forEach var="obj" items="${makTpList}">
        makTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        makTpCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    // 유형
    <c:forEach var="obj" items="${hostList}" varStatus="status">
        hostList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    // 상태
    <c:forEach var="obj" items="${statList}">
        statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        statCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    // 컨트롤러 추적 해야함
    // 컨트롤러에서 변수 생성해서 집합 만들어서 보내 줄 것임

    var signStatList = [];
    var signRsltList = [];

    var signStatCdObj = {};
    var signRsltCdObj = {};

    <c:forEach var="obj" items="${signStatList}">
        signStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        signStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${signRsltList}">
        signRsltList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        signRsltCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>



   /*  fnSetSearchBox = function () {
        var cnt = 0;
        var sMakNm = $("#sMakNm").val();
        var sHostCd = $("#sHostCd").data("kendoExtDropDownList").value();
        var sMakTpCd = $("#sMakTpCd").data("kendoExtDropDownList").value();
        var sMakSubTpCd = $("#sMakSubTpCd").data("kendoExtDropDownList").value();
        var sStatCd = $("#sStatCd").data("kendoExtDropDownList").value();
        var sStartDt = $("#sStartDt").val();
        var sEndDt = $("#sEndDt").val();

        setMainListHeight();

        if(sMakNm == "" && sHostCd == "" && sMakTpCd == "" && sMakSubTpCd == "" && sStatCd == "" && sStartDt == "" && sEndDt == "") {
            $(".skeyarea").hide();
        }
        else {
            $(".skeyarea").show();

            if (sMakNm == "") {
                $("#search1Area").hide();
            }
            else {
                $("#search1Area").show();
                cnt++;
            }

            if (sHostCd == "" ) {
                $("#search2Area").hide();
            }
            else {
                $("#search2Area").show();
                cnt++;
            }

            if (sMakTpCd == "" && sMakSubTpCd == "") {
                $("#search3Area").hide();
            }
            else {
                $("#search3Area").show();
                cnt++;
            }

            if (sStatCd == "") {
                $("#search4Area").hide();
            }
            else {
                $("#search4Area").show();
                cnt++;
            }

            if (sStartDt == "" && sEndDt == "") {
                $("#search5Area").hide();
            }
            else {
                $("#search5Area").show();
                cnt++;
            }
        }

        if (cnt == 1) {
            $(".skeyarea .btnarea .sbtn").hide();
        }
        else {
            $(".skeyarea .btnarea .sbtn").show();
        }
    } */

    fnSearchText = function() {
        var sMakNm = $("#sMakNm");
        var sHostCd = $("#sHostCd").data("kendoExtDropDownList");
        var sMakTpCd = $("#sMakTpCd").data("kendoExtDropDownList");
        var sMakSubTpCd = $("#sMakSubTpCd").data("kendoExtDropDownList");
        var sStatCd = $("#sStatCd").data("kendoExtDropDownList");
        var sStartDt = $("#sStartDt");
        var sEndDt = $("#sEndDt");

        if(sMakNm.val() != "") {
            $("#search1Area span[name='searchStr']").text(sMakNm.val());
        }

        if(sMakTpCd.value() != "") {
            if(sMakSubTpCd.value() != "") {
                $("#search3Area span[name='searchStr']").text(sMakTpCd.text() + ", " + sMakSubTpCd.text());
            }
            else {
                $("#search3Area span[name='searchStr']").text(sMakTpCd.text());
            }
        }

        if(sStatCd.value() != "") $("#search4Area span[name='searchStr']").text(sStatCd.text());

        if (sStartDt.val() != "" && sEndDt.val() != "") {
            $("#search5Area span[name='searchStr']").html(sStartDt.val() + " ~<br>" + sEndDt.val());
        }
        else {
            if(sStartDt.val() != "") {
                $("#search5Area span[name='searchStr']").html(sStartDt.val() + " ~");
            }
            else if (sEndDt.val() != "") {
                $("#search5Area span[name='searchStr']").text(" ~ " + sEndDt.val());
            }
        }
    }

    $(document).ready(function() {

        $("#btnSign").hide();

        /* $("#signLineList").onload = function (){
            var statCd = childData.signStatCd;
            var LoginId = userId;
            var UsrId = childData.signUsrId;
            var iframeSignLineListHeight = $("#signLineList").contents().find("body").height();
            console.log("iframeSignLineListHeight" + iframeSignLineListHeight);
            if(UsrId == LoginId && statCd == "02" && iframeSignLineListHeight == 200){
                $("#btnSign").show();
            }
        }; */


//         $("#flagBtnSign").click(function(){
//             $("#signLineList").onload = function (){
//                 var iframeSignLineListHeight = $("#signLineList").contents().find("body").height();
//                 var statCd = childData.signStatCd;
//                 var LoginId = userId;
//                 var UsrId = childData.signUsrId;
//                 if(UsrId == LoginId && statCd == "02"){
//                     $("#btnSign").show();
//                 }
//             };
//         });



        //$("#flagBtnSign").hide();
        $("#flagBtnSign").click(function(){
            //var iframeSignLineListHeight = $("#signLineList").contents().find("body").height();
            var statCd = childData.signStatCd;
            var LoginId = userId;
            var UsrId = childData.signUsrId;
            if (btnFlag){
                btnFlag = false;
                $("#btnSign").hide();
            }else{
                btnFlag = true;
                if(UsrId == LoginId && statCd == "02"){
                    $("#btnSign").show();
                }
            }
        });

        $("#sDlrCd").val("${dlrCd}");
        //$("#sStartDt").val("${oneDay}");
        //$("#sEndDt").val("${today}");

        // 조회조건 - 주최
        $("#sHostCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:hostList
            ,index:0
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        // 유형
        $("#sMakTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:makTpList
            ,index:0
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
            ,select:fnSelectMakTpCdSearch
        });

        // 유형상세
        $("#sMakSubTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,index:0
            ,optionLabel:" "
        });

        $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);

        // 상태
        $("#sStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:dms.data.cmmCdFilter(statList)
            ,index:0
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        fnInitPage = function (){
            $(".skeyarea").hide();
        }

        fnInitPage();

        // 타이틀
        $("#header_title").html("<spring:message code='crm.title.campaign' />");<!-- 캠페인 관리 -->
        // 0705
        // $("#header_title").on("click", contentSearch);
        $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

        // 목록 조회
        $("#mainList").attr("src", "<c:url value='/mob/crm/mcm/marketingCampaign/selectMarketingCampaignList.do' />");

        // 버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                $("#listarea_noData").hide();
                mob.loading.show();
                fnSearchText();
                //fnSetSearchBox();
                contentList();
            }
        });

        // 버튼 - 이전
        $("#docu_prev").bind("click", function() {
            if ($("#content_list").css("display") == "block") { goMain(); }
            else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
            else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
            childData = "";
            //$("#btnSign").hide();
        });

        //버튼 - TOP
        $("#docu_top").bind("click", function() {
            $("body,html").animate({scrollTop:0}, 200);
        });

        //상단으로 이동
        $(window).scroll(function () {
            if ($(this).scrollTop() != 0) {
                $("#docu_top").fadeIn();
            }
            else {
                $("#docu_top").fadeOut();
            }
        });


        fnSearchText();
        //fnSetSearchBox();

    });
</script> <script type="text/javascript">


    //메인화면 가기
    function goMain() {
        window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
    }

    //목록페이지 보기
    function contentList() {
        $("#content_search").css("display", "none");
        $("#content_detail").css("display", "none");
        $("#content_list").css("display", "block");

        // 0705
        $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");

        document.getElementById("mainList").contentWindow.document.location.reload();
    }

    //검색페이지 보기
    function contentSearch() {
        $("#content_list").css("display", "none");
        $("#content_detail").css("display", "none");
        $("#content_search").css("display", "block");
    }

    //상세페이지 보기
    fnContentDetail = function (key,signDocId, apprDocNo) {



        var apprDocNo = apprDocNo;
        $("#apprDocNo").val(apprDocNo);

        /* if($("#apprDocNo").val() == "" || $("#apprDocNo").val() == null){
            // +결재 버튼 hide 필요
            $("#btnSign").hide();
        }
        else{
            $("#btnSign").show();
        } */

        $("#btnSign").hide();

        var dlrCd  = "${dlrCd}";    // 딜러코드
        $("#sMakCd").val(key);
        _signDocId=signDocId;

        $("#content_list").css("display", "none");
        $("#content_search").css("display", "none");
        $("#content_detail").css("display", "block");







        // 0705
        $("#header_title span").removeAttr("class");

        if( key != null && key != 'undefined') {
            $.ajax({
                url:"<c:url value='/crm/mcm/marketingCampaign/selectMarketingCampaignByKey.do' />",
                data:JSON.stringify({sDlrCd:dlrCd, sMakCd:key}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    mob.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {
                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
                    return false;
                }

                // 목표 목록 조회
                $("#detailList").attr("src", "<c:url value='/mob/crm/mcm/marketingCampaign/selectMarketingCampaignSubList.do' />");
                $("#fileList").attr("src", "<c:url value='/mob/crm/mcm/marketingCampaign/selectMarketingCampaignFileList.do' />");
                $("#signLineList").attr("src", "<c:url value='/mob/crm/mcm/marketingCampaign/selectMarketingCampaignSignLineList.do' />");

                // activeFileDocNo

                // 주최
                $("#hostCd").kendoExtDropDownList({
                    dataTextField:"cmmCdNm"
                   ,dataValueField:"cmmCd"
                   ,dataSource:hostList
                });

                partsJs.validate.groupObjAllDataSet(result);

                // 유형
                $("#makTpCd").kendoExtDropDownList({
                    dataTextField:"cmmCdNm"
                   ,dataValueField:"cmmCd"
                   ,dataSource:makTpList
                });

                partsJs.validate.groupObjAllDataSet(result);

                // 주최 상세
                $("#makSubTpCd").kendoExtDropDownList({
                    dataTextField:"cmmCdNm"
                    ,dataValueField:"cmmCd"
                });

                $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);
                $("#makSubTpCd").data("kendoExtDropDownList").enable(true);

                if($("#makTpCd").data("kendoExtDropDownList").value() == ""){
                    $("#makSubTpCd").data("kendoExtDropDownList").setDataSource([]);
                    $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
                    return false;
                }

                var responseJson = dms.ajax.getJson({
                    url:_contextPath + "/crm/mcm/marketingCampaign/selectMakTpCdList.do"
                    ,data:JSON.stringify({"cmmCd":$("#makTpCd").data("kendoExtDropDownList").value()})
                    ,async:false
                });

                $("#makSubTpCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

                // 상태
                $("#statCd").kendoExtDropDownList({
                    dataTextField:"cmmCdNm"
                    ,dataValueField:"cmmCd"
                    ,dataSource:statList
                });

                // #statCd 에 할당하는 코드가 필요했다. 추가: 02.25 15:10 정주영
                $("#statCd").data("kendoExtDropDownList").value(result.statCd);


                partsJs.validate.groupObjAllDataSet(result);
                gCrud = 'U';

                $("#sActiveFileDocNo").val(result.activeFileDocNo);

                $("#startDt").val(chgDate2Str($("#startDt").val()));
                $("#endDt").val(chgDate2Str($("#endDt").val()));

                $("#creStartDt").val(chgDate2Str($("#creStartDt").val()));
                $("#creEndDt").val(chgDate2Str($("#creEndDt").val()));
                $("#saleStartDt").val(chgDate2Str($("#saleStartDt").val()));
                $("#saleEndDt").val(chgDate2Str($("#saleEndDt").val()));
                $("#budgetAmt").val(kendo.toString(result.budgetAmt,'n2'));
                $("#activeNm").val($("#makNm").val());

                $("#hostCd").data("kendoExtDropDownList").enable(false);
                $("#makTpCd").data("kendoExtDropDownList").enable(false);
                $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
            });
        }
    }

    fnBase64 = function(data) {
        var key = "ABCDEFGHIJKLMNOPQRSTUVWXYNZabcdefghijklmnopqrstuvwxynz0123456789+/=";

        var i = 0;
        var len = data.length;
        var c1;
        var c2;
        var c3;
        var e1;
        var e2;
        var e3;
        var e4;
        var result = [];

        while (i < len) {
            c1 = data.charCodeAt(i++);
            c2 = data.charCodeAt(i++);
            c3 = data.charCodeAt(i++);

            e1 = c1 >> 2;
            e2 = ((c1 & 3) << 4) | (c2 >> 4);
            e3 = ((c2 & 15) << 2) | (c3 >> 6);
            e4 = c3 & 63;

            if (isNaN(c2)) {
                e3 = e4 = 64;
            }
            else if (isNaN(c3)) {
                e4 = 64;
            }

            result.push(e1, e2, e3, e4);
        }

        return result.map(function(e) {
            return key.charAt(e);
        }).join("");
    }

    fnFileDetail = function(fileDocNo, fileNo) {
        var loop = 0;
        var url = "";

        var params = {};
        params["sFileDocNo"] = fileDocNo;

        var agent = navigator.userAgent.toLowerCase();

        $.ajax({
            url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                mob.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                $.each(jqXHR.data, function(index, value) {
                    if ((loop + 1) == fileNo) {
                        if (value.fileTp.substring(0, 5) != "image") {
                            // 이미지가 아닐 경우
                            if (agent.indexOf("safari") != -1) {
                                location.href = "wjcp://openViewWithDataAndType?type=" + value.fileTp + "&data=" + fnBase64(value.fileData);
                            }
                            else {
                                window.wjcp.openViewWithDataAndType(value.fileTp, fnBase64(value.fileData));
                            }
                        }
                        else {
                            url = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />?fileDocNo=" + fileDocNo + "&fileNo=" + fileNo;

                            $("#imgArea").html("<img src='" + url + "' />");

                            pushLayer('#lay_01');
                            $(".blind").show().animate({opacity:'0.4'}, 500);
                        }
                    }

                    loop++;
                });
            }
        });
    }

    var signDocLineNo = '';




    function btnSign() {

        // 버튼 작동중..
        // todo

        // 0. checked 라인의 정보를 탐색한다. - 해결
        // 1. popup 창을 실행시킨다.
        // 2. popup 창으로 0.번의 데이터를 옮긴다. 옮기지 않고바로 접근이 가능하다면???
        // 3. 버튼의 show 설정을 한다. (문서 종류별로 결재여부가 갈린다.)
        var signDocNo = "";
        var signUsrId = "";
        var signStatCd = "";



                signDocNo = childData.signDocNo;
                signUsrId = childData.signUsrId;
                signStatCd = childData.signStatCd;

                // 심사자 아이디 & 로그인 아이디 비교.. (이름이 아니다..)
                if(signUsrId == userId && signStatCd == "02"){
                    $("#btnEval").removeAttr("disabled");
                    $("#btnReject").removeAttr("disabled");
                    $("#signCmt").removeAttr("disabled");
                }
                else{
                    $("#btnEval").attr("disabled", true);
                    $("#btnReject").attr("disabled", true);
                    $("#signCmt").attr("disabled", true);
                }
                // popup 창을 연다.
                //pushLayer('#lay_pop');
                calLayerPopupPostion("#layerPopup");
                $(".blind").show(); //ios webview에서 pushLayer가 제대로 동작하지 않아서... .blind는 defaultMobTemplate.jsp에 있다.
                $("#layerPopup").show();
            //}
            //
        //});
    }



    //심사 버튼
    function btnEval(){

            var signDocNo = childData.signDocNo;
            var signStatCd = childData.signStatCd;
            var signDocLineNo = childData.signDocLineNo;
            var signDocId = childData.signDocId;

            if(dms.string.isEmpty($("#signCmt").val())){
            // 화면 필수 체크(결재의견)
            mob.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return;
        }

        if(dms.string.isEmpty(signDocNo)){
            // 화면 필수 체크(문서번호)
            mob.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return;
        }

        var params = {};

        params["signDocNo"] = signDocNo;
        params["signCont"] = $("#signCmt").val();
        params["signDocId"] = signDocId;
        params["signDocLineNo"] = signDocLineNo;
        params["signStatCd"] = "03";
        params["signRsltCd"] = "04";


        $.ajax({
            url:"<c:url value='/mob/crm/mcm/marketingCampaign/updateSignLineEx.do' />"
          , data:JSON.stringify(params)
          , type:'POST'
          , dataType:'json'
          , async:false
          , contentType:'application/json'
          , error:function(jqXHR,status,error) {
              mob.notification.error(jqXHR.responseJSON.errors);
            }
          , success:function(jqXHR, textStatus) {

               $("#btnEval").attr("disabled", true);
               $("#btnReject").attr("disabled", true);
               $("#signCmt").attr("disabled", true);

                //정상적으로 반영 되었습니다.
                mob.notification.success("<spring:message code='global.info.success'/>");
          }
          ,beforeSend:function(xhr){
              //dms.loading.show($("#window"));
          }
          ,complete:function(xhr,status){

              reload();
              //dms.loading.hide($("#window"));
          }
        });

    }

    function btnReject(){

        var signDocNo = childData.signDocNo;
        var signStatCd = childData.signStatCd;
        var signDocLineNo = childData.signDocLineNo;
        var signDocId = childData.signDocId;


        if(dms.string.isEmpty($("#signCmt").val())){
            // 화면 필수 체크(결재의견)
            mob.notification.warning("<spring:message code='global.lbl.signCont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return;
        }

        if(dms.string.isEmpty(signDocNo)){
            // 화면 필수 체크(문서번호)
            mob.notification.warning("<spring:message code='global.lbl.signDocNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
            return;
        }

        var params = {};

        params["signDocNo"] = signDocNo;
        params["signCont"] = $("#signCmt").val();
        params["signDocId"] = signDocId;
        params["signDocLineNo"] = signDocLineNo;
        params["signStatCd"] = "03";
        params["signRsltCd"] = "02";


        $.ajax({
            url:"<c:url value='/mob/crm/mcm/marketingCampaign/updateSignLineEx.do' />"
          , data:JSON.stringify(params)
          , type:'POST'
          , dataType:'json'
          , async:false
          , contentType:'application/json'
          , error:function(jqXHR,status,error) {
               mob.notification.error(jqXHR.responseJSON.errors);
            }
          , success:function(jqXHR, textStatus) {

              $("#btnEval").attr("disabled", true);
              $("#btnReject").attr("disabled", true);
              $("#signCmt").attr("disabled", true);

                //정상적으로 반영 되었습니다.
                mob.notification.success("<spring:message code='global.info.success'/>");
          }
          ,beforeSend:function(xhr){
              //dms.loading.show($("#window"));
          }
          ,complete:function(xhr,status){

              //dms.loading.hide($("#window"));
              reload();
          }
        });

    }
    // 심사, 반려 후 리스트 페이지로 새로고침
    function reload() {
        window.location.reload(true);
    }



</script>