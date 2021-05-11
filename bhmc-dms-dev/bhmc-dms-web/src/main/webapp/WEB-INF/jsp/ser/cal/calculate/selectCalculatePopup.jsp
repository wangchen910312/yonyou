<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <div class="">
        <section id="window" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right">
                    <button type="button" class="btn_m" id="calcReg" ><spring:message code="global.btn.add" /></button>                        <!--수납완료  -->
                </div>
            </div>
            <div class="table_form table_form_info mt10">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.payWay" /></th><!-- 지불유형  -->
                        <td>
                            <input id="paymTp" name="paymTp" value="03" class="form_comboBox" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.payer" /></span></th><!-- 지불자  -->
                        <td>
                            <div class="form_search" >
                                <input type="hidden" id="paymCd" name="paymCd"/>
                                <input type="text" id="paymUsrNm" name="paymUsrNm" class="form_input" style="text-transform:uppercase"/>
                                <a href="#" onclick="chagePayTp()" >&nbsp;</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.payTerm" /></th><!--지불기한  -->
                        <td>
                            <input id="paymPrid" name="paymPrid" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.expcPayMethod' /></th><!--예상지불방식  -->
                        <td>
                            <input id="paymMthCd" name="paymMthCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.finalCalcAmt' /></span></th><!--수납금액  -->
                        <td>
                            <input type="text" id="paymAmt" name="paymAmt" class="form_numeric ar" />
                        </td>
                        <th scope="row"><spring:message code='ser.lbl.expcInvoiceTp' /></span></th><!--예상영수증유형  -->
                        <td>
                            <input id="rcptTp" name="rcptTp" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.payBigo' /></th><!--지불비고  -->
                        <td colspan="3">
                            <input type="text" id="paymRemark" name="paymRemark" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
    </div>
</div>
<script type="text/javascript">


//지불방식 Array
var paymMthCdList = [];
<c:forEach var="obj" items="${paymMthCdList}">
paymMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}", "useYn":"${obj.useYn}"});
</c:forEach>

//지불방식 Map
var paymMthCdMap = dms.data.arrayToMap(paymMthCdList, function(obj){ return obj.cmmCd; });

//공통코드:결제기간
var paymPridCdList = [];
<c:forEach var="obj" items="${paymPridCdList}">
paymPridCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var paymPridCdArr = dms.data.arrayToMap(paymPridCdList, function(obj){return obj.cmmCd});

//영수증유형 Array
var rcptTpCdList = [];
<c:forEach var="obj" items="${rcptTpCdList}">
rcptTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "remark10":"${obj.remark10}"});
</c:forEach>

//영수증유형 Map
var rcptTpCdMap = dms.data.arrayToMap(rcptTpCdList, function(obj){ return obj.cmmCd;});

//공통코드:결제유형 01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러
var paymTpCdList  = []; //전부
var paymTpCdList1 = []; //보증
var paymTpCdList2 = []; //보험
var paymTpCdList3 = []; //기타고객 , 고객
var paymTpCdList4 = []; //딜러

<c:forEach var="obj" items="${paymTpCdList}">
    <c:if test='${obj.useYn eq "Y"}' >
        <c:if test='${ (obj.remark1 eq "01" ) or (obj.remark1 eq "03") }'> //보증
            paymTpCdList1.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
        <c:if test='${obj.remark1 eq "02" or obj.remark1 eq "03"}'>//보험
            paymTpCdList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
        <c:if test='${obj.remark1 eq "03"}'>//고객
            paymTpCdList3.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
        <c:if test='${obj.remark1 eq "04"}'>//딜러
            paymTpCdList4.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>
        paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd});
var popupWindow;
var insurancePopup;
$(document).ready(function(){

    var parentJsonData = parent.calcAddPopup.options.content.data;

    var roTp      = parentJsonData.roTp; //RO 유형
    var paymTp    = parentJsonData.selectedVal.paymTp; //결제유형
    var paymUsrNm = parentJsonData.selectedVal.paymUsrNm;//결제자
    var paymCd    = parentJsonData.selectedVal.paymCd;//결자코드
    var paymAmt   = parentJsonData.selectedVal.paymAmt;//수납금액
    var calcAmt   = parentJsonData.selectedVal.calcAmt;//수납금액
    var dlrCd     = parentJsonData.dlrCd;//딜러코드
    var dlrNm     = parentJsonData.dlrNm;//딜러명
    var custNm    = parentJsonData.custNm;//고객명
    var custNo    = parentJsonData.custNo;//고객번호


  //RO 유형별 결제변경
    setPaymTpList = function(roTp){

        if(roTp == "01"){//일반
            paymTpCdList = paymTpCdList3; //고객정보
        }else if(roTp == "02"){//보증
            paymTpCdList = paymTpCdList1;//보증정보
        }else if(roTp == "03"){//보험
            paymTpCdList = paymTpCdList2;//보험정보
        }else if(roTp == "04" || roTp == "05"){//내부  , 리워크
            paymTpCdList = paymTpCdList4;//딜러정보
        }
        return paymTpCdList;
    };

    chagePayTp = function(e){


        var paymTp = $("#paymTp").data("kendoExtDropDownList").value();
        var paymCd;
        var paymUsrNm;
        //01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러

        if(paymTp == "01"){//보증
            paymCd     = "A07AA";
            paymUsrNm  = "BHMC";

        }else if(paymTp == "02"){//보험
            //insurancePopupWindow();
            parent.insuPopupWindow("calcAddPopup");
        }else if(paymTp == "03"){ //기타고객

            parent.etcCustSearchPopup("calcAddPopup");

        }else if(paymTp == "04"){//고객 孙旭
            paymCd     = custNo;
            paymUsrNm  = custNm;

        }else {
            paymCd     = "${dlrCd}";
            paymUsrNm  = "${dlrNm}";
        }

        $("#paymUsrNm").val(paymUsrNm);
        $("#paymCd").val(paymCd);
    };


    //실수금액
    $("#paymAmt").kendoExtNumericTextBox({
        format:"n2"                // n0:###,###, n2:###,###.##
        ,decimals:2                // 소숫점
        ,spinners:false
        ,value:paymAmt
    });


    //지불유형
    $("#paymMthCd").kendoExtDropDownList({
        dataSource:paymMthCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,height:80
        ,dataBound:function(e){
            $.each(paymMthCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#paymMthCd").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
        ,optionLabel:" "
    });

    //지불기한
    $("#paymPrid").kendoExtDropDownList({
        dataSource:paymPridCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //지불유형
    $("#paymTp").kendoExtDropDownList({
        dataSource:setPaymTpList(roTp)
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,change:chagePayTp
        ,index:1
    });

    //영수증유형
    $("#rcptTp").kendoExtDropDownList({
        dataSource:rcptTpCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,height:80
        ,dataBound:function(e){
            $.each(rcptTpCdList, function(index, item){
                if(this.remark10 === "default") {
                    $("#rcptTp").data("kendoExtDropDownList").value(this.cmmCd);
                }
            });
        }
        ,optionLabel:" "
    });

    // 정산등록
    $("#calcReg").kendoButton({
        click:function(e){

            if(dms.string.strNvl($("#paymUsrNm").val()) == "") {
                dms.notification.info("<spring:message code='ser.lbl.payer' var='paymUsrNm' /><spring:message code='global.info.emptyCheckParam' arguments='${paymUsrNm}' />");
                return false;
            }
            if($("#paymAmt").data("kendoExtNumericTextBox").value() <= 0) {
                dms.notification.info("<spring:message code='ser.lbl.finalCalcAmt' var='paymAmt' /><spring:message code='global.info.emptyCheckParam' arguments='${paymAmt}' />");
                return false;
            }
            if($("#paymAmt").data("kendoExtNumericTextBox").value() >= paymAmt) {
                dms.notification.info("<spring:message code='ser.lbl.arCd' var='arCd' />"+
                        //"<spring:message code='ser.lbl.arCd' var='arCd' />"+
                        "<spring:message code='ser.info.chkMax' arguments='${arCd},"+paymAmt+"' />");
                return false;
            }

            var data = {};
            if(parentJsonData.preFixId == "ET"){
                data = {
                    dlrCd:""
                    ,paymTp:$("#paymTp").data("kendoExtDropDownList").value()
                    ,paymCd:$("#paymCd").val()
                    ,paymPrid:$("#paymPrid").data("kendoExtDropDownList").value()
                    ,paymMthCd:$("#paymMthCd").data("kendoExtDropDownList").value()
                    ,paymAmt:Number($("#paymAmt").data("kendoExtNumericTextBox").value()).toFixed(2)
                    ,calcAmt:Number($("#paymAmt").data("kendoExtNumericTextBox").value()).toFixed(2)
                    ,wonUnitCutAmt:0
                    ,demicPointCutAmt:0
                    ,paymUsrNm:$("#paymUsrNm").val()
                    ,rcptTp:$("#rcptTp").data("kendoExtDropDownList").value()
                    ,paymRemark:$("#paymRemark").val()
                    ,preAmt:0
                    ,balAmt:0
                }
            } else {
                data = {
                    dlrCd:""
                    ,calcDocNo:""
                    ,paymTp:$("#paymTp").data("kendoExtDropDownList").value()
                    ,paymCd:$("#paymCd").val()
                    ,paymPrid:$("#paymPrid").data("kendoExtDropDownList").value()
                    ,paymMthCd:$("#paymMthCd").data("kendoExtDropDownList").value()
                    ,paymAmt:Number($("#paymAmt").data("kendoExtNumericTextBox").value()).toFixed(2)
                    ,calcAmt:Number($("#paymAmt").data("kendoExtNumericTextBox").value()).toFixed(2)
                    ,wonUnitCutAmt:0
                    ,demicPointCutAmt:0
                    ,npayAmt:""
                    ,paymUsrId:""
                    ,paymUsrNm:$("#paymUsrNm").val()
                    ,rcptTp:$("#rcptTp").data("kendoExtDropDownList").value()
                    ,paymRemark:$("#paymRemark").val()
                    ,preAmt:0
                    ,balAmt:0
                }
            }
            parentJsonData.callbackFunc(data,"","");
            parent.calcAddPopup.close();

        }
    });

    $("#paymTp").data("kendoExtDropDownList").value(paymTp);
    $("#paymUsrNm").val(paymUsrNm);
    $("#paymCd").val(paymCd);

});

function setEtcCustpaymInfoSet (data){

    $("#paymUsrNm").val(data[0].custNm);
    $("#paymCd").val(data[0].custNo);
};

function setInsuPaymInfoSet (data){


    $("#paymUsrNm").val(data[0].incCmpNm);
    $("#paymCd").val(data[0].incCmpCd);

};


</script>
