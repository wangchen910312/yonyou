<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script src="<c:url value='/resources/js/bxslider/jquery.bxslider.min.js' />"></script>

<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="ru.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="ru.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->

<div id="resizableContainer">
    <!-- 집단 판매신청 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.grpSalesApplication" /></h1> <!-- 집단 판매신청 -->
            <div class="btn_right">
                <%-- <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button> --%>
                <dms:access viewId="VIEW-D-11267" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnCreate" class="btn_m"><spring:message code='global.lbl.registration' /></button>   <!-- 등록 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11266" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
                <button class="btn_m" id="btnMainExcel"><spring:message code="global.btn.excelExport" /></button> <!-- 엑셀다운로드 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per"  role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.applNumber" /></th> <!-- 신청번호 -->
                        <td>
                            <input name="sApplyNo" id="sApplyNo" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                        <td>
                            <input name="sCustNm" id="sCustNm" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.signStatCd" /></th> <!-- 상태 -->
                        <td>
                            <input name="sApproveCd" id="sApproveCd" type="text" >
                        </td>
                        <th scope="row"><spring:message code="global.lbl.fincReqDt" /></th> <!-- 신청일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sApplyDtS" id="sApplyDtS" class="form_datepicker ac">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sApplyDtE" id="sApplyDtE" class="form_datepicker ac">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.confirmDt" /></th> <!-- 심사일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sConfirmDtS" id="sConfirmDtS" class="form_datepicker ac">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sConfirmDtE" id="sConfirmDtE" class="form_datepicker ac">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s" id="btnExcel"><spring:message code="global.btn.excelExport" /></button>       <!-- 엑셀 Export -->
            </div>
        </div>

        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>

        <!-- 집단오더판매 신청 상세 정보 페이지 -->
        <c:import url="/WEB-INF/jsp/sal/svo/groupSalesApplication/selectGroupSalesApplicationDetail.jsp" />
        <!-- 집단오더판매 신청 상세 정보 페이지 -->
    </section>
</div>

<script  type="text/javascript">

var rowspanMap = {};
var strDlrCd = "${strDlrCd}";
var strDlrNm = "${strDlrNm}";
var strOffNm = "${strOffNm}";
var sysDate = "${sysDate}";
var fifteenDayBf = "${fifteenDayBf}";


function fnReSet(){

	//삭제,프린트 비활성화. 상신/저장/차량추가/차량삭제 활성화.
    /* fnDisBtn("btnDel,btnPrint");
    fnActiBtn("btnFix,btnSave,btnVehAdd,btnVehDel"); */

    $("#reqSeq").val("");
    $("#usrId").val("");
    $("#dlrCd").val("");

    $("#custNm").val("");
    $("#prsnId").val("");

    $("#addr").val("");

    $("#hpNo").val("");
    $("#telNo").val("");

    $("#atcDstinCd").data("kendoExtDropDownList").value("");
    $("#approveCd").val("");

    $("#carUseTp").val("");
    $("#prsnDlrCd").val("");
    $("#prsnDlrTelNo").val("");

    setButtonEnable("");

    var grid = $('#grid').data('kendoExtGrid');
    //grid.clearSelection();

    $('#grid2').data('kendoExtGrid').dataSource.data([]);
    $('#grid3').data('kendoExtGrid').dataSource.data([]);

}


$(document).ready(function () {

     $("#detailViewWindow").kendoWindow({
    	 animation:false
         ,draggable:true
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"<spring:message code='sal.lbl.detailSearch' />"                        //상세보기
         ,width:"950px"
         ,height:"635px"
     });


	//버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
            fnReSet();
        }
    });

    $("#btnCreate").kendoButton({ // 등록(하단 초기화)
        enable:true,
        click:function(e){
            fnReSet();
            viewPopup();

            $("#custNm").attr("disabled", false);
            $("#prsnId").attr("disabled", false);
            $("#hpNo").attr("disabled", false);
            $("#telNo").attr("disabled", false);
            $("#addr").attr("disabled", false);
            $("#atcDstinCd").data("kendoExtDropDownList").enable(true);
            $("#carUseTp").attr("disabled", false);
            $("#prsnDlrCd").attr("disabled", false);
            $("#prsnDlrTelNo").attr("disabled", false);

            $("#reqSeq").val(0);

            $("#usrId").val("");
            $("#dlrCd").val(strDlrCd);
            $("#dlrNm").val(strDlrNm);
            $("#dlrArea").val(strOffNm);
            $("#headFileDocId").val("");
            $("#contractFileNm").val("");
            $("#contractFileNo").val(0);
            $("#bussLicenceNm").val("");
            $("#bussLicenceNo").val(0);
            $("#etcFileNm").val("");
            $("#etcFileNo").val(0);
            $("#addFileNm").val("");
            $("#addFileNo").val(0);

            $("#fileSelectContract").show();
            $("#fileSelectBuss").show();
            $("#fileSelectEtc").show();
            $("#fileSelectAdd").hide();

            $("#contractFileDel").hide();
            $("#bussLicenceDel").hide();
            $("#etcFileDel").hide();
            $("#addFileDel").hide();

            $("#contractFile").hide();
            $("#bussLicence").hide();
            $("#etcFile").hide();
            $("#addFile").hide();

            $("#saveAddFile").hide();

            $("#reqQty").text("0");
            $("#reqQty").attr("disabled", true);
            //R19082700486 集团销售申请重复提交车辆问题改善方案 贾明 2019-8-29 start
              $("#applicaNum").val("");
            //R19082700486 集团销售申请重复提交车辆问题改善方案 贾明 2019-8-29 end
        }
    });

    // 상세조회 후 팝업오픈
    viewDetail = function (selectedVal){

         if( dms.string.isNotEmpty(selectedVal) ){
             // 팝업오픈;
             viewPopup();
            $("#dlrNm").val(strDlrNm);
            $("#dlrArea").val(strOffNm);

            dlrCd = selectedVal.dlrCd;
            usrId = selectedVal.usrId;
            reqSeq = selectedVal.reqSeq;

            $("#reqQty").text(selectedVal.reqQty);
            //$("#reqQty").attr("disabled", true);

            //팝업 상세조회
            detailSet(selectedVal);

         } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }
    }

  //팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    viewPopup = function (){
        var win = $("#detailViewWindow").data("kendoWindow");
        //2018-12-12 update by lyy 集团销售申请/集团销售审批 在第一个单子里面输入的查询条件，关闭之后再打开第二个的时候，查询条件会一直在 start
	   	 //$("#grid2").find("tr.k-filter-row").find('input').val('');
        $("#grid2").find(".k-i-close").click();
	   	//2018-12-12 update by lyy 集团销售申请/集团销售审批 在第一个单子里面输入的查询条件，关闭之后再打开第二个的时候，查询条件会一直在 end
        win.center();
        win.open();
    }


    /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/
    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {

         var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select());

         if ( dms.string.isNotEmpty(selectedItem) ){
             viewDetail(selectedItem);
         } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }
    });
    /******************************* 버튼 영역 end **************************************************************/

    //그리드 1번
	$("#grid").kendoExtGrid({
	    gridId:"G-SAL-0721-115208"
       	,dataSource:{
           	transport:{
                 read:{
                     url:"<c:url value='/sal/svo/groupSalesApplication/selectGroupSalesApplication.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         // 신청번호
                         params["sApplyNo"] = $("#sApplyNo").val();
                         // 고객명
                         params["sCustNm"] = $("#sCustNm").val();
                         // 상태
                         params["sApproveCd"] = $("#sApproveCd").val();
                         // 신청일자
                         params["sApplyDtS"] = $("#sApplyDtS").data("kendoExtMaskedDatePicker").value();
                         params["sApplyDtE"] = $("#sApplyDtE").data("kendoExtMaskedDatePicker").value();

                         params["sConfirmDtS"] = $("#sConfirmDtS").data("kendoExtMaskedDatePicker").value();
                         params["sConfirmDtE"] = $("#sConfirmDtE").data("kendoExtMaskedDatePicker").value();



                         // 호출화면타입
                         params["sCallType"] = "req";

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                  model:{
                      id:"applyNo",
                      fields:{
                          dlrCd:{type:"string"}             //딜러코드
                          ,usrId:{type:"string"}            //등록자
                          ,reqSeq:{type:"number"}           //신청일련번호
                          ,applyNo:{type:"string"}          //신청번호
                          ,custNm:{type:"string"}           //고객명
                          ,atcDstinCd:{type:"string"}       //항목
                          ,reqQty:{type:"number"}           //수량
                          ,applyDt:{type:"date"}            //신청일자
                          ,approveCd:{type:"string"}        //상태
                          ,assignQty:{type:"number"}        //배정수량
                          ,evalDt:{type:"date"}        //심사수량
                      }
                 }
             }
        }
        //,height:460
    	,multiSelectWithCheckbox:false
        ,editable   :false
        ,autoBind:false
        ,navigatable:true
        ,selectable:"row"
        ,change:function(e){

            if(this.select().length != 0){
                var selectedVal = this.dataItem(this.select());
                var applyNo = selectedVal.applyNo;

            };
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,appendEmptyColumn:true
        ,columns:[
             {field:"applyNo", title:"<spring:message code='global.lbl.applNumber' />", width:120,attributes:{"class":"ac"}}  // 신청번호
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />",width:300,attributes:{"class":"al"}}        // 고객명
            ,{field:"atcDstinCd", title:"<spring:message code='global.lbl.item' />",width:150,attributes:{"class":"ac"}       // 항목
                ,template:"# if(atcDstinShwoArr[atcDstinCd] != null) { # #= atcDstinShwoArr[atcDstinCd].cmmCdNm# # }#"
            }
            ,{field:"reqQty", title:"<spring:message code='global.lbl.qty' />",width:80,attributes:{"class":"ar"}}           // 수량
            ,{field:"applyDt", title:"<spring:message code='global.lbl.fincReqDt' />",width:120,attributes:{"class":"ac"}     // 신청일자
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }

            ,{field:"evalDt", title:"<spring:message code='sal.lbl.confirmDt' />",width:120,attributes:{"class":"ac"}     // 심사일자
            ,format:"{0:<dms:configValue code='dateFormat' />}"
            }

            ,{field:"approveCd", title:"<spring:message code='global.lbl.signStatCd' />",width:150,attributes:{"class":"ac"}// 상태
                ,template:"# if(approveCdArr[approveCd] != null) { # #= approveCdArr[approveCd].cmmCdNm# # }#"
            }
            ,{field:"dlrCd", hidden:true}        // 딜러코드
            ,{field:"usrId", hidden:true}       // 등록자
            ,{field:"reqSeq", hidden:true}      // 일련번호
        ]
	});

    //버튼 - 엑셀다운로드
    $("#btnExcel").kendoButton({
        click:function(e) {

            dms.ajax.excelExport({
                 "beanName":"groupSalesApplicationService"
                ,"templateFile":"groupSalesApplication.xlsx"
                ,"fileName":"groupSalesApplication.xlsx"
                ,"sApplyNo":$("#sApplyNo").val()
                ,"sCustNm":$("#sCustNm").val()
                ,"sApproveCd":$("#sApproveCd").val()
                ,"sApplyDtS":kendo.toString($("#sApplyDtS").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sApplyDtE":kendo.toString($("#sApplyDtE").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sConfirmDtS":kendo.toString($("#sConfirmDtS").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sConfirmDtE":kendo.toString($("#sConfirmDtE").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sDlrCd":"${strDlrCd}"
            });
        }
    });

    //버튼 - 엑셀다운로드
    $("#btnMainExcel").kendoButton({
        click:function(e) {

            dms.ajax.excelExport({
                 "beanName":"groupSalesApplicationMainService"
                ,"templateFile":"groupSalesApplicationMain.xlsx"
                ,"fileName":"groupSalesApplicationMain.xlsx"
                ,"sApplyNo":$("#sApplyNo").val()
                ,"sCustNm":$("#sCustNm").val()
                ,"sApproveCd":$("#sApproveCd").val()
                ,"sApplyDtS":kendo.toString($("#sApplyDtS").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sApplyDtE":kendo.toString($("#sApplyDtE").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sConfirmDtS":kendo.toString($("#sConfirmDtS").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sConfirmDtE":kendo.toString($("#sConfirmDtE").data("kendoExtMaskedDatePicker").value(), "yyyyMMdd")
                ,"sDlrCd":"${strDlrCd}"
            });
        }
    });

}); //document.ready End

</script>