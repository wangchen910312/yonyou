<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="fileViewWindow" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11246" hasPermission="${dms:getPermissionMask('READ')}">
                <span class="btn_file" id="fileSelect" ><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
            </dms:access>
            <dms:access viewId="VIEW-D-11245" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
            </dms:access>
        </div>
    </div>
    <div class="table_grid">
        <div id="fileGrid" class="grid"></div>
    </div>
    <!-- 파일업로드 -->
    <input type="hidden" id="fileDocNo" />
</section>

<script type="text/javascript">
var ru;
var rs;
var r;

var maxFileSize = 1024*1024*50;
var maxfiles = 50;

$(document).ready(function () {


  //========파일삭제
    $("#fileDelete").click(function(){
        var fileGrid = $("#fileGrid").data("kendoExtGrid");
        var rows = fileGrid.select();
        var selectedItem = fileGrid.dataItem(rows);

        if (rows.length < 1) {
            //목록을 선택하여 주십시오.
            dms.notification.info("<spring:message code='global.info.required.select'/>");
            return;
        }

        dms.window.confirm({
            message:"<spring:message code='global.btn.fileDelete' var='fileDelete' /><spring:message code='global.info.cnfrmMsg' arguments='${fileDelete}' />"
            ,title :"<spring:message code='global.btn.fileDelete' />"
            ,callback:function(result){
                if(result){

                    var deleteList = [];
                    rows.each(function(index, row) {
                        var dataItem = fileGrid.dataItem(row);
                        deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
                    });

                    $.ajax({
                        url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
                        ,data:JSON.stringify(deleteList)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {
                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                            //dms.notification.success("정상적으로 삭제되였습니다.");

                            var fileGrid = $("#fileGrid").data("kendoExtGrid");
                            var grid = $('#grid2').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());

                            var rows = fileGrid.select();
                            rows.each(function(index, row) {
                                fileGrid.removeRow(row);
                            });
                            gridIndex = grid.select().index();

                            if(selectedItem != null ){
                                selectedItem.set("fileDocCnt", fileGrid.dataSource._data.length);
                            }
                            fnDetlGroupHeader();
                        }
                    });

                }else{
                    return false;
                }
            }
        });

    });


    // 파일 그리드 시작
    $("#fileGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation == "read") {
                        var params = {};
                        params["sFileDocNo"] = $("#fileDocNo").val();
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    fields:{
                         fileDocNo:{type:"string"}
                        ,fileNo:{type:"number"}
                        ,fileNm:{type:"string"}
                        ,fileSize:{type:"number"}
                    }
                }
            }
        }
       ,autoBind:false
       ,editable:false
       ,height:200
       ,multiSelectWithCheckbox:true
       ,navigatable:false
       ,pageable:false
       ,resizable:false
       ,sortable:false
       ,filterable:false
       ,columns:[
           {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" ,width:150,attributes:{"class":"al"}}           // 파일명
          ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" ,width:50,attributes:{"class":"ar"}
              ,template:"#= dms.string.formatFileSize(fileSize) #"
           }       // 파일크기
          ,{title:"",width:50,attributes:{"class":"ac"}
              ,template:"<span class='txt_label bg_blue' onClick='dms.fileManager.download(\"#=fileDocNo#\",\"#=fileNo#\")' >"+'<spring:message code='global.btn.download' />'+"</span>"//다운로드z
           }

       ]
    });
    // 파일 그리드 종료 //


    rs = new Resumable({
        target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
        ,chunkSize:1 * 1024 * 1024
        ,simultaneousUploads:10
        ,testChunks:true
        ,throttleProgressCallbacks:1
        ,method:"octet"
       // ,fileType:["png", "jpg", "jpeg", "gif"]
       // ,fileTypeErrorCallback:function(file, errorCount) {
       //     alert("只能上传图片,请重新上传图片");
       // }
        ,maxFiles:1
        ,maxFileSize:maxFileSize
   });
   rs.assignBrowse($("#fileSelectContract")[0]);
   rs.assignBrowse($("#fileSelectBuss")[0]);
   rs.assignBrowse($("#fileSelectEtc")[0]);
   rs.assignBrowse($("#fileSelectAdd")[0]);

   //파일추가 이벤트
   rs.on('fileAdded', function(file) {

       ru = this;

       $("#progressWindow").kendoWindow({
           width:"600px"
           ,height:"300px"
           ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
           ,animation:false
           ,draggable:false
           ,visible:false
           ,resizable:false
           ,modal:true
       }).data("kendoWindow").center().open();

       $('.resumable-progress, .resumable-list').show();
       $('.resumable-progress .progress-resume-link').hide();
       $('.resumable-progress .progress-pause-link').show();

       //파일목록 출력
       $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
       $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

       //업로드 시작
       rs.upload();
    });
    rs.on('pause', function() {
        $('.resumable-progress .progress-resume-link').show();
        $('.resumable-progress .progress-pause-link').hide();
    });
    rs.on('uploadStart', function() {

        var _that = this;

        if (_that.opt["query"] == null) {
             _that.opt["query"] = {};
        }

        if (dms.string.isEmpty($("#headFileDocId").val())) {
            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                dataType:"json",
                type:"get",
                async:false,
                cache:false,
                success:function(id) {
                    _that.opt["query"]["resumableSessionId"] = id;
                    $("#headFileDocId").val(id);
                }
            });
        } else {
            _that.opt["query"]["resumableSessionId"] = $("#headFileDocId").val();
        }

        $('.resumable-progress .progress-resume-link').hide();
        $('.resumable-progress .progress-pause-link').show();
    });
    rs.on('fileSuccess', function(file, message) {
        var result = JSON.parse(message);
        if(result.status === "finished") {

            if(dms.string.isEmpty($("#headFileDocId").val())){
                $("#headFileDocId").val(result.fileDocNo);
            }

            console.log(result );
            console.log("fileBtn : " + fileBtn);


            if(fileBtn == "fileSelectContract"){
                $("#contractFileNm").val(result.fileNm);
                $("#contractFileNo").val(result.fileNo);

                $("#fileSelectContract").hide();
                $("#contractFileDel").show();
                $("#contractFile").show();

            }else if(fileBtn == "fileSelectBuss"){
                $("#bussLicenceNm").val(result.fileNm);
                $("#bussLicenceNo").val(result.fileNo);

                $("#fileSelectBuss").hide();
                $("#bussLicenceDel").show();
                $("#bussLicence").show();
            }else if(fileBtn == "fileSelectEtc"){
                $("#etcFileNm").val(result.fileNm);
                $("#etcFileNo").val(result.fileNo);

                $("#fileSelectEtc").hide();
                $("#etcFileDel").show();
                $("#etcFile").show();

            }else if(fileBtn == "fileSelectAdd"){
                $("#addFileNm").val(result.fileNm);
                $("#addFileNo").val(result.fileNo);

                $("#fileSelectAdd").hide();
                $("#addFileDel").show();
                $("#addFile").show();
            }
        }
    });
    rs.on('complete', function() {

        var _that = this;
        $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

        console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

        $("#progressWindow").data("kendoWindow").close();
        rs.files = [];
        $(".resumable-list").html("");
    });
    rs.on('fileError', function(file, message) {
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
    });
    rs.on('fileProgress', function(file) {
        var fileProgress = 0;

        if (file instanceof ResumableChunk) {
            fileProgress = file.fileObj.progress();
        } else {
            fileProgress = file.progress();
        }

        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
        $('.progress-bar').css({width:Math.min(Math.floor(rs.progress() * 100), 100)+ '%'});
    });


    /* *************************************************************************
     **************************차량정보 이미지 파일 올리기. ********************************************
     ***************************************************************************/
     //================================

    r = new Resumable({
         target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
         ,chunkSize:1 * 1024 * 1024
         ,simultaneousUploads:10
         ,testChunks:true
         ,throttleProgressCallbacks:1
         ,method:"octet"
         ,fileType:["png", "jpg", "jpeg", "gif"]
         ,maxFiles:maxfiles
         ,maxFileSize:maxFileSize
         ,fileTypeErrorCallback:function(file, errorCount) {
             dms.notification.warning("只能上传图片,请重新上传图片");
         }
         //,maxFiles:1
     });
     r.assignBrowse($("#fileSelect")[0]);


     //파일추가 이벤트
     r.on('fileAdded', function(file) {

         ru = this;


         if( $("#fileGrid").data("kendoExtGrid").dataSource._total > (maxfiles-1) ){
             dms.notification.warning("<spring:message code='ser.info.fileUploadCntChk' arguments='${maxfiles}' />");
             return;
         }

         $("#progressWindow").kendoWindow({
             width:"600px"
             ,height:"300px"
             ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
             ,animation:false
             ,draggable:false
             ,visible:false
             ,resizable:false
             ,modal:true
         }).data("kendoWindow").center().open();


         $('.resumable-progress, .resumable-list').show();
         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();

         //파일목록 출력
         $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

         //업로드 시작
         r.upload();

     });
     r.on('pause', function() {
         $('.resumable-progress .progress-resume-link').show();
         $('.resumable-progress .progress-pause-link').hide();
     });
     r.on('uploadStart', function() {

         var _that = this;

         if (_that.opt["query"] == null) {
              _that.opt["query"] = {};
         }

         if (dms.string.isEmpty($("#fileDocNo").val())) {
             $.ajax({
                 url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                 dataType:"json",
                 type:"get",
                 async:false,
                 cache:false,
                 success:function(id) {
                     _that.opt["query"]["resumableSessionId"] = id;
                     $("#fileDocNo").val(id);
                 }
             });
         } else {
             _that.opt["query"]["resumableSessionId"] = $("#fileDocNo").val();
         }

         $('.resumable-progress .progress-resume-link').hide();
         $('.resumable-progress .progress-pause-link').show();
     });
     r.on('complete', function() {

         var _that = this;

         $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

         $("#progressWindow").data("kendoWindow").close();
         r.files = [];
         $(".resumable-list").html("");


     });

     r.on('fileSuccess', function(file, message) {

         var result = JSON.parse(message);
 //console.log(result);

         if(result.status === "finished") {
             $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                 fileDocNo:result.fileDocNo
                 ,fileNo:result.fileNo
                 ,fileNm:result.fileNm
                 ,fileSize:dms.string.formatFileSize(result.fileSize)
             });
             //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
/*
            if (!dms.string.isEmpty($("#fileDocNo").val()) && reqSeq != undefined) {

                 //집단판매신청 차량정보에(SA_0413T)에 첨부파일 FILE_DOC_ID 추가 .
                 var data = {"reqSeq":reqSeq
                             ,"dlrCd":dlrCd
                             ,"usrId":usrId
                             ,"reqLowerSeq":reqLowerSeq
                             ,"fileDocId":$("#fileDocNo").val()
                        };

                 $.ajax({
                     url:"<c:url value='/sal/svo/groupSalesApplication/updateGroupSalesFile.do' />",
                     data:JSON.stringify(data),
                     type:'POST',
                     dataType:'json',
                     contentType:'application/json',
                     error:function(jqXHR,status,error){
                         dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                     },
                     success:function(jqXHR, textStatus){
                         //정상적으로 반영 되었습니다.
                         $('#grid2').data('kendoExtGrid').dataSource.read();
                     }
                 });
             }else{
                 var grid = $('#grid2').data('kendoExtGrid');
                 var selectedItem = grid.dataItem(grid.select());
                 selectedItem.set("fileDocId", $("#fileDocNo").val());

             } */

             var grid = $('#grid2').data('kendoExtGrid');
             var fileCnt = $("#fileGrid").data("kendoExtGrid").dataSource._data.length;

             var selectedItem = grid.dataItem(grid.select());
             gridIndex = grid.select().index();
             if(selectedItem != null ){
                 selectedItem.set("fileDocId", $("#fileDocNo").val());
                 selectedItem.set("fileDocCnt", fileCnt);
             }

            $("#fileViewWindow").data("kendoWindow").close();
            //$('#grid2').data('kendoExtGrid').dataSource.page(1);

         }
     });
     r.on('fileError', function(file, message) {
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
     });
     r.on('fileProgress', function(file) {
         var fileProgress = 0;

         if (file instanceof ResumableChunk) {
             fileProgress = file.fileObj.progress();
         } else {
             fileProgress = file.progress();
         }

         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
         $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
         $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
     });

});

</script>
