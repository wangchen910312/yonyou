<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- issueEstimate -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.issueEstimate" /><!-- issueEstimate --></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11726" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11725" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnIssueEstimate" name="btnIssueEstimate" class="btn_m btn_m_min hidden"><spring:message code="par.btn.issueEstimate" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11724" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnIssueEstimateSave" name="btnIssueEstimateSave" class="btn_m btn_save btn_m_min"><spring:message code="par.btn.save" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11723" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPrint" name="btnPrint" class="btn_m btn_print btn_m_min"><spring:message code="par.btn.print" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11722" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_search btn_m_min"><spring:message code="par.btn.search" /></button>
            </dms:access>
            </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                    <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.carNo" /><!-- carNo --></th>
                    <td>
                        <input id="sCarNo" name="sCarNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.estDocNo" /></th>
                    <td>
                        <input id="sEstDocNo" name="sEstDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parGiTp" /></th>
                    <td>
                        <input id="sParGiTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.estStatCd" /></th>
                    <td>
                        <input id="sEstStatCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.vin" /></th>
                    <td>
                        <input id="sVin" name="sVin" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.estDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sEstStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEstEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.estMan" /></th>
                    <td>
                        <input id="sEstMan" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.estParStatCd" /></th>
                    <td>
                        <input id="sEstParStatCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.carLine" /></th>
                    <td>
                        <input id="sCarlineCd" name="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.model" /></th>
                    <td>
                        <input id="sCarlineCd2" name="sCarlineCd2" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.serPrsnGroup" /></th>
                    <td>
                        <input id="sSerPrsnGroup" name="sSerPrsnGroup" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.serPrsnNm" /></th>
                    <td>
                        <input id="sSerPrsnNm" name="sSerPrsnNm" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="hidden">
        <input type="hidden" id="estDocNo" />
        <input type="hidden" id="estStatCd" />
    </div>

    <div class="table_grid mt10">
        <!-- targetEstimateGrid -->
        <div id="gridHeader" ></div>
        <!-- targetEstimateGrid -->
    </div>
    <!-- // tab start-->
    <div id="tabstrip" class="tab_area mt10">
        <!-- 탭메뉴 -->
        <ul>
            <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
            <li><spring:message code='ser.lbl.lbrNm' /><!-- 정비항목 --></li>
            <li class="k-state-active"><spring:message code='global.lbl.part' /><!-- 부품 --></li>
            <li><spring:message code='global.lbl.othDetail' /><!-- 기타사항 --></li>
        </ul>
        <!-- //탭메뉴 -->

<!-- script -->
<script>
var isTablet = false;
</script>

        <!-- 고객요청사항-->
        <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectCustDemand.jsp">
            <c:param name="gubun" value="S"></c:param>
        </c:import>
        <!-- //고객요청사항-->

        <!-- 정비항목 -->
        <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrList.jsp">
            <c:param name="gubun" value="S"></c:param>
        </c:import>
        <!-- //정비항목 -->

        <!-- 부품 -->
        <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectPartList.jsp" />
        <!-- //부품 -->

        <!-- 기타 -->
        <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp" >
            <c:param name="gubun" value="S"></c:param>
        </c:import>
        <!-- //기타 -->
    </div>
    <!-- // tab end -->

</section>
</div>
<!-- //issueReqMng -->

<!-- script -->
<script>

//parGiTp
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpMap = {};
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//parGiTpSr
var parGiTpSrList = [];
<c:forEach var="obj" items="${parGiTpSrList}">
parGiTpSrList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var parGiTpSrMap = {};
$.each(parGiTpSrList, function(idx, obj){
    parGiTpSrMap[obj.cmmCd] = obj.cmmCdNm;
});
//etcGiTp
var etcGiTpList = [];
<c:forEach var="obj" items="${etcGiTpList}">
etcGiTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var etcGiTpMap = {};
$.each(etcGiTpList, function(idx, obj){
    etcGiTpMap[obj.cmmCd] = obj.cmmCdNm;
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
//roTpCdList
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});
//roTpCdGrid Func
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
}
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
var giStrgeCdMap = [];
$.each(giStrgeCdList, function(idx, obj){
    giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
});

var borrowStatCdList = [];
//borrowStatCdList
<c:forEach var="obj" items="${borrowStatCdList}" varStatus="status">
borrowStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var borrowStatCdMap = [];
$.each(borrowStatCdList, function(idx, obj){
    borrowStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//LTS MODEL 코드
var ltsModelCdList =[];
<c:forEach var="obj" items="${ltsModelDs}">
 ltsModelCdList.push({
     cmmCdNm:"${obj.ltsModelNm}"
     , cmmCd:"${obj.ltsModelCd}"});
//ltsModelCdList.push( "${obj.ltsModelCd}");
</c:forEach>
var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

//공통코드:RO유형
var estTpCdList = [];
<c:forEach var="obj" items="${estTpCdList}">
estTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var estTpCdMap = dms.data.arrayToMap(estTpCdList, function(obj){return obj.cmmCd});

var carlineCdList = [],
    carlineCdObj = {},
    modelCdList = [],
    modelCdObj = {},
    modelCdMap = {};

    <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
        carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
        carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>

    <c:forEach var="obj" items="${modelCdList}">
        if(modelCdObj.hasOwnProperty("${obj.carlineCd}")){
            modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
        }else{
            modelCdObj["${obj.carlineCd}"] = [];
            modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
        }
        //carline2 List
        modelCdList.push({
            "cmmCd":"${obj.modelCd}"
            ,"cmmCdNm":"${obj.modelNm}"
        });
    </c:forEach>
    //carline2 Map
    $.each(modelCdList, function(idx, obj){
        modelCdMap[obj.cmmCd] = obj.cmmCdNm;
    });

    //estStatCdList
    var estStatCdList = [];
    <c:forEach var="obj" items="${estStatCdList}">
        estStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var estStatCdMap = [];
    $.each(estStatCdList, function(idx, obj){
        estStatCdMap[obj.cmmCd] = obj.cmmCdNm;
    });
    //estParStatCdList
    var estParStatCdList = [];
    <c:forEach var="obj" items="${estParStatCdList}">
        estParStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var estParStatCdMap = [];
    $.each(estStatCdList, function(idx, obj){
        estParStatCdMap[obj.cmmCd] = obj.cmmCdNm;
    });

    /** 캠페인 유형 **/
    var crTpList = [];
    <c:forEach var="obj" items="${campaignDs}">
        crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});

    //캠페인유형
    crTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = crTpMap[val].cmmCdNm;
        }
        return returnVal;
    }

//page init Func
function pageInit(){

    $("#sCarNo").val("");
    $("#sEstDocNo").val("");

    $("#sParGiTp").data("kendoExtDropDownList").select(0);
    $("#sEstStatCd").data("kendoExtDropDownList").select(0);

    $("#sVin").val("");

    $("#sEstStartDt").data("kendoExtMaskedDatePicker").value(new Date("${sysStartDate}"));
    $("#sEstEndDt").data("kendoExtMaskedDatePicker").value(new Date("${sysEndDate}"));

    $("#sEstMan").val("");
    $("#sEstParStatCd").data("kendoExtDropDownList").select(0);

    $("#sCarlineCd").data("kendoExtDropDownList").select(0);
    $("#sCarlineCd2").data("kendoExtDropDownList").setDataSource([]);

    $("#sSerPrsnGroup").val("");
    $("#sSerPrsnNm").val("");

    buttonEnableDisable(false);
}

//buttonEnableDisable Func
function buttonEnableDisable(bFlag){
    //page button list
    $("#btnIssueEstimate").data("kendoButton").enable(bFlag);
    $("#btnIssueEstimateSave").data("kendoButton").enable(bFlag);
    $("#btnPrint").data("kendoButton").enable(bFlag);

    $("#parPkgAdd").data("kendoButton").enable(bFlag);
    $("#parAdd").data("kendoButton").enable(bFlag);
    $("#parDel").data("kendoButton").enable(bFlag);
}

function saveEstMateInfo(){

    var parCalcSumAmt = 0;
    var parDs = getPartData();

    //부품금액
    $.each(parDs, function(index, item){
        parCalcSumAmt += Number(this.itemTotAmt);
    });

    var formSaveData = {
            "estDocNo" : $("#estDocNo").val()
            ,"estStatCd" : "O"
            ,"parCalcSumAmt" : parCalcSumAmt
            ,"preFixId" : "${preFixId}"
        }

        var params =  $.extend(
               {"estimateVO":formSaveData}
               ,{"servicePartListVO":getPartData()}
               ,{"serviceLaborListVO":[]}
               ,{"custDemandListVO":[]}
               ,{"etcIssueListVO":[]}
               ,{"estimateDetailSaveVO":[]}
        );

        $.ajax({
            url:"<c:url value='/ser/est/estimate/mulitEstimates.do' />"
           ,data:JSON.stringify(params)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           }
           ,success:function(result , textStatus){
               /** 버튼 세팅**/
               $("#estDocNo").val(result);
               $("#estStatCd").val("O");

               //부품상세 그리드 조회.
               partInfo(result, "${preFixId}");
               //부품견적헤더 조회.
               $("#gridHeader").data("kendoExtGrid").dataSource.read();

               dms.notification.success("<spring:message code='global.info.success' />");
           }
           /* ,beforeSend:function(xhr){
               dms.loading.show($("#resizableContainer"));
           }
           ,complete:function(xhr,status){
               dms.loading.hide($("#resizableContainer"));
           } */
        });
}

/**
* hyperlink in grid event
*/
$(document).on("click", ".linkEstNo", function(e){

    var grid = $("#gridHeader").data("kendoExtGrid");
    var row = $(e.target).closest("tr");
    grid.tbody.find('>tr').each(function(){
        $(this).removeClass("k-state-selected");
     });
     // k-state-selected add
     row.addClass("k-state-selected");

    var selectedVal = grid.dataItem(row);

    var url = "<c:url value='/ser/est/estimate/selectEstimateManageMain.do' />?estDocNo="+selectedVal.estDocNo+"&vinNo="+selectedVal.vinNo+"&ltsModelCd="+selectedVal.ltsModelCd;
    parent._createOrReloadTabMenu("<spring:message code='ser.menu.estCreate' />", url, "VIEW-D-10335"); // RO Main
});

    $(document).ready(function() {

        //btnIssueEstimate
        $("#btnIssueEstimate").kendoButton({
            enable:false
            ,click:function(e){
                saveEstMateInfo();
            }
        });
        //btnIssueEstimateSave
        $("#btnIssueEstimateSave").kendoButton({
            enable:false
            ,click:function(e){
                saveEstMateInfo();
            }
        });
        //btnPrint
        $("#btnPrint").kendoButton({
            enable:false
            ,click:function(e){
            	parent._addTabMenu("<spring:message code='par.title.estDocNo' />", "<c:url value='/ReportServer?reportlet=par/selectEstimatePrintMain.cpt'/>&sDlrCd=${dlrCd}&sEstDocNo="+$("#estDocNo").val());
            }
        });
        //btnInit
        $("#btnInit").kendoButton({
            enable:true
            ,click:function(e){
                pageInit();
            }
        });
        // btnSearch.
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                $("#gridHeader").data("kendoExtGrid").dataSource.read();
            }
        });
        //sParGiTp dropdownlist
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parGiTpList
            ,autoBind:true
            ,index:0
        });
        //sParReqStatCd dropdownlist
        $("#sParReqStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partsParReqStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sEstStatCd dropdownlist
        $("#sEstStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:estStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sEstParStatCd dropdownlist
        $("#sEstParStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:estParStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sEstStartDt datepicker
        $("#sEstStartDt").kendoExtMaskedDatePicker({
            value:new Date("${sysStartDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sEstEndDt datepicker
        $("#sEstEndDt").kendoExtMaskedDatePicker({
            value:new Date("${sysEndDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //차종(검색))
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carlineCdList
            ,optionLabel:" "
            ,index:0
        });
        //sCarlineCd onchange event
        $("#sCarlineCd").on("change", function (){
            $("#sCarlineCd2").data("kendoExtDropDownList").setDataSource(modelCdObj[$(this).data("kendoExtDropDownList").value()]);
        });
        //(차형:검색)
        $("#sCarlineCd2").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:[]
            ,optionLabel:" "
            ,index:0
        });
        // tabStrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });

        //gridHeader.
        $("#gridHeader").kendoExtGrid({
            gridId:"G-PAR-0911-210101"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/est/estimate/selectEstimateListMains.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sEstFromDt"] = $("#sEstStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEstToDt"] = $("#sEstEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sCarRegNo"] = $("#sCarNo").val();
                            params["sPreFixId"] = 'ET';

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,dlrCd:{type:"string", editable:false}
                            ,estDocNo:{type:"string", editable:false}
                            ,estDt:{type:"date"}
                        }
                    }
                }
            }
            ,editable:false
            ,filterable:false
            ,selectable:"row"
            ,sortable:false
            ,height:288
            ,appendEmptyColumn:true
            ,change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){
                    $("#estDocNo").val(selectedItem.estDocNo);
                    var data = {"estDocNo":$("#estDocNo").val()}
                    detailSet(data, false, "ET");
                    //page button list
                    buttonEnableDisable(true);
                }
            }
            ,dataBound:function(e) {

                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        if(dataItem.estDocNo == $("#estDocNo").val()){
                            e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                        }
                    }
                });
            }
            ,columns:[
                {field:"estDt", title:"<spring:message code='ser.lbl.estDt' />", width:100, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}}// 견적등록일자
                ,{field:"estDocNo", title:"<spring:message code='ser.lbl.estDocNo' />", width:150
                  ,template:function(dataItem){
                      var spanObj = "<a href='#' class='linkEstNo'>"+dataItem.estDocNo+"</a>";
                      return spanObj;
                  }
                }// 견적번호
                ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}//차량번호
                ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}//VIN
                /* ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}               // 차량소유주 */
                ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}// 방문자
                ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.car' />", width:120
                  ,template:"#=getLtsModelNm(ltsModelCd)#"
                      ,editor:function(container, options){
                          $('<input required name="ltsModelCd" data-bind="value:' + options.field + '"/>')
                          .appendTo(container)
                          .kendoExtDropDownList({
                              dataTextField:"cmmCdNm"
                              ,dataValueField:"cmmCd"
                              ,dataSource:ltsModelCdList
                          });
                      }
                }// 차량
                ,{field:"parCalcSumAmt", title:"<spring:message code='global.lbl.totAmt' />", width:100
                  , attributes :{"class":"ar"}
                  , editor:function(container, options){
                      $('<input required name="sumAmt" data-bind="value:' + options.field + '"/>')
                      .appendTo(container)
                      .kendoExtNumericTextBox({
                          format:"n2"
                         ,decimals:2
                         ,min:1
                         ,value:0
                         ,spinners:false
                      });
                      $('<span class="k-invalid-msg" data-for="sumAmt"></span>').appendTo(container);
                   }
                }//합계
              ]
        });

        getLtsModelNm = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = ltsMap[val].cmmCdNm;
            }
            return returnVal;
        };

        estTpCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = estTpCdMap[val].cmmCdNm;
            }
            return returnVal;
        };

        //상세 조회
        detailSet = function(data, slide, infoType){

            // 고객정보:공통 페이지 selectCustCarInfoMain.jsp에 함수 존재
            if(infoType == "RO") {
                url = "<c:url value='/ser/ro/repairOrder/selectRepairOrderByKey.do' />";
            } else {
                url = "<c:url value='/ser/est/estimate/selectEstimateManageMains.do' />";
            }

            var params = {"sVinNo":data.vinNo
                       ,"sResvDocNo":data.resvDocNo
                       ,"sRoDocNo":data.roDocNo
                       ,"sEstDocNo":data.estDocNo
                       ,"sLtsModelCd":data.ltsModelCd
                      } ;

            $.ajax({
                url:url
                ,data:JSON.stringify(params)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    var reqData;
                    if(infoType == "RO"){
                        reqData = result.roDocNo;
                    } else {
                        reqData = result.estDocNo;
                    }

                    //부품 적용.
                    partInfo(reqData, infoType);
                    //정비항목 적용.
                    lbrInfo(reqData, infoType , result.ltsModelCd);
                    //기타사항 적용.
                    etcIssueSet(reqData, infoType);
                }
            });
        };


    });
</script>
<!-- //script -->
