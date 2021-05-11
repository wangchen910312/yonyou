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

    <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/crm/cso/salesOpptProcessMgmt/insertSalesOpptProcessUploadFile.do"/>">

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

     <div class="table_form form_width_50per mt5"> <!--정보유형 영역 시작 -->
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.approchLocation' /></span></th> <!-- 정보경로 -->
                    <td>
                        <input id="holdTp" name="holdTp" class="form_comboBox" data-json-obj="true" />
                    </td>
                    <td colspan="2">
                        <input id="holdDetlTpSeq" name="holdDetlTpSeq" class="form_comboBox" data-json-obj="true" />
                    </td>
                </tr>
            </tbody>
        </table>
     </div> <!--정보유형 영역 끝 -->

    </form>
    <div id="progressSection"></div>
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">

var holdTpList = [];
var holdTpMap = [];

//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}

var custTpMap         = [];
var carlineCdMap         = [];
var infoTpMap = [];
var sexCdMap = [];
var mathDocTpMap = [];
var payTpMap = [];


/**
 * 팝업 옵션
 */
var options = parent.excelUploadPopupWin.options.content.data;

var supportedLangs = [""];
<c:forEach var="obj" items="${supportedLangs}">
supportedLangs.push("${obj}");
</c:forEach>

var baseNames = [""];
<c:forEach var="obj" items="${baseNames}">
baseNames.push("${obj}");
</c:forEach>

<c:forEach var="obj" items="${holdTpList}">
holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
holdTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${custTpList}">
custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차종조회
<c:forEach var="obj" items="${carlineCdList}">
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

<c:forEach var="obj" items="${infoTpList}">
infoTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${sexCdList}">
sexCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${mathDocTpList}">
mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

<c:forEach var="obj" items="${payTpList}">
payTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {

    // 고객확보유형1      holdTp      (CRM008)
    $("#holdTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , dataSource:dms.data.cmmCdFilter(holdTpList)
       , optionLabel:" "
       , filter:"contains"
       , filtering:function(e){
           var filter = e.filter;
       }
       ,select:onSelectSearchHoldTp
   });

    // 고객확보유형2      holdDetlTpSeq   (CRM***)
    $("#holdDetlTpSeq").kendoExtDropDownList({
       dataTextField:"holdDetlTpNm"
       , dataValueField:"holdSeq"
       , filter:"contains"
       , optionLabel:" "
       , enable:false
    });

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
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=SalesOpptProcess_Tpl_zh.xlsx";
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

            var holdTp = $("#holdTp").data("kendoExtDropDownList").value();
            var holdDetlTpSeq = $("#holdDetlTpSeq").data("kendoExtDropDownList").value();

            if ( dms.string.isEmpty(holdTp) ) {
                dms.notification.warning("<spring:message code='crm.lbl.approchLocation' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                return false;
            };

            if ( holdTp == "03" ) {
                if ( dms.string.isEmpty(holdDetlTpSeq) ) {
                    dms.notification.warning("<spring:message code='crm.lbl.approchLocationDtl' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                };
            }

            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.dataSource.data();

            //var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            if (saveData.length == 0){
                dms.notification.info("<spring:message code='global.info.required.change' />");
                return;
            }

            $.each(saveData, function(idx, obj){
                obj.holdTp = holdTp;
                obj.makCd = holdDetlTpSeq;
                delete obj.errors;
                //delete obj.errorCount;
            });

            console.log("Sales Oppt. Info. File Upload 4_!!");
            console.log(saveData);

//             $("#btnSave").data("kendoButton").enable(false);
//             $("#btnDel").data("kendoButton").enable(false);
            $.ajax({
                url:"<c:url value='/crm/cso/salesOpptProcessMgmt/insertSalesOpptPorcessBatchUploadRlt.do' />"
                ,data:JSON.stringify({"batchUploadList":saveData})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    console.log("Excep Import Errors !!!");
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                //,success:function(jqXHR, textStatus) {
                ,success:function(result){
                    console.log("Excep Import Result!!!");
                    console.log(result);
                    console.log(result.total);
                    console.log(result.data[0]);
//                     console.log(result.data[0].custNo);
                    localData = result;

                    var successCnt=0;
                    var failCnt=0;

                    for (var i=0 ; i< result.total; i++) {
                        if(dms.string.isEmpty(result.data[i].custNo)) {
                            failCnt++;
                        } else {
                            successCnt++;
                        }
                    };

                      //console.log("Totcnt : " + result.total + " , Success Cnt : " + successCnt + " , FailCnt : " + failCnt);
                      dms.notification.info("<spring:message code='crm.info.salesopptExcelImpMsg' arguments='"+result.total+","+successCnt+","+failCnt+"' />");
                    //$('#grid').data('kendoExtGrid').dataSource.read();
                    options.callbackFunc.call();
                    parent.excelUploadPopupWin.close();
                }
                ,beforeSend:function(xhr) {
                    dms.loading.show();
                 }
                ,complete:function(xhr, status) {
                    dms.loading.hide();
                }
            });
            console.log("Excep Import Result111!!!");
            //parent.excelUploadPopupWin.close();
       }
    });

    //버튼 - 닫기
    $("#btnClose").kendoButton({
        click:function(e){
            parent.excelUploadPopupWin.close();
       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_MESSAGE_SOURCE"
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
            console.log("progressSection : obj");
            console.log(obj);
            localData = obj;
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
    	gridId:"G-CRM-0628-171200"
        ,dataSource:{
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
                        dlrCd:{type:"string", editable:false}
                        , custNm:{type:"string", editable:false}
                        , custTp:{type:"string", editable:false}
                        , hpNo:{type:"string", editable:false}
                        , officeTelNo:{type:"string", editable:false}
                        , wechatId:{type:"string", editable:false}
                        , emailNm:{type:"string", editable:false}
                        , telNo:{type:"string", editable:false}
                        , sexCd:{type:"string", editable:false}
                        , mathMthCd:{type:"string", editable:false}
                        , ssnCrnNo:{type:"string", editable:false}
                        , infoTp:{type:"string", editable:false}
                        , payTp:{type:"string", editable:false}
                        , mngScId:{type:"string", editable:false}
                        , holdTp:{type:"string", editable:false}
                        , makCd:{type:"string", editable:false}
                        , estimateCont:{type:"string", editable:false}
                        , salesCont:{type:"string", editable:false}
                        , remark:{type:"string", editable:false}
                        , localCarRegNoYn:{type:"string", editable:false}
                        , errorCount:{type:"int", editable:false}
                        , errors:{type:"object", editable:false}
                        , errorsStr:{type:"string", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            var str = "";
                            $.each(elem.errors, function(idx, obj){
                                str += "<div>" + obj.errorMessage + "</div>";
                            });
                            elem.errorsStr = str;
                        });
                    }
                    return d;
                }
            }
        }
        ,filterable:false
        ,height:410
        ,multiSelectWithCheckbox:true
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
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
            {_field:"rowNumber", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#= ++rowNumber #"
            }
            ,{field:"errorCount", title:"<spring:message code='global.lbl.errYn' />", width:80
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    if(dataItem.errorCount == 0){
                        //return "<spring:message code='crm.lbl.problemN' />";
                        return "";
                    } else if(dataItem.errorCount == 9999){
                        return "-";
                    }
                    return "<spring:message code='crm.lbl.error' />";
                }
            }
            ,{field:"errorsStr", title:"<spring:message code='global.lbl.errMesgTxt' />", width:250
                ,template:function(dataItem) {  //에러메세지
                    var str = "";
                    $.each(dataItem.errors, function(idx, obj){
                        str += "<div>" + obj.errorMessage + "</div>";
                    });

                    return str;
                }
            }
            , {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}
            , {field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"ac"}}
            , {field:"custTp", title:"<spring:message code='global.lbl.custTp' />", width:100, attributes:{"class":"ac"}
                ,template:function(dataItem) {
                    if(!custTpMap.hasOwnProperty(dataItem.custTp)){
                        return '';
                    }else {
                        return custTpMap[dataItem.custTp];
                    }
                }
            }
            , {field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:100, attributes:{"class":"ac"}}
            , {field:"purcMngNm", title:"<spring:message code='crm.lbl.corpPurcMng' />", width:100, attributes:{"class":"ac"}}
            , {field:"intrCarlineCd", title:"<spring:message code='crm.lbl.intentionCarline' />", width:100, attributes:{"class":"ac"}
                    ,template:function(dataItem) {
                        if(!carlineCdMap.hasOwnProperty(dataItem.intrCarlineCd)){
                            return '';
                        }else {
                            return carlineCdMap[dataItem.intrCarlineCd];
                        }
                    }
            }
            , {field:"infoTp", title:"<spring:message code='crm.lbl.infoType' />", width:100, attributes:{"class":"ac"}
                    ,template:function(dataItem) {
                        if(!infoTpMap.hasOwnProperty(dataItem.infoTp)){
                            return '';
                        }else {
                            return infoTpMap[dataItem.infoTp];
                        }
                    }

            }
            , {field:"holdTp", title:"<spring:message code='crm.lbl.approchLocation' />", width:100, attributes:{"class":"ac"}, hidden:true}
            , {field:"makCd", title:"<spring:message code='global.lbl.crNo' />", width:100, attributes:{"class":"ac"}, hidden:true}
            , {field:"officeTelNo", title:"<spring:message code='global.lbl.officeTelNo' />", width:100, attributes:{"class":"ac"}}
            , {field:"wechatId", title:"<spring:message code='global.lbl.wechatId' />", width:100, attributes:{"class":"ac"}}
            , {field:"emailNm", title:"<spring:message code='global.lbl.emailNm' />", width:100, attributes:{"class":"ac"}}
            //, {field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />", width:100, attributes:{"class":"ac"}}
            , {field:"sexCd", title:"<spring:message code='global.lbl.sex' />", width:100, attributes:{"class":"ac"}
                    ,template:function(dataItem) {
                        if(!sexCdMap.hasOwnProperty(dataItem.sexCd)){
                            return '';
                        }else {
                            return sexCdMap[dataItem.sexCd];
                        }
                    }
            }
            , {field:"mathDocTp", title:"<spring:message code='global.lbl.mathDocTp' />", width:100, attributes:{"class":"ac"}
                    ,template:function(dataItem) {
                        if(!mathDocTpMap.hasOwnProperty(dataItem.mathDocTp)){
                            return '';
                        }else {
                            return mathDocTpMap[dataItem.mathDocTp];
                        }
                    }
            }
            , {field:"ssnCrnNo", title:"<spring:message code='global.lbl.ssnCrnNo' />", width:100, attributes:{"class":"ac"}}
            , {field:"payTp", title:"<spring:message code='crm.lbl.payMethod' />", width:100, attributes:{"class":"ac"}
                    ,template:function(dataItem) {
                        if(!payTpMap.hasOwnProperty(dataItem.payTp)){
                            return '';
                        }else {
                            return payTpMap[dataItem.payTp];
                        }
                    }
            }
            , {field:"mngScId", title:"<spring:message code='crm.lbl.prsNm' />", width:100, attributes:{"class":"ac"}}
            , {field:"estimateCont", title:"<spring:message code='crm.lbl.estimateInfo' />", width:100, attributes:{"class":"ac"}}
            , {field:"salesCont", title:"<spring:message code='crm.lbl.promotionCont' />", width:100, attributes:{"class":"ac"}}
            , {field:"remark", title:"<spring:message code='crm.lbl.remark' />", width:100, attributes:{"class":"ac"}}
            , {field:"localCarRegNoYn", title:"<spring:message code='crm.lbl.plateNum' />", width:100, attributes:{"class":"ac"}}

        ]

    });
//     $("#btnSave").data("kendoButton").enable(false);
//     $("#btnDel").data("kendoButton").enable(false);

});

/** [조회조건 영역] ComboBox Select() **/
// 정보경로에 따른 상세경로 조회
function onSelectSearchHoldTp(e){
    $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
    $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(true);

    var dataItem = this.dataItem(e.item);
    if(dataItem.cmmCd == ""){
        $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource([]);
        $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
        return false;
    }

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectHoldTpDetl.do' />"
        ,data:JSON.stringify({"sHoldTp":dataItem.cmmCd})
        ,async:false
    });

    if (responseJson.total == 0) {
        $("#holdDetlTpSeq").data("kendoExtDropDownList").enable(false);
    } else {
        $("#holdDetlTpSeq").data("kendoExtDropDownList").setDataSource(responseJson.data);
    }
}
</script>









