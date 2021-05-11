<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- 목표 개선 현황 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="mis.title.targetimprovestatus" /></h1>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-10816" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m" id="btnSave" name="btnSave"><spring:message code="global.btn.save" /></button>
		</dms:access>
        </div>
    </div>
    <div class="table_form">
    <form id="saveForm">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:65%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="mis.lbl.iprovedate" /></span></th>
                    <td><input type="text" id="improveYearMonth" name="improveYearMonth" class="form_datepicker" style="width:150px;" maxlength="6"></td>
                    <th scope="row"><span class="bu_required"><spring:message code="mis.lbl.cause" /></span></th>
                    <td><input type="text" id="improveCause" name="improveCause" class="form_input"></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></h2>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-10817" hasPermission="${dms:getPermissionMask('READ')}">
            <span class="btn_file" id="btnFileSel"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
        </dms:access>
        <dms:access viewId="VIEW-D-10818" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_s" id="btnFileDel"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
		</dms:access>
        </div>
    </div>
    <div class="table_grid">
        <div id="fileGrid"></div>
    </div>
    <input type="hidden" id="fileDocNo" name="fileDocNo">
    <br>
        <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
<!-- //목표 개선 현황 -->

<script>
    $(document).ready(function() {

        $("#improveYearMonth").kendoDatePicker({
            value:"${sysdate}"
           ,start:"year"
           ,depth:"year"
           ,format:"yyyyMM"
        });

        $("#improveYearMonth").kendoMaskedTextBox({
            mask:"######"
        });

        var now = new Date();

        function leadingZeros(n, digits) {
            var zero = '';
            n = n.toString();
            if (n.length < digits) {
                for (i = 0; i < digits - n.length; i++)
                    zero += '0';
            }
            return zero + n;
        }

        $("#improveYearMonth").val(leadingZeros(now.getFullYear(), 4) + leadingZeros(now.getMonth()+1, 2));

        // 버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {

                var tempUrl     = "";
                var saveData    = "";

                tempUrl = "<c:url value='/mis/tis/insertTargetIpvmStatus.do' />";
                saveData = $("#saveForm").serializeObject();

                $.ajax({
                    url:tempUrl
                  , data:JSON.stringify(saveData)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        //dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        var data = [];
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        $("#fileDocNo").val("");
                        $('#grid').data('kendoExtGrid').dataSource.page(1);
                        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
                    }
                });
            }

        });

        // 파일 그리드 시작 //
        $("#fileGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if(operation === "read") {
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
            ,height:80
            ,navigatable:false
            ,filterable:false
            ,pageable:false
            ,resizable:false
            ,sortable:false
            ,columns:[
                {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"}                   // 파일명
                ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:100    // 파일크기
                    ,attributes:{"class":"ar"}
                    ,template:"#=dms.string.formatFileSize(fileSize)#"}
            ]
        });
        // 파일 그리드 종료 //

      //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-MIS-0903-133101"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/mis/tis/selectTargetIpvmStatusSearch.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

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
                             seq:{type:"number"}
                            ,regYyMm:{type:"string"}
                            ,reasonCont:{type:"string"}
                            ,fileDocNo:{type:"string"}
                            ,regUsrId:{type:"string"}
                            ,regDt:{type:"string"}
                            ,fileNo:{type:"number"}
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,filterable:false
            ,columns:[
                 {field:"regYyMm", title:"<spring:message code='mis.lbl.iprovedate' />", width:150 ,attributes:{"class":"ac"}}
                ,{field:"reasonCont", title:"<spring:message code='mis.lbl.cause' />"}
                ,{_field:"fileDownload", title:"<spring:message code='mis.lbl.iproveidea' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:"<dms:access viewId='VIEW-D-10819' hasPermission='${dms:getPermissionMask(\"READ\")}'><span class='txt_label bg_yellow' onClick='dms.fileManager.download(\"#=fileDocNo#\",\"#=fileNo#\")'><spring:message code='global.btn.download' /></span></dms:access>"
                }
                ,{field:"regUsrId", title:"<spring:message code='mis.lbl.regUsrId' />", width:200, attributes:{"class":"ac"}}
                ,{field:"regDt", title:"<spring:message code='mis.lbl.referDt' />", width:200, attributes:{"class":"ac"}}


            ]
        });
    });

  //================================
    var r = new Resumable({
        target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
        ,chunkSize:1 * 1024 * 1024
        ,simultaneousUploads:4
        ,testChunks:true
        ,throttleProgressCallbacks:1
        ,maxFiles:1
        ,method:"octet"
    });
    r.assignBrowse($('#btnFileSel')[0]);

    //파일추가 이벤트
    r.on('fileAdded', function(file) {

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
                    //viewModel.set("data.fileDocNo", id);
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

        console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

        $("#progressWindow").data("kendoWindow").close();
        r.files = [];
        $(".resumable-list").html("");
    });
    r.on('fileSuccess', function(file, message) {
        console.log("===============");
        console.log(message);

        var result = JSON.parse(message);
        if(result.status === "finished") {
            $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                 fileDocNo:result.fileDocNo
                ,fileNo:result.fileNo
                ,fileNm:result.fileNm
                ,fileSize:result.fileSize
            });
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
</script>