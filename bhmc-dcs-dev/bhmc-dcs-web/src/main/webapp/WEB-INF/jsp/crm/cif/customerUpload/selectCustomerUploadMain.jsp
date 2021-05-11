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
        <h1 class="title_basic"><spring:message code="crm.menu.customerInfoUpload" /></h1> <!-- 고객정보 업로드 -->
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12518" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_excel" id="btnFileDownload"><spring:message code="global.btn.excelDownload" /></button> <!-- 엑셀다운로드 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12517" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_fileUpload" id="btnFileUpload" ><spring:message code="global.btn.fileUpload" /></button> <!-- 업로드 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12516" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_save" id="btnSave" ><spring:message code="global.btn.save" /></button> <!-- 저장 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12515" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_delete" id="btnDel"><spring:message code='global.btn.rowDel' /></button><!-- 행삭제 -->
        </dms:access>
        </div>
    </div>

    <div class="table_form form_width_50per" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/crm/cif/customerUpload/insertCustomerUploadFile.do"/>">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:18%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.selectFile" /></th>
                    <td>
                        <!-- <input type="file" id="uploadFile" name="uploadFile" class="form_file" /> -->
                        <input type="file" id="uploadFile" name="uploadFile" class="form_file" style="display:none;" onchange="document.getElementById('fileSize').value=this.value"/>
				        <dms:access viewId="VIEW-I-12514" hasPermission="${dms:getPermissionMask('READ')}">
	                        <span class="btn_file" id="btnFileSelect"><spring:message code='global.lbl.FindFile' /></span>  <!-- 파일찾기 -->
				        </dms:access>
                        <span class="span_txt" id="fileSize"></span>                              <!-- 파일Szie -->
                    </td>
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
//var options = parent.membershipCardUploadPopupWin.options.content.data;

/*************************************************************
 *드랍다운 리스트 셋팅
 *************************************************************/
 var sexCdList               = [{"cmmCd":"", "cmmCdNm":""}];
 var mathDocTpList           = [{"cmmCd":"", "cmmCdNm":""}];
 var custHoldTpList          = [{"cmmCd":"", "cmmCdNm":""}];
 var custHoldTpDtlList       = [{"makCd":"", "makNm":""}];
 var prefCommMthCdList       = [{"cmmCd":"", "cmmCdNm":""}];
 var prefContactMthCdList    = [{"cmmCd":"", "cmmCdNm":""}];
 var prefContactTimeCdList   = [{"cmmCd":"", "cmmCdNm":""}];
 var yesDS = [];
 var sexCdListMap = [];
 var mathDocTpMap = [];
 var custHoldTpMap = [];
 var custHoldTpDtlMap = [];
 var prefCommMthCdMap = [];
 var prefContactMthCdMap = [];
 var prefContactTimeCdMap = [];
 var yesMap = [];

 <c:forEach var="obj" items="${sexCdList}">
 sexCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
 sexCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${mathDocTpList}">
 mathDocTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
 mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${custHoldTpList}">
 custHoldTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
 custHoldTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${custHoldTpDtlList}">
 custHoldTpDtlList.push({"cmmCd":"${obj.makCd}" , "cmmCdNm":"${obj.makNm}"});
 custHoldTpDtlMap["${obj.makCd}"] = "${obj.makNm}";
 </c:forEach>

 <c:forEach var="obj" items="${prefCommMthCdList}">
 prefCommMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
 prefCommMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${prefContactMthCdList}">
 prefContactMthCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
 prefContactMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 <c:forEach var="obj" items="${prefContactTimeCdList}">
 prefContactTimeCdList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
 prefContactTimeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
 </c:forEach>

 yesDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
 yesDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
 yesMap["Y"] = "<spring:message code='global.lbl.yes' />";
 yesMap["N"] = "<spring:message code='global.lbl.n' />";

$(document).ready(function() {

    //버튼 - 파일업로드
    $("#btnFileDownload").kendoButton({
        click:function(e){
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=CustomerInfo_Tpl_zh.xlsx";
        }
    });

    //버튼 - 파일업로드
    $("#btnFileUpload").kendoButton({
        click:function(e){
            if( dms.string.isEmpty($("#uploadFile").val())) {
                dms.notification.show("<spring:message code='global.lbl.file' var='fileMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fileMsg}' />", "popup");
                return;
            }

            $("#grid").data("kendoExtGrid").dataSource.data([]);
            $("#progressSection").excelUpload("upload");
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

            console.log("Customer Info. File Upload!!");
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
                url:"<c:url value='/crm/cif/customerUpload/multiCustomerUploadFileSave.do' />"
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
            console.log(obj);
            localData = obj;
            $("#fileSize").text(localData.total);
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
                            ,seq:{type:"string"}
                            ,membershipSeq:{type:"string"}
                            ,custNm            :{type:"string", validation:{required:true}} // 고객명
                            ,sexCd             :{type:"string", validation:{required:true}} // 성별
                            ,mathDocTp         :{type:"string", validation:{required:true}} // 신분증유형
                            ,ssnCrnNo          :{type:"string", validation:{required:true}} // 신분증번호
                            ,mngScId           :{type:"string", validation:{required:true}} // 담당고문
                            ,custHoldTp        :{type:"string", validation:{required:true}} // 정보출처
                            ,custHoldTpDtl     :{type:"string", validation:{required:true}} // 캠페인번호
                            ,hpNo              :{type:"string", validation:{required:true}} // 휴대전화
                            ,telNo             :{type:"string", validation:{required:true}} // 집전화
                            ,officeTelNo       :{type:"string", validation:{required:true}} // 회사전화
                            ,officeFaxNo       :{type:"string", validation:{required:true}} // FAX
                            ,emailNm           :{type:"string", validation:{required:true}} // 이메일
                            ,wechatId          :{type:"string", validation:{required:true}} // WechatID
                            ,qqId              :{type:"string", validation:{required:true}} // QQ ID
                            ,prefCommMthCd     :{type:"string", validation:{required:true}} // 선호연락방법
                            ,prefCommNo        :{type:"string", validation:{required:true}} // 선호연락처
                            ,prefContactMthCd  :{type:"string", validation:{required:true}} // 우선연락방식
                            ,prefContactTimeCd :{type:"string", validation:{required:true}} // 우선연락시간
                            ,zipCd             :{type:"string", validation:{required:true}} // 우편번호
                            ,addrDetlCont      :{type:"string", validation:{required:true}} // 상세주소
                            ,smsReceiveYn      :{type:"string", validation:{required:true}} // 휴대전화(수신거부)
                            ,telReceiveYn      :{type:"string", validation:{required:true}} // 집전화(수신거부)
                            ,dmReceiveYn       :{type:"string", validation:{required:true}} // 우편물(수신거부)
                            ,emailReceiveYn    :{type:"string", validation:{required:true}} // E-mail(수실거부)
                            ,faxReceiveYn      :{type:"string", validation:{required:true}} // FAX(수신거부)
                            ,perInfoAgreeYn    :{type:"string", validation:{required:true}} // 정보활용동의서 동의함
                            ,perInfoUseYn      :{type:"string", validation:{required:true}} // 정보사용 동의함
                            //,mesgKey:{type:"string", validation:{required:true}}
                            //,mesgTxt:{type:"string", validation:{required:true}}
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
          /*  {title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
                ,template:"#= ++rowNumber #"
            } */
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
           ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />",  width:130, attributes:{"class":"ac"}}                       // 고객명
           ,{field:"sexCd", title:"<spring:message code='global.lbl.sex' />",  width:130, attributes:{"class":"ac"}
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:sexCdList
                   });
                }
               ,template:'#if(sexCd !== ""){# #= sexCdListMap[sexCd]# #}#'
           }                           // 성별
           ,{field:"mathDocTp", title:"<spring:message code='global.lbl.mathDocTp' />",  width:130, attributes:{"class":"ac"}
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:mathDocTpList
                   });
                }
               ,template:'#if(mathDocTp !== ""){# #= mathDocTpMap[mathDocTp]# #}#'
           }                 // 신분증유형
           ,{field:"ssnCrnNo", title:"<spring:message code='global.lbl.ssnCrnNo' />",  width:130, attributes:{"class":"ac"}}                   // 신분증번호
           ,{field:"mngScId", title:"<spring:message code='global.lbl.prsnSC' />",  width:130, attributes:{"class":"ac"}}                      // 담당고문
           ,{field:"custHoldTp", title:"<spring:message code='global.lbl.custHoldTp' />",  width:130, attributes:{"class":"ac"}
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:custHoldTpList
                   });
                }
               ,template:'#if(custHoldTp !== ""){# #= custHoldTpMap[custHoldTp]# #}#'
           }               // 정보출처
           ,{field:"custHoldTpDtl", title:"<spring:message code='global.lbl.crNo' />",  width:130, attributes:{"class":"ac"}
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:custHoldTpDtlList
                   });
                }
               ,template:'#if(custHoldTpDtl !== ""){# #= custHoldTpDtlMap[custHoldTpDtl]# #}#'
           }                  // 캠페인번호
           ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />",  width:130, attributes:{"class":"ac"}}                           // 휴대전화
           ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo' />",  width:130, attributes:{"class":"ac"}}                     // 집전화
           ,{field:"officeTelNo", title:"<spring:message code='global.lbl.officeTelNo' />",  width:130, attributes:{"class":"ac"}}             // 회사전화
           ,{field:"officeFaxNo", title:"<spring:message code='global.lbl.fax' />",  width:130, attributes:{"class":"ac"}}                     // FAX
           ,{field:"emailNm", title:"<spring:message code='global.lbl.emailNm' />",  width:130, attributes:{"class":"ac"}}                     // 이메일
           ,{field:"wechatId", title:"<spring:message code='global.lbl.wechatId' />",  width:130, attributes:{"class":"ac"}}                   // WechatID
           ,{field:"qqId", title:"<spring:message code='global.lbl.qq' />",  width:130, attributes:{"class":"ac"}}                             // QQ ID
           ,{field:"prefCommMthCd", title:"<spring:message code='global.lbl.prefCommMthCd' />",  width:130, attributes:{"class":"ac"}
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:prefCommMthCdList
                   });
                }
               ,template:'#if(prefCommMthCd !== ""){# #= prefCommMthCdMap[prefCommMthCd]# #}#'
           }         // 선호연락방법
           ,{field:"prefCommNo", title:"<spring:message code='global.lbl.prefCommNo' />",  width:130, attributes:{"class":"ac"}}               // 선호연락처
           ,{field:"prefContactMthCd", title:"<spring:message code='global.lbl.prefContactMthCd' />",  width:130, attributes:{"class":"ac"}
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:prefContactMthCdList
                   });
                }
               ,template:'#if(prefContactMthCd !== ""){# #= prefContactMthCdMap[prefContactMthCd]# #}#'
           }   // 우선연락방식
           ,{field:"prefContactTimeCd", title:"<spring:message code='global.lbl.prefContactTime' />",  width:130, attributes:{"class":"ac"}
               ,editor:function(container, options){
                   $('<input data-bind="value:' + options.field + '"  />')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:prefContactTimeCdList
                   });
                }
               ,template:'#if(prefContactTimeCd !== ""){# #= prefContactTimeCdMap[prefContactTimeCd]# #}#'
           }   // 우선연락시간
           ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />",  width:130, attributes:{"class":"ac"}}                         // 우편번호
           ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />",  width:130, attributes:{"class":"ac"}}               // 상세주소
           ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />",  width:130, attributes:{"class":"ac"}}               // 상세주소
           ,{field:"distNm", title:"<spring:message code='global.lbl.distNm' />",  width:130, attributes:{"class":"ac"}}               // 상세주소
           ,{field:"addrDetlCont", title:"<spring:message code='global.lbl.detlAddr' />",  width:130, attributes:{"class":"ac"}}               // 상세주소
           ,{field:"smsReceiveYn", title:"<spring:message code='global.lbl.hpNoRejectRecv' />",  width:130, attributes:{"class":"ac"}}         // 휴대전화(수신거부)
           ,{field:"telReceiveYn", title:"<spring:message code='global.lbl.homeTelNoRejectRecv' />",  width:130, attributes:{"class":"ac"}}    // 집전화(수신거부)
           ,{field:"dmReceiveYn", title:"<spring:message code='global.lbl.dmRejectRecv' />",  width:130, attributes:{"class":"ac"}}            // 우편물(수신거부)
           ,{field:"emailReceiveYn", title:"<spring:message code='global.lbl.emailNmRejectRecv' />",  width:130, attributes:{"class":"ac"}}    // E-mail(수실거부)
           ,{field:"faxReceiveYn", title:"<spring:message code='global.lbl.faxNoRejectRecv' />",  width:130, attributes:{"class":"ac"}}        // FAX(수신거부)
           ,{field:"perInfoAgreeYn", title:"<spring:message code='global.lbl.infoAgreedocId' />",  width:130, attributes:{"class":"ac"}}       // 정보활용동의서 동의함
           ,{field:"perInfoUseYn", title:"<spring:message code='global.lbl.infoUsrYn' />",  width:130, attributes:{"class":"ac"}}              // 정보사용 동의함
        ]
    });

});
</script>
