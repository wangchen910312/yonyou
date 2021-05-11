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
                <h2 id="content_list_title"><spring:message code="global.lbl.stockCarList" /><!-- 재고차종 리스트 --></h2>
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
                                <th scope="row"><span><spring:message code="global.lbl.stockCd" /><!-- 재고유형 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code="global.lbl.cmpCarYn" /><!-- 회사차여부 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code="global.lbl.cmpCarDstinCd" /><!-- 회사차구분 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search4Area">
                                <th scope="row"><span><spring:message code="global.lbl.strge" /><!-- 창고 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search5Area">
                                <th scope="row"><span><spring:message code="global.lbl.location" /><!-- 위치 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            <tr id="search6Area">
                                <th scope="row"><span><spring:message code="global.lbl.vinNum" /><!-- VIN NO --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search7Area">
                                <th scope="row"><span><spring:message code="global.lbl.carLine" /><!-- 차종 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search8Area">
                                <th scope="row"><span><spring:message code="global.lbl.model" /><!-- 모델 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search9Area">
                                <th scope="row"><span><spring:message code="global.lbl.ocn" /><!-- OCN --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search10Area">
                                <th scope="row"><span><spring:message code="global.lbl.extColor" /><!-- 외장색 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                            <tr id="search11Area">
                                <th scope="row"><span><spring:message code="global.lbl.intColor" /><!-- 내장색 --></span></th>
                                <td><span name="searchStr"></span> <span class="btn_delete"><spring:message code="global.lbl.del" /></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- search keyword // -->

            <div class="listarea">
                <div class="dlistitem listhead">
                    <span style="width:35%"><spring:message code="global.lbl.carlineNm" /><!-- 차종명 --></span>
                    <span style="width:45%"><spring:message code="global.lbl.extColorNm" />/<spring:message code="global.lbl.intColorNm" /><!-- 외장색명/내장색명 --></span>
                    <span style="width:20%"><spring:message code="global.lbl.qty" /><!-- 수량 --></span>
                    <span style="width:35%" class="clboth"><spring:message code="global.lbl.ocnNm" /><!-- OCN명 --></span>
                    <span style="width:65%"><spring:message code="global.lbl.modelNm" /><!-- 모델명 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="global.lbl.stockCarListSearch" /><!-- 재고차종 리스트 조회조건  --></h2>
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
                        <th scope="row"><spring:message code="global.lbl.stockCd" /><!-- 재고유형 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sStockTpDS" class="form_comboBox" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.cmpCarYn" /><!-- 회사차여부 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCmpCarYn" class="form_comboBox" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.cmpCarDstinCd" /><!-- 회사차구분 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCmpCarDstinCd" class="form_comboBox" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.strge" /><!-- 창고 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sStrgeCd" class="form_comboBox" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.location" /><!-- 위치 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sLocCd" class="form_comboBox" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.vinNum" /><!-- VIN NO --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sVinNo" class="f_text" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCarlineCd" class="form_comboBox" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.model" /><!-- 모델 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sModelCd" class="form_comboBox" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.ocn" /><!-- OCN --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sOcnCd" class="form_comboBox" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.extColor" /><!-- 외장색 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sExtColorCd" class="form_comboBox" ></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.intColor" /><!-- 내장색 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sIntColorCd" class="form_comboBox" ></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" >
        <section id="content_DetailList" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="global.lbl.stockCarDetailInfo" /><!-- 재고차종 상세정보 --></h2>
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
                                <th scope="row"><spring:message code="global.lbl.carlineNm" /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="dtCarlineNm" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.modelNm" /><!-- 모델 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="dtModelNm" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocnNm" /><!-- OCN --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="dtOcnNm" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.extColor" /><!-- 외장색 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="dtExtColorNm" disabled="disabled"></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.intColor" /><!-- 내장색 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="dtIntColorNm" disabled="disabled"></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="content_title">
                <h2><span id="lblInvcDocNo" ></span> <spring:message code="global.lbl.stockCarDetailList" /><!-- 재고차종 상세리스트 --></h2>
            </div>
            <div class="listarea01">
                <div class="dlistitem listhead">
                    <span style="width:70%"><spring:message code="global.lbl.vinNo" /><!-- vinNo --></span>
                    <span style="width:30%"><spring:message code="global.lbl.stockCd" /><!-- 재고유형 --></span>
                    <span style="width:40%" class="clboth"><spring:message code='global.lbl.cmpCarYn' />/<spring:message code='global.lbl.gubun' /><!-- 구분 --></span>
                    <span style="width:30%"><spring:message code='global.lbl.strge' /><!-- 창고 --></span>
                    <span style="width:30%"><spring:message code='global.lbl.location' /><!-- 위치 --></span>
                </div>
                <iframe id="detailList" border="" frameborder="0" width="100%" height=""></iframe>
            </div>
        </section>
    </div>



    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="global.lbl.stockCarDetailInfo" /><!-- 재고차종 상세정보 --></h2>
            </div>
            <div class="formarea">
                <table  class="flist01">
                    <caption><spring:message code="global.lbl.stockCarDetailInfo" /><!-- 재고차종 상세정보 --></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                    <tbody>
                    <input type="hidden" id="ncarDstinCd" value=""/>
                    <input type="hidden" id="locNm" value=""/>
                    <input type="hidden" id="bfStockTp" value=""/>
                    <input type="hidden" id="bfCmpCarYn" value=""/>
                    <input type="hidden" id="bfCmpCarDstinCd" value=""/>
                    <input type="hidden" id="bfStrgeCd" value=""/>
                    <input type="hidden" id="bfLocCd" value=""/>
                    <input type="hidden" id="dlrCd" value=""/>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vinNum" /><!-- VIN NO --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="vinNo" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.stockCd' /><!-- 재고유형 --></th>
                            <td>
                                <div class="f_text"><input id="stockTp" type="text" data-type="combo" class="form_comboBox" data-mandatory="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.cmpCarYn' /><!-- 회사차여부 --></th>
                            <td>
                                <div class="f_text"><input id="cmpCarYn" type="text" data-type="combo" class="form_comboBox" data-mandatory="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.cmpCarDstinCd' /><!-- 회사차구분 --></th>
                            <td>
                                <div class="f_text"><input id="cmpCarDstinCd" type="text" data-type="combo" class="form_comboBox" data-mandatory="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.strge' /><!-- 창고 --></th>
                            <td>
                                    <div class="f_text"><input id="strgeCd" type="text" data-type="combo" class="form_comboBox" data-mandatory="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.location' /><!-- 위치 --></th>
                            <td>
                                    <div class="f_text"><input id="locCd" type="text" data-type="combo" class="form_comboBox" data-mandatory="true" /></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carLine" /><!-- 차종 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="carlineNm" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.model" /><!-- 모델 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="modelNm" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ocn" /><!-- OCN --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="ocnNm" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.extColor" /><!-- 외장색 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="extColorNm" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.intColor" /><!-- 내장색 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="intColorNm" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vinSts" /><!-- 차량상태 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="carStatCd" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ownStatCd" /><!-- 보유상태 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="ownStatCd" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.orderType" /><!-- 주문유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="ordTp" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.engnNo" /><!-- 엔진번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="enginModelCd" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.certNo" /><!-- 합격증번호 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="certNo" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.grDt" /><!-- 입고일 --></th>
                            <td>
                                <div class="f_text f_disabled"><input id="grDt" type="text" placeholder="" disabled="disabled"/></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="con_btnarea btncount2">
                <div><span id="btnSave" class="btnd1"><spring:message code='global.btn.save' /><!-- 저장 --></span></div>
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
            </div>

        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
    <div id="docu_top" style="display:none">TOP</div>



<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';

var mainSelObj ; //재고관리 메인리스트 클릭시 상세 리스트 파라메터 Object

$(".skeyarea .btn_delete").click(function(){
    var obj = $(this).parent().parent();
    switch(obj.attr("id")){
        case "search1Area" :
            $("#sStockTpDS").data("kendoExtDropDownList").value("");
            break;
        case "search2Area" :
            $("#sCmpCarYn").data("kendoExtDropDownList").value("");
            break;
        case "search3Area" :
            $("#sCmpCarDstinCd").data("kendoExtDropDownList").value("");
            break;
        case "search4Area" :
            $("#sStrgeCd").data("kendoExtDropDownList").value("");
            break;
        case "search5Area" :
            $("#sLocCd").data("kendoExtDropDownList").value("");
            break;
        case "search6Area" :
            $("#sVinNo").val("");
            break;
        case "search7Area" :
            $("#sCarlineCd").data("kendoExtDropDownList").value("");
            break;
        case "search8Area" :
            $("#sModelCd").data("kendoExtDropDownList").value("");
            break;
        case "search9Area" :
            $("#sOcnCd").data("kendoExtDropDownList").value("");
            break;
        case "search10Area" :
            $("#sExtColorCd").data("kendoExtDropDownList").value("");
            break;
        case "search11Area" :
            $("#sIntColorCd").data("kendoExtDropDownList").value("");
            break;
        default :
            break;
    }

    obj.find("span[name='searchStr']").text("");
    setSearchBox();
    contentList();
});

function setSearchBox(){
    var sStockTpDS      = $("#sStockTpDS").data("kendoExtDropDownList").value();
    var sCmpCarYn      = $("#sCmpCarYn").data("kendoExtDropDownList").value();
    var sCmpCarDstinCd = $("#sCmpCarDstinCd").data("kendoExtDropDownList").value();
    var sStrgeCd       = $("#sStrgeCd").data("kendoExtDropDownList").value();
    var sLocCd         = $("#sLocCd").data("kendoExtDropDownList").value();
    var sVinNo         = $("#sVinNo").val();
    var sCarlineCd     = $("#sCarlineCd").data("kendoExtDropDownList").value();
    var sModelCd       = $("#sModelCd").data("kendoExtDropDownList").value();
    var sOcnCd         = $("#sOcnCd").data("kendoExtDropDownList").value();
    var sExtColorCd    = $("#sExtColorCd").data("kendoExtDropDownList").value();
    var sIntColorCd    = $("#sIntColorCd").data("kendoExtDropDownList").value();

    if(sStockTpDS == "" && sCmpCarYn == "" && sCmpCarDstinCd == "" && sVinNo == "" && sStrgeCd == "" &&
            sLocCd  == "" && sCarlineCd == "" && sModelCd  == "" && sOcnCd == "" && sExtColorCd == "" && sIntColorCd == "" ){
        $(".skeyarea").hide();
    }else{
        $(".skeyarea").show();
        if(sStockTpDS == "") $("#search1Area").hide();
        else $("#search1Area").show();
        if(sCmpCarYn == "") $("#search2Area").hide();
        else $("#search2Area").show();
        if(sCmpCarDstinCd == "") $("#search3Area").hide();
        else $("#search3Area").show();
        if(sStrgeCd == "") $("#search4Area").hide();
        else $("#search4Area").show();
        if(sLocCd == "") $("#search5Area").hide();
        else $("#search5Area").show();
        if(sVinNo == "") $("#search6Area").hide();
        else $("#search6Area").show();
        if(sCarlineCd == "") $("#search7Area").hide();
        else $("#search7Area").show();
        if(sModelCd == "") $("#search8Area").hide();
        else $("#search8Area").show();
        if(sOcnCd == "") $("#search9Area").hide();
        else $("#search9Area").show();
        if(sExtColorCd == "") $("#search10Area").hide();
        else $("#search10Area").show();
        if(sIntColorCd == "") $("#search11Area").hide();
        else $("#search11Area").show();

    }
    setMainListHeight();
}

//재고유형 SAL074
var stockDSList = [];
var stockTpObj = {};
<c:forEach var="obj" items="${stockTpDS}">
    stockDSList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
    stockTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//회사차구분 SAL053
var cmpCarDstinCdDSList = [];
var cmpCarDstinCdObj = {};
<c:forEach var="obj" items="${cmpCarDstinCdDS}">
    cmpCarDstinCdDSList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
    cmpCarDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

//위치
var locDSList = [];
var locCdObj = {};

// 차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

// 차량상태 SAL001
var carStatCdObj = {};
<c:forEach var="obj" items="${carStatCdDS}">
    carStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 보유상태 SAL149
var ownStatCdObj = {};
<c:forEach var="obj" items="${ownStatCdDS}">
    ownStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 오더유형 SAL137
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpDS}">
    ordTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var searchClickFl = false;
$(document).ready(function() {
    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }
    // 재고유형
    $("#sStockTpDS").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stockDSList
       ,optionLabel:"<spring:message code='global.lbl.all' />"           //전체
    });

    // 회사차여부
    $("#sCmpCarYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
       ,optionLabel:"<spring:message code='global.lbl.all' />"           //전체
    });

    // 회사차구분
    $("#sCmpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:cmpCarDstinCdDSList
       ,optionLabel:"<spring:message code='global.lbl.all' />"           //전체
    });

    // 창고
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:"<spring:message code='global.lbl.all' />"           //전체
       ,select:function (e){
           var dataItem = this.dataItem(e.item);
           $("#sLocCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sLocCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.cmmCd == ""){
               $("#sLocCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sLocCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/mob/sal/inv/stockState/selectLocation.do' />"
               ,data:JSON.stringify( dataItem.cmmCd )
               ,async:false
           });
           $("#sLocCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 위치
    $("#sLocCd").kendoExtDropDownList({
        dataTextField :"locNm"
       ,dataValueField:"locCd"
       //,dataSource:locDSList
       ,optionLabel:"<spring:message code='global.lbl.all' />"           //전체
    });
    $("#sLocCd").data("kendoExtDropDownList").enable(false);

    // 재고유형(상세화면)
    $("#stockTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stockDSList
       ,optionLabel:"<spring:message code='global.lbl.check' />"           //선택
    });

    // 회사차여부(상세화면)
    $("#cmpCarYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
       ,optionLabel:"<spring:message code='global.lbl.check' />"           //선택
    });

    // 회사차구분(상세화면)
    $("#cmpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:cmpCarDstinCdDSList
       ,optionLabel:"<spring:message code='global.lbl.check' />"           //선택
    });

    // 창고(상세화면)
    $("#strgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:"<spring:message code='global.lbl.check' />"           //선택
       ,select:function (e){
           var dataItem = this.dataItem(e.item);
           $("#locCd").data("kendoExtDropDownList").setDataSource([]);
           $("#locCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.cmmCd == ""){
               $("#locCd").data("kendoExtDropDownList").setDataSource([]);
               $("#locCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/inv/stockState/selectLocation.do' />"
               ,data:JSON.stringify( dataItem.cmmCd )
               ,async:false
           });

           locDSList = responseJson.data;

           locCdObj = {};
           $.each(locDSList, function(idx, obj){
               locCdObj[obj.locCd] = obj.locNm;
           });

           $("#locCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 위치(상세화면)
    $("#locCd").kendoExtDropDownList({
        dataTextField :"locNm"
       ,dataValueField:"locCd"
       //,dataSource:locDSList
       ,optionLabel:"<spring:message code='global.lbl.check' />"           //선택
    });

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cnt/contract/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cnt/contract/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cnt/contract/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cnt/contract/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);


    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='sal.title.stockState' />"); //재고상태관리
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/inv/stockState/selectStockStateList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            var sStockTpDS      = $("#sStockTpDS").data("kendoExtDropDownList").text();
            var sCmpCarYn      = $("#sCmpCarYn").data("kendoExtDropDownList").text();
            var sCmpCarDstinCd = $("#sCmpCarDstinCd").data("kendoExtDropDownList").text();
            var sStrgeCd       = $("#sStrgeCd").data("kendoExtDropDownList").text();
            var sLocCd         = $("#sLocCd").data("kendoExtDropDownList").text();
            var sVinNo         = $("#sVinNo").val();
            var sCarlineCd     = $("#sCarlineCd").data("kendoExtDropDownList").text();
            var sModelCd       = $("#sModelCd").data("kendoExtDropDownList").text();
            var sOcnCd         = $("#sOcnCd").data("kendoExtDropDownList").text();
            var sExtColorCd    = $("#sExtColorCd").data("kendoExtDropDownList").text();
            var sIntColorCd    = $("#sIntColorCd").data("kendoExtDropDownList").text();

            if(sStockTpDS != "") $("#search1Area span[name='searchStr']").text(sStockTpDS);
            if(sCmpCarYn != "") $("#search2Area span[name='searchStr']").text(sCmpCarYn);
            if(sCmpCarDstinCd != "") $("#search3Area span[name='searchStr']").text(sCmpCarDstinCd);
            if(sStrgeCd != "") $("#search4Area span[name='searchStr']").text(sStrgeCd);
            if(sLocCd != "") $("#search5Area span[name='searchStr']").text(sLocCd);
            if(sVinNo != "") $("#search6Area span[name='searchStr']").text(sVinNo);
            if(sCarlineCd != "") $("#search7Area span[name='searchStr']").text(sCarlineCd);
            if(sModelCd != "") $("#search8Area span[name='searchStr']").text(sModelCd);
            if(sOcnCd != "") $("#search9Area span[name='searchStr']").text(sOcnCd);
            if(sExtColorCd != "") $("#search10Area span[name='searchStr']").text(sExtColorCd);
            if(sIntColorCd != "") $("#search11Area span[name='searchStr']").text(sIntColorCd);

            searchClickFl = true;
            setSearchBox();
            contentList();
        }
    });

    var saveData = {};
    saveData.insertList = [];
    saveData.updateList = [];
    saveData.deleteList = [];

    // 버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            var gridData = {
                    vinNo          :$("#vinNo").val(),
                    ncarDstinCd    :$("#ncarDstinCd").val(),
                    stockTp        :$("#stockTp").data("kendoExtDropDownList").value(),
                    cmpCarYn       :$("#cmpCarYn").data("kendoExtDropDownList").value(),
                    cmpCarDstinCd  :$("#cmpCarDstinCd").data("kendoExtDropDownList").value(),
                    strgeCd        :$("#strgeCd").data("kendoExtDropDownList").value(),
                    locCd          :$("#locCd").data("kendoExtDropDownList").value(),
                    locNm          :$("#locNm").val(),
                    bfStockTp      :$("#bfStockTp").val(),
                    bfCmpCarYn     :$("#bfCmpCarYn").val(),
                    bfCmpCarDstinCd:$("#bfCmpCarDstinCd").val(),
                    bfStrgeCd      :$("#bfStrgeCd").val(),
                    bfLocCd        :$("#bfLocCd").val(),
                    carlineCd      :$("#carlineCd").val(),
                    carlineNm      :$("#carlineNm").val(),
                    modelCd        :$("#modelCd").val(),
                    modelNm        :$("#modelNm").val(),
                    ocnCd          :$("#ocnCd").val(),
                    ocnNm          :$("#ocnNm").val(),
                    extColorCd     :$("#extColorCd").val(),
                    extColorNm     :$("#extColorNm").val(),
                    intColorCd     :$("#intColorCd").val(),
                    intColorNm     :$("#intColorNm").val(),
                    carStatCd      :$("#carStatCd").val(),
                    ownStatCd      :$("#ownStatCd").val(),
                    ordTp          :$("#ordTp").val(),
                    enginModelCd   :$("#enginModelCd").val(),
                    certNo         :$("#certNo").val(),
                    grDt           :$("#grDt").val(),
                    dlrCd          :$("#dlrCd").val()
            };


            saveData.updateList.push(gridData);

            $.ajax({
                url:"<c:url value='/mob/sal/inv/stockState/multiStockState.do' />"
                ,data:JSON.stringify(saveData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    mob.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    //저장후 상세리스트 재호출
                    contentDetailList(mainSelObj);
                    //정상적으로 반영 되었습니다.
                    mob.notification.success("<spring:message code='global.info.success'/>");
                }
            });


        }
    });





    //버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentList(); }
        else if ($("#content_DetailList").css("display") == "block") { contentList(); }
        else if ($("#content_detail").css("display") == "block") { contentDetailList(mainSelObj); }
        //else if ($("#content_detail").css("display") == "block") { contentDetailListNonRefresh($("#sInvcDocNo").val()); setTimeout(function(){ setCheckItemList();}, 1000);}

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
            //$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });
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
  $("#content_DetailList").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");
  document.getElementById("mainList").contentWindow.document.location.reload();
}

//검색페이지 보기
function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_DetailList").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");

}

//상세리스트  보기
function contentDetailList(obj) {
  $("#content_list").css("display","none");
  $("#content_search").css("display","none");
  $("#content_DetailList").css("display","block");
  $("#content_detail").css("display","none");


  $("#dtCarlineNm").val(obj.carlineNm);
  $("#dtModelNm").val(obj.modelNm);
  $("#dtOcnNm").val(obj.ocnNm);
  $("#dtExtColorNm").val(obj.extColorNm);
  $("#dtIntColorNm").val(obj.intColorNm);


  mainSelObj = obj;
  // 상세리스트 조회
  $("#detailList").attr("src", "<c:url value='/mob/sal/inv/stockState/selectStockStateSubList.do' />");
}



//상세페이지 보기
function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_DetailList").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    $("#vinNo").val(dataItem.vinNo);  //차대번호
    $("#ncarDstinCd").val(dataItem.ncarDstinCd);
    $("#stockTp ").data("kendoExtDropDownList").value(dataItem.stockTp); //재고유형
    $("#cmpCarYn").data("kendoExtDropDownList").value(dataItem.cmpCarYn); //회사차여부
    $("#cmpCarDstinCd").data("kendoExtDropDownList").value(dataItem.cmpCarDstinCd); //회사차구분
    $("#strgeCd").data("kendoExtDropDownList").value(dataItem.strgeCd); //창고
    $("#locCd").data("kendoExtDropDownList").value(dataItem.locCd); //위치
    $("#locNm").val(dataItem.locNm);
    $("#bfStockTp").val(dataItem.bfStockTp);
    $("#bfCmpCarYn").val(dataItem.bfCmpCarYn);
    $("#bfCmpCarDstinCd").val(dataItem.bfCmpCarDstinCd);
    $("#bfStrgeCd").val(dataItem.bfStrgeCd);
    $("#bfLocCd").val(dataItem.bfLocCd);
    $("#carlineCd").val(dataItem.carlineCd);
    $("#carlineNm").val(dataItem.carlineNm);
    $("#modelCd").val(dataItem.modelCd);
    $("#modelNm").val(dataItem.modelNm);
    $("#ocnCd").val(dataItem.ocnCd);
    $("#ocnNm").val(dataItem.ocnNm);
    $("#extColorCd").val(dataItem.extColorCd);
    $("#extColorNm").val(dataItem.extColorNm);
    $("#intColorCd").val(dataItem.intColorCd);
    $("#intColorNm").val(dataItem.intColorNm);
    $("#carStatCd").val(dataItem.carStatCd);
    $("#ownStatCd").val(dataItem.ownStatCd);
    $("#ordTp").val(dataItem.ordTp);
    $("#enginModelCd").val(dataItem.enginModelCd);
    $("#certNo").val(dataItem.certNo);
    $("#grDt").val(dataItem.grDt);
    $("#dlrCd").val(dataItem.dlrCd);




}


</script>