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
<c:import url="/WEB-INF/jsp/ZnewMob/crm/mcm/marketingCampaign/listJsp/selectMarketingCampaignList.jsp"></c:import>
 <!-- content_search -->

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
                        <input type="date" id="sStartDt" style="width: 140px; background-color:#ffffff;" class="" />
                        <!-- <input type="search" id="sStartDt" style="width: 140px" class="" />
                        <span class="date" onclick="calpicker('sStartDt');">날짜선택</span> -->
                    </div> <span class="termtext"> ∼</span>
                    <div class="f_item01" style="width: 82%">
                        <input type="date" id="sEndDt" style="width: 140px; background-color:#ffffff;" class="" />
                        <!-- <input type="search" id="sEndDt" style="width: 140px" class="" />
                        <span class="date" onclick="calpicker('sEndDt');">날짜선택</span> -->
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
    <!-- 방안 -->
    <!-- 첨부파일  -->
    <c:import url="/WEB-INF/jsp/ZnewMob/crm/mcm/marketingCampaign/listJsp/selectMarketingCampaignFileList.jsp"></c:import>

    <!-- 목표 -->
    <c:import url="/WEB-INF/jsp/ZnewMob/crm/mcm/marketingCampaign/listJsp/selectMarketingCampaignSubList.jsp"></c:import>

    <!-- 결재 -->
    <c:import url="/WEB-INF/jsp/ZnewMob/crm/mcm/marketingCampaign/listJsp/selectMarketingCampaignSignLineList.jsp"></c:import>


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
</section> <!--  // 첨부파일 Image 팝업  -->

<script type="text/javascript">
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

    $(document).ready(function() {

        $("#btnSign").hide();

        $("#flagBtnSign").click(function(){
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

        // 타이틀
        $("#header_title").html("<spring:message code='crm.title.campaign' />");    <!-- 캠페인 관리 -->
        $("#header_title").on("click", moveSearch);
        $("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

        // 버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                initList();
                listData.read();
            }
        });
    });
</script>

<script type="text/javascript">
    //상세페이지 보기
    fnContentDetail = function (key,signDocId, apprDocNo) {
        var apprDocNo = apprDocNo;
        $("#apprDocNo").val(apprDocNo);
        $("#btnSign").hide();

        var dlrCd  = "${dlrCd}";    // 딜러코드
        $("#sMakCd").val(key);
        _signDocId=signDocId;

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
                subListData.read();    //detailList
                subListData2.read();    //fileList
                subListData3.read();    //signLineList

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
    function btnSign(){

        // 버튼 작동중..
        // todo

        // 0. checked 라인의 정보를 탐색한다. - 해결
        // 1. popup 창을 실행시킨다.
        // 2. popup 창으로 0.번의 데이터를 옮긴다. 옮기지 않고바로 접근이 가능하다면???
        // 3. 버튼의 show 설정을 한다. 문서 종류별로 결재여부가 갈린다.

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