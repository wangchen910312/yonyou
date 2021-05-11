<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <c:import url="/WEB-INF/jsp/ZnewMob/sal/orc/orderPlacement/listJsp/selectNotAssignedOrderList.jsp" />

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="sal.menu.notAssignOrdSearch" /> <spring:message code="global.title.searchCondition" /></h2>
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
                                <th scope="row"><spring:message code='global.lbl.orderType' /><!-- 주문유형 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="sOrderType" class="form_comboBox"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="group-OrdDt" style="display:none"><spring:message code='global.lbl.orderWeek' /><!-- 주문주차 --></th>
                                <td class="group-OrdDt" style="display:none">
                                    <div class="f_text">
                                        <input type="text" id="sOrderWeek" class="form_comboBox"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="f_term" style="display:true"><span><spring:message code='global.lbl.orderRegDt' /></span></th>    <!-- 주문등록일 -->
                                <td class="f_term" style="display:true">
                                    <div class="f_item01" style="width:82%">
                                        <input type="date" id="sOrdStartDt"  value="${oneDay}" style="background-color: white;"/>
                                    </div>
                                    <span class="termtext"> ∼</span>
                                    <div class="f_item01" style="width:82%">
                                        <input type="date" id="sOrdEndDt"  value="${toDay}" style="background-color: white;"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.mortgageTp" /></th> <!-- 담보유형 -->
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="sMortgageTp" name="sMortgageTp" class="form_comboBox">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="sCarLine" class="form_comboBox"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.model' /><!-- 차관 --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="sModelNm" class="form_comboBox"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.ocn' /><!-- OCN --></th>
                                <td>
                                    <div class="f_text">
                                        <input type="text" id="sOcn" class="form_comboBox"/>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12598" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>

        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
            </section>
        </div>
    </section>
    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<!-- script -->
<script>
var dateFormat =  '<dms:configValue code="dateFormat" />';

/**
 * 주문유형 콤보박스
 */
 var ordTpList = [];
 var ordTpCdObj = {};
 <c:forEach var="obj" items="${ordTpInfo}">
     ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     ordTpCdObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
 </c:forEach>

 /**
  * 담보유형 콤보박스
  */
var mortgageTpList = [];
var mortgageTpCdObj = {};
<c:forEach var="obj" items="${mortgageTp}">
    mortgageTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    mortgageTpCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/**
 * 차종 콤보
 */
 var carLineCdList = [];
 <c:forEach var="obj" items="${carLineCdInfo}">
  carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
 </c:forEach>

 /**
  * 주차
  */
 var ordYyMmPridList = [];
 <c:forEach var="obj" items="${ordYyMmPridInfo}">
     ordYyMmPridList.push({btoYmwNm:"${obj.btoYmwNm}", btoYmwCd:"${obj.btoYmwCd}"});
 </c:forEach>

 /**
  * 담보유형 콤보박스
  */
  var mortgageTpList = [];
  var mortgageTpCdObj = {};
  <c:forEach var="obj" items="${mortgageTp}">
    mortgageTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    mortgageTpCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
  </c:forEach>

  var _windowHeight;

$(document).ready(function() {

    _windowHeight=$(window).height();

  //현재일자
    var toDay = "${toDay}";

    // 타이틀
    $("#header_title").html("<spring:message code='sal.menu.notAssignOrdSearch' />"); //공장가용자원정황
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 주문유형
    $("#sOrderType").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , dataSource:ordTpList
        , select:onSelectOrdTp
        , optionLabel:"<spring:message code='global.lbl.all' />"
     });

    // 주차
    $("#sOrderWeek").kendoExtDropDownList({
        dataTextField:"btoYmwNm"
        , dataValueField:"btoYmwCd"
        , dataSource:ordYyMmPridList
        , optionLabel:"<spring:message code='global.lbl.all' />"
     });

    //담보유형
    $("#sMortgageTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:mortgageTpList
       ,optionLabel:"<spring:message code='global.lbl.all' />"  // 선택
    });

    // 차종
    $("#sCarLine").kendoExtDropDownList({
        dataTextField:"carlineNm"
        , dataValueField:"carlineCd"
        , dataSource:carLineCdList
        , select:onSelectCarlineCd
        , optionLabel:"<spring:message code='global.lbl.all' />"
     });

    // 모델
    $("#sModelNm").kendoExtDropDownList({
        dataTextField:"fscNm"
       ,dataValueField:"fscCd"
       ,select:onSelectModelCd
       ,optionLabel:" "
    });

    // OCN
    $("#sOcn").kendoExtDropDownList({
        dataTextField:"ocnNm"
       ,dataValueField:"ocnCd"
       ,optionLabel:" "
    });

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            //contentList();
            initList();
            listData.read();
        }
    });
    $("#sModelNm").data("kendoExtDropDownList").enable(false);
    $("#sOcn").data("kendoExtDropDownList").enable(false);
});
</script>

<script>

//상세페이지 보기

function contentDetail(dataItem) {
    $("#content_list").css("display","none");
    $("#content_search").css("display","none");
    $("#content_detail").css("display","block");$("#header_title span").removeAttr("class");

    $("#orderDate").val(dataItem.ordpCndy);
    $("#purcOrdNo").val(dataItem.salesNo);
    $("#purcOrdTp").val(ordTpCdObj[dataItem.sord]);
    $("#carlineCd").val(dataItem.carlineCd);
    $("#carLineNm").val(dataItem.carlineNm);
    $("#modelNm").val(dataItem.modelNm);
    $("#ocnCd").val(dataItem.ocnCd);
    $("#ocnNm").val(dataItem.ocnNm);
    $("#extColorCd").val(dataItem.extColorCd);
    $("#extColorNm").val(dataItem.extColorNm);
    $("#intColor").val(dataItem.intColorNm);
    $("#pfpExamDt").val(chgDate2Str(dataItem.ordpExno));
    $("#saleRgstUsr").val(dataItem.saleRgstUsr);
    $("#chrgCd").val(dataItem.chrgCd);
    $("#ordpCount").val(dataItem.ordpCount);
    $("#mdpr").val(kendo.toString(dataItem.mdpr,'n2'));
    $("#dcAmt").val(kendo.toString(dataItem.damt,'n2'));
    $("#whPrc").val(kendo.toString(dataItem.aamt,'n2'));
    $("#paym").val(dms.string.strNvl(mortgageTpCdObj[dataItem.paym]));
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

/**
 * 차종에 따른 모델 조회
 */
function onSelectCarlineCd(e) {
    var dataItem = this.dataItem(e.item);
    $("#sModelNm").data("kendoExtDropDownList").setDataSource([{fscCd:"" , fscNm:""}]);
    $("#sModelNm").data("kendoExtDropDownList").enable(true);

    $("#sOcn").data("kendoExtDropDownList").setDataSource([{ocnCd:"", ocnNm:""}]);   // OCN data
    $("#sOcn").data("kendoExtDropDownList").enable(false);       // OCN 닫음

    if(dataItem.carlineCd == ""){
        $("#sModelNm").data("kendoExtDropDownList").setDataSource([{fscCd:"" , fscNm:""}]);
        $("#sModelNm").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
        ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
        ,async:false
    });
    $("#sModelNm").data("kendoExtDropDownList").setDataSource(responseJson.data);
 };

 /**
  * 모델에 따른 OCN 조회
  */
function onSelectModelCd(e) {

  var strModelCd = this.dataItem(e.item).fscCd;

  $("#sOcn").data("kendoExtDropDownList").setDataSource([]);

  if( strModelCd != null && strModelCd != "" ){
      var responseJson = dms.ajax.getJson({
          url:"<c:url value='/sal/veh/vehicleMaster/selectOcnCombo.do' />"
          ,data:JSON.stringify({"sCarlineCd":$("#sCarLine").val(), "sFscCd":this.dataItem(e.item).fscCd})
          ,async:false
      });

      $("#sOcn").data("kendoExtDropDownList").enable(true);
      $("#sOcn").data("kendoExtDropDownList").setDataSource(responseJson.data);
  }else{
      $("#sOcn").data("kendoExtDropDownList").setDataSource([]);
  }
};
</script>