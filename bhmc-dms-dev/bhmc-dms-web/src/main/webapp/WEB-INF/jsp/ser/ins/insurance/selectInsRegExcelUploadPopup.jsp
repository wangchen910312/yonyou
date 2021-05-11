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
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/ser/ins/insurance/insertInsRegExcelUploadFile.do"/>">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:70%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <td>
                        <input type="file" id="uploadFile" name="uploadFile" class="form_file"/>
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
 var options = parent.execelFileUploadPopupWin.options.content.data;


//공통코드:상업보험유형명
var cmcIncTpNmList = [];
<c:forEach var="obj" items="${cmcIncTpNmDs}">
cmcIncTpNmList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var cmcIncTpNmMap = dms.data.arrayToMap(cmcIncTpNmList, function(obj){return obj.cmmCd});

//공통코드:상업보험유형
var cmcIncTpList = [];
<c:forEach var="obj" items="${cmcIncTpDs}">
cmcIncTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var cmcIncTpMap = dms.data.arrayToMap(cmcIncTpList, function(obj){return obj.cmmCd});


$(document).ready(function() {

    setCmcIncTpNmMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
           if(cmcIncTpNmMap[value] != undefined)
            resultVal =  cmcIncTpNmMap[value].cmmCdNm;
        }
        return resultVal;
    };

    setCmcIncTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
           if(cmcIncTpMap[value] != undefined)
            resultVal =  cmcIncTpMap[value].cmmCdNm;
        }
        return resultVal;
    };

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
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=InsRegList_Tpl.xlsx";
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
            }

            $.each(saveData, function(idx, obj){
               delete obj.errors;
               delete obj.errorCount;
            });
            $.ajax({
                url:"<c:url value='/ser/ins/insurance/insertExcelUpload.do' />"
                ,data:JSON.stringify({"insRegList":saveData})
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

                    parent.execelFileUploadPopupWin.close();
                }
            });
       }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_INSURANCE_REGISTER"
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
                        carRegNo:{type:"string", validation:{required:true}}
                        ,vinNo:{type:"string", validation:{required:true}}
                        ,incTotAmt:{type:"number"}
                        ,incStartDt:{type:"date", validation:{required:true}}
                        ,incEndDt:{type:"date", validation:{required:true}}
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
        ,columns:[
                {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="carRegNo" name="carRegNo" maxLength=30 class="form_input" data-name="<spring:message code="ser.lbl.carRegNo" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="carRegNo"></span>')
                       .appendTo(container);
                   }
               }//차량등록번호
               ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:200
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="vinNo" name="vinNo" maxLength=17 class="form_input" data-name="<spring:message code="ser.lbl.vinNo" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="vinNo"></span>')
                       .appendTo(container);
                   }
               }//vinNo
               ,{field:"rincPrsnId", title:"<spring:message code='ser.lbl.insured' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="rincPrsnId" name="rincPrsnId" maxLength=30 class="form_input" data-name="<spring:message code="ser.lbl.insured" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="rincPrsnId"></span>')
                       .appendTo(container);
                   }
               }//피보험자
               ,{field:"incDstinCd", title:"<spring:message code='ser.lbl.incDistin' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="incDstinCd" name="incDstinCd" maxLength=30 class="form_input" data-name="<spring:message code="ser.lbl.incDistin" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="incDstinCd"></span>')
                       .appendTo(container);
                   }
               }//보험구분코드
               ,{field:"incCmpCd", title:"<spring:message code='ser.lbl.incCmpCd' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="incCmpCd" name="incCmpCd" maxLength=30 class="form_input" data-name="<spring:message code="ser.lbl.incCmpCd" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="incCmpCd"></span>')
                       .appendTo(container);
                   }

               }//보험회사코드
               ,{field:"incCmpShtCd", title:"<spring:message code='ser.lbl.incCmpAcronym' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="incCmpShtCd" name="incCmpShtCd" maxLength=30 class="form_input" data-name="<spring:message code="ser.lbl.incCmpAcronym" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="incCmpShtCd"></span>')
                       .appendTo(container);
                   }
               }//보험사약칭
               ,{field:"incTotAmt", title:"<spring:message code='ser.lbl.incTotAmt' />", width:80
                   , attributes :{"class":"ar"}
                   , format:"{0:n0}"
                   , editor:function(container, options){
                       $('<input name="incTotAmt" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n2"                // n0:###,###, n2:###,###.##
                          ,decimals:2                // 소숫점
                          ,min:0.00
                          ,value:0.00
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="incTotAmt"></span>').appendTo(container);
                    }
               }//보험비용총계
               ,{field:"incStartDt", title:"<spring:message code='ser.lbl.incStartDt' />", width:100
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input id="incStartDt" name="incStartDt" data-name="<spring:message code="ser.lbl.incStartDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                          ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                          ,value:""
                       });
                       $('<span class="k-invalid-msg" data-for="incStartDt"></span>').appendTo(container);
                   }
               }//보험시작일
               ,{field:"incEndDt", title:"<spring:message code='ser.lbl.incEndDt' />", width:100
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input id="incEndDt" required name="incEndDt" data-name="<spring:message code="ser.lbl.incEndDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                          ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                          ,value:""
                       });
                       $('<span class="k-invalid-msg" data-for="incEndDt"></span>').appendTo(container);
                   }
               }//보험종료일
               ,{field:"cmcIncTp", title:"<spring:message code='ser.lbl.bizIncTp' />", width:100
                   , attributes :{"class":"ac"}
                   , template:"#= setCmcIncTpMap(cmcIncTp) #"
                   , editor:function(container, options){
                       $('<input required name="cmcIncTp" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,valuePrimitive:true
                           ,dataValueField:"cmmCd"
                           ,dataSource:cmcIncTpList
                       });
                       $('<span class="k-invalid-msg" data-for="cmcIncTp"></span>').appendTo(container);
                    }
               }//상업 보험 유형
               ,{field:"cmcIncNm", title:"<spring:message code='ser.lbl.bizIncTpNm' />", width:150//
                   , attributes :{"class":"ac"}
                   , template:"#= setCmcIncTpNmMap(cmcIncNm) #"
                   , editor:function(container, options){
                       $('<input required name="cmcIncTpNm" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,valuePrimitive:true
                           ,dataValueField:"cmmCd"
                           ,dataSource:cmcIncTpNmList
                       });
                       $('<span class="k-invalid-msg" data-for="cmcIncNm"></span>').appendTo(container);
                    }
               }//상업 보험 유형명
               ,{field:"cmcIncRemark", title:"<spring:message code='ser.lbl.cmcIncRemark' />", width:300
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="cmcIncRemark" name="cmcIncRemark" maxLength=300 class="form_input" data-name="<spring:message code="ser.lbl.cmcIncRemark" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="cmcIncRemark"></span>')
                       .appendTo(container);
                   }
               }
               ,{field:"cmcIncRemark", title:"<spring:message code='ser.lbl.cmcIncRemark' />", width:300
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="cmcIncRemark" name="cmcIncRemark" maxLength=300 class="form_input" data-name="<spring:message code="ser.lbl.cmcIncRemark" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="cmcIncRemark"></span>')
                       .appendTo(container);
                   }
               }
            ,{field:"mesgKey", title:"<spring:message code='global.lbl.mesgKey' />", width:250}
            ,{field:"mesgTxt", title:"<spring:message code='global.lbl.mesgTxt' />", width:350}
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