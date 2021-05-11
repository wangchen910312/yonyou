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
                <h2 id="content_list_title"><spring:message code="sal.title.corpStockConditionDlr" /> <spring:message code="global.title.list" /></h2>
            </div>
            <div class="listarea">
                <div class="dlistitem listhead">
                <span style="width:100%"><spring:message code="global.lbl.modelNm" /><!-- 차관--></span>
                    <span style="width:50%" class="clboth"><spring:message code="ser.lbl.carLine" /><!-- 차종 --></span>
                    <span style="width:50%" ><spring:message code='global.lbl.ocn' /><!-- OCN --></span>
                    <span style="width:50%" class="clboth"><spring:message code='global.lbl.extColor' /><!-- 외장색 --></span>
                    <span style="width:50%" ><spring:message code='global.lbl.intColor' /><!-- 내장색 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height="300"></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="sal.title.corpStockConditionDlr" /> <spring:message code="global.title.searchCondition" /></h2>
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
                                <th scope="row"><spring:message code='ser.lbl.carLine' /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sCarLine" type="form_comboBox"/></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.modelNm' /><!-- 차관 --></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sModelNm" type="form_comboBox"/></div>
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
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.extColor' /><!-- 외장색 --></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sExtColor" type="form_comboBox"/></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.intColor' /><!-- 내장색 --></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sIntColor" type="form_comboBox"/></div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12600" hasPermission="${dms:getPermissionMask('READ')}">
                    <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>

        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="sal.title.corpStockConditionDlr" /> <spring:message code="global.lbl.dtlInfo" /></h2>
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
                                <th scope="row"><spring:message code="ser.lbl.carLine" /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="carLine" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                           <tr>
                                <th scope="row"><spring:message code="global.lbl.modelNm" /><!-- 차관 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="modelNm" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code="global.lbl.ocn" /><!-- OCN --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="ocn" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.extColor" /><!-- 외장색 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="extColor" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code="global.lbl.intColor" /><!-- 내장색 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="intColor" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.totStockQty" /><!-- 총재고 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="totStockQty" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.orderQty" /><!-- 주문수량 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="orderQty" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.psntStockQty" /><!-- 현재고수량 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="psntStockQty" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.guideAmt" /><!-- 지도가격 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="guideAmt" type="text" class="f_text" placeholder="" disabled="disabled"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="sal.lbl.dispGradeCd" /><!-- 배기등급 --></th>
                                <td>
                                    <div class="f_text f_disabled">
                                    <input id="dispGradeCd" type="text" class="f_text" placeholder="" disabled="disabled"/>
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
var toDate,
    gCrud;

toDate = new Date();

//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

$(document).ready(function() {
  //현재일자
    var toDay = "${toDay}";

    function initPage(){
        if (!partsJs.validate.getAllPluginObjInfo($("#itemForm")[0])) {
            return false;
        }
        partsJs.validate.groupObjAllDataInit();
        gCrud = 'C';
        $(".skeyarea").hide();
    }

    initPage();

    // 타이틀
    $("#header_title").html("<spring:message code='sal.title.corpStockConditionDlr' />"); //공장가용자원정황
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 목록 조회
    $("#mainList").attr("src", "<c:url value='/mob/sal/stm/corpStockConditionDlr/selectCorpStockConditionDlrList.do' />");
    
    $("#sCarLine").kendoExtDropDownList({
        dataTextField:"carlineNm"
        , dataValueField:"carlineCd"
        , dataSource:carLineCdList
        , optionLabel:"<spring:message code='global.lbl.all' />"
        , select:function(e){
            var dataItem = this.dataItem(e.item);
            $("#sModelNm").data("kendoExtDropDownList").setDataSource([]);
            $("#sModelNm").data("kendoExtDropDownList").enable(true);

            $("#sOcn").data("kendoExtDropDownList").setDataSource([]);   // OCN data
            $("#sOcn").data("kendoExtDropDownList").enable(false);       // OCN 닫음

            $("#sExtColor").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColor").data("kendoExtDropDownList").enable(false);

            $("#sIntColor").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColor").data("kendoExtDropDownList").enable(false);

            if(dataItem.carlineCd == ""){
                $("#sModelNm").data("kendoExtDropDownList").setDataSource([]);
                $("#sModelNm").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
                ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
                ,async:false
            });
            $("#sModelNm").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
     });
    
    // 모델
    $("#sModelNm").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:""
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOcn").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcn").data("kendoExtDropDownList").enable(true);

           $("#sExtColor").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColor").data("kendoExtDropDownList").enable(false);

           $("#sIntColor").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColor").data("kendoExtDropDownList").enable(false);

           if(dataItem.modelCd == ""){
               $("#sOcn").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcn").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarLine").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });
           $("#sOcn").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelNm").data("kendoExtDropDownList").enable(false);
    
    // OCN
    $("#sOcn").kendoExtDropDownList({
        dataTextField:"ocnNm"
       ,dataValueField:"ocnCd"
       ,optionLabel:""
       ,select:function(e){
           $("#sExtColor").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColor").data("kendoExtDropDownList").enable(true);

           $("#sIntColor").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColor").data("kendoExtDropDownList").enable(false);

           if(this.dataItem(e.item).ocnCd == ""){
               $("#sExtColor").data("kendoExtDropDownList").setDataSource([]);
               $("#sExtColor").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
               ,data:JSON.stringify({"modelCd":$("#sModelNm").val() })
               ,async:false
           });
           $("#sExtColor").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sOcn").data("kendoExtDropDownList").enable(false);
    
    // 외장색
    $("#sExtColor").kendoExtDropDownList({
        dataTextField:"extColorNm"
       ,dataValueField:"extColorCd"
       ,optionLabel:""
       ,select:function(e){
           if(this.dataItem(e.item).extColorCd == ""){
               $("#sIntColor").data("kendoExtDropDownList").setDataSource([]);
               $("#sIntColor").data("kendoExtDropDownList").enable(false);
               return false;
           }

           $("#sIntColor").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColor").data("kendoExtDropDownList").enable(true);

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
               ,data:JSON.stringify({"modelCd":$("#sModelNm").val() })
               ,async:false
           });
           $("#sIntColor").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sExtColor").data("kendoExtDropDownList").enable(false);
    
    // 내장색
    $("#sIntColor").kendoExtDropDownList({
        dataTextField:"intColorNm"
       ,dataValueField:"intColorCd"
       ,optionLabel:""
    });
    $("#sIntColor").data("kendoExtDropDownList").enable(false);
    

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
            ////$("#docu_top").fadeIn();
        }
        else
        {
            $("#docu_top").fadeOut();
        }
    });
    
    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            contentList();
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
    
    console.log(dataItem);
    
    $("#carLine").val(dataItem.carlineNm);
    $("#modelNm").val(dataItem.modelNm);
    $("#ocn").val(dataItem.ocnNm);
    $("#extColor").val(dataItem.extColorNm);
    $("#intColor").val(dataItem.intColorNm);
    $("#totStockQty").val(dataItem.totStockQty);
    $("#orderQty").val(dataItem.ordQty);
    $("#psntStockQty").val(dataItem.psntStockQty);
    $("#guideAmt").val(dataItem.retlPrc);
    $("#dispGradeCd").val(dataItem.dispGradeCd);
    
    
    
    
    
  }
</script>