<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <!-- 종합오더현황-법인 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='global.title.sumOrderCntCorp' /></h1><!-- 종합오더현황-법인 -->
            <div class="btn_right">
                <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>   <!-- 조회 -->
            </div>
        </div>
        <div class="table_form form_width_70per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:16%;">
                    <col style="width:7%;">
                    <col style="width:23%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                       <th scope="row"><span class="bu_required"><spring:message code='global.lbl.dealer' /></span></th><!-- 딜러 -->
                       <td class="required_area">
                           <input id="sDlrCd" class="form_input"  maxlength="5" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.orderType' /></span></th> <!-- 주문유형 -->
                        <td class="required_area">
                            <input id="sOrdTp" class="form_comboBox" />
                        </td>
                        <th scope="row" class="group-OrdDt2"><span class="bu_required"><spring:message code="global.lbl.orderWeek" /></span></th> <!-- 주문주차 -->
                        <td class="required_area group-OrdDt2">
                            <input name="sOrdYyMmPrid" id="sOrdYyMmPrid" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt1" style="display:none;"><span class="bu_required"><spring:message code="global.lbl.orderRegDt" /></span></th> <!-- 주문등록일 -->
                        <td class="group-OrdDt1 required_area" style="display:none;">
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sOrdStartDt" id="sOrdStartDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sOrdEndDt" id="sOrdEndDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
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
                        <th scope="row" class="bor_none"></th>
                        <td></td>
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
                        <th scope="row" class="bor_none"></th>
                        <td></td>

                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="mainGrid"></div>
        </div>
    </section>
    <!-- //종합오더현황-법인 -->
        <div class="table_grid mt10">
            <div id="mainGrid"></div>
        </div>
     <!-- //종합오더현황-법인 -->

        <!-- 상세정보 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.campaign.detailInfo' /></h2>    <!-- 상세정보 -->
        </div>
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

//주문유형 SAL137
var ordTpList = [];
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpDS}">
  <c:if test="${obj.cmmCd ne 'N3' && obj.cmmCd ne 'N5' && obj.cmmCd ne 'NS' && obj.cmmCd ne 'N7'}">
    ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:if>
    ordTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
/* var ordTpList = [];
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpDS}">
  <c:if test="${obj.cmmCd ne 'N3' && obj.cmmCd ne 'N5' && obj.cmmCd ne 'NS' && obj.cmmCd ne 'N7'}">
    ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:if>
    ordTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach> */

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
var vinmVlocList = [];
var vinmVlocObj = {};
<c:forEach var="obj" items="${vinmVlocDS}">
  vinmVlocList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  vinmVlocObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {
    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            if( $("#sDlrCd").val() == "" ){
                // 딜러코드 를(을) 입력해주세요.
                dms.notification.info("<spring:message code='global.lbl.dlrCd' var='globalLblDlrCd' /><spring:message code='global.info.emptyCheckParam' arguments='${globalLblDlrCd}' />");
                return false;
            }

            if( sOrdStartDt == null || sOrdEndDt == '' ){
                dms.notification.info("<spring:message code='global.lbl.orderWeek' var='orderWeek' /><spring:message code='global.info.chkSelectItemMsg' arguments='${orderWeek},' />"); // 주문주차
                return;
            }

            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 주문유형
     $("#sOrdTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordTpList
       ,select:onSelectOrdTp
       ,optionLabel:" "  // 선택
       ,value:"N1"
    });

    // 주차
    $("#sOrdYyMmPrid").kendoExtDropDownList({
        dataTextField:"btoYmwNm"
       ,dataValueField:"btoYmwCd"
       ,dataSource:ordYyMmPridList
       ,optionLabel:" "  // 선택
       ,index:ordYyMmPridList.length
    });


    /**
     * 시작일자 (From)
     */
     $("#sOrdStartDt").kendoDatePicker({
         value:oneDay
        ,format:"{0:<dms:configValue code='dateFormat' />}"
     });

     /**
     * 종료일자 (From)
     */
     $("#sOrdEndDt").kendoDatePicker({
         value:toDay
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
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);       }
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
        ,optionLabel:" "   // 전체
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    // 주문상태
    $("#sOrdStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:btoOrdStatCdList
       ,optionLabel:" "  // 선택
    });

    /**
     * 주문유형변경 이벤트
     */
     function onSelectOrdTp(e) {

         var ordTpCd = this.dataItem(e.item).cmmCd;

         if( ordTpCd != null && ordTpCd != ""){

             if( ordTpCd == "N1" ){

                 $(".group-OrdDt1").hide();
                 $(".group-OrdDt2").show();
             }else{
                 if($("#sOrdStartDt").val() == "" || $("#sOrdStartDt").val() == null){
                     $("#sOrdStartDt").val(fifteenDayBf);
                     $("#sOrdEndDt").val(sysDate);
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


    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0721-114110"
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

                        var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
                        var strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
                        var dtOrdDtS = $("#sOrdStartDt").data('kendoDatePicker').value();
                        var dtOrdDtE = $("#sOrdEndDt").data('kendoDatePicker').value();

                        if(strOrdTp == "N1"){
                            params["sOrdPrid"] = strOrdYyMmPrid;
                        }else{
                            params["sOrdStartDt"] = dtOrdDtS;
                            params["sOrdEndDt"] = dtOrdDtE;
                        }

                        //딜러코드
                        params["sDlrCd"] = $("#sDlrCd").val();

                        //주문유형
                        params["sOrdTp"] = strOrdTp;

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

                        console.log('params:',kendo.stringify(params) );
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
                        ,wtOrdQty:{type:"number"}       //승인대기수량
                        ,dlrCnclQty:{type:"number"}     //승인후취소수량
                        ,cnclQty:{type:"number"}        //취소수량
                        ,nonAlocQty:{type:"number"}        //미배정수량
                        ,pdiQty:{type:"number"}         //PDI수량
                        ,vinQty:{type:"number"}         //VIN배정수량
                        ,gateOutQty:{type:"number"}     //법인출고수량
                    }
                }
            }
            ,aggregate:[
                        { field:"ordQty", aggregate:"sum" }
                       ,{ field:"fstConfirmQty", aggregate:"sum" }
                       ,{ field:"scndConfirmQty", aggregate:"sum" }
                       ,{ field:"finalQty", aggregate:"sum" }
                       ,{ field:"wtOrdQty", aggregate:"sum" }
                       ,{ field:"dlrCnclQty", aggregate:"sum" }
                       ,{ field:"cnclQty", aggregate:"sum" }
                       ,{ field:"nonAlocQty", aggregate:"sum" }
                       ,{ field:"pdiQty", aggregate:"sum" }
                       ,{ field:"vinQty", aggregate:"sum" }
                       ,{ field:"gateOutQty", aggregate:"sum" }
                    ]
        }
       ,reorderable:false    //컬럼순서변경가능여부
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:450
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
          {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:120, attributes:{"class":"ac"}}       // 딜러코드
          ,{field:"ordNo", hidden:true}       // 오더번호
          ,{field:"ordYyMmDt", hidden:true}   // 오더번호
          ,{field:"yyMm", hidden:true}        // 오더년월
          ,{field:"week", hidden:true}        // 오더주차
          ,{field:"ordStatCd", sortable:false, hidden:true, template:"#= ordStatCdObj[ordStatCd] #"}        // 주문상태
          ,{field:"carlineCd",  title:"<spring:message code='global.lbl.carlineCd' />",     width:80,   attributes:{"class":"ac"}}    // 차종
          ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",   width:150,  attributes:{"class":"al"}}    // 차종명
          ,{field:"modelCd",    title:"<spring:message code='global.lbl.model' />",       width:100,  attributes:{"class":"ac"}}    // 모델
          ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",     width:250,  attributes:{"class":"al"}}     // 모델명
          ,{field:"ocnCd",      title:"<spring:message code='global.lbl.ocn' />",         width:100,  attributes:{"class":"ac"}}    // OCN
          ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",       width:250,  attributes:{"class":"al"}}    // OCN명
          ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColor' />",    width:100,  attributes:{"class":"ac"}}    // 외장색
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",  width:200,  attributes:{"class":"al"}}    // 외장색명
          ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColor' />",    width:100,  attributes:{"class":"ac"}}    // 내장색
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",  width:200,  attributes:{"class":"al"}}    // 내장색명
          ,{field:"ordTp",      title:"<spring:message code='global.lbl.orderType' />",   width:250,  attributes:{"class":"ac"},  template:"#= ordTpObj[ordTp] #"}   // 주문유형
          ,{field:"ordGradeCd", title:"<spring:message code='global.lbl.orderGrade' />",  width:80,   attributes:{"class":"ac"}}   // 주문등급
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
                 , "sCarlineCd":selectedItem.carlineCd
                 , "sOrdSeq":selectedItem.ordNo
            };
           // 상세정보 Grid 조회
           $('#subGrid').data('kendoExtGrid').dataSource.read();
       }
   });

   // 상세정보
   $("#subGrid").kendoExtGrid({
       gridId:"G-SAL-0721-114111"
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
                        totCnt :{type:"number", editable:false} //전체 갯수
                       ,ordTp:{type:"string"}           //주문유형
                       ,ordStatCd:{type:"string"}       //오더상태명
                       ,ordDate:{type:"date"}         //주문등록일자
                       ,chrgCd:{type:"string"}          //주문자
                       ,ordSeq:{type:"number"}          //주문번호
                       ,salesNo:{type:"string"}         //영업번호
                       ,vinmVloc:{type:"string"}        //하치장명
                       ,fndlDt:{type:"date"}          //납기예정일
                       ,height:80
                       //,carlineCd:{type:"string"}        //
                       ,carlineNm:{type:"string"}        //
                       //,modelCd:{type:"string"}          //
                       ,modelNm:{type:"string"}          //
                       //,ocnCd:{type:"string"}            //
                       ,ocnNm:{type:"string"}            //
                       //,extColorCd:{type:"string"}       //
                       ,extColorNm:{type:"string"}       //
                       //,intColorCd:{type:"string"}       //
                       ,intColorNm:{type:"string"}       //
                       ,pdiDt:{type:"date"}            //PDI배정일
                       ,vinDt:{type:"date"}            //VIN배정일
                       ,retailDt:{type:"date"}         //출고일자
                       ,vinNo:{type:"string"}            //VIN NO
                   }
               }
           }
       }
      ,reorderable:false    //컬럼순서변경가능여부
      ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
      ,appendEmptyColumn:false           //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,height:300
      ,editable:false
      ,autoBind:false
      ,navigatable:true
      ,selectable:"row"
      ,sortable:false
      ,pageable:false
      ,columns:[
         //{field:"totCnt", hidden:true, format:"{0:n0}"}       // 전체 갯수
         {field:"ordTp",      title:"<spring:message code='global.lbl.orderType' />",    width:100, attributes:{"class":"ac"}, template:"#= ordTpObj[ordTp] #"}           // 주문유형
         ,{field:"ordStatCd",  title:"<spring:message code='global.lbl.ordStat' />",      width:100, attributes:{"class":"ac"}, template:"#= ordStatCdObj[ordStatCd] #"}   // 주문상태
         ,{field:"ordDate",    title:"<spring:message code='global.lbl.carRegDt' />",     width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 등록일자
         ,{field:"chrgCd",     title:"<spring:message code='global.lbl.chrgCd' />",       width:100}        // 주문자
         ,{field:"ordSeq",     title:"<spring:message code='global.lbl.ordNo' />",        width:100, attributes:{"class":"ac"}}      // 주문번호
         ,{field:"salesNo",    title:"<spring:message code='sal.lbl.salesNo' />",         width:80,  attributes:{"class":"ac"}}    // 영업번호
         ,{field:"vinmVloc", title:"<spring:message code='sal.lbl.plant' />", width:80,  attributes:{"class":"al"}, template:"#=dms.string.strNvl(vinmVlocObj[vinmVloc])#"}    // 공장
         ,{field:"fndlDt",     title:"<spring:message code='global.lbl.fndlDt' />",       width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}    // 납기예정일
         //,{field:"carlineCd",  title:"<spring:message code='global.lbl.carlineCd' />",      width:80,  attributes:{"class":"ac"}}    // 차종
         ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",    width:120, attributes:{"class":"al"}}    // 차종
         //,{field:"modelCd",    title:"<spring:message code='global.lbl.model' />",        width:100, attributes:{"class":"ac"}}    // 모델
         ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",      width:120, attributes:{"class":"al"}}    // 모델
         //,{field:"ocnCd",      title:"<spring:message code='global.lbl.ocn' />",          width:100, attributes:{"class":"ac"}}    // OCN
         ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",        width:120, attributes:{"class":"al"}}    // OCN
         //,{field:"extColorCd", title:"<spring:message code='global.lbl.extColor' />",     width:100, attributes:{"class":"ac"}}    // 외장색
         ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",   width:100, attributes:{"class":"al"}}    // 외장색명
         //,{field:"intColorCd", title:"<spring:message code='global.lbl.intColor' />",     width:100, attributes:{"class":"ac"}}    // 내장색
         ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",   width:100, attributes:{"class":"al"}}    // 내장색명
         ,{field:"pdiDt"        ,title:"<spring:message code='global.llbl.pdiDt' />"        ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// PDI배정일
         ,{field:"vinDt"        ,title:"<spring:message code='global.lbl.vinDt' />"         ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// VIN배정일
         ,{field:"retailDt"     ,title:"<spring:message code='global.lbl.giDocRegDt' />"    ,width:100      , attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}// 출고일자
         ,{field:"vinNo",      title:"<spring:message code='global.lbl.vinNo' />",        width:130, attributes:{"class":"ar"}}    // VIN
      ]
  });

});
</script>