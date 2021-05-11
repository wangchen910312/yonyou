<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script src="<c:url value='/resources/js/bxslider/jquery.bxslider.min.js' />"></script>

<section id="detailViewWindow" class="pop_wrap" >
    <section class="group">
        <div class="header_area">
            <div class="left_area">
                <span class="txt_label bg_green">${usrId} : Lv${usrEvalGrade}</span>
            </div>
            <div id="btnAll" class="btn_right">
                <dms:access viewId="VIEW-I-12403" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnSave"><spring:message code="global.btn.fix" /></button> <!-- 확정 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12401" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_s" id="btnPrint"><spring:message code="global.btn.print" /></button><!-- 인쇄 -->
                    <button class="btn_s" id="btnDetailExcel"><spring:message code="global.btn.excelExport" /></button> <!-- 엑셀다운로드 -->
                </dms:access>
            </div>
        </div>
        <form id="groupSaleForm">
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                       <%--  <col style="width:18%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:22%;"> --%>
                        <col style="width:12%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:14%;">
                        <col style="width:12%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.dlrCd" /></th> <!-- 딜러코드 -->
                            <td colspan="3">
                                <div class="form_float">
                                    <div class="form_left" style="width:35%;">
                                            <input type="text" id="dlrCd" name="dlrCd" readonly class="form_input form_readonly" data-json-obj="true" >
                                    </div>
                                    <div class="form_right" style="width:65%;">
                                        <input type="text"  id="dlrNm" name="dlrNm" readonly class="form_input form_readonly">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.officeNm" /></th> <!-- 사무소 -->
                            <td colspan="3">
                                <input type="text"  id="dlrArea" name="dlrArea" readonly class="form_input form_readonly">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.repCustNm" /></th> <!-- 대고객명 -->
                            <td colspan="3">
                                <input type="text" maxlength="35" id="custNm" name="custNm" readonly class="form_input form_readonly"  data-bind="value:custNm" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="sal.relAddr" /></th> <!-- 주소 -->
                            <td colspan="3">
                                <input type="text" maxlength="60" id="addr" name="addr" readonly class="form_input form_readonly" data-bind="value:addr" data-json-obj="true">
                            </td>

                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.contactUserNm" /></th> <!-- 연락자 -->
                            <td>
                                <input type="text" maxlength="10" id="prsnId" name="prsnId" readonly class="form_input form_readonly" data-bind="value:prsnId" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.cellphone" /></th> <!-- 핸드폰 -->
                            <td>
                                <input type="number" maxlength="11" data-name="<spring:message code="global.lbl.cellphone" />" id="hpNo" name="hpNo" readonly class="form_input form_readonly" data-bind="value:hpNo" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.telNo" /></th> <!-- 유선번호 -->
                            <td>
                                <input type="number" maxlength="11" data-name="<spring:message code="global.lbl.cellphone" />" id="telNo" name="telNo" readonly class="form_input form_readonly" data-bind="value:telNo" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.item" /></th> <!-- 항목유형 -->
                            <td>
                                <input type="text" id="atcDstinCd" name="atcDstinCd" data-bind="value:atcDstinCd" class="form_comboBox" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.vehicleUse" /></th> <!-- 차량용도 -->
                            <td>
                                <input type="text" maxlength="300" id="carUseTp" name="carUseTp" readonly class="form_input form_readonly" data-bind="value:carUseTp" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.dlrPrsn" /></th> <!-- 딜러항목담당자 -->
                            <td>
                                <input type="text" maxlength="10" id="prsnDlrCd" name="prsnDlrCd" readonly class="form_input form_readonly" data-bind="value:prsnDlrCd" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.telNumer" /></th> <!-- 연락처 -->
                            <td colspan="3">
                                <input type="text" maxlength="12" data-name="<spring:message code="global.lbl.telNumer" />" id="prsnDlrTelNo" name="prsnDlrTelNo" atcDstinCd class="form_input form_readonly" data-bind="value:prsnDlrTelNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.contractDoc" /></th> <!-- 계약문서 -->
                            <td colspan="3">
                                <input id="contractFileNm" name="contractFileNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:contractFileNm">
                                <button type="button" id="contractFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="contractFileNo" name="contractFileNo"  class="form_input" style="width:5%" data-bind="value:contractFileNo" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.bussLicence" /></th> <!-- 사업자등록증 -->
                            <td colspan="3">
                                <input id="bussLicenceNm" name="bussLicenceNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:bussLicenceFileNm" >
                                <button type="button" id="bussLicence" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="bussLicenceNo" name="bussLicenceNo"  class="form_input" style="width:5%" data-bind="value:bussLicenceFileNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.etcFile" /></th> <!-- 기타문서 -->
                            <td colspan="3">
                                <input id="etcFileNm" name="etcFileNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:etcFileNm" >
                                <button type="button" id="etcFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="etcFileNo" name="etcFileNo"  class="form_input" style="width:5%" data-bind="value:etcFileNo" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.addDocument" /></th> <!-- 보충자료 -->
                            <td colspan="3">
                                <input id="addFileNm" name="addFileNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:addFileNm" >
                                <button type="button" id="addFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="addFileNo" name="addFileNo"  class="form_input" style="width:5%" data-bind="value:addFileNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <input type="hidden" id="reqSeq" name="reqSeq" data-bind="value:reqSeq" data-json-obj="true" >
                            <input type="hidden" id="usrId" name="usrId" data-bind="value:usrId" data-json-obj="true" >
                            <input type="hidden" id="headFileDocId" name="headFileDocId" data-bind="value:fileDocId" data-json-obj="true" >
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.evalRslt" /></span></th> <!-- 심사결과 -->
                            <td colspan="3">
                                <label class="label_check"><input id="evalRsltY" name="evalRslt" type="radio" value="Y" checked="checked" class="form_check"> <spring:message code='sal.lbl.approvals' /><!-- 승인--></label>
                                <label class="label_check"><input id="evalRsltN" name="evalRslt" type="radio" value="N" class="form_check"> <spring:message code='sal.btn.reject' /><!-- 불승인--></label>
                                <input type="hidden" id="evalRsltYn" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.evalRemark" /></th> <!-- 심사평가 -->
                            <td colspan="3">
                                <input id="remark" name="remark" type="text" value="" class="form_input">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
        <div class="txt_total" >
            <p><spring:message code='global.lbl.applyQty' />&nbsp;:&nbsp;<span id="reqQty" name="reqQty">0</span></p>     <!-- 건수:-->
        </div>
        <div class="table_grid mt10">
            <div id="grid2"></div>
        </div>
        <div class="table_grid mt10">
            <div id="grid3"></div>
        </div>
    </section>

    <section id="fileViewWindow" class="pop_wrap">
        <div class="table_grid mt10">
            <div id="fileGrid"></div>
        </div>
        <!-- 파일업로드 -->
        <input type="hidden" id="fileDocNo" />
    </section>

    <section id="imageViewWindow" class="pop_wrap" >
        <div class='imgSlider_wrap' >
            <div class='imgSlider_scrollbox' id="fileHtml">
            </div>
        </div>
    </section>
</section>


<script type="text/javascript">




//파일 첨부여부
var filUseYnList = [];
<c:forEach var="obj" items="${fileUseYn}">
   if( "${obj.useYn}" == "Y"){
       filUseYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
   }
</c:forEach>
var filUseYnArr = dms.data.arrayToMap(filUseYnList, function(obj){return obj.cmmCd});


$(document).ready(function () {



  //심사결과:승인
    $("#evalRsltY").click(function(){

        $("#evalRsltYn").val("Y");
        //$("#applyStartDt").data("kendoExtMaskedDatePicker").enable(true);
        //$("#applyEndDt").data("kendoExtMaskedDatePicker").enable(true);
    });
    // 심사결과:불승인
    $("#evalRsltN").click(function(){
        $("#evalRsltYn").val("N");

    });

    //파일 첨부여부
    setFileUseYn = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(filUseYnArr[val] != undefined)
            returnVal = filUseYnArr[val].cmmCdNm;
        }else{
            returnVal = filUseYnArr["N"].cmmCdNm;
        }
        return returnVal;
    };


    //버튼 - 확정
    $("#btnSave").kendoButton({
        click:function(e) {

            var data = {};
            var approveCd ;
            var remark ;
            var sendFlag;
            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            //($('input[name="reqStatCd"]:checked').val() == "02") ? '06' : '07'; //상태
            var evalRslt = $('input[name="evalRslt"]:checked').val();
            console.log("evalRslt:"+evalRslt);


          //단일심사
            if(detailPopOpenYn == "Y"){
                //심사결과 선택 (승인 / 거절)
                if(dms.string.isEmpty($("#evalRsltYn").val())){
                    dms.notification.warning("请选择审批结果");
                    return false;
                }
                if(evalRslt  == 'Y'){
                    if(selectedItem.evalGradeCd == usrEvalGrade){
                        approveCd = 'C';
                    }else{
                        approveCd = 'B';
                    }
                }else if(evalRslt == 'N'){

                    if(dms.string.isEmpty($("#remark").val())){

                        dms.notification.warning("<spring:message code='global.lbl.evalRemark' var='evalRemark' /><spring:message code='global.info.validation.required' arguments='${evalRemark}'/>");
                        $("#remark").focus();
                        return;
                    }
                    approveCd = 'D';
                }
                remark = $("#remark").val();
                sendFlag = "ROW";
            }
            //일괄심사
            else if(evalPopOpenYn == "Y") {
                $(".grid-checkbox-item").each( function(index , obj){
                    var dataItem = grid.dataSource._data;
                    if( $(obj).hasClass("k-state-selected")){
                        var evalYn = dataItem[index].evalYn;
                        //미심사 대상만 담음.
                        if(evalYn == "02"){
                            if($("#popupEvalRsltYn").val() == 'Y'){
                                if(dataItem[index].evalGradeCd == usrEvalGrade){
                                    approveCd = 'C';
                                }else{
                                    approveCd = 'B';
                                }
                            }else if($("#popupEvalRsltYn").val() == 'N'){
                                approveCd = 'D';
                            }
                        }
                    }
                });
                remark = $("#popupRemark").val();
                sendFlag = "MULTI";
            }

            data = {
                    approveCd    : approveCd
                   ,remark       : remark
                   ,sendFlag     : sendFlag
            };
            dms.window.confirm({
                message:"<spring:message code='global.btn.save' var='save' /><spring:message code='global.info.cnfrmMsg' arguments='${save}' />"
                ,title :"<spring:message code='global.btn.save' />"
                ,callback:function(result){
                    if(result){
                      saveGropData(data);
                    }else{
                        return false;
                    }
                }
            });
        }

    });

    //데이터 저장
    saveGropData = function(data){

        var grid = $("#grid").data("kendoExtGrid");
        var rows = grid.select();
        var arrSave = [];

        if(data.sendFlag == "MULTI"){ //일괄심사

            $(".grid-checkbox-item").each( function(index , obj){
                var dataItem = grid.dataSource._data;
                if( $(obj).hasClass("k-state-selected")){
                    var evalYn = dataItem[index].evalYn;
                    //미심사 대상만 담음.
                    if(evalYn == "02"){
                        arrSave.push(dataItem[index]);
                    }
                }
            });
        }else{
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);
                arrSave.push(dataItem);
            });
        }

        var saveData = {
                "updateList"   :arrSave
                ,"approveCd"   :data.approveCd
                ,"remark"      :data.remark
                ,"usrEvalGrade":usrEvalGrade};

        dms.loading.show();
        $.ajax({
            url:"<c:url value='/sal/svi/groupSalesReview/saveGroupSalesReview.do' />",
            data:JSON.stringify(saveData),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.loading.hide();
                //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(jqXHR, textStatus){
                dms.loading.hide();
                fnReSet();

                grid.dataSource._destroyed = [];
                grid.dataSource.page(1);

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
                if(detailPopOpenYn == "Y"){
                    $("#detailViewWindow").data("kendoWindow").close();
                }else if(evalPopOpenYn == "Y"){
                    $("#evalPopupWindow").data("kendoWindow").close();
                }
            }
        });
    };

    //버튼 - 엑셀다운로드
    $("#btnDetailExcel").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"groupSalesReviewService"
               // ,"templateFile":"GroupSalesReview_Tpl.xlsx"
                ,"templateFile":"GroupSalesApplicationDetail_Tpl.xlsx"
                ,"fileName":"groupSalesDetail.xlsx"
                ,"sDlrCd":$("#dlrCd").val()
                ,"sUsrId":$("#usrId").val()
                ,"sReqSeq":$("#reqSeq").val()
                ,"sListType":"DETAIL"
            });
        }
    });


    //팝업 오픈 ( 이미지 미리보기 )
    imageViewPopMulti = function(reqSeq){

        var win = $("#imageViewWindow").data("kendoWindow");
        var grid = $("#grid2").data("kendoExtGrid");

        $("#fileHtml").html("");
        if(dms.string.isEmpty(reqSeq)){
            dms.notification.warning("无预览图片");
            return ;
        }else {
           //파일정보 가져오기.
             var paramVal = "";
             $.each( grid.dataSource._data , function(idx , obj){

                 if( obj.fileDocId != undefined){
                     if(idx == 0){
                         paramVal = obj.fileDocId;
                     }else{
                         paramVal += ","+obj.fileDocId;
                     }
                 }
             });
             param = { sFileDocId:paramVal} ;

            $.ajax({
                //url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />",
                url:"<c:url value='/sal/svi/groupSalesReview/selectGroupSalesFile.do' />",
                data:JSON.stringify(param),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            }).done(function(result) {
                var content = "";
                var fileUrl = "";
                if(result.total != 0){
                    for(i=0;i<result.total;i++){
                        fileUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />?fileDocNo="+result.data[i].fileDocNo+"&fileNo="+result.data[i].fileNo+"&inline=true";
                        content += "<li>";
                        content += "<img src=\'"+fileUrl+"\' width='90%' height='90%' >";
                        content += "</li>";
                    }
                    $("#fileHtml").html("<ul class='img_slider'>" + content + "</ul>");

                    //img_slider
                    var imgSlider = $("ul.img_slider").bxSlider({
                        pager:false,
                        infiniteLoop:false,
                        hideControlOnEnd:true
                    });

                    var sliderSize = $("ul.img_slider>li").size();
                    if(sliderSize < 2){
                        $(".bx-controls-direction .bx-prev, .bx-controls-direction .bx-next").addClass("disabled");
                    }else{
                        $(".bx-controls-direction .bx-prev").addClass("disabled");
                    }

                    win.center();
                    win.open();
                }else{

                    $("#fileHtml").html("");
                    dms.notification.warning("<spring:message code='sal.info.notFileNo' />");

                }
            });
        }
    }

    //팝업 오픈 단건 이미지  ( 이미지 미리보기 )
    imageViewPop = function(fileDocId){

         var win = $("#imageViewWindow").data("kendoWindow");

         $("#fileHtml").html("");
         var grid = $("#grid2").data("kendoExtGrid");
         var selectedItem = grid.dataItem(grid.select());
         var param = {};
         if(fileDocId == "" || fileDocId == "null"){
             dms.notification.warning("<spring:message code='sal.info.notFileNo' />");
         }else {
             //파일정보 가져오기.
             $.ajax({
                 url:"<c:url value='/sal/svi/groupSalesReview/selectGroupSalesFile.do' />",
                 data:JSON.stringify({sFileDocId:fileDocId}),
                 type:"POST",
                 dataType:"json",
                 contentType:"application/json",
                 error:function(jqXHR,status,error){
                     dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                 }
             }).done(function(result) {
                 var content = "";
                 var fileUrl = "";
                 if(result.total != 0){
                     for(i=0;i<result.total;i++){//_contextPath+
                         fileUrl = "<c:url value='/cmm/sci/fileUpload/selectFileDownload.do' />?fileDocNo="+result.data[i].fileDocNo+"&fileNo="+result.data[i].fileNo+"&inline=true";
                         content += "<li>";
                         content += "<span class='txt_label bg_blue' style='cursor:pointer' onClick='dms.fileManager.download(\""+result.data[i].fileDocNo+"\", \""+result.data[i].fileNo+"\")' ><spring:message code='global.btn.download' /></span>";
                         content += "<img src=\'"+fileUrl+"\' >";
                         content += "</li>";
                     }
                     $("#fileHtml").html("<ul class='img_slider'>" + content + "</ul>");

                     //img_slider
                     var imgSlider = $("ul.img_slider").bxSlider({
                         pager:false,
                         infiniteLoop:false,
                         hideControlOnEnd:true
                     });

                     var sliderSize = $("ul.img_slider>li").size();
                     if(sliderSize < 2){
                         $(".bx-controls-direction .bx-prev, .bx-controls-direction .bx-next").addClass("disabled");
                     }else{
                         $(".bx-controls-direction .bx-prev").addClass("disabled");
                     }

                     win.center();
                     win.open();

                 }else{
                     $("#fileHtml").html("");
                     dms.notification.warning("<spring:message code='sal.info.notFileNo' />");
                 }

             });
             /*
             win.center();
             win.open();
             */
         }
    }

    //팝업 오픈 ( 첨부파일 )
    fileViewPop = function (fileDocNo){
/*
        var win = $("#fileViewWindow").data("kendoWindow");
        win.center();
        win.open(); */

        $("#fileDocNo").val("");
        $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
        if(fileDocNo != undefined){
            $("#fileDocNo").val(fileDocNo);
            $("#fileGrid").data("kendoExtGrid").dataSource.page(1);
        }
        var win = $("#fileViewWindow").data("kendoWindow");
        win.center();
        win.open();

    }

     // 파일 그리드 종료 //
    fileDownload = function(btnId){
        var fileDocNo = $("#headFileDocId").val();
        var fileNo = "";

        if(btnId == "contractFile"){//계약문서
            fileNo = $("#contractFileNo").val();
        }else if(btnId == "bussLicence"){//사업자등록증
            fileNo = $("#bussLicenceNo").val();
        }else if(btnId == "etcFile"){//기타
            fileNo = $("#etcFileNo").val();
        }else if(btnId == "addFile"){//보충자료
            fileNo = $("#addFileNo").val();
        }

        if(fileDocNo == "" || (fileDocNo != "" && fileNo == 0)){
            //TODO[판매] 다국어 처리 필요
            dms.notification.warning("没有添加的文件");
            return;
        }

        dms.fileManager.download(fileDocNo, fileNo);
    }

    //그리드 클릭 이벤트.
    $("#fileGrid tbody").on("click", "tr.k-state-selected td", function (e) {
        var row = $(this).closest("tr");
        var colIdx = $("td", row).index(this);

        if(colIdx == 3){
            var fileGrid = $('#fileGrid').data('kendoExtGrid');
            var dataItem = fileGrid.dataItem(fileGrid.select());

            if(dms.string.isNotEmpty(dataItem)){
                dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
            }
        }
    });


    detailInfo = function(detailData){
		 //2018-11-12 update by weiyingjie 集团销售申请/集团销售审批 在第一个单子里面输入的查询条件，关闭之后再打开第二个的时候，查询条件会一直在 start
    	 $("#grid2").find("tr.k-filter-row").find('input').val('');
    	  //2018-11-12 update by weiyingjie 集团销售申请/集团销售审批 在第一个单子里面输入的查询条件，关闭之后再打开第二个的时候，查询条件会一直在 start
        if( detailData != null ){
            $("#reqSeq").val(detailData.reqSeq);
            $("#usrId").val(detailData.usrId);
            $("#dlrCd").val(detailData.dlrCd);

            $("#dlrNm").val(detailData.dlrNm);
            $("#dlrArea").val(detailData.officeNm);

            $("#custNm").val(detailData.custNm);
            $("#prsnId").val(detailData.prsnId);
            $("#zipCd").val(detailData.zipCd);

            $("#addr").val(detailData.addr);
            $("#hpNo").val(detailData.hpNo);
            $("#telNo").val(detailData.telNo);
            $("#faxNo").val(detailData.faxNo);

            $("#atcDstinCd").data('kendoExtDropDownList').value(detailData.atcDstinCd);
            $("#atcCont").val(detailData.atcCont);

            $("#carUseTp").val(detailData.carUseTp);
            $("#prsnDlrCd").val(detailData.prsnDlrCd);
            $("#prsnDlrTelNo").val(detailData.prsnDlrTelNo);

            $("#retlAmt").val(detailData.retlAmt);

            $("#contractFileNm").val(detailData.contractFileNm);
            $("#bussLicenceNm").val(detailData.bussLicenceFileNm);
            $("#etcFileNm").val(detailData.etcFileNm);
            $("#addFileNm").val(detailData.addFileNm);
            $("#contractFileNo").val(detailData.contractFileNo);
            $("#bussLicenceNo").val(detailData.bussLicenceFileNo);
            $("#etcFileNo").val(detailData.etcFileNo);
            $("#addFileNo").val(detailData.addFileNo);

            fileDocId = detailData.fileDocId;
            $("#headFileDocId").val(fileDocId);


            //계약문서
            if($("#contractFileNm").val() != ""){
                $("#contractFile").removeClass("form_disabled");
                $("#contractFile").prop("disabled","");
             }else {
                $("#contractFile").addClass("form_disabled");
                $("#contractFile").prop("disabled","disabled");
             }

            //사업자등록증
            if($("#bussLicenceNm").val()  != ""){
                $("#bussLicence").removeClass("form_disabled");
                $("#bussLicence").prop("disabled","");
             }else {
                $("#bussLicence").addClass("form_disabled");
                $("#bussLicence").prop("disabled","disabled");
             }


            //기타자료
            if($("#etcFileNm").val() != ""){
                $("#etcFile").removeClass("form_disabled");
                $("#etcFile").prop("disabled","");
             }else {
                $("#etcFile").addClass("form_disabled");
                $("#etcFile").prop("disabled","disabled");
             }

            //보충자료
            if($("#addFileNm").val() != "" ){
                $("#addFile").removeClass("form_disabled");
                $("#addFile").prop("disabled","");
             }else {
                $("#addFile").addClass("form_disabled");
                $("#addFile").prop("disabled","disabled");
             }

            $('#grid2').data('kendoExtGrid').dataSource.page(1);
            $('#grid3').data('kendoExtGrid').dataSource.page(1);
        }

    };

   //차종 그리드 설정
    $("#grid2").kendoExtGrid({
        gridId:"G-SAL-0721-115203"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/svi/groupSalesReview/selectDetlVehPop.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#dlrCd").val();
                        params["sUsrId"] = $("#usrId").val();
                        params["sReqSeq"] = $("#reqSeq").val();


                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         dlrCd        :{type:"string"}
                        ,usrId        :{type:"string"}
                        ,reqSeq       :{type:"string"}
                        ,reqLowerSeq  :{type:"string"}
                        ,vinNo        :{type:"string"}
                        ,dlrCd        :{type:"string"}
                        ,carlineNm    :{type:"string"}
                        ,modelNm      :{type:"string"}
                        ,stockVinNo1  :{type:"string"}
                        ,stockVinNo2  :{type:"string"}
                        ,fileDocId    :{type:"string"}
                        ,msPrc        :{type:"number"}
                        ,dcRate       :{type:"number"}
                        ,aamt         :{type:"number"}
                    }
                }
            }
        }
        ,height:220
        ,editable:false
        ,multiSelectWithCheckbox:false
        ,autoBind:false
        ,navigatable:true
        ,pageable:false
        ,indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true         //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,dataBound:function(e){
            var grid = e.sender;
            $("#reqQty").text(grid._data.length);
        }
        ,change:function(e){

            var grid = e.sender;
            var selectRow = this.dataItem(this.select());
            var fileDocId = selectRow.fileDocId;
            reqLowerSeq = selectRow.reqLowerSeq ;

            //$("#fileDocId").val(fileDocId);
            $("#fileDocNo").val(fileDocId);
            $('#fileGrid').data('kendoExtGrid').dataSource.page(1);

        }
        ,columns:[
             {field:"carlineCd",title:"<spring:message code='global.lbl.carlineCd' />", width:80, attributes:{"class":"ac"}}//차종code
            ,{field:"carlineNm",title:"<spring:message code='global.lbl.carlineNm' />",width:120,   attributes:{"class":"al"}}     //차종명
            ,{field:"modelNm",  title:"<spring:message code='global.lbl.modelNm' />",  width:140,  attributes:{"class":"al"}}     //모델명
            ,{field:"ocnCd",title:"<spring:message code='global.lbl.ocnCode' />", width:80, attributes:{"class":"ac"}} //OCNcode
            ,{field:"ocnNm",title:"<spring:message code='global.lbl.ocnNm' />", width:140, attributes:{"class":"ac"}} //OCNdescription
            ,{field:"extColorCd",title:"<spring:message code='global.lbl.extColorCd' />", width:80, attributes:{"class":"ac"}} //외장색code
            ,{field:"extColorNm",title:"<spring:message code='global.lbl.extColorNm' />", width:80, attributes:{"class":"ac"}} //외장색description
            ,{field:"intColorCd",title:"<spring:message code='global.lbl.intColorCd' />", width:80, attributes:{"class":"ac"}} //내장색code
            ,{field:"vinNo",  title:"<spring:message code='sal.lbl.carVinNo' />", width:150,  attributes:{"class":"ac"}}       //Vin NO
            ,{field:"msPrc",  title:"<spring:message code='sal.lbl.carRetlAmt' />" ,width:100   ,attributes:{"class":"ar"}  ,format:"{0:n2}"} //지도가
            ,{field:"dcRate",title:"<spring:message code='sal.lbl.saleRate' />", width:100, attributes:{"class":"ar"},format:"{0:n2}"}     //할인율
            ,{field:"aamt",title:"<spring:message code='sal.lbl.receptAmt' />", width:100, attributes:{"class":"ar"},format:"{0:n2}"}     //영수증발행금액
            ,{field:"fileDocId",title:"<spring:message code='global.lbl.file'/>" ,width:80, attributes:{"class":"ac"}
                ,template: function(dataItem){
                    console.log(dataItem)
                    var objResult = "";
                    if( dataItem.approveCd == "B" || dataItem.approveCd == "C"){
                        objResult = "<span class='txt_label bg_blue' ><spring:message code='ser.lbl.file'/></span>"; //파일추가
                    }else if(dms.string.isEmpty(dataItem.fileDocId)){
                        objResult = "<span class='txt_label bg_blue' onClick='fileViewPop()'><spring:message code='ser.lbl.file'/></span>"; //파일추가
                    }else{
                        objResult = "<span class='txt_label bg_blue' style='cursor:hand' onClick='fileViewPop(\""+dataItem.fileDocId+"\")'><spring:message code='ser.lbl.file'/></span>";
                    }
                     return objResult;
                }
            }//첨부파일
            ,{field:"fileDocCnt",title:"<spring:message code='sal.lbl.fileCnt'/>" ,width:80, attributes:{"class":"ac"}
                ,template: function(dataItem){
                    var objResult = "";

                    if(dataItem.fileDocCnt > 0 ){
                        objResult = dataItem.fileDocCnt;
                    }else{
                        objResult = "0";
                    }
                     return objResult;
                }
            }//첨부파일
            ,{field:"reqSeq",title:"<spring:message code='global.btn.preview'/>"   ,width:80   ,attributes:{"class":"ac"}
                //,template:"<span class='txt_label bg_green' onClick='imageViewPop(\"#=fileDocId#\")'><spring:message code='global.btn.preview'/></span>"
                ,template:function(dataItem){
                    var objResult = "";
                    if(dms.string.isEmpty(dataItem.reqSeq)){
                        objResult = "<span class='txt_label bg_blue'><spring:message code='global.btn.preview'/></span>"; //파일추가
                    }else{
                        //objResult = "<span class='txt_label bg_blue' onClick='imageViewPop(\""+dataItem.reqSeq+"\")'><spring:message code='global.btn.preview'/></span>";
                        objResult = "<span class='txt_label bg_blue' onClick='imageViewPop(\""+dataItem.fileDocId+"\")'><spring:message code='global.btn.preview'/></span>";
                    }
                    return objResult;
                }
            }//미리보기
            ,{field:"dlrCd", hidden:true}
            ,{field:"usrId", hidden:true}
            ,{field:"reqLowerSeq", hidden:true}
        ]
    });

    //그리드 3번 (심사정보 그리드)
    $("#grid3").kendoExtGrid({
        gridId:"G-SAL-0721-115204"
        ,dataSource:{
            transport:{
                 read:{
                     url:"<c:url value='/sal/svi/groupSalesReview/selectGroupSalesReviewDetJdg.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var grid = $("#grid").data('kendoExtGrid');
                         var selectRow = grid.dataItem(grid.select());

                         var params = {};

                         params["sort"] = options.sort;

                         params["sDlrCd"] = $("#dlrCd").val();
                         params["sUsrId"] = $("#usrId").val();
                         params["sReqSeq"] = $("#reqSeq").val();

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                  model:{
                      id:"reqNo",
                      fields:{
                          reqNo:{type:"number", hidden:true}  //요청번호
                          ,pevalId:{type:"string"}                 //심사담당자
                          ,evalDt:{type:"date"}                 //심사일자
                          ,evalRsltYn:{type:"string"}           //심사결과
                          ,remark:{type:"string"}                 //심사평가
                      }
                 }
             }
        }
        ,height:100  //3line
        ,multiSelectWithCheckbox:false
        ,editable   :false
        ,autoBind:false
        ,navigatable:true
        ,selectable:"row"
        ,pageable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"reqNo", hidden:true}       // 요청번호
            ,{field:"pevalId", title:"<spring:message code='global.lbl.peval' />",width:80,attributes:{"class":"ac"}}  // 심사담당자
            ,{field:"evalDt", title:"<spring:message code='global.lbl.evalDt' />",width:60
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,headerAttributes:{style:"text-align:center;"}
                ,attributes:{"class":"ac"}
            }  // 심사일자
            ,{field:"evalRsltYn", title:"<spring:message code='global.lbl.evalRslt' />",width:55,attributes:{"class":"ac"}}  // 심사결과
            ,{field:"remark", title:"<spring:message code='global.lbl.evalRemark' />",width:50,attributes:{"class":"al"}}  // 심사평가
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
                        params["sFileDocNo"] = $("#fileDocNo").val();

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
      // ,multiSelectWithCheckbox:true
       ,navigatable:false
       ,pageable:false
       ,resizable:false
       ,sortable:false
       ,filterable:false
       ,columns:[
           {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" ,width:50,attributes:{"class":"al"}}     // 파일명
          ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" ,width:50,attributes:{"class":"ar"}  // 파일크기
               ,template:"#= dms.string.formatFileSize(fileSize) #"
           }
          /* ,{title:"",width:50,attributes:{"class":"ac"}
              ,template:"<span class='txt_label bg_blue'>下载</span>"//다운로드
           } */
           ,{title:"",width:50,attributes:{"class":"ac"}
               ,template:"<span class='txt_label bg_blue' onClick='dms.fileManager.download(\"#=fileDocNo#\",\"#=fileNo#\")' >"+'<spring:message code='global.btn.download' />'+"</span>"//다운로드
           }

       ]
    });

});

</script>