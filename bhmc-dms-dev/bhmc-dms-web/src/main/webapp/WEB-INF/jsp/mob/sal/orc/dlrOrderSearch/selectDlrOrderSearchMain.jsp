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
                <h2 id="content_list_title"><spring:message code="sal.menu.dlrOrderSearch" /></h2>
            </div>
            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:50%" ><spring:message code="global.lbl.carLine" /><!-- 차종 --></span>
                    <span style="width:50%" ><spring:message code="global.lbl.extColor" />/<spring:message code="global.lbl.intColor" /><!-- 외장색/내장색 --></span>

                    <span style="width:50%" ><spring:message code="global.lbl.ocn" /><!-- OCN -->/<spring:message code="global.lbl.model" /><!-- OCN/차관 --></span>
                    <span style="width:50%" ><spring:message code="global.lbl.orderType" /><!-- 오더유형 --></span>

                    <span style="width:50%" ><spring:message code="sal.lbl.pdiDt" /><!-- 오더분배일자--></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.evalConfMth" /><!-- 심사평가월--></span>

                    <span style="width:50%" ><spring:message code="sal.lbl.ordStat" /><!-- 오더상태 --></span>
                    <span style="width:50%" ><spring:message code="sal.lbl.whPrc" /><!-- 할인후가격 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>

            <div class="btnfixed">
                <div class="dlistitem bgNone" style="text-align: left;">
                    <span style="width:15%"><spring:message code='global.lbl.total' />:<!-- 합계 --></span>
                    <span style="width:10%" id="totalSum"></span>
                </div>
            </div>

        </section>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="sal.menu.dlrOrderSearch" /> <spring:message code="global.title.searchCondition" /></h2>
            </div>
           <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:38%;">
                        <col style="">
                    </colgroup>
                     <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.orderType' /><!-- 주문유형 --></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sOrderType" type="form_comboBox"/></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.ordStat' /><!-- 주문상태 --></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sOrdStat" type="form_comboBox"/></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><input type="radio" id="sRadioY" name="sRadio" value="Y" onclick="javascript:changedRadio(true);" class="form_check" style="width:15px" checked/><spring:message code='sal.lbl.ordSetDt' /></th>    <!-- 오더배정일자 -->
                                <td class="f_term">
                                    <div class="f_item01" style="width:91%">
                                        <input type="search" id="sOrdStartDt" />
                                        <span class="date" id="sOrdStartDt_Span" onclick="calpicker('sOrdStartDt')" ><spring:message code='global.lbl.date' /></span>
                                    </div>
                                    <span class="termtext" style="padding:0px; margin-top:10px;"> ∼</span>
                                    <div class="f_item01" style="width:91%">
                                        <input type="search" id="sOrdEndDt" />
                                        <span class="date" id="sOrdEndDt_Span" onclick="calpicker('sOrdEndDt')" ><spring:message code='global.lbl.date' /></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><input type="radio" id="sRadioN" name="sRadio" value="N" onclick="javascript:changedRadio(false);" class="form_check" style="width:15px"/><spring:message code='sal.lbl.evalConfMth' /><!-- 심사평가월 --></th>
                                <td class="f_term">
                                    <div class="f_item01" style="width: 97%;">
                                        <input id="sEvalConfMth"  class="form_datepicker" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sCarLine" type="form_comboBox"/></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.model' /><!-- 차관--></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sModel" type="form_comboBox"/></div>
                                    <input id="hiddenFscCode" type="hidden" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.ocn' /><!-- OCN --></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sOcn" type="form_comboBox"/></div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>

            <div class="co_group">
                <div class="content_title">
                    <h2><spring:message code="sal.lbl.ordSetDtInfo" /><!-- 상세정보 --><input id="innerVal" type ="text" disabled style="width:50%; text-align:right"/></h2>
                    <div class="title_btn"><span class="co_open co_close"><span></span></span></div>
                </div>
                <div class="co_view" style="display:none">
                    <div class="formarea" id="formarea" >
                        <table class="flist01">
                            <caption><spring:message code="global.lbl.basicInfo" /></caption>
                            <colgroup>
                                <col style="width:30%;">
                                <col style="">
                            </colgroup>
                                <span id ="innerHtml">
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-13095" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>

        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="sal.menu.dlrOrderSearch" /> <spring:message code="global.lbl.dtlInfo" /></h2>
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
                                <th scope="row"><spring:message code="global.lbl.carlineCd" /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carlineCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.carlineNm" /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carlineNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.model" /><!-- 차관 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="model" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocnCode" /><!-- OCN 코드--></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ocnCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocnNm" /><!-- OCN 명칭--></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ocnNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.extColorCd" /><!-- 외장색 코드--></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="extColorCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.extColorNm" /><!-- 외장색 명칭 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="extColorNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.intColor" /><!-- 내장색 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="intColor" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code="global.lbl.qty" /><!-- 수량 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="qty" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.orderType" /><!-- 주문유형 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="orderType" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.ordStat" /><!-- 오더상태 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ordStat" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.chrgDt" /><!-- 주문일자 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ordDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="salesAdvisor" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ordNo" /><!-- 주문번호 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ordSeq" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.plant" /><!-- 공장 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="plant" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.evalConfMth" /><!-- 심사평가월 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="evalConfMth" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.llbl.pdiDt" /><!-- 오더분배일자(PDI분배일) --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="pdiDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.misSetDt" /><!-- 임무배정일 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="misSetDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.tranSchDt" /><!-- 운송계획일 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="tranSetDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vinDt" /><!-- VIN배정일 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="vinDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.factoryOutDate" /><!-- 공장출고일--></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="factoryOutDate" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.grDt" /><!-- 입고일--></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="grDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.saleDt" /><!-- 판매일자 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="saleDt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.vinNo" /><!-- VIN --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="vinNo" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.carRetlAmt" /><!-- 지도가 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carRetlAmt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.dcRate" /><!-- 할인율(%) --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="dcRate" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.bDcAmt" /><!-- 할인금액 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="bDcAmt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.deductionAmt" /><!-- 공제금액 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="deductionAmt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="con_btnarea">
                    <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                </div>
            </section>
        </div>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

var toDay   = "${toDay}";     // 현재일자
var oneDay  = "${oneDay}";   // 해당월 1일

/**
 * 주문유형 콤보박스
 */

var ordTpList = [];
var ordTpObj = {};
    <c:forEach var="obj" items="${ordTpDS}">
        <c:if test="${obj.cmmCd ne 'N3' && obj.cmmCd ne 'N5' && obj.cmmCd ne 'NS' && obj.cmmCd ne 'N7'}">
         ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
        ordTpObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
    </c:forEach>

  //주문상태 SAL150
var ordStatCdList = [];
var ordStatCdObj = {};
<c:forEach var="obj" items="${ordStatCdDS}">
    <c:if test="${obj.cmmCd ne 'A' && obj.cmmCd ne 'B' && obj.cmmCd ne 'O' && obj.cmmCd ne 'R' && obj.cmmCd ne 'S'}">
        ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//하치장 SAL152
var vinmVlocCdList = [];
var vinmVlocCdObj = {};
<c:forEach var="obj" items="${vinmVlocDS}">
  vinmVlocCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  vinmVlocCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {
  //현재일자

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();

    }

    initPage();

    $("#sOrdStartDt").val(oneDay);
    $("#sOrdEndDt").val(toDay);

    // 타이틀
    $("#header_title").html("<spring:message code='sal.menu.dlrOrderSearch' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/orc/dlrOrderSearch/selectDlrOrderSearchList.do' />");

    // 주문유형
    $("#sOrderType").kendoExtMobileMultiSelectDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:ordTpList
        , select:onSelectOrdTp
     });

    // 주문상태
    $("#sOrdStat").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordStatCdList
       ,optionLabel:"<spring:message code='global.lbl.all' />"
    });

    //조회 년월
    $("#sEvalConfMth").kendoExtMaskedDatePicker({
        value:""
       ,start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //차종
    $("#sCarLine").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "
       ,select:function(e){

           var dataItem = this.dataItem(e.item);
           $("#sModel").data("kendoExtDropDownList").setDataSource([]);
           $("#sModel").data("kendoExtDropDownList").enable(true);

           $("#sOcn").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcn").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           if(dataItem.carlineCd == ""){
               $("#sModel").data("kendoExtDropDownList").setDataSource([]);
               $("#sModel").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModel").data("kendoExtDropDownList").setDataSource(responseJson.data);


       }
    });

    // 모델
    $("#sModel").kendoExtDropDownList({
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,optionLabel:" "
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcn").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcn").data("kendoExtDropDownList").enable(true);

           if(dataItem.modelCd == ""){
               $("#sOcn").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcn").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcnCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":$("#sCarLine").val(), "sFscCd":dataItem.fscCd})
               ,async:false
           });
           $("#sOcn").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModel").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcn").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "
        ,select:function(e){

            var dataItem = this.dataItem(e.item);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColorCombo.do' />"
                ,data:JSON.stringify({"sModelCd":dataItem.modelCd})
                ,async:false
                ,success:function(data) {
                    $("#hiddenFscCode").val(dataItem.modelCd);
                }
            });

        }
    });
    $("#sOcn").data("kendoExtDropDownList").enable(false);

    // 버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_detail").css("display") == "block") { contentListNonRefresh(); }
    });

    //버튼 - TOP
    $("#docu_top").bind("click", function()
    {
        $("body,html").animate({scrollTop:0}, 200);
    });

    //상단으로 이동
    $(window).scroll(function () {
        if ($(this).scrollTop() != 0)
        {
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {

            var chekingFromYyyyMm = ($("#sOrdStartDt").val().replace("-", "")).substring(0,6);
            var chekingToYyyyMm = ($("#sOrdEndDt").val().replace("-", "")).substring(0,6);

            // 검색시작월과 검색종료월 다른 경우 검색불가 함
            if(chekingFromYyyyMm != chekingToYyyyMm){
                // 검색시작년월과 검색종료년월은 동일해야합니다.
                mob.notification.warning("<spring:message code='sal.info.srchYyyyMmCompare'/>");
                return false;
            }

            contentList();
        }
    });

    $("#sEvalConfMth").data("kendoExtMaskedDatePicker").enable(false);

    $("#btnCalendarConfirm").bind("click", function(){
        setTimeout(function(){ getOrdLst();}, 200);

    });

    $("#sEvalConfMth").siblings(".k-select").css("background-image","url(<c:url value='/resources/img/mob/ico_form.png' />)");
    $("#sEvalConfMth").siblings(".k-select").css("background-position","-5px 124px");
    $("#sEvalConfMth").siblings(".k-select").css("background-size","37px 255px");
    $("#sEvalConfMth").siblings(".k-select").css(" background-color","black");
    $("#sEvalConfMth").height(34);
    //$("#sEvalConfMth").css("width","100%");

});
</script>

<script>
//메인화면 가기
function goMain() {
  window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
}

//목록페이지 보기
function contentList() {
  $("#content_search").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload(); // 목록 iframe 새로고침
  setTimeout(function(){ setMainListHeight();}, 200);
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
  //changedRadio(true);
  getOrdLst();
}

//상세페이지 보기

function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");
    $("#header_title span").removeAttr("class");

    $("#carlineCd").val(dataItem.carlineCd);
    $("#carlineNm").val(dataItem.carlineNm);
    $("#model").val(dataItem.modelNm);
    $("#ocnCd").val(dataItem.ocnCd);
    $("#ocnNm").val(dataItem.ocnNm);
    $("#extColorCd").val(dataItem.extColorCd);
    $("#extColorNm").val(dataItem.extColorNm);
    $("#intColor").val(dataItem.intColorNm);
    $("#qty").val(dataItem.ordQty);
    $("#orderType").val(changeOrdTp(dataItem.ordTp));
    $("#ordStat").val(changeStatTp(dataItem.ordStatCd));
    $("#ordDt").val(chgDate2Str(dataItem.ordDate));
    $("#salesAdvisor").val(dataItem.chrgCd);
    $("#ordSeq").val(dataItem.ordSeq);
    $("#plant").val(changePlant(dataItem.vinmVloc));
    $("#evalConfMth").val(dataItem.emont);
    $("#pdiDt").val(chgDate2Str(dataItem.pdiDt));
    $("#misSetDt").val(dataItem.misSetDt);
    $("#tranSetDt").val(dataItem.tranSetDt);
    $("#vinDt").val(chgDate2Str(dataItem.vinDt));
    $("#factoryOutDate").val(chgDate2Str(dataItem.retailDt));
    $("#grDt").val(chgDate2Str(dataItem.dlrGrDt));
    $("#saleDt").val(chgDate2Str(dataItem.custSaleDt));
    $("#vinNo").val(dataItem.vinNo);
    $("#carRetlAmt").val(kendo.toString(dataItem.mdpr, 'n2'));
    $("#dcRate").val(dataItem.dcRate);
    $("#bDcAmt").val(kendo.toString(dataItem.damt, 'n2'));
    $("#deductionAmt").val(kendo.toString(dataItem.dcAmt, 'n2'));
  }

function onSelectOrdTp(e) {

    var ordTpCd = this.dataItem(e.item).cmmCd;

    if( ordTpCd != null && ordTpCd != ""){

        if( ordTpCd == "N1" ){

            $("#sOrdStartDt").val("");
            $("#sOrdEndDt").val("");

            $(".f_term").hide();
            $(".group-OrdDt").show();
        }else{
            if( $("#sOrdStartDt").val() == "" || $("#sOrdEndDt").val() == null ){
                $("#sOrdStartDt").val("");
                $("#sOrdEndDt").val("");
            }

            $(".group-OrdDt").hide();
            $(".f_term").show();
        }
    }

};
//오더종류가져오기
function getOrdLst(){
    var chekingFromYyyyMmLength = $("#sOrdStartDt").val().length;
    var chekingToYyyyMmLength = $("#sOrdEndDt").val().length;
    var chekingFromYyyyMm = ($("#sOrdStartDt").val().replace("-", "")).substring(0,6);
    var chekingToYyyyMm = ($("#sOrdEndDt").val().replace("-", "")).substring(0,6);
    var responseJson = {};

    if(Number(chekingFromYyyyMmLength)+Number(chekingToYyyyMmLength) == 20){
        if(chekingFromYyyyMm == chekingToYyyyMm){
           responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/orc/dlrOrderSearch/selectMonthDlrOrderTypes.do' />"
               ,data:JSON.stringify({"sConfirmDtVar":chekingFromYyyyMm})
               ,async :false
           });
           console.log("responseJson",responseJson);
           $("#ordLst").val(responseJson.data[0].ordLst);
           var partsOfStr = responseJson.data[0].ordLst.split(',');
           var ordTpListCustom =[];
           for(var i=0; i<partsOfStr.length; i++){
               pos = partsOfStr[i].lastIndexOf("]");
               var temp=partsOfStr[i].substring(2,pos);
               for(var j=0; j<ordTpList.length; j++){
                   if(ordTpList[j].cmmCd==temp){
                       ordTpListCustom.push(ordTpList[j]);
                   }
               }
           }
           console.log(ordTpListCustom);
           /*
           $("#sOrderType").kendoExtMobileMultiSelectDropDownList({
               dataTextField:"cmmCdNm"
               , dataValueField:"cmmCd"
               , dataSource:ordTpListCustom
               , select:onSelectOrdTp
            });
           */
           $("#innerHtml").html("");
           for(var j=0; j<partsOfStr.length; j++){
               $("#innerHtml").append('<div class="f_text"><div class="f_text"><input type="text" id="innerHtml'+j+'" value="'+ partsOfStr[j] +'" readonly/></div>');
           }

           $("#innerVal").val($("#innerHtml0").val());

        }else{
           $("#ordLst").val("");
        }
    }
}

//radio 버튼 처리
function changedRadio(flg){
   if(flg){
       $("#sEvalConfMth").data("kendoExtMaskedDatePicker").enable(false);
       $("#sOrdStartDt").removeAttr("disabled");
       $("#sOrdEndDt").removeAttr("disabled");

       $("#sOrdStartDt_Span").bind("click", function(){
           calpicker('sOrdStartDt');
       });

       $("#sOrdEndDt_Span").bind("click", function(){
           calpicker('sOrdEndDt');
       });

       $("#sEvalConfMth").data("kendoExtMaskedDatePicker").value('');
       $("#sOrdStartDt").val(oneDay);
       $("#sOrdEndDt").val(toDay);
       $(".co_group").show();
       getOrdLst();
   }else{
       $("#sEvalConfMth").data("kendoExtMaskedDatePicker").enable(true);
       $("#sOrdStartDt").attr("disabled",true);
       $("#sOrdEndDt").attr("disabled",true);

       $("#sOrdStartDt_Span").attr("onclick","").unbind("click");
       $("#sOrdEndDt_Span").attr("onclick","").unbind("click");

       $("#sOrdEndDt_Span").unbind("click");

       $("#sEvalConfMth").data("kendoExtMaskedDatePicker").value(oneDay);
       $("#sOrdStartDt").val('');
       $("#sOrdEndDt").val('');
       $(".co_group").hide();

   }
}

changeOrdTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = ordTpObj[val];
    }
    return returnVal;
};

changeStatTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = ordStatCdObj[val];
    }
    return returnVal;
};

changePlant = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = vinmVlocCdObj[val];
    }
    return returnVal;
}
</script>