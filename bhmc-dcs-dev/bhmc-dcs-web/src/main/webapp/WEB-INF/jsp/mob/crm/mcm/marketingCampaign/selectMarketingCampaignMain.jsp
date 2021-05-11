<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="crm.title.campaign" /><!-- 캠페인 목록 --></h2>
            </div>
            <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr id="search1Area">
                                <th scope="row"><span><spring:message code="global.lbl.crNm" /><!-- 캠페인 명 --></span></th>
                                <td><span name="searchStr"></span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="global.lbl.hostCd" /><!-- 주최 --></span></th>
                                <td><span name="searchStr"></span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="crm.lbl.blueMemMthCd" /><!-- 유형 --></span></th>
                                <td><span name="searchStr"></span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="global.lbl.statNm" /><!-- 상태 --></span></th>
                                <td><span name="searchStr"></span></td>
                            </tr>
                            <tr id="search5Area">
                                <th scope="row"><span><spring:message code="global.lbl.campaignDt" /><!-- 캠페인 일자 --></span></th>
                                <td><span name="searchStr"></span></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btnarea">
                        <span class="sbtn">전체조건 삭제</span>
                    </div>
                </div>
            </div>

            <div class="listarea01">
                <div class="listhead dlistitem">
                    <span style="width:100%"><spring:message code="global.lbl.crNm" /><!-- 캠페인 명 --></span>
                    <span class="clboth" style="width:40%"><spring:message code="global.lbl.hostTeamCd" /><!-- 주최 부문 --></span>
                    <span style="width:40%"><spring:message code="global.lbl.statNm" /><!-- 상태 --></span>
                    <span style="width:20%"><spring:message code="crm.lbl.blueMemMthCd" /><!-- 유형 --></span>
                    <span class="clboth" style="width:40%"><spring:message code="crm.lbl.startDt" /><!-- 시작일 --></span>
                    <span style="width:60%"><spring:message code="crm.lbl.endDt" /><!-- 종료일 --></span>
                </div>

                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="crm.title.campaign" /><!-- 캠페인 관리  --> </h2>
        </div>
        <div class="formarea">
            <input type="hidden" id="sDlrCd" name="sDlrCd" value="${dlrCd}" />
            <input type="hidden" id="sMakCd" name="sMakCd" />

            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.crNm" /><!-- 캠페인 명 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sMakNm" name="sMakNm" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.hostCd" /><!-- 주최 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sHostCd" name="sHostCd" class="form_combo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"></th>
                        <td>
                            <div class="f_text"><input type="text" id="sHostTeamCd" name="sHostTeamCd" class="form_combo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="crm.lbl.blueMemMthCd" /><!-- 유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sMakTpCd" name="sMakTpCd" class="form_combo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"></th>
                        <td>
                            <div class="f_text"><input type="text" id="sMakSubTpCd" name="sMakSubTpCd" class="form_combo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sStatCd" name="sStatCd" class="form_combo" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.campaignDt" /><!-- 캠페인 일자 --></th>
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sStartDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sStartDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01">
                                <input type="text" id="sEndDt" style="width:140px" class="" readOnly/>
                                <span class="date" onclick="calpicker('sEndDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="global.title.defaultInfo" /><!-- 기본 정보 --></h2>
                </div>
                <div class="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.crNo" /><!-- 캠페인 번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="makCd" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.crNm" /><!-- 캠페인 명 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="makNm" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.hostCd" /><!-- 주최 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="hostCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="hostTeamCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.blueMemMthCd" /><!-- 유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="makTpCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="makSubTpCd" class="form_comboBox" data-type="combo" data-mandatory="true" /></div>
                                </td>
                           </tr>
                           <tr>
                                <th scope="row"><spring:message code="crm.lbl.startDt" /><!-- 시작일 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="startDt" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.endDt" /><!-- 종료일 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="endDt" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <!-- <tr>
                                <th scope="row">비용처리비용처리</th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="carlineCd" disabled="disabled"/></div>
                                </td>
                            </tr> -->
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.rcpeAutoYn" /><!-- 대상자 자동추출 여부 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="rcpeAutoYn" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.aapCmpNm" /><!-- 대행업체 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="aapCmpNm" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.budgetAmt" /><!-- 예산 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="budgetAmt" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 상태 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="statCd" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.targCustCnt" /><!-- 목표 인수 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="targCustCnt" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.pgssRate" /><!-- 진도 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="pgssRate" disabled="disabled"/></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.regDt" /><!-- 등록일 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input id="regDt" type="text" disabled="disabled"/></div>
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
                                    <th scope="row"><spring:message code="global.lbl.activeNm" /><!-- 활동명칭 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="activeNm" disabled="disabled"/></div>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.activeCont" /><!-- 요약설명 --></th>
                                    <td>
                                        <div class="f_text f_disabled"><input type="text" id="activeCont" disabled="disabled"/></div>
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

                    <!-- 사진 -->
                    <div>
                        <div class="content_title">
                            <h2><spring:message code="global.title.pictureInfo" /><!-- 사진 --></h2>
                        </div>
                        <!-- Upload 된 사진영역 -->
                        <div class="upload_view">

                        </div>
                        <!-- //Upload 된 사진영역 -->
                    </div>
                    <!-- //사진 -->

                    <iframe id="otherList" border="10" frameborder="10" width="100%" height="80%"></iframe>
                </div>
            </div>

            <div class="co_group">
                <div class="content_title" id="carHistTitle">
                    <h2><spring:message code="global.title.goal" /><!-- 목표 --></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none;">
                    <div class="subListarea">
                        <div class="listhead dlistitem">
                            <span style="width:15%"><spring:message code="global.lbl.no" /><!-- 번호 --></span>
                            <span style="width:50%"><spring:message code="global.lbl.targ" /><!-- 목표 --></span>
                            <span style="width:35%"><spring:message code="global.lbl.targCntVal" /><!-- 목표수치 --></span>
                        </div>

                        <iframe id="detailList" name="detailList" border="1" frameborder="0" width="100%" height="200px"></iframe>
                    </div>
                </div>
            </div>

            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<script type="text/javascript">
    var dateFormat =  '<dms:configValue code="dateFormat" />';

    var hostList     = [];
    var hostTeamList = [];
    var makTpList    = [];
    var makSubTpList = [];
    var statList     = [];

    var hostTeamListObj = {};
    var statCdObj = {};
    var makTpCdObj = {};

    var toDate;
    toDate = new Date();

    $(".skeyarea .btnarea .sbtn").click(function() {
        var obj = $(this).parent().parent();

        $(".skeyarea").hide();

        $("#sMakNm").val("");
        $("#sHostCd").data("kendoExtDropDownList").value("");
        $("#sHostTeamCd").data("kendoExtDropDownList").value("");
        $("#sMakTpCd").data("kendoExtDropDownList").value("");
        $("#sMakSubTpCd").data("kendoExtDropDownList").value("");
        $("#sStatCd").data("kendoExtDropDownList").value("");
        $("#sStartDt").val("");
        $("#sEndDt").val("");

        obj.find("span[name='searchStr']").text("");

        fnSetSearchBox();
        contentList();
    });

    /**
     * 주최에 따른 주최 Sub 조회(조회조건)
     */
     fnSelectHostCdSearch = function (e) {
        var dataItem = this.dataItem(e.item);

        $("#sHostTeamCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sHostTeamCd").data("kendoExtDropDownList").enable(true);

        if(dataItem.cmmCd == "") {
            $("#sHostTeamCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sHostTeamCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:_contextPath + "/crm/mcm/marketingCampaign/selectHostCdList.do"
            ,data:JSON.stringify({"cmmCd":dataItem.cmmCd})
            ,async:false
        });

        $("#sHostTeamCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    };

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
        makTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
        makTpCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    // 유형
    <c:forEach var="obj" items="${hostList}" varStatus="status">
        hostList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    </c:forEach>

    // 상태
    <c:forEach var="obj" items="${statList}">
        statList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
        statCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    fnSetSearchBox = function (){
        var sMakNm = $("#sMakNm").val();
        var sHostCd = $("#sHostCd").data("kendoExtDropDownList").value();
        var sHostTeamCd = $("#sHostTeamCd").data("kendoExtDropDownList").value();
        var sMakTpCd = $("#sMakTpCd").data("kendoExtDropDownList").value();
        var sMakSubTpCd = $("#sMakSubTpCd").data("kendoExtDropDownList").value();
        var sStatCd = $("#sStatCd").data("kendoExtDropDownList").value();
        var sStartDt = $("#sStartDt").val();
        var sEndDt = $("#sEndDt").val();

        setMainListHeight();

        if(sMakNm == "" && sHostCd == "" && sHostTeamCd == "" && sMakTpCd == "" && sMakSubTpCd == "" && sStatCd == "" && sStartDt == "" && sEndDt == "") {
            $(".skeyarea").hide();
        }
        else {
            $(".skeyarea").show();

            if (sMakNm == "") {
                $("#search1Area").hide();
            }
            else {
                $("#search1Area").show();
                $(".btn_delete").show();
            }

            if (sHostCd == "" && sHostTeamCd == "") {
                $("#search2Area").hide();
            }
            else {
                $("#search2Area").show();
                $(".btn_delete").show();
            }

            if (sMakTpCd == "" && sMakSubTpCd == "") {
                $("#search3Area").hide();
            }
            else {
                $("#search3Area").show();
                $(".btn_delete").show();
            }

            if (sStatCd == "") {
                $("#search4Area").hide();
            }
            else {
                $("#search4Area").show();
                $(".btn_delete").show();
            }

            if (sStartDt == "" && sEndDt == "") {
                $("#search5Area").hide();
            }
            else {
                $("#search5Area").show();
                $(".btn_delete").show();
            }
        }
    }

    $(document).ready(function() {
        $("#sDlrCd").val("${dlrCd}");
        $("#sStartDt").val("${oneDay}");
        $("#sEndDt").val("${today}");

        // 조회조건 - 주최
        $("#sHostCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:hostList
            ,index:0
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
            ,select:fnSelectHostCdSearch
        });

        // 주최 상세
        $("#sHostTeamCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,index:0
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#sHostTeamCd").data("kendoExtDropDownList").enable(false);

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
            ,optionLabel:"<spring:message code='global.lbl.check'/>"
        });

        $("#sMakSubTpCd").data("kendoExtDropDownList").enable(false);

        // 상태
        $("#sStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:statList
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
                var sMakNm = $("#sMakNm");
                var sHostCd = $("#sHostCd").data("kendoExtDropDownList");
                var sHostTeamCd = $("#sHostTeamCd").data("kendoExtDropDownList");
                var sMakTpCd = $("#sMakTpCd").data("kendoExtDropDownList");
                var sMakSubTpCd = $("#sMakSubTpCd").data("kendoExtDropDownList");
                var sStatCd = $("#sStatCd").data("kendoExtDropDownList");
                var sStartDt = $("#sStartDt");
                var sEndDt = $("#sEndDt");

                if(sMakNm.val() != "") {
                    $("#search1Area span[name='searchStr']").text(sMakNm.val());
                }

                if(sHostCd.value() != "") {
                    if(sHostTeamCd.value() != "") {
                        $("#search2Area span[name='searchStr']").text(sHostCd.text() + ", " + sHostTeamCd.text());
                    }
                    else {
                        $("#search2Area span[name='searchStr']").text(sHostCd.text());
                    }
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

                fnSetSearchBox();
                contentList();
            }
        });

        // 버튼 - 이전
        $("#docu_prev").bind("click", function() {
            if ($("#content_list").css("display") == "block") { goMain(); }
            else if ($("#content_search").css("display") == "block") { contentList(); }
            else if ($("#content_detail").css("display") == "block") { contentList(); }
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
    });
</script>

<script type="text/javascript">
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
    fnContentDetail = function (key) {
        var dlrCd  = "${dlrCd}";    // 딜러코드
        $("#sMakCd").val(key);

        $("#content_list").css("display", "none");
        $("#content_search").css("display", "none");
        $("#content_detail").css("display", "block");

        // 0705
        $("#header_title span").removeAttr("class");

        if( key != null && key != 'undefined'){
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

                // 주최
                $("#hostCd").kendoExtDropDownList({
                    dataTextField:"cmmCdNm"
                   ,dataValueField:"cmmCd"
                   ,dataSource:hostList
                });

                // 주최 상세
                $("#hostTeamCd").kendoExtDropDownList({
                    dataTextField:"cmmCdNm"
                    ,dataValueField:"cmmCd"
                });

                $("#hostTeamCd").data("kendoExtDropDownList").setDataSource([]);
                $("#hostTeamCd").data("kendoExtDropDownList").enable(true);

                if($("#hostCd").data("kendoExtDropDownList").value() == "") {
                    $("#hostTeamCd").data("kendoExtDropDownList").setDataSource([]);
                    $("#hostTeamCd").data("kendoExtDropDownList").enable(false);
                    return false;
                }

                var responseJson = dms.ajax.getJson({
                    url:_contextPath + "/crm/mcm/marketingCampaign/selectHostCdList.do"
                    ,data:JSON.stringify({"cmmCd":$("#hostCd").data("kendoExtDropDownList").value()})
                    ,async:false
                });

                $("#hostTeamCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

                // 유형
                $("#makTpCd").kendoExtDropDownList({
                    dataTextField:"cmmCdNm"
                   ,dataValueField:"cmmCd"
                   ,dataSource:makTpList
                });

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

                partsJs.validate.groupObjAllDataSet(result);
                gCrud = 'U';

                $("#startDt").val(chgDate2DateTimeStr($("#startDt").val()));
                $("#endDt").val(chgDate2DateTimeStr($("#endDt").val()));
                $("#regDt").val(chgDate2DateTimeStr($("#regDt").val()));

                $("#hostCd").data("kendoExtDropDownList").enable(false);
                $("#hostTeamCd").data("kendoExtDropDownList").enable(false);
                $("#makTpCd").data("kendoExtDropDownList").enable(false);
                $("#makSubTpCd").data("kendoExtDropDownList").enable(false);
            });
        }
    }
</script>