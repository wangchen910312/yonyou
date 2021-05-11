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

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnFileDownload" class="btn_s"><spring:message code="global.btn.templateDownload" /></button>
<%--             <button id="btnDel" class="btn_s"><spring:message code='global.btn.rowDel' /></button> --%>
<%--             <button id="btnSave" class="btn_s"><spring:message code="global.btn.save" /></button> --%>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/par/stm/investigation/insertInvestigationExcelUploadFile.do"/>">
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
                    	 <input type="hidden" id="sStockDdDocNo" name="sStockDdDocNo" />
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>

    <div id="progressSection"></div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}
var options       = parent.investigationExcelUploadPopupWin.options.content.data;
$(document).ready(function() {
    $("#uploadFile").change(function(){
        if(dms.string.isEmpty($(this).val())) {
            dms.notification.show("<spring:message code='global.lbl.file' var='fileMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fileMsg}' />", "popup");
            return;
        }
        $("#progressSection").excelUpload("upload");
    });

    $("#btnFileDownload").kendoButton({
        click:function(e){
            //location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=Investigation_Tpl.xlsx";
        }
    });
    
    //下载
    $("#btnFileDownload").kendoButton({
        click:function(e){
            //alert($("#sStockDdDocNo").val());
            //return;

            var beanName = "investigationService";
            var templateFile = "InvestigationList_Tpl.xlsx";
            var fileName = "InvestigationList.xlsx";
            dms.ajax.excelExport({
                "beanName":beanName
                ,"templateFile":templateFile
                ,"fileName":fileName
                ,"sStockDdDocNo":$("#sStockDdDocNo").val()
            });
        }
    });
    $("#sStockDdDocNo").val(options.sStockDdDocNo);
    $("#progressSection").excelUpload({
        progressId :"UPLOAD_InvestigationExcel"
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
            //console.log(localData);
            $('#grid').data('kendoExtGrid').dataSource.read();
            dms.loading.hide();
        	options.callbackFunc(null);
        	dms.notification.success("<spring:message code='global.info.success'/>");
        }
    });

    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0611-141200"
       ,dataSource:{
            data:localData
            ,transport:{
                read:function (options) {
                    options.success(localData);
                }
            }
            ,serverPaging:true
            ,serverSorting:false
            ,schema:{
                model:{
                    fields:{
                         excelItemCd                :{type:"string", editable:false, validation:{required:true}}
                        ,excelStrgeNm              :{type:"string", editable:false, validation:{required:true}}
                        ,excelLocCd              :{type:"string", editable:false}
                        ,excelLocCdMig       :{type:"string", editable:false}
                        ,excelDdQty          :{type:"number", editable:false}
                        ,errorCount            :{type:"string", editable:false}
                        ,errors                :{type:"object", editable:false}
                    }
                }
            }
        }
        , height:250
        ,pageable:false
        ,dataBinding:function(e){
            var grid = e.sender;
            var page = grid.dataSource.page()? this.dataSource.page():1;
            var pageSize = grid.dataSource.pageSize()? this.dataSource.pageSize():0;

            rowNumber = (page-1)*pageSize;
        }
        , filterable:false
        , appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,columns:[
            {title:"<spring:message code='par.lbl.no' />", width:30, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#= ++rowNumber #"
            }
            ,{field:"excelItemCd", title:"<spring:message code='par.lbl.itemCd' />", width:150
                ,attributes:{"class":"al"}
            }
            ,{field:"excelStrgeNm", title:"<spring:message code='par.lbl.strgeCd' />", width:150
                ,attributes:{"class":"al"}
            }
            ,{field:"excelLocCd", title:"<spring:message code='par.lbl.locationCd' />", width:80
                ,attributes:{"class":"ar"}
            }
            ,{field:"excelLocCdMig", title:"<spring:message code='par.lbl.locationCd' /> 2", width:80
                ,attributes:{"class":"ar"}
            }
            ,{field:"excelDdQty", title:"<spring:message code='par.lbl.ddQty' />", width:80
                ,attributes:{"class":"ar"}
            }
            ,{field:"errorCount", title:"<spring:message code='par.lbl.errYn' />", width:80
                ,attributes:{"class":"ar"}
                ,template:function(dataItem){
                    if(dataItem.errorCount == 0){
                        return "N";
                    }
                    return "Y";
                }
            },
            {field:"errors", title:"<spring:message code='par.lbl.errMesgTxt' />", width:300
                ,attributes:{"class":"al"}
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
});
</script>