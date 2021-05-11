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
            <button id="btnTempFileDownload" class="btn_s"><spring:message code="global.btn.templateDownload" /></button>
            <button id="btnDel" class="btn_s"><spring:message code='global.btn.rowDel' /></button>
            <button id="btnSave" class="btn_s"><spring:message code="global.btn.save" /></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/ser/svi/laborManage/insertLaborExcelUpload.do"/>">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:70%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <td>
                        <input type="file" id="uploadFile" name="uploadFile" class="form_file"/>
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
var localData = {"data":[], "total":0};

/**
 * 팝업 옵션
 */
var parentData = parent.excelUploadPopupWin.options.content.data;

$(document).ready(function() {

    //파일업로드
    $("#uploadFile").change(function(){
        if(dms.string.isEmpty($(this).val())) {
            dms.notification.show("<spring:message code='global.lbl.file' var='fileMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fileMsg}' />", "popup");
            return;
        }
        $("#progressSection").excelUpload("upload");
    });

    //버튼 - 파일 다운로드
    $("#btnTempFileDownload").kendoButton({
        click:function(e){
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=uploadLaborDetailRegList_Tpl.xlsx";
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
            var saveList  = [],
                grid      = $("#grid").data("kendoExtGrid"),
                rows      = grid.tbody.find("tr");

            //var saveData = grid.dataSource.data();
            //dms.loading.show();

            if(grid.dataSource.data().length  == 0 ){
                // 선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                dms.loading.hide();
                return false;
            }
            var param = {};
            $.ajax({
                url:"<c:url value='/ser/svi/laborManage/insertLaborCodeDetailExcel.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    //parentData.callbackFunc.call();
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#windows"));
                    dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#windows"));
                }
            });

       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_LABOR_INFO"
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
            dms.loading.hide();
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-0703-144301"
       ,dataSource:{
           transport:{
                   read :{
                       url:"<c:url value='/ser/svi/laborManage/selectLaborCodeExcelData.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
            ,schema:{
                model:{
                    fields:{
                         lbrCd          :{type:"string", editable:false}
                        ,validStartDt   :{type:"date", validation:{required:true}}
                        ,validEndDt     :{type:"date", validation:{required:true}}
                        ,lbrHm          :{type:"number", validation:{required:true}}
                        ,payLbrHm       :{type:"number", validation:{required:true}}
                        ,allocLbrHm     :{type:"number", validation:{required:true}}
                        ,serCnt         :{type:"number"}
                        ,errorCount     :{type:"string", editable:false}
                        ,errors         :{type:"object", editable:false}
                    }
                }
            }
        }
        ,height:250
        ,allowCopy: true
        ,editable:false
        ,autoBind:false
        ,selectable: "multiple"
        ,pageable:true
        ,dataBinding:function(e){
            /* var grid = e.sender;
            var page = grid.dataSource.page()? this.dataSource.page():1;
            var pageSize = grid.dataSource.pageSize()? this.dataSource.pageSize():0;

            rowNumber = (page-1)*pageSize; */
        }
        ,filterable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,columns:[
            {field:"dstinNm", title:"<spring:message code='ser.lbl.gubun' />", width:80, attributes:{"class":"ac"}}//구분코드
           ,{field:"lbrCd", title:"<spring:message code='ser.lbl.lbrCd' />", width:100, sortable:false, attributes:{"class":"al"}}//공임코드
           ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:100, sortable:true, attributes:{"class":"al"}} //LTS MODEL CD
           ,{field:"ltsModelNm", title:"<spring:message code='ser.lbl.ltsModelNm' />", width:200, sortable:false, attributes:{"class":"al"}} //LTS MODEL 명
           ,{field:"lbrHm", title:"<spring:message code='ser.lbl.chargeLbr' />", width:70, sortable:false, attributes:{"class":"ar"}}//공임시간
           ,{field:"payLbrHm", title:"<spring:message code='ser.lbl.lbrHm' />", width:70, sortable:false, attributes:{"class":"ar"}}//정비공임
           ,{field:"allocLbrHm", title:"<spring:message code='ser.lbl.dstbHm' />", width:70, sortable:false, attributes:{"class":"ar"}}//배분공임
           ,{field:"serCnt", title:"<spring:message code='ser.lbl.serCnt' />", width:70, sortable:false, attributes:{"class":"ar"}}//수리건수
           ,{field:"validStartDt", title:"<spring:message code='ser.lbl.validStartDt' />", width:120, sortable:false,attributes:{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateFormat' />}"
           }//유효시작일자
           ,{field:"validEndDt", title:"<spring:message code='ser.lbl.validEndDt' />", width:120, sortable:false
               ,attributes:{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateFormat' />}"
           }//유효종료일자
            ,{field:"errorCount", title:"<spring:message code='par.lbl.errYn' />", width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem.errorCount == 0){
                        return "N";
                    }
                    return "Y";
                }
            },
            {field:"errors", title:"<spring:message code='par.lbl.errMesgTxt' />", width:300
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