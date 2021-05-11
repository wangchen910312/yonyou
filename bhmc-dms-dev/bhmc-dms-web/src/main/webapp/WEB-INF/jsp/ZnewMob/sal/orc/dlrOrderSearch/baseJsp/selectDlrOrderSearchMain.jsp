<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <!-- content_list -->
        <c:import url="/WEB-INF/jsp/ZnewMob/sal/orc/dlrOrderSearch/listJsp/selectDlrOrderSearchList.jsp" />
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
                                        <input type="date" id="sOrdStartDt" value="${oneDay}" style="background-color: white;" />
                                        <%-- <input type="search" id="sOrdStartDt" value="${oneDay}" />
                                        <span class="date" id="sOrdStartDt_Span" onclick="calpicker('sOrdStartDt')" ><spring:message code='global.lbl.date' /></span> --%>
                                    </div>
                                    <span class="termtext" style="padding:0px; margin-top:10px;"> ∼</span>
                                    <div class="f_item01" style="width:91%">
                                        <input type="date" id="sOrdEndDt" value="${toDay}" style="background-color: white;" />
                                        <%-- <input type="search" id="sOrdEndDt" value="${toDay}"/>
                                        <span class="date" id="sOrdEndDt_Span" onclick="calpicker('sOrdEndDt')" ><spring:message code='global.lbl.date' /></span> --%>
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
                        <tbody id="defaultHtml"><!-- 여기에 디폴트 HTML --></tbody>
                    </table>
                </div>
                <div class="con_btnarea">
                    <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기--></span></div>
                </div>
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
    // 타이틀
    $("#header_title").html("<spring:message code='sal.menu.dlrOrderSearch' />");
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

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
            initList();
            listData.read();
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
    getOrdLst();
});
</script>

<script>
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
       $("#sOrdStartDt").val("${oneDay}");
       $("#sOrdEndDt").val("${toDay}");
       $(".co_group").show();
       getOrdLst();
   }else{
       $("#sEvalConfMth").data("kendoExtMaskedDatePicker").enable(true);
       $("#sOrdStartDt").attr("disabled",true);
       $("#sOrdEndDt").attr("disabled",true);
       $("#sOrdStartDt_Span").attr("onclick","").unbind("click");
       $("#sOrdEndDt_Span").attr("onclick","").unbind("click");
       $("#sOrdEndDt_Span").unbind("click");
       $("#sEvalConfMth").data("kendoExtMaskedDatePicker").value("${oneDay}");
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
