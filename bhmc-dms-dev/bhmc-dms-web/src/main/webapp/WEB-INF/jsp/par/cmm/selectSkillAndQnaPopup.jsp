<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_left">
            <button id="btnInit" class="btn_s btn_reset btn_s_min5" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
        </div>
        <div class="btn_right">
            <button type="button" id="btnSend" class="btn_s btn_s_min5"><spring:message code="par.btn.send" /></button>
            <button type="button" id="btnSave" class="btn_s btn_save btn_s_min5" onclick="" ><spring:message code="par.btn.save" /></button>
            <button type="button" id="btnClose" class="btn_s btn_s_min5"><spring:message code="par.btn.close" /></button>
        </div>
    </div>

    <div class="table_form form_width_50per" role="search" data-btnid="btnSearch">

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
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.pblmNo" /><!-- 문제번호 --></span></th>
                    <td>
                        <input id="pblmNo" name="pblmNo" class="form_input form_readonly" readonly="readonly" />
                        <input type="hidden" id="dlrCd" name="dlrCd" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.answPblmNo" /><!-- 답변문제번호 --></span></th>
                    <td>
                        <input id="answPblmNo" name="answPblmNo" class="form_input form_readonly" readonly="readonly" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.carLine" /><!-- 기술자문차종 --></span></th>
                    <td>
                        <input id="modelCd" name="modelCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.vin" /><!-- VIN--></span></th>
                    <td>
                        <input id="vinNo" name="vinNo" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.pblmItemDstin" /><!-- 기술자문부품분류 --></span></th>
                    <td>
                        <input id="dlrPblmCd" name="dlrPblmCd" class="form_comboBox" />
                    </td>

                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.pblmStatCd" /><!-- 문제상태 --></th>
                        <td>
                            <input id="pblmStatCd" name="pblmStatCd" class="form_comboBox" />
                            <input type="hidden" id="dlrCdPblmStatCd" name="dlrCdPblmStatCd" />
                        </td>
                    <th scope="row"><spring:message code="par.lbl.qestId" /><!-- 조작인(질문자ID) --></th>
                    <td>
                        <input id="qestId" name="qestId" class="form_input" readonly="readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.dlrCmpCd" /><!-- 딜러회사코드--></th>
                    <td>
                        <input id="dlrCmpCd" name="dlrCmpCd" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                    <td colspan="3">
                        <div class="form_search">
                            <input id="itemCd" class="form_input" readonly="readonly" />
                        <a href="javascript:;" onclick="javascript:selectPartsMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th></th>
                    <td>
                    </td>
                    <th></th>
                    <td>
                    </td>
                </tr>
                <th scope="row"><span class="bu_required"><spring:message code="par.lbl.titleNm" /><!-- 문제제목 --></span></th>
                <td colspan="7">
                    <input id="titleNm" name="titleNm" class="form_input form_required" />
                </td>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.pblmCont" /><!-- 문제내용 --></th>
                    <td colspan="7">
                        <textarea id="pblmCont" name="pblmCont" rows="2" cols="30" class="form_textarea" ></textarea>
                    </td>
                </tr>
                <tr class="hidden">
                    <th scope="row"><spring:message code="par.lbl.addQestCont" /><!-- 추가질문내용 --></th>
                    <td colspan="7">
                        <textarea id="addQestCont" name="addQestCont" rows="6" cols="30" class="form_textarea" ></textarea>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.selectFile" /></th>
                    <td colspan="7">
                        <input type="file" id="files" name="files[]" multiple class="form_file" />
                        <input type="hidden" id="uploadFileNo" />
                        <input type="hidden" id="uploadFileName" />
                        <input type="hidden" id="uploadFileSize" />
                        <input type="hidden" id="uploadFileBlob" />
                        <input type="hidden" id="uploadFileMaxSizeYn" />
                        <input type="hidden" id="uploadFileTypeMatchYn" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.fileNm" /><!-- 파일명 --></th>
                    <td colspan="3">
                        <input id="fileNm" class="form_input form_readonly" readonly="readonly" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.fileSizeVal" /><!-- 파일사이즈 --></th>
                    <td colspan="3">
                        <input id="fileSizeVal" class="form_input form_readonly" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.fileView" /><!-- 이미지보기 --></th>
                    <td colspan="7" style="height:228px">
                        <img id="fileView" name="imgFile" />
                    </td>
                </tr>
            </tbody>
        </table>

    </div>

    <div class="table_grid mt10">
        <!-- targetSkillAndQnaAnswerGrid -->
        <div id="targetSkillAndQnaAnswerGrid" ></div>
        <!-- targetSkillAndQnaAnswerGrid -->
    </div>

</section>

<script type="text/javascript">
/**
 * 팝업 옵션
 */
 var options = parent.selectSkillAndQnaPopupWin.options.content.data;

//plbmModelCdList
var plbmModelCdList = [];
<c:forEach var="obj" items="${plbmModelCdList}">
plbmModelCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var plbmModelCdMap = {};
$.each(plbmModelCdList, function(idx, obj){
    plbmModelCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//dlrPblmCdList
var dlrPblmCdList = [];
<c:forEach var="obj" items="${dlrPblmCdList}">
dlrPblmCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var dlrPblmCdMap = {};
$.each(dlrPblmCdList, function(idx, obj){
    dlrPblmCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//pblmStatCdList
var pblmStatCdList = [];

<c:forEach var="obj" items="${pblmStatCdList}">
    pblmStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var pblmStatCdMap = {};
$.each(pblmStatCdList, function(idx, obj){
    pblmStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//itemCd search popup
function selectPartsMasterPopupWindow(){

    searchItemPopupWindow = dms.window.popup({
        windowId:"searchItemPopupWindow"
        ,width:750
        ,height:400
        ,title:""
        ,content:{
            url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"itemCd":null
                ,"parentTp":"QNA"
                ,"selectable":"multiple"
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        $("#itemCd").val(data[0].itemCd);
                    }
                    searchItemPopupWindow.close();
                }
            }
        }
    });

}
//getSizeMbBypte Func
function getSizeMbByte(size){
    var sizeMB = (size / (1024*1024)).toFixed(2);
    return sizeMB+" MB";
}
//file Handler Func
function handleFileSelect(evt){
    //input files
    var files = evt.target.files;
    //file 5MB size
    var fileMaxSiz5Mb = 5 * 1024 * 1024;
    //fileView
    var fileView = document.querySelector("img");
    var output = [];
    for(var i = 0,f; f = files[i]; i++){
        //file only one.
        if(i < 1){
            //file size check
            if(f.size > fileMaxSiz5Mb){
                $("#uploadFileMaxSizeYn").val("N");
            }
            else{
                $("#uploadFileMaxSizeYn").val("Y");
            }
            //file type check
            if(!f.type.match("image.*")){
                $("#uploadFileTypeMatchYn").val("N");
            }
            else{
                $("#uploadFileTypeMatchYn").val("Y");
            }
            //fileName.
            $("#uploadFileName").val(f.name);
            $("#fileNm").val(f.name);
            //fileSize.
            $("#uploadFileSize").val(f.size);
            var sizeInMB = getSizeMbByte(f.size);
            $("#fileSizeVal").val(f.size+" / "+sizeInMB);
            //FileReader
            var reader = new FileReader();
            var file = f;
            reader.onload = (function(theFile) {
                return function(e) {

                    var image01 = new Image();
                    image01.src = e.target.result;

                    image01.onload = function() {

                        if(this.width > 300){
                            fileView.width = 300;
                        }else{
                            fileView.width = this.width;
                        }
                    };

                    $("#uploadFileBlob").val(window.btoa(e.target.result));
                    fileView.src = e.target.result;

                };
            })(file);
            //readAsDataURL call
            reader.readAsDataURL(file);
        }
    }
}
//input files Listener
document.getElementById("files").addEventListener('change', handleFileSelect, false);
//imageLoader Func
function imageLoader(){
    var fileView = document.querySelector("img");
    var bolbBytes = $("#uploadFileBlob").val();
    var fileData = window.atob(bolbBytes);
    fileView.src = fileData;

    fileView.onload = function() {
        if(this.width > 300){
            fileView.width = 300;
        }else{
            fileView.width = this.width;
        }
    };
}

function skillAndQnaSave(sendFlag){

    var titleNm = $("#titleNm").val();
    if(titleNm === ""){
        // titleNm check message.
        dms.notification.info("<spring:message code='par.lbl.titleNm' var='titleNm' /><spring:message code='par.info.issueCheckMsg' arguments='${titleNm}' />");
        return false;
    }
    var modelCd = $("#modelCd").data("kendoExtDropDownList").value();
    if(modelCd === ""){
        // modelCd check message.
        dms.notification.info("<spring:message code='par.lbl.carLine' var='modelCd' /><spring:message code='par.info.issueCheckMsg' arguments='${modelCd}' />");
        return false;
    }
    var vinNo = $("#vinNo").val();
    if(vinNo === ""){
        // vinNo check message.
        dms.notification.info("<spring:message code='par.lbl.vin' var='vinNo' /><spring:message code='par.info.issueCheckMsg' arguments='${vinNo}' />");
        return false;
    }
    var pblmCont = $("#pblmCont").val();
    if(pblmCont === ""){
        // pblmCont check message.
        dms.notification.info("<spring:message code='par.lbl.pblmCont' var='pblmCont' /><spring:message code='par.info.issueCheckMsg' arguments='${pblmCont}' />");
        return false;
    }
    var pblmStatCd = $("#pblmStatCd").data("kendoExtDropDownList").value();
    var answPblmNo = $("#answPblmNo").val();//답변문제번호
    if(pblmStatCd === ""){
        // pblmStatCd check message.
        dms.notification.info("<spring:message code='par.lbl.pblmStatCd' var='pblmStatCd' /><spring:message code='par.info.issueCheckMsg' arguments='${pblmStatCd}' />");
        return false;
    }

    //기술자문 재요청 처리 메시지.
    if(answPblmNo !== "" && pblmStatCd === "01"){
        // pblmStatCd check message.
        dms.notification.info("<spring:message code='par.lbl.pblmNo' var='pblmNo' /><spring:message code='par.info.alreadyCont' arguments='${pblmNo}' />");

        return false;
    }

    //기술자문 수정/삭제 처리 메시지.
    if(answPblmNo === "" && pblmStatCd !== "01"){
        // pblmStatCd check message.
        dms.notification.info("<spring:message code='par.lbl.answPblmNo' var='answPblmNo' /><spring:message code='par.info.issueCheckMsg' arguments='${answPblmNo}' />");

        return false;
    }

    var dlrPblmCd = $("#dlrPblmCd").data("kendoExtDropDownList").value();
    if(dlrPblmCd === ""){
        // dlrPblmCd check message.
        dms.notification.info("<spring:message code='par.lbl.pblmItemDstin' var='dlrPblmCd' /><spring:message code='par.info.issueCheckMsg' arguments='${dlrPblmCd}' />");
        return false;
    }
    var uploadFileMaxSizeYn = $("#uploadFileMaxSizeYn").val();
    if(uploadFileMaxSizeYn === "N"){
        // uploadFileMaxSizeYn check message.
        dms.notification.info("<spring:message code='par.lbl.uploadFileMaxSizeYn' var='uploadFileMaxSizeYn' /><spring:message code='par.info.confirmFileUpload' arguments='${uploadFileMaxSizeYn}' />");
        return false;
    }
    var uploadFileTypeMatchYn = $("#uploadFileTypeMatchYn").val();
    if(uploadFileTypeMatchYn === "N"){
        // uploadFileTypeMatchYn check message.
        dms.notification.info("<spring:message code='par.lbl.uploadFileTypeMatchYn' var='uploadFileTypeMatchYn' /><spring:message code='par.info.confirmFileUpload' arguments='${uploadFileTypeMatchYn}' />");
        return false;
    }

    var saveVO = {
        "dlrCd":""
        ,"pblmNo":$("#pblmNo").val()
        ,"answPblmNo":$("#answPblmNo").val()
        ,"modelCd":$("#modelCd").data("kendoExtDropDownList").value()
        ,"vinNo":$("#vinNo").val()
        ,"titleNm":$("#titleNm").val()
        ,"itemCd":$("#itemCd").val()
        ,"pblmCont":$("#pblmCont").val()
        ,"pblmStatCd":$("#pblmStatCd").data("kendoExtDropDownList").value()
        ,"dlrCdPblmStatCd":$("#dlrCdPblmStatCd").val()
        ,"qestId":$("#qestId").val()
        ,"dlrCmpCd":$("#dlrCmpCd").val()
        ,"addQestCont":$("#addQestCont").val()
        ,"dlrPblmCd":$("#dlrPblmCd").data("kendoExtDropDownList").value()
        ,"fileNm":$("#uploadFileName").val()
        ,"fileNo":$("#uploadFileNo").val()
        ,"fileSizeVal":$("#uploadFileSize").val()
        ,"fileDataCont":$("#uploadFileBlob").val()
        ,"sendYn":sendFlag
    }

    var vUrl = "<c:url value='/par/cpm/skillQna/insertSkillQnaHeader.do' />";
    if(saveVO.pblmNo !== ""){
        vUrl = "<c:url value='/par/cpm/skillQna/updateSkillQnaHeader.do' />";
    }

    $.ajax({
        url:vUrl
        ,data:JSON.stringify(saveVO)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR,status,error){
            //error message
            if(jqXHR.responseText.errorMessage === ""){
                options.callbackFunc(true);
                dms.notification.success("<spring:message code='global.info.success'/>");
            }else{
                options.callbackFunc(false);
                //var errors = JSON.stringify(jqXHR.responseText);
                var errors = jqXHR.responseJSON;
                dms.notification.warning(errors.errors[0].errorMessage);
            }

        }
        ,success:function(jqXHR, textStatus){
            options.callbackFunc(true);
            //success message
            dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });

}

function pageInit(){
    $("#pblmNo").val("");
    $("#answPblmNo").val("");
    $("#modelCd").data("kendoExtDropDownList").select(0);
    $("#vinNo").val("");
    $("#dlrPblmCd").data("kendoExtDropDownList").select(0);
    $("#pblmStatCd").data("kendoExtDropDownList").select(0);
    $("#dlrCdPblmStatCd").val("");
    $("#qestId").val("");
    $("#dlrCmpCd").val("H");
    $("#itemCd").val("");
    $("#titleNm").val("");
    $("#titleNm").val("");
    $("#pblmCont").val("");
    $("#addQestCont").val("");

    $("#uploadFileNo").val("");
    $("#uploadFileName").val("");
    $("#uploadFileSize").val("");
    $("#uploadFileBlob").val("");

    $("#uploadFileMaxSizeYn").val("");
    $("#uploadFileTypeMatchYn").val("");
    $("#fileNm").val("");
    $("#fileSizeVal").val("");

    $("#fileView").attr("src","");

    $("#targetSkillAndQnaAnswerGrid").data("kendoExtGrid").dataSource.data([]);
}

//buttonEnableDisable Func
function buttonEnableDisable(bFlag){
    //page button list
    $("#btnSend").data("kendoButton").enable(bFlag);
    $("#btnSave").data("kendoButton").enable(bFlag);
}

$(document).ready(function() {

    //dlrCd
    $("#dlrCd").val("${dlrCd}");

    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            pageInit();
        }
    });

    //btnSend
    $("#btnSend").kendoButton({
        click:function(e){
            //skillAndQnaSave Func send call.
            skillAndQnaSave("Y");
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            //skillAndQnaSave Func save call.
            skillAndQnaSave("N");
        }
    });
    //btnClose
    $("#btnClose").kendoButton({
        click:function(e){
            parent.selectSkillAndQnaPopupWin.close();
        }
    });
    //modelCd
    $("#modelCd").kendoExtDropDownList({
        dataSource:plbmModelCdList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });

    //dlrPblmCd
    $("#dlrPblmCd").kendoExtDropDownList({
        dataSource:dlrPblmCdList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });
    //pblmStatCd
    $("#pblmStatCd").kendoExtDropDownList({
        dataSource:pblmStatCdList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,autoBind:true
        ,index:0
    });

    //targetSkillAndQnaAnswerGrid.
    $("#targetSkillAndQnaAnswerGrid").kendoExtGrid({
        gridId:"G-PAR-0921-165801"
       ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/cpm/skillQna/selectSkillDetails.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sort"] = options.sort;

                        var sPblmNo = $("#pblmNo").val() == "" ? "X" : $("#pblmNo").val();
                        params["sPblmNo"] = sPblmNo;

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"parReqDocNo"
                    ,fields:{
                        rnum:{ type:"number" }
                        ,dlrCd:{ type:"string" }
                        ,pblmNo:{ type:"string" }
                        ,dlrPblmCd:{ type:"string" }
                        ,answPblmNo:{ type:"string" }
                        ,answItemCd:{ type:"string" }
                        ,procCont:{ type:"string" }
                        ,qestAnswCont:{ type:"string" }
                        ,answFilePathNm:{ type:"string" }
                        ,answFileNm:{ type:"string" }
                        ,fileNo:{ type:"string" }
                        ,fileSeq:{ type:"string" }
                        ,fileSizeVal:{ type:"string" }
                        ,fileDataCont:{ type:"string" }
                        ,regUsrId:{ type:"string" }
                        ,regDt:{ type:"date" }
                        ,updtUsrId:{ type:"string" }
                        ,updtDt:{ type:"date" }
                    }
                }
            }
        }
        ,editable:false
        ,pageable:false
        ,filterable:false
        ,height:70
        ,indvColumnRows:1
        ,autoBind:false
        ,change:function(e){
        }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();

            buttonEnableDisable(true);
            $.each(rows, function(idx, row){
                buttonEnableDisable(false);
            });
        }
        ,columns :
            [{ field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
            ,{ field:"answItemCd", title:"<spring:message code='par.lbl.answItemCd'/>", width:100 }//answItemCd
            ,{ field:"qestAnswCont", title:"<spring:message code='par.lbl.qestAnswCont'/>", width:500 }//qestAnswCont
        ]
    });

    //dlrCmpCd
    $("#dlrCmpCd").val("H");

    if(options.selectedRowItem.length !== 0){
        $("#pblmNo").val(options.selectedRowItem.pblmNo);
        $("#answPblmNo").val(options.selectedRowItem.answPblmNo);
        $("#itemCd").val(options.selectedRowItem.itemCd);
        $("#vinNo").val(options.selectedRowItem.vinNo);
        $("#modelCd").data("kendoExtDropDownList").value(options.selectedRowItem.modelCd);
        $("#dlrPblmCd").data("kendoExtDropDownList").value(options.selectedRowItem.dlrPblmCd);
        $("#pblmStatCd").data("kendoExtDropDownList").value(options.selectedRowItem.pblmStatCd);
        $("#dlrCdPblmStatCd").val(options.selectedRowItem.dlrCdPblmStatCd);

        $("#qestId").val(options.selectedRowItem.qestId);
        $("#dlrCmpCd").val(options.selectedRowItem.dlrCmpCd);
        $("#titleNm").val(options.selectedRowItem.titleNm);
        $("#pblmCont").val(options.selectedRowItem.pblmCont);
        $("#addQestCont").val(options.selectedRowItem.addQestCont);

        $("#fileNm").val(options.selectedRowItem.fileNm);
        var sizeInMB = getSizeMbByte(options.selectedRowItem.fileSizeVal);
        $("#uploadFileNo").val(options.selectedRowItem.fileNo);
        $("#uploadFileName").val(options.selectedRowItem.fileNm);
        $("#fileSizeVal").val(options.selectedRowItem.fileSizeVal+" / "+sizeInMB);

        $.ajax({
            url:"<c:url value='/par/cpm/skillQna/selectSkillAndQnaHeaderByKey.do' />"
            ,data:JSON.stringify({sPblmNo:options.selectedRowItem.pblmNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:false
            ,error:function(jqXHR,status,error){
                // itemCd not use check message
            }
            ,success:function(jqXHR, textStatus){
                $("#uploadFileBlob").val(jqXHR.fileDataCont);
                imageLoader();

                $("#targetSkillAndQnaAnswerGrid").data("kendoExtGrid").dataSource.read();
            }
        });

    }


});
</script>









