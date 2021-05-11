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


// REPOSITORY
var repositoryList = [];
<c:forEach var="obj" items="${repositoryDS}">
repositoryList.push({cmmCdNm:"${obj.repoUrlCont}", cmmCd:"${obj.repoUrlNm}"});
</c:forEach>

var repositoryArray = [];
$.each(repositoryList, function(idx, obj){
    repositoryArray[obj.cmmCd] = obj.cmmCdNm;
});

</script>


<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnNew"    class="btn_m btn_new" ><spring:message code="global.btn.new" /></button>
            <button id="btnSave"   class="btn_m btn_save"><spring:message code='global.btn.save' /></button>
        </div>
    </div>

    <div id="searchForm" class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:15%;">
                <col style="width:73%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.stdDt' /></th>
                    <td>
                        <input id="sStdDt" class="form_datepicker" >
                    </td>
                    <td>
                        <!-- <input id="repository" class="form_comboBox"> -->
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code='global.title.bundleInfo' /></h2>
        <div class="btn_right">
            <!-- <button id="btnAdd" class="btn_s" ><spring:message code="global.btn.add" /></button> -->
            <button id="btnAdd" class="btn_s" ><spring:message code='global.btn.repositoryCopy' /></button>
            <button id="btnDel" class="btn_s" ><spring:message code='global.btn.del' /></button>
        </div>
    </div>


    <div id="saveForm" class="table_form" >
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:15%;">
                <col style="width:73%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.stdDt' /></th>
                    <td>
                        <input id="stdDt" name="stdDt" class="form_datepicker" required data-name="<spring:message code='global.lbl.stdDt' />" data-json-obj="true">
                    </td>
                    <td></td>
                </tr>


            </tbody>
        </table>
    </div>




    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">

$(document).ready(function() {

    $("#sStdDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:toDay
   });

    $("#stdDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
//        ,value:toDay
   });

    // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 수정할 코드
/*
    $("#repository").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:repositoryList
    });
 */
    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var parentOptions = parent.searchOBRBundleMngPopupWin.options.content.data;


    /************************************************************
                기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            displayGrid();
        }
    });


    // 신규 버튼.
    $("#btnNew").kendoButton({
        click:function(e){
            addNew();
        }
    });


    //버튼 - 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){
            save();
        }
    });

    // 추가 버튼
    $("#btnAdd").kendoButton({
        click:function(e) {
            addBundle();
        }
    });

    // 버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 없습니다.
                dms.notification.warning("<spring:message code='cmm.info.noDataToDel' />");     // 삭제할 데이터가 없습니다.
                return false;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

        }
    });




    /************************************************************
                조회조건 설정
    *************************************************************/

    /************************************************************
                그리드 설정
    *************************************************************/

/*
    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
            data:[]
        }
        ,multiSelectWithCheckbox:true
        ,height:305
        ,autoBind:false
        ,pageable:false
        ,navigatable:true
        ,editable:false
        ,columns:[
            {field:"symbolicname", title:"Symbolic Name", width:220
            }
            ,{field:"presentationname", title:"Bundle Name", width:220
            }
            ,{field:"version", title:"Version", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"size", title:"Size", width:60
                ,attributes:{"class":"ac"}
            }
            ,{field:"uri", title:"URL", width:500
            }

            ,{title:""}
        ]

    });
*/

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/spec/comp/selectOBRBundleForCompList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
//                         params["sStdDt"] = '20160518';  // temporary code
                     params["sStdDt"] = kendo.toString($('#stdDt').data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum         :{type:"number"}
                        ,stdDt       :{type:'string'}
                        ,symbolicNm  :{type:'string'}
                        ,bundleVerNo :{type:'string'}
                        ,bundleCont  :{type:'string'}
                        ,regUsrId    :{type:'string'}
                        ,regDt       :{type:'date'  }
                        ,updtUsrId   :{type:'string'}
                        ,updtDt      :{type:'date'  }
                    }
                }
            },requestEnd:function(e) {
                $('#stdDt').data('kendoExtMaskedDatePicker').enable(false);
            }
        }

        ,multiSelectWithCheckbox:true
        ,height:239
        ,autoBind:false
        ,pageable:false
    //     ,selectable:"multiple, row"
        ,editable:false
        ,sortable:false
        ,filterable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"stdDt", title:"<spring:message code='global.lbl.stdDt' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"symbolicNm", title:"<spring:message code='global.lbl.symbolicNm' />", width:220
            }
            ,{field:"bundleVerNo", title:"<spring:message code='global.lbl.bundleVerNo' />", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"bundleCont", title:"<spring:message code='global.lbl.bundleNm' />", width:260
            }

            ,{title:""}
        ]

    });

    if(parentOptions.autoBind){
        displayGrid();
    }

    function displayGrid() {

        var params = {};

        params["sStdDt"] = kendo.toString($('#sStdDt').data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");

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

                if(rows.length < 1 || rows[0].stdDt == null) {
                    dms.notification.warning("<spring:message code='cmm.info.noCompareTarget' />");     // 해당하는 대사 대상이 없습니다
                    return;
                }

                gvStdDtForSearch = rows[0].stdDt;
//                 $('#stdDt').data('kendoExtMaskedDatePicker').value(jqXHR.substring(0, 4) + "-" + jqXHR.substring(4, 6) + "-" + jqXHR.substring(6, 8));
                $('#stdDt').data('kendoExtMaskedDatePicker').value(rows[0].stdDt.substring(0, 4) + "-" + rows[0].stdDt.substring(4, 6) + "-" + rows[0].stdDt.substring(6, 8));
                selectCompareTargetBundle();


//                 if(jqXHR == "") {
//                     alert("해당하는 대사 대상이 없습니다. ");
//                 } else {
//                     $('#stdDt').data('kendoExtMaskedDatePicker').value(jqXHR.substring(0, 4) + "-" + jqXHR.substring(4, 6) + "-" + jqXHR.substring(6, 8));

//                     selectCompareTargetBundle();
//                 }

            }
        });


//
    }

    function selectCompareTargetBundle() {

        $('#grid').data('kendoExtGrid').dataSource._destroyed = [];
        $('#grid').data('kendoExtGrid').dataSource.read();
    }

    function addNew() {
        $('#stdDt').data('kendoExtMaskedDatePicker').value(null);
        $('#stdDt').data('kendoExtMaskedDatePicker').enable(true);

        $('#grid').data('kendoExtGrid').dataSource._destroyed = [];
        $('#grid').data('kendoExtGrid').dataSource.data([]);


    }


    function addBundle() {
        getBundle();
    }


    // Bundle 추가
    function addBundle_Old() {

        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();
        var insertList = [];

        if(rows !== null) {
            $.each(rows, function(idx, row){
//                 insertList.push(grid.dataItem(row));
                var objRow = grid.dataItem(row);
                var obj = {symbolicNm:objRow.symbolicname, bundleVerNo:objRow.version, bundleNm:objRow.presentationname};
                insertList.push(obj);
            });

        }

        var param = {
            "insertList":insertList
        }

//         parentOptions.callbackFunc(param);
//         parent.searchOBRBundleMngPopupWin.close();
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

    function getBundle() {
        var params = {};

//         params["ipAddr"]      = '127.0.0.1';   // Temporary Code !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        params["mesgCd"]      = '30015';       // OSGi Bundle Repository Resource Query
        params["mesgGrpCd"]   = 'E';           // SyncCommandSndr
        params["dlrCd"]       = parentOptions.dlrCd;

//         params["repository"]  = 'file:///D:\\develop\\ControlServer\\repository\\repository.xml';
//         params["repository"]  = $('#repository').data('kendoExtDropDownList').value();
        params["repository"]  = cmmPrtyListObj['DCS_REPO_URL'];

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
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        var objTarget = $(objXML).find('resource');
        objJson.total = objTarget.length;

        console.log(JSON.stringify(objJson));


        var grid = $("#grid").data("kendoExtGrid");
        var dataItem = grid.dataSource.data();
        var length = dataItem.length;


/*
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

        if(objJson.result == 'OK') {
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

        } else if(objJson.result == 'NOK') {
            dms.notification.error(objJson.result_msg);
        }



//      $('#grid').data("kendoExtGrid").dataSource.data(objJson.resource);
    }


    var validator = $("#saveForm").kendoExtValidator().data("kendoExtValidator");

    function save() {

//         if (dms.string.isEmpty($("#stdDt").val())) {
//             dms.notification.info("<spring:message code='global.lbl.stdDt' var='message' /><spring:message code='global.info.validation.select' arguments='${message}' />");
//             return false;
//         }

        if (!validator.validate()) {
            return;
        }

        // 저장하시겠습니까?
        if(!confirm("<spring:message code='global.lbl.save' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
            return;
        }

        var param = $("#grid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList");
        var vStdDt = kendo.toString($('#stdDt').data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");

        $.each(param.insertList, function(idx, row) {
            row.stdDt = vStdDt;
        });

/*
        $.each(param.insertList, function(idx, row) {
            for(var key in row) {
                if(key == "aria-selected") {
                    delete(row[key]);
                }
            }
        });

        $.each(param.updateList, function(idx, row) {
            for(var key in row) {
                if(key == "aria-selected") {
                    delete(row[key]);
                }
            }
        });

        $.each(param.deleteList, function(idx, row) {
            for(var key in row) {
                if(key == "aria-selected") {
                    delete(row[key]);
                }
            }
        });
*/
//         alert(JSON.stringify(param));
//         return;

        $.ajax({
            url:"<c:url value='/dply/spec/comp/multiOBRBundleForComp.do' />",
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);
                alert("error");

            },
            success:function(jqXHR, textStatus) {
//                 alert(jqXHR);

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");

                selectCompareTargetBundle();
            }
        });
    }

});
</script>
