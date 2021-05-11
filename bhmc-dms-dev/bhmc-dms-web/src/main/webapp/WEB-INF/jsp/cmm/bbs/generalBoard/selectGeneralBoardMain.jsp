<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>

<!-- Test Comment 추가 -->
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

<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><c:out value='${boardMaster.bbsNm}' /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-10912" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
			</dms:access>
	        <dms:access viewId="VIEW-D-10913" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.gubun' /><!-- 구분 --></th>
                    <td>
                        <input type="text" id="sNttCatCd" name="sNttCatCd" class="form_combo" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.title' /><!-- 제목 --></th>
                    <td>
                       <input type="text" id="sNttTitleNm" name="sNttTitleNm" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.cont' /><!-- 내용 --></th>
                    <td>
                        <input type="text" id="sNttCont" id="sNttCont" class="form_input" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

    <div id="detailContainer" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <button type="button" class="btn_s" id="btnReply"><spring:message code="global.btn.reply" /></button>
                <button type="button" class="btn_s" id="btnEdit"><spring:message code="global.btn.update" /></button>
                <button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /></button>
                <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.del" /></button>
                <button type="button" class="btn_s" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
                <span class="btn_file" id="btnFileSel"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                <button type="button" class="btn_s" id="btnFileDel"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
            </div>
        </div>

        <div class="table_form" id="formContainer">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.gubun" /><!-- 구분 --></th>
                        <td>
                            <input type="text" id="nttCatCd" name="nttCatCd" class="form_comboBox" style="width:100px;"
                                data-role="extdropdownlist"
                                data-value-primitive="true"
                                data-value-field="cmmCd"
                                data-text-field="cmmCdNm"
                                data-bind="value:data.nttCatCd, source:nttCats" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.title" /><!-- 제목 --></th>
                        <td>
                            <input type="text" id="nttTitleNm" name="nttTitleNm" class="form_input" data-bind="value:data.nttTitleNm" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.cont" /><!-- 내용 --></th>
                        <td>
                            <textarea id="nttCont" name="nttCont" class="form_textarea" style="height:250px;" data-bind="value:data.nttCont"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.attachedFile" /><!-- 첨부파일 --></th>
                        <td>
                            <div class="table_grid">
                                <div id="fileGrid"></div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
</div>

<script type="text/javascript">
//게시물 구분
var arrCatCd = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${arrNttCat}">
arrCatCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var arrCatCdMap = dms.data.arrayToMap(arrCatCd, function(obj){ return obj.cmmCd; });

//게시물 데이터
var viewModel = kendo.observable({
    data:{}
    ,mode:"I"
    ,nttCats:arrCatCd
    ,reset:function(){
        this.set("data", {
            bbsId:"${boardMaster.bbsId}"
            ,nttId:""
            ,nttTitleNm:""
            ,nttCatCd:""
            ,nttCont:""
            ,nttRootId:""
            ,nttRefId:""
            ,repLvlVal:0
            ,repSortOrderVal:0
            ,fileDocNo:""
            ,regUsrId:""
            ,regDt:null
            ,flag:"I"
        });
    }
});
kendo.bind($("#formContainer"), viewModel);

//게시물 상세정보 팝업
$("#grid").on("dblclick", "tr.k-state-selected", function(e){
    var grid = $(e.delegateTarget).data("kendoExtGrid");

    if(grid.select().length > 0){
        var dataItem = grid.dataItem(grid.select());

        $.ajax({
            url:"<c:url value='/cmm/bbs/generalBoard/selectGeneralBoardByKey.do' />"
            ,data:JSON.stringify({"sBbsId":dataItem.bbsId, "sNttId":dataItem.nttId})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
            ,success:function(jqXHR, textStatus) {
                viewModel.set("data", jqXHR);
                viewModel.set("mode", "V");

                $("#btnSave").hide();
                $("#nttCatCd").data("kendoExtDropDownList").enable(false);
                $("#nttTitleNm").prop("disabled",true);
                $("#nttCont").prop("disabled",true);

                $("#fileGrid").data("kendoExtGrid").dataSource.read();

                if ("${sessionScope.LOGIN_USER.usrId}" === viewModel.get("data.regUsrId")) {
                    $("#btnEdit").show();
                    $("#btnDel").show();
                } else {
                    $("#btnEdit").hide();
                    $("#btnDel").hide();
                }

                <c:choose>
                <c:when test="${boardMaster.repTp == '2'}">
                    $("#btnReply").show();
                </c:when>
                <c:otherwise>
                    $("#btnReply").hide();
                </c:otherwise>
                </c:choose>

                $("#btnCancel").show();

                $("#btnFileSel").hide();
                $("#btnFileDel").show();

                $("#detailContainer").data("kendoWindow").center().open();
            }
        });
    }
});

$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            viewModel.reset();
            viewModel.set("mode", "I");
            $("#grid").data("kendoExtGrid").clearSelection();
            $("#fileGrid").data("kendoExtGrid").dataSource.data([]);

            $("#nttCatCd").data("kendoExtDropDownList").enable(true);
            $("#nttTitleNm").prop("disabled",false);
            $("#nttCont").prop("disabled",false);

            $("#btnSave").show();
            $("#btnCancel").show();

            $("#btnEdit").hide();
            $("#btnDel").hide();
            $("#btnReply").hide();

            $("#btnFileSel").show();
            $("#btnFileDel").show();

            $("#detailContainer").data("kendoWindow").center().open();
        }
    });

    //버튼 - 답글
    $("#btnReply").kendoButton({
        click:function(e) {
            viewModel.set("mode", "R");
            viewModel.set("data.nttTitleNm", "");
            viewModel.set("data.nttCont", "");
            viewModel.set("data.fileDocNo", "");
            $("#fileGrid").data("kendoExtGrid").dataSource.data([]);

            $("#nttCatCd").data("kendoExtDropDownList").enable(false);
            $("#nttTitleNm").prop("disabled",false);
            $("#nttCont").prop("disabled",false);

            $("#btnSave").show();
            $("#btnCancel").show();

            $("#btnEdit").hide();
            $("#btnDel").hide();
            $("#btnReply").hide();

            $("#btnFileSel").show();
            $("#btnFileDel").show();
        }
    });

    //버튼 - 수정
    $("#btnEdit").kendoButton({
        click:function(e) {
            viewModel.set("mode", "U");

            $("#nttCatCd").data("kendoExtDropDownList").enable(true);
            $("#nttTitleNm").prop("disabled",false);
            $("#nttCont").prop("disabled",false);

            $("#btnSave").show();
            $("#btnCancel").show();

            $("#btnEdit").hide();
            $("#btnDel").hide();
            $("#btnReply").hide();

            $("#btnFileSel").show();
            $("#btnFileDel").show();
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
           if (dms.string.isEmpty($("#nttTitleNm").val())) {
               dms.notification.error("<spring:message code='global.lbl.nttTitleNm' var='nttTitleNmMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${nttTitleNmMsg}' />");
                return;
            } else if (dms.string.isEmpty($("#nttCont").val())) {
                dms.notification.error("<spring:message code='global.lbl.nttCont' var='nttContMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${nttContMsg}' />");
                return;
            }

            var tmpUrl = "";

            if (viewModel.get("mode") === "I") {
                tmpUrl = "<c:url value='/cmm/bbs/generalBoard/inertGeneralBoard.do' />";
                viewModel.set("flag", "I");
            } else if (viewModel.get("mode") === "U") {
                tmpUrl = "<c:url value='/cmm/bbs/generalBoard/updateGeneralBoard.do' />";
                viewModel.set("flag", "U");
            } else if (viewModel.get("mode") === "R") {
                tmpUrl = "<c:url value='/cmm/bbs/generalBoard/inertGeneralBoard.do' />";
                viewModel.set("flag", "R");
                viewModel.set("data.repLvlVal", viewModel.get("data.repLvlVal") + 1);
                viewModel.set("data.repSortOrderVal", viewModel.get("data.repSortOrderVal") + 1);
            }

            $.ajax({
              url:tmpUrl
              ,data:JSON.stringify(viewModel.get("data"))
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
              ,error:function(jqXHR,status,error) {
                  dms.notification.error(jqXHR.responseJSON.errors);
              }
              ,success:function(jqXHR, textStatus) {
                  //정상적으로 반영 되었습니다.
                  dms.notification.success("<spring:message code='global.info.success'/>");

                  $("#detailContainer").data("kendoWindow").close();
                  $('#grid').data('kendoExtGrid').dataSource.page(1);
                  $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
              }
            });
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            if(confirm("<spring:message code='global.info.reallyDelete'/>")) {
                $.ajax({
                    url:"<c:url value='/cmm/bbs/generalBoard/deleteGeneralBoard.do' />"
                    ,data:JSON.stringify(viewModel.get("data"))
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");

                        $("#detailContainer").data("kendoWindow").close();
                        $('#grid').data('kendoExtGrid').dataSource.page(1);
                        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
                    }
                });
            }
        }
    });

    //버튼 - 취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $("#detailContainer").data("kendoWindow").close();
            $('#grid').data('kendoExtGrid').clearSelection();
            $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
        }
    });

    //버튼 - 첨부파일 삭제
    $("#btnFileDel").kendoButton({
       click:function(e) {
           var fileGrid = $("#fileGrid").data("kendoExtGrid");
           var rows = fileGrid.select();
           var deleteList = [];

           if (rows.length < 1) {
               //목록을 선택하여 주십시오.
               dms.notification.info("<spring:message code='global.info.required.select'/>");
               return;
           }

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
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors);
               }
               ,success:function(jqXHR, textStatus) {
                   //정상적으로 반영 되었습니다.
                   dms.notification.success("<spring:message code='global.info.success'/>");

                   $("#fileGrid").data("kendoExtGrid").dataSource.read();
               }
           });

       }
    });

 	//조회조건 - 구분
    $("#sNttCatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:arrCatCd
    });

    //게시물 그리드
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/bbs/generalBoard/selectGeneralBoard.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBbsId"] = "${boardMaster.bbsId}";
                        params["sNttCatCd"] = $("#sNttCatCd").val();
                        params["sNttTitleNm"] = $("#sNttTitleNm").val();
                        params["sNttCont"] = $("#sNttCont").val();


                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            , schema:{
                model:{
                    id:"bbsId"
                  , fields:{
                        rnum:{type:"string"}
                      , bbsId:{type:"string"}
                      , nttId:{type:"string"}
                      , nttCatCd:{type:"string"}
                      , nttTitleNm:{type:"string"}
                      , fileDocNo:{type:"string"}
                      , regNm:{type:"string"}
                      , regDt:{type:"date"}
                    }
                }
            }
        }
        ,height:250
        ,selectable:"row"
        ,editable:false
        ,appendEmptyColumn:true
        ,columns:[
          {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60
              ,attributes:{"class":"ac"}
          }
          ,{field:"nttCatCd", title:"<spring:message code='global.lbl.gubun' />", width:100
              ,attributes:{"class":"ac"}
              ,template:"# if(arrCatCdMap[nttCatCd] != null) { # #= arrCatCdMap[nttCatCd].cmmCdNm# # }#"
          }
          ,{field:"nttTitleNm", title:"<spring:message code='global.lbl.title' />", width:500
              ,template:function (data) {
                  var txtNbsp = "";
                  if(data.repLvlVal!=0) {
                      for(var i=1; i<data.repLvlVal; i++) {
                          txtNbsp = txtNbsp + "&nbsp;&nbsp;"
                      }
                      txtNbsp = txtNbsp + "<span class='icon_reply'></span>";
                  }
                  var title = txtNbsp +" " + data.nttTitleNm;
                  return title;
              }
            }
          ,{field:"usrNm", title:"<spring:message code='global.lbl.wrtrNm' />", width:120
              ,attributes:{"class":"ac"}
          }
          ,{field:"regDt", title:"<spring:message code='global.lbl.wrtrDt' />", width:150
              ,attributes:{"class":"ac"}
              ,format:"{0:<dms:configValue code='dateTimeFormat' />}"
          }
        ]
    });

    //첨부파일 그리드
    $("#fileGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sFileDocNo"] = viewModel.get("data.fileDocNo");

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
       ,height:140
       ,navigatable:false
       ,pageable:false
       ,sortable:false
       ,multiSelectWithCheckbox:true
       ,columns:[
          {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"
              ,template:"<span style=\"text-decoration:underline;cursor:pointer;\" onclick=\"dms.fileManager.download('#=fileDocNo#','#=fileNo#')\">#=fileNm#</span>"
          }
          ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:150    // 파일크기
              ,attributes:{"class":"ar"}
              ,template:"#= dms.string.formatFileSize(fileSize) #"
          }
       ]
	});

  	//게시물 상세정보 팝업
    $("#detailContainer").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:false
        ,pinned:true
        ,resizable:false
        ,visible:false
        ,title:"<c:out value='${boardMaster.bbsNm}' /><spring:message code='global.title.info' />"
        ,width:"950px"
        ,height:"500px"
    });

    //================================ 파일 업무로 관련 스크립트
    var r = new Resumable({
        target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
        ,chunkSize:1 * 1024 * 1024
        ,simultaneousUploads:4
        ,testChunks:true
        ,throttleProgressCallbacks:1
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

        if (dms.string.isEmpty(viewModel.get("data.fileDocNo"))) {
            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                dataType:"json",
                type:"get",
                async:false,
                cache:false,
                success:function(id) {
                    _that.opt["query"]["resumableSessionId"] = id;
                    viewModel.set("data.fileDocNo", id);
                }
            });
        } else {
            _that.opt["query"]["resumableSessionId"] = viewModel.get("data.fileDocNo");
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
    //================================

    if($("#flag").val()=="U") {
        var grid = $("#fileGrid").data("kendoExtGrid");
        grid.dataSource._destroyed = [];
        grid.dataSource.read();
    }
});
</script>