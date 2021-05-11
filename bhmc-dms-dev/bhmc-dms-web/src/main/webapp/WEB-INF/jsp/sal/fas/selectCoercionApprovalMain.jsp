<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 강제판매승인 -->
<section class="group">
	<div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.coercionApproval' /></h1>       <!-- 강제판매승인 -->
		<div class="btn_right">
			<button id="btnConfirm" class="btn_m"><spring:message code='global.btn.approval' /></button>    <!-- 승인 -->
			<button id="btnNonConfirm"  class="btn_m"><spring:message code='sal.btn.reject' /></button>     <!-- 거절 -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>     <!-- 조회 -->
		</div>
	</div>
	<div class="table_form form_width_70per">
		<table>
			<caption></caption>
			<colgroup>
				<col style="width:10%;">
				<col style="width:24%;">
				<col style="width:10%;">
				<col style="width:23%;">
				<col style="width:10%;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><spring:message code='global.lbl.approveYn' /></th>      <!-- 승인여부 -->
					<td>
                        <input id="sReqStatCd" class="form_comboBox" />
                    </td>
					<th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>      <!-- 신청일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sRegStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sRegEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
					<th scope="row"><spring:message code='global.lbl.dlrCd' /></th>        <!-- 딜러코드 -->
					<td>
                        <input id="sDlrCd" class="form_input" />
                    </td>
				</tr>
				<tr>
                    <th scope="row"><spring:message code='global.lbl.fceReason' /></th>     <!-- 예외사유 -->
                    <td>
                        <input id="sFceSaleReqReasonCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.approveDt' /></th>      <!-- 승인일자 -->
                    <td class="bor_none">
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sApproveStratDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sApproveEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
				</tr>
				<tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>         <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
					<th scope="row"><spring:message code='global.lbl.vinNo' /></th>        <!-- VIN -->
                    <td>
                        <input id="sVinNo" class="form_input" maxlength="17" />
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
				</tr>
			</tbody>
		</table>
	</div>

    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>

    <section id="fileViewWindow" class="pop_wrap">
        <div class="table_grid mt10">
            <div id="fileGrid"></div>
        </div>
        <!-- 파일업로드 -->
    </section>
</section>
<!-- //강제판매승인 -->


<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);
var fileDocNo;

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

var toDay = "${toDay}";         //현재일자
var oneDay = "${oneDay}";       // 해당월 1일

//예외처리 사유 SAL153:FCE_SALE_REQ_REASON_CD
var reqReasonDSList = [];
var reqReasonObj = {};
<c:forEach var="obj" items="${reqReasonDS}">
    reqReasonDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    reqReasonObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//승인여부 SAL154
var approveDSList = [];
var approveCdObj = {};
<c:forEach var="obj" items="${approveDS}">
    approveDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    approveCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnConfirm").kendoButton({ // 승인
        enable:true,
        click:function(e){
            confirm('Y');
        }
    });

    $("#btnNonConfirm").kendoButton({ // 삭제:불승인
        enable:true,
        click:function(e){
            confirm('N');
        }
    });

    // 승인 , 불승인
    confirm = function(appr){
        var vo = [], param = {}, saveUrl = "", isReqStatCd = "";
        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();


        rows.each(function(index, row) {
            var row = grid.dataItem(row);

            if( dms.string.strNvl(row.reqStatCd) != "R"){
                isReqStatCd = dms.string.strNvl(row.reqStatCd);
            }

            vo.push({dlrCd:row.dlrCd, vinNo:row.vinNo, vinNo1:row.vinNo1, vinNo2:row.vinNo2, seq:row.seq});
        });

        if(dms.string.isNotEmpty(isReqStatCd)){
            // [불승인 or 승인] 처리 건이 존재합니다.
            dms.notification.warning("["+approveCdObj[isReqStatCd]+"] <spring:message code='sal.info.CoercionApprovChkMsg' />" );
            return ;
        }

        param = {list:vo};

        if(appr == 'Y'){
            saveUrl = "<c:url value='/sal/fas/coercionApproval/confirms.do' />";
        }else{
            saveUrl = "<c:url value='/sal/fas/coercionApproval/nonConfirms.do' />";
        }

        $.ajax({
            url:saveUrl,
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(jqXHR, textStatus) {
                $("#grid").data("kendoExtGrid").dataSource.read();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    }


    // 승인여부
    $("#sReqStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:approveDSList
       ,optionLabel:" "
       ,index:1
    });

    // 등록일자:시작일
    $("#sRegStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });
    // 등록일자:종료일
    $("#sRegEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 예외사유
    $("#sFceSaleReqReasonCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:reqReasonDSList
       ,optionLabel:" "           //전체
    });

    // 차종
    $("#sCarlineCd").kendoExtDropDownList({
       dataTextField:"carlineNm"
      ,dataValueField:"carlineCd"
      ,dataSource:carLineCdList
      ,optionLabel:" "   // 전체
    });

    // 승인일자:시작일
    $("#sApproveStratDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });
    // 승인일자:종료일
    $("#sApproveEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });


    $("#fileViewWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"查询附件"
        ,width:"700px"
        ,height:"250px"
    }).data("kendoWindow");


    // 메인 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113335"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/fas/coercionApproval/selectCoercionApproval.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        // 승인여부
                        params["sReqStatCd"] = $("#sReqStatCd").data("kendoExtDropDownList").value();
                        // 신청일자
                        params["sRegStartDt"] = $("#sRegStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sRegEndDt"] = $("#sRegEndDt").data("kendoExtMaskedDatePicker").value();
                        //딜러코드
                        params["sDlrCd"] = $("#sDlrCd").val();
                        //예외사유
                        params["sFceSaleReqReasonCd"] = $("#sFceSaleReqReasonCd").data("kendoExtDropDownList").value();
                        //vin
                        //params["sVinNo1"] = $("#sVinNo1").val();
                        //params["sVinNo2"] = $("#sVinNo2").val();
                        params["sVinNo"] = $("#sVinNo").val();

                        //차종
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        //승인일자
                        params["sApproveStratDt"] = $("#sApproveStratDt").data("kendoExtMaskedDatePicker").value();
                        params["sApproveEndDt"] = $("#sApproveEndDt").data("kendoExtMaskedDatePicker").value();

                        console.log('params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"seq",
                    fields:{
                          seq        :{type:"number"}           //일련번호
                        , reqStatCd  :{type:"string"}           //요청상태(승인/불승인 상태 여부)
                        , dlrCd      :{type:"string"}           //딜러코드
                        , dlrNm      :{type:"string"}           //딜러명
                        , reqDt      :{type:"date"}             //신청일자
                        , fceSaleReqReasonCd :{type:"string"}   //예외사유
                        , carlineCd  :{type:"string"}           //차종
                        , carlineNm  :{type:"string"}           //차종명
                        , vinNo      :{type:"string"}           //VIN NO
                        , vinNo1      :{type:"string"}           //VIN NO1
                        , vinNo2      :{type:"string"}           //VIN NO2
                        , rfidNo     :{type:"string"}           //RFID NO
                        , approveYn  :{type:"string"}           //승인여부
                    }
                }
            }
        }
       ,change:function(e) {

           if(this.select().length != 0){
                var selectedVal = this.dataItem(this.select());

                fileDocNo = selectedVal.fileDocNo;

            }
        }
       ,multiSelectWithCheckbox:true
       ,height:480
       ,editable:false
       ,pageable:false
       ,autoBind:false
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[
           {field:"seq", hidden:true}       // 일련번호
          ,{  // 요청상태
              field:"reqStatCd"
             ,title:"<spring:message code='global.lbl.reqStat' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,template:"#=approveCdObj[reqStatCd]#"
          }
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}       // 딜러코드
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:100, attributes:{"class":"ac"}}        // 딜러명
          ,{field:"reqDt", title:"<spring:message code='global.lbl.fincReqDt' />", width:100, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"}        // 신청일자
          ,{  // 예외사유
              field:"fceSaleReqReasonCd"
             ,title:"<spring:message code='global.lbl.fceReason' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,template:"#=reqReasonObj[fceSaleReqReasonCd]#"
          }
          ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd'/>", width:100, attributes:{"class":"ac"}}       // 차종
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm'/>", width:100, attributes:{"class":"al"}}     // 차종명
          ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:100, attributes:{"class":"ac"}}        // vin
          ,{field:"vinNo1", hidden:true}       // vin no1
          ,{field:"vinNo2", hidden:true}       // vin no2
          ,{field:"rfidNo", title:"<spring:message code='global.lbl.rfidNo' />", width:100, attributes:{"class":"al"}}   // RFID No
          ,{_field:"_field",      title:" ",   width:100,  attributes:{"class":"ac"}
              ,template:"<span class='txt_label bg_blue' onClick='fileViewPop()'>查看附件</span>"
           }
          ,{field:"approveYn", hidden:true}
          ,{field:"fileDocNo", hidden:true}

       ]
   });



    // 파일 그리드 시작
    $("#fileGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation == "read") {
                        var params = {};
                        params["sFileDocNo"] = fileDocNo;

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    fields:{
                        fileDocNo:{type:"string"}
                        ,fileNo:{type:"number"}
                        ,fileNm:{type:"string"}
                        ,fileSize:{type:"number"}
                    }
                }
            }
        }
       ,autoBind:false
       ,editable:false
       ,height:200
       //,multiSelectWithCheckbox:true
       ,navigatable:false
       ,pageable:false
       ,resizable:false
       ,sortable:false
       ,filterable:false
       ,columns:[
           {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" ,width:50,attributes:{"class":"al"}}           // 파일명
          ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" ,width:50,attributes:{"class":"al"}}       // 파일크기
          ,{_field:"_field" ,title:"",width:50,attributes:{"class":"ac"}
              ,template:"<span class='txt_label bg_blue'>下载</span>"
           }

       ]
    });
    // 파일 그리드 종료 //

    //그리드 클릭 이벤트.
    $("#fileGrid tbody").on("click", "tr.k-state-selected td", function (e) {
        var row = $(this).closest("tr");
        var colIdx = $("td", row).index(this);

        if(colIdx == 2){
            var fileGrid = $('#fileGrid').data('kendoExtGrid');
            var dataItem = fileGrid.dataItem(fileGrid.select());

            if(dms.string.isNotEmpty(dataItem)){
                dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
            }
        }
    });
});


//팝업 오픈 ( 첨부파일 )
function fileViewPop(){
    $('#fileGrid').data('kendoExtGrid').dataSource.page(1);
    var win = $("#fileViewWindow").data("kendoWindow");
    win.center();
    win.open();
}


</script>
<!-- //script -->