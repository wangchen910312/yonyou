<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.context.i18n.LocaleContextHolder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="springLocaleLanguageLanguage" scope="session" value="<%=LocaleContextHolder.getLocale().getLanguage()%>" />
<!DOCTYPE html>
<html springLocaleLanguagengLocaleLanguage}">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.rtl.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.dataviz.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-2.1.4.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/kendo/kendo.all.min.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/kendo/cultures/springLocaleLanguagee.${springLocaleLanguage}.min.js' />"></script>
<!--[if lt IE 9]>
    <script src="<c:url value="/resources/js/html5shiv.js"/>"></script>
<![endif]-->


<%-- 자바스크립트 전역변수:컨텍스트 경로 --%>
<script type="text/javascript">var _contextPath = "${pageContext.request.contextPath}";</script>

<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.common-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/cmm/sci/js/selectCultureSettings.do' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/kendo.ui.ext-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/jquery.ext-1.0.js' />"></script>
<!-- <script type="text/javascrspringLocaleLanguage.culture("${springLocaleLanguage}");</script> -->



<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
</head>

<body>

    <!-- header -->
<!--     <header id="header"> -->
<%--         <tiles:insertAttribute name="header" /> --%>
<!--     </header> -->
    <!-- //header -->

        <!-- content -->
        <section id="content">

                 <section class="group">

                            <div id="progressWindow" class="resumable-progress">
                                <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
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

                            <div class="header_area">
                                <h2 class="title_basic">파일업로드</h2>
                                <div class="btn_right">
                                    <span class="btn_file">파일찾기</span>
                                    <button type="button" class="btn_s" id="fileDelete">선택삭제</button>
                                </div>
                            </div>
                            <div id="table_grid">
                                <div id="fileGrid"></div>
                            </div>

                            <script type="text/javascript">
                            var r = new Resumable({
                                target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
                                ,chunkSize:1 * 1024 * 1024
                                ,simultaneousUploads:4
                                ,testChunks:true
                                ,throttleProgressCallbacks:1
                                ,method:"octet"
                            });
                            r.assignBrowse($('.btn_file')[0]);

                            //파일추가 이벤트
                            r.on('fileAdded', function(file) {

                                $("#progressWindow").kendoWindow({
                                    width:"600px"
                                    ,height:"300px"
                                    ,title:"파일전송"
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
                                        ,fileSize:dms.string.formatFileSize(result.fileSize)
                                    });
                                    //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
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

                                $(document).ready(function() {
                                    //파일삭제
                                    $("#fileDelete").click(function(){
                                        var grid = $("#fileGrid").data("kendoExtGrid");
                                        var rows = grid.select();

                                        if (rows.length < 1) {
                                            //목록을 선택하여 주십시오.
                                            dms.notification.info("<spring:message code='global.info.required.select'/>");
                                            return;
                                        }

                                        var deleteList = [];
                                        rows.each(function(index, row) {
                                            var dataItem = grid.dataItem(row);
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

                                                grid.dataSource._destroyed = [];
                                                grid.dataSource.page(1);

                                                //정상적으로 반영 되었습니다.
                                                dms.notification.success("<spring:message code='global.info.success'/>");
                                            }
                                        });
                                    });

                                    //그리드 설정
                                    $("#fileGrid").kendoExtGrid({
                                        dataSource:{
                                            data:{}
                                            ,schema:{
                                                model:{
                                                    fileDocNo:{type:"string"}
                                                    ,fileNo:{type:"number"}
                                                    ,fileNm:{type:"string"}
                                                    ,fileSize:{type:"number"}
                                                }
                                            }
                                        }
                                        ,autoBind:false
                                        ,multiSelectWithCheckbox:true
                                        ,columns:[
                                            {field:"fileDocNo", hidden:true}
                                            ,{field:"fileNo", hidden:true}
                                            ,{field:"fileNm", title:"파일명", width:200}
                                            ,{field:"fileSize", title:"파일사이즈", width:200}
                                            ,{title:""}
                                        ]

                                    });





                                });
                            </script>
                 </section>

         </section>

</body>
</html>