<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript">
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";

//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;

//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";

// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);


// 현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";






//공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>



// 대사결과코드:COM049
var compareResultTpList = [];
<c:forEach var="obj" items="${compareResultTpDS}">
    compareResultTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var compareResultTpArray = [];
$.each(compareResultTpList, function(idx, obj){
    compareResultTpArray[obj.cmmCd] = obj.cmmCdNm;
});
compareResultTpArray[null] = "";


//대사상세결과코드:COM050
var compareDetailResultTpList = [];
<c:forEach var="obj" items="${compareDetailResultTpDS}">
    compareDetailResultTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var compareDetailResultTpArray = [];
$.each(compareDetailResultTpList, function(idx, obj){
    compareDetailResultTpArray[obj.cmmCd] = obj.cmmCdNm;
});
compareDetailResultTpArray[null] = "";


/*
var compareResultTpList = [];
compareResultTpList.push({cmmCdNm:"ACCORD", cmmCd:"ACCORD"});
compareResultTpList.push({cmmCdNm:"COMP_MISS", cmmCd:"COMP_MISS"});
compareResultTpList.push({cmmCdNm:"DISACCORD", cmmCd:"DISACCORD"});
 */

</script>

<!-- DMS Profile 조회 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <!-- <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1> -->
        <h1 class="title_basic"><spring:message code='cmm.title.compareBundle'/></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12313" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12312" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnMngOBRBundle"><spring:message code='global.btn.compareTargetReg' /></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12311" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnRunComparingAll"><spring:message code='global.btn.compareExec' /></button>
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code='global.lbl.stdDt' /></th>
                    <td>
                        <input id="sStdDt" class="form_datepicker">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.compareDt' /></th>
                    <td>
                        <input id="sCompareDt" class="form_datepicker">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>
                    <td>
                        <input id="sDlrCd" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.compareRsltCd' /></th>
                    <td>
                        <input id="sCompareResult" name="sCompareResult" data-json-obj="true" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div class="clfix">
        <section>
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.title.compareSummary' /></h2>
                <div class="right_area">
                    <div class="txt_total">
                        <p id="progressRate"></p>
                    </div>
                </div>
            </div>

            <div class="table_form" id="Form01">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.totalDmsCnt' /></th>
                            <td>
                                <input id="totDmsCnt" name="totDmsCnt" class="form_input" readonly data-json-obj="true" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.completedDmsCnt' /></th>
                            <td>
                                <input id="completedDmsCnt" name="completedDmsCnt" class="form_input" readonly data-json-obj="true" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.uncompletedDmsCnt' /></th>
                            <td>
                                <input id="uncompletedDmsCnt" name="uncompletedDmsCnt" class="form_input" readonly data-json-obj="true" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.compareAccord' /></th>
                            <td>
                                <input id="accordDmsCnt" name="accordDmsCnt" class="form_input" readonly data-json-obj="true" >
                            </td>
                            <th scope="row"><spring:message code='global.lbl.discord' /></th>
                            <td>
                                <input id="disaccoredDmsCnt" name="disaccoredDmsCnt" class="form_input" readonly data-json-obj="true" >
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>


    <div class="clfix">
        <section class="content_left" style="width:500px;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.title.compareTargetList' /></h2>
            </div>
            <div class="table_grid">
                <div id="compareTrgtGrid"></div>
            </div>
        </section>
        <section class="content_right" style="margin-left:510px;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code='global.title.compareDetailRslt' /></h2>
            </div>
            <div class="table_grid">
                <div id="compareRsltGrid"></div>
            </div>
        </section>
    </div>
</section>

<script type="text/javascript">
var indexOfMainGrid = 0;
var searchBtnClicked = 'Y';


var searchOBRBundleMngPopupWin;
function searchOBRBundleMngPopup() {

    var virtualDlrCd = 'DSIML';  // Virtual Server Dealer Code

    searchOBRBundleMngPopupWin = dms.window.popup({
        windowId:"searchOBRBundleMngPopupWin"
        ,title:"<spring:message code='global.title.compareTargetReg' />"   // 대사대상 관리
        ,width:800
        ,content:{
            url:"<c:url value='/dply/spec/comp/selectOBRBundleMngPopup.do'/>"
            ,data:{
                 "autoBind":false
                ,"dlrCd":virtualDlrCd
                ,"callbackFunc":function(param) {
/*
                    var grid = $('#serviceGrid').data('kendoExtGrid');
                    var insertList = param.insertList;

                    $.each(insertList, function(index, model){
                        if(true) {  // Filtering Code Not Needed
                            model.operCmdNm           = 'INSTALL';
                            model.operTryCnt          = '1';
                            model.failAftCtnuPgssYn   = 'Y';
                            model.failAftRollbackYn   = 'N';
                            model.rollbackOperCmdNm   = 'UNINSTALL';

                            grid.dataSource.insert(0, model);

                        }
                    });
 */
                }
            }
        }

    });
}

var searchDealerBundlePopupWin;
function searchDealerBundlePopup() {

    var grid = $("#grid").data("kendoExtGrid");
    dataItem = grid.dataItem(grid.select());

    var dlrCd = dataItem.dlrCd;

    searchDealerBundlePopupWin = dms.window.popup({
        windowId:"searchDealerBundlePopupWin"
        ,title:"<spring:message code='global.title.dmsAppStatusSearch' />"   // DMS Bundle Status Search
        ,width:800
        ,height:400
        ,content:{
            url:"<c:url value='/dply/dms/dmsProfile/selectDealerBundlePopup.do'/>"
            ,data:{
                "autoBind":false
                ,"displayGrid":true
                ,"dlrCd":dlrCd
                ,"callbackFunc":function(data) {
                    //alert(JSON.stringify(data));
                    if(data.length >= 1) {

                    }
                }
            }
        }

    });
}


function runComparingAlone() {
    var grid = $("#grid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());

    searchBtnClicked = 'N';

    runComparing('ALONE', dataItem.dlrCd);
}


// 대사실행 기능
function runComparing(mode, dlrCd) {

    var params = {};
    params["mesgGrpCd"]   = 'E';

    if( mode == 'ALL' ) {
        params["mesgCd"]      = '10007';

    } else if( mode == 'ALONE' ) {
        params["mesgCd"]      = '10013';
        params["dlrCd"]       = dlrCd;
    }

    // 진행하시겠습니까?
    if(!confirm("<spring:message code='global.lbl.progress' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
        return;
    }

    $.ajax({
        url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
        data:JSON.stringify(params),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors);

        },
        success:function(jqXHR, textStatus) {
            processRsltOfSyncCmd(jqXHR, params);
        }
    });
}

function processRsltOfSyncCmd(jqXHR, params) {
    var grid = $("#grid").data("kendoExtGrid");
    var dataItem = grid.dataItem(grid.select());

    var objXML = $.parseXML(jqXHR);
    var objJson = $.xml2json(objXML);

    if(params["mesgCd"] == '10007') {  //
        var objTarget = $(objXML).find('mesg_code');

    } else if(params["mesgCd"] == '10013') {  //
        var objTarget = $(objXML).find('mesg_code');
    }
/*
    //정상적으로 반영 되었습니다.
    dms.notification.success("<spring:message code='global.info.success'/>");
    var currentPage = grid.dataSource.page();
    grid.dataSource.page(currentPage);
*/
    if(objJson.result == 'OK') {
        //정상적으로 반영 되었습니다.
        dms.notification.success("<spring:message code='global.info.success'/>");
        var currentPage = grid.dataSource.page();
        grid.dataSource.page(currentPage);

    } else if(objJson.result == 'NOK') {
        dms.notification.error(objJson.result_msg);
    }


}



$(document).ready(function() {

    $("#sStdDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:toDay
    });


    $("#sCompareDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
//        ,value:toDay
    });



    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            searchBtnClicked = 'Y';

            displayGrid("S");
        }
    });


    var gvStdDtForSearch = null;

    function displayGrid(mode) {

        var params = {};

        params["sStdDt"] = kendo.toString($('#sStdDt').data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");
//         params["sCompareDt"] = kendo.toString($('#sCompareDt').data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");

        $.ajax({
            url:"<c:url value='/dply/spec/comp/selectMaxCompareTargetStdDt.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
//                 alert(error);

            },
            success:function(jqXHR, textStatus) {
//                 alert(jqXHR);
                var rows = jqXHR.data;

//                 alert(rows[0].stdDt);
//                 alert(rows[0].compareDt);

                if(rows.length < 1 || rows[0].stdDt == null) {
                    dms.notification.warning("<spring:message code='cmm.info.noCompareTarget' />");     // 해당하는 대사 대상이 없습니다.
                    return;
                }

                gvStdDtForSearch = rows[0].stdDt;
                if(mode == "I") { // 화면을 처음 열었을 때
                    $('#sCompareDt').data('kendoExtMaskedDatePicker').value(rows[0].compareDt.substring(0, 4) + "-" + rows[0].compareDt.substring(4, 6) + "-" + rows[0].compareDt.substring(6, 8));
                }

                var lv_StdDt = $('#sStdDt').data('kendoExtMaskedDatePicker').value();
                var lv_sCompareDt = $('#sCompareDt').data('kendoExtMaskedDatePicker').value();

                if(dms.string.isEmpty(lv_StdDt)) {
                    dms.notification.info("<spring:message code='global.lbl.stdDt' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
                    return false;
                }

                if(dms.string.isEmpty(lv_sCompareDt)) {
                    dms.notification.info("<spring:message code='global.lbl.compareDt' var='message' /><spring:message code='global.info.validation.required' arguments='${message}' />");
                    return false;
                }

                $('#grid').data('kendoExtGrid').dataSource.page(1);

                displaySummary( gvStdDtForSearch, kendo.toString($('#sCompareDt').data('kendoExtMaskedDatePicker').value(), "yyyyMMdd") );

                displayProgressStatus();

            }
        });
    }

    function displayProgressStatus() {

        var params = {};

//         params["ipAddr"]      = '127.0.0.1';   // Temporary Code !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        params["mesgCd"]      = '10014';       // OSGi Bundle Repository Resource Query
        params["mesgGrpCd"]   = 'I';           // SyncCommandSndr
//         params["dlrCd"]       = parentOptions.dlrCd;

//         params["repository"]  = 'file:///D:\\develop\\ControlServer\\repository\\repository.xml';
//         params["repository"]  = $('#repository').data('kendoExtDropDownList').value();
//         params["repository"]  = cmmPrtyListObj['DCS_REPO_URL'];

        $.ajax({
            url:"<c:url value='/dply/cmm/sync/multiSyncCommand.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);

            },
            success:function(jqXHR, textStatus) {
                processRsltOfGetProgressStatus(jqXHR, params);
            }
        });

    }

    function processRsltOfGetProgressStatus(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);
//         var objTarget = $(objXML).find('deploy');

        console.log(JSON.stringify(objJson));
/*
        var lv_dms_cnt         = objJson.dms_cnt        ;
        var lv_compared_cnt    = objJson.compared_cnt   ;
        var lv_processed       = objJson.processed      ;

//         var rows = objJson.deploy;

//         var lv_dms_cnt         = rows[0].dms_cnt        ;
//         var lv_compared_cnt    = rows[0].compared_cnt   ;
//         var lv_processed       = rows[0].processed      ;

        var vMessage = ""
//             + "lv_dms_cnt          :" + lv_dms_cnt         + "\n"
//             + "lv_compared_cnt     :" + lv_compared_cnt    + "\n"
//             + "lv_processed        :" + lv_processed       + "\n"
            + lv_compared_cnt + "/" + lv_dms_cnt + "&nbsp;&nbsp;&nbsp;&nbsp;<span>" + lv_processed + "%</span> Completed"
            ;
//         alert(vMessage);

        $("#progressRate").html(vMessage);
*/

        if(objJson.result == 'OK') {
            var lv_dms_cnt         = objJson.dms_cnt        ;
            var lv_compared_cnt    = objJson.compared_cnt   ;
            var lv_processed       = objJson.processed      ;

            var vMessage = ""
                + lv_compared_cnt + "/" + lv_dms_cnt + "&nbsp;&nbsp;&nbsp;&nbsp;<span>" + lv_processed + "%</span> Completed"
                ;

            $("#progressRate").html(vMessage);

        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }



/*
        var grid = $("#grid").data("kendoExtGrid");
        var dataItem = grid.dataSource.data();
        var length = dataItem.length;



        for(var j=0; j<objJson.resource.length; j++) {
            var row = objJson.resource[j];
            var flag = true;

            for(var i=0; i<dataItem.length; i++) {
                if(dataItem[i].symbolicNm == row.symbolicname && dataItem[i].bundleVerNo == row.version) {
                    flag = false;
                    break;
                }

            }

            if(flag) {
                var model = {symbolicNm:row.symbolicname, bundleVerNo:row.version, bundleCont:row.presentationname};
                grid.dataSource.insert(0, model);
            }


        }

 */
//      $('#grid').data("kendoExtGrid").dataSource.data(objJson.resource);
    }


    function displaySummary(sStdDt, sCompareDt) {
        var params = {};

        params["sStdDt"] = sStdDt;
        params["sCompareDt"] = sCompareDt;

        $.ajax({
            url:"<c:url value='/dply/spec/comp/selectCompareBundleSummaryByResult.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {

            },
            success:function(jqXHR, textStatus) {
//                 console.log(jqXHR);
                var rows = jqXHR.data;

                var lv_totDmsCnt         = rows[0].totDmsCnt        ;
                var lv_completedDmsCnt   = rows[0].completedDmsCnt  ;
                var lv_uncompletedDmsCnt = rows[0].uncompletedDmsCnt;
                var lv_accordDmsCnt      = rows[0].accordDmsCnt     ;
                var lv_disaccoredDmsCnt  = rows[0].disaccoredDmsCnt ;

                var vMessage =
                      "TOT_DMS_CNT          :" + lv_totDmsCnt          + "\n"
                    + "COMPLETED_DMS_CNT    :" + lv_completedDmsCnt    + "\n"
                    + "UNCOMPLETED_DMS_CNT  :" + lv_uncompletedDmsCnt  + "\n"
                    + "ACCORD_DMS_CNT       :" + lv_accordDmsCnt       + "\n"
                    + "DISACCORED_DMS_CNT   :" + lv_disaccoredDmsCnt   + "\n"
                    ;
//                 alert(vMessage);

                $("#totDmsCnt"        ).val(lv_totDmsCnt        );
                $("#completedDmsCnt"  ).val(lv_completedDmsCnt  );
                $("#uncompletedDmsCnt").val(lv_uncompletedDmsCnt);
                $("#accordDmsCnt"     ).val(lv_accordDmsCnt     );
                $("#disaccoredDmsCnt" ).val(lv_disaccoredDmsCnt );
            }
        });

    }


    // 대사결과코드
    $("#sCompareResult").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:compareResultTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/comp/selectCompareBundleSummaryList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

//                         params["sStdDt"] = kendo.toString($('#sStdDt').data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");
                        params["sStdDt"] = gvStdDtForSearch;
                        params["sCompareDt"] = kendo.toString($('#sCompareDt').data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");
                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sCompareResult"] = $("#sCompareResult").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum             :{type:"number"}
                        ,dlrCd           :{type:'string'}
                        ,dlrNm           :{type:'string'}
                        ,stdDt           :{type:'string'}
                        ,compareTrgtCnt  :{type:'number'}
                        ,deployExist     :{type:'number'}
                        ,accord          :{type:'string'}
                        ,notAccord       :{type:'string'}
                        ,accordNotActive :{type:'string'}
                        ,miss            :{type:'string'}
                        ,compareResult   :{type:'string'}
                        ,deployHist      :{type:'string'}
                    }
                }
            }
        }

        ,multiSelectWithCheckbox:true
        ,height:304
        ,autoBind:false
//         ,selectable:"multiple, row"
        ,editable:false
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:170
            }
            ,{field:"stdDt", title:"<spring:message code='global.lbl.stdDt' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"compareDt", title:"<spring:message code='global.lbl.compareDt' />", width:140
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    var dt = dataItem.compareDt;
                    if(dt === undefined || dt == null) {
                        return '';
                    } else {
//                         return dt.substring(0, 4) + '-' + dt.substring(4,6) + '-' + dt.substring(6,8) + ' ' + dt.substring(8,10) + ':' + dt.substring(10,12) + ':' + dt.substring(12,14);
                        return dt.substring(0, 4) + '-' + dt.substring(4,6) + '-' + dt.substring(6,8);
                    }
                }
            }
            ,{field:"compareTrgtCnt", title:"<spring:message code='global.lbl.compareTargetCount' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"accord", title:"<spring:message code='global.lbl.compareAccord' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"notAccord", title:"<spring:message code='global.lbl.compareDisaccord' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"accordNotActive", title:"<spring:message code='global.lbl.stateDisaccord' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"miss", title:"<spring:message code='global.lbl.miss' />", width:80
                ,attributes:{"class":"ac"}
            }
            ,{field:"compareResult", title:"<spring:message code='global.lbl.compareRsltCd' />", width:110
                ,attributes:{"class":"ac"}
                ,template :"#=compareResultTpArray[compareResult]#"
            }
            ,{title:"<spring:message code='global.lbl.appInfo' />", width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    var dlrCd = dataItem.dlrCd;
                    var cellCont = '';
                    cellCont = "<span class='txt_label bg_yellow' onClick='searchDealerBundlePopup()'><spring:message code='global.lbl.appInfo' /></span>";

                    return cellCont;
                }

            }
            ,{title:"<spring:message code='global.lbl.compareExec' />", width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    var dlrCd = dataItem.dlrCd;
                    var cellCont = '';
                    cellCont = "<span class='txt_label bg_yellow' onClick='runComparingAlone()'><spring:message code='global.lbl.compareExec' /></span>";

                    return cellCont;
                }

            }

/*
            ,{field:"deployTargYn", title:"배포대상", width:70
                ,attributes:{"class":"ac"}
                ,template:"#=deployTargYnTpArray[deployTargYn]#"
            }
            ,{field:"lastAchkReqDt", title:"상태확인일시", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }

 */

            ,{title:""}
        ]
        ,change:function(e) {

            if(e.sender.dataItem(e.sender.select()) != null) {

                var grid = $("#grid").data("kendoExtGrid");
                var dataItem = grid.dataItem(grid.select());

                if(dataItem.stdDt != null && typeof dataItem.stdDt != undefined) {
                    $('#compareTrgtGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#compareTrgtGrid').data('kendoExtGrid').dataSource.read();

                    $('#compareRsltGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#compareRsltGrid').data('kendoExtGrid').dataSource.read();

                } else {
                    $('#compareTrgtGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#compareTrgtGrid').data('kendoExtGrid').dataSource.data([]);

                    $('#compareRsltGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#compareRsltGrid').data('kendoExtGrid').dataSource.data([]);

                }


            } else {

            }
        },dataBound:function(e) {
            var grid = e.sender;

            if(searchBtnClicked == 'Y') {
                var row = grid.tbody.find("tr:eq(0)");
                if(row.length > 0) {
                    grid.select(row);
                } else {
                    $('#compareTrgtGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#compareTrgtGrid').data('kendoExtGrid').dataSource.data([]);

                    $('#compareRsltGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#compareRsltGrid').data('kendoExtGrid').dataSource.data([]);

                }
            } else if (searchBtnClicked == 'N') {
                var row = grid.tbody.find("tr:eq(" + indexOfMainGrid +")");
                if(row.length > 0) {
                    grid.select(row);
                } else {
                    $('#compareTrgtGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#compareTrgtGrid').data('kendoExtGrid').dataSource.data([]);

                    $('#compareRsltGrid').data('kendoExtGrid').dataSource._destroyed = [];
                    $('#compareRsltGrid').data('kendoExtGrid').dataSource.data([]);

                }

                searchBtnClicked = 'Y';

            }

/*
            var grid = $("#grid").data("kendoExtGrid");
            var row = grid.tbody.find("tr:eq(0)");
            if(row.length > 0) {
                grid.select(row);
            } else {
                $('#compareTrgtGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#compareTrgtGrid').data('kendoExtGrid').dataSource.data([]);

                $('#compareRsltGrid').data('kendoExtGrid').dataSource._destroyed = [];
                $('#compareRsltGrid').data('kendoExtGrid').dataSource.data([]);

            }
*/

        }

    });

    var grid = $('#grid').data('kendoExtGrid');

    $(grid.tbody).on("click", "td", function (e) {
        var row = $(this).closest("tr");
        console.log(grid.dataItem(row));
        var rowIdx = $("tr", grid.tbody).index(row);
        var colIdx = $("td", row).index(this);
        console.log(rowIdx + '-' + colIdx);

        indexOfMainGrid = rowIdx;
    });


    //그리드 설정
    $("#compareTrgtGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/comp/selectCompareTargetBundleList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var grid = $("#grid").data("kendoExtGrid");
                        var dataItem = grid.dataItem(grid.select());

                        params["sStdDt"] = dataItem.stdDt;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum         :{type:"number"}
                        ,stdDt       :{type:"string"}
                        ,symbolicNm  :{type:"string"}
                        ,bundleVerNo :{type:"string"}
                        ,bundleCont  :{type:"string"}
                    }
                }
            }
        }

//         ,multiSelectWithCheckbox:true
        ,height:200
        ,autoBind:false
        ,pageable:false
//         ,selectable:"multiple, row"
        ,editable:false
        ,filterable:false
        ,sortable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"symbolicNm", title:"<spring:message code='global.lbl.symbolicNm' />", width:220
            }
            ,{field:"bundleVerNo", title:"version", width:60
                ,attributes:{"class":"ac"}
            }
            ,{field:"bundleCont", title:"<spring:message code='global.lbl.bundleNm' />", width:200
            }

            ,{title:""}
        ]

    });

    //그리드 설정
    $("#compareRsltGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/comp/selectCompareRsltList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var grid = $("#grid").data("kendoExtGrid");
                        var dataItem = grid.dataItem(grid.select());

                        params["sStdDt"] = dataItem.stdDt;
                        params["sCompareDt"] = dataItem.compareDt;
                        params["sDlrCd"] = dataItem.dlrCd;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum            :{type:"number"}
                        ,stdDt          :{type:'string'}
                        ,compareDt      :{type:'string'}
                        ,dlrCd          :{type:'string'}
                        ,symbolicNm     :{type:'string'}
                        ,bundleVerNo    :{type:'string'}
                        ,compareRsltCd  :{type:'string'}
                        ,dmsBundleVerNo :{type:'string'}
                    }
                }
            }
        }

//         ,multiSelectWithCheckbox:true
        ,height:200
        ,autoBind:false
        ,pageable:false
//         ,selectable:"multiple, row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"symbolicNm", title:"<spring:message code='global.lbl.symbolicNm' />", width:220
            }
            ,{field:"bundleVerNo", title:"<spring:message code='global.lbl.compareStdVersion' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"dmsBundleVerNo", title:"<spring:message code='global.lbl.dmsVersion' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"compareRsltCd", title:"<spring:message code='global.lbl.compareRsltCd' />", width:90
                ,attributes:{"class":"ac"}
                ,template :"#=compareDetailResultTpArray[compareRsltCd]#"
            }
            ,{field:"dmsBundleStatCont", title:"<spring:message code='global.lbl.dmsBundleStatCont' />", width:110
                ,attributes:{"class":"ac"}
            }
            ,{field:"compareDt", title:"<spring:message code='global.lbl.compareDt' />", width:140
                ,attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    var dt = dataItem.compareDt;
                    if(dt === undefined || dt == null) {
                        return '';
                    } else {
//                         return dt.substring(0, 4) + '-' + dt.substring(4,6) + '-' + dt.substring(6,8) + ' ' + dt.substring(8,10) + ':' + dt.substring(10,12) + ':' + dt.substring(12,14);
                        return dt.substring(0, 4) + '-' + dt.substring(4,6) + '-' + dt.substring(6,8);
                    }
                }
            }

            ,{title:""}
        ]

    });


//     $('#grid').data('kendoExtGrid').dataSource.page(1);
    displayGrid("I");

    //버튼 - SERVICE 추가
    $("#btnMngOBRBundle").kendoButton({
        click:function(e) {
//             searchBundlePopup();
            searchOBRBundleMngPopup();
        }
    });

    // Bundle정보
    $("#btnRunComparingAll").kendoButton({
        click:function(e) {
            searchBtnClicked = 'Y';

            runComparing('ALL', '');
        }
    });

});









</script>

