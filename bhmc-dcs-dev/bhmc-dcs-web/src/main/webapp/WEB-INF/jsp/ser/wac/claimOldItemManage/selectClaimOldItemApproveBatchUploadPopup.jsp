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
            <button id="btnFileUpload" class="btn_s"><spring:message code="global.btn.fileUpload" /></button>
            <button id="btnFileDownload" class="btn_s"><spring:message code="global.btn.templateDownload" /></button>
            <button id="btnSave" class="btn_s"><spring:message code="global.btn.save" /></button>
         </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <form id="uploadForm" name="uploadForm" method="post" enctype="multipart/form-data" action="<c:url value="/ser/wac/claimOldItemManage/insertClaimOldItemApproveBatchUploadFile.do"/>">
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
        <div id="excelGrid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
//그리드 목록 번호
var rowNumber = 0;
var localData = {"data":[], "total":0}

/**
 * 팝업 옵션
 */
var options = parent.claimOldItemBatchUploadPopupWin.options.content.data;

var supportedLangs = [""];
<c:forEach var="obj" items="${supportedLangs}">
supportedLangs.push("${obj}");
</c:forEach>

var baseNames = [""];
<c:forEach var="obj" items="${baseNames}">
baseNames.push("${obj}");
</c:forEach>


//요청상태 Array
var statCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${statCdList}">
  <c:if test='${obj.cmmCd eq "01" or obj.cmmCd eq "02" or obj.cmmCd eq "03"}'>
      statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:if>
</c:forEach>
//요청상태 Map
var statCdMap = dms.data.arrayToMap(statCdList, function(obj){ return obj.cmmCd; });

//브랜드 Array
var brandCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${brandCdList}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//브랜드 Map
var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){ return obj.cmmCd; });

//고품조회조건
var searchList = [];
<c:forEach var="obj" items="${searchList}">
  <c:if test="${obj.remark2 eq 'Y' }" >
      searchList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:if>
</c:forEach>

//고품조회조건 Map
var searchMap = dms.data.arrayToMap(searchList, function(obj){ return obj.cmmCd; });

//고품부품상태
var itemStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${itemStatCdList}">
itemStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고품부품상태 Map
var itemStatCdMap = dms.data.arrayToMap(itemStatCdList, function(obj){ return obj.cmmCd; });

//고품지불방식
var oldItemPaymCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${oldItemPaymCdList}">
oldItemPaymCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고품지불방식 Map
var oldItemPaymCdMap = dms.data.arrayToMap(oldItemPaymCdList, function(obj){ return obj.cmmCd; });

//부서코드 Array
var deptCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${deptCdList}">
deptCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//부서코드 Map
var deptCdMap = dms.data.arrayToMap(deptCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

 // 요청상태
    statCdGrid = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(statCdMap[val] != undefined){
                returnVal =  statCdMap[val].cmmCdNm;
            }
        }
        return returnVal;
    };

     // 요청부서
    deptCdGrid = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(deptCdMap[val] != undefined){
                returnVal =  deptCdMap[val].cmmCdNm;
            }
         }
        return returnVal;
    };

     // 고품조회조건
    setSearchMap = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(searchMap[val] != undefined){
                returnVal =  searchMap[val].cmmCdNm;
            }
         }
        return returnVal;
    };

     // 고품부품상태
    setItemStatCdMap = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(itemStatCdMap[val] != undefined){
                returnVal =  itemStatCdMap[val].cmmCdNm;
            }
         }
        return returnVal;
    };

     // 고품지불방식
    setOldItemPaymCdMap = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(oldItemPaymCdMap[val] != undefined){
                returnVal =  oldItemPaymCdMap[val].cmmCdNm;
            }
         }
        return returnVal;
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
            location.href = "<c:url value='/cmm/sci/selectExcelTemplateDownload.do' />" + "?fileNm=OlditemRequestListUpload.xlsx";
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

            var grid = $("#excelGrid").data("kendoExtGrid");

            var saveData = grid.dataSource.data();

            if(saveData.length == 0) {
                //변경된 정보가 없습니다.
                dms.notification.warning("<spring:message code='global.lbl.file' var='fileMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${fileMsg}' />", "popup");
                return;
            }
             $.ajax({
                 url:"<c:url value='/ser/wac/claimOldItemManage/insertExcelData.do' />",
                 data:JSON.stringify({}),
                 type:'POST',
                 dataType:'json',
                 contentType:'application/json',
                 error:function(jqXHR,status,error) {
                     parent.dms.notification.error(jqXHR.responseJSON.errors);
                 },
                 success:function(jqXHR, textStatus) {

                     //정상적으로 반영 되었습니다.
                     dms.notification.success("<spring:message code='global.info.success'/>");
                 }
                 ,beforeSend:function(xhr){
                     dms.loading.show($("#windows"));
                 }
                 ,complete:function(xhr,status){
                     dms.loading.hide($("#windows"));
                     parent.claimOldItemBatchUploadPopupWin.close();
                 }
             });



        }
    });

    $("#progressSection").excelUpload({
        progressId :"UPLOAD_MESSAGE_SOURCE"
        ,uploadForm :"uploadForm"
//         ,uploadStatusUrl:"<c:url value='/cmm/excelUpload/selectExcelUploadStatus.do' />"
//         ,interval:300
        ,messages:{
            fileUpload:"<spring:message code='global.info.fileUpload.processing' />"
            ,fileUploadComplete:"<spring:message code='global.info.fileUpload.complete' />"
            ,dataExtract:"<spring:message code='global.info.excelUpload.dataExtract.complete' />"
            ,dataExtractComplate:"<spring:message code='global.info.excelUpload.dataExtract.processing' />"
            ,uploadComplete:"<spring:message code='global.info.excelUpload.complete' />"
        }
        ,callback:function(obj){
            $('#excelGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#excelGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemExcelTemp.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", validation:{required:true}, editable:false}
                        ,claimDocNo:{type:"string", editable:false}
                        ,itemCd:{type:"string", editable:false}
                        ,collcQty:{type:"number"}
                        ,claimQty:{type:"number", editable:false}
                    }
                }
            }
        }
        ,dataBinding:function(e){
            /* var grid = e.sender;
            var page = grid.dataSource.page()? this.dataSource.page():1;
            var pageSize = grid.dataSource.pageSize()? this.dataSource.pageSize():0;

            rowNumber = (page-1)*pageSize; */
        }
        ,height:300
        ,autoBind:false
        ,columns:[

             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:80, attributes:{"class":"ac"}}//딜러사
            ,{field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:120 ,attributes:{"class":"al"} }//클레임번호
            ,{field:"statCd", title:"<spring:message code='ser.lbl.OldItemstatNm' />", width:100//상태
                ,attributes:{"class":"ac"}
                ,template:"#=statCdGrid(statCd)#"
            }
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.oitemCd' />", width:100 ,attributes:{"class":"al"} }//부품코드
            ,{field:"claimQty", title:"<spring:message code='ser.lbl.qty' />", width:80 ,attributes:{"class":"ar"} , format:"{0:n0}" }//수량
            ,{field:"collcQty", title:"<spring:message code='ser.lbl.recQty' />", width:80, format:"{0:n0}",attributes:{"class":"ar"}}//회수수량
            ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:100 ,attributes:{"class":"ac"}}//단위
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:180 ,attributes:{"class":"al"} }//VIN
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />", width:100 ,attributes:{"class":"ar"} , format:"{0:n0}" }//주행거리
            ,{field:"reqId", title:"<spring:message code='sal.lbl.requestUsr' />", width:100//요청자
                ,attributes:{"class":"ac"}
            }
            ,{field:"reqDt", title:"<spring:message code='ser.lbl.reqDt' />", width:100//신청일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"reqTelNo", title:"<spring:message code='ser.lbl.olditemReqHp' />", width:100//신청인연락처
                ,attributes:{"class":"al"}
            }
            ,{field:"rcipId", title:"<spring:message code='ser.lbl.rcipNm' />", width:100//수취인
                ,attributes:{"class":"al"}
            }
            ,{field:"rcipTelNo", title:"<spring:message code='ser.lbl.oldItemAcceptHp' />", width:100//접수자연락처
                ,attributes:{"class":"al"}
            }
            ,{field:"rcipAddrNm", title:"<spring:message code='ser.lbl.rcipAddrNm' />", width:100//주소
                ,attributes:{"class":"al"}
            }
            ,{field:"expsCmpNm", title:"<spring:message code='ser.lbl.trsfCmpCd' />", width:100//택배회사
                ,attributes:{"class":"al"}
            }
            ,{field:"reqDeptCd", title:"<spring:message code='ser.lbl.reqDept' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=deptCdGrid(reqDeptCd)#"
            }//요청부서
            ,{field:"expsAmt", title:"<spring:message code='ser.lbl.olditemExpsAmt' />", width:100 , format:"{0:n2}"  //보가금액
                ,attributes:{"class":"ar"}
            }
            ,{field:"olditemCmpNm", title:"<spring:message code='ser.lbl.olditemRecoveryCmp' />", width:100 ,attributes:{"class":"al"}} //고품회수회사
            ,{field:"warningInfo", title:"<spring:message code='sal.lbl.warInfo' />", width:100 ,attributes:{"class":"al"}} //주위사항
            ,{field:"reqReasonCont", title:"<spring:message code='ser.lbl.recoveryCont' />", width:100 ,attributes:{"class":"al"}} //회수건의
        ]

    });

});
</script>









