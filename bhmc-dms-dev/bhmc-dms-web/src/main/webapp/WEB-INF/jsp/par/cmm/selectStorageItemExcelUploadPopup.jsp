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
            <button id="btnDel" class="btn_s"><spring:message code='global.btn.rowDel' /></button>
            <button id="btnSave" class="btn_s"><spring:message code="global.btn.save" /></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/par/stm/stockMovement/insertStorageItemExcelUploadFile.do"/>">
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
                        <input type="hidden" id="strgeCd" name="strgeCd" />
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
var rowNumber = 0,
    localData = {"data":[], "total":0},
    locationObj            = {},
    locationListObj        = {},
    strgeTpObj             = {},
    giStrgeCdList          = [],
    strgeTpObj             = {},
    strgeTpList            = [],
    locCdList              = [];

/**
 * 팝업 옵션
 */
 var options = parent.storageItemExcelUploadPopupWin.options.content.data;

//giStrgeCdList
 <c:forEach var="obj" items="${giStrgeCdList}">
 giStrgeCdList.push({
     "strgeCd":"${obj.strgeCd}"
     ,"strgeNm":"${obj.strgeNm}"
 });
 </c:forEach>

 strgeTpObj[' '] = "";
 <c:forEach var="obj" items="${storageList}" varStatus="status">
     strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
     strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
 </c:forEach>

 //location Array
 <c:forEach var="obj" items="${locCdList}">
 locCdList.push({
     "locCd":"${obj.locCd}"
     ,"locNm":"${obj.locNm}"
 });
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

    //버튼 - 파일 다운로드
    $("#btnFileDownload").kendoButton({
        click:function(e){
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=StorageMovementItem_Tpl.xlsx";
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
            var saveList = [],
            grid = $("#grid").data("kendoExtGrid"),
            rows = grid.tbody.find("tr");

            dms.loading.show();

            if(rows.length  == 0 ){
                // 선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                dms.loading.hide();
                return false;
            }

            rows.each(function(index, row) {
                var gridData = grid.dataSource.at(index);
                if(Number(gridData.errorCount) > 0){
                    dms.notification.warning(gridData.errors);
                }else{
                    saveList.push(gridData);
                }
            });

            if(saveList.length == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
            }

            options.callbackFunc(saveList);

       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_PARTS_STOCK_MOVE"
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

    $("#strgeCd").val(options.strgeCd);

    /**
     * grid 구매수량
     */
     changeNumberEditor = function(container, options) {
         var input = $("<input/>"),
             pValue;

         input.attr("name", options.field);

         input.appendTo(container);
         input.kendoExtNumericTextBox({
             format:"n2"
             ,decimals:2
             ,min:0
             ,spinners:false
         });
     };

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-1220-163501"
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
                         itemCd             :{ type:"string", editable:false}
                        ,strgeMoveStockQty  :{ type:"number", editable:false,  validation:{required:true}}
                        ,giStrgeCd          :{ type:"string", validation:{required:true}, editable:false  }
                        ,grStrgeCd          :{ type:"string", validation:{required:true}, editable:false  }
                        ,giLocCd            :{ type:"string", validation:{required:true}, editable:false }
                        ,grLocCd            :{ type:"string", validation:{required:true}, editable:false }
                        ,grReasonCd         :{ type:"string", editable:false}
                        ,giStockQty         :{ type:"number", editable:false,  validation:{required:true}}
                        ,giAvlbStockQty     :{ type:"number", editable:false,  validation:{required:true}}
                        ,giResvStockQty     :{ type:"number", editable:false,  validation:{required:true}}
                        ,giBorrowQty        :{ type:"number", editable:false,  validation:{required:true}}
                        ,giRentQty          :{ type:"number", editable:false,  validation:{required:true}}
                        ,errorCount         :{ type:"string", editable:false}
                        ,errors             :{ type:"object", editable:false}
                    }
                }
                ,data:function (result){
                    var dataLen = result.data.length,
                    gridData = $("#grid").data("kendoExtGrid"),
                    itemList = [];

                    for(var i = 0; i < dataLen; i = i + 1){
                        itemList.push(result.data[i].itemCd);
                    }
                    fnSetLocCdObj(itemList);

                    return result.data;
                }
            }
        }
        ,height:250
        ,allowCopy: true
        ,autoBind:false
        ,pageable:false
        ,filterable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,dataBinding:function(e){
            var grid = e.sender;
            var page = grid.dataSource.page()? this.dataSource.page():1;
            var pageSize = grid.dataSource.pageSize()? this.dataSource.pageSize():0;

            rowNumber = (page-1)*pageSize;
        }
        ,columns:[
            {title:"<spring:message code='par.lbl.no' />", width:30, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#= ++rowNumber #"
            }
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:150
                ,attributes:{"class":"al"}
            }
            ,{field:"strgeMoveStockQty", title:"<spring:message code='par.lbl.strgeMoveQty' />", width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,decimal:2
                ,editor:changeNumberEditor
            }
            ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.orgStrgeCd' />", width:120
                //,editor:giStrgeCdDropDownEditor
                ,template:'#= changeStrgeCd(giStrgeCd)#'
            }//giStrgeCd
            ,{field:"giLocCd", title:"<spring:message code='par.lbl.orgLocCd' />", width:100
                //,editor:giLocCdDropDownEditor
                ,template:'#= changeLocCd(giStrgeCd, giLocCd)#'
            }//giLocCd
            ,{field:"grStrgeCd", title:"<spring:message code='par.lbl.newStrgeCd' />", width:120
                //,editor:grStrgeCdDropDownEditor
                ,template:'#= changeStrgeCd(grStrgeCd)#'
            }//grStrgeCd
            ,{field:"grLocCd", title:"<spring:message code='par.lbl.newLocCd' />", width:80
                //,editor:grLocCdDropDownEditor
                ,template:'#= changeLocCd(grStrgeCd, grLocCd)#'
            }//grLocCd
            ,{field:"grReasonCd", title:"<spring:message code='par.lbl.strgeMoveReason' />", width:200
                ,editor:function(container, options){
                    var input = $('<input id="grReasonCd" name="grReasonCd" data-bind="value:' + options.field + '" maxLength="30" style="width:100%"  />')
                    .appendTo(container);
                }
            }//grReasonCd
            ,{field:"errorCount", title:"<spring:message code='par.lbl.errYn' />", width:40
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

 // 창고
    changeStrgeCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = strgeTpObj[val];
        }
        return returnVal;
    };

    // 로케이션
    changeLocCd = function(strgeCd, locCd){
        var returnVal = "";
        if(locCd != null && locCd != ""){
            if(dms.string.isEmpty(locationObj[strgeCd])){
                returnVal = '';
            }else{
                if(dms.string.isEmpty(locationObj[strgeCd][locCd])){
                    returnVal = '';
                }else{
                    returnVal = locationObj[strgeCd][locCd];
                }
            }
        }else{
            returnVal = '';
        }
        return returnVal;
    };

    //$("#btnSave").hide();

});

function fnSetLocCdObj(pItemList){

    var header = {
            sItemCdLst       :pItemList
    };

    $.ajax({
        url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
       ,data:kendo.stringify(header)
       ,type:'POST'
       ,dataType:'json'
       ,contentType:'application/json'
       ,async:false
       ,success:function(result) {

           if(result.total > 0){
               for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                   if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                       if(locationListObj.hasOwnProperty(result.data[i].strgeCd)){

                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }else{
                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }

                       //locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                   }else{
                       locationListObj[result.data[i].itemCd] = {};
                       locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                       locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                   }


                   if(!locationObj.hasOwnProperty(result.data[i].strgeCd)){
                       locationObj[result.data[i].strgeCd] = {};
                       locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                   }else{

                       if(!locationObj[result.data[i].strgeCd].hasOwnProperty(result.data[i].locCd)){
                           locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                       }
                   }

               }
           }
       }
       ,error:function(jqXHR,status,error) {
           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
           return false;
       }

   });
}
</script>