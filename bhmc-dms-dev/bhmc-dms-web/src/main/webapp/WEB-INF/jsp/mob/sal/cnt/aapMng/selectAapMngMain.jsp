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
                <h2 id="content_list_title"><spring:message code="sal.lbl.agencyBsiLIst" /><!-- 대행업무 목록 --></h2>
                 <div class="title_btn">
                    <dms:access viewId="VIEW-D-12642" hasPermission="${dms:getPermissionMask('READ')}">
                        <span id="btnAdd" class="tbtn"><spring:message code="par.btn.new" /><!-- 신규 --></span>
                    </dms:access>
                </div>
            </div>
            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:40%"><spring:message code="global.lbl.proxyDstinTp" /><!-- 대행업무구분 --></span>
                    <span style="width:30%"><spring:message code="global.lbl.proxyNm" /><!-- 대행자 --></span>
                    <span style="width:30%"><spring:message code="global.lbl.proxyDt" /><!-- 대행일 --></span>
                    <span style="width:40%" class="clboth"><spring:message code="global.lbl.carRegNo" /><!--차량번호 --></span>
                    <span style="width:60%"><spring:message code='global.lbl.vinNo' /><!-- VIN NO --></span>
                    <span style="width:40%" class="clboth"><spring:message code="global.lbl.cstAmt" /><!--원가 --></span>
                    <span style="width:60%"><spring:message code='global.lbl.profitAmt' /><!-- 수익 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="sal.lbl.agencyBsiSearch" /><!-- 대행업무 조회조건  --></h2>
        </div>
       <div class="formarea">
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.aapAskDt' /></span></th>    <!-- 대행신청일자 -->
                             <td class="f_term">
                                <div class="f_item01" style = "width:82%">
                                    <input type="search" id="sStartDt" value="${oneDay}" style="width:140px"  />
                                    <span class="date" onclick="calpicker('sStartDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                                <span class="termtext"> ∼</span>
                                <div class="f_item01" style = "width:82%">
                                    <input type="search" id="sEndDt" value="${lastDay}" style="width:140px"  />
                                    <span class="date" onclick="calpicker('sEndDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN NO -->
                            <td>
                                <div class="f_text">
                                <input type="text" id="sVinNo"  class="form_input" style="width:100%">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                            <td>
                                <div class="f_text">
                                <input type="text" id="sCarRegNo"  class="form_input" style="width:100%">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.proxyDstinTp' /></th><!-- 대행업무구분 -->
                            <td>
                                <div class="f_text"><input type="text" id="sAapWrkDstinCd" class="form_comboBox" style="width:100%"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.customer" /><!-- 고객 --> </th>
                            <td>
                                <div class="f_item01">
                                    <input id="custNmSearch" name="custNmSearch" type="text" value="" class="form_input onKey_down" />
                                    <input id="custNm" name="custNm" type="hidden" value="" class="form_input" maxlength="30" data-json-obj="true" />
                                    <span class="customer" id="custSearch"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></span>
                                </div>
                            </td>
                        </tr>
                        <!-- <tr>
                            <th></th>
                            <td>
                                <div class="f_text">
                                <input type="text" id="custNo" class="form_input" style="width:100%"/>
                                </div>
                            </td>
                        </tr> -->
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.proxyNm' /></th><!-- 대행자 -->
                            <td>
                                <div class="f_text">
                                <input type="text" id="sAapEmpNm"  class="form_input" style="width:100%">
                                </div>
                            </td>
                        </tr>
                    </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <dms:access viewId="VIEW-D-12641" hasPermission="${dms:getPermissionMask('READ')}">
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code='sal.lbl.agencyBsiDetail' /><!-- 대행업무 상세정보    --></h2>
            </div>
            <div class="formarea">
                <table class="flist01">
                    <caption><spring:message code='sal.lbl.agencyBsiDetail' /><!-- 대행업무 상세정보    --></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row" class="required" readOnly><spring:message code='sal.lbl.aapAskDt' /><!-- 대행신청일자 --></th>
                            <td>
                                 <div class="f_item01">
                                    <input type="search" id="aapDt" value="" class="" readOnly />
                                    <span class="date" id="aapDtBtn" onclick="calpicker('aapDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required" ><spring:message code='global.lbl.proxyDstinTp' /><!-- 대행업무구분 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="aapWrkDstinCd"  class="f_text" placeholder=""></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.seq' /><!-- 일련번호 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="seq"  class="f_text" placeholder="" disabled="disabled"></div>
                            </td>
                        </tr>
                         <tr>
                            <th scope="row" class="required"><spring:message code='global.lbl.vinNo' /><!-- VIN --></th>
                            <td>
                                <div class="f_item01 f_disabled" id="searchVinNo">
                                    <input type="text" id="vinNo" value="">
                                    <span class="search"><spring:message code='global.lbl.search' /><!-- 검색 --></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carNo' /><!-- 차량번호 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="carRegNo"  class="f_text" placeholder="" disabled="disabled">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.contractNo' /><!-- 계약번호 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="contractNo"  class="f_text" placeholder="" disabled="disabled"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text"  id="carlineNm" class="f_text" placeholder="" disabled="disabled">
                                <input type="hidden" id="carlineCd"  >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.model' /><!-- 차관 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="modelNm"  class="f_text" placeholder="" disabled="disabled">
                                <input type="hidden" id="modelCd"  >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.ocn' /><!-- OCN --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="ocnNm"  class="f_text" placeholder="" disabled="disabled">
                                <input type="hidden" id="ocnCd"  >
                                </div>
                            </td>
                        </tr>
                         <tr>
                            <th scope="row"><spring:message code='global.lbl.customer' /><!-- 고객 --></th>
                            <td>
                                <div class="f_item01 f_disabled">
                                    <input id="sCustNm" name="sCustNm"  type="text" value="" class="form_input onKey_down" />
                                    <input id="sCustNo" name="sCustNo" value="" type="hidden" />
                                    <input id="sCustTp" name="sCustTp" value="" type="hidden" />
                                    <span class="customer" id="custSearch_1"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></span>

                                    <%-- <input type="text" id="sCustNm" value="" disabled="disabled">
                                    <span class="search"><spring:message code='global.lbl.search' /><!-- 검색 --></span> --%>
                                </div>
                                <input type="hidden" id="seq" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.proxyNm' /><!-- 대행자 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="aapEmpNm"  class="f_text" placeholder="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.cstAmt' /><!-- 원가 --></th>
                            <td>
                                <div class="f_text">
                                <!-- <input id="cstAmt" type="number" maxlength="19" value="0" onblur="fnOnblur(this.id);" onkeyup="fnOnblur(this.id);" class="f_text" placeholder=""> -->
                                <input id="cstAmt" type="text" maxlength="19" value="0" onblur="fnOnblur(this.id);" class="f_text" placeholder="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.profitAmt' /><!-- 수익 --></th>
                            <td>
                                <div class="f_text">
                                <!-- <input id="profitAmt" type="number" value="0" onblur="fnOnblur(this.id);" onkeyup="fnOnblur(this.id);" class="f_text" placeholder="" > -->
                                <input id="profitAmt" type="text" value="0" onblur="fnOnblur(this.id);" class="f_text" placeholder="" >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.total' /><!-- 합계 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <!-- <input id="aapAmt" type="number" class="f_text" value="0" onblur="fnOnblur(this.id);" onkeyup="fnOnblur(this.id);" disabled="disabled"> -->
                                <input id="aapAmt" type="text" class="f_text" value="0" disabled="disabled">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="formarea">
                <table class="flist01">
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.regDist' /> <spring:message code='global.lbl.sung' /><!-- 등록지역 성--></th>
                            <td>
                                <div class="f_text"><input type="text" id="sungCd"  class="f_text" placeholder=""></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='mis.lbl.city' /><!-- 시--></th>
                            <td>
                                <div class="f_text"><input type="text" id="cityCd"  class="f_text" placeholder=""></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.dist' /><!-- 구--></th>
                            <td>
                                <div class="f_text"><input type="text" id="distCd"  class="f_text" placeholder=""></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.regPreAmt' /><!-- 등록비 선수금 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="regPreAmt" onblur="fnDecimal(this.id);" class="f_text" placeholder="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.realRegAmt' /><!-- 실제등록비용 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="realRegAmt" onblur="fnDecimal(this.id);" class="f_text" placeholder="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" readOnly><spring:message code='sal.lbl.regExpcDt' /><!-- 등록예상일자 --></th>
                            <td>
                                 <div class="f_item01">
                                    <input type="search" id="regExpcDt" value="" class="" />
                                    <span class="date" onclick="calpicker('regExpcDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.purcTaxPreAmt' /><!-- 구입세 선수금 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="purcTaxPreAmt" onblur="bf_sumRegAmt();" class="f_text" placeholder="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.realPurcTaxAmt' /><!-- 실제구입세 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="realPurcTaxAmt" onblur="bf_sumRegAmt();" class="f_text" placeholder="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.payTheDifference' /><!-- 차액 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="regDifferenceAmt"  class="f_text" placeholder="" disabled="disabled">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='sal.lbl.regFeeAmt' /><!-- 등록수수료 --></th>
                            <td>
                                <div class="f_text f_disabled">
                                <input type="text" id="regFeeAmt" onblur="fnDecimal(this.id);" class="f_text" placeholder="">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" class="required" readOnly><spring:message code='sal.lbl.aapRealRegDt' /><!-- 대행완료일자 --></th>
                            <td>
                                 <div class="f_item01">
                                    <input type="search" id="realRegDt" value="" class=""  />
                                    <span class="date" onclick="calpicker('realRegDt')"><spring:message code='global.lbl.date' /></span>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="con_btnarea btncount2">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                <dms:access viewId="VIEW-D-12639" hasPermission="${dms:getPermissionMask('READ')}">
                    <div><span class="btnd1" id="btnSave"><spring:message code='global.btn.save' /></span></div>
                </dms:access>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';
var dlrCd="${dlrCd}";
var userId="${userId}";
var userNm="${userNm}";
var dlrNm="${dlrNm}";

var isEmptyContractNo = true;

var toDate,
    aapWrkDstinCdList        = [],
    aapWrkDstinCdObj         = {},
    gCrud;

toDate = new Date();

///aapWrkDstinCdList.push({cmmCd:"", cmmCdNm:""});
<c:forEach var="obj" items="${aapWrkDstinCdList}" varStatus="status">
    aapWrkDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    aapWrkDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//성
var sungCdDs = [];
<c:forEach var="obj" items="${sungCdList}">
 sungCdDs.push({sungNm:"${obj.sungNm}", sungCd:"${obj.sungCd}"});
</c:forEach>

$(document).ready(function() {
  //현재일자
    var toDay = "${toDay}";
    var lastDay = "${lastDay}";
    //조회조건 - 품목구분선택
    $("#sAapWrkDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:aapWrkDstinCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });
    //조회조건 - 품목구분선택
    $("#aapWrkDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:aapWrkDstinCdList
        ,index:0
        ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    function fnChkDateValue(e){
        var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');
        if(!chkDateValue.result){
            var chkArgs = chkDateValue.resultArgs;
            if(dms.string.isEmpty(chkArgs)){
                mob.notification.warning("<spring:message code='global.err.checkDateValue' />");
            }else{
                mob.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
            }
            $(this).data("kendoExtMaskedDatePicker").val('');
        }else{
            $(this).data("kendoExtMaskedDatePicker").val(new Date(chkDateValue.resultMsg));
        }

    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='global.title.agencyBsiMgmt' />"); //대행업무관리
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    var sStartDt      = $("#sStartDt").val();
    var sEndDt      = $("#sEndDt").val();
    if(sStartDt != "") $("#search1Area span[name='searchStr']").html(sStartDt +" ~ <br/>"+ sEndDt);
    //setSearchBox();
    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/cnt/aapMng/selectAapMngList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $("#listarea_noData").hide();
            mob.loading.show();

            /* var sStartDt      = $("#sStartDt").val();
            var sEndDt      = $("#sEndDt").val();
            var       = $("#sVinNo").val();
            var sCarRegNo      = $("#sCarRegNo").val();
            var sAapEmpNm      = $("#sAapEmpNm").val();
            var sAapWrkDstinCd      = $("#sAapWrkDstinCd").data("kendoExtDropDownList").value();
            //var sAapWrkDstinCd      = $("#sAapWrkDstinCd").data("kendoExtDropDownList").text();

            if(sStartDt != "") $("#search1Area span[name='searchStr']").html(sStartDt +" ~ <br/>"+ sEndDt);
            if(sVinNo != "") $("#search2Area span[name='searchStr']").text(sVinNo);
            if(sCarRegNo != "") $("#search3Area span[name='searchStr']").text(sCarRegNo);
            if(sAapWrkDstinCd != "") $("#search4Area span[name='searchStr']").text($("#sAapWrkDstinCd").data("kendoExtDropDownList").text());
            if(sAapEmpNm != "") $("#search5Area span[name='searchStr']").text(sAapEmpNm); */

            //setSearchBox();
            contentList();
        }
    });



    //추가 버튼
    $("#btnAdd").bind("click", contentOpenNew);

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

  //고객검색
    $("#custSearch").click(function(){
       var param = {};

        var custNm = $("#custNmSearch").val();

        custSearchPop(callbackCust,custNm);

    });

  //고객검색2
    $("#custSearch_1").click(function(){
       var param = {};

        var custNm = $("#sCustNm").val();

        custSearchPop(callbackCust,custNm);

    });

  //고객검색 (상세)
    /*$("#sCustNm").click(function(){
       var param = {};

        var custNm = $("#custNm").val();

        custSearchPop(callbackCustS,custNm);

    });*/

    /**
     * 성 콤보박스
     */
    $("#sungCd").kendoExtDropDownList({
        dataTextField :"sungNm"
       ,dataValueField :"sungCd"
       ,dataSource :sungCdDs
       ,optionLabel:"<spring:message code='global.lbl.check'/>"

       ,select :function(e){
           $("#cityCd").data("kendoExtDropDownList").setDataSource([]);
            $("#cityCd").data("kendoExtDropDownList").enable(true);

            $("#distCd").data("kendoExtDropDownList").setDataSource([]);
            $("#distCd").data("kendoExtDropDownList").enable(false);

            var dataItem = this.dataItem(e.item);
            if(dms.string.strNvl(dataItem.sungCd) == ""){
                $("#cityCd").data("kendoExtDropDownList").setDataSource([]);
                $("#cityCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url :"<c:url value='/sal/aap/aapMng/selectCity.do' />"
                ,data :JSON.stringify({"sungCd":dataItem.sungCd})
                ,async :false
            });
            $("#cityCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    /**
     * 시 콤보박스
     */
    $("#cityCd").kendoExtDropDownList({
        dataTextField :"cityNm"
       ,dataValueField :"cityCd"
       ,optionLabel:"<spring:message code='global.lbl.check'/>"
       ,select :function(e){
           $("#distCd").data("kendoExtDropDownList").setDataSource([]);
           $("#distCd").data("kendoExtDropDownList").enable(true);

           var dataItem = this.dataItem(e.item);
           if(dms.string.strNvl(dataItem.cityCd) == ""){
               $("#distCd").data("kendoExtDropDownList").setDataSource([]);
               $("#distCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/aap/aapMng/selectDist.do' />"
               ,data :JSON.stringify({"sungCd":$("#sungCd").data("kendoExtDropDownList").value(), "cityCd":dataItem.cityCd})
               ,async :false
           });
           $("#distCd").data("kendoExtDropDownList").setDataSource(responseJson.data);

       }
    });
    //$("#cityCd").data("kendoExtDropDownList").enable(false);

    /**
    * 구 콤보박스
    */
    $("#distCd").kendoExtDropDownList({
        dataTextField: "distNm"
       ,dataValueField:"distCd"
       ,optionLabel:"<spring:message code='global.lbl.check'/>"
    });
    //$("#distCd").data("kendoExtDropDownList").enable(false);

});


//고객검색 팝업
var popupWindow;
function custSearchPop(callbackCust,custNm){
    var custAutoBind = false;
    if(custNm !="" && custNm !=null) {
        custAutoBind = true;
    }
    popupWindow = mob.window.popup({
        windowId:"customerSearchPopupMain"
        , content:{
            url:"<c:url value='/mob/crm/cif/customerInfo/selectCustSearchPopup.do?tabSel=1' />"  //Tab선택 0:탭선택가능, 1:고객정보탭만 표시, 2:차량정보탭만 표시
            , data:{
                "autoBind":custAutoBind
                , "custNm":custNm
                , "type"  :null
                , "callbackFunc":function(data){
                    if (data != null) {

                        callbackCust(data);
                    }
                }
            }
        }
    });
}

//고객검색 팝업 callback
    function callbackCust(data){
        if ( dms.string.isNotEmpty(data.custNo) ) {
            $("#sCustNo").val(data.custNo);
            $("#custNmSearch").val(data.custNm);
            $("#sCustNm").val(data.custNm);
        }
    }

//고객검색 팝업 callback
    function callbackCustS(data){
        if ( dms.string.isNotEmpty(data.custNo) ) {
            $("#sCustTp").val(data.custTp);
            $("#sCustNo").val(data.custNo);
            $("#sCustNm").val(data.custNm);
        }
    }
// 소수점계산
fnDecimal = function(id){
    $("#"+ id +" ").val(dms.format.currency(Number(rmComm($("#"+ id +" ").val()))));
}

//차익계산
bf_sumRegAmt = function(){
    var purcTaxPreAmt  = Number(rmComm($("#purcTaxPreAmt").val()));
    var realPurcTaxAmt = Number(rmComm($("#realPurcTaxAmt").val()));

    if(purcTaxPreAmt == null){
        purcTaxPreAmt = 0;
        $("#purcTaxPreAmt").val(dms.format.currency(0));
    }

    if(realPurcTaxAmt == null){
        realPurcTaxAmt = 0;
        $("#realPurcTaxAmt").val(dms.format.currency(0));
    }
    $("#purcTaxPreAmt").val( dms.format.currency(purcTaxPreAmt));
    $("#realPurcTaxAmt").val( dms.format.currency(realPurcTaxAmt));
    $("#regDifferenceAmt").val( dms.format.currency(purcTaxPreAmt - realPurcTaxAmt));
}

function fnOnblur(id){
    var cstAmt = Number(rmComm($("#cstAmt").val()));
    var profitAmt = Number(rmComm($("#profitAmt").val()));

    //var unCom_cstAmt = uncomma($("#aapAmt").val());

    var aapAmt = cstAmt - profitAmt;

    $("#cstAmt").val(dms.format.currency(cstAmt));
    $("#profitAmt").val(dms.format.currency(profitAmt));
    $("#aapAmt").val(dms.format.currency(aapAmt));

}
function rmComm(str){
    return str.replace(/,/g, '');
}
//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  //$("iframe").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
    document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
}

//상세페이지 보기

function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    $("#aapDt").val(dataItem.aapDt);                             //대행일자
    $("#aapDtBtn").css("pointer-events", "none");                //대행일자 달력팝업버튼
    //$("#aapWrkDstinCd").val(dataItem.aapWrkDstinCd);             //대행업무구분코드
    $("#aapWrkDstinCd").data("kendoExtDropDownList").value(dataItem.aapWrkDstinCd);

    $("#seq").val(dataItem.seq);                                 //일련번호
    $("#vinNo").val(dataItem.vinNo);                             //VIN

    // 계약번호가 있을경우 검색을 못하도록 막는다.
    if(dms.string.isNotEmpty(dataItem.contractNo) || dataItem.contractNo == null){
        $("#vinNo").attr("disabled", true);
        isEmptyContractNo = false;
    }else{
        $("#vinNo").attr("disabled", false);
        isEmptyContractNo = true;
    }

    $("#carRegNo").val(dataItem.carRegNo);                       //차량번호
    $("#contractNo").val(dataItem.contractNo);                   //등록번호
    $("#carlineCd").val(dataItem.carlineCd);                     //차종코드
    $("#carlineNm").val(dataItem.carlineNm);                     //차종명
    $("#modelCd").val(dataItem.modelCd);                         //모델코드
    $("#modelNm").val(dataItem.modelNm);                         //모델명
    $("#ocnCd").val(dataItem.ocnCd);                             //OCN코드
    $("#ocnNm").val(dataItem.ocnNm);                             //OCN명
    $("#sCustNm").val(dataItem.custNm);                          //고객
    $("#aapEmpNm").val(dataItem.aapEmpNm);                       //대행자명
    $("#cstAmt").val(dms.format.currency(dataItem.cstAmt));      //원가금액
    $("#profitAmt").val(dms.format.currency(dataItem.profitAmt));//수익금액
    $("#aapAmt").val(dms.format.currency(dataItem.aapAmt));      //대행금액

    if(dataItem.sungCd != null &&  dataItem.sungCd != ""){
        $("#sungCd").data("kendoExtDropDownList").value(dataItem.sungCd); //성
    }else{
        $("#sungCd").data("kendoExtDropDownList").value(0); //성
    }

    if(dataItem.cityCd != null &&  dataItem.cityCd != ""){
        var cityCd = $("#cityCd").data("kendoExtDropDownList");
        cityCd.setDataSource([{"cityNm":dataItem.cityNm, "cityCd":dataItem.cityCd}]);
        cityCd.value(dataItem.cityCd);
        //cityCd.enable(false);
    }else{
        $("#cityCd").data("kendoExtDropDownList").value(0);
        //$("#cityCd").data("kendoExtDropDownList").enable(false);
    }

    if(dataItem.distCd != null &&  dataItem.distCd != ""){
        var distCd = $("#distCd").data("kendoExtDropDownList");
        distCd.setDataSource([{"distNm":dataItem.distNm, "distCd":dataItem.distCd}]);
        distCd.value(dataItem.distCd);
        //distCd.enable(false);
    }else{
        $("#distCd").data("kendoExtDropDownList").value(0);
        //$("#distCd").data("kendoExtDropDownList").enable(false);
    }

    $("#regPreAmt").val(dms.format.currency(dataItem.regPreAmt));               //등록비선수금
    $("#realRegAmt").val(dms.format.currency(dataItem.realRegAmt));             //실제등록비용
    $("#regExpcDt").val(chgServerDate2Str(dataItem.regExpcDt));                                    //등록예상일자
    $("#purcTaxPreAmt").val(dms.format.currency(dataItem.purcTaxPreAmt));       //구입세 선수금
    $("#realPurcTaxAmt").val(dms.format.currency(dataItem.realPurcTaxAmt));     //실제 구입세
    $("#regDifferenceAmt").val(dms.format.currency(dataItem.regDifferenceAmt)); //차액
    bf_sumRegAmt();

    $("#regFeeAmt").val(dms.format.currency(dataItem.regFeeAmt));               //등록수수료
    $("#realRegDt").val(chgServerDate2Str(dataItem.realRegDt));                                    //대행완료일자
    detailDisable("mod");
  }

function contentOpenNew() {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");
    $("#header_title span").removeAttr("class");

    $("#aapDt").val("");                                            //대행일자
    //$("#aapDt").attr("class","required");
    $("#aapDtBtn").css("pointer-events", "none");                   //대행일자 달력팝업버튼
    $("#aapWrkDstinCd").data("kendoExtDropDownList").value("");        //대행업무구분코드
    $("#seq").val("");                                              //일련번호
    $("#vinNo").val("");                                            //차대번호
    $("#contractNo").val("");                                       //등록번호
    // 등록번호가 없는것으로 세팅
    isEmptyContractNo = true;

    $("#carlineCd").val("");                                        //차종코드
    $("#carlineNm").val("");                                        //차종명
    $("#modelCd").val("");                                          //모델코드
    $("#modelNm").val("");                                          //모델명
    $("#ocnCd").val("");                                            //OCN코드
    $("#ocnNm").val("");                                            //OCN명
    $("#sCustNm").val("");                                          //고객
    $("#carRegNo").val("");                                         //차량등록번호
    $("#aapEmpNm").val("");                                         //대행자명
    $("#cstAmt").val(dms.format.currency(0));                       //원가금액
    $("#profitAmt").val(dms.format.currency(0));                    //수익금액
    $("#aapAmt").val(dms.format.currency(0));                       //대행금액

    $("#sungCd").data("kendoExtDropDownList").value(0);                //성
    $("#cityCd").data("kendoExtDropDownList").value(0);                //시
    $("#distCd").data("kendoExtDropDownList").value(0);                //구

    $("#regPreAmt").val(dms.format.currency(0));                    //등록비선수금
    $("#realRegAmt").val(dms.format.currency(0));                   //실제등록비용
    $("#regExpcDt").val("");                                        //등록예상일자
    $("#purcTaxPreAmt").val(dms.format.currency(0));                //구입세 선수금
    $("#realPurcTaxAmt").val(dms.format.currency(0));               //실제 구입세
    $("#regDifferenceAmt").val(dms.format.currency(0));             //차액
    $("#regFeeAmt").val(dms.format.currency(0));                    //등록수수료
    $("#realRegDt").val("");                                        //대행완료일자
    detailDisable("ins");
  }

  function detailDisable(val){
      if(val == "ins") { //신규등록
          $("#aapDt").attr("disabled",true);                       //대행일자
          $("#aapDt").val("${toDay}");
          $("#aapWrkDstinCd").attr("disabled",false);               //대행업무구분코드
          //$("#seq").attr("disabled",false);                         //일련번호
          $("#vinNo").attr("disabled",false);                       //차대번호
          //$("#carlineCd").attr("disabled",false);                   //차종코드
          //$("#carlineNm").attr("disabled",false);                   //차종명
          //$("#modelCd").attr("disabled",false);                     //모델코드
          //$("#modelNm").attr("disabled",false);                     //모델명
          $("#ocnCd").attr("disabled",false);                       //OCN코드
          //$("#ocnNm").attr("disabled",false);                       //OCN명
          //$("#carRegNo").attr("disabled",true);                    //차량등록번호
          $("#sCustNm").attr("disabled",false);                     //고객
          $("#aapEmpNm").attr("disabled",false);                    //대행자명
          $("#cstAmt").attr("disabled",false);                      //원가금액
          $("#profitAmt").attr("disabled",false);                   //수익금액
          $("#aapAmt").attr("disabled",true);                       //대행금액

          $("#cityCd").data("kendoExtDropDownList").enable(false);     //시
          $("#distCd").data("kendoExtDropDownList").enable(false);     //구
          $("#regDifferenceAmt").attr("disabled",true);             //차액

      } else {  //수정
          $("#aapDt").attr("disabled",true);                      //대행일자
          //$("#aapWrkDstinCd").attr("disabled",true);              //대행업무구분코드
          $("#seq").attr("disabled",true);                          //일련번호
          $("#vinNo").attr("disabled",true);                        //차대번호
          $("#searchVinNo").css("display","block");
          $("#carlineCd").attr("disabled",true);                    //차종코드
          $("#carlineNm").attr("disabled",true);                    //차종명
          $("#modelCd").attr("disabled",true);                      //모델코드
          $("#modelNm").attr("disabled",true);                      //모델명
          $("#ocnCd").attr("disabled",true);                        //OCN코드
          $("#ocnNm").attr("disabled",true);                        //OCN명
          $("#carRegNo").attr("disabled",true);                     //차량등록번호
          //$("#aapEmpNm").attr("disabled",true);                   //대행자명
          //$("#cstAmt").attr("disabled",true);                     //원가금액
          //$("#profitAmt").attr("disabled",true);                  //수익금액
          $("#aapAmt").attr("disabled",true);                       //대행금액
      }

      $("#cstAmt").val(dms.format.currency($("#cstAmt").val()));
      $("#profitAmt").val(dms.format.currency($("#profitAmt").val()));
      $("#aapAmt").val(dms.format.currency($("#aapAmt").val()));


      /*
      $(".f_text>input, .f_item01>input, .f_item02>input, .f_select select").each(function(index,arrInput){
          if(arrInput.parentNode.nodeName =="DIV"){
              var orgClassName = arrInput.parentNode.className;
              if(arrInput.disabled ==false){
                  arrInput.parentNode.className = orgClassName.replace(/f_disabled/gi,"");
              }else{
                  arrInput.parentNode.className = orgClassName + " f_disabled";
              }
          }
      });
      */
      checkInputFormDisabled();
      /* $(".f_text>input[disabled], .f_item01>input[disabled], .f_item02>input[disabled], .f_select select[disabled]").parent().addClass("f_disabled");
      $(".f_text>input[readonly], .f_item01>input[readonly], .f_item02>input[readonly], .f_select select[readonly]").parent().addClass("f_disabled"); */

  }
  //버튼 - 입고확정
    $("#btnSave").kendoButton({
        click:function(e){

            if ( dms.string.isEmpty($("#vinNo").val()) && dms.string.isEmpty($("#contractNo").val()) ){
                dms.notification.warning("<spring:message code='global.lbl.vinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#vinNo").focus();
                return false;
            }

            if ( dms.string.isEmpty( $("#aapWrkDstinCd").data("kendoExtDropDownList").value() )){
                dms.notification.warning("<spring:message code='global.lbl.proxyDstinTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#aapWrkDstinCd").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#aapDt").val()) ){
                dms.notification.warning("<spring:message code='global.lbl.proxyDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#aapDt").focus();
                return false;
            }

            confirmOpen(confirmMsgSave,'doSave',y,n);
        }
    });

    $("#searchVinNo").click(function(){

        // 계약번호가 있을경우에는 고객검색 팝업창을 안보여주도록 한다.
        if(!isEmptyContractNo) return;

        popupWindow = mob.window.popup({
            windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
            //,title:"<spring:message code='global.title.vehicleMaster' />aaaaa"
            ,content:{
                url:"<c:url value='/mob/sal/cmm/selectVehicleMasterPopup.do'/>"
                ,data:{
                    "type"  :null
                    ,"autoBind":true
                    ,"dataInfo" : {"vinNo":$("#vinNo").val() }
                    ,"callbackFunc":function(data){
                        //alert(kendo.stringify(data[0].carRegNo));
                        $("#vinNo").val(data.vinNo);
                        $("#carlineNm").val(data.carlineNm);
                        $("#carlineCd").val(data.carlineCd);
                        $("#modelNm").val(data.modelNm);
                        $("#modelCd").val(data.modelCd);
                        $("#ocnNm").val(data.ocnNm);
                        $("#ocnCd").val(data.ocnCd);
                    }
                }
            }
        });
    });

    function doSave(){

        var data ={
                "dlrCd"         :dlrCd,
                //"aapDt"         :$("#aapDt").data("kendoExtMaskedDatePicker").value(),                             //대행일자
                //"aapDt"         :$("#aapDt").val(),                                       //대행일자
                "aapDt"         :new Date($("#aapDt").val()),                               //대행일자
                "contractNo"    :$("#contractNo").val(),                                    //계약번호
                "aapWrkDstinCd" :$("#aapWrkDstinCd").data("kendoExtDropDownList").value(),     //대행업무구분코드
                "seq"           :$("#seq").val(),                                           //일련번호
                "vinNo"         :$("#vinNo").val(),                                         //차대번호
                "carRegNo"      :$("#carRegNo").val(),                                      //차대번호
                "carlineCd"     :$("#carlineCd").val(),                                     //차종코드
                "modelCd"       :$("#modelCd").val(),                                       //모델코드
                "ocnCd"         :$("#ocnCd").val(),                                         //OCN코드
                "custNm"        :$("#sCustNm").val(),                                        //고객명
                "custNo"        :$("#sCustNo").val(),                                        //고객넘버
                "custTp"        :$("#sCustTp").val(),                                        //고객타입
                "aapEmpNm"      :$("#aapEmpNm").val(),                                      //대행자명
                "cstAmt"        :Number($("#cstAmt").val())+"",                               //원가금액
                "profitAmt"     :Number($("#profitAmt").val())+"",                            //수익금액
                "aapAmt"        :Number($("#aapAmt").val()),                               //대행금액

                "sungCd"            :$("#sungCd").data("kendoExtDropDownList").value(),        //성
                "cityCd"            :$("#cityCd").data("kendoExtDropDownList").value(),        //시
                "distCd"            :$("#distCd").data("kendoExtDropDownList").value(),        //구
                "regPreAmt"         :Number($("#regPreAmt").val())+"",                        //등록비 선수금
                "realRegAmt"        :Number($("#realRegAmt").val())+"",                       //실제등록비용
                "regExpcDt"         :new Date($("#regExpcDt").val()),                       //등록예상일자
                "purcTaxPreAmt"     :Number($("#purcTaxPreAmt").val())+"",                    //구입세 선수금
                "realPurcTaxAmt"    :Number($("#realPurcTaxAmt").val())+"",                   //실제구입세
                "regFeeAmt"         :Number($("#regFeeAmt").val())+"",                        //등록수수료
                "realRegDt"         :new Date($("#realRegDt").val())                        //대행완료일자

                };
        mob.loading.show();
        setTimeout(function () {
            $.ajax({
                 url:"<c:url value='/mob/sal/cnt/aapMng/saveAapMng.do' />"
                ,data:kendo.stringify(data)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,async:false
                ,success:function(result) {
                    mob.loading.hide();
                    /* if (result === 1) {
                        mob.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>");
                        //$("#detailList").get(0).contentDocument.location.reload(); // 목록 iframe 새로고침
                        contentList();
                    } else {
                        console.log('errorResult:',result);
                        if(result === 0){
                            mob.notification.error("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.err.regFailedParam' arguments='${receive}'/>");
                        }
                    } */

                    /* mob.notification.success("<spring:message code='par.lbl.receive' var='receive' /><spring:message code='global.info.regSuccessParam' arguments='${receive}'/>"); */
                    //mob.notification.success("<spring:message code='global.info.save.regSuccessParam'/>");
                    contentList();
                    setTimeout(function() {mob.notification.success("<spring:message code='global.info.save.regSuccessParam'/>");}, 500);
                }
                ,error:function(jqXHR,status,error) {
                    mob.loading.hide();
                    mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
                }
            });
        },200);
    }
</script>