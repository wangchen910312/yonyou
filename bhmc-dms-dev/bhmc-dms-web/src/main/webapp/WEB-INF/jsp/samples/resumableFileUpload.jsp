<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
    JSP Name:jspName.jsp
    Description:설명을 기술합니다.
    author Kang Seok Han
    since 2016. 3. 4.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 3. 4.     Kang Seok Han     최초 생성
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>Sample - Resumable FileUpload</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/resumableFileUpload/style.css' />" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->
</head>
<body>

    <div class="resumable-error">
        HTML5 File API 지원 가능 브라우져가 아닙니다
    </div>

    <div class="resumable-drop" ondragenter="jQuery(this).addClass('resumable-dragover');" ondragend="jQuery(this).removeClass('resumable-dragover');" ondrop="jQuery(this).removeClass('resumable-dragover');">
        <a class="resumable-browse"><u>파일선택 or 파일드롭</u></a>
    </div>

    <div class="resumable-progress">
        <table>
            <tr>
                <td width="100%">
                    <div class="progress-container">
                        <div class="progress-bar"></div>
                    </div>
                </td>
                <td class="progress-text" nowrap="nowrap"></td>
                <td class="progress-pause" nowrap="nowrap">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/js/resumableFileUpload/resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/js/resumableFileUpload/pause.png' />" title="Pause upload" /></a>
                </td>
            </tr>
        </table>
    </div>

    <ul class="resumable-list"></ul>

    <script type="text/javascript">
        var r = new Resumable({
            target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
            ,chunkSize:1 * 1024 * 1024
            ,simultaneousUploads:4
            ,testChunks:true
            ,throttleProgressCallbacks:1
            ,method:"octet"
//             ,resumableSessionId:""
        });

        //지원가능 여부 확인
        if (!r.support) {
            $('.resumable-error').show();
        } else {

            $('.resumable-drop').show();
            r.assignDrop($('.resumable-drop')[0]);
            r.assignBrowse($('.resumable-browse')[0]);

            //파일추가 이벤트
            r.on('fileAdded', function(file) {
                $('.resumable-progress, .resumable-list').show();
                $('.resumable-progress .progress-resume-link').hide();
                $('.resumable-progress .progress-pause-link').show();

                //파일목록 출력
                $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="file-progress-container" style="position:relative;height:20px;"><div class="resumable-file-name" style="position:absolute;top:0;left:0;z-index:1000;"></div> <div class="resumable-file-progress" style="position:absolute;top:0;left:0;background-color:#FF0000;text-align:right;"></div></div>');
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

                if (_that.opt["query"]["resumableSessionId"] == null) {
                    $.ajax({
                        url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                        dataType:"json",
                        type:"get",
                        async:false,
                        cache:false,
                        success:function(id) {
                            _that.opt["query"]["resumableSessionId"] = id;
                        }
                    });
                }

                $('.resumable-progress .progress-resume-link').hide();
                $('.resumable-progress .progress-pause-link').show();
            });
            r.on('complete', function() {
                $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();
            });
            r.on('fileSuccess', function(file, message) {
                console.log("===============");
                console.log(message);

                var result = JSON.parse(message);
                if(result.status === "finished") {


                    //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
                }


            });
            r.on('fileError', function(file, message) {
                $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').html('(file could not be uploaded:' + message + ')');
            });
            r.on('fileProgress', function(file) {
                var fileProgress = 0;

                if (file instanceof ResumableChunk) {
                    fileProgress = file.fileObj.progress();
                } else {
                    fileProgress = file.progress();
                }

                $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
                $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
                $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
            });
        }
    </script>
</body>
</html>