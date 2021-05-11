<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div class="header_area">
    <div class="btn_right">
        <button type="button" class="btn_s btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
    </div>
</div>

<div class="table_form">
    <table>
        <caption></caption>
        <colgroup>
            <col style="width:10%;">
            <col style="width:15%;">
            <col style="width:10%;">
            <col style="width:15%;">
            <col style="width:10%;">
            <col style="width:15%;">
            <col style="width:10%;">
            <col style="width:15%;">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><spring:message code='global.lbl.customer' /></th>    <!-- 고객 -->
                <td>
                    <div class="form_float">
                        <div class="form_left">
                            <div class="form_search">
                                <input id="vContractCustNm" class="form_input onKey_up onKey_bulr" >
                                <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                <input id="sContractCustNm" type="hidden" />
                            </div>
                        </div>
                        <div class="form_right">
                            <input id="sContractCustNo" readonly class="form_input form_readonly">
                        </div>
                    </div>
                </td>
                <th scope="row">휴대폰</th>    <!-- 휴대폰 -->
                <td>
                    <input id="sHpNo" type="text" class="form_input" />
                </td>
                <th scope="row">ID번호(유형)</th> <!-- 딜러 -->
                <td>
                    <input id="sSsnCrnNo" type="text" class="form_input"  style="width:35%"/>
                    <input id="sMathDocTp" type="text" class="form_comboBox" style="width:42%"/>
                </td>

                <th scope="row">차량등록일</th> <!-- 차량등록일 -->
                <td>
                    <div class="form_float">
                        <div class="date_left">
                            <input id="sStartDt" class="form_datepicker" />
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sEndDt" class="form_datepicker" />
                        </div>
                    </div>
                </td>
            </tr>

            <tr>
                <th scope="row">VIN NO번호</th>    <!-- VIN NO번호 -->
                <td>
                    <input id="sVinNo" type="text" class="form_input" />
                </td>
                <th scope="row">차량번호</th>    <!-- 차량번호 -->
                <td>
                    <input id="sCarRegNo" type="text" class="form_input" />
                </td>
                <th scope="row">주문유형</th> <!-- 주문유형 -->
                <td>
                    <input id="sOrdTp" type="text" class="form_comboBox" />
                </td>
                <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                <td>
                    <input id="sCarlineCd" class="form_comboBox" />
                </td>
            </tr>

            <tr>
                <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                <td>
                    <input id="sModelCd" class="form_comboBox"  />
                </td>
                <th scope="row"><spring:message code="global.lbl.ocn" /></th>   <!-- OCN -->
                <td>
                    <input id="sOcnCd" class="form_comboBox" />
                </td>
                <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                <td>
                    <input id="sExtColorCd" class="form_comboBox" />
                </td>
                <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                <td>
                    <input id="sIntColorCd" class="form_comboBox" />
                </td>
            </tr>

        </tbody>
    </table>
</div>

<br>

<div class="table_info table_info_v1">
    <form id="frmTotalStatus" method="post">
        <iframe id="iframeSubTotalStatus" src="" frameborder="0" scrolling="no" width="100%" height="750"></iframe>
    </form>
</div>

<!-- script -->
<script type="text/javascript">

var userId = "${userId}";
var userNm = "${userNm}";
var dlrCd  = "${dlrCd}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후

//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//주요인증문서유형(신분증유형):CRM024
var ssnCrnTpPList = [];
<c:forEach var="obj" items="${mathDocTpDS}">
    ssnCrnTpPList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//주문유형(오더유형)
var ordTpList = [];
<c:forEach var="obj" items="${ordTpInfo}">
ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

$(document).ready(function() {

    /*
    // 전체화면보기 - 버튼
    $("#btnCycleSet").kendoButton({
        click:function(e) {
            var newWindow=open("/bhmc-dms-web/ReportServer?formlet=/mis/selectSaleTotalResultDate.frm","",'top=0,left=0,width='+(screen.availWidth)+',height='+(screen.availHeight)+',toolbar=0,location=0,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
           }
    });
    */

    // 조회 - 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            subTotalStatusCall();
        }
    });


    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
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
               url:"<c:url value='/sal/utr/vehicleReport/selectModel.do' />"
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
       ,optionLabel:" "   // 전체
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
               url:"<c:url value='/sal/utr/vehicleReport/selectOcn.do' />"
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
        ,optionLabel:" "   // 전체
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
                url:"<c:url value='/sal/utr/vehicleReport/selectExtColor.do' />"
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
        ,optionLabel:" "   // 전체
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/utr/vehicleReport/selectIntColor.do' />"
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
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    // 주문유형
    $("#sOrdTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordTpList
       ,optionLabel:" "
       ,value:"N1"
    });

    // 시작일
    $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    // 종료일
    $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 신분증 유형
    $("#sMathDocTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(ssnCrnTpPList)
       ,optionLabel:" "
    });


    subTotalStatusCall();

});

// 레포트화면 호출
function subTotalStatusCall(){
    var subTotalStatusUrl = "<c:url value='/ReportServer?reportlet=sale/selectVehicleInfoReportMain.cpt' />"
      , param = "";

    param += "&sDlrCd="+dlrCd;
    param += "&sCustNm="+$("#sContractCustNm").val();
    param += "&sHpNo="+$("#sHpNo").val();
    param += "&sMathDocTp="+$("#sMathDocTp").data("kendoExtDropDownList").value();
    param += "&sSsnCrnNo="+$("#sSsnCrnNo").val();
    param += "&sCarRegStartDt="+$("#sStartDt").data("kendoExtMaskedDatePicker").value();
    param += "&sCarRegStartDt="+$("#sEndDt").data("kendoExtMaskedDatePicker").value();
    param += "&sVinNo="+$("#sVinNo").val();
    param += "&sCarRegNo="+$("#sCarRegNo").val();
    param += "&sOrdTp="+$("#sOrdTp").data("kendoExtDropDownList").value();
    param += "&sCarlineCd="+$("#sCarlineCd").data("kendoExtDropDownList").value();
    param += "&sModelCd="+$("#sModelCd").data("kendoExtDropDownList").value();
    param += "&sOcnCd="+$("#sOcnCd").data("kendoExtDropDownList").value();
    param += "&sExtColorCd="+$("#sExtColorCd").data("kendoExtDropDownList").value();
    param += "&sIntColorCd="+$("#sIntColorCd").data("kendoExtDropDownList").value();

    $("#iframeSubTotalStatus").attr("src", subTotalStatusUrl + param);
}


//고객명 enter
$(".onKey_bulr").blur(function(e){
    var cId = dms.string.strNvl($(this).context.id);
    if(cId != ""){
        $("#sContractCustNo").val('');
    }
});

// 고객명 enter
$(".onKey_up").keyup(function(e){
    var cId = dms.string.strNvl($(this).context.id);
    if(cId == ""){
        return ;
    }

    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchCustomer();
        }
    }else{
        $("#sContractCustNo").val('');
    }
});

//CRM 고객 데이터 조회
bf_searchCustomer = function(){

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":true
                , "custNm":$("#vContractCustNm").val()
                , "type"  :null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                        $("#sContractCustNm").val(data[0].custNm);       // 고객명
                        $("#vContractCustNm").val(data[0].custNm);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

</script>