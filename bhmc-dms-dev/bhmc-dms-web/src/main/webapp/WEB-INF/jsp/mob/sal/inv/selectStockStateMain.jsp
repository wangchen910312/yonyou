<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- script -->
<script>

var dateFormat =  '<dms:configValue code="dateFormat" />';

var mainSelObj ; //재고관리 메인리스트 클릭시 상세 리스트 파라메터 Object

//yyyy-MM-dd
//var vDtyyyyMMdd = "${_dateFormat}";

var toDay = "${toDay}";         // 현재일자
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매관리자 여부 : 판매인도 판매관리자도 아닌 사람은 관리자와 같은 권한을 갖는다. [2016.10.27 : 구상우K ]
var saleAdminYn = "${saleAdminYn}";

//판매사원 리스트
var selectSaleEmpDSList = [{saleEmpNm:"", saleEmpCd:""}];
var selectSaleEmpObj = {};
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
    selectSaleEmpObj["${obj.usrId}"] = "[${obj.usrId}]${obj.usrNm}";
</c:forEach>

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//재고용차량상태 SAL192
var carStatCdObj = {};
<c:forEach var="obj" items="${carStatCdDS}">
    carStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//보유상태 SAL149
var ownStatCdObj = {};
<c:forEach var="obj" items="${ownStatCdDS}">
    ownStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//손상여부 SAL049
var damageList = [];
var damageObj = {};
<c:forEach var="obj" items="${damageDS}">
    damageList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    damageObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    <c:if test="${obj.strgeTp eq '02'}">
        storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    </c:if>
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

//위치
var locDSList = [];
var locCdObj = {};

//회사차구분 SAL053
var cmpCarDstinCdDSList = [];
var cmpCarDstinCdObj = {};
<c:forEach var="obj" items="${cmpCarDstinCdDS}">
    cmpCarDstinCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    cmpCarDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//재고유형
var tStockTpList = [];
var tStockTpObj = {};
tStockTpList.push({"cmmCd":"3", "cmmCdNm":"<spring:message code='sal.lbl.all' />", "useYn":"Y"});
tStockTpList.push({"cmmCd":"1", "cmmCdNm":"<spring:message code='sal.lbl.stock' />", "useYn":"Y"});
tStockTpList.push({"cmmCd":"2", "cmmCdNm":"<spring:message code='sal.lbl.trsf' />", "useYn":"Y"});
tStockTpObj["3"] = "<spring:message code='sal.lbl.all' />";
tStockTpObj["1"] = "<spring:message code='sal.lbl.stock' />";
tStockTpObj["2"] = "<spring:message code='sal.lbl.trsf' />";

var saveData = {};
saveData.insertList = [];
saveData.updateList = [];
saveData.deleteList = [];

var _title="<spring:message code='sal.title.stockiMgmt' />";

$(document).ready(function() {

 // 재고
    $("#tStockTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:tStockTpList
     });


    // 창고
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    /**
     * 차종 콤보박스
     */
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField :"carlineNm"
       ,dataValueField :"carlineCd"
       ,dataSource :carLineCdList
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
       ,select:function(e){
            $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sFscCd").data("kendoExtDropDownList").enable(true);

            var dataItem = this.dataItem(e.item);
            if(dataItem.carlineCd == ""){
                $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sFscCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url :"<c:url value='/sal/inv/stockMnt/selectFscList.do' />"
                ,data :JSON.stringify({"sCarlineCd":dataItem.carlineCd})
                ,async :false
            });
            $("#sFscCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            if(responseJson.data.length == 0){
                $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sFscCd").data("kendoExtDropDownList").enable(false);
            }
       }
    });

    /**
     * 모델 콤보박스
     */
     $("#sFscCd").kendoExtDropDownList({
         dataTextField :"fscNm"
        ,dataValueField :"fscCd"
        ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
     });
     //$("#sFscCd").data("kendoExtDropDownList").enable(false);

    // 검색조건 : 시작일-종료일 날짜 비교
    fnChkSearchDate = function(e){
        //if(dms.string.isEmpty($(this).val())){return;}
        if(dms.string.isEmpty(e.data.from.val())){return;}
        if(dms.string.isEmpty(e.data.to.val())){return;}

        var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
        var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
        if(startDt > endDt){
            dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
            $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
            $(this).focus();
        }
     }
    // 입고일자 시작일은 종료일보다 클수가 없다.
    $("#sStartGrDt").on('change', {from:$("#sStartGrDt"), to:$("#sEndGrDt")}, fnChkSearchDate);
    $("#sEndGrDt").on('change', {from:$("#sStartGrDt"), to:$("#sEndGrDt")}, fnChkSearchDate);



    // 고정
    $("#sBlockYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ynList)
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });


    /*------------------------detail---------------------------*/
    // 차량상황
    $("#damageCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(damageList)
       ,change:function(e) {
            var blockSaleAdvNo = dms.string.strNvl($("#blockSaleAdvNo").data("kendoExtDropDownList").value());
            var ownStatCd = dms.string.strNvl($("#ownStatCd").val());
            if(e.sender._selectedValue == "01"){
                $("#blockYn").data("kendoExtDropDownList").value("Y");
            }else{
                // 판매고문 , 임시배정
                if(blockSaleAdvNo != "" || ownStatCd == "A"){
                    $("#blockYn").data("kendoExtDropDownList").value("Y");
                }else{
                    $("#blockYn").data("kendoExtDropDownList").value("N");
                }
            }
        }
    });
    // 고정
    $("#blockYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ynList)
    });

    $("#blockYn").data("kendoExtDropDownList").enable(false);

    // 판매고문
    $("#blockSaleAdvNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField:"saleEmpCd"
       ,dataSource:dms.data.cmmCdFilter(selectSaleEmpDSList)
       ,change:function(e) {
            /* if(dms.string.isNotEmpty(e.sender._selectedValue)){
                $("#blockYn").data("kendoExtDropDownList").value("Y");
            }else{
                $("#blockYn").data("kendoExtDropDownList").value("N");
            } */

           var damageCd = $("#damageCd").data("kendoExtDropDownList").value();// dms.string.strNvl(selectRow.damageCd);
           var ownStatCd = dms.string.strNvl($("#ownStatCd").val());

           if( dms.string.isNotEmpty(e.sender._selectedValue) ){
               $("#blockYn").data("kendoExtDropDownList").value("Y");
           }else{
               if(damageCd != "02" || ownStatCd == "A"){
                   $("#blockYn").data("kendoExtDropDownList").value("Y");
               }else{
                   $("#blockYn").data("kendoExtDropDownList").value("N");
               }
           }
        }
    });

    // 위치
    $("#locCd").kendoExtDropDownList({
        dataTextField :"locNm"
       ,dataValueField:"locCd"
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    // 창고
    $("#strgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
       ,change:function(e) {
           if(e.sender._selectedValue == ""){
               $("#locCd").data("kendoExtDropDownList").enable(false);
           }else{
               $("#locCd").data("kendoExtDropDownList").enable(true);
               var responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/inv/stockState/selectLocation.do' />"
                   ,data:JSON.stringify(dms.string.strNvl(e.sender._selectedValue))
                   ,async:false
               });
               locDSList = responseJson.data;

               locCdObj = {};
               $.each(locDSList, function(idx, obj){
                   locCdObj[obj.locCd] = obj.locNm;
               });
               $("#locCd").data("kendoExtDropDownList").setDataSource(locDSList);
           }
       }
    });
     // 회사차여부
    $("#cmpCarYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ynList)
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });
    //회사차유형
    $("#cmpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:cmpCarDstinCdDSList
       ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
    });

    // 타이틀
    $("#header_title").html(_title); //재고상태관리

    // 목록 조회

    $("#mainList").attr("src", "<c:url value='/mob/sal/inv/stockState/selectStockStateList.do' />");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            contentList2();
            $("#listarea_noData9 p").hide();
            mob.loading.show();

        }
    });

    // 버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            //confirmOpen(confirmMsgSave,'doSave',y,n);
            calLayerPopupPostion("#layerPopup");
            $(".blind").show();//ios webview에서 pushLayer가 제대로 동작하지 않아서... .blind는 defaultMobTemplate.jsp에 있다.
            $("#layerPopup").show();

        }
    });

    //버튼 - 이전
    $("#docu_prev").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh2(); }
        else if ($("#content_DetailList").css("display") == "block") {
            contentListNonRefresh2();
            $("#content_DetailList").css("display","none");
            openSearchBtn();
        }
        else if ($("#content_list2").css("display") == "block") {
            contentListNonRefresh();
            $("#content_list2").css("display","none");
            $("#header_title").html(_title);
            $("#tStockTp").data("kendoExtDropDownList").value(""); //차종
            $("#sVinNo").val("");
            $("#sCarlineCd").val("");
            $("#sFscCd").val("");

        }
    });

    $("#detailCloseBtn").bind("click", function()
    {
        if ($("#content_list").css("display") == "block") { goMain(); }
        else if ($("#content_search").css("display") == "block") { contentListNonRefresh(); }
        else if ($("#content_DetailList").css("display") == "block") {
            contentListNonRefresh2();
            $("#content_DetailList").css("display","none");
            openSearchBtn();
        }
    });

    $("th").bind("click",function(){
        /* $("#locCd").kendoExtDropDownList().data("kendoExtDropDownList").popup.bind("close", function (e) {
            e.preventDefault();
        }); */
        //e.preventDefault();
    });

});
</script>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
<section class="lay_pop" id="layerPopup">
<div class="lay_cont2"><spring:message code="cmm.info.saveYn" /></div>
<div class="btnarea">
<span class='btnd1' onclick='layerClose2("#layerPopup");'><spring:message code="global.lbl.n" /></span>
<span class='btnd1' onclick='layerClose2("#layerPopup");doSave();'><spring:message code="global.lbl.yes" /></span>
</div>
</section>
<section id="content">
    <!-- content_list -->
    <section id="content_list">
        <div class="content_title conttitlePrev">
            <h2 id="content_list_title"><spring:message code="sal.title.stockiMgmt" /><!-- 재고관리 리스트 --></h2>
        </div>
        <div class="listarea">
            <div class="dlistitem listhead">
                <span style="width:50%"><spring:message code="global.lbl.carLine" /><!-- 차종 --></span>
                <span style="width:50%"><spring:message code="sal.lbl.qty" /><!-- 수량 --></span>
            </div>
            <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
        </div>
            <div class="btnfixed">
                <div class="dlistitem bgNone" style="text-align: left;">
                    <span style="width:50%"><spring:message code='global.lbl.total' />:</span>
                    <span style="width:50%" id="totalSum"></span>
                </div>
            </div>
    </section>

    <!-- content_list -->
    <section id="content_list2" style="display:none">
        <div class="content_title conttitlePrev">
            <h2 id="content_list_title2"><spring:message code="global.lbl.stockCarList" /><!-- 재고차종 리스트 --></h2>
        </div>
        <div class="listarea">
            <div class="dlistitem listhead" id="_listhead">
                <span style="width:50%"><spring:message code="global.lbl.carLine" /><!-- 차종 --></span>
                <span style="width:50%"><spring:message code="global.lbl.vinNo" /><!-- 빈번호 --></span>
                <span style="width:50%"><spring:message code="global.lbl.ocn" /><!-- OCN명 -->/<spring:message code="global.lbl.model" /><!-- 차관 --></span>
                <span style="width:50%"><spring:message code="global.lbl.extColor" />/<spring:message code="global.lbl.intColor" /><!-- 외장색명/내장색명 --></span>
                <span style="width:50%"><spring:message code="global.lbl.stockCd" /><!-- 재고유형 --></span>
                <span style="width:50%"><spring:message code="sal.lbl.giDdCnt" /><!-- 재고일령(공장출고) --></span>
            </div>
            <iframe id="mainList2" border="0" frameborder="0" width="100%" height=""></iframe>
            <div class="dlistitem bgNone" style="display:none;" id="listarea_noData9"><span></span></div>
        </div>
            <div class="btnfixed">
                <div class="dlistitem bgNone" style="text-align: left;">
                    <span style="width:50%"><spring:message code='global.lbl.total' />:</span>
                    <span style="width:50%" id="subTotalSum"></span>
                </div>
            </div>
    </section>


<!-- content_search -->
<section id="content_search" class="content_search" style="display:none;">
    <div class="content_title conttitlePrev">
        <h2><spring:message code="sal.title.stockiMgmt" /><spring:message code="global.title.search" /><!-- 재고관리  조회조건  --></h2>
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
                        <div class="f_text"><input type="text" id="tStockTp" class="form_comboBox" ></div>
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
                        <div class="f_text"><input type="text" id="sFscCd" class="form_comboBox" ></div>
                    </td>
            </tbody>
        </table>
    </div>
    <div class="con_btnarea">
        <dms:access viewId="VIEW-D-12612" hasPermission="${dms:getPermissionMask('READ')}">
            <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /></span></span>
        </dms:access>
    </div>
</section>

<!-- content_detail -->
<div class="content_right" id="stockStateForm">
    <section id="content_DetailList" class="content_detail" style="display:none">
        <div class="co_group">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="mob.lbl.sal.stockDetail" /><!-- 재고차종 상세정보 --></h2>
            </div>
            <div class="formarea">
                <table class="flist01">
                    <caption></caption>
                    <colgroup>
                        <col style="width:30%;">
                        <col style="">
                    </colgroup>
                     <tbody class="detialListDataReadOnly">
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.stockCd" /><!-- 재고유형 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="carStatNm" name="carStatNm" disabled="disabled" data-json-obj="true"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vinNo" /><!-- vin no --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="vinNo" disabled="disabled" data-json-obj="true"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.factoryModelCd" /><!-- 공장모델코드 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="vinmF20010" disabled="disabled" data-json-obj="true"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carlineCd" /><!-- 차종코드 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="carlineCd" disabled="disabled"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.carlineNm" /><!-- 차종명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="carlineNm" disabled="disabled"></div>
                            </td>
                        </tr>
                        <%-- <tr>
                            <th scope="row"><spring:message code="global.lbl.model" /><!-- 모델 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="modelCd" disabled="disabled"></div>
                            </td>
                        </tr> --%>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.model" /><!-- 차관 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="modelNm" disabled="disabled"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ocn" /><!-- OCN --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="ocnCd" disabled="disabled"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.ocnNm" /><!-- OCN명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="ocnNm" disabled="disabled"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.extColor" /><!-- 외장색 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="extColorCd" disabled="disabled"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.extColorNm" /><!-- 외장색명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="extColorNm" disabled="disabled"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.intColor" /><!-- 내장색 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="intColorCd" disabled="disabled"></div>
                            </td>
                        </tr>
                        <%-- <tr>
                            <th scope="row"><spring:message code="global.lbl.intColorNm" /><!-- 내장색명 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="intColorNm" disabled="disabled"></div>
                            </td>
                        </tr> --%>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.orderType" /><!-- 오더유형 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="ordTpNm" disabled="disabled"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.strYn" /><!-- 전략여부 --></th>
                            <td>
                                <div class="f_text f_disabled"><input type="text" id="strYnNm" disabled="disabled" class="showOnly"></div>
                                <input type="hidden" id="strYn">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.vehicleStat" /><!-- 차량상황 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="damageCd" class="form_comboBox" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.block" /><!-- 고정 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="blockYn" class="form_comboBox"></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.salesAdvisor" /><!-- 판매고문 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="blockSaleAdvNo" class="form_comboBox" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.strge" /><!-- 창고 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="strgeCd" class="form_comboBox" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row" style="display:none;"><spring:message code="global.lbl.location" /><!-- 위치 --></th>
                            <td>
                                <div class="f_text" style="display:none;"><input type="text" id="locCd" class="form_comboBox" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.strgeRemark" /><!-- 창고비고 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="temp2" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.cmpCarYn" /><!-- 회사차여부 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="cmpCarYn" class="form_comboBox" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.cmpCarDstinCd" /><!-- 회사차유형 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="cmpCarDstinCd" class="form_comboBox" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.openYn" /><!-- 공개여부 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="openYnNm" disabled="disabled" class="showOnly"></div>
                                <input type="hidden" id="openYn" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.retlPrcUse" /><!-- 사용자금유형 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="usedAmtTpNm" disabled="disabled" ></div>
                                <input type="hidden" id="usedAmtTp" disabled="disabled" >
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.bank" /><!-- 은행 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="bankNm" disabled="disabled" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.pltGiDt" /><!-- 출고일자 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="pltGiDt" disabled="disabled" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.grDt" /><!-- 입고일자 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="dlrGrDt" disabled="disabled" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.engnNo" /><!-- 엔진번호 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="enginModelCd" disabled="disabled" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.certNo" /><!-- 합격증번호 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="certNo" disabled="disabled" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.giDdCnt" /><!-- 재고연령(출고) --></th>
                            <td>
                                <div class="f_text"><input type="text" id="giDdCnt" disabled="disabled" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.grDdCnt" /><!-- 재고일령(입고) --></th>
                            <td>
                                <div class="f_text"><input type="text" id="grDdCnt" disabled="disabled" ></div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.carRetlAmt" /><!-- 지도가격 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="whslPrcCurrency" disabled="disabled" class="showOnly"></div>
                                <input type="hidden" id="whslPrc">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.contractNo" /><!-- 계약번호 --></th>
                            <td>
                                <div class="f_text"><input type="text" id="contractNo" disabled="disabled" ></div>
                            </td>
                        </tr>
                        <input type="hidden" id="carId">
                        <input type="hidden" id="ncarDstinCd">
                        <input type="hidden" id="modelCd">
                        <input type="hidden" id="intColorNm">
                        <input type="hidden" id="ordTp">
                        <input type="hidden" id="locNm">
                        <input type="hidden" id="bfDamageCd">
                        <input type="hidden" id="bfBlockYn">
                        <input type="hidden" id="bfBlockSaleAdvNo">
                        <input type="hidden" id="bfStrgeCd">
                        <input type="hidden" id="bfLocCd">
                        <input type="hidden" id="bfCmpCarYn">
                        <input type="hidden" id="bfCmpCarDstinCd">
                        <input type="hidden" id="retlPrc">
                        <input type="hidden" id="carStatCd">
                        <input type="hidden" id="ownStatCd">
                        <input type="hidden" id="mmCnt">
                        <input type="hidden" id="dlrCd">
                        <input type="hidden" id="dlrNm">
                    </tbody>
                </table>
            </div>
        </div>
        <div class="con_btnarea btncount2">
            <div><span class="btnd1" id="detailCloseBtn" ><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            <div><span class="btnd1" id="btnSave"><spring:message code='global.btn.save' /><!--저장--></span></div>
        </div>
</div>
</section>

<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<div id="docu_top" style="display:none">TOP</div>
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
  $("#content_list").css("display","block");
  document.getElementById("mainList").contentWindow.document.location.reload();
  setTimeout(function(){ setMainListHeight();}, 200);
}
//목록페이지 보기
function contentList2() {
  $("#content_search").css("display","none");
  $("#content_DetailList").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_list").css("display","none");
  $("#content_list2").css("display","block");
  document.getElementById("mainList2").contentWindow.document.location.reload();
  setTimeout(function(){ setMainListHeightId("#mainList2",80);}, 200);
}

//검색페이지 보기
/* function contentSearch() {
  $("#content_list").css("display","none");
  $("#content_list2").css("display","none");
  $("#content_DetailList").css("display","none");
  $("#content_detail").css("display","none");
  $("#content_search").css("display","block");
} */
var isFirstMoveSearch = 0;
function openSearchBtn(){

    if(!isFirstMoveSearch){
        $("#header_title").on("click", _moveSearch);
    }
    $("#header_title").html("<span class='search_open'>"+_title+"</span>");
    $("#header_title span").attr("class","search_open");

    isFirstMoveSearch++;
}

function _moveSearch() {
    if($("#content_search").css("display")=="block"){
        $("#content_search").css("display","none");
        $("#content_DetailList").css("display","none");
        $("#content_list").css("display","none");
        $("#content_list2").css("display","block");
        $("#header_title span").attr("class","search_open");
    }else{
        if($("#header_title span").attr("class") == "search_open"){
            $("#content_search").css("display","block");
            $("#content_DetailList").css("display","none");
            $("#content_list").css("display","none");
            $("#content_list2").css("display","none");
            $("#header_title span").attr("class","search_close");
        }
    }
}

function contentDetailList(obj) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_DetailList").css("display","none");
    $("#content_detail").css("display","none");
    $("#content_list2").css("display","block");
    $("#sCarlineCd").data("kendoExtDropDownList").value(obj.carlineCd); //차종

    $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
    $("#sFscCd").data("kendoExtDropDownList").enable(true);

    if(obj.carlineCd == ""){
        $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sFscCd").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url :"<c:url value='/sal/inv/stockMnt/selectFscList.do' />"
        ,data :JSON.stringify({"sCarlineCd":obj.carlineCd})
        ,async :false
    });
    $("#sFscCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    if(responseJson.data.length == 0){
        $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sFscCd").data("kendoExtDropDownList").enable(false);
    }

    setMainListHeightId("#mainList2",80);
    setTimeout(function(){ $("#mainList2").attr("src", "<c:url value='/mob/sal/inv/stockState/selectStockStateDetailList.do' />");}, 200);

}

function contentDetail(obj) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_DetailList").css("display","block");
    $("#content_detail").css("display","none");
    $("#content_list2").css("display","none");
    $("#header_title").html(_title);


    setDetailData(obj.dataItem,".detialListDataReadOnly input[id]");
    $("#strYnNm").val(ynObj[$("#strYn").val()]);
    $("#damageCd").data("kendoExtDropDownList").value(obj.dataItem.damageCd); //재고유형
    $("#blockYn").data("kendoExtDropDownList").value(obj.dataItem.blockYn); //고정
    $("#blockSaleAdvNo").data("kendoExtDropDownList").value(obj.dataItem.blockSaleAdvNo); //판매고문
    $("#strgeCd").data("kendoExtDropDownList").value(obj.dataItem.strgeCd); //창고
    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/inv/stockState/selectLocation.do' />"
        ,data:JSON.stringify(dms.string.strNvl(obj.dataItem.strgeCd))
        ,async:false
    });
    locDSList = responseJson.data;

    locCdObj = {};
    $.each(locDSList, function(idx, obj){
        locCdObj[obj.locCd] = obj.locNm;
    });
    $("#locCd").data("kendoExtDropDownList").setDataSource(locDSList);
    $("#locCd").data("kendoExtDropDownList").value(obj.dataItem.locCd); //위치
    $("#cmpCarYn").data("kendoExtDropDownList").value(obj.dataItem.cmpCarYn); //회사차여부
    $("#cmpCarDstinCd").data("kendoExtDropDownList").value(obj.dataItem.cmpCarDstinCd); //회사차유형
    $("#openYnNm").val(ynObj[$("#openYn").val()]);
    $("#pltGiDt").val(chgDate2Str($("#pltGiDt").val()));
    $("#dlrGrDt").val(chgDate2Str($("#dlrGrDt").val()));
    $("#whslPrcCurrency").val(dms.format.currency(Number($("#whslPrc").val())));

    if(obj.dataItem.carStatCd=="50") {
        $("#damageCd").data("kendoExtDropDownList").enable(false);
        $("#blockSaleAdvNo").data("kendoExtDropDownList").enable(false);
        $("#strgeCd").data("kendoExtDropDownList").enable(false);
        $("#locCd").data("kendoExtDropDownList").enable(false);
        $("#temp2").attr("disabled",true);
        $("#temp2").addClass("showOnly");
        $("#cmpCarYn").data("kendoExtDropDownList").enable(false);
        $("#cmpCarDstinCd").data("kendoExtDropDownList").enable(false);
    }else{
        $("#damageCd").data("kendoExtDropDownList").enable(true);
        $("#blockSaleAdvNo").data("kendoExtDropDownList").enable(true);
        $("#strgeCd").data("kendoExtDropDownList").enable(true);
        $("#locCd").data("kendoExtDropDownList").enable(true);
        $("#temp2").attr("disabled",false);
        $("#temp2").removeClass("showOnly");
        $("#cmpCarYn").data("kendoExtDropDownList").enable(true);
        $("#cmpCarDstinCd").data("kendoExtDropDownList").enable(true);
    }

}


function doSave(){
        var gridData={};
        gridData=makeSaveData(".detialListDataReadOnly input[id]");

        saveData.updateList.push(gridData);
        mob.loading.show();
        $.ajax({
            url:"<c:url value='/sal/inv/stockMnt/multiStockMnt.do' />"
            ,data:JSON.stringify(saveData)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                mob.loading.hide();
                mob.notification.error("<spring:message code='global.err.mobSystemError'/>");
            }
            ,success:function(jqXHR, textStatus) {
                mob.loading.hide();
                //저장후 상세리스트 재호출
                contentList2();
                //정상적으로 반영 되었습니다.
                //mob.notification.success("<spring:message code='global.info.success'/>");
            }
        });
}


function makeSaveData(selTargetElement){

    var idArr=$(selTargetElement+"[id]").not(".showOnly").map(function(){return this.id;}).get();
    var _updateData={};

    for(var i=0; i<idArr.length; i++){
        if(isDateType($("#"+idArr[i]).val())){
            _updateData[idArr[i]]=chgDate($("#"+idArr[i]).val());
        }else{
            _updateData[idArr[i]]=$("#"+idArr[i]).val();
        }
    }
    return _updateData;
}
function isDateType(str){
    var pattern=/[0-9]{4}-[0-9]{2}-[0-9]{2}/;
    if(pattern.test(str)){
        return 1;
    }else{
        return 0;
    }
}




//########################################################
</script>