<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.onLineDlrTransfReq" /></h1><!-- 전상운송신청 -->
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button class="btn_m" id="btnRequest"><spring:message code="sal.btn.commReqBtn" /></button><!-- 제보 -->
            <button class="btn_m btn_new" id="btnNewAdd"><spring:message code="global.btn.new" /></button><!-- 신규 -->
            <button class="btn_m btn_delete" id="btnDelete"><spring:message code="global.btn.del" /></button><!-- 삭제 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:7%;">
                <col style="width:18%;">
                <col style="width:7%;">
                <col style="width:18%;">
                <col style="width:7%;">
                <col style="width:18%;">
                <col style="width:7%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.evalRslt' /></th><!-- 심사상태 -->
                    <td>
                        <input id="sEvalRsltCd" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.getCompNm' /></th><!-- 수령회사명칭 -->
                    <td>
                        <input id="sRecivComNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.reqDt' /></th><!-- 신청일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" type="text" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" type="text" class="form_datepicker">
                            </div>
                        </div>
                    </td>
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

<script>

var toDay = "${toDay}";
var sevenDayBf = "${sevenDayBf}";

var carModelList = [];
var carModelObj = {};

var carOcnList = [];
var carOcnObj = {};

var extColorList = [];
var extColorObj = {};

var intColorList = [];
var intColorObj = {};

//운송가능지
var ondRcvDlrList = [];
var ondRcvDlrObj = {};
<c:forEach var="obj" items="${ondRcvDlrCdInfo}">
    ondRcvDlrList.push({
        shipToRecv : "${obj.shipToRecv}",
        shipToDlrCd : "${obj.shipToDlrCd}",
        shipToDlrNm : "${obj.shipToDlrNm}",
        shipToAddr : "${obj.shipToAddr}",
        shipToProv : "${obj.shipToProv}",
        shipToCity : "${obj.shipToCity}",
        shipToProvCd : "${obj.shipToProvCd}",
        shipToCityCd : "${obj.shipToCityCd}",
        shipToRecvTel : "${obj.shipToRecvTel}"
    });
    ondRcvDlrObj["${obj.shipToDlrCd}"] = "${obj.shipToDlrNm}";
</c:forEach>

//전상운송차종
var ondCarLineList = [];
var ondCarLineCdObj = {};
var ondCarLineNmObj = {};
<c:forEach var="obj" items="${ondCarLineCdInfo}">
    ondCarLineList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    ondCarLineCdObj["${obj.carlineCd}"] = "${obj.carlineCd}";
    ondCarLineNmObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//전상운송심사상태
var reqStatList = [];
<c:forEach var="obj" items="${reqStatCdInfo}">
    reqStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var reqStatObj = dms.data.arrayToMap(reqStatList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    // 전상운송심사상태
    $("#sEvalRsltCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:reqStatList
    });

    //조회조건 - 신청일자시작일
    var sStartDtPicker = $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:sevenDayBf
    }).data("kendoDatePicker");

    //조회조건 - 신청일자종료일
    var sEndDtPicker = $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    }).data("kendoDatePicker");

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0304-135500"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/ond/onLineDlrTransfReq/selectOnLineDlrTransfReq.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sReptToRecv"] = $("#sRecivComNm").val();
                        params["sReqStartDt"] = $("#sStartDt").data('kendoExtMaskedDatePicker').value();
                        params["sReqEndDt"] = $("#sEndDt").data('kendoExtMaskedDatePicker').value();

                        params["sEvalRsltCd"] = $("#sEvalRsltCd").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"reqNo"
                    ,fields:{
                        viewReqNo:{type:"string", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,usrId:{type:"string", editable:false}
                        ,reqNo:{type:"string", editable:false}
                        ,reqDt:{type:"string", editable:false}
                        ,regDt:{type:"date", editable:false}
                        ,selfYn:{type:"string", editable:true}
                        ,carlineCd:{type:"string", editable:true}
                        ,carlineNm:{type:"string", editable:true}
                        ,modelCd:{type:"string", editable:true}
                        ,modelNm:{type:"string", editable:true}
                        ,ocnCd:{type:"string", editable:true}
                        ,ocnNm:{type:"string", editable:true}
                        ,extColorCd:{type:"string", editable:true}
                        ,extColorNm:{type:"string", editable:true}
                        ,intColorCd:{type:"string", editable:true}
                        ,useYn:{type:"string", editable:true}
                        ,selfYn:{type:"string", editable:true}
                        ,reptToDlrCd:{type:"string", editable:true}
                        ,reptToAddr:{type:"string", editable:true}
                        ,reptToProv:{type:"string", editable:true}
                        ,reptToCity:{type:"string", editable:true}
                        ,reptToRecv:{type:"string", editable:true}
                        ,reptToIdno:{type:"string", editable:true}
                        ,reptToRecvTel:{type:"string", editable:true}
                        ,reqQty:{type:"number", editable:true}
                        ,evalRsltCd:{type:"string", editable:false}
                        ,evalDt:{type:"date", editable:false}
                        ,fscpRegGrade:{type:"string", editable:false}
                    }
                }
            }
        }
        //,autoBind:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        //,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,change:function(e){
            var that = this
            var rows = that.select();
            var dataItem = this.dataItem(rows);

            if (dms.string.isNotEmpty(dataItem) ) {

                if (dms.string.isNotEmpty(dataItem.evalRsltCd)) {
                    var evalRsltCd = kendo.toString(dataItem.evalRsltCd);

                    if(evalRsltCd == "R"){
                        $("#btnRequest").data("kendoButton").enable(true);
                        $("#btnDelete").data("kendoButton").enable(true);
                    }else{
                        $("#btnRequest").data("kendoButton").enable(true);
                        $("#btnDelete").data("kendoButton").enable(false);
                    }
                }
            }
        }
        ,edit:function(e){
            var eles = e.container.find("input");
            var fieldName;

            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }

            var input = e.container.find(".k-input");

            if(dms.string.isNotEmpty(e.model.viewReqNo)){
                if(e.model.evalRsltCd == "R"){
                    if(fieldName == "reptToAddr"){
                        this.closeCell();
                    }
                    if(fieldName == "reptToProv"){
                        this.closeCell();
                    }
                    if(fieldName == "reptToCity"){
                        this.closeCell();
                    }
                    if(fieldName == "reptToRecv"){
                        this.closeCell();
                    }
                    if(fieldName == "reptToRecvTel"){
                        this.closeCell();
                    }
                    if(fieldName == "carlineNm"){
                        this.closeCell();
                    }
                    if(fieldName == "ocnNm"){
                        this.closeCell();
                    }
                    if(fieldName == "extColorNm"){
                        this.closeCell();
                    }
                }else{
                    if(fieldName == "selfYn"){
                        this.closeCell();
                    }
                    if(fieldName == "shipToRecv"){
                        this.closeCell();
                    }
                    if(fieldName == "reptToAddr"){
                        this.closeCell();
                    }
                    if(fieldName == "reptToProv"){
                        this.closeCell();
                    }
                    if(fieldName == "reptToCity"){
                        this.closeCell();
                    }
                    if(fieldName == "reptToRecv"){
                        this.closeCell();
                    }
                    if(fieldName == "reptToRecvTel"){
                        this.closeCell();
                    }
                    if(fieldName == "carlineCd"){
                        this.closeCell();
                    }
                    if(fieldName == "carlineNm"){
                        this.closeCell();
                    }
                    if(fieldName == "modelNm"){
                        this.closeCell();
                    }
                    if(fieldName == "ocnCd"){
                        this.closeCell();
                    }
                    if(fieldName == "ocnNm"){
                        this.closeCell();
                    }
                    if(fieldName == "extColorCd"){
                        this.closeCell();
                    }
                    if(fieldName == "extColorNm"){
                        this.closeCell();
                    }
                    if(fieldName == "intColorCd"){
                        this.closeCell();
                    }
                    if(fieldName == "reqQty"){
                        this.closeCell();
                    }
                }
            }

            if(dms.string.isEmpty(e.model.viewReqNo)){
                if(fieldName == "reptToAddr"){
                    this.closeCell();
                }
                if(fieldName == "reptToProv"){
                    this.closeCell();
                }
                if(fieldName == "reptToCity"){
                    this.closeCell();
                }
                if(fieldName == "reptToRecv"){
                    this.closeCell();
                }
                if(fieldName == "reptToRecvTel"){
                    this.closeCell();
                }
                if(fieldName == "carlineNm"){
                    this.closeCell();
                }
                if(fieldName == "ocnNm"){
                    this.closeCell();
                }
                if(fieldName == "extColorNm"){
                    this.closeCell();
                }
            }
        }
        ,columns:[
                  {field:"viewReqNo", title:"<spring:message code='global.lbl.applNumber' />", width:100, attributes:{"class":"ac"}} //신청번호
                 ,{field:"selfYn", title:"<spring:message code='sal.lbl.selfGetYn' />", width:75
                     ,attributes:{"class":"ac"}
                     ,editor:function(container, options) {
                         $('<input required name="selfYn" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             autoBind:true
                             ,dataSource:['Y','N']
                             ,index:0
                         });
                         $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                     }
                 }//자체수령여부
                 ,{field:"reptToIdno"
                     ,title:"<spring:message code='sal.lbl.getCompNm' />"
                     ,width:320
                     ,attributes:{"class":"al"}
                     ,editor:function (container, options){
                         $('<input required name="shipToRecv" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtDropDownList({
                               valuePrimitive:true
                             , dataTextField: "shipToDlrNm"
                             , dataValueField:"shipToDlrNm"
                             , optionLabel:" "  // 선택
                             , dataSource:ondRcvDlrList
                             , select:function(e){
                                 var dataItem = this.dataItem(e.item);
                                 var grid = $("#grid").data("kendoExtGrid");
                                 var selectRow = grid.dataItem(grid.select());
                                 selectRow.set("reptToDlrCd", dataItem.shipToDlrCd);
                                 selectRow.set("reptToAddr", dataItem.shipToAddr);
                                 selectRow.set("reptToRecv", dataItem.shipToRecv);
                                 selectRow.set("reptToRecvTel", dataItem.shipToRecvTel);
                                 selectRow.set("reptToProv", dataItem.shipToProv);
                                 selectRow.set("reptToCity", dataItem.shipToCity);
                                 selectRow.set("reptToProvCd", dataItem.shipToProvCd);
                                 selectRow.set("reptToCityCd", dataItem.shipToCityCd);
                             }
                         });
                         $('<span class="k-invalid-msg" data-for="reptToAddr"></span>').appendTo(container);
                     }
                   }//수령회사명칭
                 ,{field:"reptToProvCd", hidden:true}
                 ,{field:"reptToDlrCd", hidden:true}//딜러코드
                 ,{field:"reqDt", hidden:true}
                 ,{field:"reptToAddr", title:"<spring:message code='sal.lbl.reqDlvAddr' />", width:350, attributes:{"class":"al"}}//접수주소
                 ,{field:"reptToProv", title:"<spring:message code='global.lbl.sung' />", width:60, attributes:{"class":"al"}}//수령성
                 ,{field:"reptToProvCd", hidden:true}//수령성
                 ,{field:"reptToCity", title:"<spring:message code='sal.lbl.cityCd' />", width:60, attributes:{"class":"al"}}//수령시
                 ,{field:"reptToCityCd", hidden:true}//수령시
                 ,{field:"reptToRecv", title:"<spring:message code='sal.lbl.getPrsnNm' />", width:100, attributes:{"class":"al"}}//수령인 ???? cm0101에서 찾아야함
                 ,{field:"reptToRecvTel", title:"<spring:message code='sal.lbl.getPrsnTelNo' />", width:100, attributes:{"class":"al"}}//수령인전화번호
                 ,{field:"carlineCd"
                     ,title:"<spring:message code='global.lbl.carlineCd' />"
                     ,width:90
                     ,attributes:{"class":"al"}
                     ,editor:function (container, options){
                         $('<input required name="carlineCd" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtDropDownList({
                               valuePrimitive:true
                             , dataTextField: "carlineCd"
                             , dataValueField:"carlineCd"
                             , optionLabel:" "  // 선택
                             , dataSource:ondCarLineList
                             , select:function(e){
                                 var dataItem = this.dataItem(e.item);
                                 var grid = $("#grid").data("kendoExtGrid");
                                 var selectRow = grid.dataItem(grid.select());
                                 selectRow.set("carlineNm", dataItem.carlineNm);
                                 selectRow.set("modelCd", '');
                                 selectRow.set("modelNm", '');
                                 selectRow.set("ocnCd", '');
                                 selectRow.set("ocnNm", '');
                                 selectRow.set("fscpRegGrade", '');
                                 selectRow.set("extColorCd", '');
                                 selectRow.set("extColorNm", '');
                                 selectRow.set("intColorCd", '');
                             }
                         });
                         $('<span class="k-invalid-msg" data-for="carlineCd"></span>').appendTo(container);
                     }
                   } // 차종
                 ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:100,attributes:{"class":"al"}} //차종명
                 ,{field:"modelNm"
                    ,title:"<spring:message code='global.lbl.model' />"
                    ,width:140
                    ,attributes:{"class":"al"}
                    ,editor:function (container, options){
                        if(dms.string.strNvl(options.model.carlineCd) == ""){return false;}

                        var responseJson = dms.ajax.getJson({
                            url:"<c:url value='/sal/ond/onLineDlrTransfReq/selectOndModel.do' />"
                                ,data:JSON.stringify({"sCarlineCd":options.model.carlineCd})
                            ,async:false
                        });
                        carModelList = responseJson.data;

                        carModelObj = {};
                        $.each(carModelList, function(idx, obj){
                            carModelObj[obj.modelCd] = obj.modelNm;
                        });

                        $('<input required name="modelNm" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            autoBind:false
                            , valuePrimitive:true
                            , dataTextField :"modelNm"
                            , dataValueField:"modelNm"
                            , dataSource:carModelList
                            ,select:function(e){
                                var dataItem = this.dataItem(e.item);
                                var grid = $("#grid").data("kendoExtGrid");
                                var selectRow = grid.dataItem(grid.select());
                                selectRow.set("modelCd", dataItem.modelCd);
                                selectRow.set("ocnCd", '');
                                selectRow.set("ocnNm", '');
                                selectRow.set("fscpRegGrade", '');
                                selectRow.set("extColorCd", '');
                                selectRow.set("extColorNm", '');
                                selectRow.set("intColorCd", '');
                            }
                        });
                        $('<span class="k-invalid-msg" data-for="modelNm"></span>').appendTo(container);

                        carModelList = [];
                        carModelObj = {};
                    }
                  }//차관
                 ,{field:"modelCd", hidden:true} //모델코드
                 ,{field:"ocnCd"
                     ,title:"<spring:message code='global.lbl.ocnCode' />"
                     ,width:100
                     ,attributes:{"class":"al"}
                     ,editor:function (container, options){
                         if(dms.string.strNvl(options.model.modelCd) == ""){return false;}
                         var responseJson = dms.ajax.getJson({
                             url:"<c:url value='/sal/ond/onLineDlrTransfReq/selectOndOcn.do' />"
                                 ,data:JSON.stringify({"sCarlineCd":options.model.carlineCd, "sModelCd":options.model.modelCd})
                                 ,async:false
                         });
                         carOcnList = responseJson.data;

                         carOcnObj = {};
                         $.each(carOcnList, function(idx, obj){
                             carOcnObj[obj.ocnCd] = obj.ocnNm;
                         });

                         $('<input required name="ocnCd" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             autoBind:false
                             , valuePrimitive:true
                             , dataTextField :"ocnCd"
                             , dataValueField:"ocnCd"
                             , dataSource:carOcnList
                             ,select:function(e){
                                 var dataItem = this.dataItem(e.item);
                                 var grid = $("#grid").data("kendoExtGrid");
                                 var selectRow = grid.dataItem(grid.select());

                                 selectRow.set("ocnNm", dataItem.ocnNm);
                                 selectRow.set("extColorCd", '');
                                 selectRow.set("extColorNm", '');
                                 selectRow.set("intColorCd", '');

                                 if(dms.string.strNvl(options.model.ocnCd) == ""){return false;}
                                 var responseJson = dms.ajax.getJson({
                                     url:"<c:url value='/sal/ond/onLineDlrTransfReq/selectFscpRegGrade.do' />"
                                         ,data:JSON.stringify({"sModelCd":options.model.modelCd, "sOcnCd":options.model.ocnCd})
                                         ,async:false
                                 });

                                 if(responseJson != null && responseJson.total == 1){
                                     selectRow.set("fscpRegGrade", responseJson.data[0].fscpRegGrade);
                                 }
                             }
                         });
                         $('<span class="k-invalid-msg" data-for="ocnCd"></span>').appendTo(container);

                         carOcnList = [];
                         carOcnObj = {};
                     }
                   }//ocn
                 ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocnNm' />", width:120, attributes:{"class":"al"}} //OCNdescription
                 ,{field:"fscpRegGrade", title:"<spring:message code='sal.lbl.fscpRegGrade' />", width:80,attributes:{"class":"al"}} //배기표준
                 ,{field:"extColorCd"
                     ,title:"<spring:message code='global.lbl.extColorCd' />"
                     ,width:100
                     ,attributes:{"class":"al"}
                     ,editor:function (container, options){
                         if(dms.string.strNvl(options.model.ocnCd) == ""){return false;}
                         var responseJson = dms.ajax.getJson({
                             url:"<c:url value='/sal/ond/onLineDlrTransfReq/selectOndExtColor.do' />"
                                 ,data:JSON.stringify({"sCarlineCd":options.model.carlineCd, "sModelCd":options.model.modelCd, "sOcnCd":options.model.ocnCd})
                                 ,async:false
                         });
                         extColorList = responseJson.data;
                         extColorObj = {};

                         $.each(extColorList, function(idx, obj){
                             extColorObj[obj.extColorCd] = obj.extColorNm;
                         });

                         $('<input required name="extColorCd" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             autoBind:false
                             , valuePrimitive:true
                             , dataTextField :"extColorCd"
                             , dataValueField:"extColorCd"
                             , dataSource:extColorList
                             ,select:function(e){
                                 var dataItem = this.dataItem(e.item);
                                 var grid = $("#grid").data("kendoExtGrid");
                                 var selectRow = grid.dataItem(grid.select());
                                 selectRow.set("extColorNm", dataItem.extColorNm);
                                 selectRow.set("intColorCd", '');
                             }
                         });
                         $('<span class="k-invalid-msg" data-for="extColorCd"></span>').appendTo(container);

                         extColorList = [];
                         extColorObj = {};
                     }
                   }//외장색코드
                 ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />", width:120, attributes:{"class":"al"}} //외장색코드명
                 ,{field:"intColorCd"
                     ,title:"<spring:message code='global.lbl.intColorCd' />"
                     ,width:100
                     ,attributes:{"class":"al"}
                     ,editor:function (container, options){
                         if(dms.string.strNvl(options.model.ocnCd) == ""){return false;}
                         var responseJson = dms.ajax.getJson({
                             url:"<c:url value='/sal/ond/onLineDlrTransfReq/selectOndIntColor.do' />"
                                 ,data:JSON.stringify({"sCarlineCd":options.model.carlineCd, "sModelCd":options.model.modelCd, "sOcnCd":options.model.ocnCd})
                                 ,async:false
                         });
                         intColorList = responseJson.data;
                         intColorObj = {};

                         $.each(intColorList, function(idx, obj){
                             intColorObj[obj.intColorCd] = obj.intColorNm;
                         });

                         $('<input required name="intColorCd" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             autoBind:false
                             , valuePrimitive:true
                             , dataTextField :"intColorCd"
                             , dataValueField:"intColorCd"
                             , dataSource:intColorList
                         });
                         $('<span class="k-invalid-msg" data-for="intColorCd"></span>').appendTo(container);

                         intColorList = [];
                         intColorObj = {};
                     }
                   }//내장색코드
                 ,{field:"reqQty", title:"<spring:message code='global.lbl.applyQty' />",width:80,attributes:{"class":"ac"}, format:"{0:n0}", decimal:0} //신청수량
                 ,{field:"regDt", title:"<spring:message code='sal.lbl.reqDt' />", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //신청일자
                 ,{field:"evalRsltCd", title:"<spring:message code='global.lbl.evalRslt' />", width:80, attributes:{"class":"ac"},template:"# if(reqStatObj[evalRsltCd] != null) { # #= reqStatObj[evalRsltCd].cmmCdNm# # }#"}//상태
                 ,{field:"evalDt", title:"<spring:message code='sal.lbl.confirmDt' />", width:100, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //심사일자
         ]
    });

    //추가버튼
    $("#btnNewAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "reqNo":""
                ,"selfYn":"N"
                ,"dlrNm":""
                ,"reptToAddr":""
                ,"reptToProv":""
                ,"reptToCity":""
                ,"reptToRecv":""
                ,"reptToRecvTel":""
                ,"carlineCd":""
                ,"carlineNm":""
                ,"modelCd":""
                ,"modelNm":""
                ,"ocnCd":""
                ,"ocnNm":""
                ,"fscpRegGrade":""
                ,"extColorCd":""
                ,"extColorNm":""
                ,"intColorCd":""
                ,"reqQty":0
                ,"reqDt":""
                ,"evalRsltCd":""
                ,"evalDt":""
            });
        }
    });

    //제보
    $("#btnRequest").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            // 그리드 무결성 점검
            var qtyValidation = true;
            $.each(saveData.insertList, function(idx, row){
                if(row.reqQty < 1){
                    qtyValidation = false;
                    return;
                }
             });

            if (grid.gridValidation()) {
                if(qtyValidation==true){
                    $.ajax({
                        url:"<c:url value='/sal/ond/onLineDlrTransfReq/saveOnLineDlrTransfReq.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {

                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,success:function(jqXHR, textStatus) {

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //수량이 0보다 작거나 같을 수 없습니다.
                    dms.notification.warning("<spring:message code='global.err.chkZeroQty'/>");
                }
            }else{
                //입력값을 확인하여 주십시오.
                if(!grid.gridValidation()&&qtyValidation==false){
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        }
    });

    //버튼
    $("#btnDelete").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    $("#btnRequest").data("kendoButton").enable(true);
    $("#btnDelete").data("kendoButton").enable(true);
});
</script>