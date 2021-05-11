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

// 스케줄유형코드:COM031
var scheduleTpList = [];

<c:forEach var="obj" items="${scheduleTpDS}">
    scheduleTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

var scheduleTpArray = [];
$.each(scheduleTpList, function(idx, obj){
    scheduleTpArray[obj.cmmCd] = obj.cmmCdNm;
});

</script>


<form id="scheduleForm" name="scheduleForm" method="POST" onsubmit="return false;">
<!-- Job Schedule List 조회 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <!-- <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1> -->
        <h1 class="title_basic">잡스케쥴등록</h1>
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search" ><spring:message code="global.btn.search" /></button>
            <button id="btnSave" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:11%;">
                <col style="width:22%;">
                <col style="width:11%;">
                <col style="width:22%;">
                <col style="width:10%;">
                <col style="width:24%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">Schedule Name</th>
                    <td>
                        <input id="sScheduleNm" type="text" class="form_input">
                    </td>
                    <th scope="row">Schedule Type</th>
                    <td>
                        <input id="sScheduleTpCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carRegDt' /></th>		<!-- 등록일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartRegDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndRegDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s" id="btnAdd"><spring:message code="global.btn.add" /></button>
            <button class="btn_s" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="scheduleGrid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:11%;">
                <col style="width:14%;">
                <col style="width:11%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col style="width:17%;">
                <col style="width:10%;">
                <col style="width:13%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">Schedule Name</th>
                    <td>
                        <input id="scheduleNm" name="scheduleNm" class="form_input" data-json-obj="true" >
                    </td>
                    <th scope="row">Schedule Type</th>
                    <td>
                        <input id="scheduleTpCd" name="scheduleTpCd" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row">Start Date</th>
                    <td>
                        <input id="scheduleStartDt" name="scheduleStartDt" data-json-obj="true" class="form_datetimepicker">
                    </td>
                    <th scope="row">삭제여부</th>
                    <td>
                        <input id="delYn" name="delYn" data-json-obj="true" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row">CronTab Expression</th>
                    <td colspan="3">
                        <textarea id="crontabPattCont" name="crontabPattCont" rows="4" placeholder="" class="form_textarea" data-json-obj="true" ></textarea>
                    </td>
                    <th scope="row">Execution Command</th>
                    <td colspan="3">
                        <textarea id="execCmdNm" name="execCmdNm" rows="4" placeholder="" class="form_textarea" data-json-obj="true" ></textarea>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>

    <!-- Job Schedule 실행이력 List 조회 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="scheduleExecHistGrid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>
</form>


<!-- Test Area -->
<section class="group">
    <div class="header_area">
         <h1 class="title_basic">Test</h1>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:11%;">
                <col style="width:89%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">TEST AREA</th>
                    <td>
                        <textarea id="testArea" name="testArea" rows="4" cols="30" placeholder="" class="form_textarea" data-json-obj="true" ></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- Test Area -->



<script type="text/javascript">


/******************************************
 * 함수영역 - start
 ******************************************/

var gv_scheduleGridModel_currUid = null;

function save() {

    var param = $("#scheduleGrid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList");
/*
    var param = {
        "specSqlSaveVO":$("#sqlGrid").data("kendoExtGrid").getCUDData("insertSpecSqlList", "updateSpecSqlList", "deleteSpecSqlList")
        ,"multiFlag":""
    }
*/

//     param.specBasicVO.regDt = $("#regDt").data("kendoExtMaskedDatePicker").value();           // 등록일

    // 저장하시겠습니까?
    if(!confirm("<spring:message code='global.lbl.save' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
        return;
    }


    $.each(param.insertList, function(idx, row) {
//         row.set("regDt", null);
//         row.set("updtDt", null);

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

    alert(JSON.stringify(param));
    $('#testArea').val(JSON.stringify(param));

//     return;

    $.ajax({
        url:"<c:url value='/dply/cmm/jobSchMng/multiJobSchedule.do' />",
        data:JSON.stringify(param),
        type:'POST',
        dataType:'json',
        contentType:'application/json',
        error:function(jqXHR, status, error) {
            //dms.notification.error(jqXHR.responseJSON.errors);
            alert("error");

        },
        success:function(jqXHR, textStatus) {

//             initPage();

//             alert(jqXHR);
//             $("#specCd").val(jqXHR);

            //정상적으로 반영 되었습니다.
            dms.notification.success("<spring:message code='global.info.success'/>");

            $("#scheduleGrid").data("kendoExtGrid").dataSource.read();
        }
    });

}

function initDetail() {
    $('#scheduleNm').val(null);
    $('#scheduleTpCd').data("kendoExtDropDownList").value(null);
    $('#crontabPattCont').val(null);
    $('#scheduleStartDt').data("kendoDateTimePicker").value(null);
    $('#execCmdNm').val(null);
    $('#delYn').data("kendoExtDropDownList").value(null);

    $("#scheduleExecHistGrid").data("kendoExtGrid").dataSource.data([]);

}

//진행된 Deploy Master가 있는지 확인하는 function
function checkPossibleDeletingSpec(specCd) {
 var param = {
         "specCd":specCd
     };

 var returnVal = null;

 $.ajax({
     url:"<c:url value='/dply/spec/specMng/selectNotNewDplyMastCnt.do' />",
     data:param,
     async:false,
     type:'POST',
     dataType:'json',
     contentType:'application/x-www-form-urlencoded',
     error:function(jqXHR, status, error) {
//          dms.notification.error(jqXHR.responseJSON.errors);
         returnVal = false;
     },
     success:function(jqXHR, textStatus) {
         if(jqXHR == 0) {
             returnVal = true;
         } else {
             returnVal = false;
         }
     }
 });

 return returnVal;

}




/******************************************
 * 함수영역 - end
 ******************************************/

$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#scheduleGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){
            save();
        }
    });


    // 등록 시작일
    $("#sStartRegDt").kendoExtMaskedDatePicker({
        format:"{0:"+vDtyyyyMMdd+"}"
       ,patternToMask:vDtyyyyMMdd
       ,value:oneDay
   });

    // 등록 종료일
    $("#sEndRegDt").kendoExtMaskedDatePicker({
         format:"{0:"+vDtyyyyMMdd+"}"
        ,patternToMask:vDtyyyyMMdd
        ,value:toDay
    });

    //그리드 설정
    $("#scheduleGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/jobSchMng/selectJobSchedule.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sScheduleNm"] = $("#sScheduleNm").val();
                        params["sScheduleTpCd"] = $("#sScheduleTpCd").val();

                        // 등록일자
                        params["sStartRegDt"] = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndRegDt"]   = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"scheduleNm"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,scheduleNm:{type:"string", validation:{required:true}}
                        ,scheduleTpCd:{type:"string", validation:{required:true}}
                        ,crontabPattCont:{type:"string", validation:{required:true}}
                        ,scheduleStartDt:{type:"date", validation:{required:true}}
                        ,execCmdNm:{type:"string"}
                        ,delYn:{type:"string", validation:{required:true}}
                        ,regUsrId:{type:"string"}
                        ,regDt:{type:"date"}
                        ,updtUsrId:{type:"string"}
                        ,updtDt:{type:"date"}
                    }
                }
            }
            ,requestEnd:function(e) {
                $("#scheduleGrid").data("kendoExtGrid").dataSource.data([]);

                initDetail();

            }
        }

//         ,multiSelectWithCheckbox:true
        ,height:230
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"scheduleNm", title:"Schedule Name", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"scheduleTpCd", title:"Type", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=scheduleTpArray[scheduleTpCd]#"
            }
            ,{field:"delYn", title:"삭제여부", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"scheduleStartDt", title:"Start Date", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"crontabPattCont", title:"CronTab Expression", width:250
            }
            ,{field:"execCmdNm", title:"Execution Command", width:250
            }
        ]
        ,change:function(e) {
//          if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

                gv_scheduleGridModel_currUid = selectedVal.uid;

                $('#scheduleNm').val(selectedVal.scheduleNm);
                $('#scheduleTpCd').data("kendoExtDropDownList").value(selectedVal.scheduleTpCd);
                $('#crontabPattCont').val(selectedVal.crontabPattCont);
                $('#scheduleStartDt').data("kendoDateTimePicker").value(selectedVal.scheduleStartDt);
                $('#execCmdNm').val(selectedVal.execCmdNm);
                $('#delYn').data("kendoExtDropDownList").value(selectedVal.delYn);

                $("#scheduleExecHistGrid").data("kendoExtGrid").dataSource.read();
            } else {
                initDetail();
            }


        }
        ,dataBinding:function(e) {

        }

    });


    //버튼 - Schedule 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            var grid = $("#scheduleGrid").data("kendoExtGrid");

            var dataItem = grid.dataSource.insert(0, {
                 scheduleNm     :''
                ,scheduleTpCd   :'1'
                ,crontabPattCont:''
                ,scheduleStartDt:''
                ,execCmdNm      :''
                ,delYn          :'N'
//                                                      ,failAftCtnuPgssYn:cmmPrtyListObj['specReg.sql.failAftCtnuPgssYn']
//                                                      ,failAftRollbackYn:cmmPrtyListObj['specReg.sql.failAftRollbackYn']
                                                 });

            gv_scheduleGridModel_currUid = dataItem.uid;
            grid.select(dataItem);
        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            var i = 0;
            var param = $("#scheduleGrid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList");
            $('#testArea').val(JSON.stringify(param));

//             $('#scheduleGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    // 스케줄유형코드
    $("#scheduleTpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:scheduleTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

    //스케줄유형코드
    $("#sScheduleTpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:scheduleTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

    // 삭제여부
    $("#delYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // 스케줄시작일자
    $("#scheduleStartDt").kendoDateTimePicker({

    });


    // 스케줄명
    $("#scheduleNm").on("change", function() {
        var grid = $("#scheduleGrid").data("kendoExtGrid");
        if(gv_scheduleGridModel_currUid == 'undefined' || gv_scheduleGridModel_currUid == null || grid.dataSource.getByUid(gv_scheduleGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_scheduleGridModel_currUid).set("scheduleNm", this.value);

    });

    // 스케줄유형코드
    $("#scheduleTpCd").on("change", function() {
        var grid = $("#scheduleGrid").data("kendoExtGrid");
        if(gv_scheduleGridModel_currUid == 'undefined' || gv_scheduleGridModel_currUid == null || grid.dataSource.getByUid(gv_scheduleGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_scheduleGridModel_currUid).set("scheduleTpCd", this.value);

    });

    // CRONTAB패턴내용
    $("#crontabPattCont").on("change", function() {
        var grid = $("#scheduleGrid").data("kendoExtGrid");
        if(gv_scheduleGridModel_currUid == 'undefined' || gv_scheduleGridModel_currUid == null || grid.dataSource.getByUid(gv_scheduleGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_scheduleGridModel_currUid).set("crontabPattCont", this.value);

    });

    // 스케줄시작일자
    $("#scheduleStartDt").on("change", function() {
        var grid = $("#scheduleGrid").data("kendoExtGrid");
        if(gv_scheduleGridModel_currUid == 'undefined' || gv_scheduleGridModel_currUid == null || grid.dataSource.getByUid(gv_scheduleGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_scheduleGridModel_currUid).set("scheduleStartDt", $("#scheduleStartDt").data("kendoDateTimePicker").value());

    });

    // 실행명령어명
    $("#execCmdNm").on("change", function() {
        var grid = $("#scheduleGrid").data("kendoExtGrid");
        if(gv_scheduleGridModel_currUid == 'undefined' || gv_scheduleGridModel_currUid == null || grid.dataSource.getByUid(gv_scheduleGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_scheduleGridModel_currUid).set("execCmdNm", this.value);

    });

    // 삭제여부
    $("#delYn").on("change", function() {
        var grid = $("#scheduleGrid").data("kendoExtGrid");
        if(gv_scheduleGridModel_currUid == 'undefined' || gv_scheduleGridModel_currUid == null || grid.dataSource.getByUid(gv_scheduleGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_scheduleGridModel_currUid).set("delYn", this.value);

    });

    // Job Scheduling 실행이력 그리드 설정
    $("#scheduleExecHistGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/jobSchMng/selectJobScheduleExecHistByCondition.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
/*
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
*/

//                         params["sScheduleNm"] = $("#sScheduleNm").val();

                        var grid = $("#scheduleGrid").data("kendoExtGrid");
                        dataItem = grid.dataItem(grid.select());

                        params["sScheduleNm"] = dataItem.scheduleNm;
                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"scheduleNm"
                    ,fields:{
                        scheduleNm     :{type:"string"}
                        ,eventDt        :{type:"date"}
                        ,seq            :{type:"number"}
                        ,endStatMesgCont:{type:"string"}
                        ,taskId         :{type:"string"}
                        ,startDt        :{type:"date"}
                        ,endDt          :{type:"date"}
                        ,regUsrId       :{type:"string"}
                        ,regDt          :{type:"date"}
                        ,updtUsrId      :{type:"string"}
                        ,updtDt         :{type:"date"}                    }
                }
            }
        }
        ,height:230
        ,autoBind:false
        ,navigatable:true
        ,pageable:false
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"seq", title:"Seq", width:40, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"scheduleNm", title:"Schedule Name", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"eventDt", title:"Event Date", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"taskId", title:"Task ID", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"endStatMesgCont", title:"State Message", width:210
            }
            ,{field:"startDt", title:"Start Date", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }
            ,{field:"endDt", title:"End Date", width:140
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
            }

        ]
        ,change:function(e) {

        }
        ,dataBinding:function(e) {

        }

    });


});





</script>







