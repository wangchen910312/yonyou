<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />
    <section id="content">
        <!-- content_list -->
        <c:import url="/WEB-INF/jsp/ZnewMob/par/cpm/advanceReceivedInfo/listJsp/selectAdvanceReceivedInfoList.jsp"></c:import>

        <!-- content_search -->
        <section id="content_search" class="content_search" style="display:none;">
            <div class="content_title conttitlePrev">
                <h2><spring:message code="par.menu.advanceReceived" /> <spring:message code="global.title.searchCondition" /></h2>
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
                                <th scope="row"><spring:message code='global.lbl.dlrCd' /><!-- 딜러코드 --></th>
                                <td>
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sDlrCd" type="form_input" disabled="disabled" value="${dlrCd}"/></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="group-OrdDt"><spring:message code='par.lbl.sellType' /><!-- 거래유형 --></th>
                                <td class="group-OrdDt">
                                    <div class="f_text">
                                    <div class="f_text"><input type="text" id="sPreAmtTp" type="form_comboBox"/></div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="f_term"><span><spring:message code='sal.lbl.orgStartDt' /></span></th>    <!-- 시작일자 -->
                                <td class="f_term">
                                    <div class="f_item01" style="width:82%">
                                        <input type="date" id="impStartDt" style="background-color:#ffffff;"  />
                                        <%-- <input type="search" id="impStartDt"  />
                                        <span class="date" onclick="calpicker('impStartDt')"><spring:message code='global.lbl.date' /></span> --%>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row" class="f_term"><span><spring:message code='sal.lbl.orgEndDt' /></span></th>    <!-- 종료일자 -->
                                <td class="f_term">
                                    <div class="f_item01" style="width:82%">
                                        <input type="date" id="impEndDt" style="background-color:#ffffff;" />
                                        <%-- <input type="search" id="impEndDt"  />
                                        <span class="date" onclick="calpicker('impEndDt')"><spring:message code='global.lbl.date' /></span> --%>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                </table>
            </div>
            <div class="con_btnarea">
                <dms:access viewId="VIEW-D-12716" hasPermission="${dms:getPermissionMask('READ')}">
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
                </dms:access>
            </div>
        </section>

        <!-- content_detail -->
        <div class="content_right" id="itemForm">
            <section id="content_detail" class="content_detail" style="display:none">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="par.menu.advanceReceived" /> <spring:message code="global.lbl.dtlInfo" /></h2>
                </div>
                <div class="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody id="defaultHtml">
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

var preAmtTpList = [];
<c:forEach var="obj" items="${preAmtTpList}">
preAmtTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var preAmtTpMap = [];
$.each(preAmtTpList, function(idx, obj){
    preAmtTpMap[obj.cmmCd] = obj.cmmCdNm;
});

$(document).ready(function() {

    $("#sPreAmtTp").kendoExtDropDownList({
        dataSource:preAmtTpList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:"<spring:message code='global.lbl.check' />"
        ,autoBind:true
        ,index:0
    });

    $("#acAmt").kendoExtNumericTextBox({
        enable:false
       ,format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    $("#calcAmt").kendoExtNumericTextBox({
        enable:false
       ,format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    $("#useAmt").kendoExtNumericTextBox({
        enable:false
       ,format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    $("#suggestAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    // 타이틀
    $("#header_title").html("<spring:message code='par.menu.advanceReceived' />"); //공장가용자원정황
    $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>"+$("#header_title").html()+"</span>");

    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            initList();
            listData.read();
        }
    });

    //버튼 - 추가
    $("#btnSuggest").kendoButton({
           click:function(e){

            var AdvanceReceivedInfoHeaderVO = {
                dlrCd:"${dlrCd}"
                ,lmtAmt:$("#suggestAmt").data("kendoExtNumericTextBox").value()
            };

            $.ajax({
                url:"<c:url value='/par/cpm/advanceReceivedInfo/updateAdvanceReceivedInfoHeader.do' />"
                ,data:JSON.stringify(AdvanceReceivedInfoHeaderVO)
                ,type:"POST"
                ,dataType:"json"
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(jqXHR, textStatus){
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });

        }
    });


});
</script>

<script>
changePreAmtTp = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = preAmtTpMap[val];
    }
    return returnVal;
};


</script>