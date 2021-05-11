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
        <h1 class="title_basic"><spring:message code="crm.menu.leadInfoUpload" /></h1> <!-- 리드정보 업로드 -->
        <div class="btn_right">
            <<button id="btnFileDownload" class="btn_s"><spring:message code="global.btn.templateDownload" /></button>
        	<button id="btnDel" class="btn_s"><spring:message code='global.btn.rowDel' /></button>
            <button id="btnSave" class="btn_s btn_save"><spring:message code="global.btn.save" /></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/crm/slm/leadUpload/insertLeadUploadFile.do"/>">
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
        <div id="grid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}


/*************************************************************
 *드랍다운 리스트 셋팅
 *************************************************************/

 var leadSrcList = [];
 var leadSrcMap = [];
 var custHoldTpDtlList       = [{"makCd":"", "makNm":""}];
 var custHoldTpDtlMap = [];
 var yesDS = [];
 var yesMap = [];
 var custTpMap         = [];

 <c:forEach var="obj" items="${custTpList}">
 custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${leadSrcList}">
 leadSrcList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
 leadSrcMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

 <c:forEach var="obj" items="${custHoldTpDtlList}">
 custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
 custHoldTpDtlMap["${obj.makCd}"] = "${obj.makNm}";
 </c:forEach>

 yesDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
 yesDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
 yesMap["Y"] = "<spring:message code='global.lbl.yes' />";
 yesMap["N"] = "<spring:message code='global.lbl.n' />";

$(document).ready(function() {

	//파일업로드 
	$("#uploadFile").change(function(){
		if(dms.string.isEmpty($(this).val())) {
     		dms.notification.show("<spring:message code='global.lbl.file' var='fileMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fileMsg}' />", "popup");
     		return;
 		}
		
		$("#grid").data("kendoExtGrid").dataSource.data([]);
 		$("#progressSection").excelUpload("upload");
	});
    
  	//버튼 - 양식다운로드
    $("#btnFileDownload").kendoButton({
        click:function(e){
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=LeadInfo_Tpl_zh.xlsx";
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

            //var saveData = grid.dataSource.data();

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            if (grid.cudDataLength == 0){
                dms.notification.info("<spring:message code='global.info.required.change' />");
                return;
            }

            console.log("Lead Info. File Upload!!");
            console.log(saveData);
            var errorCount;
            for (var i=0; saveData.insertList.length > i; i++) {
                errorCount = saveData.insertList[i].errorCount;
                console.log(errorCount);
                if ( errorCount > 0) {
                    dms.notification.info("<spring:message code='crm.info.excelUploadErrorMsg' />");
                    return;
                }
            }

            $.ajax({
                url:"<c:url value='/crm/slm/leadUpload/multiLeadUploadFileSave.do' />"
                ,data:JSON.stringify(saveData)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    //options.callbackFunc.call();
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    $("#grid").data("kendoExtGrid").dataSource.data([]);
                }
            });
       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_CUSTOMER"
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

    $("#btnFileSelect").click(function() {
        $("#uploadFile").click();
    });

    $("#uploadFile").change(function() {
        console.log("uploadFile change !!!");
        $("#fileSize").text($("#uploadFile").value());
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
                        id:"seq"
                        ,fields:{
                            dlrCd:{type:"string", editable:false}
                            ,leadTp:{type:"string", editable:false}
                            ,hpNo:{type:"string", editable:false}
                            ,telNo:{type:"string", editable:false}
                            ,leadSrcCd:{type:"string", editable:false}
                            ,bhmcYn:{type:"string", editable:false}
                            ,prsnNm:{type:"string", editable:false}
                            ,ddlnDt:{type:"date", editable:false}
                            ,opptChgDt:{type:"date", editable:false}
                            ,regUsrNm:{type:"string", editable:false}
                            ,regDt:{type:"date", editable:false}
                            ,statCd:{type:"string", editable:false}
                            ,delayYn:{type:"string", editable:false}
                            ,allocDt:{type:"date", editable:false}
                            ,errorCount:{type:"string", editable:false}
                            ,errors:{type:"object", editable:false}
                        }
                    }
            }
        }
        ,height:450
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
        ,navigatable:false
        ,multiSelectWithCheckbox:true
        ,columns:[
           {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100}// 딜러코드
           ,{field:"errorCount", title:"<spring:message code='global.lbl.errYn' />", width:80
               ,attributes:{"class":"ac"}
               ,template:function(dataItem){
                   if(dataItem.errorCount == 0){
                       return "N";
                   }
                   return "Y";
               }
           }
           ,{field:"errors", title:"<spring:message code='global.lbl.errMesgTxt' />", width:100
               ,template:function(dataItem) {  //에러메세지
                   var str = "";
                   $.each(dataItem.errors, function(idx, obj){
                       str += "<div>" + obj.errorMessage + "</div>";
                   });

                   return str;
               }
           }
           ,{field:"leadTp", title:"<spring:message code='global.lbl.type' />", width:100, attributes:{"class":"ac"}}/* 리드유형 */
           ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"ac"}}/* 고객명 */
           ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:120, attributes:{"class":"ac"}}
           ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />", width:120, attributes:{"class":"ac"}}
           ,{field:"leadSrcCd", title:"<spring:message code='global.lbl.leadSrc' />", width:100, attributes:{"class":"ac"}
               ,template:'#if (leadSrcCd !== ""){# #= leadSrcMap[leadSrcCd]# #}#'
           }
           ,{field:"prsnId", title:"<spring:message code='global.lbl.prsNm' />", width:100, attributes:{"class":"ac"}}
           ,{field :"leadSrcDtl", title:"<spring:message code='global.lbl.crNo' />",  width:130, attributes:{"class":"ac"}
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:custHoldTpDtlList
                   });
                }
               ,template:'#if(leadSrcDtl !== ""){# #= custHoldTpDtlMap[leadSrcDtl]# #}#'
           }
           ,{field:"custTp", title:"<spring:message code='global.lbl.custTp' />", width:100, attributes:{"class":"ac"}
               ,template:'#if (custTp !== ""){# #= custTpMap[custTp]# #}#'
           }
           ,{field:"officeTelNo", title:"<spring:message code='global.lbl.officeTelNo' />", width:120, attributes:{"class":"ac"}}
           ,{title:""}
        ]
    });

});
</script>
