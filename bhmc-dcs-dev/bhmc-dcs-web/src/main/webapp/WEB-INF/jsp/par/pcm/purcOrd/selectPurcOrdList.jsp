<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">
    <!-- 구매오더목록 -->
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_m_min" id="btnExcelExport" name="btnExcelExport"><spring:message code="par.btn.excelDownload" /></button>
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.dlrCd" /><!-- 딜러코드 --></th>
                        <td>
                            <input id="sDlrCd" class="form_input">
                            <input type="text" id="sBpNm" class="form_input form_readonly hidden" readonly/>
                            <input type="text" id="sBpCd" class="form_input hidden"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dlrNm" /><!-- 딜러명 --></th>
                        <td>
                            <input id="sDlrNm" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bmpOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sBmpOrdNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 딜러오더번호 --></th>
                        <td>
                            <input id="sPurcOrdNo" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.ordReqDt" /><!-- 구매오더일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPurcRegDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPurcRegDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                        </td>
                        <th style="display:none;" scope="row"><spring:message code='sal.lbl.sdpt' /></th> <!-- 사업부 -->
	                    <td  style="display:none;">
	                        <input id="sDivision" type="text" class="form_comboBox">
	                    </td>
	
	                    <th style="display:none;" scope="row"><spring:message code='sal.lbl.officeNm' /></th> <!-- 사무소 -->
	                    <td style="display:none;">
	                        <input id="sOffice" type="text" class="form_comboBox">
	                    </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="dataForm" class="mt10">
            <!-- 탭 메뉴 -->
            <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li id="DEPS" class="k-state-active"><spring:message code="par.title.purcOrdDepStatistics" /><!-- 부품구매명세 --></li>
                    <li id="DLRS"><spring:message code="par.title.purcOrdDlrStatistics"/><!-- 부품구매명세 --></li>
                    <li id="HD" ><spring:message code="par.title.purcOrdSumList" /><!-- 부품구매집계 --></li>
                    <li id="DT"><spring:message code="par.title.purcOrdSumListDetail" /><!-- 부품구매명세 --></li>
                </ul>
                <div>
                    <div class="table_grid">
                        <!-- 구매오더명세 그리드 -->
                        <div id="gridDepStatistics" class="resizable_grid"></div>
                    </div>
                </div>
                <div>
                    <div class="table_grid">
                        <!-- 구매오더명세 그리드 -->
                        <div id="gridDlrStatistics" class="resizable_grid"></div>
                    </div>
                </div>
                <div>
                    <div class="table_grid">
                        <!-- 구매오더헤더 그리드 -->
                        <div id="grid" class="resizable_grid"></div>
                    </div>
                </div>
                <div>
                    <div class="table_grid">
                        <!-- 구매오더명세 그리드 -->
                        <div id="gridDetail" class="resizable_grid"></div>
                    </div>
                </div>
                
            </div>
        </div>
    </section>
    <!-- //구매오더 -->
</div>

<!-- script -->
<script>
var popupWindow,
    sessionBpCd = "${bpCd}",
    sessionBpNm = "${bpNm}",
    toDt = "${toDt}",
    sevenDtBf = "${sevenDtBf}",
    rowNumber = 0, //그리드 목록 번호
    purcOrdTpList = [],
    purcOrdTpObj = {},
    trsfTpList = [],
    trsfTpObj = {},
    dlPdcCdList = [],
    dlPdcCdObj = {},
    purcOrdStatList = [],
    purcOrdStatObj = {},
    ammendCodeList = [],
    ammendCodeObj = {},
    purcPgssCdObj = {},
    popItemObj = {},
    selectTabId = "HD";

//purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":"选择取消"});
<c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
    if("${obj.useYn}" !=='N' ){
        purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//오더유형 선택
purcOrdTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
    purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//PDC 창고
dlPdcCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
    dlPdcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//편수코드 선택
ammendCodeList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
ammendCodeObj[""] = "";
<c:forEach var="obj" items="${ammendCodeList}" varStatus="status">
    ammendCodeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ammendCodeObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//운송유형
trsfTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${trsfTpList}" varStatus="status">
    trsfTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//구매오더진행상태 선택
purcPgssCdObj[' '] = "";
<c:forEach var="obj" items="${purcPgssCdList}" varStatus="status">
    purcPgssCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var divisionList = [{"diviNm":"", "diviCd":""}];
<c:forEach var="obj" items="${divisionList}">
divisionList.push({diviNm:"${obj.diviNm}", diviCd:"${obj.diviCd}"});
</c:forEach>

var officeList = [{"offNm":"", "offCd":""}];
<c:forEach var="obj" items="${officeList}">
officeList.push({offNm:"${obj.offNm}", offCd:"${obj.offCd}"});
</c:forEach>

function initPage(){
    var minDate = new Date(sevenDtBf),
        maxDate = new Date(toDt),
        toYY = maxDate.getFullYear(),
        toMM = maxDate.getMonth(),
        toDD = maxDate.getDate(),
        frYY = minDate.getFullYear(),
        frMM = minDate.getFullYear(),
        frDD = minDate.getFullYear();

    //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
    //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    partsJs.validate.groupObjAllDataInit();

    $("#grid").data("kendoExtGrid").dataSource.data([]);
    $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

    $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(new Date(toYY,toMM,toDD));
    $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(new Date(toYY,toMM,toDD));
    $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(toYY,toMM,toDD));

    popItemObj = {};

    /* $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅
    $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅

    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate(); */
}

function fnChkDateValue(e){
    var elmt = e.sender.element[0],
        id = elmt.id,
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

    if(this.value() == null){
        if(id === 'sPurcRegDtFr'){
            var minDate = new Date(sevenDtBf);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value('');
            //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
        }else if(id === 'sPurcRegDtTo'){
            var maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value('');
            //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(9999,12,31));
        }
    }else{
        if(id === 'sPurcRegDtFr'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();
            $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sPurcRegDtTo'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();
            $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
    }
}

// 품목구분 그리드 콤보
function setSumData(val){
    var returnData = Math.round(val * 1000)/1000,
        returnCalData = Math.round(returnData * 100)/100,
        returnVal = kendo.toString(returnData,'n2');

    return returnVal;
};

function chgDate(obj){
    if(!dms.string.isEmpty(obj)){
        if(obj != null && obj != ""){
            var year = obj.substring(0,4);
            var month = obj.substring(4,6);
            var day = obj.substring(6,8);
            var date = year+"-"+month+"-"+day;
            return date;
        }else{
            return null;
        }
    }else{
        return " ";
    }
}

//구매상태
changePurcOrdStat = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = purcOrdStatObj[val];
    }
    return returnVal;
};

//오더유형
changePurcOrdTp = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(purcOrdTpObj[val])){
            returnVal = purcOrdTpObj[val];
        }
    }
    return returnVal;
};

//PDC 창고
changeDlPdcCd = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(dlPdcCdObj[val])){
            returnVal = dlPdcCdObj[val];
        }
    }
    return returnVal;
};

//편수코드
changeEditCd = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(ammendCodeObj[val])){
            returnVal = ammendCodeObj[val];
        }
    }
    return returnVal;
};

// 운송유형
changeTrsfTp = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(trsfTpObj[val])){
            returnVal = trsfTpObj[val];
        }
    }
    return returnVal;
};

// 구매상태
changePurcPgssCd = function(val){
    var returnVal = "";
    if(!dms.string.isEmpty(val)){
        if(!dms.string.isEmpty(purcPgssCdObj[val])){
            returnVal = purcPgssCdObj[val];
        }
    }
    return returnVal;
};

$(document).ready(function() {
	$("#sDivision").kendoExtDropDownList({
        dataTextField:"diviNm"
        ,dataValueField:"diviCd"
        ,dataSource:divisionList
        ,select:onSelectDiviCd
        ,optionLabel:""
        ,index:0
        
    });
	// 조회조건 :  사무소
    $("#sOffice").kendoExtDropDownList({
        dataTextField:"offNm"
        ,dataValueField:"offCd"
        ,dataSource:officeList
        ,optionLabel:" "
        ,index:0
        
    });
	
    function onSelectDiviCd(e) {
        var dataItem = this.dataItem(e.item);
        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/ser/rpt/selectOfficeList.do'/>"
            ,data:JSON.stringify({"sDiviCd":dataItem.diviCd})
            ,async:false
        });

        $("#sOffice").data("kendoExtDropDownList").setDataSource(responseJson.data);
    };
    
    //구매오더상태선택
    $("#sPurcOrdStatCd").kendoExtMultiSelectDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:purcOrdStatList
        ,dataBound:function(){
            var current = this.value();
            this._savedOld = current.slice(0);
        }
        ,select:function(e){
            var selectPurcOrdStatCd = e.dataItem.cmmCd;

            if(dms.string.isEmpty(selectPurcOrdStatCd)){
                $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
            }

        }
    });

    $("#sPurcRegDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    $("#sPurcRegDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    // 초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
            initPage();
        }
    });

    //btnExcelExport
    $("#btnExcelExport").kendoButton({
        click:function(e){

            var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){
                sPurcOrdStatCdLst.splice(0,1);
            }

            if(sPurcOrdStatCdLst.length === 0){
                for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                    sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                }
            }
            //excel export all
            dms.ajax.excelExport({
                "beanName":"purcOrdService"
                ,"templateFile":(selectTabId=="HD")? "PurcOrders_Tpl.xls" : "PurcOrderStatusDetails_Tpl.xls"
                ,"fileName":(selectTabId=="HD")? "PurcOrders_Tpl.xls" : "PurcOrderStatusDetails_Tpl.xls"
                ,"sDlrCd":$("#sDlrCd").val()
                ,"sDlrNm":$("#sDlrNm").val()
                ,"sBmpOrdNo":$("#sBmpOrdNo").val()
                ,"sPurcOrdNo":$("#sPurcOrdNo").val()
                ,"sPurcRegDtFr":$("#sPurcRegDtFr").val()
                ,"sPurcRegDtTo":$("#sPurcRegDtTo").val()
                ,"sPurcOrdStatLst":sPurcOrdStatCdLst
                ,"selectTabId":selectTabId
            });

        }
    });

    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
            $("#gridDetail").data("kendoExtGrid").dataSource.read();
            $("#gridDepStatistics").data("kendoExtGrid").dataSource.read();
            $("#gridDlrStatistics").data("kendoExtGrid").dataSource.read();
            
        }
    });

    //tabstrip
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select: function(e) {
            selectTabId = e.item.id;
        }
    });

    // 구매 헤더 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0728-111301"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/purcOrd/selectPurcOrds.do' />"
                }
                ,parameterMap:function(options, operation){
                    if(operation === "read"){
                        var params = {},
                            sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

                        if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){
                            sPurcOrdStatCdLst.splice(0,1);
                        }

                        if(sPurcOrdStatCdLst.length === 0){
                            for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                                sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                            }
                        }
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 구매오더 검색조건 코드.
                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sDlrNm"] = $("#sDlrNm").val();
                        params["sBmpOrdNo"] = $("#sBmpOrdNo").val();
                        params["sPurcOrdNo"] = $("#sPurcOrdNo").val();
                        params["sPurcRegDtFr"] = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sPurcRegDtTo"] = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                        params["sPurcOrdStatLst"] = sPurcOrdStatCdLst;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                data:function (result){
                    if(result.total === 0){
                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                    }
                    return result.data;
                }
                ,total:"total"
                ,model:{
                    id:"dlrCd"
                    ,fields:{
                        dlrCd:{ type:"string", editable:false }
                        ,dlrNm:{ type:"string", editable:false }
                        ,purcOrdNo:{ type:"string", editable:false }
                        ,bmpOrdNo:{ type:"string", editable:false }
                        ,purcOrdTp:{ type:"string" ,editable:false } //오더유형
                        ,purcOrdStatCd :{ type:"string", editable:false }
                        ,purcRegDt:{ type:"string", editable:false }
                        ,itemCnt:{ type:"number", editable:false }
                        ,totPurcQty:{ type:"number", editable:false }
                        ,totPurcAmt:{ type:"number", editable:false }
                        ,totTaxDdctAmt:{ type:"number", editable:false }
                    }
                }
            }
            /* ,aggregate:[
                { field:"itemCnt", aggregate:"sum" }
                ,{ field:"totPurcQty", aggregate:"sum" }
                ,{ field:"totPurcAmt", aggregate:"sum" }
                ,{ field:"totTaxDdctAmt", aggregate:"sum" }
            ] */
        }
        ,selectable:"row"
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,filterable:false
        ,appendEmptyColumn:true//빈컬럼 적용. default:false
        ,dataBinding:function(e){
            rowNumber = 0;
        }
        ,pageable:{
            refresh:false
            ,pageSize:100
            ,buttonCount:3
            ,input:false
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='par.lbl.no' />", attributes:{"class":"ac"}, width:40}//Rownum
            ,{field:"dlrCd", title:"<spring:message code='par.lbl.dlrCd' />", width:80}//딜러코드
            ,{field:"dlrNm", title:"<spring:message code='par.lbl.dlrNm' />", width:80}//딜러명
            ,{field:"purcOrdTp", title:"<spring:message code='par.lbl.purcOrdTp' />", template:'#= changePurcOrdTp(purcOrdTp)#', attributes:{"class":"al"}, width:140} //오더유형
            ,{field:"bmpOrdNo", title:"<spring:message code='par.lbl.bmpOrdNo' />", width:120}//bmp오더번호
            ,{field:"purcOrdNo", title:"<spring:message code='par.lbl.purcOrdNo' />", width:90}//구매오더번호
            ,{field:"purcRegDt", title:"<spring:message code='par.lbl.ordReqDt' />", template:'#= chgDate(purcRegDt)#', attributes:{"class":"ac"}, width:90}//구매신청일
            ,{field:"itemCnt", title:"<spring:message code='par.lbl.itemCnt' />", format:"{0:n2}", attributes:{"class":"ar"}, width:90}//건수 footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>" , aggregates:["sum"]
            ,{field:"totPurcQty", title:"<spring:message code='par.lbl.ordTotQty' />", format:"{0:n2}", attributes:{"class":"ar"}, width:90}//수량
            ,{field:"totTaxDdctAmt", title:"<spring:message code='par.lbl.taxDdctAmt' />", format:"{0:n2}", attributes:{"class":"ar"}, width:90}//구매총금액(세금제외)
            ,{field:"totPurcAmt", title:"<spring:message code='par.lbl.ordTotAmt' />", format:"{0:n2}", attributes:{"class":"ar"}, width:90}//구매총금액
            ,{field:"purcOrdStatCd", title:"<spring:message code='par.lbl.purcOrdStatCd' />", attributes:{"class":"ac"},width:100
                ,template:function(dataItem){
                    var spanObj = "";
                    switch(dataItem.purcOrdStatCd)
                    {
                        case "02":// 전송
                            spanObj = "<span class='txt_label bg_blue'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                            break;
                        case "03":// 확정
                            spanObj = "<span class='txt_label bg_orange'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                            break;
                        case "04":// 완료
                            spanObj = "<span class='txt_label bg_purple'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                            break;
                        case "05":// 취소
                            spanObj = "<span class='txt_label bg_red'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                            break;
                        default: // 등록
                            spanObj = "<span class='txt_label bg_gray'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                            break;
                     }

                     return spanObj;
                }
            }//구매오더상태
        ]
    });

    // 구매 명세 그리드
    $("#gridDetail").kendoExtGrid({
        gridId:"G-PAR-0728-111301"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusDetailByCondition.do' />"
                }
                ,parameterMap:function(options, operation){
                    if(operation === "read"){
                        var params = {},
                            sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

                        if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){
                            sPurcOrdStatCdLst.splice(0,1);
                        }

                        if(sPurcOrdStatCdLst.length === 0){
                            for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                                sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                            }
                        }
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 구매오더 검색조건 코드.
                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sDlrNm"] = $("#sDlrNm").val();
                        params["sBmpOrdNo"] = $("#sBmpOrdNo").val();
                        params["sPurcOrdNo"] = $("#sPurcOrdNo").val();
                        params["sPurcRegDtFr"] = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sPurcRegDtTo"] = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                        params["sPurcOrdStatLst"] = sPurcOrdStatCdLst;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                data:function (result){
                    if(result.total === 0){
                        dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                    }
                    return result.data;
                }
                ,total:"total"
                ,model:{
                    id:"purcOrdNo"
                    ,fields:{
                        dlrCd:{ type:"string", editable:false }
                        ,bmpOrdNo:{ type:"string" ,editable:false } //BMP오더번호
                        ,purcOrdNo:{ type:"string" ,editable:false } //오더번호
                        ,purcOrdLineNo:{ type:"string" ,editable:false } //구매오더라인번호
                        ,itemCd:{ type:"string" ,editable:false } //부번
                        ,confirmParNo:{ type:"string" ,editable:false } //부번
                        ,itemNm:{ type:"string" ,editable:false } //품명
                        ,confirmParNm:{ type:"string" ,editable:false } //품명
                        ,purcRegDt:{ type:"string" ,editable:false } //오더일자(구매일자)
                        ,invcDt:{ type:"string" ,editable:false } //발송일
                        ,arrvDt:{ type:"string" ,editable:false } //도착예정일자
                        ,purcOrdTp:{ type:"string" ,editable:false } //오더유형
                        ,bpCd:{ type:"string" ,editable:false } //업체
                        ,bpNm:{ type:"string" ,editable:false } //업체
                        ,purcItemStatCd:{ type:"string" ,editable:false } //상태
                        ,purcPgssCd:{ type:"string" ,editable:false } //진행상태
                        ,purcUnitCd:{ type:"string" ,editable:false } //단위
                        ,purcQty:{ type:"number" ,editable:false } //오더수량(구매수량)
                        ,confirmQty:{ type:"number" ,editable:false } //오더수량(확정수량)
                        ,bmpChkQty:{ type:"number" ,editable:false } //확정수량
                        ,boQty:{ type:"number" ,editable:false } //B/O수량
                        ,odrAlcQt:{ type:"number" ,editable:false } //할당수량
                        ,odrOpicQt:{ type:"number" ,editable:false } //픽킹중수량
                        ,odrOpacQt:{ type:"number" ,editable:false } //팩킹중수량
                        ,odrPakdQt:{ type:"number" ,editable:false } //팩킹완료수량
                        ,odrInvQt:{ type:"number" ,editable:false } //인보이스수량
                        ,grQty:{ type:"number" ,editable:false } //기입고수량(입고수량)
                        ,cancQty:{ type:"number" ,editable:false } //취소수량
                        ,grStrgeCd:{ type:"string" ,editable:false } //창고
                        ,purcPrc:{ type:"number" ,editable:false } //단가
                        ,purcAmt:{ type:"number" ,editable:false } //금액
                        ,regUsrId:{ type:"string" ,editable:false } //등록인
                        ,purcReqRegUsrId:{ type:"string" ,editable:false } //신청인(구매요청자)
                        ,mobisInvcNo:{ type:"string" ,editable:false } //모비스송장번호
                        ,boxNo:{ type:"string" ,editable:false } //BOX번호
                        ,editCd:{ type:"string" ,editable:false } //편수코드
                        ,trsfTp:{ type:"string" ,editable:false } //운송유형
                        ,trsfUsrId:{ type:"string" ,editable:false } //운송인
                        ,delYn:{ type:"string" ,editable:false } //삭제여부(아모스)
                        ,dlDistCd:{ type:"string" ,editable:false } //삭제여부(아모스)
                        ,cancReqQty:{ type:"number" ,editable:false } //삭제여부(아모스)
                        ,calcConfirmQty:{ type:"number" ,editable:false } //삭제여부(아모스)
                        ,confirmDt:{ type:"string" ,editable:false } //전송일자
                    }
                }
            }
            /* ,aggregate:[
                { field:"itemCnt", aggregate:"sum" }
                ,{ field:"totPurcQty", aggregate:"sum" }
                ,{ field:"totPurcAmt", aggregate:"sum" }
                ,{ field:"totTaxDdctAmt", aggregate:"sum" }
            ] */
        }
        ,selectable:"row"
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true//빈컬럼 적용. default:false
        ,dataBinding:function(e){
            rowNumber = 0;
        }
        ,pageable:{
            refresh:false
            ,pageSize:100
            ,buttonCount:3
            ,input:false
        }
        ,columns:[
            {field:"purcOrdTp", title:"<spring:message code='par.lbl.purcOrdTp' />", template:'#= changePurcOrdTp(purcOrdTp)#', attributes:{"class":"al"}, width:140} //오더유형
            ,{field:"purcRegDt", title:"<spring:message code='par.lbl.ordReqDt' />",attributes:{"class":"ac"}, template:'#= chgDate(purcRegDt)#', width:90} //구매신청일자
            ,{field:"confirmDt", title:"<spring:message code='par.lbl.sendDt' />", attributes:{"class":"ac"}, template:'#= chgDate(confirmDt)#', width:90} //전송일자 (B/O와 동일)
            ,{field:"purcOrdNo", title:"<spring:message code='par.lbl.purcOrdNo' />", width:100} //구매오더번호
            ,{field:"bmpOrdNo", title:"<spring:message code='par.lbl.bmpOrdNo' />", width:120} //bmp오더번호
            ,{field :"bpNm", title:"<spring:message code='par.lbl.spyrCd' />", width:140} //공급업체명
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:140} //부품명
            ,{_field:"itemCdHd", title:"<spring:message code='par.lbl.itemCd'/>", headerAttributes:{"class":"hasBob"}
                ,columns:[
                    {field:"itemCd", title:"<spring:message code='par.lbl.request'/>", width:100 }//요청
                    ,{field:"confirmParNo", title:"<spring:message code='par.lbl.confirm'/>", width:100 }//확정
                ]
            }//부품번호
            ,{_field:"purcQtyHd", title:"<spring:message code='par.lbl.purcQty'/>", headerAttributes:{"class":"hasBob"}
                ,columns:[
                    {field:"purcQty", title:"<spring:message code='par.lbl.request' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}
                    ,{field:"confirmQty", title:"<spring:message code='par.lbl.confirm' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80}
                ]
            }//구매수량
            ,{field:"purcPrc", title:"<spring:message code='par.lbl.purcPriceAddTax' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:120} //구매단가
            ,{field:"dlDistCd", title:"<spring:message code='par.lbl.pdcCd' />(<spring:message code='par.lbl.strgeNm' />)", template:'#= changeDlPdcCd(dlDistCd)#', width:140} //PDC 창고
            ,{field:"calcConfirmQty", title:"<spring:message code='par.lbl.currentQty' />", format:"{0:n0}", decimal:0, width:80} //CONFIRM 수량
            ,{field:"cancReqQty", title:"<spring:message code='par.lbl.cancQty' />", format:"{0:n0}", decimal:0, width:80} //취소수량
            ,{field:"editCd", title:"<spring:message code='par.lbl.amendCode' />", template:'#= changeEditCd(editCd)#', width:140} //편수코드
            ,{field :"boQty", title:"<spring:message code='par.lbl.boQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80} //BO수량
            ,{_field:"ordPrcsStatHd", title:"<spring:message code='par.lbl.purcProcStat'/>", headerAttributes:{"class":"hasBob"}
                ,columns:[
                    {field:"odrAlcQt", title:"<spring:message code='par.lbl.alloc' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80} //할당수량
                    ,{field:"odrOpicQt", title:"<spring:message code='par.lbl.picking' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80} //피킹중수량
                    ,{field:"odrOpacQt", title:"<spring:message code='par.lbl.packing' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80} //포장중수량
                    ,{field:"odrPakdQt", title:"<spring:message code='par.lbl.packEnd' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80} //포장완료수량
                    ,{field:"odrInvQt", title:"<spring:message code='par.lbl.invcQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80} //인보이스수량
                ]
            }//오더처리상태
            ,{field:"mobisInvcNo", title:"<spring:message code='par.lbl.invcDocNo' />", width:140} //송장번호
            ,{field:"boxNo", title:"<spring:message code='par.lbl.boxNo' />", width:100} //BOX번호
            ,{field:"trsfTp", title:"<spring:message code='par.lbl.trsfType' />", template:'#= changeTrsfTp(trsfTp)#', width:140} //운송유형
            ,{field:"trsfUsrId", title:"<spring:message code='par.lbl.trsfPrsn' />", width:100} //운송인
            ,{field:"invcDt", title:"<spring:message code='par.lbl.sendOrdDt' />", attributes:{"class":"ar"}, template:'#= chgDate(purcRegDt)#', width:90} //발송일자
            ,{field:"arrvDt", title:"<spring:message code='par.lbl.arrvExpcDt' />", attributes:{"class":"ar"}, template:'#= chgDate(purcRegDt)#', width:90} //도착예정일자
            ,{field:"purcOrdLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60} //구매오더라인번호
            ,{field:"purcPgssCd", title:"<spring:message code='par.lbl.purcItemStatCd' />", attributes:{"class":"ar"}, template:'#if(changePurcPgssCd(purcPgssCd) !== undefined){# #= changePurcPgssCd(purcPgssCd)# #}#', width:70} //상태
        ]
    });

    initPage();
});

$("#gridDepStatistics").kendoExtGrid({
    gridId:"G-PAR-1029-142201"
    ,dataSource:{
        transport:{
            read:{
                url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatisticsByCondition.do' />"
            }
            ,parameterMap:function(options, operation){
                if(operation === "read"){
                    var params = {};
                    params["sDivision"] = $("#sDivision").val();
                    params["sOffice"] = $("#sOffice").val();
                    params["sPurcRegDtFr"] = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                    params["sPurcRegDtTo"] = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                    return kendo.stringify(params);
                }
            }
        }
        ,schema:{
            data:function (result){
                if(result.total === 0){
                    dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                }
                return result.data;
            }
            ,total:"total"
            ,model:{
                fields:{
                	diviNm:{ type:"string" ,editable:false } 
                   ,offNm:{ type:"string" ,editable:false } 
                   ,dlrCnt:{ type:"string" ,editable:false }
                   ,odrPnoQt:{ type:"string" ,editable:false }
                   ,odrQt:{ type:"string" ,editable:false }
                   ,boPnoQt:{ type:"string" ,editable:false }
                   ,boQt:{ type:"string" ,editable:false }
                   ,avgDay:{ type:"number" ,editable:false }
                   ,boAvgDay:{ type:"number" ,editable:false }
                   ,odrNoCnt:{ type:"string" ,editable:false }
                   ,totPurcAmt:{ type:"number" ,editable:false } 
                }
            }
        }
    }
    ,selectable:"row"
    ,scrollable:true
    ,sortable:false
    ,autoBind:false
    ,filterable:false
    ,appendEmptyColumn:true//빈컬럼 적용. default:false
    ,dataBinding:function(e){
        rowNumber = 0;
    }
    ,pageable:false
    ,columns:[
        {field :"diviNm", title:"<spring:message code='par.lbl.division' />", attributes:{"class":"ar"},  width:80} ,
        {field :"offNm", title:"<spring:message code='par.lbl.officeNm' />", attributes:{"class":"ar"},  width:80} ,
        {field :"dlrCnt", title:"<spring:message code='par.lbl.dlrCnt' />", attributes:{"class":"ar"},  width:80} ,
        {field :"odrPnoQt", title:"<spring:message code='par.lbl.purcItemCnt' />", attributes:{"class":"ar"},  width:80} ,
		{field :"odrQt", title:"<spring:message code='par.lbl.ordQty' />", attributes:{"class":"ar"},  width:80} ,
		{field :"boPnoQt", title:"<spring:message code='par.lbl.backOrderCnt' />", attributes:{"class":"ar"},  width:80} ,
        {field :"boQt", title:"<spring:message code='par.lbl.boQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80},
        {field :"avgDay", title:"<spring:message code='par.lbl.avgDay' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:120},
        {field :"boAvgDay", title:"<spring:message code='par.lbl.boAvgDay' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:120}, 
        {field :"odrNoCnt", title:"<spring:message code='global.lbl.orderQty' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:120},
        {field :"totPurcAmt", title:"<spring:message code='par.lbl.ordTotAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:120}, 
        
        ]
});

//--------------liuxueying add -------------
function fn_linkBoPurcOrd(sDlrCd){
	    parent._createOrReloadTabMenu('<spring:message code="par.menu.backOrder" />'
     ,"<c:url value='/par/pcm/purcBackOrd/selectPurcBackOrdMain.do?sDlrCd="+sDlrCd+"'/>", "VIEW-I-13228");
}
//--------------liuxueying end -------------
$("#gridDlrStatistics").kendoExtGrid({
    gridId:"G-PAR-1029-165211"
    ,dataSource:{
        transport:{
            read:{
                url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatisticsByDlr.do' />"
            }
            ,parameterMap:function(options, operation){
                if(operation === "read"){
                    var params = {};
                    params["sPurcRegDtFr"] = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                    params["sPurcRegDtTo"] = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                    return kendo.stringify(params);
                }
            }
        }
        ,schema:{
            data:function (result){
                if(result.total === 0){
                    dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                }
                return result.data;
            }
            ,total:"total"
            ,model:{
                fields:{
	                dlrCd:{ type:"string" ,editable:false } 
                    ,dlrNm:{ type:"string" ,editable:false } 
	                ,odrPnoQt:{ type:"string" ,editable:false }
	                ,odrQt:{ type:"string" ,editable:false }
	                ,boPnoQt:{ type:"string" ,editable:false }
	                ,boQt:{ type:"string" ,editable:false }
	                ,avgDay:{ type:"number" ,editable:false }
	                ,boAvgDay:{ type:"number" ,editable:false }
	                ,odrNoCnt:{ type:"string" ,editable:false }
	                ,totPurcAmt:{ type:"number" ,editable:false } 
                }
            }
        }
    }
    ,selectable:"row"
    ,scrollable:true
    ,sortable:false
    ,autoBind:false
    ,filterable:false
    ,appendEmptyColumn:true//빈컬럼 적용. default:false
    ,dataBinding:function(e){
        rowNumber = 0;
    }
    ,pageable:false
    ,columns:[
        {field :"dlrCd", title:"<spring:message code='par.lbl.dlrCd' />", attributes:{"class":"ar"},  width:80} ,
        {field :"dlrNm", title:"<spring:message code='par.lbl.dlrNm' />", attributes:{"class":"ar"},  width:300} ,
        {field :"odrPnoQt", title:"<spring:message code='par.lbl.purcItemCnt' />", attributes:{"class":"ar"},  width:80} ,
		{field :"odrQt", title:"<spring:message code='par.lbl.ordQty' />", attributes:{"class":"ar"},  width:80} ,
		{field :"boPnoQt", title:"<spring:message code='par.lbl.backOrderCnt' />", attributes:{"class":"ar"},  width:80} ,
        {field :"boQt", title:"<spring:message code='par.lbl.boQty' />", attributes:{"class":"ar"}, format:"{0:n0}", decimal:0, width:80
			,template  :function(dataItem){
                var spanObj = dataItem.boQt;
                if(dataItem.boQt > 0){
				    spanObj = "<a class='k-link' onclick=\"fn_linkBoPurcOrd('" + dataItem.dlrCd + "'); \">"+dataItem.boQt+"&nbsp;&nbsp;&nbsp;&nbsp;</a>";
                }
                return spanObj;
                
                
            }
        },
        {field :"avgDay", title:"<spring:message code='par.lbl.avgDay' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:120},
        {field :"boAvgDay", title:"<spring:message code='par.lbl.boAvgDay' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:120}, 
        {field :"totPurcAmt", title:"<spring:message code='par.lbl.ordTotAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:120}, 
        {field :"odrNoCnt", title:"<spring:message code='global.lbl.orderQty' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:120} 
        
        ]
});



</script>
<!-- //script -->