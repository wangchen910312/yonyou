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

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/mis/tmp/insertTargetMonthRegUploadFile.do"/>">
        <input type="hidden" id="goalYyMm" name="goalYyMm" value="${targetMonthRegSearchVO.goalYyMm}">
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

/**
 * 팝업 옵션
 */
 var options = parent.targetMonthAllRegUploadPopupWin.options.content.data;

var supportedLangs = [""];
<c:forEach var="obj" items="${supportedLangs}">
supportedLangs.push("${obj}");
</c:forEach>

var baseNames = [""];
<c:forEach var="obj" items="${baseNames}">
baseNames.push("${obj}");
</c:forEach>

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
            //TODO[양식다운로드]
        	//location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=MessageSource_Tpl.xlsx";
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

            if(saveData.length == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            $.ajax({
                url:"<c:url value='/mis/tmp/insertTargetAllMonthRegUploadSave.do?goalYyMm=' />"+$("#goalYyMm").val()
                ,data:JSON.stringify({"targetAllMonthRegUploadList":saveData})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    parent.$('#grid').data('kendoExtGrid').dataSource.page(1);
                    parent.targetMonthAllRegUploadPopupWin.close();
                }
            });
       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_TARGETMONTH_ALL_SOURCE"
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
                    fields:{
                         dlrCd:{type:"string", validation:{required:true}}
                        ,carLineCd:{type:"string", validation:{required:true}}
                        ,goalPrefVal:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,height:400
        ,filterable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,pageable:{
            info:true
        }
        ,dataBinding:function(e){
            var grid = e.sender;
            var page = grid.dataSource.page()? this.dataSource.page():1;
            var pageSize = grid.dataSource.pageSize()? this.dataSource.pageSize():0;

            rowNumber = (page-1)*pageSize;
        }
        ,columns:[
            {field:"dlrCd", title:"<spring:message code='mis.lbl.dlrCd' />", width:150
                ,attributes:{"class":"ac"}
            }
            ,{field:"carLineCd", title:"<spring:message code='mis.lbl.carlineCd' />", width:150
                ,attributes:{"class":"ac"}
            }
            ,{field:"goalPrefVal", title:"<spring:message code='mis.lbl.goalPrefVal' />", width:150
                ,attributes:{"class":"ar"}}
        ]

    });
});
</script>