<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


    <!-- 종합오더현황-딜러 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='global.title.sumOrderCntDlr' /></h1><!-- 종합오더현황-딜러 -->
            <div class="btn_right">
                <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>   <!-- 조회 -->
            </div>
        </div>
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
	                <col style="width:10%;">
	                <col style="width:14%;">
	                <col style="width:10%;">
	                <col style="width:14%;">
	                <col style="width:10%;">
	                <col>
	                <col style="width:10%;">
	                <col style="width:14%;">
	            </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"></th>
                        <td>
                            <label for="sRadioY" class="label_check">
                                <input type="radio" id="sRadioY" name="sRadio" value="Y" checked class="form_check" onClick="javascript:changedRadio(true);"/>
                                                                            常规订单
                            </label> <!-- 정규오더 -->
                            <label for="sRadioN" class="label_check">
                                <input type="radio" id="sRadioN" name="sRadio" value="N" class="form_check" onClick="javascript:changedRadio(false);"/>
                                                                            非常规订单
                            </label> <!-- 비정규오더 -->
                        </td>
                        <th scope="row" class="group-OrdTpOnlN1"><span class="bu_required"><spring:message code="global.lbl.orderType" /></span></th> <!-- 주문유형 -->
                        <td class="required_area group-OrdTpOnlN1" >
                            <input name="sOrdTpN1" id="sOrdTpN1" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdTpNotN1" style="display:none;"><spring:message code="global.lbl.orderType" /></th> <!-- 주문유형 -->
                        <td class="required_area group-OrdTpNotN1" style="display:none;">
                            <input name="sOrdTp" id="sOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt2"><span class="bu_required"><spring:message code="global.lbl.orderWeek" /></span></th> <!-- 주문주차 -->
                        <td class="required_area group-OrdDt2">
                            <input name="sOrdYyMmPrid" id="sOrdYyMmPrid" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt1" style="display:none;"><span class="bu_required"><spring:message code="global.lbl.orderRegDt" /></span></th> <!-- 주문등록일 -->
                        <td class="group-OrdDt1 required_area" style="display:none;">
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sOrdDtS" id="sOrdDtS" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sOrdDtE" id="sOrdDtE" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                        <td>
                            <input id="sCarlineCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                        <td>
                            <input id="sModelCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th>     <!-- OCN -->
                        <td>
                            <input id="sOcnCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th>        <!-- 외장색 -->
                        <td>
                            <input id="sExtColorCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.intColor' /></th>        <!-- 내장색 -->
                        <td class="bor_none">
                            <input id="sIntColorCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ordStat' /></th> <!-- 주문상태 -->
                        <td>
                            <input id="sOrdStatCd" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="mainGrid" class="resizable_grid"></div>
        </div>
        <!-- //종합오더현황-딜러 -->

        <!-- 상세정보 -->
<%--         <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.campaign.detailInfo' /></h2>    <!-- 상세정보 -->
        </div> --%>
        <div class="table_grid">
            <div id="subGrid" class="resizable_grid"></div>
        </div>
        <!-- //상세정보 -->
    </section>
</div>

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";
var sysDate = "${sysDate}";
var fifteenDayBf = "${fifteenDayBf}"

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일

var subParam = {};

//주문유형 SAL137 N1만
var ordTpListN1 = [];
<c:forEach var="obj" items="${ordTpDS}">
    <c:if test="${obj.cmmCd eq 'N1'}">
      ordTpListN1.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//주문유형 SAL137 N1제외
var ordTpList = [];
<c:forEach var="obj" items="${ordTpDS}">
    <c:if test="${obj.cmmCd ne 'N1'}">
      ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>

//주문유형 SAL137 전부 for List ComboBox
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpDS}">
    ordTpObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
</c:forEach>

// 차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

// 주차
var ordYyMmPridList = [];
<c:forEach var="obj" items="${ordYyMmPridInfo}">
    ordYyMmPridList.push({btoYmwNm:"${obj.btoYmwNm}", btoYmwCd:"${obj.btoYmwCd}"});
</c:forEach>

// 주문상태 SAL150
var ordStatCdList = [];
var ordStatCdObj = {};
<c:forEach var="obj" items="${ordStatCdDS}">
    ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//BTO주문상태 SAL135
var btoOrdStatCdList = [];
var btoOrdStatCdObj = {};
<c:forEach var="obj" items="${btoOrdStatCdDS}">
  btoOrdStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  btoOrdStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//하치장 SAL152
var vinmVlocCdList = [];
var vinmVlocCdObj = {};
<c:forEach var="obj" items="${vinmVlocDS}">
  vinmVlocCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  vinmVlocCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {
    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
            var strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
            var dtOrdDtS = $("#sOrdDtS").data('kendoDatePicker').value();
            var dtOrdDtE = $("#sOrdDtE").data('kendoDatePicker').value();

            if( strOrdYyMmPrid == null || strOrdYyMmPrid == '' ){
                dms.notification.info("<spring:message code='global.lbl.orderWeek' var='orderWeek' /><spring:message code='global.info.chkSelectItemMsg' arguments='${orderWeek},' />"); // 주문주차
                return;
            }

            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //주문유형
    $("#sOrdTpN1").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordTpListN1
       //,select:onSelectOrdTp
       ,value:"N1"
    });

    //주문유형
    $("#sOrdTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordTpList
       //,select:onSelectOrdTp
       ,optionLabel:" "  // 선택
    });

    /**
     * 주문주차 콤보박스
     */
     $("#sOrdYyMmPrid").kendoExtDropDownList({
         dataTextField:"btoYmwNm"
        ,dataValueField:"btoYmwCd"
        ,dataSource:ordYyMmPridList
        ,optionLabel:""  // 선택
        //,index:ordYyMmPridList.length
     });

    /**
     * 주문유형변경 이벤트
     */
     function onSelectOrdTp(e) {

         var ordTpCd = this.dataItem(e.item).cmmCd;

         if( ordTpCd != null && ordTpCd != ""){

             if( ordTpCd == "N1" ){

                 $("#sOrdDtS").data("kendoDatePicker").value("");
                 $("#sOrdDtE").data("kendoDatePicker").value("");

                 $(".group-OrdDt1").hide();
                 $(".group-OrdDt2").show();
             }else{
                 if( $("#sOrdDtS").data("kendoDatePicker").value() == "" || $("#sOrdDtS").data("kendoDatePicker").value() == null ){
                     $("#sOrdDtS").data("kendoDatePicker").value(fifteenDayBf);
                     $("#sOrdDtE").data("kendoDatePicker").value(sysDate);
                 }

                 $(".group-OrdDt2").hide();
                 $(".group-OrdDt1").show();
             }
         }

         $("#sCarlineCd").data("kendoExtDropDownList").value("");
         $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
         $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);

         $("#sModelCd").data("kendoExtDropDownList").enable(false);
         $("#sOcnCd").data("kendoExtDropDownList").enable(false);
         $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
         $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
     };

     /**
      * 시작일자 (From)
      */
      $("#sOrdDtS").kendoDatePicker({
          value:fifteenDayBf
         ,format:"{0:<dms:configValue code='dateFormat' />}"
      });

      /**
      * 종료일자 (From)
      */
      $("#sOrdDtE").kendoDatePicker({
          value:sysDate
         ,format:"{0:<dms:configValue code='dateFormat' />}"
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
               url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
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
               url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);}
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
                url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
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
        ,optionLabel:" "
        ,select:function(e){
            if(this.dataItem(e.item).extColorCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
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
        ,optionLabel:" "
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    // 주문상태
    $("#sOrdStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:btoOrdStatCdList
       ,optionLabel:" "  // 선택
    });

    // 메인 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0721-114112"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrs.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;


                        var sOrdTp = $('input:radio[name=sRadio]:checked').val();
                        var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
                        var strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
                        var dtOrdDtS = $("#sOrdDtS").data('kendoDatePicker').value();
                        var dtOrdDtE = $("#sOrdDtE").data('kendoDatePicker').value();

                        if(sOrdTp == "Y"){
                            dtOrdDtS = "";
                            dtOrdDtE = "";
                            strOrdTp = "N1"
                        }else{
                            strOrdYyMmPrid = "";
                        }

                        params["sOrdsTp"] = strOrdTp;
                        params["sOrdPrid"] = strOrdYyMmPrid;
                        params["sOrdStartDt"] = dtOrdDtS;
                        params["sOrdEndDt"] = dtOrdDtE;

                        //딜러코드
                        params["sDlrCd"] = dlrCd;

                        //주문상태
                        params["sOrdStatCd"] = $("#sOrdStatCd").data("kendoExtDropDownList").value();

                        // 차종
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();

                        // 모델
                        params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();

                        // OCN
                        params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();

                        // 외장색
                        params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();

                        // 내장색
                        params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();

                        //console.log('params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"ordNo",
                    fields:{
                         dlrCd :{type:"string", editable:false} //딜러코드
                        ,ordNo:{type:"string"}            //오더번호
                        ,ordYyMmDt:{type:"string"}        //오더년월일자
                        ,yyMm:{type:"string"}
                        ,week:{type:"string"}             //오더주차
                        ,ordStatCd:{type:"string"}        //주문상태코드
                        ,carlineCd:{type:"string"}        //
                        ,carlineNm:{type:"string"}        //
                        ,modelCd:{type:"string"}          //
                        ,modelNm:{type:"string"}          //
                        ,ocnCd:{type:"string"}            //
                        ,ocnNm:{type:"string"}            //
                        ,extColorCd:{type:"string"}       //
                        ,extColorNm:{type:"string"}       //
                        ,intColorCd:{type:"string"}       //
                        ,intColorNm:{type:"string"}       //
                        ,ordTp:{type:"string"}            //주문유형
                        ,ordGradeCd:{type:"string"}       //주문등급
                        ,ordQty:{type:"number"}           //주문요청수량
                        ,fstConfirmQty:{type:"number"}    //1차심사결과
                        ,scndConfirmQty:{type:"number"}   //2차심사결과
                        ,scndParIsffAdjQty:{type:"number"}   //심사미통과수량
                        ,wtOrdQty:{type:"number"}       //승인대기수량
                        ,dlrCnclQty:{type:"number"}     //승인후취소수량
                        ,cnclQty:{type:"number"}        //취소수량
                        ,nonAlocQty:{type:"number"}        //미배정수량
                        ,pdiQty:{type:"number"}         //PDI수량
                        ,vinQty:{type:"number"}         //VIN배정수량
                        ,gateOutQty:{type:"number"}     //법인출고수량
                        ,dlrInQty:{type:"number"}     //딜러입고수량
                        ,dlrOutQty:{type:"number"}     //딜러출고수량

                    }
                }
            }
            ,aggregate:[
                          { field:"ordQty", aggregate:"sum" }
                         ,{ field:"fstConfirmQty", aggregate:"sum" }
                         ,{ field:"scndConfirmQty", aggregate:"sum" }
                         ,{ field:"scndParIsffAdjQty", aggregate:"sum" }
                         ,{ field:"wtOrdQty", aggregate:"sum" }
                         ,{ field:"dlrCnclQty", aggregate:"sum" }
                         ,{ field:"cnclQty", aggregate:"sum" }
                         ,{ field:"nonAlocQty", aggregate:"sum" }
                         ,{ field:"pdiQty", aggregate:"sum" }
                         ,{ field:"vinQty", aggregate:"sum" }
                         ,{ field:"gateOutQty", aggregate:"sum" }
                         ,{ field:"dlrInQty", aggregate:"sum" }
                         ,{ field:"dlrOutQty", aggregate:"sum" }

                      ]
        }
       ,reorderable:false    //컬럼순서변경가능여부
       ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:230
       ,editable:false
       ,autoBind:false
       ,navigatable:true
       ,selectable:"row"
       ,pageable :{
           refresh :true
           ,pageSize :500
           ,pageSizes :[ "500", "1000", "1500", "2000"]
       }
       ,columns:[
          {field:"dlrCd"            ,title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}                                       // 딜러코드
          ,{field:"ordNo"           ,hidden:true}       // 오더번호
          ,{field:"ordYyMmDt"       ,hidden:true}       // 오더번호
          ,{field:"yyMm"            ,hidden:true}       // 오더년월
          ,{field:"week"            ,hidden:true}       // 오더주차
          ,{field:"ordStatCd"       ,sortable:false, hidden:true, template:"#= ordStatCdObj[ordStatCd] #"}                                  // 주문상태
          ,{field:"carlineNm"       ,title:"<spring:message code='global.lbl.carLine' />"       ,width:100   ,attributes:{"class":"al"},footerAttributes:{style:"visibility:hidden;"}}     // 차종
          ,{field:"modelNm"         ,title:"<spring:message code='global.lbl.model' />"         ,width:100  ,attributes:{"class":"al"},footerAttributes:{style:"visibility:hidden;"}}     // 모델
          ,{field:"ocnNm"           ,title:"<spring:message code='global.lbl.ocnCode' />"       ,width:100  ,attributes:{"class":"al"},footerAttributes:{style:"visibility:hidden;"}}     // OCN
          ,{field:"extColorNm"      ,title:"<spring:message code='global.lbl.extColorCd' />"    ,width:100  ,attributes:{"class":"al"},footerAttributes:{style:"visibility:hidden;"}}     // 외장색
          ,{field:"intColorNm"      ,title:"<spring:message code='global.lbl.intColorCd' />"    ,width:100  ,attributes:{"class":"al"},footerAttributes:{style:"visibility:hidden;"}}     // 내장색
          ,{field:"ordTp"           ,title:"<spring:message code='global.lbl.orderType' />"     ,width:80  ,attributes:{"class":"ac"},  template:"#= ordTpObj[ordTp] #",footerAttributes:{style:"visibility:hidden;"}}   // 주문유형
          ,{field:"ordGradeCd"      ,title:"<spring:message code='global.lbl.orderGrade' />"    ,width:80   ,attributes:{"class":"ac"},footerAttributes:{style:"visibility:hidden;"}}     // 주문등급
          ,{field:"ordQty"          ,title:"<spring:message code='global.lbl.reqQty' />"        ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //요청수량
          ,{field:"fstConfirmQty"   ,title:"<spring:message code='global.lbl.fstConfirmQty' />" ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //1차심사결과
          ,{field:"scndConfirmQty"        ,title:"<spring:message code='global.lbl.scndConfirmQty' />"      ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
              ,footerTemplate:"#=kendo.toString(sum)#"
              ,footerAttributes:{style:"text-align:right;"}
             }          //2차심사결과
          ,{field:"scndParIsffAdjQty"        ,title:"<spring:message code='sal.lbl.evalRequestQty' />"      ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
             ,footerTemplate:"#=kendo.toString(sum)#"
             ,footerAttributes:{style:"text-align:right;"}
            }          //심사미통과수량
          ,{field:"wtOrdQty"        ,title:"<spring:message code='global.lbl.wtOrdQty' />"      ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //승인대기수량
          ,{field:"dlrCnclQty"      ,title:"<spring:message code='global.lbl.dlrCnclQty' />"    ,width:100  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //승인후취소수량
           ,{field:"nonAlocQty"         ,title:"<spring:message code='global.lbl.nOrdQty' />"       ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
               ,footerTemplate:"#=kendo.toString(sum)#"
               ,footerAttributes:{style:"text-align:right;"}
              }          //미배정수량
          ,{field:"pdiQty"          ,title:"<spring:message code='global.lbl.orderAssignQty' />",width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //오다배정수량
          ,{field:"vinQty"          ,title:"<spring:message code='global.lbl.vinQty' />"        ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //VIN배정수량
          ,{field:"gateOutQty"      ,title:"<spring:message code='global.lbl.dlrSaleQty' />"    ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //법인출고수량
          ,{field:"dlrInQty"      ,title:"<spring:message code='sal.lbl.dlrInQty' />"    ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //딜러입고수량
          ,{field:"dlrOutQty"      ,title:"<spring:message code='sal.lbl.dlrOutQty' />"    ,width:80  ,attributes:{"class":"ar"}, format:"{0:n0}"
            ,footerTemplate:"#=kendo.toString(sum)#"
            ,footerAttributes:{style:"text-align:right;"}
           }          //딜러출고수량

       ]
   });

   // 그리드 더블클릭
   $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#mainGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       if(selectedItem != null){
           subParam = {
                   "sDlrCd":selectedItem.dlrCd
                 , "sOrdYyMmDt":selectedItem.ordYyMmDt
                 , "sOrdPrid":selectedItem.week
                 , "sOrdsTp":selectedItem.ordTp
                 , "sCarlineCd":selectedItem.carlineCd
                 , "sModelCd":selectedItem.modelCd
                 , "sOcnCd":selectedItem.ocnCd
                 , "sExtColorCd":selectedItem.extColorCd
                 , "sIntColorCd":selectedItem.intColorCd
            };
           // 상세정보 Grid 조회
           $('#subGrid').data('kendoExtGrid').dataSource.read();
       }
   });

   // 상세정보
   $("#subGrid").kendoExtGrid({
       gridId:"G-SAL-0721-114113"
       ,dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/orc/sumOrderCnt/selectSumOrderCntDlrSubs.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       //var params = {};
                       //params["recordCountPerPage"] = options.pageSize;
                       //params["pageIndex"] = options.page;
                       //params["firstIndex"] = options.skip;
                       //params["lastIndex"] = options.skip + options.take;
                       //params["sort"] = options.sort;

                       //console.log('subParam:',kendo.stringify(subParam) );
                       return kendo.stringify(subParam);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"ordSeq",
                   fields:{
                        //totCnt :{type:"number", editable:false} //전체 갯수
                        ordTp:{type:"string"}         //주문유형
                       ,ordStatCd:{type:"string"}     //오더상태명
                       ,ordDate:{type:"date"}         //주문등록일자
                       ,chrgCd:{type:"string"}        //주문자
                       ,ordSeq:{type:"string"}        //주문번호
                       //,salesNo:{type:"string"}     //영업번호
                       ,vinmVloc:{type:"string"}      //하치장명
                       ,fndlDt:{type:"date"}          //납기예정일
                       //,carlineCd:{type:"string"}   //
                       ,carlineNm:{type:"string"}     //
                       //,modelCd:{type:"string"}     //
                       ,modelNm:{type:"string"}       //
                       //,ocnCd:{type:"string"}       //
                       ,ocnNm:{type:"string"}         //
                       //,extColorCd:{type:"string"}  //
                       ,extColorNm:{type:"string"}    //
                       //,intColorCd:{type:"string"}  //
                       ,intColorNm:{type:"string"}    //
                       ,vinNo:{type:"string"}         //VIN NO
                       ,pdiDt:{type:"date"}           //PDI배정일
                       ,vinDt:{type:"date"}           //VIN배정일
                       ,retailDt:{type:"date"}        //출고일자
                       ,dlrGrDt:{type:"date"}        //입고일자
                       ,custSaleDt:{type:"date"}        //판매일자

                   }
               }
           }
       }
      ,reorderable:false    //컬럼순서변경가능여부
      ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
      ,appendEmptyColumn:false           //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,editable:false
      ,autoBind:false
      ,navigatable:true
      ,selectable:"row"
      ,sortable:false
      ,pageable:false
      ,height:230
      ,columns:[
          {field:"ordTp"        ,title:"<spring:message code='global.lbl.orderType' />"     ,width:80       , attributes:{"class":"ac"}, template:"#= ordTpObj[ordTp] #"}         // 주문유형
         ,{field:"ordStatCd"    ,title:"<spring:message code='global.lbl.ordStat' />"       ,width:80       , attributes:{"class":"ac"}, template:"#= ordStatCdObj[ordStatCd] #"} // 주문상태
         ,{field:"ordDate"      ,title:"<spring:message code='global.lbl.chrgDt' />"        ,width:80       , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 주문일자
         ,{field:"chrgCd"       ,title:"<spring:message code='global.lbl.chrgCd' />"        ,width:80       , attributes:{"class":"ac"}}                                          // 주문자
         ,{field:"ordSeq"       ,title:"<spring:message code='global.lbl.ordNo' />"         ,width:80       , attributes:{"class":"al"}}                                         // 주문번호
         ,{field:"vinmVloc"     ,title:"<spring:message code='sal.lbl.plant' />"            ,width:80       , attributes:{"class":"al"}, template:"#=dms.string.strNvl(vinmVlocCdObj[vinmVloc])#"}    // 공장
         ,{field:"fndlDt"       ,title:"<spring:message code='sal.estimatedPayDt' />"       ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 수납예정일
         ,{field:"carlineNm"    ,title:"<spring:message code='global.lbl.carLine' />"       ,width:120      , attributes:{"class":"al"}}                                         // 차종
         ,{field:"modelNm"      ,title:"<spring:message code='global.lbl.model' />"         ,width:120      , attributes:{"class":"al"}}                                         // 모델
         ,{field:"ocnNm"        ,title:"<spring:message code='global.lbl.ocn' />"           ,width:100      , attributes:{"class":"al"}}                                         // OCN
         ,{field:"extColorNm"   ,title:"<spring:message code='global.lbl.extColor' />"      ,width:100      , attributes:{"class":"al"}}                                         // 외장색명
         ,{field:"intColorNm"   ,title:"<spring:message code='global.lbl.intColor' />"      ,width:100      , attributes:{"class":"al"}}                                         // 내장색
         ,{field:"vinNo"        ,title:"<spring:message code='global.lbl.vinNo' />"         ,width:150      , attributes:{"class":"ac"}}                                          // VIN
         ,{field:"pdiDt"        ,title:"<spring:message code='global.llbl.pdiDt' />"        ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// PDI배정일
         ,{field:"vinDt"        ,title:"<spring:message code='global.lbl.vinDt' />"         ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// VIN배정일
         ,{field:"retailDt"     ,title:"<spring:message code='sal.lbl.giDocDt' />"          ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 공장출고일자
         ,{field:"dlrGrDt"     ,title:"<spring:message code='sal.lbl.grDt' />"              ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 입고일
         ,{field:"custSaleDt"  ,title:"<spring:message code='sal.lbl.saleDt' />"            ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 판매일

      ]
  });
});

//radio 버튼 처리
function changedRadio(flg){
   if(flg){
       $("#sRadioY").prop("checked", true);
       $("#sOrdDtS").data("kendoDatePicker").value("");
       $("#sOrdDtE").data("kendoDatePicker").value("");

       $(".group-OrdTpNotN1").hide();
       $(".group-OrdTpOnlN1").show();
       $(".group-OrdDt1").hide();
       $(".group-OrdDt2").show();
   }else{
       if( $("#sOrdDtS").data("kendoDatePicker").value() == "" || $("#sOrdDtS").data("kendoDatePicker").value() == null ){
           $("#sOrdDtS").data("kendoDatePicker").value(fifteenDayBf);
           $("#sOrdDtE").data("kendoDatePicker").value(sysDate);
       }

       $(".group-OrdTpNotN1").show();
       $(".group-OrdTpOnlN1").hide();

       $(".group-OrdDt1").show();
       $(".group-OrdDt2").hide();
   }
}
</script>