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
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/sal/lom/tpVehicleMonitoring/insertTpVehicleMonitoringUploadFile.do"/>">
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
 var options = parent.tpVehicleMonitoringPopupWin.options.content.data;

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
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=TpVehicleMonitoring_zh.xlsx";
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

            dms.loading.show();

            /*
            var isError = false;
            $.each(saveData, function(idx, row){
                if(row.errorCount > 0){
                    isError = true;
                }
            });

            if(isError){
                // 데이터 추출중 에러가 발생했습니다.
                dms.notification.warning("<spring:message code='global.err.excelUpload.dataExtract'/>");
                return;
            }
            */

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
                url:"<c:url value='/sal/lom/tpVehicleMonitoring/insertTpVehicleMonitoringUpload.do' />"
                ,data:JSON.stringify({"insertList":insertList})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.loading.hide();
                    if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }else{
                        dms.notification.error(error);
                    }
                }
                ,success:function(jqXHR, textStatus) {
                    dms.loading.hide();
                    //정상적으로 반영 되었습니다.
                    msg.push({errorMessage:"<spring:message code='global.info.success'/>"});
                    dms.notification.success(msg);
                    options.callbackFunc.call();

                }
            });
       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_TP_VEHICLE_MONITORING"
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
                        dlrCd:{type:"string"}
                        ,vinNo:{type:"string"}
                       //,dstbCmpNm:{type:"string"} // DCS 在途信息管理 上传模版中 '物流公司' 删掉 贾明 2018-9-3
                        ,trsfCarNo:{type:"string"}
                        ,trsfLocCd:{type:"string"}
                        ,trsfStatCd:{type:"string"}
                        ,driverNm:{type:"string"}
                        ,driverTelNo:{type:"string"}
                        ,preAlrtNtceCont:{type:"string"}
                        ,carRegNo:{type:"string"}
                        ,dstbCmpDlDt:{type:"date"}
                        ,errorCount :{type:"string", editable:false}
                        ,errors:{type:"object", editable:false}
                    }
                }
            }
        }
        ,height:400
        ,editable:false
        ,filterable:false
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
            {title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#= ++rowNumber #"
            }
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}
            ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNum' />",  width:160}            //vin no
            //,{field:"dstbCmpNm", title:"<spring:message code='global.lbl.logisticsCmpn' />", width:100, attributes:{"class":"al"}}  // DCS 在途信息管理 上传模版中 '物流公司' 删掉 贾明 2018-9-3 
            ,{
                field:"trsfCarNo"
               ,title:"<spring:message code='global.lbl.tpCarNo' />"
               ,attributes:{"class":"ar"}
               ,width:100
            } //TP차번호
            ,{
                field:"trsfLocCd"
               ,title:"<spring:message code='global.lbl.trsfPosition' />"
               ,attributes:{"class":"ar"}
               ,width:100
            } //운송중위치
            ,{
                field:"trsfStatCd"
               ,title:"<spring:message code='global.lbl.statNm' />"
               ,attributes:{"class":"ar"}
               ,width:100
            } //상태
            ,{
                field:"driverNm"
               ,title:"<spring:message code='global.lbl.driver' />"
               ,attributes:{"class":"al"}
               ,width:100
            } //운전기사
            ,{
                field:"driverTelNo"
               ,title:"<spring:message code='sal.lbl.driverTel' />"
               ,attributes:{"class":"al"}
               ,width:100
            } //전화번호
            ,{
                field:"preAlrtNtceCont"
               ,title:"<spring:message code='global.lbl.preAltNoti' />"
               ,attributes:{"class":"al"}
               ,width:100
            } //조기경보통지
            ,{
                field:"carRegNo"
               ,title:"<spring:message code='global.lbl.licensePlt' />"
               ,attributes:{"class":"al"}
               ,width:100
            } //차량등록번호
            ,{
                field:"dstbCmpDlDt"
               ,title:"<spring:message code='sal.lbl.expcArriveDt' />"
               ,attributes:{"class":"al"}
               ,width:100
               ,format:"{0:<dms:configValue code='dateFormat' />}"
            } //예상도착일자

            ,{field:"errorCount", title:"<spring:message code='global.lbl.errYn' />", width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem.errorCount == 0){
                        return "N";
                    }
                    return "Y";
                }
            },
            {field:"errors", title:"<spring:message code='global.lbl.errMesgTxt' />", width:500
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