<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- issueReqResvReady -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
                <div class="btn_left">
                    <button type="button" id="btnInit" name="btnInit" class="btn_m btn_reset btn_m_min"><spring:message code="par.btn.init" /></button>
                </div>
                <div class="btn_right">

                    <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
                    <!--정비수령 출력버튼(과거RO출력가능용) -->
                    <button type="button" id="btnPrint" class="btn_m btn_print btn_m_min hidden"><spring:message code="par.btn.print" /></button><!--btnSearch  -->
                    <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_search btn_m_min" ><spring:message code="par.btn.search" /></button><!--btnSearch  -->
                </div>
        </div>

        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:7%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:18%;">
                    <col style="width:8%;">
                    <col style="width:18%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.carNo" /></th>
                        <td>
                            <input id="sCarNo" name="sCarNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giDocNo" /></th>
                        <td>
                            <input id="sGiDocNo" name="sGiDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.parGiStatCd" /><!-- parGiStatCd --></th>
                        <td>
                            <input id="sParReqStatCd02" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.serReceiveType" /></th>
                        <td>
                            <input id="sParGiTp" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.vin" /></th>
                        <td>
                            <input id="sVin" name="sVin" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.receiveMan" /><!-- receiveMan --></th>
                        <td>
                            <input id="sReceiveNm" name="sReceiveNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invRoDocNo" /></th>
                        <td >
                            <input id="sInvRoDocNo" name="sInvRoDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.partsInOutStatus" /></th>
                        <td >
                            <input id="sParReqStatCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.visitNm" /></th>
                        <td>
                            <input id="sCustNm" name="sCustNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.receiveTime" /></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sGiDocReqStartDt" name="sGiDocReqStartDt" class="form_datepicker"  data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sGiDocReqEndDt" name="sGiDocReqEndDt" class="form_datepicker"  data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invRoManNm" /></th>
                        <td>
                            <input id="sInvRoManNm" name="sInvRoManNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <input type="text" id="sItemCd" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="hidden">
            <input type="hidden" id="parReqDocNo" name="parReqDocNo" />
        </div>

        <!-- // tab start-->
        <div id="tabstrip" class="tab_area">
            <ul>
                <li id ="tabInvResvInfo" class="k-state-active"><spring:message code="par.title.serReceiveHeader" /></li><!-- 부품수령현황 -->
                <li id ="tabInvResvActInfo"><spring:message code="par.lbl.serReceiveDetail" /></li><!-- 부품수령명세 -->
            </ul>

            <!-- 정비수령현황 -->
            <div class="mt0">
                <section class="group">
                    <div class="header_area">
                        <div class="btn_right">
                        </div>
                    </div>
                    <div class="table_grid">
                        <div id="targetReqHeaderRoGrid" class="resizable_grid"></div>
                    </div>
                </section>
            </div>

            <!-- 정비수령명세 -->
            <div class="mt0">
                <section class="group">
                    <div class="header_area">
                        <div class="btn_right">
                        </div>
                    </div>
                    <div class="table_grid">
                        <div id="targetReqDetailGrid" class="resizable_grid"></div>
                    </div>
                </section>
            </div>

        </div>
    <!-- // tab end -->
    </section>

    <div class="hidden">
        <input type="hidden" id="parReqDocNo" name="parReqDocNo" />
    </div>

<!-- //issueReqResvReady -->
</div>
<!-- script -->
<script>
//parGiTpResv
var parGiTpResvList = [];
<c:forEach var="obj" items="${parGiTpResvList}">
parGiTpResvList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//parGiTp
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpMap = {};
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCd
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var partsParReqStatCdMap = {};
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//partsParReqStatCd02
var partsParReqStatCdList02 = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
    if("${obj.cmmCd}" !== '03'){
        partsParReqStatCdList02.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
</c:forEach>

//readyStatCdList
var readyStatCdList = [];
<c:forEach var="obj" items="${readyStatCdList}">
readyStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var readyStatCdMap = {};
$.each(readyStatCdList, function(idx, obj){
    readyStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
var borrowStatCdList = [],
borrowStatCdMap = {};
//borrowStatCdList
<c:forEach var="obj" items="${borrowStatCdList}" varStatus="status">
borrowStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var borrowStatCdMap = {};
$.each(borrowStatCdList, function(idx, obj){
    borrowStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
var giStrgeCdMap = {};
$.each(giStrgeCdList, function(idx, obj){
    giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
});
//roStatusCdList
var roStatusCdList = [];
<c:forEach var="obj" items="${roStatusCdList}">
//if("${obj.cmmCd}" != "06"){//RO상태 취소 제외.
    roStatusCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
//}
</c:forEach>
var roStatusCdMap = {};
$.each(roStatusCdList, function(idx, obj){
    roStatusCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//roTpCdList
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdMap = {};
$.each(roTpCdList, function(idx, obj){
    roTpCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//tecCdList
var tecCdList = [];
<c:forEach var="obj" items="${tecCdList}">
tecCdList.push({"tecId":"${obj.tecId}", "tecNm":"${obj.tecNm}"});
</c:forEach>
var tecCdMap = {};
$.each(tecCdList, function(idx, obj){
    tecCdMap[obj.tecId] = obj.tecNm;
});
//brandCdList
var brandCdList = [];
var brandCdMap = {};
<c:forEach var="obj" items="${brandCdList}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
brandCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//출고문서번호
var sGiDocNo = "";

/**
* hyperlink in grid event
*/
$(document).on("click", ".linkGiDocNo", function(e){
    var thisName = $(this).data("name");
    var grid = $("#targetReqHeaderRoGrid").data("kendoExtGrid"),
    row = $(e.target).closest("tr");
    // k-state-selected remove all
    grid.tbody.find('>tr').each(function(){
        $(this).removeClass("k-state-selected");
    });
    // k-state-selected add
    row.addClass("k-state-selected");
    var dataItem = grid.dataItem(row);
    //출고문서번호
    sGiDocNo = dataItem.giDocNo;

    var tabStrip = $("#tabstrip").getKendoExtTabStrip();
    tabStrip.select(1);

    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
});

//get tab info and type and grid info
function getSelectedGridObj(){
    var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
    var tabIndex = tabStrip.select().index();

    var gridObj = {
        "tabIndex":tabIndex
    }

    return gridObj;
}

//page init Func
function pageInit(){
    var minDate = new Date('1990-01-01'),
        maxDate = new Date('9999-12-31'),
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

    frYY = minDate.getFullYear();
    frMM = minDate.getMonth();
    frDD = minDate.getDate();

    toYY = maxDate.getFullYear();
    toMM = maxDate.getMonth();
    toDD = maxDate.getDate();

    $("#sCarNo").val("");

    $("#sParGiTp").data("kendoExtDropDownList").select(0);

    $("#sVin").val("");
    $("#sGiDocNo").val("");
    $("#sInvRoDocNo").val("");
    $("#sItemCd").val("");
    $("#sReceiveNm").val("");

    $("#sParReqStatCd").data("kendoExtDropDownList").select(0);
    $("#sParReqStatCd02").data("kendoExtDropDownList").select(0);

    $("#sCustNm").val("");
    $("#sInvRoManNm").val("");

    $("#sGiDocReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
    $("#sGiDocReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
    $("#sGiDocReqStartDt").data("kendoExtMaskedDatePicker").value("");
    $("#sGiDocReqEndDt").data("kendoExtMaskedDatePicker").value("");

    $("#parReqDocNo").val("");
    //출고문서번호
    sGiDocNo = "";

    $("#targetReqHeaderRoGrid").data("kendoExtGrid").dataSource.data([]);
    $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.data([]);
}

function getParGiTp(){
    var sParGiTp = $("#sParGiTp").val();
    if(sParGiTp == ""){
        sParGiTp = "PG01";//RO(정비수령) or IN(내부수령) or Borrow(정비차용)
    }else if(sParGiTp == "BR" ){
        sParGiTp = "PG02";//Borrow
    }

    return sParGiTp;
}

//order receive parts out print popup Func
var issueReceivePartsOutPrintPopupButtonWindow;
function selectIssueReceivePartsOutPrintPopupButtonWindow(){
    issueReceivePartsOutPrintPopupButtonWindow = dms.window.popup({
        windowId:"issueReceivePartsOutPrintPopupButtonWindow"
        ,title:""
        ,width:370
        ,height:330
        ,content:{
            url:"<c:url value='/par/ism/issueReq/selectIssueReceivePartsOutPrintPopup.do'/>"
            ,data:{
                "parReqDocNo":$("#parReqDocNo").val()
                ,"callbackFunc":function(data){

                    var giDocNoListStrBody = "";    /*출고문서리스트*/
                    var giDocNoListStrEnd = "";     /*출고문서 쿼리 리스트*/

                    if(data.flag =="Y"){
                        var giDocNoList = data.giDocNoList;

                        for (i = 0; i < giDocNoList.length; i++) {
                            var item = giDocNoList[i];
                            giDocNoListStrBody += "'"+item.giDocNo+"',";
                        }

                        giDocNoListStrEnd = "("+giDocNoListStrBody.substring(0,giDocNoListStrBody.length-1)+")";

                        var urlInfo = "<c:url value='/ReportServer?reportlet=par/selectIssueReqServiceWorkPrintMain.cpt'/>&sDlrCd=${dlrCd}&sLangCd=${langCd}&sPltCd=${pltCd}&sParReqDocNo="+$("#parReqDocNo").val()+"&sGiDocNoList="+giDocNoListStrEnd;

                        issueReceivePartsOutPrintPopupButtonWindow.close();
                        //param title, url, viewId, isReload
                        parent._createOrReloadTabMenu("<spring:message code='par.title.receiverPrintDoc' />", urlInfo,"VIEW-D-10646", true);
                    }
                }
            }
        }
    });
}

//gridHeight - if grid has footer
function gridHeight(){
    var grid = $("#targetReqHeaderRoGrid").data("kendoExtGrid");
    var contentHeight = grid.content.height();
    var footerHeight = grid.wrapper.find(".k-grid-footer").height();
    grid.content.height(contentHeight - (footerHeight + 1));
}

    $(document).ready(function() {
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                //pageInit Func call.
                pageInit();
            }
        });
        //btnExcelExport
        $("#btnExcelExport").kendoButton({
            click:function(e){
                var gridObj = getSelectedGridObj(),
                tabIndex = gridObj.tabIndex,
                beanName = "issueReqResvStatusService",
                templateFile = "PartsOutStatusHeaderTarget_Tpl.xlsx",
                fileName = "PartsOutStatusHeaderDownload_Tpl.xlsx";

                if(tabIndex == 1 ){
                    beanName = "issueReqDetailService";
                    templateFile = "PartsOutStatusDetailTarget_Tpl.xlsx";
                    fileName = "PartsOutStatusDetailDownload_Tpl.xlsx";
                }

                //위탁서 유형 가져오기.
                var sParGiTp = getParGiTp();

                //excel export all
                dms.ajax.excelExport({
                    "beanName":beanName
                    ,"templateFile":templateFile
                    ,"fileName":fileName
                    ,"sParGiTp":sParGiTp
                    ,"sParReqStatCd":$("#sParReqStatCd").val()
                    ,"sRoDocNo":$("#sInvRoDocNo").val()
                    ,"sRoStatCd":$("#sParReqStatCd02").val()
                    ,"sGiDocNo":$("#sGiDocNo").val()
                    ,"sGiDocReqStartDt":$("#sGiDocReqStartDt").val()
                    ,"sGiDocReqEndDt":$("#sGiDocReqEndDt").val()
                    ,"sCustNm":$("#sCustNm").val()
                    ,"sSerPrsnId":$("#sInvRoManNm").val()
                    ,"sCarNo":$("#sCarNo").val()
                    ,"sVin":$("#sVin").val()
                    ,"sReceiveNm":$("#sReceiveNm").val()
                    ,"sItemCd":$("#sItemCd").val()
                });
            }
        });
        //btnPrint
        $("#btnPrint").kendoButton({
            click:function(e){
                selectIssueReceivePartsOutPrintPopupButtonWindow();
            }
        });

        // btnSearch.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#targetReqHeaderRoGrid").data("kendoExtGrid").dataSource.read();
                $("#targetReqDetailGrid").data("kendoExtGrid").dataSource.read();
            }
        });

        // sParGiTp dropdownlist
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parGiTpList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        // parReqSattCd dropdownlist
        $("#sParReqStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partsParReqStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //parReqSattCd02 dropdownlist
        $("#sParReqStatCd02").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:roStatusCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sGiDocReqStartDt datepicker
        $("#sGiDocReqStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //sGiDocReqEndDt datepicker
        $("#sGiDocReqEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });
        //targetReqHeaderRoGrid.
        $("#targetReqHeaderRoGrid").kendoExtGrid({
            gridId:"G-PAR-0813-135466"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReserve/selectIssueReqReserveStatus.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            //위탁서 유형 가져오기.
                            var sParGiTp = getParGiTp();

                            params["sParGiTp"] = sParGiTp;
                            params["sParReqStatCd"] = $("#sParReqStatCd").val();
                            params["sRoDocNo"] = $("#sInvRoDocNo").val();//sRoDocNo
                            params["sRoStatCd"] = $("#sParReqStatCd02").val();
                            params["sGiDocReqStartDt"] = $("#sGiDocReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sGiDocReqEndDt"] = $("#sGiDocReqEndDt").data("kendoExtMaskedDatePicker").value();

                            params["sGiDocNo"] = $("#sGiDocNo").val();

                            params["sCustNm"] = $("#sCustNm").val();//sCustNm
                            params["sInvRoManNm"] = $("#sInvRoManNm").val();//sSerPrsnId
                            params["sCarNo"] = $("#sCarNo").val();//sCarNo
                            params["sVinNo"] = $("#sVin").val();//sVin
                            params["sReceiveNm"] = $("#sReceiveNm").val();//sReceiveNm
                            params["sItemCd"] = $("#sItemCd").val();//sItemCd

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"parReqDocNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,pkgDetlDcRate:{ type:"number", editable:false }
                            ,pkgDetlDcAmt:{ type:"number", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,brandCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:false }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,receiveNm:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,movingAvgPrc:{ type:"number" , editable:false }
                            ,movingAvgAmt:{ type:"number" , editable:false }
                            ,movingAvgTaxDdctAmt:{ type:"number" , editable:false }
                            ,taxRate:{ type:"number" , editable:false }
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,borrowDocNo:{ type:"string", editable:true }
                            ,borrowLineNo:{ type:"number", editable:true }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:true }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowRegDt:{ type:"date" , editable:false }
                            ,etcRvDocNo:{ type:"string", editable:false }
                            ,etcRvLineNo:{ type:"number", editable:false }
                            ,etcRvStatCd:{ type:"string", editable:false }
                            ,etcRvQty:{ type:"number", editable:false }
                            ,etcRvPrsnId:{ type:"string", editable:false }
                            ,etcRvRegDt:{ type:"date" , editable:false }
                            ,comItemCd:{ type:"string", editable:false }
                            ,comItemNm:{ type:"string", editable:false }
                            ,comItemPrc:{ type:"number", editable:false }
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" , editable:false }
                            ,calcDtFormat:{type:"date"}
                        }
                    }
                }
                ,aggregate:
                    [
                        { field: "endQty", aggregate: "sum" }
                        ,{ field: "itemPrc", aggregate: "sum" }
                        ,{ field: "itemAmt", aggregate: "sum" }
                        ,{ field: "movingAvgAmt", aggregate: "sum" }
                        ,{ field: "movingAvgTaxDdctAmt", aggregate: "sum" }
                        ,{ field: "taxAmt", aggregate: "sum" }
                    ]
            }
            ,editable:false
            ,height:476
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true//empty column. default:false
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#parReqDocNo").val(selectedItem.parReqDocNo);
                }
            }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                var parReqDocNo = $("#parReqDocNo").val();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            ,columns :
                [{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }
                ,{field:"giDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:110
                    ,template:function(dataItem){

                        var spanObj = "";

                        if(dataItem.giDocNo != "-"){
                            //spanObj = "<a href='#' class='linkGiDocNo'>"+dataItem.giDocNo+"</a>";
                            spanObj = dataItem.giDocNo;
                        }else{
                            spanObj = dataItem.giDocNo;
                        }

                        return spanObj;
                    }
                }
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vin'/>", width:150 }
                ,{field:"receiveNm", title:"<spring:message code='par.lbl.receiveMan' />", width:80}
                ,{field:"roDocNo", title:"<spring:message code='par.lbl.invRoDocNo'/>", width:110 }
                ,{field:"parGiTp", title:"<spring:message code='par.lbl.serReceiveType'/>", width:110
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){

                        var spanObj = "";
                        switch(dataItem.parGiTp){
                            case "RO":// RO

                                if(dataItem.borrowDocNo == null){
                                    spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                }else{
                                    spanObj = "<span class='txt_label bg_green'>"+"[BR]"+parGiTpMap["BR"]+"</span>";
                                }

                                break;
                            case "IN":// IN
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            default: // RO
                                spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{ field:"roStatCd", title:"<spring:message code='par.lbl.roStatus'/>"
                    ,width:110
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){

                        var spanObj = "";
                        switch(dataItem.roStatCd){
                            case "02":
                                spanObj = "<span class='txt_label bg_orange'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "03":
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "04"://정산확인
                            case "00"://정산완료
                                spanObj = "<span class='txt_label bg_purple'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "05":
                                spanObj = "<span class='txt_label bg_blue'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            case "06":
                                spanObj = "<span class='txt_label bg_red'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                            default: //01
                                spanObj = "<span class='txt_label bg_gray'>"+"["+dataItem.roStatCd+"]"+roStatusCdMap[dataItem.roStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//roStatCd
                ,{field:"regDt", title:"<spring:message code='par.lbl.invResvWorkTime'/>", width:120, format:"{0:<dms:configValue code='dateFormat' /> HH:mm}" }
                ,{field:"regUsrId", title:"<spring:message code='par.lbl.invRoManNm'/>", width:100 }
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.partsInOutStatus'/>", width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// ok
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{field:"endQty", title:"<spring:message code='par.lbl.outQty'/>", width:80
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }
                ,{field:"itemAmt", title:"<spring:message code='par.lbl.amt' />"
                    ,attributes:{"class":"ar"}, format:"{0:n2}", width:100
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"movingAvgAmt", title:"<spring:message code='par.lbl.movingAvgCost' />"
                    ,attributes:{"class":"ar"}, format:"{0:n2}", width:100
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"movingAvgTaxDdctAmt", title:"<spring:message code='par.lbl.movingAvgCost' />(<spring:message code='par.lbl.taxSprt' />)"
                    ,attributes:{"class":"ar"}, format:"{0:n2}", width:100
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"taxRate", title:"<spring:message code='par.lbl.taxRate' />", attributes:{"class":"ar"}, format:"{0:n0}", width:100}
                ,{field:"taxAmt", title:"<spring:message code='par.lbl.taxAmt' />"
                    ,attributes:{"class":"ar"}, format:"{0:n2}", width:100
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"calcDtFormat", title:"<spring:message code='ser.lbl.calcEndDt' />", width:180
                    ,attributes:{"class":"ac tooltip-enabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.calcDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                }   // 정산완료시간
            ]
        });
        //targetReqDetailGrid.
        $("#targetReqDetailGrid").kendoExtGrid({
            gridId:"G-PAR-0808-153398"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailStatues.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            //위탁서 유형 가져오기.
                            var sParGiTp = getParGiTp();

                            params["sParGiTp"] = sParGiTp;
                            params["sParReqStatCd"] = $("#sParReqStatCd").val();
                            params["sRoDocNo"] = $("#sInvRoDocNo").val();//sRoDocNo
                            params["sRoStatCd"] = $("#sParReqStatCd02").val();
                            params["sGiDocNo"] = $("#sGiDocNo").val();
                            params["sGiDocReqStartDt"] = $("#sGiDocReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sGiDocReqEndDt"] = $("#sGiDocReqEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sCustNm"] = $("#sCustNm").val();//sCustNm
                            params["sSerPrsnId"] = $("#sInvRoManNm").val();//sSerPrsnId
                            params["sCarNo"] = $("#sCarNo").val();//sCarNo
                            params["sVinNo"] = $("#sVin").val();//sVin
                            params["sReceiveNm"] = $("#sReceiveNm").val();//sReceiveNm
                            params["sItemCd"] = $("#sItemCd").val();//sItemCd

                            return kendo.stringify(params);
                        }
                    }
                }
                ,batch:true
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,roTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,vinNo:{ type:"string", validation:{required:true}, editable:false }
                            ,carlineNm:{ type:"string", validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,pkgDetlDcRate:{ type:"number", editable:false }
                            ,pkgDetlDcAmt:{ type:"number", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:true }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:true }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:true }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,totStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:true }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:true }
                            ,itemAmt:{ type:"number" , editable:true }
                            ,taxDdctAmt:{ type:"number" , editable:true }
                            ,taxAmt:{ type:"number" , editable:true }
                            ,taxRate:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveTime:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,receiveNm:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:true }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:true }
                            ,movingAvgPrc:{ type:"number" , editable:false }
                            ,movingAvgAmt:{ type:"number" , editable:false }
                            ,movingAvgTaxDdctPrc:{ type:"number" , editable:false }
                            ,movingAvgTaxDdctAmt:{ type:"number" , editable:false }
                            ,readyStatCd:{ type:"string", editable:true }
                            ,readyDocNo:{ type:"string", editable:false }
                            ,readyRegDt:{ type:"date" , editable:false }
                            ,readyUsrId:{ type:"string" , editable:false }
                            ,readyRemark:{ type:"string" , editable:false }
                            ,borrowDocNo:{ type:"string", editable:true }
                            ,borrowLineNo:{ type:"number", editable:true }
                            ,borrowTp:{ type:"string", editable:false }
                            ,borrowStatCd:{ type:"string", editable:false }
                            ,borrowQty:{ type:"number", editable:true }
                            ,borrowUsrId:{ type:"string", editable:false }
                            ,borrowRegDt:{ type:"date" , editable:false }
                            ,etcRvDocNo:{ type:"string", editable:true }
                            ,etcRvLineNo:{ type:"number", editable:true }
                            ,etcRvStatCd:{ type:"string", editable:false }
                            ,etcRvQty:{ type:"number", editable:true }
                            ,etcRvPrsnId:{ type:"string", editable:false }
                            ,etcRvRegDt:{ type:"date" , editable:false }
                            ,comItemCd:{ type:"string", editable:false }
                            ,comItemNm:{ type:"string", editable:false }
                            ,comItemPrc:{ type:"number", editable:false }
                            ,regUsrId:{ type:"string" , editable:false }
                            ,regDt:{ type:"date" , editable:false }
                            ,updtUsrId:{ type:"string" }
                            ,updtUsrNm:{ type:"string" , editable:false }
                            ,updtDt:{ type:"date" , editable:false }
                            ,roRegUsrNm:{ type:"string" , editable:false }
                            ,calcDtFormat:{type:"date"}
                        }
                    }
                }
                ,aggregate:
                    [
                        { field: "resvQty", aggregate: "sum" }
                        ,{ field: "taxDdctAmt", aggregate: "sum" }
                        ,{ field: "taxAmt", aggregate: "sum" }
                        ,{ field: "itemAmt", aggregate: "sum" }
                        ,{ field: "movingAvgAmt", aggregate: "sum" }
                        ,{ field: "movingAvgTaxDdctAmt", aggregate: "sum" }
                    ]

            }
            ,height:476
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true//empty column. default:false
            ,selectable:"row"
            ,multiSelectWithCheckbox:false
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });

            }
            ,columns :[
                {field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }
                ,{field:"giDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:110}
                ,{field:"roDocNo", title:"<spring:message code='par.lbl.invRoDocNo'/>", width:110 }
                ,{field:"vinNo", title:"<spring:message code='par.lbl.vinNo'/>", width:110 }
                ,{field:"carlineNm", title:"<spring:message code='par.lbl.carlineNm'/>", width:110 }
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatNm'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// complete
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{ field:"roTp", title:"<spring:message code='par.lbl.parGiTp'/>",width:100,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.roTp+"]"+roTpCdMap[dataItem.roTp]+"</span>";
                        return spanObj;
                    }
                }//roTp
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>" ,width:150}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150}
                ,{field:"pkgItemCd", title:"<spring:message code='par.lbl.package'/>", width:80 }
                ,{field:"resvQty", title:"<spring:message code='par.lbl.outQty'/>", width:90
                    ,attributes:{"class":"ar"}
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }
                ,{field:"avlbStockQty", title:"<spring:message code='par.lbl.avlbStockQty'/>", attributes:{"class":"ar"}, width:80 }
                ,{field:"totStockQty", title:"<spring:message code='par.lbl.strgeStockQty'/>", attributes:{"class":"ar"}, width:90 }
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,decimal:0 ,width:80}//예류수량
                ,{field:"borrowStockQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,decimal:0 ,width:80}//차입수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,decimal:0 ,width:80}//차출수량
                ,{field:"reqStrgeCd", title:"<spring:message code='par.lbl.strge' />",width:120
                    ,template:'#if(giStrgeCdMap[reqStrgeCd] !== undefined){# #= giStrgeCdMap[reqStrgeCd]# #}#'
                }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", width:120}
                ,{field:"itemPrc", title:"<spring:message code='par.lbl.giPrice' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100}//par.lbl.prc에서 변경 2018.07.27
                ,{field:"taxDdctAmt", title:"<spring:message code='par.lbl.taxDdctAmt' />", width:100
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                 }
                ,{field:"taxAmt", title:"<spring:message code='par.lbl.taxAmt' />", width:80
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"itemAmt", title:"<spring:message code='par.lbl.giIncTaxAmt' />",width:100
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//par.lbl.amt에서 변경 2018.07.27
                ,{field:"movingAvgPrc", title:"<spring:message code='par.lbl.stockCost' />", width:80, sortable:false, attributes:{"class":"ar"}}
                ,{field:"movingAvgTaxDdctPrc", title:"<spring:message code='par.lbl.stockCost' />(<spring:message code='par.lbl.taxSprt' />)", width:80, sortable:false, attributes:{"class":"ar"}}
                ,{field:"movingAvgAmt", title:"<spring:message code='par.lbl.movingAvgCost' />",width:100
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"movingAvgTaxDdctAmt", title:"<spring:message code='par.lbl.movingAvgCost' />(<spring:message code='par.lbl.taxSprt' />)",width:100
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"taxRate" ,title:"<spring:message code='par.lbl.taxRate' />" ,attributes:{"class":"ar"} ,format:"{0:n0}" ,decimal:0 ,width:80}//세율
                ,{field:"receiveTime", title:"<spring:message code='par.lbl.receiveTime' />", format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", width:120 }
                ,{field:"roRegUsrNm", title:"<spring:message code='par.lbl.invRoManNm' />", width:80}
                ,{field:"receiveNm", title:"<spring:message code='par.lbl.receiveMan' />", width:80}
                ,{field:"updtUsrNm", title:"<spring:message code='par.lbl.handler' />", width:80}
                ,{field:"calcDtFormat", title:"<spring:message code='ser.lbl.calcEndDt' />", width:180
                    ,attributes:{"class":"ac tooltip-enabled"}
                    , template:"#= dms.string.strNvl(kendo.toString(data.calcDt, '<dms:configValue code='dateFormat' /> HH:mm')) #"
                }   // 정산완료시간
            ]
        });
        //grid height in tab
        gridHeight();

        // tabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
        });

    });

    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        if(this.value() == null){
            if(id === 'sGiDocReqStartDt'){
                var minDate = new Date('1990-01-01');
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sGiDocReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sGiDocReqEndDt'){
                var maxDate = new Date('9999-12-31');
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();
                $("#sGiDocReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sGiDocReqStartDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sGiDocReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sGiDocReqEndDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sGiDocReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
     }

// 품목구분 그리드 콤보
function setSumData(val){
    var returnData  = Math.round(val * 1000)/1000,
        returnCalData = Math.round(returnData * 100)/100,
        returnVal = kendo.toString(returnData,'n2');

    return returnVal;
};

</script>
<!-- //script -->
