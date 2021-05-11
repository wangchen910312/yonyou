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

    <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/crm/mcm/marketingCampaign/insertTargetUploadFile.do"/>">
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
var options = parent.targetUploadPopupWin.options.content.data;

$(document).ready(function() {

	//파일업로드
	$("#uploadFile").change(function(){
		if(dms.string.isEmpty($(this).val())) {
     		dms.notification.show("<spring:message code='global.lbl.file' var='fileMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fileMsg}' />", "popup");
     		return;
 		}
 		$("#progressSection").excelUpload("upload");
 		$("#btnSave").data("kendoButton").enable(true);
		$("#btnDel").data("kendoButton").enable(true);
	});

  	//버튼 - 양식다운로드
    $("#btnFileDownload").kendoButton({
        click:function(e){
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=MarketingCampaignTarget_Tpl_zh.xlsx";
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
	    , enable:false
	});

    //버튼 - 저장
    $("#btnSave").kendoButton({
        enable:false
        , click:function(e){
            var params = {};
            var delparams = {};
            var grid = $("#grid").data("kendoExtGrid");
            var iRowCnt = grid.dataSource.total();

            if (iRowCnt <= 0) {
                dms.notification.warning("<spring:message code='global.lbl.registration' var='returnMsg' /><spring:message code='global.info.notExistData' arguments='${returnMsg}' />");
                return false;
            }

            var dlrCd = "${dlrCd}";
            var makCd = "${makCd}";
            var extrDgreCnt;
            var realTargetCnt;

            var targetGrid = parent.$("#targetGrid").data("kendoExtGrid");

            this.enable(false);
            /* 1. 기존에 추출한 것을 먼저 삭제 한다.
            *  2. 엑셀을 업로드 한다.
            */
            // 1. 기존에 추출한 것을 먼저 삭제 한다.
            $.each(targetGrid.dataSource.view(), function(idx, dataItem){
             // 추출차수
                extrDgreCnt = dataItem.extrDgreCnt;
                //고객대상자 수
                realTargetCnt = dataItem.realTargetCnt;

                delparams = {
                        "dlrCd":dlrCd
                        ,"makCd":makCd
                        ,"extrDgreCnt":extrDgreCnt
                        };
                if (realTargetCnt != 0 ) {
                    //console.log("deleteTargetEx:::");
                    $.ajax({
                        url:"<c:url value='/crm/mcm/marketingCampaign/deleteTargetEx.do' />"
                        ,data:JSON.stringify(delparams)      //파라미터
                        ,type:'POST'                        //조회요청
                        ,dataType:'json'                  //json 응답
                        ,contentType:'application/json'   //문자열 파라미터
                        ,async:false
                        ,error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(data) {
                            parent.$("#extrDgreCnt").val("");
                            parent.$("#realTargetCnt").val("");
                            //console.log("deleteTargetEx.do success:function!!!!");
                        }
                        ,complete:function(xhr, status) {
                            //console.log("deleteTargetEx.do Done!!!!");
                        }
                    });
                } else {
                    //console.log("deleteTarget:::");
                    $.ajax({
                        url:"<c:url value='/crm/mcm/marketingCampaign/deleteTarget.do' />"
                        ,data:JSON.stringify(delparams)      //파라미터
                        ,type:'POST'                        //조회요청
                        ,dataType:'json'                  //json 응답
                        ,contentType:'application/json'   //문자열 파라미터
                        ,async:false
                        ,error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(data) {
                            parent.$("#extrDgreCnt").val("");
                            parent.$("#realTargetCnt").val("");
                            //console.log("deleteTarget.do Done!!!!");
                        }
                        ,complete:function(xhr, status) {
                            //console.log("deleteTarget.do Done!!!!");
                        }
                    });
                }
            });

            // 2. 엑셀을 업로드 한다.
            //console.log("Escel Upload !!!!");

            params["tDlrCd"] = dlrCd;
            params["tMakCd"] = makCd;

            var targetDs = grid.dataSource;
            var iRowCnt = targetDs.total();
            for(var i = 0; i < iRowCnt; i++){
                targetDs.at(i).dlrCd = "${dlrCd}";
                targetDs.at(i).makCd = "${makCd}";
            }

            var saveData = grid.dataSource.data();

            $.each(saveData, function(idx, obj){
                delete obj.errors;
            });

            params["insertTargetVO"] = saveData;

            $.ajax({
                url:"<c:url value='/crm/mcm/marketingCampaign/insertTargetExcelData.do' />"
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

                    options.callbackFunc.call();
                }
                ,beforeSend:function(xhr){
                    dms.loading.show();
                    dms.notification.info("<spring:message code='crm.info.proceIng'/>");
                }
                ,complete:function(xhr,status){
                    dms.loading.hide();
                }
            });
       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_TARGET"
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
        gridId:"G-CRM-0725-185901"
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
                        id:"seq"
                        ,fields:{
                            dlrCd:{type:"string"}
                            ,makCd:{type:"string"}
                            ,extrDgreCnt:{type:"number"}
                            ,custExtrTermNo:{type:"string"}
                            ,custNo:{type:"string", validation:{required:true}} //고객번호
                            ,custNm:{type:"string", validation:{required:true}} //고객명
                            ,telNo:{type:"string"} //전화번호
                            ,hpNo:{type:"string"} //휴대폰번호
                            ,emailNm:{type:"string"} //이메일주소
                            ,mesgKey:{type:"string", validation:{required:true}}
                            ,mesgTxt:{type:"string", validation:{required:true}}
                            ,errorCount:{type:"string", editable:false}
                            ,errors:{type:"object", editable:false}
                        }
                    }
            }
        }
        ,height:350
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
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        , appendEmptyColumn:true          //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,filterable:false
        ,columns:[
           {field:"errorCount", title:"<spring:message code='global.lbl.errYn' />", width:80
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
           ,{field:"dlrCd", hidden:true}// 딜러코드
           ,{field:"makCd", hidden:true}// 사업장코드
           ,{field:"extrDgreCnt", hidden:true}// 사업장코드
           ,{field:"custExtrTermNo", hidden:true}// 사업장코드
           ,{field:"custNo", title:"<spring:message code='global.lbl.custNo' />", width:100}// 고객번호
           ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100}// 고객명
           ,{field:"telNo", hidden:true}// 전화번호
           ,{field:"hpNo", title:"<spring:message code='global.lbl.cellphone' />", width:100}// 휴대폰
           ,{field:"emailNm", title:"<spring:message code='global.lbl.emailNm' />", width:100}// 이메일
           ,{field:"wechatId", title:"<spring:message code='global.lbl.cellphone' />", width:100}
           ,{field:"sungNm", title:"<spring:message code='crm.lbl.sung' />", width:100}
           ,{field:"cityNm", title:"<spring:message code='crm.lbl.city' />", width:100}
           ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />", width:100}
           ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />", width:100}
           ,{field:"addrNm", title:"<spring:message code='crm.lbl.addrNm' />", width:100}
           ,{field:"addrDetlCont", title:"<spring:message code='crm.lbl.addrDetlCont' />", width:150}
           ,{field:"sexCd"   , title:"<spring:message code='global.lbl.sex' />", width:40, attributes:{"class":"ac"}             //성별
               ,attributes:{"class":"ac"}
               ,template:function(dataItem){
                   var spanObj = "";
                   if (dataItem.sexCd == 'M') {
                       spanObj = "<span class='icon_male'></span>";
                   } else if (dataItem.sexCd == 'F') {
                       spanObj = "<span class='icon_female'></span>";
                   }
                   return spanObj;
               }
           }
           ,{field:"birthDt"  , title:"<spring:message code='global.lbl.birthday' />", width:100, attributes:{"class":"ac"}}     //생일
           ,{field:"haveCarCnt"   ,title:"<spring:message code='crm.lbl.haveCarCnt' />", width:60, attributes:{"class":"ar"}}   //보유 대수
           ,{field:"carRegNo", title:"<spring:message code='global.lbl.carRegNo' />", width:100}
           ,{field:"carlineCd", title:"<spring:message code='global.lbl.carLine' />", width:100}
           ,{field:"modelCd", title:"<spring:message code='crm.lbl.model' />", width:100}
           ,{field:"mesgKey", title:"<spring:message code='global.lbl.mesgKey' />", width:150}
           ,{field:"mesgTxt", title:"<spring:message code='global.lbl.mesgTxt' />", width:50}
        ]
    });

});
</script>