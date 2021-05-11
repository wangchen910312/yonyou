<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />

<!-- 딜러주문조회 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.menu.dlrOrderSearch' /></h1> <!-- 딜러주문조회 -->
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>  <!-- 조회 -->
        </div>
    </div>
    <div class="table_form form_width_70per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>

<%--                    <th scope="row"></th>
                    <td>
                        <label class="label_check"><input type="radio" id="sRadioY" name="sRadio" value="Y" onclick="javascript:changedRadio(true);" checked class="form_check"><spring:message code='ser.lbl.model' /></label>      <!-- 모델 -->
                        <label class="label_check"><input type="radio" id="sRadioN" name="sRadio" value="N" onclick="javascript:changedRadio(false);" class="form_check"><spring:message code='global.lbl.all' /></label>           <!-- 전체 -->
                    </td> --%>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.orderType' /></span></th> <!-- 주문유형 -->
                    <td>
                        <input id="sOrdTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ordStat' /></th> <!-- 주문상태 -->
                    <td>
                        <input id="sOrdStatCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><input type="radio" id="sRadioY" name="sRadio" value="Y" onclick="javascript:changedRadio(true);" checked class="form_check"><spring:message code='sal.lbl.ordSetDt' /></th>   <!-- 오더배정일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sOrdStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sOrdEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><input type="radio" id="sRadioY" name="sRadio" value="N" onclick="javascript:changedRadio(false);" checked class="form_check"><spring:message code='sal.lbl.evalConfMth' /></th>   <!-- 심사평가월 -->
                        <div class="form_float">
                            <td>
                                <input id="sYyMm" class="form_datepicker" />
                            </td>
                        </div>


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
                    <td>
                        <input id="sIntColorCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="txt_total">
        <p><spring:message code='sal.lbl.totNo' />:<span id="mainTot">0</span></p>     <!-- 건수:-->
    </div>
    <div class="table_grid">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>

    <div class="txt_total">
        <p><spring:message code='sal.lbl.totNo' />:<span id="subTot">0</span></p>     <!-- 건수:-->
    </div>
    <div class="table_grid">
        <div id="subGrid" ></div>
    </div>
</section>
</div>
<!-- //딜러주문조회 -->

<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd  = "${dlrCd}";    // 딜러코드
var dlrNm  = "${dlrNm}";    // 딜러
var userId = "${userId}";   // 사용자코드
var userNm = "${userNm}";   // 사용자
var toDay = "${toDay}";     // 현재일자
var oneDay = "${oneDay}";   // 해당월 1일
var lastDay = "${lastDay}"; // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후


//주문유형 SAL137
var ordTpList = [];
<c:forEach var="obj" items="${ordTpDS}">
    ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var ordTpListArr = dms.data.arrayToMap(ordTpList, function(obj){ return obj.cmmCd; });


//주문상태 SAL150
var ordStatCdList = [];
var ordStatCdObj = {};
<c:forEach var="obj" items="${ordStatCdDS}">
    <c:if test="${obj.cmmCd ne 'A' && obj.cmmCd ne 'B' && obj.cmmCd ne 'O' && obj.cmmCd ne 'R' && obj.cmmCd ne 'S'}">
        ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//주문상태 SAL135
var ordStatCdInfoList = [];
var ordStatCdInfoObj = {};
<c:forEach var="obj" items="${ordStatCdInfoDS}">
    ordStatCdInfoList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ordStatCdInfoObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/* 추후 상태값 선택 적용시 참조 */
/* <c:forEach var="obj" items="${ordTpInfo}">
<c:if test="${obj.cmmCd eq 'N1' || obj.cmmCd eq 'AD'}">
    ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach> */


//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//하치장:SAL152
var vinmVlocObj = {};
<c:forEach var="obj" items="${vinmVlocDS}">
    vinmVlocObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


var subParam = {};

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            // 주문유형
            if($("#sOrdTp").data("kendoExtDropDownList").value == ""){
                // {주문유형}를(을) 선택해주세요.
                dms.notification.info("<spring:message code='global.lbl.orderType' var='globalLblOrderType' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblOrderType}' />");
                return false;
            }

            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 주문유형
    $("#sOrdTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordTpList
       //,optionLabel:" "
    });

    // 주문상태
    $("#sOrdStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordStatCdList
       ,optionLabel:" "
    });

    // 주문상태-그리드
    $("#ordStatCdInfoCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordStatCdInfoList
       ,optionLabel:" "
    });

    // 시작일
    $("#sOrdStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:oneDay
   });

    // 종료일
    $("#sOrdEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:lastDay
    });

    //조회 년월
    $("#sYyMm").kendoExtMaskedDatePicker({
        value:toDay.substring(0, 8)
       ,start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#sOrdTp").data("kendoExtDropDownList").value("N1");

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "
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
       ,optionLabel:" "
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
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "
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

     $("#sRadioY").prop("checked", true);
    changedRadio(true);

    // 메인 그리드
    $("#mainGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/orc/dlrOrderSearch/selectDlrOrderSearchs.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //딜러코드
                        //params["sDlrCd"] = dlrCd;

                        //주문유형
                        params["sOrdTp"] = $("#sOrdTp").data("kendoExtDropDownList").value();

                        //주문상태
                        params["sOrdStatCd"] = $("#sOrdStatCd").data("kendoExtDropDownList").value();

                        // 주문일자
                        params["sOrdStartDt"] = $("#sOrdStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sOrdEndDt"] = $("#sOrdEndDt").data("kendoExtMaskedDatePicker").value();

                        // 심사평가월
                        params["sConfirmDt"] = $("#sYyMm").data("kendoExtMaskedDatePicker").value();

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
                         dlrCd :{type:"string", editable:false} // 딜러코드
                        ,ordNo:{type:"string"}            // 오더번호
                        ,ordYyMmDt:{type:"string"}        // 오더년월일자
                        ,week:{type:"string"}             // 오더주차
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
                        ,ordQty:{type:"number"}           // 주문요청수량
                        ,nOrdQty:{type:"number"}          // 미배정수량
                        ,pdiQty:{type:"number"}           // PDI수량
                        ,vinQty:{type:"number"}           // VIN배정수량
                        ,dlrSaleQty:{type:"number"}       // 법인출고수량
                        ,srchTotCnt:{type:"number"}       // 조회건수
                    }
                }
            }
        ,aggregate:[
                      { field:"ordQty", aggregate:"sum" }
                     ,{ field:"nOrdQty", aggregate:"sum" }
                     ,{ field:"pdiQty", aggregate:"sum" }
                     ,{ field:"vinQty", aggregate:"sum" }
                     ,{ field:"dlrSaleQty", aggregate:"sum" }
           ]
        }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();
            //console.log("total:", e.sender.pager.dataSource._total);
            $("#mainTot").text(addcomma(Number(e.sender.pager.dataSource._total)));
        }
       ,height:217
       ,editable:false
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       //,autoBind:false
       ,navigatable:true
       ,selectable:"row"
       //,pageable:false
       ,columns:[
          {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}       // 딜러코드
          ,{field:"ordNo", hidden:true}       // 오더번호
          ,{field:"ordYyMmDt", hidden:true}   // 오더번호
          ,{field:"week", hidden:true}        // 오더주차
          ,{field:"carlineCd",  hidden:true}    // 차종
          ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",   width:180,  attributes:{"class":"al"}}    // 차종명
          ,{field:"modelCd",    hidden:true}    // 모델
          ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",     width:230,  attributes:{"class":"al"}}     // 모델명
          ,{field:"ocnCd",      hidden:true}    // OCN
          ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",       width:250,  attributes:{"class":"al"}}    // OCN명
          ,{field:"extColorCd", hidden:true}    // 외장색
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",  width:200,  attributes:{"class":"al"}}    // 외장색명
          ,{field:"intColorCd", hidden:true}    // 내장색
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />", width:200,  attributes:{"class":"al"}}    // 내장색명
          ,{field:"ordQty",     title:"<spring:message code='global.lbl.reqQty' />",     width:100, attributes:{"class":"ar"},format:"{0:n0}",footerTemplate:"#=kendo.toString(sum,'n0')#",footerAttributes:{style:"text-align:right;"}}//요청수량
          ,{field:"nOrdQty",    title:"<spring:message code='global.lbl.nOrdQty' />",    width:100, attributes:{"class":"ar"},format:"{0:n0}",footerTemplate:"#=kendo.toString(sum,'n0')#",footerAttributes:{style:"text-align:right;"}}//미배정수량
          ,{field:"pdiQty",     title:"<spring:message code='global.lbl.pdiQty' />",     width:100, attributes:{"class":"ar"},format:"{0:n0}",footerTemplate:"#=kendo.toString(sum,'n0')#",footerAttributes:{style:"text-align:right;"}}//PDI수량
          ,{field:"vinQty",     title:"<spring:message code='global.lbl.vinQty' />",     width:120, attributes:{"class":"ar"},format:"{0:n0}",footerTemplate:"#=kendo.toString(sum,'n0')#",footerAttributes:{style:"text-align:right;"}}//VIN배정수량
          ,{field:"dlrSaleQty", title:"<spring:message code='global.lbl.dlrSaleQty' />", width:110, attributes:{"class":"ar"},format:"{0:n0}",footerTemplate:"#=kendo.toString(sum,'n0')#",footerAttributes:{style:"text-align:right;"}}//법인출고수량
       ]
   });

   // 그리드 더블클릭
   $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#mainGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       $("#subGrid").data('kendoExtGrid').dataSource.data([]);

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
       dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/orc/dlrOrderSearch/selectDlrOrderSearchSubs.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {
                       var params = {};
                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;

                       params["sort"] = options.sort;

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
                       ,ordStatCd:{type:"string"}               //오더상태명
                       ,ordDate:{type:"string"}                 //주문등록일자
                       ,chrgCd:{type:"string"}                  //주문자
                       ,ordSeq:{type:"string"}                  //주문번호
                       ,vinmVloc:{type:"string"}                //하치장명
                       ,vinNo:{type:"string"}                   //VIN_NO
                       ,carlineCd:{type:"string"}               //차종코드
                       ,carlineNm:{type:"string"}               //차종명
                       ,modelCd:{type:"string"}                 //차관코드
                       ,modelNm:{type:"string"}                 //차관명
                       ,ocnCd:{type:"string"}                   //ocn코드
                       ,ocnNm:{type:"string"}                   //ocn명
                       ,extColorCd:{type:"string"}              //외색코드
                       ,extColorNm:{type:"string"}              //외색명
                       ,intColorCd:{type:"string"}              //내색코드
                       ,intColorNm:{type:"string"}              //내색명
                       ,pdiDt:{type:"string"}                   //PDI배정일(오더배정일)
                       ,ordTp:{type:"string"}                   //주문유형
                       ,scndConfirmDt:{type:"string"}           //2차확정일
                       ,retailDt:{type:"string"}               //출고일자
                   }
               }
           }
       }
       ,dataBound:function(e) {
           var rows = e.sender.tbody.children();
           //console.log("total:", e.sender.pager.dataSource._total);
           if(e.sender.pager != null){
               $("#subTot").text(addcomma(Number(e.sender.pager.dataSource._total)));
           }
       }
      ,height:300
      ,editable:false
      ,resizable :true
      ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
      ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
      ,appendEmptyColumn:false           //빈컬럼 적용. default:false
      ,enableTooltip:true               //Tooltip 적용, default:false
      ,autoBind:false
      ,navigatable:true
      ,selectable:"row"
      //,pageable:false
      ,columns:[
         {field:"totCnt", hidden:true, format:"{0:n0}"}       // 전체 갯수
         ,{field:"ordSeq",     title:"<spring:message code='global.lbl.ordNo' />",        width:80, attributes:{"class":"ac"}}      // 주문번호
         ,{field:"ordStatCd",  title:"<spring:message code='global.lbl.ordStat' />",      width:80, attributes:{"class":"ac"}, template:"#=dms.string.strNvl(ordStatCdObj[ordStatCd])#"}   // 주문상태
         ,{field:"ordDate",    title:"<spring:message code='global.lbl.chrgDt' />",       width:80, attributes:{"class":"ac"}}       // 주문일자
         ,{field:"chrgCd",     title:"<spring:message code='global.lbl.chrgCd' />",       width:80, attributes:{"class":"ac"} }        // 주문자
         ,{field:"vinmVloc",   title:"<spring:message code='sal.lbl.plant' />",           width:120, attributes:{"class":"ac"}, template:"#=dms.string.strNvl(vinmVlocObj[vinmVloc])#"}      // 공장
         ,{field:"vinNo",      title:"<spring:message code='global.lbl.vinNo' />",        width:190, attributes:{"class":"ac"}}        // VIN
         ,{field:"carlineCd",  hidden:true}    // 차종
         ,{field:"carlineNm",  title:"<spring:message code='global.lbl.carlineNm' />",    width:110, attributes:{"class":"al"}}    // 차종명
         ,{field:"modelCd",    hidden:true}    // 모델
         ,{field:"modelNm",    title:"<spring:message code='global.lbl.modelNm' />",      width:120, attributes:{"class":"al"}}    // 차관명
         ,{field:"ocnCd",      hidden:true}    // OCN
         ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocnNm' />",        width:130, attributes:{"class":"al"}}    // OCN
         ,{field:"extColorCd", hidden:true}    // 외장색
         ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />",   width:110, attributes:{"class":"al"}}    // 외장색명
         ,{field:"intColorCd", hidden:true}    // 내장색
         ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColorNm' />",   width:110, attributes:{"class":"al"}}    // 내장색명
         ,{field:"ordTp",      title:"<spring:message code='global.lbl.orderType' />",    width:130, attributes:{"class":"al"}}    // 오더유형
         ,{field:"pdiDt",      title:"<spring:message code='sal.lbl.evalConfDt' />",      width:110, attributes:{"class":"ac"}}    // 심사평가일자
         ,{field:"pdiDt",      title:"<spring:message code='sal.lbl.ordSetDt' />",        width:110, attributes:{"class":"ac"}}    // 오더배정일
         ,{field:"retailDt",   title:"<spring:message code='global.lbl.giDocRegDt' />",   width:110, attributes:{"class":"ac"}}      // 출고일자
      ]
  });

});

// radio 버튼 처리
 function changedRadio(flg){
    if(flg){
        $("#sYyMm").data("kendoExtMaskedDatePicker").enable(false);
        $("#sOrdStartDt").data("kendoExtMaskedDatePicker").enable(true);
        $("#sOrdEndDt").data("kendoExtMaskedDatePicker").enable(true);

        $("#sYyMm").data("kendoExtMaskedDatePicker").value('');

        $("#sOrdStartDt").data("kendoExtMaskedDatePicker").value(oneDay);
        $("#sOrdEndDt").data("kendoExtMaskedDatePicker").value(lastDay);



    }else{
        $("#sYyMm").data("kendoExtMaskedDatePicker").enable(true);
        $("#sOrdStartDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#sOrdEndDt").data("kendoExtMaskedDatePicker").enable(false);

        $("#sOrdStartDt").data("kendoExtMaskedDatePicker").value('');
        $("#sOrdEndDt").data("kendoExtMaskedDatePicker").value('');

        $("#sYyMm").data("kendoExtMaskedDatePicker").value(oneDay);

    }
}


//문자를 받아서 3자리마다 콤마를 찍어 반환한다.
function addcomma(arg) {
    var v = arg.toString();

    tmp=v.split('.');
    var str=new Array();
    var v=tmp[0].replace(/,/gi,''); //콤마를 빈문자열로 대체

    for(var i=0;i<=v.length;i++){ //문자열만큼 루프를 돈다.

        str[str.length]=v.charAt(v.length-i); //스트링에 거꾸로 담음

        if(i%3==0&&i!=0&&i!=v.length){ //첫부분이나, 끝부분에는 콤마가 안들어감
            str[str.length]='.'; //세자리마다 점을 찍음 - 배열을 핸들링할때 쉼표가 들어가면 헛갈리므로
        }
    }

    str=str.reverse().join('').replace(/\./gi,','); //배열을 거꾸로된 스트링으로 바꾼후에, 점을 콤마로 치환

    if(str.substring(0,1) == "-" && str.substring(1,2) == ","){
        str = "-" + str.substring(2);
    }

    //return (tmp.length==2 && parseInt(tmp[1]) > 0)?str+'.'+tmp[1]:str;
    return str;
}

//콤마 빼기
function deletecomma(str)
{
    if((str.toString()).indexOf(",") < 0) return str;
    if (str == '') str = "0";
    return str.replace(/(.:)*[,]/gi,"");
}

</script>