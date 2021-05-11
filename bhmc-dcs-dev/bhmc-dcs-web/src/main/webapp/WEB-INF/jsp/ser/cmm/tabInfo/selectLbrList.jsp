<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 정비항목 -->
<div style="height:205px;">
    <c:if test="${preFixId ne 'CA'}">
        <c:if test="${param.gubun ne 'S'}">
        <div class="btn_right_absolute">
            <button type="button" id="lbrPkgAdd" class="btn_s btn_pkgAdd btn_s_min5"><spring:message code="ser.btn.pakage" /></button>
            <%-- <c:choose>
                <c:when test="${preFixId eq 'ET'}">
                    <button type="button" id="lbrPkgAdd" class="btn_s btn_pkgAdd btn_s_min5"><spring:message code="ser.btn.pakage" /></button>
                </c:when>
                <c:otherwise>
                    <button type="button" id="lbrPkgAdd" class="btn_s btn_pkgAdd btn_s_min5"><spring:message code="global.btn.pakage" /></button>
                </c:otherwise>
            </c:choose> --%>
            <button type="button" id="lbrAdd" class="btn_s btn_add btn_s_min5"><spring:message code="global.btn.add" /></button>
            <button type="button" id="lbrDel" class="btn_s btn_delete btn_s_min5"><spring:message code="global.btn.del" /></button>
        </div>
        </c:if>
    </c:if>
    <div class="table_grid">
        <div id="lbrGrid" class="grid"></div>
    </div>
</div>
<!-- //정비항목 -->

<script type="text/javascript">

var lbrPreFixId;
var lbrDocNo;
var lbrGridId;
var ltsModelCd;
var laborSearchPopup;
var lbrDcRateMax = 100;     // 공임할인율
var lbrDcAmtMax = 100000;   // 공임할인금액
var lbrDcRateEditable = false;

var preFixId = "${preFixId}";
var preFixTp = "${preFixTp}";
if(preFixId == "RE") {
    lbrGridId = "G-SER-1011-000047";
} else if(preFixId == "RO") {
    lbrGridId = "G-SER-1011-000048";
} else if(preFixId == "CA") {
    lbrGridId = "G-SER-1011-000049";
} else if(preFixId == "ET") {
    lbrGridId = "G-SER-1011-000050";
} else if(preFixId == "PRC") {
    lbrGridId = "G-SER-1011-000051";
} else if(preFixId == "RES") {
    lbrGridId = "G-SER-1011-000052";
} else if(preFixId == "ROHISTDMS") {
    lbrGridId = "G-SER-1011-000053";
} else if(preFixId == "ROHISTDCS") {
    lbrGridId = "G-SER-1011-000054";
} else if(preFixId == "SERHIST") {
    lbrGridId = "G-SER-1011-000055";
} else if(preFixId == "RO" && preFixTp == "ROSTATUS") {
    lbrGridId = "G-SER-1011-000056";
} else if(preFixId == "PRC" && preFixTp == "PRCSTATUS") {
    lbrGridId = "G-SER-1011-000057";
} else if(preFixId == "PRC" && preFixTp == "PAE") {
    lbrGridId = "G-SER-1011-000058";
}

//공통코드:정비유형(수리유형)
var lbrTpCdList  = []; //기본 수리유형
var lbrTpCdList2 = []; //보증수리용 수리유형
var lbrTpCdList3 = []; //딜러 공임 전용 수리유형
var lbrTpCdList4 = []; //BHMC 공임 전용 수리유형
<c:forEach var="obj" items="${lbrTpCdList}">
    <c:if test="${obj.remark1 eq '02'}">
        lbrTpCdList2.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    <c:if test="${obj.remark2 eq 'E'}">
        lbrTpCdList4.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    lbrTpCdList3.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});

//공통코드:구원유형
var rescueTpCdList = [];
<c:forEach var="obj" items="${rescueTpCdList}">
rescueTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var rescueTpCdArr = dms.data.arrayToMap(rescueTpCdList, function(obj){return obj.cmmCd;});

//구원유형(수리유형)
rescueTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(rescueTpCdArr[val] != undefined)
        returnVal = rescueTpCdArr[val].cmmCdNm;
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

// 정비유형(수리유형)
lbrTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(lbrTpCdArr[val] != undefined)
        returnVal = lbrTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

//공통코드:임률정보
var rateList = [];
<c:forEach var ="obj" items="${rateDs}">
  rateList.push({
        rpirTp:"${obj.rpirTp}"
        , rpir01:"${obj.gnlRteRate}"
        , rpir02:"${obj.wartRteRate}"
        , rpir03:"${obj.incRteRate}"
        , rpir04:"${obj.intRteRate}"
        , rpir05:"${obj.rwrkRteRate}"
    });
</c:forEach>

//수불공임편집여부 Array
var lbrHmEditYnValue = "";
<c:forEach var="obj" items="${lbrHmEditYnCdList}">
    <c:if test="${obj.remark10 eq 'default'}">
    lbrHmEditYnValue = "${obj.cmmCd}";
    </c:if>
</c:forEach>

$(document).ready(function(){

    var editYn = true;
    if(preFixTp == "ROSTATUS"){
        editYn = false;
    }

    var lbrTpChkYn = true;
    var preLbrTp = "";

    var reHiddenColYn = (preFixId == "RE") ? true : false;
    // 정비 그리드
    $("#lbrGrid").kendoExtGrid({
        gridId:lbrGridId
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cmm/tabInfo/selectServiceLabors.do'/>"
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
                        params["sPreFixId"] = lbrPreFixId;
                        params["sDocNo"] = lbrDocNo;
                        if( dms.string.isNotEmpty(ltsModelCd)){
                            params["sLtsModelCd"] = ltsModelCd;
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
                        rnum:{type:"number", editable:false}
                        ,roTp:{type:"string", validation:{required:true}}
                        ,dlrCd:{type:"string", editable:false}
                        ,lbrCd:{type:"string", editable:false}
                        ,lbrNm:{type:"string" ,validation:{required:true}}
                        ,crNo:{type:"string", editable:false}
                        ,crTp:{type:"string", editable:false}
                        ,crNm:{type:"string", editable:false}
                        ,paymCd:{type:"string"}
                        ,paymTp:{type:"string"}
                        ,paymUsrNm:{type:"string"}
                        ,pkgItemCd:{type:"string", editable:false}
                        ,lbrTp:{type:"string"}
                        ,lbrPrc:{type:"number"}
                        ,lbrHm:{type:"number"}
                        ,lbrQty:{type:"number"}
                        ,lbrAmt:{type:"number"}
                        ,lbrTotAmt:{type:"number"}
                        ,dstbHm:{type:"number"}
                        ,dstinCd:{type:"string"}
                        ,diffVal:{type:"number"}
                        ,lbrCnt:{type:"number"}
                        ,serCnt:{type:"number"}
                        ,realTecNm:{type:"string", editable:false}
                        ,wkgrpNm:{type:"string", editable:false}
                        ,bayNm:{type:"string", editable:false}
                    }
                }
            }
        }
        ,height:180
        ,pageable:false
        ,autoBind:false
        ,sortable:false
        ,editable:editYn
        ,filterable:false
        ,editable:{
            confirmation:false
        }
        ,resizable:false
        ,selectable:"row"
        ,edit:function(e){

            var fieldName = $(e.container.find("input")[1]).attr("name");
            var fieldName2 = $(e.container.find("input")[0]).attr("name");

            var roTp = "01";
            if($("#roTp").val() != undefined){
                roTp = $("#roTp").val();      //RO 유형 코드
            }

            if(preFixTp == "ROSTATUS"){
                this.closeCell();
            }

            var grid = $("#lbrGrid").data("kendoExtGrid");//.dataSource._data;
            var selectedVal = grid.dataItem(grid.select());

            var editRateYn = false;
            var lbrTpYn = false;

            if(roTp == "02" ){ //보증일경우

                if((dms.string.isNotEmpty(selectedVal.crNo) && selectedVal.dstinCd == "H" )){
                    editRateYn = true;
                }else{
                    if(selectedVal.dstinCd == "G"){

                        editRateYn = (fieldName == "lbrPrc" ||
                                  fieldName == "lbrHm"
                                 ) ? false : true;
                    }else{
                        editRateYn = (
                                fieldName == "lbrTotAmt" ||
                                fieldName == "lbrPrc" ||
                                fieldName == "lbrAmt" ||
                                fieldName == "lbrHm"
                        ) ? true : false;
                    }
                }
            } else {
                if(preFixId == "CA"){
                     editRateYn = (fieldName == "lbrTotAmt" ||
                              fieldName == "lbrPrc" ||
                              fieldName == "lbrHm" ||
                              fieldName == "lbrAmt"  ) ? true : false;
                }else{
                     editRateYn = (fieldName == "lbrTotAmt" ||
                              fieldName == "lbrPrc" ||
                              fieldName == "lbrAmt"  ) ? true : false;
                }

               if((fieldName == "lbrHm") && lbrHmEditYnValue == "N"){ // 수불공임 수정 가능
                   editRateYn = true;
               }
            }
            if(editRateYn){
                this.closeCell();
            }

            if(fieldName == "dstbHm"){
                this.closeCell();
            }

            if(!lbrDcRateEditable){
                if(fieldName == "dcRate" || fieldName == "dcAmt"){
                    this.closeCell();
                }
            }

            if(fieldName2 == "paymCd" || fieldName2 == "paymUsrNm"){
                this.closeCell();
            }

            if(selectedVal.dstinCd == "D" && dms.string.isEmpty(selectedVal.crNo) ){
                lbrTpYn = false;
            }else{
                lbrTpYn = true;
            }

            if(preFixId != "CA" && preFixId != "RO" && preFixId != "ET"  && preFixId != "PRC"){
                if(fieldName2 == "paymTp"){
                    this.closeCell();
                }
            }else{
                if(fieldName2 == "paymTp" && roTp == "02"){
                    this.closeCell();
                }
            }

            if(preFixId == "RE" || lbrTpYn){
                if(fieldName2 == "lbrTp"){
                    this.closeCell();
                }
            }

            if(preFixId != "ET" || roTp == "02" ){
                if(fieldName2 == "lbrNm"){
                    this.closeCell();
                }
            }

        }
        ,dataBound:function(e){
            lbrDcRateEditable = false;  // 할인율, 할인금액 EDIT 할수 없게
            if(preFixTp != "PAE"){  // 부품견적이 아닐때만

                var roTpCd;
                if(preFixId == "RE"){   // 예약접수
                    roTpCd = "01";
                } else if(preFixId == "PRC") {  // 정비미리점검
                    roTpCd = $("#preRoTp").data("kendoExtDropDownList").value();
                } else if(preFixId == "RES") {  // 구원서비스
                    roTpCd = "01";
                } else if(preFixId == "CA") {
                    roTpCd = $("#roTp").val();
                } else {
                    if($("#roTp").data("kendoExtDropDownList")  == undefined){
                        roTpCd = "01";
                    }else{
                        roTpCd = $("#roTp").data("kendoExtDropDownList").value();      //RO 유형 코드
                    }
                }

                //법인 캠페인 인경우 RO유형 diable
                var lbrGridData = $("#lbrGrid").data("kendoExtGrid").dataSource._data;
                var crNoCnt = 0;
                var expcChkYn = false;
                $.each(lbrGridData , function(i , lbr){
                    if(i == 0){
                        if(roTpCd == "03"){
                            insCmpCd = lbr.paymCd;
                            insCmpNm = lbr.paymUsrNm;
                        }
                    }

                    if(roTpCd == "05" && preFixId == "RO" && dms.string.isEmpty($("#roDocNo").val())){
                        lbr.set("paymTp", "05");
                        lbr.set("paymCd", "${dlrCd}");
                        lbr.set("paymUsrNm", "${dlrNm}");
                    }

                    if(dms.string.isNotEmpty(lbr.crNo) && lbr.dstinCd == "H"){
                        crNoCnt++;
                        if( ($("#roTp").val() != undefined )  && ( preFixId == "RO" || preFixId == "ET" || preFixId == "PRC" ) ){
                            $("#roTp").data("kendoExtDropDownList").enable(false);
                        }
                    }
                    changeLbrTpList(roTpCd,lbr.dstinCd);

                    // 공임코드가 BHB0001R 인경우에만 정비예정일자, 예정주행거리값을 세팅한다.
                    if(lbr.lbrCd == "BHB0001R"){
                        expcChkYn = true;
                    }
                });
                if(crNoCnt == 0) {
                    if( ($("#roTp").val() != undefined  && ( preFixId == "RO" || preFixId == "ET" || preFixId == "PRC" )) ){
                        $("#roTp").data("kendoExtDropDownList").enable(true);
                    }
                }

                if(preFixId == "RO"){
                    var chgExpcDlDtViewYn = false;
                    $.each(lbrGridData , function(i , lbr){
                        if(lbr.wrkStatCd == "03"){
                            chgExpcDlDtViewYn = true;
                            return false;
                        }
                    });
                    if(chgExpcDlDtViewYn){
                        $("#chgExpcDlDt").val(kendo.toString(kendo.parseDate($("#chgExpcDlDtHidden").val()) , "<dms:configValue code='dateFormat' /> HH:mm"));
                    } else {
                        $("#chgExpcDlDt").val("");
                    }
                }

                if(preFixId == "CA") {
                    if(expcChkYn){
                        var expcChkDt = kendo.parseDate("${sysDate}");
                        expcChkDt.setMonth(expcChkDt.getMonth() + Number($("#nextFreeMonth").val()));
                        $("#expcChkDt").data("kendoExtMaskedDatePicker").value(expcChkDt);

                        var expcChkRunDistVal = $("#giRunDistVal").data("kendoExtNumericTextBox").value() + Number($("#nextFreeRunDistVal").val());
                        if(isTablet == "true")expcChkRunDistVal = Number($("#runDistValTablet").val())+Number($("#nextFreeRunDistVal").val());//khs
                        $("#expcChkRunDistVal").data("kendoExtNumericTextBox").value(expcChkRunDistVal);
                    }
                }
            }

            if(preFixId == "CA" || preFixId == "RO" || preFixId == "ET"  || preFixId == "PRC" ){
                setPaymTpList(roTpCd);
            }
        }
        ,columns:[
              {field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100 , hidden:true
                 ,template:"#=roTpCdGrid(roTp)#"
                 ,editor:function(container, options){
                     $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                     .appendTo(container)
                     .kendoExtDropDownList({
                         dataTextField:"cmmCdNm"
                         ,dataValueField:"cmmCd"
                         ,dataSource:roTpCdList
                     });
                 }
             }   // RO유형
            ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100}// 공임코드
            ,{field:"lbrNm", title:"<spring:message code='ser.lbl.rpirNm' />", width:200
                ,editor:function(container, options) {
                    $('<input required type="text" name="lbrNm" data-name="<spring:message code="ser.lbl.rpirNm" />" data-bind="value:' + options.field + '"  maxLength="200" class="form_input"  />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="lbrNm"></span>')
                    .appendTo(container);
                 }
             }// 공임명
            ,{field:"lbrTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=lbrTpCdGrid(lbrTp)#"
                ,editor:function(container, options){
                    $('<input required name="lbrTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:lbrTpCdList
                        ,change:function(){

                            var selectVal = this.value();

                            lbrTpChkYn = setLbrTp(preLbrTp);

                            if(lbrTpChkYn){
                                var roTpCd;

                                if(preFixId == "RE"){   // 예약접수
                                    roTpCd = "01";
                                } else if(preFixId == "PRC") {  // 정비미리점검
                                    roTpCd = $("#preRoTp").data("kendoExtDropDownList").value();
                                } else if(preFixId == "RES") {  // 구원서비스
                                    roTpCd = "01";
                                } else {
                                    roTpCd = $("#roTp").data("kendoExtDropDownList").value();      //RO 유형 코드
                                }

                                var lbrAmt = 0;
                                var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));
                                var lbrTp = (lbrRowData != null) ? dms.string.defaultString(lbrRowData.lbrTp, "01") :"01";

                                /** 임률 함수 serviceJs.setRpirRate(임률공통코드 , "RO유형" , "수리유형" ); **/
                                //var lbrRate = serviceJs.setRpirRate(rateList, roTpCd, lbrTp);

                                $.each(getLbrData() , function(i , gridData){
                                    var lbrTp = dms.string.defaultString(gridData.lbrTp, "01");
                                    var lbrPrc = Number(serviceJs.setRpirRate(rateList, roTpCd, lbrTp));
                                    var lbrAmt = Number((gridData.lbrQty * gridData.lbrHm * lbrPrc).toFixed(2));
                                    gridData.set("lbrPrc", lbrPrc);
                                    gridData.set("lbrTotAmt", lbrAmt);
                                    gridData.set("lbrAmt", lbrAmt);
                                });

                                setLaborAmt(lbrRowData,"Amt");

                            }
                        }
                        ,select:function(e){
                            preLbrTp = this.value();
                        }

                    });
                }
            } // 공임유형(정비유형)
            ,{field:"lbrHm", title:"<spring:message code='ser.lbl.rpirDt' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input required name="lbrHm" data-name="<spring:message code="ser.lbl.lbrHm" />" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                         min:0.00
                        ,max:9999999
                        ,spinners:false
                        ,change:function(){
                            var lbrAmt = 0;
                            var totLbrHm = 0;
                            var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));

                            setLaborAmt(lbrRowData,"Rate");
                            if(preFixId == "RO"){
                                $.each(getLbrData() , function(i , gridData){
                                    totLbrHm += gridData.lbrHm;
                                });
                                setExpcDlDt(totLbrHm);
                                lbrRowData.set("dstbHm", lbrRowData.lbrHm);
                            }
                        }
                    });
                }
            } // 수리시간
            ,{field:"lbrPrc", title:"<spring:message code='ser.lbl.lbrPrc' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="lbrPrc" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0.00
                        ,max:100000
                        ,decimals:0
                        ,spinners:false
                        ,change:function(){
                            var lbrAmt = 0;
                            var totLbrHm = 0;
                            var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));

                            setLaborAmt(lbrRowData,"Amt");

                            if(preFixId == "RO"){
                                $.each(getLbrData() , function(i , gridData){
                                    totLbrHm += gridData.lbrHm;
                                });
                                setExpcDlDt(totLbrHm);
                            }
                        }
                    });
                }
            }// 공임단가
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.confirmLbrAmt' />", width:100, attributes:{"class":"ar"}, format:"{0:n2}"}       // 공임금액
            ,{field:"dcRate", title:"<spring:message code='ser.lbl.dcRate' />", width:100 , attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input name="dcRate" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0.00
                        ,max:lbrDcRateMax
                        ,spinners:false
                        ,change : function(){
                            var lbrAmt = 0;
                            var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));
                            setLaborAmt(lbrRowData,"Rate");
                            lbrDcRateEditable = true;
                        }
                    });
                }
            }        // 할인율
            ,{field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:function(container, options){
                    $('<input name="dcAmt" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        min:0.00
                        ,max:lbrDcAmtMax
                        ,spinners:false
                        ,change:function(){
                            var lbrAmt = 0;
                            var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));
                            setLaborAmt(lbrRowData,"Amt");
                            lbrDcRateEditable = true;
                        }
                    });
                }
            } // 할인금액
            ,{field:"lbrTotAmt", title:"<spring:message code='ser.lbl.lbrCamt' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,template:function(data){
                    changeTotalAmt();
                    var lbrTotAmt = 0;
                    if(data.lbrTotAmt != null){
                        lbrTotAmt = data.lbrTotAmt;
                    }
                    return dms.string.addThousandSeparatorCommas(Number(lbrTotAmt).toFixed(2));
                }
            }  // 공임비
            ,{field:"paymTp", title:"<spring:message code='ser.lbl.payTp' />", width:100, attributes:{"class":"ac"}
                ,template:"#=paymTpCdGrid(paymTp)#"
                ,editor:function(container, options){
                    $('<input required name="paymTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:paymTpCdList
                        ,change:function(e){
                            var grid = $("#lbrGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());
                            chagePayTp(grid, "lbr", "N");
                        }
                    });
                }
                ,hidden :reHiddenColYn
            }// 결제유형
            ,{field:"paymCd", title:"<spring:message code='ser.lbl.payerCd' />", width:100
                ,editor:function(container, options) {
                    var grid = $("#lbrGrid").data("kendoExtGrid");
                    var selectedVal = grid.dataItem(grid.select());
                    var innerHtml = '';
                    if(selectedVal.paymTp == "02"|| selectedVal.paymTp == "03"){
                        innerHtml += '<div class="form_search">';
                        innerHtml += '<input type="text" name="paymCd" class="form_input"  readonly="true"/>';
                        innerHtml += '<a href="#" onclick="insuLbrPopup()" >&nbsp;</a></div>';
                    }else{
                        innerHtml += '<input type="text" name="paymCd" class="form_input" readonly="true" />';
                    }
                    $(innerHtml)
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="paymCd"></span>')
                    .appendTo(container);
                 }
                ,hidden :reHiddenColYn
            } // 지불자코드
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payer' />", width:100 ,hidden :reHiddenColYn}// 지불자
            ,{field:"subBpCd", title:"<spring:message code='ser.lbl.checkCd' />", width:100
                ,editor:function(container, options) {
                    $('<input type="text" name="subBpCd" maxLength="10" class="form_input"  />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="subBpCd"></span>')
                    .appendTo(container);
                 }
            }// 점검코드
            ,{field:"subBpNm", title:"<spring:message code='ser.lbl.custReqCd' />", width:100
                ,editor:function(container, options) {
                    $('<input type="text" name="subBpNm" maxLength="10" class="form_input"  />')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="subBpNm"></span>')
                    .appendTo(container);
                 }
            }// 점검명
            ,{field:"phenCd", title:"<spring:message code='ser.lbl.phenCd' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="phenCd" data-name="<spring:message code='ser.lbl.phenCd'/>" class="form_input" readonly="true" /><a href="#" onclick="phenCauAdd(1)" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="phenCd"></span>')
                    .appendTo(container);
                 }
            }    //현상코드
            ,{field:"cauCd", title:"<spring:message code='ser.lbl.cauCd' />", width:100
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="cauCd" data-name="<spring:message code='ser.lbl.cauCd'/>" class="form_input" readonly="true" /><a href="#" onclick="phenCauAdd(1)" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="cauCd"></span>')
                    .appendTo(container);
                 }
            }      //원인코드
            ,{field:"pkgItemCd", title:"<spring:message code='global.lbl.pkgItemCd' />", width:100}// 패키지코드
            ,{field:"crNo", title:"<spring:message code='ser.lbl.crNo' />", width:100 ,hidden :reHiddenColYn}    // 캠페인번호
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
                 }
                ,hidden :reHiddenColYn
            }   // 캠페인유형
            ,{field:"crNm", title:"<spring:message code='ser.lbl.crNm' />", width:100,hidden :reHiddenColYn}    // 캠페인명
            ,{field:"dstbHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:100
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
            }// 배분공임
            ,{field:"serCnt", title:"<spring:message code='ser.lbl.serCnt' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}// 정비건수
            ,{field:"diffVal", title:"<spring:message code='ser.lbl.difcDegree' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,hidden :reHiddenColYn
            }// 난의도계수
            ,{field:"lbrCnt", title:"<spring:message code='ser.lbl.rpipHmDegree' />", width:100, attributes:{"class":"ar"}
                ,format:"{0:n0}"
                ,hidden:true
            }// 공임계수
            ,{field:"realTecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:100 ,hidden :reHiddenColYn}// 테크니션
            ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:100 ,hidden :reHiddenColYn}// 정비소조
            ,{field:"bayNm", title:"<spring:message code='ser.lbl.bayNm' />", width:100 ,hidden :reHiddenColYn}// BAY 번호
            ,{field:"paymUsrNm", title:"<spring:message code='ser.lbl.payerNm' />", width:100, hidden:true}// 결제자
            ,{field:"payCmpNm", title:"<spring:message code='ser.lbl.payCmpNm' />", width:100, hidden:true}// 지불사
            ,{field:"lbrOrgHm", title:"lbrOrgHm", width:100, hidden:true}
            ,{field:"dstinCd", title:"dstinCd", width:100, hidden:true}
            ,{field:"lbrQty",title:"<spring:message code='ser.lbl.qty' />", width:100, attributes:{"class":"ar"} , hidden: true
                ,format:"{0:n0}"
                ,editor:function(container, options){
                    $('<input required name="lbrQty" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                        ,decimals:0                // 소숫점
                        ,min:1
                        ,value:0
                        ,spinners:false
                        ,change:function(){
                            var lbrAmt = 0;
                            var lbrRowData = lbrGrid.dataItem(this.element.closest("tr"));

                            setLaborAmt(lbrRowData,"Amt");

                        }
                    });
                    $('<span class="k-invalid-msg" data-for="lbrQty"></span>').appendTo(container);
                }
            }// 정비수량
        ]
    });

    var lbrGrid = $("#lbrGrid").data("kendoExtGrid");

    // 공임 삭제
    $("#lbrDel").kendoButton({
        click:function(e) {

            var row = lbrGrid.select();
            var dataItem = lbrGrid.dataItem(row);
            // 작업시작, 작업완료
            if(dataItem.wrkStatCd == "03" || dataItem.wrkStatCd == "05"){
                dms.notification.info("<spring:message code='ser.info.notDelLbrCd' arguments='" + dataItem.lbrNm + "' />");
                return false;
            }
            lbrGrid.removeRow(row);
            changeTotalAmt();
        }
        ,enable:false
    });


    // 정비 팝업
    $("#lbrAdd").kendoButton({
        click:function(e)
        {

            var roTp = "";
            var goodwillYn = "";
            if( ( $("#preRoTp").val() != undefined ) || ($("#roTp").val() != undefined)){
                if($("#roTp").val() == undefined){
                    if($("#preRoTp").val() == undefined ){
                        roTp =  $("#preRoTp").data("kendoExtDropDownList").value();   //RO 유형 코드
                    }else{
                        roTp = "01";
                    }
                }else {
                    if($("#roTp").val() != undefined ){
                          roTp = $("#roTp").data("kendoExtDropDownList").value();      //RO 유형 코드
                          if(preFixId == "RO" && roTp == "02"){
                              goodwillYn = $("#goodwillYn").data("kendoExtDropDownList").value();
                          }
                    }else if($("#preRoTp").val() != undefined ){
                        roTp =  $("#preRoTp").data("kendoExtDropDownList").value();   //RO 유형 코드
                    }else{
                        roTp = "01";
                    }
                }

                if( dms.string.isEmpty(roTp) ){ //global.info.validation.pattern
                    dms.notification.warning( "<spring:message code='ser.lbl.roTp' var='roTp' />"+
                                              "<spring:message code='global.info.validation.select' arguments='${roTp}' />");
                    $("#roTp").focus();
                    return false;
                }
            }

            var _selectable;
            if(isTablet == true || isTablet == "true"){
                _selectable="row";
            }else{
                _selectable="multiple";
            }

            // 공임 팝업 열기 함수.
            laborSearchPopup = dms.window.popup({
                windowId:"partsMasterPopup"
                ,height:420 //400 khs
                ,modal:true
                ,title:"<spring:message code='ser.lbl.lbrNm' />"
                ,content:{
                    url:"<c:url value='/ser/cmm/popup/selectLaborCodePopup.do'/>"
                    ,data:{
                        "autoBind":false
                        ,"selectable":_selectable
                        ,"sRoTp": roTp
                        ,"sGoodwillYn":goodwillYn
                        ,"sLtsModelCd":$("#ltsModelCd").val()
                        ,"callbackFunc":function(lbrData){
                            if(lbrData.length > 0) {
                                lbrAdd(lbrData, "N");
                            }
                        }
                    }
                }
            });
        }
        ,enable:false
    });

    var campaignResult = true;
    lbrCampaignAdd = function(jsonLbrObj,jsonPartObj, campaignYn){

        var partGridData = $("#partGrid").data("kendoExtGrid").dataSource._data;
        var giQtyYn = false;

        var roTpCd = "02";
        if(preFixId == "RE" || preFixId == "PRC" || preFixId == "RES"){
            roTpCd = "02";
        } else if(preFixId == "CA") {
            return false;
        } else {
            roTpCd = $("#roTp").data("kendoExtDropDownList").value();      //RO 유형 코드
        }

        if(partGridData.length > 0){
            $.each(partGridData , function(i , obj){
                if(obj.giQty > 0 ){
                    giQtyYn = true;
                }
            });
            if(giQtyYn){
                dms.notification.info("<spring:message code='ser.info.reqPartsChk'  />");
                return false;
            }else {

                if(roTpCd != "02"){

                    $("#messageId").html("<spring:message code='ser.info.deletePartsAndNew' />");
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();

                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){

                            conformKendoWindow.close();
                            $("#partGrid").data("kendoExtGrid").dataSource.data([]);
                            lbrAdd(jsonLbrObj ,campaignYn );
                            if(campaignResult){
                                partsAdd(jsonPartObj, "Y");
                            }
                        }else{
                            conformKendoWindow.close();
                            return false;
                        }
                    }).end();
                }else{
                    lbrAdd(jsonLbrObj ,campaignYn );
                    if(campaignResult){
                        partsAdd(jsonPartObj, "Y");
                    }
                }
            }
         }else{
            lbrAdd(jsonLbrObj ,campaignYn );
            if(campaignResult){
                partsAdd(jsonPartObj, "Y");
            }
         }
    };

    // 공임추가 공통
    lbrAdd = function(jsonObj, campaignYn){

        $.each(jsonObj, function(idx, data){

            var copyData;
            var checkVal = true;
            campaignResult = true;

            var campaignCnt = 0; // 그리드이 캠페인 입력된 갯수
            var popTzCdCnt  = 0; // 공임팝업에서 선택한 TT,ZZ CODE 수
            var gridTzCnt   = 0;    //그리드에 입력된 TT,ZZ 코드 수
            var pupLbrCd    = data.lbrCd; //팝업 공임 코드
            var popDstinCd  = data.dstinCd;


            var totLbrHm = 0;


            // 중복값 체크
            $.each(getLbrData(), function(idx, obj){
                var gridLbrCd = obj.lbrCd; //그리드 공임 코드
                var dstinCd   = obj.dstinCd;

                if(data.lbrCd == obj.lbrCd){
                    checkVal = false;
                }

                if(campaignYn == "Y"){
                  // 딜러 및 법인 캠페인은 1개만 입력 가능
                    if(dms.string.isNotEmpty(obj.crNo)){
                        if(data.dstinCd != obj.dstinCd){
                            campaignCnt++;
                        }
                    }
                    if(dms.string.isNotEmpty(data.crNo) && data.dstinCd == "H" ){
                        if(data.crNo == obj.crNo){
                            checkVal = false;
                            campaignResult = false;
                        }
                    }
                }

                totLbrHm += obj.lbrHm;

                if(dstinCd == "Z" ) gridTzCnt++; // TT , ZZ 코드 체크
            });

            //예상인도시간 설정
            if(preFixId == "RO"){
                setExpcDlDt(totLbrHm);
            }

            if(dms.string.isNotEmpty(data.crNo)){
                if(campaignCnt > 0 ){
                    checkVal = false;
                    campaignResult = false;
                    dms.notification.warning("<spring:message code='ser.lbl.chkSameCampaing'  />");
                    return false;
                }
            }

            var lbrRate = data.lbrRate;
            var roTpCd = "01";
            // 동일 캠페인 재선택시 ro유형이 일반으로 변경 되어 checkVal 조건 제거
            //var wartRoTp = (campaignYn == "Y" && data.dstinCd == "H" && (checkVal)) ? true : false;
            var wartRoTp = (campaignYn == "Y" && data.dstinCd == "H") ? true : false;

            if(preFixId == "RE"){   // 예약접수
                roTpCd = (wartRoTp) ? "02" : (campaignYn == "Y") ? "01" : roTpCd;
            } else if(preFixId == "PRC") {  // 정비미리점검
                roTpCd = $("#preRoTp").data("kendoExtDropDownList").value();
                roTpCd = (wartRoTp) ? "02" : (campaignYn == "Y") ? "01" : roTpCd;
                $("#preRoTp").data("kendoExtDropDownList").value(roTpCd);
                if(wartRoTp){
                    $("#preRoTp").data("kendoExtDropDownList").enable((roTpCd == "02") ? false :true);
                }
            } else if(preFixId == "RES") {  // 구원서비스
                roTpCd = "01";
            } else {
                roTpCd = $("#roTp").data("kendoExtDropDownList").value();      //RO 유형 코드
                roTpCd = (wartRoTp) ? "02" : (campaignYn == "Y") ? "01" : roTpCd;
                // RO유형이 변경되는 경우
                if($("#roTp").data("kendoExtDropDownList").value() != roTpCd){
                    $("#roTp").data("kendoExtDropDownList").value(roTpCd);
                    $("#roTp").data("kendoExtDropDownList").trigger("change");
                }

                if(wartRoTp){
                    $("#roTp").data("kendoExtDropDownList").enable((roTpCd == "02") ? false :true);
                }
            }

            // ZZ CODE , TT CODE 는 1개만 입력 가능하게 체크
            if(popDstinCd == "Z" ) popTzCdCnt++;
            if( (gridTzCnt >= 1 && popTzCdCnt > 0) &&
                    (popDstinCd == "Z" )) checkVal = false;
            if(popDstinCd == "Z") lbrRate = 0;

            var lbrTp = dms.string.isEmpty(data.lbrTp) ? "01" : data.lbrTp;

            var paymTp;
            var paymCd;
            var paymUsrNm;
            //결제유형 : 01 보증 , 02 보험 , 03 기타고객 , 04 고객 , 05 딜러
            //RO유형   : 01 일반 , 02 보증 , 03 보험  , 04 내부 , 05 리워크
            if(preFixId == "CA" || preFixId == "RO" || preFixId == "ET" || preFixId == "PRC" ){
                if(roTpCd == "01"){ //일반
                    var custNm = (dms.string.isEmpty($("#carOwnerNm").val()))? $("#driverNm").val() : $("#carOwnerNm").val();
                    var custNo = (dms.string.isEmpty($("#carOwnerId").val()))? $("#driverId").val() : $("#carOwnerId").val();
                    paymTp    = "04";       //기타고객 , 고객
                    paymCd    = custNo;
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
            }

            var lbrTotAmt = Number(data.lbrQty * data.lbrHm * lbrRate).toFixed(2); //공임 예정비
            var lbrAmt = Number(data.lbrAmt).toFixed(2) ; //공임 금액
            var dlrCampaignYn = (campaignYn == "Y" && data.dstinCd == "D") ? true : false;

            if(checkVal) {
                copyData = {
                     roTp:roTpCd
                    ,lbrTp: lbrTp
                    ,lbrCd:data.lbrCd             // 정비코드
                    ,lbrNm:data.lbrNm             // 정비항목
                    ,lbrHm: (roTpCd == "02" ) ? data.lbrHm : Number(dms.string.defaultString(data.payLbrHm,data.lbrHm))          // 공임시간
                    ,lbrPrc:(dlrCampaignYn) ? data.lbrPrc : lbrRate               // 공임단가
                    ,lbrQty: Number(dms.string.defaultString(data.lbrQty ,"1"))         // 공임수량
                    ,dcAmt: (dlrCampaignYn) ? data.dcAmt :  0.00
                    ,dcRate:(dlrCampaignYn) ? data.dcRate : 0.00
                    ,lbrTotAmt: (dlrCampaignYn) ? data.lbrTotAmt : ( (data.lbrHm == 0) ? lbrAmt : lbrTotAmt )
                    ,lbrAmt : (dlrCampaignYn) ? lbrAmt : ( (data.lbrHm == 0) ? lbrAmt : lbrTotAmt )
                    ,pkgItemCd:data.pkgItemCd
                    ,crNo:campaignYn == "Y" ? data.crNo:""
                    ,crNm:campaignYn == "Y" ? data.crNm:""
                    ,crTp:campaignYn == "Y" ? data.crTp:""
                    ,paymTp:paymTp
                    ,paymCd:paymCd
                    ,paymUsrNm:paymUsrNm
                    ,dstbHm:data.allocLbrHm
                    ,dstinCd:data.dstinCd
                    ,lbrOrgHm:data.lbrHm             // 보증공임시간
                };
                lbrGrid.dataSource.add(copyData);
            }

            if(dlrCampaignYn || campaignYn != "Y"){
                var roTpCd;

                if(preFixId == "RE"){   // 예약접수
                    roTpCd = "01";
                } else if(preFixId == "PRC") {  // 정비미리점검
                    roTpCd = $("#preRoTp").data("kendoExtDropDownList").value();
                } else if(preFixId == "RES") {  // 구원서비스
                    roTpCd = "01";
                } else {
                    roTpCd = $("#roTp").data("kendoExtDropDownList").value();      //RO 유형 코드
                }

                var selectedVal = lbrGrid.dataItem(lbrGrid.select());
                var lbrTp = (selectedVal != null) ? dms.string.defaultString(selectedVal.lbrTp, "01") :"01";

                /** 임률 함수 serviceJs.setRpirRate(임률공통코드 , "RO유형" , "수리유형" ); **/
                //var lbrRate = serviceJs.setRpirRate(rateList, roTpCd, lbrTp);

                if(!dlrCampaignYn){
                    $.each(getLbrData() , function(i , gridData){
                        //ZZ CODE 는 금액을 0으로 처리하고 외주금액 필드에 입력
                        var lbrCd =  gridData.lbrCd.substring(gridData.lbrCd.length-2 , gridData.lbrCd.length); // 공임코드 뒷2 자리
                        var zzCodeYn = (roTpCd == "02" && lbrCd == "ZZ") ? true : false;

                        var lbrTp = dms.string.defaultString(gridData.lbrTp, "01");
                        var lbrPrc = Number(serviceJs.setRpirRate(rateList, roTpCd, lbrTp));
                        var lbrAmt = Number(gridData.lbrQty * gridData.lbrHm * lbrPrc).toFixed(2);

                        gridData.set("lbrPrc", (zzCodeYn) ? 0 : lbrPrc);
                        gridData.set("lbrAmt", (zzCodeYn) ? 0 :  lbrAmt);
                        gridData.set("lbrTotAmt", (zzCodeYn) ? 0 :  lbrAmt);
                    });
                }

                paymTpDataRstl(roTpCd);

                lbrDlrDcSet();
                changeTotalAmt();
            }
        });
    };

    // 딜러할인율 적용(그리드 리스트용)
    lbrDlrDcSet = function(){
        var serDlrLbrDcRate = Number($("#serDlrLbrDcRate").data("kendoExtNumericTextBox").value()).toFixed(2);

        if(serDlrLbrDcRate > 0){
            $.each(getLbrData() , function(i , gridData){
                if(this.paymTp == "04"){
                    var dcCalRate = ((serDlrLbrDcRate / 100) ).toFixed(2);
                    var lbrTotAmt = (this.lbrAmt * (1-dcCalRate)).toFixed(2);
                    var dcAmt = (this.lbrAmt - lbrTotAmt).toFixed(2);

                    gridData.set("dcRate", serDlrLbrDcRate);
                    gridData.set("dcAmt", dcAmt);
                    gridData.set("lbrTotAmt", lbrTotAmt);
                } else {
                    gridData.set("dcRate", 0.00);
                    gridData.set("dcAmt", 0.00);
                    gridData.set("lbrTotAmt", this.lbrAmt);
                }
            });
        }
    }

    // 딜러할인율 적용
    lbrDlrDcSetByItem = function(){
        var serDlrLbrDcRate = Number($("#serDlrLbrDcRate").data("kendoExtNumericTextBox").value()).toFixed(2);

        if(serDlrLbrDcRate > 0){
            var grid = $("#lbrGrid").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());

            if(selectedVal.paymTp == "04"){
                var dcCalRate = ((serDlrLbrDcRate / 100) ).toFixed(2);
                var lbrTotAmt = (selectedVal.lbrAmt * (1-dcCalRate)).toFixed(2);
                var dcAmt = (selectedVal.lbrAmt - lbrTotAmt).toFixed(2);

                selectedVal.set("dcRate", serDlrLbrDcRate);
                selectedVal.set("dcAmt", dcAmt);
                selectedVal.set("lbrTotAmt", lbrTotAmt);
            } else {
                selectedVal.set("dcRate", 0.00);
                selectedVal.set("dcAmt", 0.00);
                selectedVal.set("lbrTotAmt", selectedVal.lbrAmt);
            }
        }
    }

    // 서비스알람 칸반에서 공임추가
    lbrSerAlramAdd = function(jsonObj,sPreFixId){

        var lbrDataItem = lbrGrid.dataSource._data;
        var roTpVal = $("#roTp").val();
        var partGrid = $("#partGrid").data("kendoExtGrid");
        var preRoTp = "";
        if(jsonObj.total > 0){
            $.each(jsonObj.data, function(idx, data){

                var copyData;
                var checkVal = true;

                // 중복값 체크
                $.each(lbrDataItem, function(idx, obj){
                    if(data.lbrCd == obj.lbrCd){
                        checkVal = false;
                    }
                });

                if(checkVal) {
                    lbrGrid.dataSource.add(data);
                    preRoTp = roTpVal;
                    setChangeRoTpValue(roTpVal,preRoTp);
                    paymTpDataRstl(roTpVal);
                    if(preFixId == "RO"){
                        roTpChangeSet(roTpVal);
                        if(!chkRsultYn){
                            if(sPreFixId == "RE"){
                                //lbrGrid.dataSource.data([]);
                                //partGrid.dataSource.data([]);
                                $("#resvDocNo").val("");
                            }
                        }
                    }
                    changeTotalAmt();
                }
            });
        }
    };

    //임률 가격 변경
    changeRateAmt = function(chgType){

        var roTpCd;

        if(preFixId == "RE"){   // 예약접수
            roTpCd = "01";
        } else if(preFixId == "PRC") {  // 정비미리점검
            roTpCd = $("#preRoTp").data("kendoExtDropDownList").value();
        } else if(preFixId == "RES") {  // 구원서비스
            roTpCd = "01";
        } else {
            roTpCd = $("#roTp").data("kendoExtDropDownList").value();      //RO 유형 코드
        }

        var selectedVal = lbrGrid.dataItem(lbrGrid.select());
        var lbrTp = (selectedVal != null) ? dms.string.defaultString(selectedVal.lbrTp, "01") :"01";

        /** 임률 함수 serviceJs.setRpirRate(임률공통코드 , "RO유형" , "수리유형" ); **/
        //var lbrRate = serviceJs.setRpirRate(rateList, roTpCd, lbrTp);

        $.each(getLbrData() , function(i , gridData){
          //ZZ CODE 는 금액을 0으로 처리하고 외주금액 필드에 입력
            var lbrCd =  gridData.lbrCd.substring(gridData.lbrCd.length-2 , gridData.lbrCd.length); // 공임코드 뒷2 자리
            var zzCodeYn = (roTpCd == "02" && lbrCd == "ZZ") ? true : false;

            var lbrTp = dms.string.defaultString(gridData.lbrTp, "01");
            var lbrPrc = Number(serviceJs.setRpirRate(rateList, roTpCd, lbrTp));
            var lbrAmt = Number((gridData.lbrQty * gridData.lbrHm * lbrPrc).toFixed(2));

            gridData.set("lbrPrc", (zzCodeYn) ? 0 : lbrPrc);
            gridData.set("lbrTotAmt", (zzCodeYn) ? 0 : lbrAmt);
            gridData.set("lbrAmt", (zzCodeYn) ? 0 : lbrAmt);
        });

        changeTotalAmt();
    };

    phenCauAdd = function(gridType) {

        phenCauCodeWin = dms.window.popup({
            windowId:"phenCauCodeWin"
            , title:"<spring:message code = 'ser.title.cauPhenSearch'/>"    //
            , template:$("#dstinCd").prop("readOnly", false).addClass("form_readonly")
            //,height:150
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectNcdCcdCodePopup.do'/>"
                , data:{
                     "autoBind":true
                    ,"paintYn":"C"  // paint:P , 원인코드:C
                    ,"itemCd":""
                    , "callbackFunc":function(data){
                        if(data.length > 0)
                        {
                            var grid;
                            if(gridType == 1){
                                grid = $("#lbrGrid").data("kendoExtGrid");
                            }else{
                                grid = $("#partGrid").data("kendoExtGrid");;
                            }
                            var rows = grid.tbody.find("tr");
                            rows.each(function(index, row) {
                                var dataItem = grid.dataSource._data;
                                if($(this).hasClass("k-state-selected")){
                                    dataItem[index].cauCd = data[0].cauCd;
                                    dataItem[index].cauNm = data[0].cauNm;
                                    dataItem[index].phenCd = data[0].phenCd;
                                    dataItem[index].phenNm = data[0].phenNm;
                                    dataItem[index].dirty = true;
                                }
                            });
                            grid.refresh();
                        }
                    }
                }
            }
        });
    };

    setLbrTp = function( preLbrTp ){

        var grid = $("#lbrGrid").data("kendoExtGrid");//.dataSource._data;
        var selectedVal = grid.dataItem(grid.select());

        if( (selectedVal.lbrTp == "03" || selectedVal.lbrTp == "04" ) &&
                selectedVal.dstinCd == "E"){
                dms.notification.warning(lbrTpCdGrid(selectedVal.lbrTp)+"<spring:message code='ser.lbl.bhmcEtcLbrCd' var='bhmcEtcLbrCd' />"+
                          "<spring:message code='ser.info.notSelectLbrTp' arguments='${bhmcEtcLbrCd}' />");
                if( preLbrTp != undefined){
                    selectedVal.set("lbrTp",preLbrTp);
                }
                return false;
         }

        return true;

    };

    lbrInfo = function(docNo, preFixId, ltsCd) {
      lbrPreFixId = preFixId;
      lbrDocNo = docNo;
      ltsModelCd = ltsCd;
      lbrGrid.dataSource.read();
    };

    getLbrData = function() {
        var lbrSaveData = lbrGrid.dataSource.data();
        return lbrSaveData;
    };

    // RO유형에 따라 정비유형리스트 변경
    changeLbrTpList = function(roTp , dstinCd) {
        if(roTp == "02"){
            lbrTpCdList = lbrTpCdList2;
        }else {
            if(dstinCd == "E"){
                lbrTpCdList = lbrTpCdList4;
            }else{
                lbrTpCdList = lbrTpCdList3;
            }
        }
    };

    //예상인도시간 설정
    setExpcDlDt = function(totLbrHm){
        var addHm = 60000;
        var lbrHm = (totLbrHm*60)+30;
        var expcDlDt = $("#expcDlDt").data("kendoExtMaskedDateTimePicker").value();
        var sysDate = new Date();
       // var sysDate = dms.string.isEmpty(expcDlDt) ? new Date() : expcDlDt;
        var chgDt = new Date(Date.parse(sysDate)+ (lbrHm * addHm ) );
        <% //TODO[권기현] 2016.11.15 업무 확정시 주석제거 %>
        //$("#expcDlDt").data("kendoExtMaskedDateTimePicker").value(chgDt);
    };


    insuLbrPopup = function(){
        var grid = $("#lbrGrid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        selectPaymPopupSearch(selectedVal.paymTp, grid);
    };


    //공임금액 세팅
    setLaborAmt = function(lbrRowData , flag){

        if(lbrRowData != null){

            var lbrHm = Number(lbrRowData.lbrHm);
            var lbrPrc = Number(lbrRowData.lbrPrc);
            var dcAmt = Number(lbrRowData.dcAmt);
            var dcRate = Number(lbrRowData.dcRate);
            var lbrQty = Number(lbrRowData.lbrQty);
            var lbrAmt = Number(lbrQty * lbrHm * lbrPrc).toFixed(2);
            var lbrCalAmt = 0,dcCalRate=0,lbrTotAmt=0,dcCalAmt=0;

            var maxDcAmt = (lbrAmt * (lbrDcRateMax / 100)).toFixed(2);  // 최대할인금액

            if(flag == "Amt"){

                lbrCalAmt = (lbrQty * lbrHm * lbrPrc);
                lbrTotAmt = (lbrCalAmt - dcAmt).toFixed(2);
                dcCalAmt  = dcAmt;
                dcCalRate = Math.abs((lbrTotAmt / lbrCalAmt) -1 ).toFixed(2); // 할인율

                // 할인금액이 최대 할인율을 초과하는경우 최대할인금액으로 돌로 놓는다.
                if(parseFloat(dcCalRate*100) > parseFloat(lbrDcRateMax)){
                    dcCalRate = ((lbrDcRateMax / 100) ).toFixed(2);
                    dcCalAmt  = maxDcAmt;
                    lbrCalAmt = (lbrQty * lbrHm * lbrPrc);
                    lbrTotAmt = (lbrCalAmt - dcCalAmt).toFixed(2);
                }

            }else if(flag == "Rate"){

                lbrCalAmt = (lbrQty * lbrHm * lbrPrc);
                dcCalRate =  ((dcRate / 100) ).toFixed(2); // 할인율
                lbrTotAmt =  (lbrCalAmt * (1-dcCalRate)).toFixed(2);
                dcCalAmt  =  (lbrCalAmt - lbrTotAmt).toFixed(2);
            }

            lbrRowData.set("dcRate", (dcCalRate*100).toFixed(2) );
            lbrRowData.set("dcAmt",  dcCalAmt );
            lbrRowData.set("lbrTotAmt", lbrTotAmt );
            lbrRowData.set("lbrAmt", lbrAmt);

        }
        lbrGrid.refresh();
        changeTotalAmt();   // selectPartList.jsp 에 존재

    };

});

</script>