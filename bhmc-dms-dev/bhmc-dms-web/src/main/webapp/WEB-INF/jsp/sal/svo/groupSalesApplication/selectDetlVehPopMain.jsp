<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script src="<c:url value='/resources/js/bxslider/jquery.bxslider.min.js' />"></script>


<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
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
**************************파일업로드1********************************************
***************************************************************************-->

<!-- 집단판매신청 - 차량조회팝업. -->
<section class="pop_wrap">
     <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_delete" id="btnRowDel"><spring:message code="global.btn.rowDel" /></button> <!-- 행삭제 -->
        </div>
    </div>
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->

    <section id="imageViewWindow" class="pop_wrap" >
        <div class='imgSlider_wrap' >
            <div class='imgSlider_scrollbox' >
                <ul class='img_slider' >

                </ul>
            </div>
        </div>
    </section>


    <section id="fileViewWindow" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <span class="btn_file" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
            </div>
        </div>
        <div class="table_grid">
            <div id="fileGrid"></div>
        </div>
        <!-- 파일업로드 -->
        <input type="hidden" id="fileDocNo" />
        <input type="hidden" id="fileDocId" />
    </section>

</section>
<!-- //집단판매신청 - 차량조회팝업 -->
<!-- script -->
<script>
//팝업옵션
var options = parent.searchVehPopWin.options.content.data;

var dlrCd = options.arrInfo.dlrCd;
var usrId = options.arrInfo.usrId;
var reqSeq = options.arrInfo.reqSeq;
var carlineCd = options.arrInfo.carlineCd;
var modelCd = options.arrInfo.modelCd;
var reqLowerSeq = "";


$(document).ready(function() {



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
                 //dms.notification.success("<spring:message code='global.info.success'/>");
                 dms.notification.success("정상적으로 삭제되였습니다.");

                 var fileGrid = $("#fileGrid").data("kendoExtGrid");
                 var rows = fileGrid.select();
                 rows.each(function(index, row) {
                     fileGrid.removeRow(row);
                 });
                 fnDetlGroupHeader();

             }
         });
     });


    //버튼 - 행삭제
    $("#btnRowDel").kendoButton({
        enable:true,
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length  == 0 ){
                //삭제할 데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }

            // 선택된 차량을 정말 삭제 하시겠습까?
            if (confirm("确定要删除车辆吗?") == false ){
                return false;
            }


            var selectVeh = [];
            rows.each(function(index, row) {
                var data = {
                        "dlrCd":grid.dataItem(rows[index]).dlrCd
                        ,"usrId":grid.dataItem(rows[index]).usrId
                        ,"reqSeq":grid.dataItem(rows[index]).reqSeq
                        ,"reqLowerSeq":grid.dataItem(rows[index]).reqLowerSeq
                 }

                 selectVeh.push(data);
            });

            $.ajax({
                url:"<c:url value='/sal/svo/groupSalesApplication/deleteGroupSalesVeh.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify({"deleteGroupSalesApplicationVehList":selectVeh }),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                    //정상적으로 처리 되였습니다.
                    dms.notification.success("已正常处理");
                }
            });


        }
    });



    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/svo/groupSalesApplication/selectDetlVehPop.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = dlrCd;
                        params["sUsrId"] = usrId;
                        params["sReqSeq"] = reqSeq;
                        params["sCarlineCd"] = carlineCd;
                        params["sModelCd"] = modelCd;


                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         dlrCd        :{type:"string"}
                        ,usrId        :{type:"string"}
                        ,reqSeq       :{type:"string"}
                        ,reqLowerSeq  :{type:"string"}
                        ,vinNo        :{type:"string"}
                        ,dlrCd        :{type:"string"}
                        ,carlineNm    :{type:"string"}
                        ,modelNm      :{type:"string"}
                        ,stockVinNo1  :{type:"string"}
                        ,stockVinNo2  :{type:"string"}
                        ,fileDocId    :{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,editable:false
        ,filterable:false
        ,height  :320
        ,change:function(e){
            var selectedVal = this.dataItem(this.select());
            var fileDocId = selectedVal.fileDocId;
            reqLowerSeq = selectedVal.reqLowerSeq ;

            $("#fileDocId").val(fileDocId);
            $("#fileDocNo").val(fileDocId);
            $('#fileGrid').data('kendoExtGrid').dataSource.page(1);
        }
        ,columns:[
            {field:"dlrCd", hidden:true}
            ,{field:"usrId", hidden:true}
            ,{field:"reqSeq", hidden:true}
            ,{field:"reqLowerSeq", hidden:true}
            ,{field:"fileDocId", hidden:true}
            ,{field:"carlineNm",title:"<spring:message code='global.lbl.carlineNm' />",width:150,   attributes:{"class":"al"}}     //차종명
            ,{field:"modelNm",  title:"<spring:message code='global.lbl.modelNm' />",  width:170,  attributes:{"class":"al"}}     //모델명
            ,{field:"stockVinNo1",      title:"VIN NO1",   width:100,  attributes:{"class":"ac"}}     //Vin NO
            ,{field:"stockVinNo2",      title:"VIN NO2",   width:80,  attributes:{"class":"ac"}}     //Vin NO
            ,{_field:"_viewPop",      title:" ",   width:60,  attributes:{"class":"ac"}
                ,template:"<span class='txt_label bg_blue' onClick='fileViewPop()'>添加文件</span>"
            }     //첨부파일
            ,{_field:"_imgViewPop",      title:"",   width:60,  attributes:{"class":"ac"}
                ,template:"<span class='txt_label bg_green' onClick='imageViewPop()'>预览</span>"
            }     //미리보기
        ]
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
                        params["sFileDocNo"] = $("#fileDocId").val();

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
           {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" ,width:50,attributes:{"class":"al"}}           // 파일명
          ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" ,width:50,attributes:{"class":"al"}}       // 파일크기
          ,{_field:"_field", title:"",width:50,attributes:{"class":"ac"}
              ,template:"<span class='txt_label bg_blue'>下载</span>"//다운로드
           }

       ]
    });
    // 파일 그리드 종료 //



    //img_slider
    $("ul.img_slider").bxSlider({
        //auto:true,
        //pause:5000,
        pager:false
    });


    //그리드 클릭 이벤트.
    $("#fileGrid tbody").on("click", "tr.k-state-selected td", function (e) {
        var row = $(this).closest("tr");
        var colIdx = $("td", row).index(this);

        if(colIdx == 3){
            var fileGrid = $('#fileGrid').data('kendoExtGrid');
            var dataItem = fileGrid.dataItem(fileGrid.select());

            if(dms.string.isNotEmpty(dataItem)){
                dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
            }
        }
    });






    fnDetlGroupHeader = function(){
        var fileGrid = $('#fileGrid').data('kendoExtGrid');

        if(fileGrid._data.length == 0){
             //집단판매신청 차량정보에(SA_0413T)에 첨부파일 FILE_DOC_ID 삭제 .
            var grid = $('#grid').data('kendoExtGrid');
            var rows = grid.select();
            var item = grid.dataItem(rows);

            var data = {"reqSeq":reqSeq
                        ,"dlrCd":dlrCd
                        ,"usrId":usrId
                        ,"reqLowerSeq":item.reqLowerSeq
                        ,"fileDocId":""
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
                    $("#fileDocNo").val("");
                    $("#fileDocId").val("");
                    $("#fileViewWindow").data("kendoWindow").close();
                    $('#grid').data('kendoExtGrid').dataSource.read();
                }
            });
        }
    }

    /*
     * max 500으로 지정. 여백이 있는경우는 줄여야함
     */

     $("#imageViewWindow").kendoWindow({
         animation:false
         ,draggable:false
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"预览"
         ,width:"592px"
     }).data("kendoWindow");


     $("#fileViewWindow").kendoWindow({
         animation:false
         ,draggable:false
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"添加文件"
         ,width:"700px"
         ,height:"250px"
     }).data("kendoWindow");


});


//팝업 오픈 ( 이미지 미리보기 )
function imageViewPop(){

    var win = $("#imageViewWindow").data("kendoWindow");
    var grid = $("#grid").data("kendoExtGrid");
    var selectedItem = grid.dataItem(grid.select());

    if(dms.string.isEmpty($("#fileDocNo").val())){
        dms.notification.warning("没有添加的文件");
    }else {
        //파일정보 가져오기.
        if(selectedItem.fileDocId != null && selectedItem.fileDocId != ""){
            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />",
                data:JSON.stringify({sFileDocNo:selectedItem.fileDocId}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            }).done(function(result) {

                var content = "";
                var fileUrl = "";
                if(result.total != 0){
                    for(i=0;i<result.total;i++){
                        fileUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />?fileDocNo="+result.data[i].fileDocNo+"&fileNo="+result.data[i].fileNo+"&inline=true";
                        content += "<li>";
                        content += "<img src=\'"+fileUrl+"\' >";
                        content += "</li>";
                    }
                    $("#fileHtml").html(content);

                }
            });
        }else {
            $("#fileHtml").empty(content);
        }


        win.center();
        win.open();
    }

}



//팝업 오픈 ( 첨부파일 )
function fileViewPop(){

    var win = $("#fileViewWindow").data("kendoWindow");
    win.center();
    win.open();
}





/* *************************************************************************
 **************************파일업로드3********************************************
 ***************************************************************************/
 //================================
 var r = new Resumable({
     target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
     ,chunkSize:1 * 1024 * 1024
     ,simultaneousUploads:4
     ,testChunks:true
     ,throttleProgressCallbacks:1
     ,method:"octet"
     ,fileType:["png", "jpg", "jpeg", "gif"]
     ,fileTypeErrorCallback:function(file, errorCount) {
         alert("只能上传图片,请重新上传图片");
     }
     //,maxFiles:1
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

     //console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

     $("#progressWindow").data("kendoWindow").close();
     r.files = [];
     $(".resumable-list").html("");


 });
 r.on('fileSuccess', function(file, message) {
     //console.log("===============");
     ///console.log(message);

     var result = JSON.parse(message);
     if(result.status === "finished") {
         $("#fileGrid").data("kendoExtGrid").dataSource.insert({
             fileDocNo:result.fileDocNo
             ,fileNo:result.fileNo
             ,fileNm:result.fileNm
             ,fileSize:dms.string.formatFileSize(result.fileSize)
         });
         //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');


        if (dms.string.isEmpty($("#fileDocId").val()) && !dms.string.isEmpty($("#fileDocNo").val())) {
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
                     $('#grid').data('kendoExtGrid').dataSource.read();
                 }
             });
         }

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
 **************************파일업로드3****************************************
 ***************************************************************************/


 /******************************************
  * 함수영역 - end
  ******************************************/

//-->



//팝업 오픈 ( 첨부파일 )
function fileViewPop(){

    var win = $("#fileViewWindow").data("kendoWindow");
    win.center();
    win.open();
}



</script>
<!-- //script -->






















