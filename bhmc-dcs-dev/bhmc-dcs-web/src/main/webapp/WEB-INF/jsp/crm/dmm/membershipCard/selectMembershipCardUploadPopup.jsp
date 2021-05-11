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
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/crm/dmm/membershipCard/insertMembershipCardUploadFile.do"/>">
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
var options = parent.membershipCardUploadPopupWin.options.content.data;

/*************************************************************
 *드랍다운 리스트 셋팅
 *************************************************************/
 //카드종류구분 Array
 var cardTpList = [{"cmmCd":"", "cmmCdNm":""}];
 <c:forEach var="obj" items="${cardTpCdList}">
 cardTpList.push({
     "cmmCd":"${obj.cmmCd}"
     , "cmmCdNm":"${obj.cmmCdNm}"
 });
 </c:forEach>
 //카드종류구분 Map
 var cardTpMap = [];
 $.each(cardTpList, function(idx, obj){
     cardTpMap[obj.cmmCd] = obj.cmmCdNm;
 });


 //카드형태구분 Array
 var cardFormList = [{"cmmCd":"", "cmmCdNm":""}];
 <c:forEach var="obj" items="${cardFormCdList}">
 cardFormList.push({
     "cmmCd":"${obj.cmmCd}"
     , "cmmCdNm":"${obj.cmmCdNm}"
 });
 </c:forEach>
 //카드형태구분 Map
 var cardFormMap = [];
 $.each(cardFormList, function(idx, obj){
     cardFormMap[obj.cmmCd] = obj.cmmCdNm;
 });


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
            //TODO[양식다운로드적용]
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

            console.log(JSON.stringify({"membershipCardUploadList":saveData}));

            if(saveData.length == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            $.ajax({
                url:"<c:url value='/crm/dmm/membershipCard/insertMembershipCardSave.do' />"
                ,data:JSON.stringify({"membershipCardUploadList":saveData})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    options.callbackFunc.call();
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_MEMBERSHIP_CARD"
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
                        id:"seq"
                        ,fields:{
                            dlrCd:{type:"string"}
                            ,pltCd:{type:"string"}
                            ,seq:{type:"string"}
                            ,membershipSeq:{type:"string"}
                            ,cardTpCd:{type:"string", validation:{required:true}} //카드종류
                            ,cardNo:{type:"string", validation:{required:true}} //카드번호
                            ,cardUseDt:{type:"date",  validation:{required:true}} // 카드사용기한
                            ,cardFormCd:{type:"string", validation:{required:true}} //카드형태
                            ,mesgKey:{type:"string", validation:{required:true}}
                            ,mesgTxt:{type:"string", validation:{required:true}}
                            ,errorCount:{type:"string", editable:false}
                            ,errors:{type:"object", editable:false}
                        }
                    }
            }
        }
        ,height:250
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
        ,multiSelectWithCheckbox:true
        ,columns:[
          /*  {title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#= ++rowNumber #"
            } */
           {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
           ,{field:"pltCd", title:"<spring:message code='global.lbl.pltCd' />", hidden:true}// 사업장코드
           ,{field:"cardNo", title:"<spring:message code='global.lbl.cardNo' />"}// 카드번호
           ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd' />"
               ,width:120
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:cardTpList
                   });
                }
               ,template:'#if(cardTpCd !== ""){# #= cardTpMap[cardTpCd]# #}#'
           }// 카드종류
           ,{field:"cardUseDt", title:"<spring:message code='global.lbl.cardUseDt'/>"
               ,attributes:{"class":"ac"}
               ,format:"{0:<dms:configValue code='dateFormat' />}"
               ,editor:function(container, options) {
                   $('<input required name="cardUseDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtMaskedDatePicker({
                       format:"<dms:configValue code='dateFormat' />"
                       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                       ,value:""
                   });
                   $('<span class="k-invalid-msg" data-for="cardUseDt"></span>').appendTo(container);
               }
           }// 사용기한
           ,{field:"cardFormCd", title:"<spring:message code='global.lbl.cardFormCd'/>"
               ,width:120
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:cardFormList
                   });
                }
               ,template:'#if(cardFormCd !== ""){# #= cardFormMap[cardFormCd]# #}#'
           }// 카드형태
           ,{field:"mesgKey", title:"<spring:message code='global.lbl.mesgKey' />", width:150}
           ,{field:"mesgTxt", title:"<spring:message code='global.lbl.mesgTxt' />", width:50}
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









