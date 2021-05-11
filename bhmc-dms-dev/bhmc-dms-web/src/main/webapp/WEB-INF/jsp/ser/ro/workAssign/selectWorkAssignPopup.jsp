<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap" style="overflow:hidden">

    <div class="header_area">
            <div class="btn_right">
                <button class="btn_m" id="btnAppr" type="button"><spring:message code="ser.btn.assignComp" /></button><!-- 확인 -->
            </div>
        </div>

    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:35%;">
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.tecNm" /></span></th><!-- 정비자 -->
                    <td>
                        <input id="tecId" name="tecId" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.staffNo" /></th><!-- 직원번호 -->
                    <td>
                        <div class="form_search">
                            <input type="text" id="sysNo" name="sysNo" data-json-obj="true" class="form_input">
                            <a href="javascript:userAdd('sys');"></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.wkgrpNo" /></span></th><!-- 정비반조 -->
                    <td>
                        <input id="wkgrpNm" name="wkgrpNm" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.wrkTeamNo" /></th><!-- 반조번호 -->
                    <td>
                        <input id="wkgrpNo" name="wkgrpNo" data-json-obj="true" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.bayNm" /></span></th><!-- BAY명 -->
                    <td>
                        <input id="bayNm" name="bayNm" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.bayNo" /></th><!-- Bay번호 -->
                    <td>
                        <input id="bayNo" name="bayNo" data-json-obj="true" class="form_input">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.dstbHm" /></th><!-- 배정공임 -->
                    <td class="useable">
                        <input id="allocHm" name="allocHm" data-json-obj="true" class="form_numeric ar useable1">
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.assigner" /></span></th><!-- 정비배정자 -->
                    <td>
                        <input id="saNm" name="saNm" data-json-obj="true" class="form_input" readonly>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.serCnt" /></th><!-- 정비건수 -->
                    <td class="useable">
                        <input id="shtCnt" name="shtCnt" data-json-obj="true" class="form_numeric ar useable1">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.difcDegree" /></th><!-- 난의도 -->
                    <td>
                        <input id="diffVal" name="diffVal" data-json-obj="true" class="form_numeric ar">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.preStartDt" /></th><!-- 예정시작시간 -->
                    <td>
                        <input class="form_datepicker" id="allocStartDt">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.preCompDt" /></th><!-- 예정완료시간 -->
                    <td>
                        <input class="form_datepicker" id="allocEndDt">
                    </td>
                </tr>
                <tr style="display:none;">
                    <th scope="row"><spring:message code="ser.lbl.serCnt" /></th><!-- 판금건수 -->
                    <td class="useable">
                        <input id="lbrCnt" name="lbrCnt" data-json-obj="true" class="form_numeric ar useable1">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.paintColor" /></th><!-- 페인트 조정 -->
                    <td>
                        <input id="paintColorCd" name="paintColorCd" data-json-obj="true" class="form_numeric ar">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.assignRemark" /></th><!-- 배정비고  -->
                    <td colspan="3">
                        <textarea id="allocRemark" name="allocRemark" rows="4" cols="" class="form_textarea" maxlength="1300" data-json-obj="true"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="infoDiv" style="color:red;text-align:left;height:30px;line-height:30px"></div>
</section>

<script>
var sysDate = "${sysDate}";
var myDate = "${myDate}";
var planHm = "${planHm}";

//테크니션
var techManCdList = [];
<c:forEach var="obj" items="${techManCdList}">
techManCdList.push({
    "tecId":"${obj.tecId}"
    , "tecNm":"${obj.tecNm}"
});
</c:forEach>
//소조
/* <c:forEach var="obj" items="${workGrpCdList}">
workGrpCdList.push({
    "wkgrpNo":"${obj.wkgrpNo}"
    , "wkgrpNm":"${obj.wkgrpNm}"
});
</c:forEach> */
//bay

/* <c:forEach var="obj" items="${bayCdList}">
bayCdList.push({
    "bayNo":"${obj.bayNo}"
    , "bayNm":"${obj.bayNm}"
});
</c:forEach> */

//수리유형 Array
var rpirStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${rpirStatList}">
rpirStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//수리유형 map

$(document).ready(function() {

    $("#allocHm").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,min:0.00
      ,spinners:false
    });
    $("#shtCnt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,min:0.00
      ,spinners:false
    });
    $("#diffVal").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,min:0.00
      ,spinners:false
    });
    $("#lbrCnt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,min:0.00
      ,spinners:false
    });
    $("#paintColorCd").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,min:0.00
      ,spinners:false
    });

    $("#bayNm").kendoExtDropDownList({
        dataSource:null
        ,dataValueField:"bayNo"
        ,dataTextField:"bayNm"
        ,optionLabel:" "
        ,index:0
        ,autoBind:false
        ,change:function(e){
            $("#bayNo").val(this.value());
            //liuxueying  工位存在通道地址则提示可查看维修影像 start
            bayNoChange(this.value());
            //liuxueying  工位存在通道地址则提示可查看维修影响 end
        }
    });

    $("#wkgrpNm").kendoExtDropDownList({
        dataSource:null
        ,dataValueField:"wkgrpNo"
        ,dataTextField:"wkgrpNm"
        ,optionLabel:" "
        ,index:0
        ,autoBind:false
        ,change:function(e){
            $("#wkgrpNo").val(this.value());
        }
    });

    $("#tecId").kendoExtDropDownList({
        dataSource:techManCdList
        ,dataValueField:"tecId"
        ,dataTextField:"tecNm"
        ,optionLabel:" "
        ,index:0
        ,change:function(e){
            userAdd("tec");
        }
    });

    $("#rpirTp").kendoExtDropDownList({
        dataSource:rpirStatList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    $("#allocStartDt").kendoExtMaskedDateTimePicker({
         format:"<dms:configValue code='dateFormat' /> HH:mm"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:sysDate
         ,change:function(e){
             var chgMinutes;
             var currentDate = this.value();
             chgMinutes = this.value().getMinutes() + (Number(planHm * 60));
             currentDate.setMinutes(chgMinutes);
             $("#allocEndDt").data("kendoExtMaskedDateTimePicker").value(currentDate);
         }
    });

    $("#allocEndDt").kendoExtMaskedDateTimePicker({
         format:"<dms:configValue code='dateFormat' /> HH:mm"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:myDate
    });

    /**
     * 팝업 옵션
     */
    var options = parent.assignSearchPopup.options.content.data;
    //$("#sysNo").val(options.tecId);
    $("#saNm").val(options.saNm);
    $("#tecId").data("kendoExtDropDownList").value(options.tecId);
    $("#bayNo").val(options.bayNo);
    $("#bayNm").data("kendoExtDropDownList").value(options.bayNo);
    $("#wkgrpNo").val(options.wkgrpNo);
    $("#wkgrpNm").data("kendoExtDropDownList").value(options.wkgrpNo);
    $("#allocHm").data("kendoExtNumericTextBox").value(planHm);
    $("#shtCnt").data("kendoExtNumericTextBox").value(options.shtCnt);
    $("#diffVal").data("kendoExtNumericTextBox").value(options.diffVal);
    $("#lbrCnt").data("kendoExtNumericTextBox").value(options.lbrCnt);
    $("#paintColorCd").data("kendoExtNumericTextBox").value(options.paintColorCd);

    if(options.selectCnt > 1){
        $(".useable").addClass("readonly_area");
        $(".useable1").attr("readonly", true);
    } else {
        $(".useable").removeClass("readonly_area");
        $(".useable1").attr("readonly", false);
    }
    if(options.allocStartDt != null){
        $("#allocStartDt").data("kendoExtMaskedDateTimePicker").value(options.allocStartDt);
    }
    if(options.allocEndDt != null){
        $("#allocEndDt").data("kendoExtMaskedDateTimePicker").value(options.allocEndDt);
    }

    // 저장
    $("#btnAppr").kendoButton({
        click:function(e) {
            if($("#bayNm").data("kendoExtDropDownList").value()==""){
                dms.notification.info("<spring:message code='ser.lbl.bayNm' var='assigner' /><spring:message code='global.info.required.field' arguments='${assigner},' />");
                return;
            }
            if($("#tecId").data("kendoExtDropDownList").value()==""){
                dms.notification.info("<spring:message code='ser.lbl.tecNm' var='tecNm' /><spring:message code='global.info.required.field' arguments='${tecNm},' />");
                return;
            }
            var data = {
                bayNo:$("#bayNm").data("kendoExtDropDownList").value()
                ,bayNm:$("#bayNm").data("kendoExtDropDownList").text()
                ,wkgrpNo:$("#wkgrpNm").data("kendoExtDropDownList").value()
                ,wkgrpNm:$("#wkgrpNm").data("kendoExtDropDownList").text()
                ,tecId:$("#tecId").data("kendoExtDropDownList").value()
                ,tecNm:$("#tecId").data("kendoExtDropDownList").text()
                ,allocHm:$("#allocHm").data("kendoExtNumericTextBox").value()
                ,shtCnt:$("#shtCnt").data("kendoExtNumericTextBox").value()
                ,paintCnt:$("#shtCnt").data("kendoExtNumericTextBox").value()
                ,diffVal:$("#diffVal").data("kendoExtNumericTextBox").value()
                ,lbrCnt:$("#lbrCnt").data("kendoExtNumericTextBox").value()
                ,paintColorCd:$("#paintColorCd").data("kendoExtNumericTextBox").value()
                ,allocStartDt:$("#allocStartDt").data("kendoExtMaskedDateTimePicker").value()
                ,allocEndDt:$("#allocEndDt").data("kendoExtMaskedDateTimePicker").value()
                ,allocRemark:$("#allocRemark").val()
            };
            options.callbackFunc(data);
            parent.assignSearchPopup.close();
        }
    });

    $("#sysNo").keypress(function(e){
        if(e.keyCode === 13 && dms.string.strNvl($("#sysNo").val()) != ""){
            e.preventDefault();
            userAdd("sys");
        }
    });

    userAdd = function(gubun){
    	//-------liuxuying add start   
    	$("#infoDiv").text("");
    	//-------liuxueying add end
        var sSysNo;
        var sTecId;
        if(gubun == "sys"){
            sSysNo = $("#sysNo").val();
        } else {
            sTecId = $("#tecId").data("kendoExtDropDownList").value();
        }

        $.ajax({
            url:"<c:url value='/ser/svi/bayManage/selectBayDetails.do' />",
            data:JSON.stringify({"sSysNo":sSysNo, "sTecId":sTecId}),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                var dataCnt = jqXHR.total;
                var data = jqXHR.data;
                var bayCdList = [];
                $("#bayNm").data("kendoExtDropDownList").setDataSource([]);
                if(dataCnt <= 0){
                    <c:forEach var="obj" items="${bayCdList}">
                    bayCdList.push({
                        "bayNo":"${obj.bayNo}"
                        , "bayNm":"${obj.bayNm}"
                    });
                    </c:forEach>
                    if(gubun == "sys"){
                        $("#tecId").data("kendoExtDropDownList").value("");
                    } else {
                        $("#sysNo").val("");
                    }
                    $("#bayNm").data("kendoExtDropDownList").value("");
                    $("#bayNo").val("");
                    $("#bayNm").data("kendoExtDropDownList").setDataSource(bayCdList);
                } else if(dataCnt == 1){
                    $.each(data, function(index, row) {
                        <c:forEach var="obj" items="${bayCdList}">
                            if(this.bayNo == "${obj.bayNo}"){
                                bayCdList.push({
                                    "bayNo":"${obj.bayNo}"
                                    , "bayNm":"${obj.bayNm}"
                                });
                            }
                        </c:forEach>
                    });

                    if(gubun == "sys"){
                        $("#tecId").data("kendoExtDropDownList").value(data[0].tecId);
                    } else {
                        $("#sysNo").val(data[0].sysNo);
                        //liuxueying add start
                        bayNoChange(data[0].bayNo);
                        //liuxueying add end
                    }
                    $("#bayNm").data("kendoExtDropDownList").setDataSource(bayCdList);
                    $("#bayNm").data("kendoExtDropDownList").value(data[0].bayNo);
                    $("#bayNo").val(data[0].bayNo);
                } else {
                    $.each(data, function(index, row) {
                        <c:forEach var="obj" items="${bayCdList}">
                            if(this.bayNo == "${obj.bayNo}"){
                                bayCdList.push({
                                    "bayNo":"${obj.bayNo}"
                                    , "bayNm":"${obj.bayNm}"
                                });
                            }
                        </c:forEach>
                    });
                    if(gubun == "sys"){
                        $("#tecId").data("kendoExtDropDownList").value(data[0].tecId);
                    } else {
                        $("#sysNo").val(data[0].sysNo);
                    }
                    $("#bayNm").data("kendoExtDropDownList").setDataSource(bayCdList);
                }

                // 정비반조 셋팅
                $.ajax({
                    url:"<c:url value='/ser/svi/workGroupManage/selectWorkGroupDetails.do' />",
                    data:JSON.stringify({"sSysNo":sSysNo, "sTecId":sTecId}),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        var dataCnt = jqXHR.total;
                        var data = jqXHR.data;
                        var workGrpCdList = [];
                        $("#wkgrpNm").data("kendoExtDropDownList").setDataSource([]);
                        if(dataCnt <= 0){
                            <c:forEach var="obj" items="${workGrpCdList}">
                            workGrpCdList.push({
                                "wkgrpNo":"${obj.wkgrpNo}"
                                , "wkgrpNm":"${obj.wkgrpNm}"
                            });
                            </c:forEach>
                            $("#wkgrpNm").data("kendoExtDropDownList").value("");
                            $("#wkgrpNo").val("");
                            $("#wkgrpNm").data("kendoExtDropDownList").setDataSource(workGrpCdList);
                        } else if(dataCnt == 1){
                            $.each(data, function(index, row) {
                                <c:forEach var="obj" items="${workGrpCdList}">
                                    if(this.wkgrpNo == "${obj.wkgrpNo}"){
                                        workGrpCdList.push({
                                            "wkgrpNo":"${obj.wkgrpNo}"
                                            , "wkgrpNm":"${obj.wkgrpNm}"
                                        });
                                    }
                                </c:forEach>
                            });
                            $("#wkgrpNm").data("kendoExtDropDownList").setDataSource(workGrpCdList);
                            $("#wkgrpNm").data("kendoExtDropDownList").value(data[0].wkgrpNo);
                            $("#wkgrpNo").val(data[0].wkgrpNo);
                        } else {
                            $.each(data, function(index, row) {
                                <c:forEach var="obj" items="${workGrpCdList}">
                                    if(this.wkgrpNo == "${obj.wkgrpNo}"){
                                        workGrpCdList.push({
                                            "wkgrpNo":"${obj.wkgrpNo}"
                                            , "wkgrpNm":"${obj.wkgrpNm}"
                                        });
                                    }
                                </c:forEach>
                            });
                            $("#wkgrpNm").data("kendoExtDropDownList").setDataSource(workGrpCdList);
                        }
                    }
                });
            }
        });
    };
    
    //-----------liuxuyieng add start----
    function bayNoChange(bayNo){
   	 $.ajax({
            url:"<c:url value='/ser/ro/workProcess/selectFlagForExistChanel.do' />",
            data:JSON.stringify(bayNo),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(result, textStatus) {
            	if(result.flag == '1'){
            		$("#infoDiv").text("注：点击维修开始后，客户可以通过蓝缤在线车间查看该维修工位的影像。");
            	}else{
            		$("#infoDiv").text("");
            	}
            }
        });
   }
    //----liuxueying add end-----------
});

</script>