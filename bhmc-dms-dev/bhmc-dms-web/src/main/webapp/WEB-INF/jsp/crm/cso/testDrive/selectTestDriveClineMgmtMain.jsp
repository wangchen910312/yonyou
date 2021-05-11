<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->
<%//TODO[이인문] 파일업로드 플러그인으로 변경 필요 %>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
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
<!-- *************************************************************************
**************************파일업로드1:상단에 스크립트 추가 ***********************
***************************************************************************-->
        <div id="resizableContainer">
            <!-- 시승 노선 관리 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.testDriveClineMgmt" /><!-- 시승 노선 관리--></h1>
                    <div class="btn_right">
                        <span id="fileSelect" class="btn_file2"> <spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                        <button type="button" class="btn_m btn_delete" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                        <button type="button" class="btn_m btn_cancel" id="btnCancel" ><spring:message code='global.btn.cancel' /><!-- 취소 --></button>
                        <button type="button" class="btn_m btn_save" id="btnSave" ><spring:message code='global.btn.save' /><!-- 저장 --></button>
                    </div>
                </div>

                <div class="table_grid">
                    <div id="fileGrid" class="resizable_grid"></div>
                </div>

                <div id="viewClineDetail"></div>

                <!-- <input type="hidden" id="tdrvContractDocNo" name="tdrvContractDocNo" > -->

            </section>
            <!-- //시승 노선 관리 -->
        </div>

            <!-- 스케쥴러에 나타나는 내방 예약 정보 -->
            <script id="viewClineTemplate" type="text/x-kendo-template">

                <div class="viewImg_popup viewImg_popup_v1">
                    <div class="img_area">
                        <img src="#= imgUrl #" alt="">
                    </div>
                </div>

            </script>

            <script type="text/javascript">

                var clinePopup
                  , clineDetailTemplate
                ;

                function viewCline(e){

                    //console.log("e:",e)
                    e.preventDefault();
                    var dataItem = this.dataItem($(e.currentTarget).closest("tr"));

                    if( dms.string.isNotEmpty(dataItem) ){

                        var fileDocNo = dataItem.fileDocNo;
                        var fileNo = dataItem.fileNo;

                        dataItem.imgUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />" + "?fileDocNo=" + fileDocNo + "&fileNo=" + fileNo;

                        clinePopup.content(clineDetailTemplate(dataItem))
                        clinePopup.center().open()

                    }

                }

                $(document).ready(function() {

                    // 파일삭제
                    $("#fileDelete").kendoButton({
                       click:function(e) {

                           var grid = $("#fileGrid").data("kendoExtGrid");
                           var rows = grid.select();

                           rows.each(function(index, row) {
                               grid.removeRow(row);
                           });

                       }
                    });

                    // 취소
                    $("#btnCancel").kendoButton({
                        click:function(e){
                            $('#fileGrid').data('kendoExtGrid').cancelChanges();

                        }
                    });

                    // 저장
                    $("#btnSave").kendoButton({
                        click:function(e){

                            var grid = $("#fileGrid").data("kendoExtGrid");

                            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                            if (grid.cudDataLength == 0) {
                                //변경된 정보가 없습니다.
                                dms.notification.info("<spring:message code='global.info.required.change'/>");
                                return;
                            }

                            if (grid.gridValidation()) {

                                //console.log("saveDate:",JSON.stringify(saveData));

                                //return;

                                $.ajax({
                                    url:"<c:url value='/crm/cso/testDrive/multiTestDriveClineMgmt.do' />"
                                    ,data:JSON.stringify(saveData)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR,status,error) {

                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,success:function(jqXHR, textStatus) {

                                        grid.dataSource._destroyed = [];
                                        grid.dataSource.page(1);

                                        //정상적으로 반영 되었습니다.
                                        dms.notification.success("<spring:message code='global.info.success'/>");
                                    }
                                    ,beforeSend:function(xhr) {
                                        dms.loading.show();
                                    }
                                    ,complete:function(xhr, status) {
                                        dms.loading.hide();
                                    }
                                });
                            }else{
                                //입력값을 확인하여 주십시오.
                                dms.notification.warning("<spring:message code='global.info.check.input'/>");

                            }

                        }
                    });

                    /* *************************************************************************
                     **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
                     ***************************************************************************/
                    // 파일 그리드 시작 //
                    $("#fileGrid").kendoExtGrid({
                        gridId:"G-CRM-0519-172128"
                        ,dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/testDrive/selectTestDriveClines.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        //console.log("TestDriveClines:"+kendo.stringify(params));
                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"clineSeq"
                                    ,fields:{
                                        rnum:{type:"number", editable:false }
                                        ,clineSeq:{type:"number", editable:false}
                                        ,clineDocNo:{type:"string", editable:false }
                                        ,fileNm:{type:"string", editable:false }
                                        ,clineNm:{type:"string", editable:true, validation:{required:true} }
                                        ,useYn:{type:"string", editable:true, validation:{required:true} }
                                        ,regDt:{type:"date", editable:false }
                                        ,updtDt:{type:"date", editable:false }
                                    }
                                }
                            }
                        }
                        ,autoBind:true
                        //,editable:true
                        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                        , multiSelectWithCheckbox:true     //멀티선택 적용. default:false
                        , appendEmptyColumn:true           //빈컬럼 적용. default:false
                        , enableTooltip:true               //Tooltip 적용, default:false
                        ,navigatable:false
                        ,pageable:false
                        ,selectable:"multiple"
                        ,columns:[
                            // {field:"clineDocNo", title:"clineDocNo", hidden:true }                                   // 파일 마스터 번호
                            //,{field:"clineSeq", title:"clineSeq", hidden:true }                                       // 파일 디테일 번호
                            {field:"clineNm", title:"<spring:message code='crm.lbl.clineNm' />", width:200 }         // 노선명
                            //,{field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" , hidden:true }     // 파일명
                            ,{_field:"tdrvClineView", command:{ text:"<spring:message code='global.lbl.tdrvClineView' />" , click:viewCline }, title:"", width:200                                                                       // 노선이미지
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:75
                                ,attributes:{"class":"ac"}
                                ,editor:function(container, options) {
                                    $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                                    .appendTo(container)
                                    .kendoExtDropDownList({
                                        autoBind:true
                                        ,dataSource:['Y','N']
                                        ,index:0
                                    });
                                    $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                                }
                            }
                        ]
                    });
                    // 파일 그리드 종료 //
                    /* *************************************************************************
                    **************************파일업로드4:그리드 kendo 스크립트 추가 ***************
                    ***************************************************************************/

                    // 노선이미지 팝업
                    clinePopup = $("#viewClineDetail").kendoWindow({
                          title:"<spring:message code='global.lbl.tdrvClineView' />"      // 노선보기
                        , modal:true
                        , visible:false
                        , resizable:false
                        , width:500
                    }).data("kendoWindow");

                    clineDetailTemplate = kendo.template($("#viewClineTemplate").html());

                });

                /* *************************************************************************
                **************************파일업로드6:스크립트 추가 $(document).ready 밖 *****
                ***************************************************************************/
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
                r.assignBrowse($('#fileSelect')[0]);

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


                    if (dms.string.isEmpty($("#tdrvContractDocNo").val())) {
                        $.ajax({
                            url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                            dataType:"json",
                            type:"get",
                            async:false,
                            cache:false,
                            success:function(id) {
                                _that.opt["query"]["resumableSessionId"] = id;
                                //$("#tdrvContractDocNo").val(id);                                    // 파일업로드7:업로드 완료후  마스터 테이블의 tdrvContractDocNo 를 변경해준다
                            }
                        });
                    //} else {
                    //    _that.opt["query"]["resumableSessionId"] = $("#tdrvContractDocNo").val();   // 파일업로드8:기존꺼에 추가할경우 tdrvContractDocNo 설정
                    }


                    $('.resumable-progress .progress-resume-link').hide();
                    $('.resumable-progress .progress-pause-link').show();
                });
                r.on('complete', function() {

                    var _that = this;

                    $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

                    //console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

                    $("#progressWindow").data("kendoWindow").close();
                    r.files = [];
                    $(".resumable-list").html("");
                });
                r.on('fileSuccess', function(file, message) {
                    //console.log("===============");
                    //console.log(message);

                    var result = JSON.parse(message);
                    if(result.status === "finished") {
                        $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                            clineDocNo:result.fileDocNo
                            ,fileNm:result.fileNm
                            ,useYn:"Y"
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
                /* *************************************************************************
                **************************파일업로드4:스크립트 추가 $(document).ready 밖 *****
                ***************************************************************************/

            </script>