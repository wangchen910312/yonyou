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
            <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/par/pmm/itemMaster/insertItemMasterExcelUploadFile.do"/>">
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
 var options = parent.itemMasterExcelUploadPopupWin.options.content.data;

var brandCdList = [],
    brandCdObj = [];
    carlineCdList = [],
    carlineCdObj = [],
//brandCdList
brandCdList.push({cmmCd:"", cmmCdNm:" "});
<c:forEach var="obj" items="${brandCdList}" varStatus="status">
    brandCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    brandCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//carlineCdList
<c:forEach var="obj" items="${carlineCdList}" varStatus="status">
carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
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
        	location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=PartItemMasterTarget_Tpl.xlsx";
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
            var saveItem = [];
            var itemMaxCheckCnt = 0;
            var itemErrorCheckCnt = 0;

            var items = grid.dataSource.data();

            for (i = 0; i < items.length; i++) {
                var dataItem = items[i];
                var setBrandCd = 'OT'; //엑셀업로드는 브랜드코드 무조건 기타임.
                var excelVO = {
                    itemCd : dataItem.itemCd
                    ,itemNm : dataItem.itemNm
                    ,brandCd : dataItem.brandCd
                    ,startDt : dataItem.startDt.toString().replace('-','').replace('-','')//char '-' replace
                    ,carlineCd : dataItem.carlineCd
                    ,dgrItemYn : dataItem.dgrItemYn
                    ,sftyStockQty : dataItem.sftyStockQty
                    ,stockUnitCd : dataItem.stockUnitCd
                    ,oldRplcItemCd :dataItem.oldRplcItemCd
                    ,newRplcItemCd :dataItem.newRplcItemCd
                    ,oldRplcParCmptYn :dataItem.oldRplcParCmptYn
                    ,newRplcParCmptYn :dataItem.newRplcParCmptYn
                    ,errorCount : dataItem.errorCount
                    ,errors : null
                }
                //excel item max 1000
                if(i >= 1000){
                    itemMaxCheckCnt++;
                }
                //excel item error
                if(dataItem.errorCount > 0){
                    itemErrorCheckCnt++;
                }

                saveItem.push(excelVO);
            }

            if(itemMaxCheckCnt > 0){
                dms.notification.info("<spring:message code='par.info.uploadFileMaxCnt' />");
                return false;
            }else if(itemErrorCheckCnt > 0){
                dms.notification.info("<spring:message code='par.info.uploadFileErrorCnt' />");
                return false;
            }else{
                $.ajax({
                    url:"<c:url value='/par/pmm/itemMaster/multiItemMasterExcelData.do' />"
                    ,data:JSON.stringify(saveItem)
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
        }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_PARTS_MASTERS"
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
            ,serverPaging:true
            ,serverSorting:false
            ,schema:{
                model:{
                    fields:{
                        insertUpdateTp:{type:"string"}
                        ,itemCd:{type:"string", validation:{required:true}}
                        ,itemNm:{type:"string", validation:{required:true}}
                        ,brandCd:{type:"string"}
                        ,startDt:{type:"string"}
                        ,carlineCd:{type:"string"}
                        ,dgrItemYn:{type:"string"}
                        ,sftyStockQty:{type:"number"}
                        ,strSftyStockQty:{type:"string"}
                        ,stockUnitCd:{type:"string", validation:{required:true}}
                        ,oldRplcItemCd:{type:"string"}
                        ,newRplcItemCd:{type:"string"}
                        ,oldRplcParCmptYn:{type:"string"}
                        ,newRplcParCmptYn:{type:"string"}
                        ,errorCount:{type:"number"}
                        ,errors:{type:"object"}
                    }
                }
            }
        }
        ,editable:false
        ,height:357
        ,pageable:false
        ,filterable:false
        ,selectable:"row"
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
            {title:"<spring:message code='par.lbl.no' />", width:50, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#= ++rowNumber #"
            }
            ,{field:"insertUpdateTp", title:"<spring:message code='par.lbl.statNm' />", width:50, attributes:{"class":"ac"}}//insertUpdateTp
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:110}//itemCd
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:120}//itemNm
            ,{field:"brandCd", title:"<spring:message code='par.lbl.brand' />", template:'#= changeBrandCd(brandCd)#', width:80 }//brandCd
            ,{field:"startDt", title:"<spring:message code='par.lbl.startDt' />", width:100}//유효시작일
            ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />", template:'#= changeCarlineCd(carlineCd)#', width:100 }
            ,{field:"dgrItemYn", title:"<spring:message code='par.lbl.dangYn' />", width:100, attributes:{"class":"ac"} }//dgrItemYn
            ,{field:"strSftyStockQty", title:"<spring:message code='par.lbl.sftyStockQty' />", width:100, attributes:{"class":"ac"} }//sftyStockQty
            ,{field:"stockUnitCd", title:"<spring:message code='par.lbl.stockUnitCd' />", width:100, attributes:{"class":"ac"} }//stockUnitCd
            ,{field:"oldRplcItemCd", title:"<spring:message code='par.lbl.oldRplcItemCd' />", width:120, attributes:{"class":"ac"} }//oldRplcItemCd
            ,{field:"newRplcItemCd", title:"<spring:message code='par.lbl.newRplcItemCd' />", width:120, attributes:{"class":"ac"} }//newRplcItemCd
            ,{field:"oldRplcParCmptYn", title:"<spring:message code='par.lbl.oldRplcParCmptYn' />", width:120, attributes:{"class":"ac"} }//oldRplcParCmptYn
            ,{field:"newRplcParCmptYn", title:"<spring:message code='par.lbl.newRplcParCmptYn' />", width:120, attributes:{"class":"ac"} }//newRplcParCmptYn
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
            if(brandCdObj[val] != undefined){
                returnVal = brandCdObj[val];
            }
        }
        return returnVal;
    };
    //changeCarlineCd Func
    changeCarlineCd = function(val){
        var returnVal = "";
        if(val != null && val != "" && carlineCdObj[val] != undefined){
            returnVal = carlineCdObj[val];
        }
        return returnVal;
    };
});
</script>
