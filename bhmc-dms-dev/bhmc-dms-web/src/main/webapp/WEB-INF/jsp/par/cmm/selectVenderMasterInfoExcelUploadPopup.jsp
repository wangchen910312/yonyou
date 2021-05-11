<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<style type="text/css">
    .progress_section {background-color:#ffffff;border:1px solid #ddd;padding:5px;position:absolute;width:400px;top:150px;z-index:1500;margin-left:-300px;left:50%;display:none;}
    #progressMessage {height:20px;}
    #progressbar {height:25px;}
</style>

<div id="resizableContainer">
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <button id="btnFileDownload" class="btn_s"><spring:message code="global.btn.templateDownload" /></button>
                <button id="btnDel" class="btn_s"><spring:message code='global.btn.rowDel' /></button>
                <button id="btnSave" class="btn_s"><spring:message code="global.btn.save" /></button>
            </div>
        </div>

        <div class="table_form" role="search" data-btnid="btnSearch">
            <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/par/pmm/venderMaster/insertVenderMasterExcelUploadFile.do"/>">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:70%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <td>
                            <input type="file" id="uploadFile" name="uploadFile" class="form_file" />
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            </form>
        </div>

        <div id="progressSection"></div>

        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>
<script type="text/javascript">
//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}

/**
 * 팝업 옵션
 */
 var options = parent.venderMasterExcelUploadPopupWin.options.content.data;

//bpTpList
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//bpTpMap
var bpTpMap = {};
$.each(bpTpList, function(idx, obj){
    bpTpMap[obj.cmmCd] = obj.cmmCdNm;
});
var cntryCdDs = [];
<c:forEach var="obj" items="${cntryCdDs}">
cntryCdDs.push({
    "cntryCd":"${obj.cntryCd}"
    ,"cntryNm":"${obj.cntryNm}"
});
</c:forEach>
var cntryCdMap = {};
$.each(cntryCdDs, function(idx, obj){
    cntryCdMap[obj.cntryCd] = obj.cntryNm;
});
//payTpList
var payTpList = [];
<c:forEach var="obj" items="${payTpList}">
payTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//payTp Map
var payTpMap = {};
$.each(payTpList, function(idx, obj){
    payTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//payTermCdList
var payTermCdList = [];
<c:forEach var="obj" items="${payTermCdList}">
payTermCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//payTermCd Map
var payTermCdMap = {};
$.each(payTermCdList, function(idx, obj){
    payTermCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//useYn Array
var useYnCdList = [];
<c:forEach var="obj" items="${useYnCdList}">
useYnCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//useYnCd Map
var useYnCdMap = {};
$.each(useYnCdList, function(idx, obj){
    useYnCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//sexCdList Array
var sexCdList = [];
<c:forEach var="obj" items="${sexCdList}">
sexCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//sexCdList Map
var sexCdMap = {};
$.each(sexCdList, function(idx, obj){
    sexCdMap[obj.cmmCd] = obj.cmmCdNm;
});

$(document).ready(function() {

    //파일업로드
    $("#uploadFile").change(function(){
        if(dms.string.isEmpty($(this).val())) {
            dms.notification.show("<spring:message code='global.lbl.file' var='fileMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fileMsg}' />", "popup");
            return;
        }
        $("#progressSection").excelUpload("upload");
    });

    //버튼 - 양식다운로드
    $("#btnFileDownload").kendoButton({
        click:function(e){
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=PartSupplierInfoTarget_Tpl.xlsx";
        }
    });

    //버튼 - 행삭제
    $("#btnDel").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var saveData = grid.dataSource.data();

            var multiVenderMasterExcels = { insertList:[], updateList:saveData, deleteList:[] };
            $.ajax({
                url:"<c:url value='/par/pmm/venderMaster/multiVenderMasterExcelData.do' />"
                ,data:JSON.stringify(multiVenderMasterExcels)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    options.callbackFunc(false);
                    //error message
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(jqXHR, textStatus){
                    options.callbackFunc(true);
                    //success message
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });

        }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_VENDER_MASTERS"
        ,uploadForm :"uploadForm"
        ,messages:{
            fileUpload:"<spring:message code='global.info.fileUpload.processing' />"
            ,fileUploadComplete:"<spring:message code='global.info.fileUpload.complete' />"
            ,dataExtract:"<spring:message code='global.info.excelUpload.dataExtract.complete' />"
            ,dataExtractComplate:"<spring:message code='global.info.excelUpload.dataExtract.processing' />"
            ,uploadComplete:"<spring:message code='global.info.excelUpload.complete' />"
        }
        ,callback:function(obj){
            localData = obj;
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
            data:localData
            ,transport:{
                read:function (options) {
                    options.success(localData);
                }
            }
            ,serverPaging:false
            ,serverSorting:false
            ,schema:{
                model:{
                    id:"bpCd"
                        ,fields:{
                            dlrCd:{ type:"string" , validation:{required:true} }
                            ,insertUpdateTp:{ type:"string", editable:false }
                            ,bpCd:{ type:"string" , validation:{required:true} }
                            ,bpNm:{ type:"string" , validation:{required:true} }
                            ,bpFullNm:{ type:"string" , validation:{required:true} }
                            ,contractNo:{ type:"string" , validation:{required:true} }
                            ,contractStartDt:{ type:"string" , validation:{required:true} }
                            ,ownRgstNm:{ type:"string" }
                            ,prsnNm:{ type:"string" }
                            ,prsnTelNo:{ type:"string" }
                            ,prsnHpNo:{ type:"string" }
                            ,sungCd:{ type:"string" }
                            ,sungNm:{ type:"string" }
                            ,distCd:{ type:"string" }
                            ,distNm:{ type:"string" }
                            ,addr:{ type:"string" }
                            ,zipCd:{ type:"string" }
                            ,errorCount:{type:"string", editable:false}
                            ,errors:{type:"object", editable:false}
                    }
                }
            }
        }
        ,editable:false
        ,height:357
        ,pageable:false
        ,filterable:false
        ,sortable:false
        ,dataBound:function(e){
            rowNumber = 0;
            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if(dataItem != null && dataItem != 'undefined'){
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");

                    var insertUpdateTp = row.children().eq(1);

                    if(dataItem.errorCount > 0){
                        insertUpdateTp.addClass("bg_red");
                    }
                }
            });
        }
        ,columns:[
            {title:"<spring:message code='par.lbl.no' />", width:30, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#= ++rowNumber #"
            }
            ,{field:"insertUpdateTp", title:"<spring:message code='par.lbl.statNm' />", width:50, attributes:{"class":"ac"}}//insertUpdateTp
            ,{field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:80 }//bpCd
            ,{field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:100 }//bpNm
            ,{field:"bpFullNm", title:"<spring:message code='par.lbl.bpFullNm' />", width:100 }//bpFullNm
            ,{field:"contractNo", title:"<spring:message code='par.lbl.contractNo' />", width:100 }//contractNo
            ,{field:"contractStartDt", title:"<spring:message code='par.lbl.contractStartDt' />", width:100}//contractStartDt
            ,{field:"ownRgstNm", title:"<spring:message code='par.lbl.ownRgstNm' />", width:80 }//ownRgstNm
            ,{field:"prsnNm", title:"<spring:message code='par.lbl.prsnNm' />", width:100 }//prsnTelNo
            ,{field:"prsnTelNo", title:"<spring:message code='par.lbl.prsnTelNo' />", width:100 }//prsnTelNo
            ,{field:"prsnHpNo", title:"<spring:message code='par.lbl.prsnHpNo' />", width:100 }//prsnHpNo
            ,{field:"sungNm", title:"<spring:message code='par.lbl.sung' />", width:100 }//sungNm
            ,{field:"distNm", title:"<spring:message code='par.lbl.distNm' />", width:100 }//distNm
            ,{field:"addr", title:"<spring:message code='par.lbl.addr' />", width:100 }//addr
            ,{field:"zipCd", title:"<spring:message code='par.lbl.zipCd' />", width:100 }//zip
            ,{field:"errorCount", title:"<spring:message code='par.lbl.errYn' />", width:60
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem.errorCount == 0){
                        return "N";
                    }
                    return "Y";
                }
            },
            {field:"errors", title:"<spring:message code='par.lbl.errMesgTxt' />", width:200
                ,template:function(dataItem) {  //에러메세지
                    var str = "";
                    $.each(dataItem.errors, function(idx, obj){
                        str += "<div>" + obj.errorMessage + "</div>";
                    });

                    return str;
                }
            }
        ]

    });
    //changeBrandCd Func
    changeBrandCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = brandCdObj[val];
        }
        return returnVal;
    };
    //changeCarlineCd Func
    changeCarlineCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = carlineCdObj[val];
        }
        return returnVal;
    };

    //$("#btnSave").hide();

});
</script>









