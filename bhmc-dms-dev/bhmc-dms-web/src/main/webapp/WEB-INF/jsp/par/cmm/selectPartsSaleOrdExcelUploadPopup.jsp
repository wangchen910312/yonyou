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
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/par/ism/issue/insertPartsSaleOrdItemExcelUploadFile.do"/>">
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
var rowNumber   = 0,
    localData   = {"data":[], "total":0},
    strgeTpObj  = {};

strgeTpObj[' '] = "";
<c:forEach var="obj" items="${storageList}" varStatus="status">
    strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

/**
 * 팝업 옵션
 */
 var options = parent.partsSaleOrdExcelUploadPopupWin.options.content.data;
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
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=PartsSaleOrdItem_Tpl.xlsx";
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
            dms.loading.show();

            if(rows.length  == 0 ){
                // 선택값이 없습니다.
                dms.notification.warning("<spring:message code='global.info.unselected' />");
                dms.loading.hide();
                return false;
            }

            //for(var i = 0,dataLen=localData.data.length;i < dataLen;i = i + 1){
            rows.each(function(index, row) {
                //var gridData = localData.data[i];
                var gridData = grid.dataSource.at(index);
                if(Number(gridData.errorCount) > 0){
                    dms.notification.warning(gridData.errors);
                   // // 납기일를 입력하십시오
                   // dms.notification.warning("<spring:message code='par.lbl.periodDeliveryDt' var='periodDeliveryDt' /><spring:message code='global.info.confirmMsgParam' arguments='${periodDeliveryDt}'/>");
                    //saveList = [];
                    //return false;
                }else{
                    saveList.push(gridData);
                }

            //}
            });


            if(saveList.length == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
            }

            options.callbackFunc(saveList);

       }
    });

    $("#progressSection").excelUpload({
         progressId :"UPLOAD_PARTS_SALE_ORDER" + options.prcTp
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

    /**
     * grid 구매수량
     */
     changeNumberEditor = function(container, options) {
         var input = $("<input/>"),
             pValue;

         input.attr("name", options.field);

         input.appendTo(container);
         input.kendoExtNumericTextBox({
             min:0
             ,format: "n2"
             ,decimals:2
             ,spinners:false

         });
     };

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0519-172001"
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
                         itemCd         :{type:"string", editable:false}
                        ,excelQty       :{type:"number", editable:false, validation:{required:true}}
                        ,prc            :{type:"number", editable:false, validation:{required:true}}
                        ,excelDcRate    :{type:"number", editable:false, validation:{required:true}}
                        ,giStrgeCd      :{type:"string", editable:false}
                        ,movingAvgPrc   :{type:"number", editable:false}
                        ,movingAvgTaxDdctPrc     :{type:"number", editable:false}
                        ,errorCount     :{type:"string", editable:false}
                        ,errors         :{type:"object", editable:false}
                    }
                }
            }
        }
        , height:250
        ,allowCopy: true
        ,selectable: "multiple cell"
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
                ,attributes:{"class":"al"}
                ,template:"#= ++rowNumber #"
            }
            ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:150
                ,attributes:{"class":"al"}
            }
            ,{field:"excelQty", title:"<spring:message code='par.lbl.partsSaleQty' />", width:80
                ,attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,editor:changeNumberEditor
            }
            ,{field:"prc", title:"<spring:message code='par.lbl.partsSalePrc' />", width:80
                ,attributes:{"class":"ar"}
                ,editor:changeNumberEditor
            }
            ,{field:"excelDcRate", title:"<spring:message code='par.lbl.cstDcRate' />", width:80
                ,attributes:{"class":"ar"}
                ,editor:changeNumberEditor
                ,template:function(dataItem){
                    var spanObj = "";
                    if(dms.string.isEmpty(dataItem.excelDcRate)){
                        spanObj = "0%";
                    }else{
                        spanObj = dataItem.excelDcRate + "%";
                    }

                    return spanObj;
                 }
            }
            , {//이동단가
                field      :"movingAvgPrc"
               ,title      :"<spring:message code='par.lbl.movingAvgPrc' />"
               ,attributes :{"class":"ar"}
               ,format     :"{0:n2}"
               ,width      :100
               ,hidden     :true
            }
            , {//이동단가(세금제외)
                field      :"movingAvgTaxDdctPrc"
               ,title      :"<spring:message code='par.lbl.movingAvgPrc' />(<spring:message code='par.lbl.taxSprt' />)"
               ,attributes :{"class":"ar"}
               ,format     :"{0:n2}"
               ,width      :100
               ,hidden     :true
            }
            , {   //출고창고
                title:"<spring:message code='par.lbl.strgeCd' />"
               ,field:"giStrgeCd"
               ,width:140
               ,template:'#= changeStrgeCd(giStrgeCd)#'
               ,sortable:false
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

    //$("#btnSave").hide();

});
</script>