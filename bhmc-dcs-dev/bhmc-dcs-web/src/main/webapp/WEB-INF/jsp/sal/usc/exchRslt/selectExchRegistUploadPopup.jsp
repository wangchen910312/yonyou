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
            <button id="btnSave" class="btn_s btn_save"><spring:message code="global.btn.save" /></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/sal/usc/exchRslt/insertExchRegistUploadFile.do"/>">
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
var rowNumber = 0;
var localData = {"data":[], "total":0}

var options = parent.exchRegistUploadPopupWin.options.content.data;
var promotionCd = options.promotionCd;
var dlrCd = options.dlrCd

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
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=EvalResult_Tpl.xlsx";
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

        	var grid = $('#grid').data('kendoExtGrid');
            var dataItems = grid.dataSource._data;

            // 오류체크. 오류없어야 저장가능.
            /*
            $.each(dataItems, function(idx, obj){
                if(obj.errorCount > 0){
                	dms.notification.info("<spring:message code='sal.info.exclDelModifyAfterSave' />");
                    return false;
                }
            });
            */

            var saveData = grid.dataSource.data();

            if(saveData.length == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            dms.loading.show();

            var insertList = []
            , sucessNo = 0
            , errorNo = 0
            , msg = [];
            $.each(saveData, function(idx, row){
                if(row.errorCount == 0){
                    insertList.push(row);
                    sucessNo++;
                }else{
                    errorNo++;
                }
            });
            msg.push({errorMessage:"<spring:message code='sal.lbl.saveCount'/>: "+sucessNo});
            msg.push({errorMessage:"<spring:message code='sal.lbl.nonSaveCount'/>: "+errorNo});
            msg.push({errorMessage:"<spring:message code='sal.lbl.totCount'/>: "+ (sucessNo + errorNo)} );

            if(sucessNo == 0){
                dms.loading.hide();
                dms.notification.error(msg);
                return false;
            }

            $.ajax({
                url:"<c:url value='/sal/usc/exchRslt/insertExchRegistSave.do' />"
                ,data:JSON.stringify({"exchRegistList":insertList})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.loading.hide();
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    dms.loading.hide();
                    //정상적으로 반영 되었습니다.
                    msg.push({errorMessage:"<spring:message code='global.info.success'/>"});
                    dms.notification.success(msg);

                    options.callbackFunc.call();
                    parent.exchRegistUploadPopupWin.close();
                }
                //,beforeSend: function(xhr){
                //    dms.loading.show($("#windows"));
                //}
                //,complete: function(xhr,status){
                //    dms.loading.hide($("#windows"));
                //}
            });
       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_EXCH_REGIST_SOURCE"
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
            ,sort:{field:"errorCount", dir:"desc"}
            ,schema:{
                model:{
                    fields:{
                        uploadDt   :{type:"date"}
                        ,exchTp  :{type:"string"}
                        ,dlrCd:{type:"string"}
                        ,dlrNm   :{type:"string"}
                        ,cityCd     :{type:"string"}
                        ,sungCd  :{type:"string"}
                        ,officeCd     :{type:"string"}
                        ,sdptCd:{type:"string"}
                        ,ocarMakerTp:{type:"string"}
                        ,ocarOwnerNm:{type:"string"}
                        ,ocarMakerNm:{type:"string"}
                        ,ocarVinNo:{type:"string"}
                        ,ocarRcptNo:{type:"string"}
                        ,ocarRcptPublDtS:{type:"string"}
                        ,ocarNo:{type:"string"}
                        //,ocarDlrCd:{type:"string"}
                        ,ncarOwnerNm:{type:"string"}
                        ,ssnCrnNo:{type:"string"}
                        ,ncarVinNo:{type:"string"}
                        ,ncarCarlineCd:{type:"string"}
                        ,ncarGradeCd:{type:"string"}
                        ,tmrCd:{type:"string"}
                        //,tmrMm:{type:"string"}
                        //,tmrYy:{type:"string"}
                        //,evalRsltCd:{type:"string"}
                        ,payAmt:{type:"string"}
                        ,matYyMmDt:{type:"string"}
                        ,payYyMmDt:{type:"string"}
                        ,errorCount:{type:"string"}
                        ,errors:{type:"object"}
                    }
                }
            }
        }
        ,indvColumnReorderable:false
        ,indvColumnVisible:false
        ,height:400
        ,pageable:{
            info:true
        }
        //,sortable:{field:"errorCount", dir:"asc"}
        ,editable:false
        ,dataBinding:function(e){
            var grid = e.sender;
            var page = grid.dataSource.page()? this.dataSource.page():1;
            var pageSize = grid.dataSource.pageSize()? this.dataSource.pageSize():0;

            rowNumber = (page-1)*pageSize;
        }
        ,columns:[
             {field:"errorCount", title:"<spring:message code='global.lbl.errYn' />", width:80
                 ,attributes:{"class":"ac"}
                 ,template:function(dataItem){
                     if(dataItem.errorCount == 0){
                         return "N";
                     }
                     return "Y";
                 }
             }
             ,{field:"errors", title:"<spring:message code='global.lbl.errMesgTxt' />", width:250
                 ,template:function(dataItem) {  //에러메세지
                     var str = "";
                     $.each(dataItem.errors, function(idx, obj){
                         str += "<div>" + obj.errorMessage + "</div>";
                     });

                     return str;
                 }
             }
            ,{field:"uploadDt",    title:"上传时间",    width:150,  attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateTimeFormat' />}"} //등록일자
            ,{field:"exchTp",   title:"区分",    width:100, attributes:{"class":"al"}} //교환유형
            ,{field:"dlrCd",   title:"经销商代码",width:100, attributes:{"class":"al"}} //딜러코드
            ,{field:"dlrNm",   title:"经销商名称",width:80,  attributes:{"class":"ac"}} //딜러명
            ,{field:"cityCd",   title:"城市",    width:80,  attributes:{"class":"ac"}} //도시
            ,{field:"sungCd",   title:"省",    width:80,  attributes:{"class":"ac"}} //성
            ,{field:"officeCd",   title:"办事处",    width:80,  attributes:{"class":"ac"}} //사무소
            ,{field:"sdptCd",   title:"事业部",    width:80,  attributes:{"class":"ac"}} //사업부
            ,{field:"ocarMakerTp",   title:"品牌判断",    width:80,  attributes:{"class":"ac"}} //브랜드
            ,{field:"ocarOwnerNm",   title:"旧车车主姓名",    width:80,  attributes:{"class":"ac"}} //기존차차주성명
            ,{field:"ocarMakerNm",   title:"品牌",    width:80,  attributes:{"class":"ac"}} //브랜드
            ,{field:"ocarVinNo",   title:"VIN码",    width:80,  attributes:{"class":"ac"}} //VIN NO
            ,{field:"ocarRcptNo",   title:"二手车发票号",    width:80,  attributes:{"class":"ac"}} //중고차영수증번호
            ,{field:"ocarRcptPublDtS",   title:"二手车发票日期",    width:80,  attributes:{"class":"ac"}} //중고차영수증발행일자
            ,{field:"ocarNo",   title:"车牌号",    width:80,  attributes:{"class":"ac"}} //차량번호
            //,{field:"ocarDlrCd",   title:"代码",    width:80,  attributes:{"class":"ac"}} //코드
            ,{field:"ncarOwnerNm",   title:"新车车主姓名",    width:80,  attributes:{"class":"ac"}} //신차차주명
            ,{field:"ssnCrnNo",   title:"身份证号",    width:80,  attributes:{"class":"ac"}} //신분증번호
            ,{field:"ncarVinNo",   title:"新车VIN码",    width:80,  attributes:{"class":"ac"}} //신차 VIN NO
            ,{field:"ncarCarlineCd",   title:"车种",    width:80,  attributes:{"class":"ac"}} //차종
            ,{field:"ncarGradeCd",   title:"级别",    width:80,  attributes:{"class":"ac"}} //등급
            ,{field:"tmrCd",   title:"终端",    width:80,  attributes:{"class":"ac"}} //단말기
            //,{field:"tmrMm",   title:"终端月份",    width:80,  attributes:{"class":"ac"}} //단말기월
            //,{field:"tmrYy",   title:"终端年份",    width:80,  attributes:{"class":"ac"}} //단말기년
            //,{field:"evalRsltCd",   title:"判断",    width:80,  attributes:{"class":"ac"}} //심사결과
            ,{field:"payAmt",   title:"支付金额",    width:80,  attributes:{"class":"ac"}} //지불금액
            ,{field:"matYyMmDt",   title:"材料月份",    width:80,  attributes:{"class":"ac"}} //자재년월
            ,{field:"payYyMmDt",   title:"支付月份",    width:80,  attributes:{"class":"ac"}} //지불년월
        ]

    });
});
</script>
