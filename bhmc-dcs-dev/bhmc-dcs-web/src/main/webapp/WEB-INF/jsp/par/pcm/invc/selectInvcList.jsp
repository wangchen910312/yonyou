<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 송장등록현황 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message    code="par.btn.init" /><!-- 초기화 --></button>
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
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dlrNm" /><!-- 딜러명 --></th>
                        <td>
                            <input id="sDlrNm" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="sMobisInvcNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDt" /><!-- INVOICE일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sInvcDtFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sInvcDtTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invcStatCd" /><!-- 송장상태 --></th>
                        <td>
                            <input id="sInvcStatCd" class="form_comboBox" type="text" data-type="combo" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.confirmDt" /><!-- 확정일자--></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sConfirmDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sConfirmDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th></th>
                        <td></td>
                        <th></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="dataForm" class="mt10">
            <!-- 탭 메뉴 -->
            <div id="tabstrip" class="tab_area">
                <!-- 탭메뉴 -->
                <ul>
                    <li id="HD" class="k-state-active"><spring:message code="par.title.invcSummary" /><!-- 송장집계 --></li>
                    <li id="DT"><spring:message code="par.title.invcDetail" /><!-- 부품구매명세 --></li>
                </ul>
                <div>
                    <div class="table_grid">
                        <!-- 송장등록 그리드 -->
                        <div id="gridRegInvc" class="resizable_grid"></div>
                    </div>
                </div>
                <div>
                    <div class="table_grid">
                        <!-- 송장등록 그리드 -->
                        <div id="gridInvcDetail" class="resizable_grid"></div>
                    </div>
                </div>
            </div>
        </div>


    </section>
    <!-- //송장등록정보 -->
</div>

<!-- script -->
<script>
var sessionBpCd = "${bpCd}",
    sessionBpNm = "${bpNm}",
    sessionBpTp = "${bpTp}",
    toDt = "${toDt}",
    sevenDtBf = "${sevenDtBf}",
    invcTpList = [],
    purcOrdTpObj = {},
    invcTpObj = {},
    invcStatList = [],
    invcStatObj = {},
    invcUnitList = [],
    invcUnitObj = {},
    prcTpList = [],
    prcTpObj = {},
    grStrgeTpList = [],
    dlPdcCdList = [],
    dlPdcCdObj = {},
    vatCdList = [],
    vatCdObj = {},
    trsfTpObj = {},
    checkdIds = {},
    changeInvcStat,
    selectTabId = "HD",
    transObj;

invcStatList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${invcStatList}" varStatus="status">
    invcStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    invcStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//purcOrdTpList.push({cmmCd:" ", cmmCdNm:" "});
<c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
    purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
    dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

function initPage() {

    var minDate = new Date(sevenDtBf),
        maxDate = new Date(toDt),
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

    //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
    //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
        return false;
    }

    // 품목 정보 Reset
    //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
    partsJs.validate.groupObjAllDataInit();

    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();

    $("#gridRegInvc").data("kendoExtGrid").dataSource.data([]);
    $("#gridInvcDetail").data("kendoExtGrid").dataSource.data([]);
    //$("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
    //$("#sBpNm").val(sessionBpNm);

    $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value(new Date(sevenDtBf));
    $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value(new Date(toDt));
    $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY, toMM, toDD));
    $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY, frMM, frDD));

    /*$("#sConfirmFr").data("kendoExtMaskedDatePicker").value(new Date(sevenDtBf));
    $("#sConfirmTo").data("kendoExtMaskedDatePicker").value(new Date(toDt));
    $("#sConfirmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY, toMM, toDD));
    $("#sConfirmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY, frMM, frDD));*/
}

function fnChkDateValue(e){
    var elmt = e.sender.element[0],
        id = elmt.id,
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD,
        maxDate,
        minDate;

    if(this.value() === null){
        if(id === 'sInvcDtFr'){
            minDate = new Date(sevenDtBf);
            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            //$("#sInvcDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            //$("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
        }else if(id === 'sInvcDtTo'){
            maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            //$("#sInvcDtTo").data("kendoExtMaskedDatePicker").value(toDt);
            //$("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(9999,12,31));
        }else if(id === 'sConfirmDtFr'){
            maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            //$("#sConfirmDtFr").data("kendoExtMaskedDatePicker").value(toDt);
            //$("#sConfirmDtTo").data("kendoExtMaskedDatePicker").min(new Date(toYY,toMM,toDD));
            $("#sConfirmDtTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
        }else if(id === 'sConfirmDtTo'){
            maxDate = new Date(toDt);
            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

            //$("#sConfirmDtTo").data("kendoExtMaskedDatePicker").value(toDt);
            //$("#sConfirmDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sConfirmDtFr").data("kendoExtMaskedDatePicker").max(new Date(9999,12,31));
        }
    }else{
        if(id === 'sInvcDtFr'){
            frYY = this.value().getFullYear();
            frMM = this.value().getMonth();
            frDD = this.value().getDate();

            $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        }else if(id === 'sInvcDtTo'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();

            $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }else if(id === 'sConfirmDtFr'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();

            $("#sConfirmDtTo").data("kendoExtMaskedDatePicker").min(new Date(toYY,toMM,toDD));
        }else if(id === 'sConfirmDtTo'){
            toYY = this.value().getFullYear();
            toMM = this.value().getMonth();
            toDD = this.value().getDate();

            $("#sConfirmDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        }
    }
}

$(document).ready(function() {
        //송장상태선택
        $("#sInvcStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcStatList
            ,index:0
        });

        $("#sInvcDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sInvcDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sConfirmDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sConfirmDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //btnExcelExport
        $("#btnExcelExport").kendoButton({
            click:function(e){

                //excel export all
                dms.ajax.excelExport({
                    "beanName":"invcService"
                    ,"templateFile":(selectTabId=="HD")? "InvoiceItem_Tpl.xls" : "InvoiceItemDetail_Tpl.xls"
                    ,"fileName":(selectTabId=="HD")? "InvoiceItem_Tpl.xls" : "InvoiceItemDetail_Tpl.xls"
                    ,"sDlrCd":$("#sDlrCd").val()
                    ,"sDlrNm":$("#sDlrNm").val()
                    ,"sMobisInvcNo":$("#sMobisInvcNo").val()
                    ,"sInvcDtFr":$("#sInvcDtFr").val()
                    ,"sInvcDtTo":$("#sInvcDtTo").val()
                    ,"sConfirmDtFr":$("#sConfirmDtFr").val()
                    ,"sConfirmDtTo":$("#sConfirmDtTo").val()
                    ,"sInvcStatCd":$("#sInvcStatCd").data("kendoExtDropDownList").value()
                    ,"selectTabId":selectTabId
                });

            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                $("#gridRegInvc").data("kendoExtGrid").dataSource.read();
                $("#gridInvcDetail").data("kendoExtGrid").dataSource.read();
            }
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        //tabstrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select: function(e) {
                selectTabId = e.item.id;
            }
        });

        // 송장상태
        changeInvcStat = function(val){
            var returnVal = "";
            if(val !== null && val !== ""){
                returnVal = invcStatObj[val];
            }
            return returnVal;
        };

        // 오더유형
        changePurcOrdTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = purcOrdTpObj[val];
            }
            return returnVal;
        };

        // 배송PDC
        changeDlPdcCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = dlPdcCdObj[val];
            }
            return returnVal;
        };

        // 송장집계 그리드
        $("#gridRegInvc").kendoExtGrid({
            gridId:"G-PAR-0831-171901"
            ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/invc/selectInvcItems.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if(operation === "read"){
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            // 송장 검색조건 코드.
                            params["sDlrCd"] = $("#sDlrCd").val();
                            params["sDlrNm"] = $("#sDlrNm").val();
                            params["sMobisInvcNo"] = $("#sMobisInvcNo").val();
                            params["sInvcDtFr"] = $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sInvcDtTo"] = $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sConfirmDtFr"] = $("#sConfirmDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sConfirmDtTo"] = $("#sConfirmDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sInvcStatCd"] = $("#sInvcStatCd").data("kendoExtDropDownList").value();
                            console.log("params:",params);

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
                        id:"invcDocNo"
                        ,fields:{
                            dlrCd:{ type:"string" }
                            ,invcDocNo:{ type:"string" }
                            ,invcStatCd:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,invcDt:{ type:"date" }
                            ,mobisInvcNo:{ type:"string" }
                            ,invcAmtCur:{ type:"number" }
                            ,invcTotAmt:{ type:"number" }
                            ,invcTotalLine:{ type:"number" }
                            ,invcSumQt:{ type:"number"}
                            ,invcCseCnt:{ type:"number"}
                            ,arrvDt:{ type:"date" }
                            ,confirmDt:{ type:"date" }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,scrollable:true
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true //빈컬럼 적용. default:false
            ,editable:false
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.no' />", width:50}
                ,{field:"dlrCd", title:"<spring:message code='par.lbl.dlrCd' />", width:80}//딜러코드
                ,{field:"dlrNm", title:"<spring:message code='par.lbl.dlrNm' />", width:160}//딜러명
                ,{field:"mobisInvcNo", title:"<spring:message code='par.lbl.invcDocNo' />", width:160}//송장번호
                ,{field:"invcDt", title:"<spring:message code='par.lbl.invcDt' />", format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}, width:90}//송장일자
                ,{field:"invcTotalLine", title:"<spring:message code='par.lbl.parCnt' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:90}//부품건수
                ,{field:"invcSumQt", title:"<spring:message code='par.lbl.itemQty' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:90}//부품수량
                ,{field:"invcTotAmt", title:"<spring:message code='par.lbl.invcAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:90}//송장금액
                ,{field:"invcStatCd", title:"<spring:message code='par.lbl.invcStatCd' />", attributes:{"class":"ac"}, width:80, template:'#= changeInvcStat(invcStatCd)#'}//송장상태
                ,{field:"trsfAmt", title:"<spring:message code='par.lbl.trsfAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:90}//운송비
                ,{field:"incAmt", title:"<spring:message code='par.lbl.incAmt' />", attributes:{"class":"ar"}, format:"{0:n2}", decimals:2, width:90}//보험비
                ,{field:"confirmDt", title:"<spring:message code='par.lbl.confirmDt' />", format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}, width:90}//확정일자
            ]
        });


        // 송장등록 그리드
        $("#gridInvcDetail").kendoExtGrid({
            gridId:"G-PAR-0831-171901"
            ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/invc/selectInvcDetailItems.do' />"
                    }
                    ,parameterMap:function(options, operation){
                        if(operation === "read"){
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 송장 검색조건 코드.
                            params["sDlrCd"] = $("#sDlrCd").val();
                            params["sDlrNm"] = $("#sDlrNm").val();
                            params["sMobisInvcNo"] = $("#sMobisInvcNo").val();
                            params["sInvcDtFr"] = $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sInvcDtTo"] = $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sConfirmDtFr"] = $("#sConfirmDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sConfirmDtTo"] = $("#sConfirmDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sInvcStatCd"] = $("#sInvcStatCd").data("kendoExtDropDownList").value();
                            console.log("params:",params);

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
                        id:"invcDocNo"
                        ,fields:{
                            id:"invcDocNo"
                            ,fields:{
                                dlrCd:{ type:"string"}
                                ,invcDocNo:{ type:"string"}
                                ,invcDocLineNo:{ type:"number"}
                                ,mobisInvcNo:{ type:"string"}
                                ,mobisInvcLineNo:{ type:"number"}
                                ,purcOrdNo:{ type:"string"}
                                ,invcIfOrdNo:{ type:"string"}
                                ,purcOrdLineNo:{ type:"string"}
                                ,purcOrdLineDetlNo:{ type:"string"}
                                ,purcRegDt:{ type:"date"}
                                ,bpCd:{ type:"string"}
                                ,itemCd:{ type:"string"}
                                ,itemNm:{ type:"string"}
                                ,invcTotAmt:{ type:"number"}
                                ,invcPrc:{ type:"number"}
                                ,invcQty:{ type:"number"}
                                ,invcUnitCd:{ type:"string"}
                                ,invcAmt:{ type:"number"}
                                ,vatAmt:{ type:"number"}
                                ,dlPdcCd:{ type:"string"}
                                ,boxNo:{ type:"string"}
                                ,invcGrDt:{ type:"date"}
                                ,avlbStockQty:{ type:"number", editable:false }
                                ,borrowQty:{ type:"number", editable:false }
                                ,rentQty:{ type:"number", editable:false }
                                ,stockQty:{ type:"number", editable:false }
                                ,resvStockQty:{ type:"number", editable:false }
                            }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,scrollable:true
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true //빈컬럼 적용. default:false
            ,editable:false
            ,columns:[
                {field:"purcOrdTp", title:"<spring:message code='par.lbl.purcOrdTp' />", template:'#= changePurcOrdTp(purcOrdTp)#', width:160}//오더유형
                ,{field:"purcRegDt" ,title:"<spring:message code='par.lbl.ordReqDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{"class":"ac"} ,width:140}//처리일자
                ,{field:"purcOrdNo" ,title:"<spring:message code='par.lbl.purcOrdNo' />" ,width:100}//구매오더번호
                ,{field:"invcIfOrdNo", title:"BMP <spring:message code='par.lbl.purcOrdNo' />" ,width:100}//BMP구매오더번호
                ,{field:"bpCd" ,title:"<spring:message code='par.lbl.supplyNo' />" ,width:140}//공급업체
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:100}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200}//부품명
                ,{field:"invcPrc" ,title:"<spring:message code='par.lbl.purcBasePrc' />" ,width:90 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매단가
                ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.purcPriceTax' />" ,width:120 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매단가(세금제외)
                ,{field:"invcQty" ,title:"<spring:message code='par.lbl.sendQty' />" ,width:90 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}//발송수량
                ,{field:"invcAmt" ,title:"<spring:message code='par.lbl.purcAmt' />" ,width:90 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액(세금제외)
                ,{field:"invcTotAmt" ,title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,width:120 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액
                ,{field:"dlPdcCd" ,title:"<spring:message code='par.lbl.dlPdcCd' />" ,attributes:{"class":"ac"}, template:'#= changeDlPdcCd(dlPdcCd)#', width:140}//배송 PDC
                ,{title:"<spring:message code='par.lbl.strgeStockQty' />" ,field:"stockQty" ,width:60 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}//재고수량
                ,{title:"<spring:message code='par.lbl.avlbStockQty' />" ,field:"avlbStockQty" ,width:60 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}//가용수량
                ,{title:"<spring:message code='par.lbl.purcOrdResvQty' />" ,field:"resvStockQty" ,width:60 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}//예약수량
                ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}//대여수량
                ,{title:"<spring:message code='par.lbl.borrowQty' />" ,field:"borrowQty" ,width:60 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2}//차입수량
            ]
        });

        initPage();

});
</script>
<!-- //script -->