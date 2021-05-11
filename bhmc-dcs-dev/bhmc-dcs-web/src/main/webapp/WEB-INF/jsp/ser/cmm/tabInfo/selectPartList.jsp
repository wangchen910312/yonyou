<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 부품 -->
<div style="height:205px;">
    <c:if test="${preFixId ne 'CA'}">
    <div class="btn_right_absolute">
        <button type="button" id="parPkgAdd" class="btn_s btn_pkgAdd btn_s_min5"><spring:message code="ser.btn.pakage" /></button>
        <%-- <c:choose>
            <c:when test="${preFixId eq 'ET'}">
                <button type="button" id="parPkgAdd" class="btn_s btn_pkgAdd btn_s_min5"><spring:message code="ser.btn.pakage" /></button>
            </c:when>
            <c:otherwise>
                <button type="button" id="parPkgAdd" class="btn_s btn_pkgAdd btn_s_min5"><spring:message code="global.btn.pakage" /></button>
            </c:otherwise>
        </c:choose> --%>
        <button type="button" id="parAdd" class="btn_s btn_add btn_s_min5"><spring:message code="global.btn.add" /></button>
        <button type="button" id="parDel" class="btn_s btn_delete btn_s_min5"><spring:message code="global.btn.del" /></button>

    </div>
    </c:if>
    <div class="table_grid">
       <div id="partGrid" class="grid"></div>
    </div>
    <div class="pop_wrap msgDiv" style="display:none">
        <div class="msg_box" id="messageId"></div>
        <%-- <spring:message code='global.btn.init' var='init' /><spring:message code='global.info.cnfrmMsg' arguments='${init},' /> --%>
        <div class="btn_bottom">
            <button type="button" class="btn_m yes"><spring:message code='par.btn.confirm'/></button>
            <button type="button" class="btn_m no"><spring:message code='par.btn.cancel'/></button>
        </div>
    </div>

</div>
<!-- //부품 -->


<script type="text/javascript">


var partPreFixId;
var partDocNo;
var partGridId;
var popupWindow;
var insurancePopup;

var chkRsultYn = true;

var paymTp;
var paymCd;
var paymUsrNm;
var custNm;
var custNo;
var parDcRateMax = 100;     // 부품할인율
var parDcAmtMax = 100000;   // 부품할인금액
var parDcRateEditable = false;
var crTpYn = false;

var insCmpCd;   // 보험사코드
var insCmpNm;   // 보험사명

var selectShareStockGiItemPopupWindow;
var itemSalePrcPopupWindow;
var workPackagePopup;
var selectIssueWorkPackagePopup;
var preFixId = "${preFixId}";
var preFixTp = "${preFixTp}";
if(preFixId == "RE") {
    partGridId = "G-SER-1011-000059";
} else if(preFixId == "RO") {
    partGridId = "G-SER-1011-000060";
} else if(preFixId == "PRE") {
    partGridId = "G-SER-1011-000061";
} else if(preFixId == "CA") {
    partGridId = "G-SER-1011-000062";
} else if(preFixId == "ET") {
    if(preFixTp == "PAE"){
        partGridId = "G-SER-1213-000011";
    } else {
        partGridId = "G-SER-1011-000063";
    }
} else if(preFixId == "PRC") {
    partGridId = "G-SER-1011-000064";
} else if(preFixId == "RES") {
    partGridId = "G-SER-1011-000065";
} else if(preFixId == "ROHISTDMS") {
    lbrGridId = "G-SER-1011-000066";
} else if(preFixId == "ROHISTDCS") {
    lbrGridId = "G-SER-1011-000067";
} else if(preFixId == "SERHIST") {
    lbrGridId = "G-SER-1011-000068";
} else if(preFixId == "RO" && preFixTp == "ROSTATUS") {
    partGridId = "G-SER-1011-000069";
} else if(preFixId == "PRC" && preFixTp == "PRCSTATUS") {
    partGridId = "G-SER-1011-000070";
} else if(preFixId == "PRC" && preFixTp == "PAE") {
    partGridId = "G-SER-1011-000071";
}

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd;});

//공통코드:결제유형
/* var paymTpCdList = [];
<c:forEach var="obj" items="${paymTpCdList}">
paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
 */
//공통코드:결제유형 01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러
var paymTpCdList  = []; //전부
var paymTpCdList1 = []; //보증
var paymTpCdList2 = []; //보험
var paymTpCdList3 = []; //기타고객 , 고객
var paymTpCdList4 = []; //딜러
var paymTpCdList5 = []; //보증(K-Type)

<c:forEach var="obj" items="${paymTpCdList}">
<c:if test='${obj.useYn eq "Y"}' >
    <c:if test='${(obj.remark1 eq "01")}'> //보증
        paymTpCdList1.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${obj.remark1 eq "02" or obj.remark1 eq "03"}'>//보험
        paymTpCdList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${obj.remark1 eq "03"}'>//고객
        paymTpCdList3.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${obj.remark1 eq "04" or obj.remark1 eq "03"}'>//딜러
        paymTpCdList4.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test='${(obj.remark1 eq "01") or (obj.remark1 eq "03")}'> //보증(K-Type)
        paymTpCdList5.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    paymTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
var paymTpCdArr = dms.data.arrayToMap(paymTpCdList, function(obj){return obj.cmmCd;});

//공통코드:부품수령상태
var partRcvCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${partRcvCdList}">
    <c:if test="${obj.useYn eq 'Y'}">
    partRcvCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var partRcvCdMap = dms.data.arrayToMap(partRcvCdList, function(obj){return obj.cmmCd;});

//공통코드:부품가격유형
var partPrcTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${partPrcTpList}">
    <c:if test="${obj.useYn eq 'Y'}">
    partPrcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
var partPrcTpMap = dms.data.arrayToMap(partPrcTpList, function(obj){return obj.cmmCd;});

// RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdArr[val] != undefined)
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

//결제유형
paymTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(paymTpCdArr[val] != undefined)
        returnVal = paymTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};
//부품수령상태
setPartRcvCd = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(partRcvCdMap[val] != undefined)
        returnVal = partRcvCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//부품가격유형
partPrcTpGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(partPrcTpMap[val] != undefined)
        returnVal = partPrcTpMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function(){
    var editYn = true;
    if(preFixTp == "ROSTATUS"){
        editYn = false;
    }

    var reHiddenColYn = (preFixId == "RE" || preFixId == "PRE" ) ? true : false;
    var preHiddenColYn = (preFixId == "RO") ? true : false;

    // 부품 그리드
    $("#partGrid").kendoExtGrid({
        gridId:partGridId
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cmm/tabInfo/selectServiceParts.do'/>"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        if(dms.string.isNotEmpty(sDlrCd)){
                            params["sDlrCd"] =  sDlrCd;
                        }
                        params["sPreFixId"] = partPreFixId;
                        params["sDocNo"] = partDocNo;
                        if(preFixId == "CA"){
                            params["sGiQtyExist"] = "Y";
                        }
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        itemReqStatCd:{type:"string", editable:false}
                        ,roTp:{type:"string", validation:{required:true}}
                        ,dlrCd:{type:"string"}
                        ,itemCd:{type:"string", editable:false}
                        ,itemNm:{type:"string", validation:{required:true}}
                        ,itemReqStatCd:{type:"string", validation:{required:true}}
                        ,parReadyStatCdNm:{type:"string" , editable:false}
                        ,itemPrc:{type:"number"}
                        ,itemSalePrc:{type:"number"}
                        ,crNo:{type:"string", editable:false}
                        ,crTp:{type:"string", editable:false}
                        ,crNm:{type:"string", editable:false}
                        ,paymTp:{type:"string"}
                        ,paymCd:{type:"string"}
                        ,paymUsrNm:{type:"string"}
                        ,pkgDocNo:{type:"number", editable:false}
                        ,pkgItemCd:{type:"string", editable:false}
                        ,itemSaleAmt:{type:"number"}
                        ,itemTotAmt:{type:"number"}
                        ,parResvStatNm:{type:"string", editable:false}
                        ,calcUnitCd:{type:"string", editable:false}
                        ,itemQty:{type:"number"}
                        ,comItemPrc:{type:"number"}
                        ,giQty:{type:"number"}
                        ,reqQty:{type:"number"}
                        ,partsPrcTp:{type:"string"}
                        ,movingAvgPrc:{type:"number"}
                        ,movingAvgAmt:{type:"number"}
                    }
                }
            }
        }
        ,height:180
        ,pageable:false
        ,autoBind:false
        ,resizable:false
        ,sortable:false
        ,filterable:false
        ,editable:editYn
        ,editable:{
            confirmation:false
        }
        ,selectable:"row"
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[1]).attr("name");
            var fieldName2 = $(e.container.find("input")[0]).attr("name");

            if(preFixTp == "ROSTATUS"){
                this.closeCell();
            }

            var grid = $("#partGrid").data("kendoExtGrid");//.dataSource._data;
            var selectedVal = grid.dataItem(grid.select());

            var roTp = "01";
            var editRateYn = false;
            var giQtyYn = false;
            if($("#roTp").val() != undefined){
                roTp = $("#roTp").val();      //RO 유형 코드
            }
            if(roTp == "02"){ //보증일경우
                if(dms.string.isNotEmpty(selectedVal.crNo) && selectedVal.crTp != "K"){
                    editRateYn = true;
                }else{
                    if(preFixId == "CA"){
                        editRateYn = (fieldName == "itemQty") ? true : false;
                    }
                }
            }else{
                if(preFixId == "CA"){
                    editRateYn = (fieldName == "itemQty" ) ? true : false;
                }
            }
            if(giQtyYn){
                this.closeCell();
            }

            if(editRateYn){
                if(fieldName2 != "comItemNm"){
                    this.closeCell();
                }
            }

            if(fieldName2 == "itemReqStatCd" || fieldName2 == "partsPrcTp"){
                this.closeCell();
            }

            // 부품예약상태가 완성이면 수량 변경 안되도록 수정
            if(preFixId == "RE" || preFixId == "PRE"){
                if(fieldName == "itemQty" && selectedVal.parResvStatCd != "01"){
                    this.closeCell();
                }
            } else{//RO일때
                if(fieldName == "itemQty" && selectedVal.itemReqStatCd == "02"){
                    this.closeCell();
                }
            }


            // 서비스정산관리화면에서 ro유형이 보증이고 결재유형이 고객이고 캠페인유형이 면비보양인경우 할인율, 할인금액 변경가능
            if(preFixId == "CA" && roTp == "02" && selectedVal.paymTp == "04" && crTpYn){
                parDcRateEditable = true;
            }
            if(!parDcRateEditable){
                if(fieldName == "dcRate" || fieldName == "dcAmt"){
                    this.closeCell();
                }
            }

            if(fieldName=="itemTotAmt" ||
                    fieldName == "reqQty"  ||
                    fieldName == "giQty"   ||
                    fieldName == "itemSaleAmt" ||
                    fieldName == "comItemPrc" ||
                    fieldName == "itemPrc"){
                this.closeCell();
            }

            if(fieldName2 == "paymCd" || fieldName2 == "paymUsrNm"){
                this.closeCell();
            }

            if(preFixId != "CA" && preFixId != "RO" && preFixId != "ET"  && preFixId != "PRC"){
                if(fieldName2 == "paymTp"){
                    this.closeCell();
                }
            }else{
                if(fieldName2 == "paymTp" && roTp == "02" && crTpYn == false){
                    this.closeCell();
                }
            }

            if((preFixId != "ET" || roTp == "02")&& preFixTp != "PAE"){
                if(fieldName == "itemSalePrc") {
                    this.closeCell();
                }
            }

            if(preFixId != "ET" || roTp == "02"){
                if(fieldName2 == "itemNm"){
                    this.closeCell();
                }
            }

        }
        ,dataBound:function(e){
            parDcRateEditable = false;  // 할인율, 할인금액 EDIT 할수 없게
            if(preFixId === "PRE"){ // 부품예약
                checkParReadyStat(); // 부품준비상태 확인
            }

            if(preFixId == "RO" && $("#roTp").val() == "05" && dms.string.isEmpty($("#roDocNo").val())){
                var partGridData = $("#partGrid").data("kendoExtGrid").dataSource._data;
                $.each(partGridData , function(i , part){
                    part.set("paymTp", "05");
                    part.set("paymCd", "${dlrCd}");
                    part.set("paymUsrNm", "${dlrNm}");
                    part.set("giQty", 0.00);
                });
            }
        }
        ,columns:[
             {field:"itemReqStatCd", title:"<spring:message code='par.lbl.parReqStatNm' />", width:80
                 ,attributes:{"class":"ac"}
                 ,template:"#=setPartRcvCd(itemReqStatCd)#"
                 ,hidden:!preHiddenColYn
             } // 부품요청상태
            ,{field:"parReadyStatCdNm", title:"<spring:message code='serl.lbl.parReadyStatCd' />", width:80
                 ,attributes:{"class":"ac"}
                 ,hidden:true
             } // 부품준비상태
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:200} // 부품번호
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:300
                ,editor:function(container, options) {
                    $('<input required type="text" name="itemNm" data-name="<spring:message code="par.lbl.itemNm" />" data-bind="value:' + options.field + '" maxLength="200" class="form_input"  />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="itemNm"></span>')
                    .appendTo(container);
                 }
             } // 부품명
            ,{field:"calcUnitCd", title:"<spring:message code='ser.lbl.calUnt' />", width:70}  // 계산단위
            ,{field:"itemQty", title:"<spring:message code='ser.lbl.itemQty' />", width:70, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="itemQty" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0.00
                        ,max:100
                        ,spinners:false
                        ,change:function(){
                            var itemQty = 0;
                            var rowData = partGrid.dataItem(this.element.closest("tr"));

                            setPartAmt(rowData,"Rate");

                        }
                    });
                }
            }// 부품수량
            ,{field:"itemSalePrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="itemSalePrc" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         min:0.00
                        ,max:100000000
                        ,spinners:false
                        ,change:function(){
                            var itemQty = 0;
                            var rowData = partGrid.dataItem(this.element.closest("tr"));

                            setPartAmt(rowData,"Amt");
                        }
                    });
                } , hidden:true
            }// 부품금액단가
            ,{field:"itemPrc", title:"itemPrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:90 , hidden:false
                ,format:"{0:n2}"
                ,attributes:{"class":"ar"}
            }//금액
            ,{field:"itemSaleAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}" }  // 부품금액
            ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:100 , attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input name="dcRate" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         min:0
                        ,max:parDcRateMax
                        ,spinners:false
                        ,change : function(){
                            var itemQty = 0;
                            var rowData = partGrid.dataItem(this.element.closest("tr"));
                            setPartAmt(rowData,"Rate");
                            parDcRateEditable = true;
                        }
                    });
                }
             } // 할인율
            ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="dcAmt" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0.00
                        ,max:parDcAmtMax
                        ,spinners:false
                        ,change:function(){
                            var itemQty = 0;
                            var rowData = partGrid.dataItem(this.element.closest("tr"));
                            setPartAmt(rowData,"Amt");
                            parDcRateEditable = true;
                        }
                    });
                }
            } // 할인금액
            ,{field:"itemTotAmt", title:"<spring:message code='ser.lbl.parAmt' />", width:90, attributes:{"class":"ar"}
                ,template:function(data){
                    changeTotalAmt();
                    var itemTotAmt = 0;
                    if(data.itemTotAmt != null){
                        itemTotAmt = data.itemTotAmt;
                    }
                    return dms.string.addThousandSeparatorCommas(Number(itemTotAmt).toFixed(2));
                }
            }  // 부품대
            ,{field:"parResvStatNm", title:"<spring:message code='serl.lbl.parReadyStatCd' />", width:100, attributes:{"class":"ac"}, hidden:!reHiddenColYn} // 부품준비상태
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=paymTpCdGrid(paymTp)#"
                ,editor:function(container, options){
                    $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymTpCdList
                        ,change:function(){
                            var grid = $("#partGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());

                            chagePayTp(grid, "par", "N");
                        }
                    });
                },hidden :reHiddenColYn
            }// 결제유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100
                ,editor:function(container, options) {
                    var grid = $("#partGrid").data("kendoExtGrid");
                    var selectedVal = grid.dataItem(grid.select());
                    var innerHtml = '';
                    if(selectedVal.paymTp == "02" || selectedVal.paymTp == "03"){
                        innerHtml += '<div class="form_search">';
                        innerHtml += '<input type="text" name="paymCd" class="form_input"  readonly="true"/>';
                        innerHtml += '<a href="#" onclick="insuPartPopup()" >&nbsp;</a></div>';
                    }else{
                        innerHtml += '<input type="text" name="paymCd" class="form_input" readonly="true" />';
                    }
                    $(innerHtml)
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="paymCd"></span>')
                    .appendTo(container);
                 },hidden :reHiddenColYn
            }// 지불자코드
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100 ,hidden :reHiddenColYn}       // 지불자
            ,{field:"comItemNm", title:"<spring:message code='ser.lbl.comItemNm' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="comItemNm" data-name="<spring:message code='ser.lbl.bayNo'/>" class="form_input" readonly="true" /><a href="#" onclick="comItemAdd()" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="comItemNm"></span>')
                    .appendTo(container);
                 },hidden :reHiddenColYn
            }      // 부품대체수령
            ,{field:"comItemPrc", title:"<spring:message code='ser.lbl.comItemPrc' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input id="comItemPrc" name="comItemPrc" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0
                        ,max:100000000
                        ,decimals:2
                        ,spinners:false
                    });
                },hidden :reHiddenColYn
            }    // 부품대체차액
            ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="phenCd" data-name="<spring:message code='ser.lbl.phenCd'/>" class="form_input" readonly="true" /><a href="#" onclick="phenCauAdd(2)" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="phenCd"></span>')
                    .appendTo(container);
                 },hidden:true
            }    //현상코드
            ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="cauCd" data-name="<spring:message code='ser.lbl.cauCd'/>" class="form_input" readonly="true" /><a href="#" onclick="phenCauAdd(2)" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="cauCd"></span>')
                    .appendTo(container);
                 },hidden:true
            }      //원인코드
            ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:100}  // 패키지코드
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100,hidden :reHiddenColYn}    // 캠페인번호
            ,{field:"crTp", title:"<spring:message code='ser.lbl.crTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=crTpCdGrid(crTp)#"
                ,editor:function(container, options) {
                     $('<input required name="crTp" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         valuePrimitive:true
                         ,dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:crTpList
                     });
                     $('<span class="k-invalid-msg" data-for="crTp"></span>').appendTo(container);
                 },hidden :reHiddenColYn
            }   // 캠페인유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100, hidden :reHiddenColYn}    // 캠페인명
            ,{_field:"custmrOpin", title:"<spring:message code='ser.lbl.custReqCd' />", width:100}   // 고객의견
            ,{_field:"checkedCd", title:"<spring:message code='ser.lbl.checkCd' />", width:100}     // 점검코드
            ,{field:"partsPrcTp", title:"<spring:message code='ser.lbl.partAmtTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=partPrcTpGrid(partsPrcTp)#"
            }   // 부품가격유형
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:70
                ,template:"#=roTpCdGrid(roTp)#"
                ,editor:function(container, options){
                    $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:roTpCdList
                        ,optionLabel:"<spring:message code='global.btn.select' />"
                        ,index:0
                    });
                }
                , hidden:true
            }   // RO유형
            ,{field:"comItemCd", title:"配件预付款", width:100,hidden:true }
            ,{field:"reqQty", title:"<spring:message code='ser.lbl.reqQty' />", width:70, attributes:{"class":"ar"}, hidden:true}    // 요청수량
            ,{field:"giQty", title:"<spring:message code='ser.lbl.giQty' />", width:70, attributes:{"class":"ar"} , hidden:true
                ,format:"{0:n0}"
                ,decimal:0
                ,template:function(data){
                    changeTotalAmt();
                    var giQty = 0;
                    if(data.giQty != null){
                        giQty = data.giQty;
                    }
                    return giQty;
                }
            }    // 출고수량
            ,{field:"movingAvgPrc", title:"movingAvgPrc", width:100 ,hidden:true}
            ,{field:"movingAvgAmt", title:"movingAvgAmt", width:100 ,hidden:true}
            ,{field:"parResvStatCd", hidden:true} // 부품준비상태
        ]
    });

    var partGrid = $("#partGrid").data("kendoExtGrid");

    // 부품 삭제
    $("#parDel").kendoButton({
        click:function(e) {

            var rows = partGrid.select();

            rows.each(function(index, row) {
                var dataItem = partGrid.dataItem(row);
                // 작업시작, 작업완료
                if(dataItem.wrkStatCd == "02" || dataItem.wrkStatCd == "05"){
                    dms.notification.info("<spring:message code='ser.info.notDelLbrCd' arguments='" + dataItem.lbrNm + "' />");
                    return false;
                }else{
                    if(dms.string.isEmpty(dataItem.crNo)){
                        partGrid.removeRow(row);
                    }else {
                        $("#messageId").html("<spring:message code='ser.info.delCampParts'/>");
                        conformKendoWindow.content( $(".msgDiv").html());
                        conformKendoWindow.open();
                        $(".yes, .no").click(function(){
                            if($(this).hasClass("yes")){
                                partGrid.removeRow(row);
                            }
                            conformKendoWindow.close();
                        }).end();
                    }
                }
            });
            changeTotalAmt();
        }
        ,enable:false
    });

    var _selectable;
    if(isTablet == true || isTablet == "true"){
        _selectable="row";
    }else{
        _selectable="multiple";
    }

    var _height = (isTablet == true || isTablet == "true") ? 590 : 570 ;   //khskhs 문제시 삭제
    // 부품추가 팝업
    // 부품 타입  :01:일반  , 03:보험 ,  04:보증
    // RO 타입 : 01:일반  , 02:보증 , 03 :보험,   04 :내부  , 05 :리쿼크
    $("#parAdd").kendoButton({
        click:function(e) {
            var roTp = "01";
            var partTp = "01";
            var avlbStockQtyZeroYn = "Y";

            if( ($("#roTp").val() != undefined ) ){
                roTp = $("#roTp").data("kendoExtDropDownList").value();
                if(roTp == "02") partTp = "04";
                else if(roTp =="04" || roTp =="05" ) partTp = "01";
                else partTp = roTp;
            }

            // 가용재고부품 0 인것도 포함
            if(preFixId == "RE" || preFixId == "PRE" || preFixId == "RO"){
                avlbStockQtyZeroYn = "N";
            }

            selectStockGiItemForServicePopupWindow = dms.window.popup({
                windowId:"selectStockGiItemForServicePopupWindow"
                ,height:_height //khskhs 문제시 삭제 원래 570
                ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
                ,content:{
                    //url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
                    url:"<c:url value='/par/cmm/selectStockGiItemForServicePopup.do'/>"
                    ,data:{
                        "autoBind":true
                        ,"selectable":_selectable
                        ,"prcTp":partTp
                        ,"itemDstinCd":'02'
                        ,"avlbStockQtyZeroYn":avlbStockQtyZeroYn
                        ,"callbackFunc":function(parData){
                            if(parData.length > 0)
                            {
                                 partsAdd(parData, "N");
                            }
                        }
                    }
                }
            });
        }
        ,enable:false
    });

    // 패키지 팝업
    $("#parPkgAdd, #lbrPkgAdd").kendoButton({
        click:function(e)
        {
            //TODO : [InBoShim] 부품전용 패키지 팝업 호출로 분기처리 함.
            if(preFixId == "ET" && preFixTp == "PAE"){
                selectIssueWorkPackagePopup = dms.window.popup({
                    windowId:"selectIssueWorkPackagePopup"
                    ,width:800
                    ,height:350
                    ,title:"<spring:message code='par.title.packageSelect' />"
                    ,content:{
                        url:"<c:url value='/par/cmm/selectIssuePackageWorkPopup.do'/>"
                        ,data:{
                            "autoBind":true
                            ,"selectable":"multiple"
                            ,"callbackFunc":function(parData, lbrData){

                                if(parData.length > 0) {
                                    partsAdd(parData, "N");
                                }

                                if(lbrData.length > 0){
                                    lbrAdd(lbrData, "N");
                                }
                                selectIssueWorkPackagePopup.close();
                            }
                        }
                    }
                });
            }else{
                workPackagePopup = dms.window.popup({
                    windowId:"workPackagePopup"
                    ,height:550
                    ,title:"<spring:message code='global.lbl.pakage' />"
                    ,content:{
                        url:"<c:url value='/ser/cmm/popup/selectWorkPackagePopup.do'/>"
                        ,data:{
                            "autoBind":true
                            ,"selectable":"multiple"
                            ,"sLtsModelCd":$("#ltsModelCd").val()
                            ,"callbackFunc":function(parData, lbrData){

                                if(parData.length > 0) {
                                    partsAdd(parData, "N");
                                }

                                if(lbrData.length > 0){
                                    lbrAdd(lbrData, "N");
                                }
                            }
                        }
                    }
                });
            }


        }
        ,enable:false
    });

    // 부품추가 공통
    partsAdd = function(jsonObj, campaignYn){

        var partDataItem = partGrid.dataSource._data;

        $.each(jsonObj, function(idx, data){

            var copyData;
            var checkVal = true;

            // 중복값 체크
            $.each(partDataItem, function(idx, obj){
                if(data.itemCd == obj.itemCd){
                    checkVal = false;
                }
            });

            var pkgYN =  ( dms.string.strNvl(data.pkgItemCd) == "" ) ? "N":"Y";
            var stockUnitCd = ( dms.string.strNvl(data.stockUnitCd) == "" ) ? "EA":data.stockUnitCd;
            var dlrCampaignYn = (campaignYn == "Y" && data.hostCd == "02") ? true : false;
            var bhmcCampaignYn = (campaignYn == "Y" && data.hostCd == "01") ? true : false;

            var roTpCd = "01";

            if(preFixId == "RE" || preFixId == "PRE"){   // 예약접수, 부품예약
                roTpCd = (bhmcCampaignYn) ? "02":"01";
            }else if(preFixId == "PRC") {
                roTpCd = $("#preRoTp").data("kendoExtDropDownList").value(); //RO 유형 코드
            }else if(preFixId == "RES") {  // 구원서비스
                roTpCd = "01";
            }else if(preFixId == "ET") {  // 부품수령견적
                roTpCd = "01";
            } else {
                roTpCd = $("#roTp").data("kendoExtDropDownList").value(); //RO 유형 코드
            }

            var roTp = ( bhmcCampaignYn || roTpCd == "02") ? "02":roTpCd;

            var paymTp;
            var paymCd;
            var paymUsrNm;
            //01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러
            if(preFixId == "CA" || preFixId == "RO" || preFixId == "ET"  || preFixId == "PRC"){
                var custNm = (dms.string.isEmpty($("#carOwnerNm").val()))? $("#driverNm").val() : $("#carOwnerNm").val();
                var custNo = (dms.string.isEmpty($("#carOwnerId").val()))? $("#driverId").val() : $("#carOwnerId").val();
                if(roTp == "01"){ //일반
                    paymTp    = "04";       //기타고객 , 고객
                    paymCd    = custNo;
                    paymUsrNm = custNm;

                }else if(roTp == "02"){//보증
                    if(crTpYn){
                        paymTp    = "04";       //기타고객 , 고객
                        paymCd    = custNo;
                        paymUsrNm = custNm;
                    }else{
                        paymTp    = "01";       //보증
                        paymCd    = "A07AA";
                        paymUsrNm = "BHMC";
                    }
                }else if(roTp == "03"){//보험
                    paymTp    = "02";
                    paymCd    = insCmpCd;
                    paymUsrNm = insCmpNm;
                }else{
                    paymTp    = "05";       // 딜러
                    paymCd    = "${dlrCd}";
                    paymUsrNm = "${dlrNm}";
                }
            }

            var itemPrc = 0;
            var itemTotAmt = 0;
            var itemPrcTp = "";

            if(!dlrCampaignYn && !bhmcCampaignYn){
                if(roTp == "02"){
                    if(crTpYn){
                        itemPrc = data.retlPrc.toFixed(2); // 소매가
                        itemPrcTp = "01";
                    } else {
                        itemPrc = data.grtePrc; // 보증가
                        itemPrcTp = "04";
                    }
                } else if(roTp == "03"){
                    itemPrc = data.incPrc.toFixed(2);  // 보험가
                    itemPrcTp = "03";
                } else {
                    itemPrc = data.retlPrc.toFixed(2); // 소매가
                    itemPrcTp = "01";
                }
                itemTotAmt = Number(itemPrc*data.giQty);
            } else if(bhmcCampaignYn) {
                itemPrcTp = "04";
            } else {
                itemPrcTp = "01";
            }

            if(checkVal) {
                copyData ={
                     roTp:roTp
                    ,dlrCd:data.dlrCd
                    ,itemCd:data.itemCd
                    ,itemNm:data.itemNm
                    ,itemPrc:(dlrCampaignYn || bhmcCampaignYn) ? data.salePrcAmt : (pkgYN == "Y" ) ? data.itemPrc : itemPrc
                    ,itemSalePrc:(pkgYN == "Y") ? data.itemPrc : (dlrCampaignYn || bhmcCampaignYn) ? data.salePrcAmt : data.taxDdctGrtePrc
                    ,movingAvgPrc:data.movingAvgPrc
                    ,movingAvgAmt:Number(data.movingAvgPrc * data.giQty)
                    ,itemQty:(pkgYN == "Y") ?  data.itemQty:data.giQty
                    ,calcUnitCd:(pkgYN == "Y") ?  data.itemUnitCd:stockUnitCd
                    ,itemTotAmt:(dlrCampaignYn || bhmcCampaignYn) ? data.itemTotAmt : (pkgYN == "Y") ? data.pkgDetlDcTotAmt : itemTotAmt
                    ,itemSaleAmt:(dlrCampaignYn || bhmcCampaignYn) ? data.itemTotAmt : (pkgYN == "Y") ? data.pkgDetlTotAmt : itemPrc
                    ,pkgDocNo:data.pkgDocNo
                    ,pkgItemCd:data.pkgItemCd
                    ,reqStrgeCd:data.giStrgeCd
                    ,grStrgeCd:data.giStrgeCd
                    ,giStrgeCd:data.giStrgeCd
                    ,crNo:campaignYn == "Y" ? data.crNo:""
                    ,crNm:campaignYn == "Y" ? data.crNm:""
                    ,crTp:campaignYn == "Y" ? data.crTp:""
                    ,reqQty:data.giQty
                    ,paymTp:paymTp
                    ,paymCd:paymCd
                    ,paymUsrNm:paymUsrNm
                    ,dcAmt : (dlrCampaignYn || bhmcCampaignYn) ? data.dcAmt : (pkgYN == "Y") ? data.pkgDetlDcAmt : 0.00
                    ,dcRate : (dlrCampaignYn || bhmcCampaignYn) ? data.dcRate : (pkgYN == "Y") ? data.pkgDetlDcRate : 0.00
                    ,giQty : 0
                    ,itemReqStatCd:"01"
                    ,partsPrcTp : itemPrcTp
                    ,parResvStatCd : "01"   //부품예류상태 : 준비(01)
                };

                partGrid.dataSource.add(copyData);
            }
            parDlrDcSet();  // 딜러할인율 적용
            changeTotalAmt();
        });
    };

    // 딜러할인율 적용(그리드 리스트용)
    parDlrDcSet = function(){
        var serDlrParDcRate = Number($("#serDlrParDcRate").data("kendoExtNumericTextBox").value()).toFixed(2);

        if(serDlrParDcRate > 0){
            $.each(getPartData() , function(i , gridData){
                if(this.paymTp == "04"){

                    var dcCalRate = ((serDlrParDcRate / 100) ).toFixed(2);
                    var itemTotAmt = (this.itemSaleAmt * (1-dcCalRate)).toFixed(2);
                    var dcAmt = (this.itemSaleAmt - itemTotAmt).toFixed(2);

                    gridData.set("dcRate", serDlrParDcRate);
                    gridData.set("dcAmt", dcAmt);
                    gridData.set("itemTotAmt", itemTotAmt);
                } else {
                    gridData.set("dcRate", 0.00);
                    gridData.set("dcAmt", 0.00);
                    gridData.set("itemTotAmt", this.itemSaleAmt);
                }
            });
        }
    }

    // 딜러할인율 적용
    parDlrDcSetByItem = function(){
        var serDlrParDcRate = Number($("#serDlrParDcRate").data("kendoExtNumericTextBox").value()).toFixed(2);

        if(serDlrParDcRate > 0){
            var grid = $("#partGrid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());

            if(selectedVal.paymTp == "04"){
                var dcCalRate = ((serDlrParDcRate / 100) ).toFixed(2);
                var itemTotAmt = (selectedVal.itemSaleAmt * (1-dcCalRate)).toFixed(2);
                var dcAmt = (selectedVal.itemSaleAmt - itemTotAmt).toFixed(2);

                selectedVal.set("dcRate", serDlrParDcRate);
                selectedVal.set("dcAmt", dcAmt);
                selectedVal.set("itemTotAmt", itemTotAmt);
            } else {
                selectedVal.set("dcRate", 0.00);
                selectedVal.set("dcAmt", 0.00);
                selectedVal.set("itemTotAmt", selectedVal.itemSaleAmt);
            }
        }
    }

    // 서비스알람 칸반에서 부품추가
    partsSerAlramAdd = function(jsonObj,sPreFixId){

        var partDataItem = partGrid.dataSource._data;
        var roTpVal = $("#roTp").val();
        var preRoTp = "";

        if(jsonObj.total > 0){
            $.each(jsonObj.data, function(idx, data){

                // 서비스알람에서 넘어올 경우 출고수량, 요청상태 클리어
                data.giQty = 0.0;
                data.itemReqStatCd = "";

                var copyData;
                var checkVal = true;

                // 중복값 체크
                $.each(partDataItem, function(idx, obj){
                    if(data.itemCd == obj.itemCd){
                        checkVal = false;
                    }
                });

                if(checkVal) {
                    partGrid.dataSource.add(data);
                    preRoTp = roTpVal;
                    setChangeRoTpValue(roTpVal,preRoTp);
                    paymTpDataRstl(roTpVal);
                    if(preFixId == "RO"){
                        roTpChangeSet(roTpVal);
                        if(!chkRsultYn){
                            if(sPreFixId == "RE"){
                                $("#resvDocNo").val("");
                            }
                        }
                    }
                    changeTotalAmt();
                }
            });
            return false;
        }
    };

    changeTotalAmt = function() {
        var parAmt = 0;
        var parDcAmt = 0;
        var parDcRate = 0;
        var firstParDcRate = 0;
        var lbrAmt = 0;
        var lbrDcAmt = 0;
        var lbrDcRate = 0;
        var firstLbrDcRate = 0;
        var etcReqPrc = 0;


        var partsData = $("#partGrid").data("kendoExtGrid").dataSource.data();

        //부품금액
        $.each(partsData, function(index, item){
            parAmt += Number(this.itemTotAmt);
        });

        //기타비용
        $.each(getEtcIssueData(), function(index, item) {
            etcReqPrc += Number(this.etcReqPrc);
        });


        if(preFixId != "PRE"){
            //공임비
            $.each(getLbrData(), function(index, item){
                lbrAmt += Number(this.lbrTotAmt);
            });
        }

        if(preFixId == "CA" || preFixId == "ET") {
            if(dms.string.strNvl(preFixTp) != "ETSTATUS"){
                //if(dms.string.strNvl($("#roStatCd").val() != "05")) {

                    //부품금액
                    $.each(getPartData(), function(index, item){
                        parDcAmt += Number(this.dcAmt);
                    });

                    //부품금액
                    $.each(getPartData(), function(index, item){
                        if(index == 0){
                            firstParDcRate = this.dcRate;
                        }
                        if(firstParDcRate == this.dcRate){
                            parDcRate = Number(this.dcRate);
                        } else {
                            parDcRate = 0;
                            return false;
                        }
                    });

                    //공임비
                    $.each(getLbrData(), function(index, item){
                        lbrDcAmt += Number(this.dcAmt);
                    });

                    //공임비
                    $.each(getLbrData(), function(index, item){
                        if(index == 0){
                            firstLbrDcRate = this.dcRate;
                        }
                        if(firstLbrDcRate == this.dcRate){
                            lbrDcRate = Number(this.dcRate);
                        } else {
                            lbrDcRate = 0;
                            return false;
                        }
                    });

                    if(preFixTp != "PAE"){

                        $("#lbrCalcAmt").data("kendoExtNumericTextBox").value(lbrAmt + lbrDcAmt);
                        $("#lbrDcAmt").data("kendoExtNumericTextBox").value(lbrDcAmt);
                        $("#lbrDcRate").data("kendoExtNumericTextBox").value(lbrDcRate);
                        $("#lbrWhDcAmt").data("kendoExtNumericTextBox").value(lbrAmt);

                        $("#parCalcAmt").data("kendoExtNumericTextBox").value(parAmt + parDcAmt);
                        $("#parDcAmt").data("kendoExtNumericTextBox").value(parDcAmt);
                        $("#parDcRate").data("kendoExtNumericTextBox").value(parDcRate);
                        $("#parWhDcAmt").data("kendoExtNumericTextBox").value(parAmt);

                        $("#etcWhDcAmt").data("kendoExtNumericTextBox").value(etcReqPrc);
                        $("#etcCalcAmt").data("kendoExtNumericTextBox").value(etcReqPrc);

                        $("#dcTotAmt").data("kendoExtNumericTextBox").value(lbrDcAmt + parDcAmt);
                        $("#calcTotAmt").data("kendoExtNumericTextBox").value(parAmt + parDcAmt + lbrAmt + lbrDcAmt + etcReqPrc);
                        $("#dcWhTotDcAmt").data("kendoExtNumericTextBox").value(parAmt + lbrAmt + etcReqPrc);

                        var lbrWhDcAmt = $("#lbrWhDcAmt").data("kendoExtNumericTextBox").value();
                        var parWhDcAmt = $("#parWhDcAmt").data("kendoExtNumericTextBox").value();
                        var etcWhDcAmt = $("#etcWhDcAmt").data("kendoExtNumericTextBox").value();
                        var dcWhTotDcAmt = $("#dcWhTotDcAmt").data("kendoExtNumericTextBox").value();

                        var bmPointTotAmt = $("#bmPointTotAmt").data("kendoExtNumericTextBox").value();
                        var bmCupnTotAmt = $("#bmCupnTotAmt").data("kendoExtNumericTextBox").value();
                        var pointTotAmt = $("#pointTotAmt").data("kendoExtNumericTextBox").value();
                        var etcTotAmt = $("#etcTotAmt").data("kendoExtNumericTextBox").value();
                        var lbrEtcDcAmt = $("#lbrEtcDcAmt").data("kendoExtNumericTextBox").value();
                        var parEtcDcAmt = $("#parEtcDcAmt").data("kendoExtNumericTextBox").value();
                        var lbrBmPointUseAmt = $("#lbrBmPointUseAmt").data("kendoExtNumericTextBox").value();
                        var lbrBmCupnUseAmt = $("#lbrBmCupnUseAmt").data("kendoExtNumericTextBox").value();
                        var lbrPointUseAmt = $("#lbrPointUseAmt").data("kendoExtNumericTextBox").value();
                        var parBmPointUseAmt = $("#parBmPointUseAmt").data("kendoExtNumericTextBox").value();
                        var parBmCupnUseAmt = $("#parBmCupnUseAmt").data("kendoExtNumericTextBox").value();
                        var parPointUseAmt = $("#parPointUseAmt").data("kendoExtNumericTextBox").value();

                        $("#lbrCalcSumAmt").data("kendoExtNumericTextBox").value(Number(lbrWhDcAmt - lbrBmPointUseAmt - lbrBmCupnUseAmt - lbrPointUseAmt - lbrEtcDcAmt));
                        $("#parCalcSumAmt").data("kendoExtNumericTextBox").value(Number(parWhDcAmt - parBmPointUseAmt - parBmCupnUseAmt - parPointUseAmt - parEtcDcAmt));
                        $("#etcCalcSumAmt").data("kendoExtNumericTextBox").value(Number(etcWhDcAmt));
                        $("#lastCalcTotAmt").data("kendoExtNumericTextBox").value(Number(dcWhTotDcAmt - bmPointTotAmt - bmCupnTotAmt - pointTotAmt - etcTotAmt));
                    }

                //}
            }
        } else if(preFixId == "PRE"){
            // 예정부품대 소계
            $("#parAmt").data("kendoExtNumericTextBox").value(parAmt.toFixed(2));
            $("#etcAmt").data("kendoExtNumericTextBox").value(etcReqPrc.toFixed(2));
            $("#totAmt").data("kendoExtNumericTextBox").value((parAmt + etcReqPrc).toFixed(2));
        } else {
            if(dms.string.strNvl(preFixTp) == ""){
                // 예정부품대 소계
                $("#parAmt").data("kendoExtNumericTextBox").value(parAmt.toFixed(2));
                $("#lbrAmt").data("kendoExtNumericTextBox").value(lbrAmt.toFixed(2));
                $("#etcAmt").data("kendoExtNumericTextBox").value(etcReqPrc.toFixed(2));
                $("#totAmt").data("kendoExtNumericTextBox").value((parAmt + lbrAmt + etcReqPrc).toFixed(2));
            }
        }
    };

    //대체부품 팝업
    comItemAdd = function(){

        var roTp = "01";
        var partTp = "01";
        if( ($("#roTp").val() != undefined ) ){
            roTp = $("#roTp").data("kendoExtDropDownList").value();
            if(roTp == "02") partTp = "04";
            else if(roTp =="04" || roTp =="05" ) partTp = "01";
            else partTp = roTp;
        }

        selectStockGiItemForServicePopupWindow = dms.window.popup({
            windowId:"selectStockGiItemForServicePopupWindow"
            ,height:570
            ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
            ,content:{
                url:"<c:url value='/par/cmm/selectStockGiItemForServicePopup.do'/>"
                ,data:{
                    "autoBind":true
                    ,"selectable":"multiple"
                    ,"prcTp" :partTp
                    ,"itemDstinCd":'02'
                    ,"avlbStockQtyZeroYn":"N"
                    ,"callbackFunc":function(parData){
                        if(parData.length > 0)
                        {
                            var partGrid = $("#partGrid").data("kendoExtGrid");
                            var partData = [];
                            var comItemPrc = 0;
                            var preComItemCd ="";
                            var dupItemCd="";
                            var rows = partGrid.tbody.find("tr");
                            chagePayTp(partGrid, "par", "Y");

                            rows.each(function(index, row) {
                                var dataItem = partGrid.dataSource._data;
                                if($(this).hasClass("k-state-selected")){
                                    if(dataItem[index].giQty > 0 ){
                                        dms.notification.info("<spring:message code='ser.info.reqPartsChk'  />");
                                        return false;
                                    }
                                    preComItemCd = dataItem[index].comItemCd;

                                    var itemPrc = 0;

                                    if(roTp == "02"){
                                        itemPrc = parData[0].grtePrc.toFixed(2); // 보증가
                                    } else if(roTp == "03"){
                                        itemPrc = parData[0].incPrc.toFixed(2);  // 보험가
                                    } else {
                                        itemPrc = parData[0].retlPrc.toFixed(2); // 소매가
                                    }

                                    comItemPrc = Number(dataItem[index].itemTotAmt)  -  Number(itemPrc*parData[0].giQty) <= 0 ? 0 : Number(dataItem[index].itemTotAmt)  -  Number(itemPrc*parData[0].giQty);

                                    dataItem[index].comItemCd = parData[0].itemCd;
                                    dataItem[index].comItemNm = parData[0].itemNm;
                                    dataItem[index].dirty = true;
                                    partData.push(parData[0]);
                                };
                                //이전 대체부품 삭제
                                if(dataItem[index].comItemPrc != null ){
                                    if(preComItemCd == dataItem[index].itemCd){
                                        partGrid.removeRow(row);
                                    }
                                }
                            });

                            partsAdd(partData, "N");
                            var dataItem = partGrid.dataSource._data;
                            dataItem[dataItem.length-1].comItemPrc = comItemPrc;
                            dataItem[dataItem.length-1].itemTotAmt = comItemPrc;
                            partGrid.refresh();
                            selectStockGiItemForServicePopupWindow.close();

                        }
                    }
                }
            }
        });
    };

    partInfo = function(docNo, preFixId) {
        partPreFixId = preFixId;
        partDocNo = docNo;
        partGrid.dataSource.read();
    };

    getPartData = function(){
        var partSaveData = partGrid.dataSource.data();
        return partSaveData;
    };

    chkPartExtStatus = function() {

        var status = true;
        $.each(getPartData(), function(index, item) {
            if(Number(this.giQty) > 0){
                status = false;
                return false;
            }
        });

        return status;
    };

    setChangeRoTpValue = function(roTpVal,preRoTp){

        chkRsultYn = true;

        $.each(getLbrData(), function(i , gridData){
            var ttChkYn = (gridData.lbrCd.length > 3 && gridData.lbrCd.substr(gridData.lbrCd.length-2,gridData.lbrCd.length)== "TT") ? false : true;
            var dlrDstinCd = (gridData.dstinCd == "D" || gridData.dstinCd == "E") ? true : false; // 일반공임일경우
            var wtyDstinCd = (gridData.dstinCd == "G" || gridData.dstinCd == "Z") ? true : false; // 보증공임일경우
            if(roTpVal == '02'){ //보증
                if(dlrDstinCd && ttChkYn){
                    var msg = gridData.lbrCd + "<spring:message code='ser.lbl.cmpnLbrCd' var='cmpnLbrCd' />"+
                              "<spring:message code='ser.lbl.lbrCd' var='lbrCd' />"+
                              "<spring:message code='ser.info.checkLbrTp' arguments='${cmpnLbrCd} , ${lbrCd}' />";
                    $("#roTp").data("kendoExtDropDownList").value(preRoTp);
                    chkRsultYn = false;
                    resultYn = false;
                    dms.notification.warning(msg);
                    return false;
                }
            }else{
                if(wtyDstinCd){ //은 {0}만 사용가능한 {1} 입니다
                    var msg = gridData.lbrCd + "<spring:message code='ser.lbl.wartEx' var='wartEx' />"+
                              "<spring:message code='ser.lbl.lbrCd' var='lbrCd' />"+
                              "<spring:message code='ser.info.checkCmnpLbrTp' arguments='${wartEx} , ${lbrCd}' />";
                    $("#roTp").data("kendoExtDropDownList").value(preRoTp);

                    resultYn = false;
                    chkRsultYn = false;
                    dms.notification.warning(msg);
                    return false;
                }
            }
        });

        return chkRsultYn;
    };


    paymTpDataSet = function(roTp){
      /*
                고객일 경우 : 방문자 or 소유자
                기타고객 : 고객팝업
                보험 : 보험 팝업
            20161025 요구사항
                      지불자:
        - 보험회사의 경우, 드롭다운박스 보험회사 명칭 선택 필요. - 팝업으로 대체
        - 고객의 경우 디폴트로 방문자. 단, 드롭다운박스에서 방문자 또는 차량소유자 선택.
        - 보증클레임의 경우 BHMC 표시. 단, 편집 불가.
        - 기타고객의 경우 보유고객 선택가능, 명칭없을시 비고란에 기입하면 됨. -고객팝업 으로 대체
        - 딜러사의 경우 디폴트로 딜러명칭 표시.
        20161109
        - 보험일경우 고객 , 기타고객 추가
        */

        //01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러

        if(roTp == "01"){ //일반
            custNm = (dms.string.isEmpty($("#driverNm").val()))? $("#carOwnerNm").val() : $("#driverNm").val();
            custNo = (dms.string.isEmpty($("#driverId").val()))? $("#carOwnerId").val() : $("#driverId").val();
            paymTp    = "04";       //기타고객 , 고객
            paymCd    = custNo;
            paymUsrNm = custNm;
        }else if(roTp == "02"){//보증
            paymTp    = "01";       //보증
            paymCd    = "A07AA";
            paymUsrNm = "BHMC";
        }else if(roTp == "03"){//보험
            paymTp    = "02";       //보험
            paymCd    = insCmpCd;
            paymUsrNm = insCmpNm;
        }else{
            paymTp    = "05";       // 딜러
            paymCd     = "${dlrCd}";
            paymUsrNm = "${dlrNm}";
        }

    };

    paymTpDataRstl = function(roTp){

        paymTpDataSet(roTp);
        if(chkRsultYn){
            $.each(getLbrData(), function(i , gridData){
                if(roTp == '02'){ //보증

                    var lbrCd =  gridData.lbrCd.substring(gridData.lbrCd.length-2 , gridData.lbrCd.length); // 공임코드 뒷2 자리
                    var zzCodeYn = (lbrCd == "ZZ") ? true : false;
                    var lbrTp;

                    if(zzCodeYn){
                        lbrTp = gridData.lbrTp;
                    } else {
                        lbrTp = (gridData.lbrTp == "03" || gridData.lbrTp == "04" ) ? gridData.lbrTp : "03";
                    }

                    gridData.set("lbrTp", lbrTp);
                    gridData.set("roTp", roTp);
                    gridData.set("lbrHm", gridData.lbrOrgHm);

                    changeRateAmt(); //=> selectLbrList.jsp 에  존재

                }else{
                    gridData.set("lbrTp", gridData.lbrTp);
                    gridData.set("roTp", roTp);
                    changeRateAmt();
                }
                gridData.set("paymTp", paymTp);
                gridData.set("paymCd", paymCd);
                gridData.set("paymUsrNm", paymUsrNm);

            });

            $.each(getPartData(), function(i , gridData){
                gridData.set("roTp", roTp);
                gridData.set("paymTp", paymTp);
                gridData.set("paymCd", paymCd);
                gridData.set("paymUsrNm", paymUsrNm);

            });

            $.each(getEtcIssueData(), function(i , gridData){
                gridData.set("paymTp", paymTp);
                gridData.set("paymCd", paymCd);
                gridData.set("paymUsrNm", paymUsrNm);
            });
        }
    }

    //RO 유형별 결제변경
    setPaymTpList = function(roTp){
        $.each(getLbrData(), function(index, item){
            if(item.crTp == "K"){
                crTpYn = true;
            }
        });
        if(roTp == "01"){//일반
            paymTpCdList = paymTpCdList3; //고객정보
        }else if(roTp == "02"){//보증
            if(crTpYn){
                paymTpCdList = paymTpCdList5;//K-Type
            } else {
                paymTpCdList = paymTpCdList1;//보증정보
            }
        }else if(roTp == "03"){//보험
            paymTpCdList = paymTpCdList2;//보험정보
        }else if(roTp == "04" || roTp == "05"){//내부  , 리워크
            paymTpCdList = paymTpCdList4;//딜러정보
        }
    };

    //부품 고객팝업  호출
    insuPartPopup = function(){
        var grid = $("#partGrid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());

        selectPaymPopupSearch(selectedVal.paymTp, grid);

    };

    //결제유형별 팝업
    selectPaymPopupSearch = function(paymTp , grid){

        if(paymTp == "02"){
            insurancePopupWindow(grid, "N", "");
        }else if(paymTp == "03"){
            custSearchPopupWindow(grid);
        }

    };

    //보험 조회 팝업
    insurancePopupWindow = function(grid, flag, selectedVal){

        insurancePopup = dms.window.popup({
            windowId:"insurancePopup"
            ,title:"<spring:message code='ser.lbl.insurance' />"
            ,height:250
            ,width:300
            ,content:{
                url:"<c:url value='/ser/cmm/popup/selectInsuSearchPopup.do'/>"
                ,data:{
                    "autoBind":false
                    ,"selectable":"single"
                    ,"callbackFunc":function(data){
                        if(data.length > 0) {
                            insCmpCd = data[0].incCmpCd;
                            insCmpNm = data[0].incCmpNm;

                            if(flag == "Y"){
                                var lbrGridData = grid.lbrGrid.dataSource._data;
                                var partGridData = grid.partGrid.dataSource._data;

                                $.each(lbrGridData, function(i, grid){
                                    grid.set("paymTp","02");
                                    grid.set("paymCd",data[0].incCmpCd);//지불자코드
                                    grid.set("paymUsrNm",data[0].incCmpNm);//지불자명
                                });

                                $.each(partGridData, function(i, grid){
                                    grid.set("paymTp","02");
                                    grid.set("paymCd",data[0].incCmpCd);//지불자코드
                                    grid.set("paymUsrNm",data[0].incCmpNm);//지불자명
                                });
                            }else{
                                selectedVal.set("paymCd",data[0].incCmpCd);//지불자코드
                                selectedVal.set("paymUsrNm",data[0].incCmpNm);//지불자명
                            }

                        }
                    }
                }
            }

        });

    };

    //고객팝업
    custSearchPopupWindow = function(grid){
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , width:900
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "custCd":"02"// null:all, 01:잠재, 02:보유
                    //, "dlrMbrYn":"N"        // 딜러 멤버십 가입 여부
                    , "closeYn" : "N"
                    , "callbackFunc":function(data){

                        if(data.length >= 1) {

                            var selectedVal = grid.dataItem(grid.select());
                            selectedVal.set("paymCd",data[0].custNo);//지불자코드
                            selectedVal.set("paymUsrNm",data[0].custNm);//지불자명
                            popupWindow.close();
                        }//end if
                    }//end callbackFunc
                }//end data
            }// end content
        });
    };

    //지불자 변경 이벤트
    chagePayTp = function(grid, type, comItemYn){

        var selectedVal = grid.dataItem(grid.select());
        var paymTp;
        var paymCd;
        var paymUsrNm;
        var itemPrc = 0;
        var itemTotAmt = 0;
        var saleTaxDdctPrcAmt = 0;
        var itemPrcTp;

        if(comItemYn == "Y"){   // 대체부품일경우
            selectedVal.paymTp = "01";
        }

        //01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러
        if(selectedVal.paymTp == "01"){//보증
            paymTp    = "01";       //보증
            paymCd    = "A07AA";
            paymUsrNm = "BHMC";
            itemPrcTp = "04";
        }else if(selectedVal.paymTp == "02"){//보험
            paymTp    = "02";       //보험
            insurancePopupWindow(grid, "N", selectedVal);
            itemPrcTp = "03";
        }else if(selectedVal.paymTp == "03"){ //기타고객
            paymTp    = "03";
            custSearchPopupWindow(grid);
            itemPrcTp = "01";
        }else if(selectedVal.paymTp == "04"){//고객 孙旭
            var custNm = (dms.string.isEmpty($("#driverNm").val()))? $("#carOwnerNm").val() : $("#driverNm").val();
            var custNo = (dms.string.isEmpty($("#driverId").val()))? $("#carOwnerId").val() : $("#driverId").val();
            paymTp    = "04";       //기타고객 , 고객
            paymCd    = custNo;
            paymUsrNm = custNm;
            itemPrcTp = "01";
        }else {
            paymTp    = "05";       // 딜러
            paymCd    = "${dlrCd}";
            paymUsrNm = "${dlrNm}";
            itemPrcTp = "01";
        }

        if(type == "par"){
            var data ={
                "sStrgeCd":selectedVal.giStrgeCd
                ,"sItemCd":selectedVal.itemCd
                ,"sPayTp":paymTp
            };

            $.ajax({
                url:"<c:url value='/par/pmm/partsPriceMaster/selectPayTpPriceMasterByKey.do' />"
                ,data:JSON.stringify(data)
                ,type:'POST'
                ,dataType:'json'
                ,async:false
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(data){
                    if(data != null){
                        itemPrc = data.salePrcAmt;
                        saleTaxDdctPrcAmt = data.saleTaxDdctPrcAmt
                        itemTotAmt = Number(itemPrc*selectedVal.reqQty);
                    }
                }
            });

            selectedVal.set("itemPrc", itemPrc);
            selectedVal.set("itemSalePrc", saleTaxDdctPrcAmt);
            selectedVal.set("itemSaleAmt", itemTotAmt);
            selectedVal.set("paymTp", paymTp);
            selectedVal.set("paymCd", paymCd);
            selectedVal.set("paymUsrNm", paymUsrNm);
            selectedVal.set("partsPrcTp", itemPrcTp);

            // 할인내용이 있는상황에서 금액이 바뀌는 경우 가있어서 0으로 리셋
            selectedVal.set("dcRate", 0);
            selectedVal.set("dcAmt", 0);

            //partGrid.refresh();
            setPartAmt(selectedVal,"Amt");
        } else {
            selectedVal.set("paymTp", paymTp);
            selectedVal.set("paymCd", paymCd);
            selectedVal.set("paymUsrNm", paymUsrNm);
        }

        if(preFixId != "CA"){
            if(type == "par"){
                parDlrDcSetByItem();   // 부품딜러할인율 적용
            } else {
                lbrDlrDcSetByItem();   // 공임딜러할인율 적용
            }
        }
        changeTotalAmt();
    };

    setPaymSetting = function(roTpCd){

        var lbrGrid = $("#lbrGrid").data("kendoExtGrid");
        var partGrid = $("#partGrid").data("kendoExtGrid");

        var paymTp;
        var paymCd;
        var paymUsrNm;
        //결제유형 : 01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러
        //RO유형   : 01 일반 , 02 보증 , 03 보험  , 04 내부 , 05 리워크
        if(preFixId == "RO"){
            if(roTpCd == "01"){ //일반
                var custNm = (dms.string.isEmpty($("#driverNm").val()))? $("#carOwnerNm").val() : $("#driverNm").val();
                var custNo = (dms.string.isEmpty($("#driverId").val()))? $("#carOwnerId").val() : $("#driverId").val();
                paymTp    = "04";       //기타고객 , 고객
                paymCd     = custNo;
                paymUsrNm = custNm;

            }else if(roTpCd == "02"){//보증
                paymTp    = "01";       //보증
                paymCd    = "A07AA";
                paymUsrNm = "BHMC";
            }else if(roTpCd == "03"){//보험
                paymTp    = "02";
                paymCd    = insCmpCd;
                paymUsrNm = insCmpNm;
            }else{
                paymTp    = "05";       // 딜러
                paymCd    = "${dlrCd}";
                paymUsrNm = "${dlrNm}";
            }

            $.each(lbrGrid.dataSource._data , function(i , gridData){
                if( dms.string.isEmpty(gridData.paymTp)){
                    gridData.set("paymTp", paymTp);
                    gridData.set("paymCd", paymCd);
                    gridData.set("paymUsrNm", paymUsrNm);
                }
            });

            $.each(partGrid.dataSource._data , function(i , gridData){
                if( dms.string.isEmpty(gridData.paymTp)){
                    gridData.set("paymTp", paymTp);
                    gridData.set("paymCd", paymCd);
                    gridData.set("paymUsrNm", paymUsrNm);
                }
            });

        }
    };


    //부품금액 세팅
    setPartAmt = function(rowData , flag){

        var itemQty = 0.00;
        var roTp;

        if($("#roTp").val() == undefined){
            roTp = "01";
        }else{
            roTp = $("#roTp").val();      //RO 유형 코드
        }

        if(rowData != null){

            if(rowData.giQty > 0){
                itemQty = Number(rowData.giQty);
            } else {
                itemQty = Number(rowData.itemQty);
            }
             var itemPrc = (preFixId == "ET" && roTp != "02") ? Number(rowData.itemSalePrc) : Number(rowData.itemPrc);
             var dcAmt   = Number(rowData.dcAmt),
                 dcRate  = Number(rowData.dcRate),
                 parCalAmt = Number(itemPrc*itemQty),
                 dcCalAmt  = 0,
                 parTotAmt = 0,
                 dcCalRate = 0;

             var maxDcAmt = (Number(rowData.itemSaleAmt) * (parDcRateMax / 100)).toFixed(2);    // 최대할인금액

            if(flag == "Amt"){
                dcCalAmt = dcAmt;
                parTotAmt = parCalAmt - dcAmt;
                if(parCalAmt > 0){
                    dcCalRate = Number(Math.abs((parTotAmt / parCalAmt) -1 )).toFixed(2); // 할인율
                } else {
                    dcCalRate = 0.00;
                }

                // 할인금액이 최대 할인율을 초과하는경우 최대할인금액으로 돌로 놓는다.
                if(parseFloat(dcCalRate*100) > parseFloat(parDcRateMax)){
                    dcCalRate = Number(parDcRateMax / 100);
                    dcCalAmt  = Number(maxDcAmt);
                    parTotAmt = Number(parCalAmt - dcCalAmt);
                }

            }else if(flag == "Rate"){
                dcCalRate = Number(dcRate / 100);
                parTotAmt = Number(parCalAmt * (1-dcCalRate));
                dcCalAmt= Number(parCalAmt - parTotAmt);
            }

            rowData.set("dcRate", Number(dcCalRate*100).toFixed(2));
            rowData.set("dcAmt",  Number(dcCalAmt).toFixed(2));
            rowData.set("reqQty", Number(rowData.itemQty).toFixed(2));
            rowData.set("itemTotAmt", Number(parTotAmt).toFixed(2));
            rowData.set("itemSaleAmt", Number(parCalAmt).toFixed(2));
        }
        //partGrid.refresh();
        changeTotalAmt();

    };


});

</script>