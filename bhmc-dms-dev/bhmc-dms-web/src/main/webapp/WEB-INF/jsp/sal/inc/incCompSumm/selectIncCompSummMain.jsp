<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 보험가입정보관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.InsCorpBusSum" /></h1><!-- 보험회사업무통계 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13076" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col style="width:18%;">
                <col style="width:9%;">
                <col style="width:18%;">
                <col style="width:9%;">
                <col style="width:18%;">
                <col style="width:5%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.incJoinDt' /></th><!-- 보험가입일 -->
                    <td>
                        <div class="date_left">
                            <input id="sIncJoinStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sIncJoinEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.carNoRegDt' /></th><!-- 차량번호등록일 -->
                    <td >
                        <div class="date_left">
                            <input id="sCarRegStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from" >~</span>
                        </div>
                        <div class="date_right">
                            <input id="sCarRegEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.carSaleDt' /></th><!-- 차량판매일 -->
                    <td>
                        <div class="date_left">
                            <input id="sCarSaleStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sCarSaleEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.vinNo" /></th><!-- VIN NO -->
                    <td >
                        <input id="sVinNo" type="text" class="form_input"  />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                    <td >
                        <input id="sIncUsrNm" type="text" class="form_input"  />
                    </td>

                    <%-- <td class="required_area">
                        <div id="searchVinNo" class="form_search" style="width:49%;">
                            <input id="sVinNo" type="text" class="form_input" >
                            <a href="javascript:;"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                        </div>
                    </td> --%>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->



</section>
</div>



<!-- script -->
<script>
var oneDay = "${oneDay}";               // 당월 1일
var toDay = "${toDay}";                 // 오늘 일자
var nextYearDay = "${nextYearDay}";     // 내년 오늘일자

//보험회사 Array
var incCmpCd = [];
<c:forEach var="obj" items="${incCmpCdList}">
    incCmpCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사차구분 Map
var incCmpCdMap = dms.data.arrayToMap(incCmpCd, function(obj){ return obj.cmmCd; });


//보험종류(대행구분) Array
var regTp = [];
<c:forEach var="obj" items="${regTpList}">
    regTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사차구분 Map
var regTpMap = dms.data.arrayToMap(regTp, function(obj){ return obj.cmmCd; });



$(document).ready(function() {


    //조회조건 - 보험가입일자(기간)- START
    $("#sIncJoinStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    //조회조건 - 보험가입일자(기간)- END
    $("#sIncJoinEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    //조회조건  - 차량번호등록일(기간)- START
    $("#sCarRegStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 차량번호등록일(기간)- END
    $("#sCarRegEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    //조회조건  - 차량판매일(기간)- START
    $("#sCarSaleStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 차량판매일(기간)- END
    $("#sCarSaleEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    /*************************** 검색 조건 영역 END **************************************************/


    /*************************** 보험정보 영역 END **************************************************/

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            var inFromDt = $("#sIncJoinStartDt").data("kendoExtMaskedDatePicker").value();
            var inToDt = $("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(inFromDt, inToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sIncJoinStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(inToDt, inFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sIncJoinEndDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(inFromDt, inToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sIncJoinEndDt").focus();
               return false;
            }
            
            var regFromDt = $("#sCarRegStartDt").data("kendoExtMaskedDatePicker").value();
            var regToDt = $("#sCarRegEndDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(regFromDt, regToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sCarRegStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(regToDt, regFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sCarRegEndDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(regFromDt, regToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sCarRegEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sCarRegEndDt").focus();
               return false;
            }
            
            var carFromDt = $("#sCarSaleStartDt").data("kendoExtMaskedDatePicker").value();
            var carToDt = $("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(carFromDt, carToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sCarSaleStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(carToDt, carFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sCarSaleEndDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(carFromDt, carToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sCarSaleEndDt").focus();
               return false;
            }
            
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    /*******************  //버튼   *******************************************/

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113337"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/inc/incJoinInfo/selectIncJoinInfo.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sIncJoinStartDt"]= $("#sIncJoinStartDt").data("kendoExtMaskedDatePicker").value();    // 보험가입일(기간) - 시작일
                        params["sIncJoinEndDt"]  = $("#sIncJoinEndDt").data("kendoExtMaskedDatePicker").value();      // 보험가입일(기간) - 종료일
                        params["sCarRegStartDt"] = $("#sCarRegStartDt").data("kendoExtMaskedDatePicker").value();     // 차량번호등록일(기간) - 시작일
                        params["sCarRegEndDt"]   = $("#sCarRegEndDt").data("kendoExtMaskedDatePicker").value();       // 차량번호등록일(기간) - 종료일
                        params["sCarSaleStartDt"]= $("#sCarSaleStartDt").data("kendoExtMaskedDatePicker").value();    // 차량판매일(기간) - 시작일
                        params["sCarSaleEndDt"]  = $("#sCarSaleEndDt").data("kendoExtMaskedDatePicker").value();      // 차량판매일(기간) - 종료일
                        params["sVinNo"]         = $("#sVinNo").val();                                                // VIN NO
                        params["sIncUsrNm"]      = $("#sIncUsrNm").val();                                             // 차량번호

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"incPk"
                    ,fields:{
                         incPk    :{type:"string"}
                        ,custNo :{type:"string"}
                        ,custNm :{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,modelNm  :{type:"string"}
                        ,vinNo    :{type:"string"}
                        ,incCmpCd :{type:"string"}
                        ,RegTp    :{type:"string"}
                        ,incAmt   :{type:"number"}
                        ,realIncAmt:{type:"number"}
                        ,dcAmt    :{type:"number"}
                        ,profitAmt:{type:"number"}
                        ,incNo    :{type:"string"}
                        ,incAapUsrNm:{type:"string"}
                        ,incJoinDt:{type:"date"}
                        ,incEndDt :{type:"date"}
                        ,paymNo   :{type:"string"}
                        ,incUsrId :{type:"string"}
                        ,incUsrNm :{type:"string"}
                        ,carRegDt :{type:"date"}
                        ,incPrsnNm:{type:"string"}
                        ,carRegNo :{type:"carRegNo"}
                    }
                }
            }
        }
        ,editable:false
        //,autoBind:false
        //,height  :428
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                     {field:"custNo"
                       ,title:"<spring:message code = 'sal.lbl.incUsrId'/>"
                       ,width:130 ,attributes:{"class":"ac"}
                     } //보험가입자 번호
                    ,{field:"custNm"
                       ,title:"<spring:message code = 'sal.lbl.incUsrNm'/>"
                       ,width:80
                       ,attributes:{"class":"al"}
                     } //보험가입자 명
                    ,{field:"carlineNm"
                       ,title:"<spring:message code = 'global.lbl.carLine'/>"
                       ,width:100
                       ,attributes:{"class":"ac"}
                     } //차종
                    ,{field:"modelNm"
                       ,title:"<spring:message code = 'global.lbl.model'/>"
                       ,width:190
                       ,attributes:{"class":"al"}
                     } //모델
                    ,{field:"vinNo"
                       ,title:"<spring:message code = 'global.lbl.vinNum'/>"
                       ,width:150
                       ,attributes:{"class":"ac"}
                     } //VIN NO
                    ,{field:"incCmpCd"
                       ,title:"<spring:message code = 'global.lbl.incCmp'/>"
                       ,width:80
                       ,attributes:{"class":"al"}
                       ,template:"# if(incCmpCdMap[incCmpCd] != null) { # #= incCmpCdMap[incCmpCd].cmmCdNm# # }#"
                     } //보험회사
                    ,{field:"regTp"
                       ,title:"<spring:message code = 'sal.lbl.incType'/>"
                       ,width:70
                       ,attributes:{"class":"ac"}
                       ,template:"# if(regTpMap[regTp] != null) { # #= regTpMap[regTp].cmmCdNm# # }#"
                     } //보험종류
                    ,{field:"incAmt"
                       ,title:"<spring:message code = 'global.lbl.incAmt'/>"
                       ,width:80
                       ,attributes:{"class":"ar"}
                       , format:"{0:##,###}"
                     } //보험금액
                    ,{field:"realIncAmt"
                       ,title:"<spring:message code = 'sal.lbl.realIncAmt'/>"
                       ,width:80
                       ,attributes:{"class":"ar"}
                       ,format:"{0:##,###}"
                     } //실보험금액
                    ,{field:"dcRate"
                       ,title:"<spring:message code = 'global.lbl.dcRate'/>"
                       ,width:40
                       ,attributes:{"class":"ar"}
                     } //할인율
                    ,{field:"profitAmt"
                       ,title:"<spring:message code = 'sal.lbl.profitAmt'/>"
                       ,width:40
                       ,attributes:{"class":"ar"}
                       ,format:"{0:##,###}"
                     } //이윤
                    ,{field:"incNo"
                       ,title:"<spring:message code = 'global.lbl.incNo'/>"
                       ,width:100
                       ,attributes:{"class":"ac"}
                     } //보험번호
                    ,{field:"incAapUsrNm"
                       ,title:"<spring:message code = 'sal.lbl.agencyPersNm'/>"
                       ,width:100
                       ,attributes:{"class":"al"}
                     } //대리인
                    ,{field:"incJoinDt"
                       ,title:"<spring:message code = 'global.lbl.incJoinDt'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                     } //보험가입일
                   ,{field:"incEndDt"
                       ,title:"<spring:message code = 'sal.lbl.incEndDt'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                     } //보험만기일
                   /* ,{field:"paymNo"
                       ,title:"<spring:message code = 'sal.lbl.paymentNo'/>"
                       ,width:150
                       ,attributes:{"class":"al"}
                     } //수금번호
                    ,{field:"sungNm"
                       ,title:"<spring:message code = 'sal.lbl.incSungNm'/>"
                       ,width:120
                       ,attributes:{"class":"ac"}
                     } //보험가입지(성)
                    ,{field:"cityNm"
                       ,title:"<spring:message code = 'sal.lbl.incCityNm'/>"
                       ,width:120
                       ,attributes:{"class":"ac"}
                     } //보험가입지(도시)
                    ,{field:"distNm"
                       ,title:"<spring:message code = 'sal.lbl.incDistNm'/>"
                       ,width:120
                       ,attributes:{"class":"ac"}
                     } //보험가입지(지역)
                    ,{field:"addrNm"
                       ,title:"<spring:message code = 'sal.lbl.incAddrNm'/>"
                       ,width:200
                       ,attributes:{"class":"al"}
                     } //보험가입지(상세주소) */
                    ,{field:"carRegNo"
                       ,title:"<spring:message code = 'global.lbl.carNo'/>"
                       ,width:80
                       ,attributes:{"class":"ac"}
                     } //차량번호
                    ,{field:"incPrsnNm"
                       ,title:"<spring:message code = 'sal.lbl.incPerson'/>"
                       ,width:80
                       ,attributes:{"class":"al"}
                     } //보험담당
                   ]
    });


});

//검색조건 - 차량마스터팝업 열기 함수.
$("#searchVinNo").click(function(){

    popupWindow = dms.window.popup({
        windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
        ,title:"<spring:message code='global.title.vehicleMaster' />"
        ,content:{
            url:"<c:url value='/sal/cmm/selectVehicleMasterPopup.do'/>"
            ,data:{
                "type"  :null
                ,"autoBind":false
                ,"callbackFunc":function(data){
                        $("#sVinNo").val(data[0].vinNo);

                }
            }
        }
    });
});

</script>
<!-- //script -->