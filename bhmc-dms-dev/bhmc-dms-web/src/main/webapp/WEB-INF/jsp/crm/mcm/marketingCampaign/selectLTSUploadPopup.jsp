<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<style type="text/css">
    .progress_section {background-color:#ffffff;border:1px solid #ddd;padding:5px;position:absolute;width:600px;top:150px;z-index:1500;margin-left:-300px;left:50%;display:none;}
    #progressMessage {height:20px;}
    #progressbar {height:25px;}
</style>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnFileDownload" class="btn_s"><spring:message code="global.btn.templateDownload" /></button>
            <button id="btnDel" class="btn_s"><spring:message code='global.btn.rowDel' /></button>
            <button id="btnSave" class="btn_s"><spring:message code="global.btn.save" /></button>
        </div>
    </div>

    <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/crm/mcm/marketingCampaign/insertLTSUploadFile.do"/>">
        <div class="table_form" role="search" data-btnid="btnSearch">
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
        </div>
        <input type="hidden" name="makCd" id="makCd" value="${makCd}" />
    </form>


    <div id="progressSection"></div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}

/**
 * 팝업 옵션
 */
var parentData = parent.ltsUploadPopupWin.options.content.data;

$(document).ready(function() {
    var uploadProgressId = "LTS";
    
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
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=MarketingCampaignLTS_Tpl_zh.xlsx";
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

            var params = {};
            params["tDlrCd"] = "${dlrCd}";
            params["tMakCd"] = "${makCd}";

            var targetDs = grid.dataSource;
            var iRowCnt = targetDs.total();
            for(var i = 0; i < iRowCnt; i++){
                targetDs.at(i).dlrCd = "${dlrCd}";
                targetDs.at(i).makCd = "${makCd}";
            }
            var saveData = grid.dataSource.data();
            var sd = [];
            $.each(saveData, function(idx, obj){
               if (obj.errorCount != "1"){
                   sd.push(obj);
               }
            });

            params["insertTargetVO"] = sd;

            $.ajax({
                url:"<c:url value='/crm/mcm/marketingCampaign/insertLtsModelExcelData.do' />"
                ,data:JSON.stringify(params)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");

                    parentData.callbackFunc.call();
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
          progressId : uploadProgressId
         ,uploadForm :"uploadForm"
         ,uploadStatusUrl:"<c:url value='/cmm/excelUpload/selectExcelUploadStatus.do' />"
         ,interval:300
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
        gridId:"G-CRM-0912-201701"
        ,dataSource:{
            data:localData
            ,transport:{
                read:function (parentData) {
                    parentData.success(localData);
                }
            }
            ,serverPaging:false
            ,serverSorting:false
            ,schema:{
                    model:{
                        id:"seq"
                        ,fields:{
                            dlrCd:{type:"string"}
                            ,makCd:{type:"string"}
                            ,ltsModelCd:{type:"string" } //
                            ,ltsModelNm:{type:"string" } //
                            ,mesgKey:{type:"string", validation:{required:true}}
                            ,mesgTxt:{type:"string", validation:{required:true}}
                            ,errorCount:{type:"string", editable:false}
                            ,errors:{type:"object", editable:false}
                        }
                    }
            }
        }
        ,height:310
        ,pageable:{
            info:true
        }
        ,dataBinding:function(e){
            var grid = e.sender;
            var page = grid.dataSource.page()? this.dataSource.page():1;
            var pageSize = grid.dataSource.pageSize()? this.dataSource.pageSize():0;

            rowNumber = (page-1)*pageSize;
        }
        ,editable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false
        ,columns:[
            {field:"dlrCd", hidden:true}// 딜러코드
           ,{field:"makCd", hidden:true}// 캠페인번호
           ,{field:"ltsModelCd", title:"<spring:message code='ser.lbl.ltsModelCd' />", width:100}// LTSMODEL
           ,{field:"ltsModelNm", title:"<spring:message code='ser.lbl.ltsModelNm' />", width:100}// LTSMODEL
           ,{field:"mesgKey", title:"<spring:message code='global.lbl.mesgKey' />", width:150,hidden:true}
           ,{field:"mesgTxt", title:"<spring:message code='global.lbl.mesgTxt' />", width:50,hidden:true}
           ,{field:"errorCount", title:"<spring:message code='global.lbl.errYn' />", width:80
               ,attributes:{"class":"ac"}
               ,template:function(dataItem){
                   if(dataItem.errorCount == 0){
                       return "N";
                   }
                   return "Y";
               }
           },
           {field:"errors", title:"<spring:message code='global.lbl.errMesgTxt' />", width:100
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