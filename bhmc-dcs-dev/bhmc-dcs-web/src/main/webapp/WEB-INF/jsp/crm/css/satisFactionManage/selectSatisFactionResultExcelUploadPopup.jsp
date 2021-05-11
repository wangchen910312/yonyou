<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<style type="text/css">
    .progress_section {background-color:#ffffff;border:1px solid #ddd;padding:5px;position:absolute;width:600px;top:100px;z-index:1500;margin-left:-300px;left:50%;display:none;}
    #progressMessage {height:20px;}
    #progressbar {height:25px;}
</style>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
<%--             <span class="btn_file"><spring:message code="global.lbl.FindFile" /></span> --%>
            <button id="btn_file" class="btn_s"><spring:message code="global.lbl.FindFile" /></button>
            <button id="btnFileUpload" class="btn_s btn_fileUpload"><spring:message code="global.btn.fileUpload" /></button>
<%--             <button id="btnSave" class="btn_s btn_save"><spring:message code="global.btn.save" /></button> --%>
            <button id="btnClose" class="btn_s btn_close"><spring:message code="global.btn.close" /></button>
        </div>
    </div>

    <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/crm/css/satisFactionResultManage/insertSatisFactionResultUploadFile.do"/>">
    <div class="table_form form_width_50per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:50%;">
                <col style="width:40%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.selectFile" /></th>
                    <td>
                        <input type="text" id="uploadFileValue" value="" readonly class="form_input form_readonly">
                        <div style="display:none;">
                        <input type="file" value="" id="uploadFile" name="uploadFile">
                        </div>
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>

    <div id="progressSection"></div>

</section>

<script type="text/javascript">

//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}

/**
 * 팝업 옵션
 */
var options = parent.excelUploadPopupWin.options.content.data;

$(document).ready(function() {

    //버튼
//     $(".btn_file").click(function(){
//         $("#uploadFile").click();
//     });

    $("#btn_file").kendoButton({
        click:function(e){
            $("#uploadFile").click();
        }
    });

    //버튼 - 파일찾기 value
    $("#uploadFile").change(function(){
        $("#uploadFileValue").val($(this).val());
    });

    //버튼 - 파일업로드
    $("#btnFileUpload").kendoButton({
        click:function(e){
            $("#btnFileUpload").data("kendoButton").enable(false);
            $("#btn_file").data("kendoButton").enable(false);

            if(dms.string.isEmpty($("#uploadFile").val())) {
                dms.notification.show("<spring:message code='global.lbl.file' var='fileMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fileMsg}' />", "popup");
                $("#btnFileUpload").data("kendoButton").enable(true);
                $("#btn_file").data("kendoButton").enable(true);
                return;
            }
            $("#progressSection").excelUpload("upload");
        }
    });

    //버튼 - 저장
/*     $("#btnSave").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.dataSource.data();

            //var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            if (saveData.length == 0){
                dms.notification.info("<spring:message code='global.info.required.change' />");
                return;
            }

            console.log("Sales Oppt. Info. File Upload!!");
            console.log(saveData);

            $.ajax({
                url:"<c:url value='/crm/css/satisFactionResultManage/insertSatisFactionResultBatchUpload.do' />"
                ,data:JSON.stringify({"batchUploadList":saveData})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                //,success:function(result){
                    //console.log(result);
                    //options.callbackFunc.call();
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    parent.excelUploadPopupWin.close();
                }
            });
       }
    }); */

    //버튼 - 닫기
    $("#btnClose").kendoButton({
        click:function(e){
            parent.excelUploadPopupWin.close();
       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_MESSAGE_SOURCE"
        ,uploadForm :"uploadForm"
        ,uploadStatusUrl:"<c:url value='/cmm/excelUpload/selectExcelUploadStatus.do' />"
        ,interval:300
        ,messages:{
            fileUpload:"<spring:message code='global.info.fileUpload.processing' />"
            ,fileUploadComplete:"<spring:message code='global.info.fileUpload.complete' />"
            ,dataExtract:"<spring:message code='global.info.excelUpload.dataExtract.complete' />"
            ,dataExtractComplate:"<spring:message code='global.info.excelUpload.dataExtract.processing' />"
            ,uploadComplete:"<spring:message code='global.info.excelUpload.complete' />"
        }
        ,callback:function(obj){
            localData = obj;
            console.log("+++++++++++++ Local Data++++++++++++++");
            console.log(localData);
            console.log("+++++++++++++ Local Data++++++++++++++");
            options.callbackFunc.call();
            parent.excelUploadPopupWin.close();
            $("#btnFileUpload").data("kendoButton").enable(true);
            $("#btn_file").data("kendoButton").enable(true);
        }

    });


});
</script>
