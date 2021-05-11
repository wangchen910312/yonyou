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

</script>


<form id="notificationReceiverForm" name="notificationReceiverForm" method="POST" onsubmit="return false;">
<!-- Notification Receiver List 조회 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <!-- <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1> -->
        <h1 class="title_basic">통보수신자등록</h1>
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
                <col style="width:12%;">
                <col style="width:12%;">
                <col style="width:12%;">
                <col style="width:15%;">
                <col style="width:12%;">
                <col style="width:13%;">
                <col style="width:24%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">Sequence</th>
                    <td>
                        <input id="sSeq" type="text" class="form_input">
                    </td>
                    <th scope="row">Email Addr</th>
                    <td>
                        <input id="sEmailNm" type="text" class="form_input">
                    </td>
                    <th scope="row">Cellular Phone</th>
                    <td>
                        <input id="sHpNo" type="text" class="form_input" >
                    </td>
                    <td></td>
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
        <div id="notificationReceiverGrid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:12%;">
                <col style="width:12%;">
                <col style="width:15%;">
                <col style="width:12%;">
                <col style="width:13%;">
                <col style="width:12%;">
                <col style="width:12%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">Sequence</th>
                    <td>
                        <input id="seq" name="seq" class="form_input" data-json-obj="true" >
                    </td>
                    <th scope="row">Email Addr</th>
                    <td>
                        <input id="emailNm" name="emailNm" class="form_input" data-json-obj="true" >
                    </td>
                    <th scope="row">Celluar Phone</th>
                    <td>
                        <input id="hpNo" name="hpNo" class="form_input" data-json-obj="true" >
                    </td>
                    <th scope="row">삭제여부</th>
                    <td>
                        <input id="delYn" name="delYn" data-json-obj="true" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row">Deploy Notification</th>
                    <td>
                        <input id="deployNotiYn" name="deployNotiYn" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row">System Notification</th>
                    <td>
                        <input id="systemNotiYn" name="systemNotiYn" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row">Email Notification</th>
                    <td>
                        <input id="emailNotiYn" name="emailNotiYn" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row">Phone Notification</th>
                    <td>
                        <input id="hpNotiYn" name="hpNotiYn" data-json-obj="true" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
</form>




<!-- Test Area -->
<!--
<section class="group">
    <div class="header_area">
         <h1 class="title_basic">Test</h1>
    </div>
    <div class="table_form">
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
                    <th scope="row">TEST AREA</th>
                    <td colspan="7">
                        <textarea id="testArea" name="testArea" rows="4" cols="30" placeholder="" class="form_textarea" style="width:100%;" data-json-obj="true" ></textarea>
                    </td>
                </tr>


            </tbody>
        </table>
    </div>

</section>
 -->
<!-- Test Area -->



<script type="text/javascript">


/******************************************
 * 함수영역 - start
 ******************************************/

var gv_notificationReceiverGridModel_currUid = null;

function save() {

    var param = $("#notificationReceiverGrid").data("kendoExtGrid").getCUDData("insertList", "updateList", "deleteList");

    // 저장하시겠습니까?
    if(!confirm("<spring:message code='global.lbl.save' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
        return;
    }


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

//     alert(JSON.stringify(param));
//     $('#testArea').val(JSON.stringify(param));

//     return;

    $.ajax({
        url:"<c:url value='/dply/cmm/noti/multiNotificationReceiver.do' />",
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

            $("#notificationReceiverGrid").data("kendoExtGrid").dataSource.read();
        }
    });

}

function initDetail() {
    $('#seq').val(null);
    $('#emailNm').val(null);
    $('#hpNo').val(null);
    $('#delYn').data("kendoExtDropDownList").value(null);
    $('#deployNotiYn').data("kendoExtDropDownList").value(null);
    $('#systemNotiYn').data("kendoExtDropDownList").value(null);
    $('#emailNotiYn').data("kendoExtDropDownList").value(null);
    $('#hpNotiYn').data("kendoExtDropDownList").value(null);

//     $("#scheduleExecHistGrid").data("kendoExtGrid").dataSource.data([]);

}


/******************************************
 * 함수영역 - end
 ******************************************/

$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#notificationReceiverGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){
            save();
        }
    });

    //그리드 설정
    $("#notificationReceiverGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/dply/cmm/noti/selectNotificationReceiver.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSeq"] = $("#sSeq").val();
                        params["sEmailNm"] = $("#sEmailNm").val();
                        params["sHpNo"] = $("#sHpNo").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"seq"
                    ,fields:{
                         seq         :{type:"number", validation:{required:true}, editable:false}
//                          seq         :{type:"number", validation:{required:true}}
                        ,emailNm     :{type:"string"}
                        ,hpNo        :{type:"string"}
                        ,deployNotiYn:{type:"string", validation:{required:true}}
                        ,systemNotiYn:{type:"string", validation:{required:true}}
                        ,delYn       :{type:"string", validation:{required:true}}
                        ,emailNotiYn :{type:"string", validation:{required:true}}
                        ,hpNotiYn    :{type:"string", validation:{required:true}}
                        ,regUsrId    :{type:"string"}
                        ,regDt       :{type:"date"}
                        ,updtUsrId   :{type:"string"}
                        ,updtDt      :{type:"date"}
                    }
                }
            }
            ,requestEnd:function(e) {
                $("#notificationReceiverGrid").data("kendoExtGrid").dataSource.data([]);

                initDetail();

            }
        }

//         ,multiSelectWithCheckbox:true
        ,height:397
        ,autoBind:false
        ,selectable:"row"
        ,editable:false
        ,columns:[
            {field:"seq", title:"Sequence", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"emailNm", title:"Email Addr", width:120
            }
            ,{field:"hpNo", title:"Celluar Phone", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"delYn", title:"삭제여부", width:70
                ,attributes:{"class":"ac"}
            }
            ,{field:"deployNotiYn", title:"Deploy Notification", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"systemNotiYn", title:"System Notification", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"emailNotiYn", title:"Email Notification", width:90
                ,attributes:{"class":"ac"}
            }
            ,{field:"hpNotiYn", title:"Phone Notification", width:90
                ,attributes:{"class":"ac"}
            }
        ]
        ,change:function(e) {
//          if(!e.sender.dataItem(e.sender.select()).isNew()) {
            if(e.sender.dataItem(e.sender.select()) != null) {
                var selectedVal = this.dataItem(this.select());

                gv_notificationReceiverGridModel_currUid = selectedVal.uid;

                $('#seq').val(selectedVal.seq);
                $('#emailNm').val(selectedVal.emailNm);
                $('#hpNo').val(selectedVal.hpNo);
                $('#delYn').data("kendoExtDropDownList").value(selectedVal.delYn);
                $('#deployNotiYn').data("kendoExtDropDownList").value(selectedVal.deployNotiYn);
                $('#systemNotiYn').data("kendoExtDropDownList").value(selectedVal.systemNotiYn);
                $('#emailNotiYn').data("kendoExtDropDownList").value(selectedVal.emailNotiYn);
                $('#hpNotiYn').data("kendoExtDropDownList").value(selectedVal.hpNotiYn);

//                 $("#scheduleExecHistGrid").data("kendoExtGrid").dataSource.read();
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
            var grid = $("#notificationReceiverGrid").data("kendoExtGrid");

            var dataItem = grid.dataSource.insert(0, {
                delYn          :'N'
                ,deployNotiYn  :'Y'
                ,systemNotiYn  :'Y'
                ,emailNotiYn   :'Y'
                ,hpNotiYn      :'Y'
//                                                      ,failAftCtnuPgssYn:cmmPrtyListObj['specReg.sql.failAftCtnuPgssYn']
//                                                      ,failAftRollbackYn:cmmPrtyListObj['specReg.sql.failAftRollbackYn']
                                                 });

            gv_notificationReceiverGridModel_currUid = dataItem.uid;
            grid.select(dataItem);
        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#notificationReceiverGrid').data('kendoExtGrid').cancelChanges();
        }
    });


    // 삭제여부
    $("#delYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // DEPLOY공지여부
    $("#deployNotiYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // 시스템공지여부
    $("#systemNotiYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // 이메일공지여부
    $("#emailNotiYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });

    // 휴대폰공지여부
    $("#hpNotiYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
    });


    $("#seq").on("change", function() {
        var grid = $("#notificationReceiverGrid").data("kendoExtGrid");
        if(grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid).set("seq", this.value);

    });

    $("#emailNm").on("change", function() {
        var grid = $("#notificationReceiverGrid").data("kendoExtGrid");
        if(grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid).set("emailNm", this.value);

    });

    $("#hpNo").on("change", function() {
        var grid = $("#notificationReceiverGrid").data("kendoExtGrid");
        if(grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid).set("hpNo", this.value);

    });

    $("#delYn").on("change", function() {
        var grid = $("#notificationReceiverGrid").data("kendoExtGrid");
        if(grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid).set("delYn", this.value);

    });

    $("#deployNotiYn").on("change", function() {
        var grid = $("#notificationReceiverGrid").data("kendoExtGrid");
        if(grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid).set("deployNotiYn", this.value);

    });

    $("#systemNotiYn").on("change", function() {
        var grid = $("#notificationReceiverGrid").data("kendoExtGrid");
        if(grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid).set("systemNotiYn", this.value);

    });

    $("#emailNotiYn").on("change", function() {
        var grid = $("#notificationReceiverGrid").data("kendoExtGrid");
        if(grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid).set("emailNotiYn", this.value);

    });

    $("#hpNotiYn").on("change", function() {
        var grid = $("#notificationReceiverGrid").data("kendoExtGrid");
        if(grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid) == null) return false;
        grid.dataSource.getByUid(gv_notificationReceiverGridModel_currUid).set("hpNotiYn", this.value);

    });




});





</script>







