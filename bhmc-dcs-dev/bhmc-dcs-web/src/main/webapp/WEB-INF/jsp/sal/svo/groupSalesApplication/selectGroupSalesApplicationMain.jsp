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
                <button id="btnCreate" class="btn_m"><spring:message code='global.lbl.registration' /></button>   <!-- 등록 -->
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per"  role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
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
                                    <input name="sApplyDtS" id="sApplyDtS" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sApplyDtE" id="sApplyDtE" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>


    <section id="detailViewWindow" class="pop_wrap" style="max-height:500px;">
        <section class="group">
            <div class="header_area">
                <div class="btn_right" >
                    <button class="btn_s" id="btnFix"><spring:message code="sal.btn.offer" /></button> <!-- 상신 -->
                    <button class="btn_s" id="btnSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                    <button class="btn_s" id="btnDel"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                    <button class="btn_s" id="btnPrint"><spring:message code="sal.btn.print" /></button> <!-- 출력 -->
                </div>
            </div>
            <form id="groupSalesAppForm" name="groupSalesAppForm" method="POST">
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:18%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col style="width:22%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <input type="hidden" id="reqSeq" name="reqSeq" data-bind="value:reqSeq" data-json-obj="true" >
                            <input type="hidden" id="usrId" name="usrId" data-bind="value:usrId" data-json-obj="true" >
                            <input type="hidden" id="headFileDocId" name="headFileDocId" data-bind="value:fileDocId" data-json-obj="true" >
                            <input type="hidden" id="approveCd" name="approveCd" data-bind="value:approveCd" data-json-obj="true" />
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.dlrCd" /></span></th> <!-- 딜러코드 -->
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
                            <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.officeNm" /></span></th> <!-- 사무소 -->
                            <td>
                                <input type="text"  id="dlrArea" name="dlrArea" readonly class="form_input form_readonly">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.repCustNm" /></span></th> <!-- 대고객명 -->
                            <td colspan="3">
                                <input type="text" maxlength="35" id="custNm" name="custNm" class="form_input"  data-bind="value:custNm" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                        	<th scope="row"><span class="bu_required"><spring:message code="global.lbl.contactUserNm" /></span></th> <!-- 연락자 -->
                            <td>
                                <input type="text" maxlength="10" id="prsnId" name="prsnId" class="form_input" data-bind="value:prsnId" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.cellphone" /></span></th> <!-- 핸드폰 -->
                            <td>
                                <input type="text"  id="hpNo" name="hpNo" class="form_input numberic" data-type="mobile" maxlength="13"  data-bind="value:hpNo" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.officeTelNo" /></span></th> <!-- 유선번호 -->
                            <td>
                                <input type="text"  id="telNo" name="telNo" class="form_input numberic" data-type="tel" maxlength="13"  data-bind="value:telNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.addr" /></span></th> <!-- 주소 -->
                            <td colspan="3">
                                <input type="text" maxlength="60" id="addr" name="addr" class="form_input" data-bind="value:addr" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.item" /></span></th> <!-- 항목유형 -->
                            <td>
                                <!-- <input type="text" id="atcDstinCd" name="atcDstinCd" data-bind="value:atcDstinCd" class="form_comboBox" data-json-obj="true">  -->
                                <input id="atcDstinCd" name="atcDstinCd" class="form_comboBox" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vehicleUse" /></span></th> <!-- 차량용도 -->
                            <td colspan="3">
                                <input type="text" maxlength="300" id="carUseTp" name="carUseTp" class="form_input" data-bind="value:carUseTp" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.dlrUsrNm" /></span></th> <!-- 딜러항목담당자 -->
                            <td>
                                <input type="text" maxlength="10" id="prsnDlrCd" name="prsnDlrCd" class="form_input" data-bind="value:prsnDlrCd" data-json-obj="true">
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.telNumer" /></span></th> <!-- 연락처 -->
                            <td>
                                <input type="text"  id="prsnDlrTelNo" name="prsnDlrTelNo" class="form_input numberic" data-type="tel" maxlength="13"  data-bind="value:prsnDlrTelNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.contractDoc" /></span></th> <!-- 계약문서 -->
                            <td colspan="7">
                                <input id="contractFileNm" name="contractFileNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:contractFileNm">
                                <span class="btn_file" id="fileSelectContract" onclick="fnMoreFileUpload(this.id)" ><spring:message code="global.lbl.FindFile" /></span>  <!-- 파일찾기 -->
                                <button type="button" id="contractFileDel" class="btn_s" onclick="fnFileDel(this.id)"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                                <button type="button" id="contractFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="contractFileNo" name="contractFileNo"  class="form_input" style="width:5%" data-bind="value:contractFileNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.bussLicence" /></span></th> <!-- 사업자등록증 -->
                            <td colspan="7">
                                <input id="bussLicenceNm" name="bussLicenceNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:bussLicenceFileNm" >
                                <span class="btn_file" id="fileSelectBuss" onclick="fnMoreFileUpload(this.id)"><spring:message code="global.lbl.FindFile" /></span> <!-- 파일찾기 -->
                                <button type="button" id="bussLicenceDel" class="btn_s" onclick="fnFileDel(this.id)"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                                <button type="button" id="bussLicence" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="bussLicenceNo" name="bussLicenceNo"  class="form_input" style="width:5%" data-bind="value:bussLicenceFileNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.etcFile" /></th> <!-- 기타문서 -->
                            <td colspan="7">
                                <input id="etcFileNm" name="etcFileNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:etcFileNm" >
                                <span class="btn_file" id="fileSelectEtc" onclick="fnMoreFileUpload(this.id)"><spring:message code="global.lbl.FindFile" /></span> <!-- 파일찾기 -->
                                <button type="button" id="etcFileDel" class="btn_s" onclick="fnFileDel(this.id)"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                                <button type="button" id="etcFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="etcFileNo" name="etcFileNo"  class="form_input" style="width:5%" data-bind="value:etcFileNo" data-json-obj="true">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.addDocument" /></th> <!-- 보충자료 -->
                            <td colspan="7">
                                <input id="addFileNm" name="addFileNm" type="text" readonly class="form_input form_readonly" style="width:73%" data-bind="value:addFileNm" >
                                <span class="btn_file" id="fileSelectAdd" onclick="fnMoreFileUpload(this.id)"><spring:message code="global.lbl.FindFile" /></span> <!-- 파일찾기 -->
                                <button type="button" id="addFileDel" class="btn_s" onclick="fnFileDel(this.id)"><spring:message code="global.btn.del" /></button> <!-- 삭제 -->
                                <button type="button" id="addFile" class="btn_s" onclick="fileDownload(this.id)"><spring:message code="global.btn.download" /></button> <!-- 다운로드 -->
                                <input type="hidden" id="addFileNo" name="addFileNo"  class="form_input" style="width:5%" data-bind="value:addFileNo" data-json-obj="true">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </form>
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.title.carInfo" /></h2><!-- 차량정보 -->
                <div class="btn_right">
                    <button class="btn_s" id="btnVehAdd"><spring:message code="global.btn.rowAdd" /></button> <!-- 행추가 -->
                    <button class="btn_s" id="btnVehDel"><spring:message code="global.btn.rowDel" /></button> <!-- 차량삭제 -->
                </div>
                <!-- <p>Total:<span id="qtyTot">0</span></p> -->
            </div>
            <div class="table_grid">
                <div id="grid2"></div>
            </div>

            <div class="header_area">
                <h2 class="title_basic"><spring:message code="sal.lbl.evalInfo" /></h2><!-- 심사정보 -->
            </div>
            <div class="table_grid mt10">
                <div id="grid3"></div>
            </div>
        </section>



        <section id="fileViewWindow" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right">
                    <span class="btn_file" id="fileSelect" ><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                    <button class="btn_s" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                </div>
            </div>
            <div class="table_grid">
                <div id="fileGrid"></div>
            </div>
            <!-- 파일업로드 -->
            <input type="hidden" id="fileDocNo" />
            <input type="hidden" id="fileDocId" />
        </section>


        <section id="imageViewWindow" class="pop_wrap" >
            <div class='imgSlider_wrap' >
                <div class='imgSlider_scrollbox' id="fileHtml">
                </div>
            </div>
        </section>

    </section>
</section>
</div>



<script  type="text/javascript">

    var rowspanMap = {};
    var strDlrCd = "${strDlrCd}";
    var strDlrNm = "${strDlrNm}";
    var strOffNm = "${strOffNm}";
    var sysDate = "${sysDate}";
    var fifteenDayBf = "${fifteenDayBf}";
    var dlrCd;
    var usrId;
    var reqSeq;
    var fileDocId;
    var searchVehiclePopupWin;              //차량조회 팝업.
    var searchVehPopWin;
    var fileBtn = "";
    var ru;
    var rs;
    var r;

    /************* 상태 SELECT BOX  *******************/
	var approveCdList = [];
    <c:forEach var="obj" items="${approveCdInfo}">
    approveCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var approveCdArr = dms.data.arrayToMap(approveCdList, function(obj){return obj.cmmCd});
    /************* 상태 SELECT BOX  *******************/

    /************* 항목 SELECT BOX  *******************/
    var atcDstinList = [];
    <c:forEach var="obj" items="${atcDstinInfo}">
        if( "${obj.useYn}" == "Y"){
            atcDstinList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
    </c:forEach>
    var atcDstinArr = dms.data.arrayToMap(atcDstinList, function(obj){return obj.cmmCd});
    /************* 항목 SELECT BOX  *******************/


    // 차종
    var carLineCdDSList = [];
    var carLineCdObj = {};
    <c:forEach var="obj" items="${carLineCdInfo}">
        carLineCdDSList.push({carlineNm:"${obj.carlineCdNm}", carlineCd:"${obj.carlineCd}"});
        carLineCdObj["${obj.carlineCd}"] = "${obj.carlineCdNm}";
    </c:forEach>

    // 그리드 모델 콤보 DataSource
    var modelCdDSList = [];
    var modelCdObj = {};

    // 그리드 OCN 콤보 DataSource
    var ocnCdDSList = [];
    var ocnCdObj = {};

    // 그리드 외장색 콤보 DataSource
    var extColorCdDSList = [];
    var extColorCdObj = {};

    // 그리드 내장색 콤보 DataSource
    var intColorCdDSList = [];
    var intColorCdObj = {};

    // 집단판매 차량적용 팝업
    function selectGroupSalesPopupWindow(arrInfo){

        searchVehPopWin = dms.window.popup({
            windowId:"searchVehPopWin"    //차량조회팝업.
            ,title:"申请车辆详细"             //신청차량 상세보기
            ,height:"400px"
            ,width:"750px"
            ,content:{
                url:"<c:url value='/sal/svo/groupSalesApplication/selectDetlVehPopMain.do' />"
                ,data:{
                    "arrInfo":arrInfo
                    ,"type"  :null
                    ,"autoBind":false
                    ,"callbackFunc":function(data){

                    }
                }
            }
        });
    }

    function fnSetGrid2(arrList, iReqQty, strVinNo){
        var grid2 = $("#grid2").data("kendoExtGrid");

        if( strVinNo == "" ){
            grid2.removeRow(grid2.tbody.find("tr:eq(0)"));
        }else{
            var rows = grid2.select();

            rows.each(function(index, row) {
                grid2.removeRow($(this).closest('tr'));
            })
        }

        for(var i = 0; i < arrList.length; i++ ){
            grid2.dataSource.insert(0,
                    {carlineCd:arrList[i].carlineCd
                    ,carlineNm:arrList[i].carlineNm
                    ,modelCd:arrList[i].modelCd
                    ,modelNm:arrList[i].modelNm
                    ,ocnCd:arrList[i].ocnCd
                    ,ocnNm:arrList[i].ocnNm
                    ,extColorCd:arrList[i].extColorCd
                    ,extColorNm:arrList[i].extColorNm
                    ,intColorCd:arrList[i].intColorCd
                    ,intColorNm:arrList[i].intColorNm
                    ,reqQty:iReqQty
                    ,vinNo:arrList[i].vinNo
                    ,enginNo:arrList[i].enginNo});
        }
    }

    function fnChkVehiclePopup(){

        var grid2 = $('#grid2').data('kendoExtGrid');
        var rows = grid2.select();
        var selectedItem = grid2.dataItem(rows);


        var selectVeh = [];
        if (rows.length >= 1){
            var data = {
                    "dlrCd":selectedItem.dlrCd
                    ,"usrId":selectedItem.usrId
                    ,"reqSeq":selectedItem.reqSeq
                    ,"carlineCd":selectedItem.carlineCd
                    ,"modelCd":selectedItem.modelCd
             }

             selectVeh.push(data);
        }

        selectGroupSalesPopupWindow(selectVeh[0]);
    }

    function fnSelectGroupSalesApplicationDetail(dataItem){

    	var approveCd = dataItem.approveCd;


            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/svo/groupSalesApplication/selectGroupSlaesApplicationDetail.do' />"
                ,data:JSON.stringify({"dlrCd":dataItem.dlrCd, "usrId":dataItem.usrId, "reqSeq":dataItem.reqSeq})
                ,async:false
            });

            detailList = responseJson.data;

            if( detailList[0] != null ){
                $("#reqSeq").val(detailList[0].reqSeq);
                $("#usrId").val(detailList[0].usrId);
                $("#dlrCd").val(detailList[0].dlrCd);
                //$("#dlrNm").val(detailList[0].dlrNm);
                //$("#dlrArea").val(detailList[0].dlrArea);

                $("#custNm").val(detailList[0].custNm);
                $("#prsnId").val(detailList[0].prsnId);

                $("#addr").val(detailList[0].addr);

                $("#hpNo").val(detailList[0].hpNo);
                $("#telNo").val(detailList[0].telNo);

                $("#atcDstinCd").data("kendoExtDropDownList").value(detailList[0].atcDstinCd);
                $("#approveCd").val(detailList[0].approveCd);

                $("#carUseTp").val(detailList[0].carUseTp);
                $("#prsnDlrCd").val(detailList[0].prsnDlrCd);
                $("#prsnDlrTelNo").val(detailList[0].prsnDlrTelNo);

                $("#contractFileNm").val(detailList[0].contractFileNm);
                $("#bussLicenceNm").val(detailList[0].bussLicenceFileNm);
                $("#etcFileNm").val(detailList[0].etcFileNm);
                $("#addFileNm").val(detailList[0].addFileNm);
                $("#contractFileNo").val(detailList[0].contractFileNo);
                $("#bussLicenceNo").val(detailList[0].bussLicenceFileNo);
                $("#etcFileNo").val(detailList[0].etcFileNo);
                $("#addFileNo").val(detailList[0].addFileNo);

                //계약문서 파일 있을시
                if($("#contractFileNm").val() != ""){
      		    	if(approveCd == "A"){
      		    		$("#fileSelectContract").hide();			//파일찾기없음.
         		    	$("#contractFileDel").show();					//삭제 보임.
      	    		 }else {
      	    			$("#fileSelectContract").hide();
       		    	    $("#contractFileDel").hide();
      	    		 }

      		    	$("#contractFile").show();					//다운로드 보임.
      	    	 }else {
      	    		 if(approveCd == "A"){
      	    			$("#fileSelectContract").show();
        		    	$("#contractFileDel").hide();
        		    	$("#contractFile").hide();
      	    		 }else {
      	    			$("#fileSelectContract").hide();
       		    	    $("#contractFileDel").hide();
       		    	    $("#contractFile").hide();
      	    		 }
      	    	 }

                //사업자등록증 파일 있을시
                if($("#bussLicenceNm").val()  != ""){
     		    	if(approveCd == "A"){
     		    		$("#fileSelectBuss").hide();			//파일찾기없음.
        		    	 $("#bussLicenceDel").show();					//삭제 보임.
      	    		 }else {
      	    			$("#fileSelectBuss").hide();
       		    	    $("#bussLicenceDel").hide();
      	    		 }

     		    	$("#bussLicence").show();					//다운로드 보임.
      	    	 }else {
      	    		 if(approveCd == "A"){
      	    			$("#fileSelectBuss").show();
      	    		    $("#bussLicenceDel").hide();
      	    		    $("#bussLicence").hide();
       	    		 }else {
       	    			$("#fileSelectBuss").hide();
       	    		    $("#bussLicenceDel").hide();
       	    		    $("#bussLicence").hide();
       	    		 }
      	    	 }

                if($("#etcFileNm").val() != ""){
                	if(approveCd == "A"){
                		$("#fileSelectEtc").hide();			//파일찾기없음.
                	    $("#etcFileDel").show();					//삭제 보임.
                    }else {
      	    			$("#fileSelectEtc").hide();
       		    	    $("#etcFileDel").hide();
      	    		}
                	$("#etcFile").show();					//다운로드 보임.
      	    	 }else {
      	    		if(approveCd == "A"){
      	    			$("#fileSelectEtc").show();
       		    	    $("#etcFileDel").hide();
       		    	    $("#etcFile").hide();
       	    		}else {
       	    			$("#fileSelectEtc").hide();
       		    	    $("#etcFileDel").hide();
       		    	    $("#etcFile").hide();
       	    		}
      	    	 }

                if($("#addFileNm").val() != "" ){
                	if(approveCd == "A"){
                		$("#fileSelectAdd").hide();			//파일찾기없음.
       		    	    $("#addFileDel").hide();					//삭제 보임.
      	    		}else {
      	    			$("#fileSelectAdd").hide();
       		    	    $("#addFileDel").hide();
      	    		}
   		    	    $("#addFile").show();					//다운로드 보임.
      	    	 }else {
      	    		if(approveCd == "A"){
      	    			$("#fileSelectAdd").hide();
       		    	    $("#addFileDel").hide();
       		    	    $("#addFile").hide();
       	    		}else {
       	    			$("#fileSelectAdd").hide();
       		    	    $("#addFileDel").hide();
       		    	    $("#addFile").hide();
       	    		}
      	    	 }

                fileDocId = detailList[0].fileDocId;
                $("#headFileDocId").val(fileDocId);
            }

            $('#grid2').data('kendoExtGrid').dataSource.page(1);
            $('#grid3').data('kendoExtGrid').dataSource.page(1);
    }

    function fnReSet(){

    	//삭제,프린트 비활성화. 상신/저장/차량추가/차량삭제 활성화.
        fnDisBtn("btnDel,btnPrint");
        fnActiBtn("btnFix,btnSave,btnVehAdd,btnVehDel");

        $("#reqSeq").val("");
        $("#usrId").val("");
        $("#dlrCd").val("");
        //$("#dlrNm").val(detailList[0].dlrNm);
        //$("#dlrArea").val(detailList[0].dlrArea);

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

        /* $("input[name='longDcss']").each(function(){
            if( this.value == "Y"){
                this.checked = true;
            }else{
                this.checked = false;
            }
        }); */

        //$("#carAllocHopeDt").data('kendoExtMaskedDatePicker').value("");

        //$("#btnAll").attr("style", "display:none");
        //$("#btnCheck").attr("style", "display:display");

        var grid = $('#grid').data('kendoExtGrid');
        grid.clearSelection();
        //$("#btnVehAdd").data("kendoButton").enable(false);
        //$("#btnVehDel").data("kendoButton").enable(false);


        //$("#btnFix").data("kendoButton").enable(false);
        //$("#btnSave").data("kendoButton").enable(true);
        //$("#btnDel").data("kendoButton").enable(false);
        //$("#btnPrint").data("kendoButton").enable(false);


        $('#grid2').data('kendoExtGrid').dataSource.data([]);
        $('#grid3').data('kendoExtGrid').dataSource.data([]);
    }

    function fnMoreFileUpload(id){
        $("#fileBtn").val(id);
        fileBtn = id;
    }

    function fnDetlGroupHeader(){
        var fileGrid = $('#fileGrid').data('kendoExtGrid');

        if(fileGrid._data.length == 0){
             //집단판매신청 차량정보에(SA_0413T)에 첨부파일 FILE_DOC_ID 삭제 .
            var grid = $('#grid').data('kendoExtGrid');
            var rows = grid.select();
            var item = grid.dataItem(rows);

            var data = {
                "reqSeq":reqSeq
                ,"dlrCd":dlrCd
                ,"usrId":usrId
                ,"reqLowerSeq":item.reqLowerSeq
                ,"fileDocId":""
            };

            $.ajax({
                url:"<c:url value='/sal/svo/groupSalesApplication/updateGroupSalesFile.do' />",
                data:JSON.stringify(data),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(jqXHR, textStatus){
                    $("#fileDocNo").val("");
                    $("#fileDocId").val("");
                    $("#fileViewWindow").data("kendoWindow").close();
                    $('#grid2').data('kendoExtGrid').dataSource.read();
                }
            });
        }
    }

    // 추가 시, vehicleItemList2에  데이터가 존재 유무 체크.
    function isTargetVehicleGrid(vinNo){
        var flag = false;
        var grid2 = $('#grid2').data('kendoExtGrid');
        var rows = grid2.tbody.find("tr");

        rows.each(function(index, row){
            var data = grid2.dataItem(row);

            if(vinNo == data.vinNo){
                flag = true;
            }
        });
        return flag;
    }

    // 상세조회 후 팝업오픈
    function viewDetail(selectedVal){

        if( dms.string.isNotEmpty(selectedVal) ){
            // 팝업오픈;

            viewPopup();

            if(selectedVal.approveCd == 'A' ){//입력
               $("#btnFix").data("kendoButton").enable(true);
               $("#btnSave").data("kendoButton").enable(true);
               $("#btnDel").data("kendoButton").enable(true);
               $("#btnPrint").data("kendoButton").enable(true);

               $("#btnVehAdd").data("kendoButton").enable(true);
               $("#btnVehDel").data("kendoButton").enable(true);
           }else {
               $("#btnFix").data("kendoButton").enable(false);
               $("#btnSave").data("kendoButton").enable(false);
               $("#btnDel").data("kendoButton").enable(false);
               $("#btnPrint").data("kendoButton").enable(true);

               $("#btnVehAdd").data("kendoButton").enable(false);
               $("#btnVehDel").data("kendoButton").enable(false);
           }

           $("#dlrNm").val(strDlrNm);
           $("#dlrArea").val(strOffNm);

           dlrCd = selectedVal.dlrCd;
           usrId = selectedVal.usrId;
           reqSeq = selectedVal.reqSeq;

           fnSelectGroupSalesApplicationDetail(selectedVal);

        } else {
            // {상세정보}을(를) 확인하여 주세요.
            dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        }
    }

    function fileDownload(btnId){

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

    function fnFileDel(btnId){

        if(btnId == "contractFileDel"){//계약문서
            $("#contractFileNm").val("");
            $("#contractFileNo").val(0);

            fnShowBtn("fileSelectContract");
            fnHideBtn("contractFileDel,contractFile");
        }else if(btnId == "bussLicenceDel"){//사업자등록증
            $("#bussLicenceNm").val("");
            $("#bussLicenceNo").val(0);

            fnShowBtn("fileSelectBuss");
            fnHideBtn("bussLicenceDel,bussLicence");
        }else if(btnId == "etcFileDel"){//기타
            $("#etcFileNm").val("");
            $("#etcFileNo").val(0);

            fnShowBtn("fileSelectEtc");
            fnHideBtn("etcFileDel,etcFile");
        }else if(btnId == "addFileDel"){//보충자료
            $("#addFileNm").val("");
            $("#addFileNo").val(0);

            fnShowBtn("fileSelectAdd");
            fnHideBtn("addFileDel,addFile");
        }
    }

    //팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
    function viewPopup(){
        var win = $("#detailViewWindow").data("kendoWindow");
        win.center();
        win.open();
    }

    //팝업 오픈 ( 첨부파일 )
    function fileViewPop(){
        var win = $("#fileViewWindow").data("kendoWindow");
        win.center();
        win.open();
    }

    //팝업 오픈 ( 이미지 미리보기 )
    function imageViewPop(fileDocNo){

       var win = $("#imageViewWindow").data("kendoWindow");
       var grid = $("#grid2").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       if(fileDocNo == "" || fileDocNo == "null"){
           dms.notification.warning("没有添加的文件");
       }else {
           //파일정보 가져오기.
           $.ajax({
               url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />",
               data:JSON.stringify({sFileDocNo:fileDocNo}),
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
               }
           });
           win.center();
           win.open();
       }
   }

   function fnValidationChk(){
       if( $("#dlrCd").val() == "" || $("#dlrCd").val() == null ){
           return;
       }

       //대고객명
       if ( dms.string.isEmpty($("#custNm").val()) ){
           dms.notification.warning("<spring:message code='sal.lbl.repCustNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#custNm").focus();
           return false;
       }

       //주소
       if ( dms.string.isEmpty($("#addr").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.addr' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#addr").focus();
           return false;
       }

       //연락인
       if ( dms.string.isEmpty($("#prsnId").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.contactUserNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#prsnId").focus();
           return false;
       }

       //휴대폰번호
       if ( dms.string.isEmpty($("#hpNo").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.cellphone' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#hpNo").focus();
           return false;
       }

       //유선전화번호
       if ( dms.string.isEmpty($("#telNo").val()) ){
           dms.notification.warning("<spring:message code='sal.lbl.officeTelNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#telNo").focus();
           return false;
       }

       //항목
       if ( dms.string.isEmpty($("#atcDstinCd").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.item' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           //$("#atcDstinCd").data("kendoExtDropDownList").focus();
           return false;
       }

       //차량용도
       if ( dms.string.isEmpty($("#carUseTp").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.vehicleUse' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#carUseTp").focus();
           return false;
       }

       //딜러담당자
       if ( dms.string.isEmpty($("#prsnDlrCd").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.dlrUsrNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#prsnDlrCd").focus();
           return false;
       }

       //연락처
       if ( dms.string.isEmpty($("#prsnDlrTelNo").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.telNumer' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#prsnDlrTelNo").focus();
           return false;
       }

       //계약문서 업로드
       if ( dms.string.isEmpty($("#contractFileNm").val()) ){
           dms.notification.warning("<spring:message code='global.lbl.contractDoc' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#contractFileNm").focus();
           return false;
       }

       //사업자등록증 업로드
       if ( dms.string.isEmpty($("#bussLicenceNm").val()) ){
           dms.notification.warning("<spring:message code='sal.lbl.bussLicence' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
           $("#bussLicenceNm").focus();
           return false;
       }
       return true;
   }

   //버튼 비활성화
   function fnDisBtn(obj){
       var val = obj.split(",");
       $.each(val, function(idx, row){
           var btnId = row;
           $("#"+btnId+"").data("kendoButton").enable(false);
       });
   }

   //버튼 활성화
   function fnActiBtn(obj){
       var val = obj.split(",");
       $.each(val, function(idx, row){
           var btnId = row;
           $("#"+btnId+"").data("kendoButton").enable(true);
       });
   }

   //버튼 숨기기
   function fnHideBtn(obj){
       var val = obj.split(",");
       $.each(val, function(idx, row){
           var btnId = row;
           $("#"+btnId+"").hide();
       });
   }

    //버튼 보이기
    function fnShowBtn(obj){
       var val = obj.split(",");
       $.each(val, function(idx, row){
           var btnId = row;
           $("#"+btnId+"").show();
       });
    }

	$(document).ready(function () {

        /*
         * max 500으로 지정. 여백이 있는경우는 줄여야함
         */
         $("#imageViewWindow").kendoWindow({
             animation:false
             ,draggable:true
             ,modal:false
             ,resizable:false
             ,visible:false
             ,title:"预览"
             ,width:"592px"
             ,close:function(e){
                 $(".bx-controls-direction .bx-prev, .bx-controls-direction .bx-next").hide();
             }
         });


         $("#fileViewWindow").kendoWindow({
             animation:false
             ,draggable:false
             ,modal:true
             ,resizable:false
             ,visible:false
             ,title:"添加文件"
             ,width:"700px"
             ,height:"250px"
         });


         $("#detailViewWindow").kendoWindow({
        	 animation:false
             ,draggable:true
             ,modal:false
             ,resizable:false
             ,visible:false
             ,title:"<spring:message code='sal.lbl.detailSearch' />"                        //상세보기
             ,width:"950px"
             //,height:"635px"
         });


        /**
        * 상태 콤보박스
        */
        $("#sApproveCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:approveCdList
           ,optionLabel:" "  // 전체
        });

        /**
         * 시작 신청일자 (From)
         */
         $("#sApplyDtS").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:fifteenDayBf
         });
         /**
         * 종료 신청일자 (From)
         */
         $("#sApplyDtE").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:sysDate
         });

         /**
          * 배정 희망일자
          */

         /*  $("#carAllocHopeDt").kendoExtMaskedDatePicker({
              format:"<dms:configValue code='dateFormat' />"
              ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         }); */

        /**
         * 항목 콤보박스
         */
         $("#atcDstinCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:atcDstinList
            ,optionLabel:" "  // 전체
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
	        }
	    });

	    //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {

            	if(fnValidationChk()){
            		//신청차량
                    var grid2 = $("#grid2").data("kendoExtGrid");
                    var data = grid2.dataSource.view();
                    var rows = grid2.tbody.find("tr");

                    if(data.length == 0 ){
                        dms.notification.info("<spring:message code='global.lbl.car' var='carInfo' /><spring:message code='global.info.emptyCheckParam' arguments='${carInfo}' />");
                        return;
                    }

                    if(!confirm("<spring:message code='global.lbl.save' var='save' /><spring:message code='global.info.cnfrmMsg' arguments='${save},' />")){
                        return;
                    }

                    var paramData = $("#groupSalesAppForm").serializeObject($("#groupSalesAppForm").serializeArrayInSelector("[data-json-obj='true']"));
                    paramData.submitGubun = "save";
                    var insertVehList = [];

                    rows.each(function(index, row) {
                        dataItem = grid2.dataItem(row);
                        insertVehList.push(dataItem);
                    });

                    // form 데이터 및 그리드 변경 데이터 세팅
                    var saveData = $.extend(
                       {"groupSalesApplicationVO":paramData}
                       ,{"insertGroupSalesApplicationVehList":insertVehList}
                    );

                    $.ajax({
                    	url:"<c:url value='/sal/svo/groupSalesApplication/multiGroupSalesApplication.do' />",
                    	data:JSON.stringify(saveData),
                        type:"POST",
                        dataType:"json",
                        contentType:"application/json",
                        error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    }).done(function(result) {

                    	kendo.bind($("#groupSalesAppForm"), {"groupSalesApplicationVO":[{"dlrCd":"", "drlNm":""}]});

                    	var groupSalesApplicationVO = result["groupSalesApplicationVO"];
                        kendo.bind($("#groupSalesAppForm"), groupSalesApplicationVO);
                        $("#dlrNm").val(strDlrNm);
                        $("#dlrArea").val(strOffNm);
                        $("#atcDstinCd").data("kendoExtDropDownList").value(groupSalesApplicationVO.atcDstinCd);

                        //상신,저장,삭제,프린트,추가,삭제 활성화.
                        var btnId = "btnFix,btnSave,btnDel,btnPrint,btnVehAdd,btnVehDel";
                        fnActiBtn(btnId);

                        //계약문서 파일 있을시
                        if($("#contractFileNm").val() != ""){
              		    	if(groupSalesApplicationVO.approveCd == "A"){
              		    		//파일찾기 숨기기, 삭제 보여짐.
              		    		fnHideBtn("fileSelectContract");
              		    		fnShowBtn("contractFileDel");
              	    		 }else {
              	    			//다운로드 보여짐. 파일찾기/삭제 숨기기.
              	    			fnShowBtn("contractFile");
              	    			fnHideBtn("fileSelectContract,contractFileDel");
              	    		 }

              		    	$("#contractFile").show();					//다운로드 보임.
              	    	}else {
              	    		 if(groupSalesApplicationVO.approveCd == "A"){

              	    			$("#fileSelectContract").show();
                		    	 $("#contractFileDel").hide();
                		    	$("#contractFile").hide();
              	    		 }else {
              	    			$("#fileSelectContract").hide();
               		    	    $("#contractFileDel").hide();
               		    	   $("#contractFile").hide();
              	    		 }
              	    	}

                        //사업자등록증 파일 있을시
                        if($("#bussLicenceNm").val()  != ""){
             		    	if(groupSalesApplicationVO.approveCd == "A"){
             		    		$("#fileSelectBuss").hide();			//파일찾기없음.
                		    	$("#bussLicenceDel").show();					//삭제 보임.
              	    		}else {
              	    			$("#fileSelectBuss").hide();
               		    	    $("#bussLicenceDel").hide();
              	    		}
             		    	$("#bussLicence").show();					//다운로드 보임.
              	    	 }else {
              	    		if(groupSalesApplicationVO.approveCd == "A"){
              	    			$("#fileSelectBuss").show();
              	    		    $("#bussLicenceDel").hide();
              	    		    $("#bussLicence").hide();
               	    		}else {
               	    			$("#fileSelectBuss").hide();
               	    		    $("#bussLicenceDel").hide();
               	    		    $("#bussLicence").hide();
               	    		}
              	    	 }

                        if($("#etcFileNm").val() != ""){
                        	if(groupSalesApplicationVO.approveCd == "A"){
                        		$("#fileSelectEtc").hide();			//파일찾기없음.
                        	    $("#etcFileDel").show();					//삭제 보임.
              	    		 }else {
              	    			$("#fileSelectEtc").hide();
               		    	    $("#etcFileDel").hide();
              	    		 }
                        	$("#etcFile").show();					//다운로드 보임.
              	    	}else {
              	    		if(groupSalesApplicationVO.approveCd == "A"){
              	    			$("#fileSelectEtc").show();
               		    	    $("#etcFileDel").hide();
               		    	    $("#etcFile").hide();
               	    		 }else {
               	    			$("#fileSelectEtc").hide();
               		    	    $("#etcFileDel").hide();
               		    	    $("#etcFile").hide();
               	    		 }
              	    	}

                        if($("#addFileNm").val() != "" ){
                        	if(groupSalesApplicationVO.approveCd == "A"){
                        		$("#fileSelectAdd").hide();			//파일찾기없음.
               		    	    $("#addFileDel").hide();					//삭제 보임.
              	    		 }else {
              	    			$("#fileSelectAdd").hide();
               		    	    $("#addFileDel").hide();
              	    		 }
           		    	    $("#addFile").show();					//다운로드 보임.
              	    	}else {
              	    		if(groupSalesApplicationVO.approveCd == "A"){
              	    			$("#fileSelectAdd").hide();
               		    	    $("#addFileDel").hide();
               		    	    $("#addFile").hide();
               	    		 }else {
               	    			$("#fileSelectAdd").hide();
               		    	    $("#addFileDel").hide();
               		    	    $("#addFile").hide();
               	    		 }
              	    	}

                        var grid = $('#grid').data('kendoExtGrid').dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    });
            	}
            }
        });

        //버튼 - 확정
        $("#btnFix").kendoButton({
            click:function(e) {

				fnValidationChk();

                //신청차량
                var grid2 = $("#grid2").data("kendoExtGrid");
                var data = grid2.dataSource.view();
                var rows = grid2.tbody.find("tr");

                if(data.length == 0 ){
                    dms.notification.info("<spring:message code='global.lbl.car' var='carInfo' /><spring:message code='global.info.emptyCheckParam' arguments='${carInfo}' />");
                    return;
                }

                if(!confirm("<spring:message code='global.btn.fix' var='fix' /><spring:message code='global.info.cnfrmMsg' arguments='${fix},' />")){
                    return;
                }

                var paramData = $("#groupSalesAppForm").serializeObject($("#groupSalesAppForm").serializeArrayInSelector("[data-json-obj='true']"));
                paramData.submitGubun = "fix";
                var insertVehList = [];

                rows.each(function(index, row) {
                    dataItem = grid2.dataItem(row);

                    insertVehList.push(dataItem);
                });

                // form 데이터 및 그리드 변경 데이터 세팅
                var saveData = $.extend(
                   {"groupSalesApplicationVO":paramData}
                   ,{"insertGroupSalesApplicationVehList":insertVehList}
                );

                $.ajax({
                	url:"<c:url value='/sal/svo/groupSalesApplication/multiGroupSalesApplication.do' />",
                	data:JSON.stringify(saveData),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                }).done(function(result) {

                	kendo.bind($("#groupSalesAppForm"), {"groupSalesApplicationVO":[{"dlrCd":"", "drlNm":""}]});

                	var groupSalesApplicationVO = result["groupSalesApplicationVO"];
                    kendo.bind($("#groupSalesAppForm"), groupSalesApplicationVO);
                    $("#dlrNm").val(strDlrNm);
                    $("#dlrArea").val(strOffNm);
                    $("#atcDstinCd").data("kendoExtDropDownList").value(groupSalesApplicationVO.atcDstinCd);

                    //상신,저장,삭제,프린트,추가,삭제 활성화.
                    fnActiBtn("btnPrint");
                    fnDisBtn("btnFix,btnSave,btnDel,btnVehAdd,btnVehDel");

                    //계약문서 파일 있을시
                    if($("#contractFileNm").val() != ""){
          		    	if(groupSalesApplicationVO.approveCd == "A"){
          		    		//파일찾기 숨기기, 삭제 보여짐.
          		    		fnHideBtn("fileSelectContract");
          		    		fnShowBtn("contractFileDel");

          	    		 }else {
          	    			//다운로드 보여짐. 파일찾기/삭제 숨기기.
          	    			fnShowBtn("contractFile");
          		    		fnHideBtn("fileSelectContract,contractFileDel");
          	    		 }

          		    	$("#contractFile").show();					//다운로드 보임.
          	    	}else {
          	    		 if(groupSalesApplicationVO.approveCd == "A"){

          	    			$("#fileSelectContract").show();
            		    	 $("#contractFileDel").hide();
            		    	$("#contractFile").hide();
          	    		 }else {
          	    			$("#fileSelectContract").hide();
           		    	    $("#contractFileDel").hide();
           		    	   $("#contractFile").hide();
          	    		 }
          	    	}

                    //사업자등록증 파일 있을시
                    if($("#bussLicenceNm").val()  != ""){
         		    	if(groupSalesApplicationVO.approveCd == "A"){
         		    		$("#fileSelectBuss").hide();			//파일찾기없음.
            		    	$("#bussLicenceDel").show();					//삭제 보임.
          	    		}else {
          	    			$("#fileSelectBuss").hide();
           		    	    $("#bussLicenceDel").hide();
          	    		}
         		    	$("#bussLicence").show();					//다운로드 보임.
          	    	 }else {
          	    		if(groupSalesApplicationVO.approveCd == "A"){
          	    			$("#fileSelectBuss").show();
           		    	    $("#bussLicenceDel").hide();
           		    	    $("#bussLicence").hide();
           	    		}else {
           	    			$("#fileSelectBuss").hide();
           		    	    $("#bussLicenceDel").hide();
           		    	    $("#bussLicence").hide();
           	    		}
          	    	 }

                    if($("#etcFileNm").val() != ""){
                        if(groupSalesApplicationVO.approveCd == "A"){
                    		$("#fileSelectEtc").hide();			//파일찾기없음.
           		    	    $("#etcFileDel").show();					//삭제 보임.
          	    		}else {
          	    			$("#fileSelectEtc").hide();
           		    	    $("#etcFileDel").hide();
          	    		}
                    	$("#etcFile").show();					//다운로드 보임.
          	    	}else {
          	    		if(groupSalesApplicationVO.approveCd == "A"){
          	    			$("#fileSelectEtc").show();
           		    	    $("#etcFileDel").hide();
           		    	    $("#etcFile").hide();
           	    		}else {
           	    			$("#fileSelectEtc").hide();
           		    	    $("#etcFileDel").hide();
           		    	    $("#etcFile").hide();
           	    		}
          	    	}

                    if($("#addFileNm").val() != "" ){
                        if(groupSalesApplicationVO.approveCd == "A"){
                    		$("#fileSelectAdd").hide();			//파일찾기없음.
           		    	    $("#addFileDel").hide();					//삭제 보임.
          	    		}else {
          	    			$("#fileSelectAdd").hide();
           		    	    $("#addFileDel").hide();
          	    		}
       		    	    $("#addFile").show();					//다운로드 보임.
          	    	}else {
          	    		if(groupSalesApplicationVO.approveCd == "A"){
          	    			$("#fileSelectAdd").hide();
           		    	    $("#addFileDel").hide();
           		    	    $("#addFile").hide();
           	    		 }else {
           	    			$("#fileSelectAdd").hide();
           		    	    $("#addFileDel").hide();
           		    	    $("#addFile").hide();
           	    		 }
          	    	}

                    var grid = $('#grid').data('kendoExtGrid').dataSource.page(1);
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                });

                /* $.ajax({
                	url:"<c:url value='/sal/svo/groupSalesApplication/updateGroupSalesApplicationCnfrm.do' />",
                    data:JSON.stringify(data),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                }).done(function(result) {

                	kendo.bind($("#groupSalesAppForm"), {"groupSalesApplicationVO":[{"dlrCd":"", "drlNm":""}]});

                	var groupSalesApplicationVO = result["groupSalesApplicationVO"];
                    kendo.bind($("#groupSalesAppForm"), groupSalesApplicationVO);

                    $("#btnFix").data("kendoButton").enable(true);
                    $("#btnVehAdd").data("kendoButton").enable(false);
                    $("#btnVehDel").data("kendoButton").enable(false);

                    var grid = $('#grid').data('kendoExtGrid').dataSource.page(1);
                    $("#detailViewWindow").data("kendoWindow").close();
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                });
                 */
            }
        });
        //버튼 - 삭제
        $("#btnDel").kendoButton({
            click:function(e) {

                if(!confirm("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmMsg' arguments='${del},' />")){
                    return;
                }

                var grid = $('#grid').data('kendoExtGrid');
                var dataItem = grid.dataItem(grid.select());

                var data ={
                    "dlrCd":$("#dlrCd").val()
                    ,"usrId":$("#usrId").val()
                    ,"reqSeq":$("#reqSeq").val()
                }
                //console.log("saveData::"+kendo.stringify(data));
                $.ajax({
                    url:"<c:url value='/sal/svo/groupSalesApplication/deleteGroupSalesApplication.do' />",
                    data:JSON.stringify(data),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus){
                        fnReSet();

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        $("#detailViewWindow").data("kendoWindow").close();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        });
        //버튼 - 출력
        $("#btnPrint").kendoButton({
            click:function(e) {
                dms.notification.warning("<spring:message code='global.msg.eveloping' />");
            }
        });

        // 숫자
        var onlyNum = new RegExp("[^0-9]","i");
        $(".numberic").keyup(function(e){
            var content = $(this).val();
            if(content.match(onlyNum)){
                $(this).val('');
            }
        });

        //========파일삭제
        $("#fileDelete").click(function(){
            var fileGrid = $("#fileGrid").data("kendoExtGrid");
            var rows = fileGrid.select();
            var selectedItem = fileGrid.dataItem(rows);

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            var deleteList = [];
            rows.each(function(index, row) {
                var dataItem = fileGrid.dataItem(row);
                deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
            });

            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
                ,data:JSON.stringify(deleteList)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    //dms.notification.success("정상적으로 삭제되였습니다.");

                    var fileGrid = $("#fileGrid").data("kendoExtGrid");
                    var rows = fileGrid.select();
                    rows.each(function(index, row) {
                        fileGrid.removeRow(row);
                    });
                    fnDetlGroupHeader();
                }
            });
        });

        //버튼 - 행삭제
        $("#btnRowDel").kendoButton({
           enable:true,
           click:function(e){

               var grid = $("#grid").data("kendoExtGrid");
               var rows = grid.select();

               if(rows.length  == 0 ){
                   //삭제할 데이터가 존재하지 않습니다.
                   dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                   return false;
               }

               // 선택된 차량을 정말 삭제 하시겠습까?
               if (confirm("确定要删除车辆吗?") == false ){
                   return false;
               }

               var selectVeh = [];
               rows.each(function(index, row) {
                   var data = {
                       "dlrCd":grid.dataItem(rows[index]).dlrCd
                       ,"usrId":grid.dataItem(rows[index]).usrId
                       ,"reqSeq":grid.dataItem(rows[index]).reqSeq
                       ,"reqLowerSeq":grid.dataItem(rows[index]).reqLowerSeq
                    }
                    selectVeh.push(data);
               });

               $.ajax({
                   url:"<c:url value='/sal/svo/groupSalesApplication/deleteGroupSalesVeh.do' />",
                   type:'POST',
                   dataType:'json',
                   contentType:'application/json',
                   data:JSON.stringify({"deleteGroupSalesApplicationVehList":selectVeh }),
                   error:function(jqXHR,status,error){
                       console.log(jqXHR);
                   },
                   success:function(data){
                       $('#grid').data('kendoExtGrid').dataSource.page(1);
                       //정상적으로 처리 되였습니다.
                       dms.notification.success("已正常处理");
                   }
               });
           }
        });

        //차량검색 팝업.
	    $("#btnVehAdd").kendoButton({ // 추가(하단 차량 그리드)
            enable:true,
            click:function(e){

                searchVehiclePopupWin = dms.window.popup({
                    windowId:"searchVehiclePopupWin"    //차량조회팝업.
                    ,title:"<spring:message code='global.title.vehicleMaster' />"
                    ,width:"850px"
                    ,height:"400px"
                    ,draggable:false
                    ,modal:true
                    ,content:{
                        //url:"<c:url value='/sal/cmm/selectSearchVehicle.do'/>"
                        url:"<c:url value='/sal/svo/groupSalesApplication/selectVehiclePopup.do' />"
                        ,data:{
                            "dlrCd":dlrCd
                            ,"usrId":usrId
                            ,"reqSeq":reqSeq
                            ,"type"  :null
                            ,"autoBind":false
                            ,"callbackFunc":function(callData){

                            	$.each(callData, function(idx, data){

	                            	if(!isTargetVehicleGrid(data.vinNo)){

	                                    $('#grid2').data('kendoExtGrid').dataSource.insert(idx, {
	                                         carlineCd  :data.carlineCd
	                                        ,carlineNm  :data.carlineCdNm
	                                        ,modelCd    :data.modelCd
	                                        ,modelNm    :data.modelCdNm
	                                        ,ocnCd		:data.ocnCd
	                                        ,ocnNm      :data.ocnCdNm
	                                        ,extColorCd :data.extColorCd
	                                        ,extColorNm :data.extColorCdNm
	                                        ,intColorCd :data.intColorCd
	                                        ,intColorNm :data.intColorCdNm
	                                        ,vinNo      :data.vinNo
	                                        ,whPrc      :data.whPrc
	                                    });
	                                }
                            	});


                            	//정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                                //$('#grid2').data('kendoExtGrid').dataSource.page(1);
                            }
                        }
                    }
                });
            }
        });

        //버튼 - 차량삭제
        $("#btnVehDel").kendoButton({
            click:function(e) {

            	var grid2 = $("#grid2").data("kendoExtGrid");
                var rows = grid2.select();

                if(rows.length  == 0 ){
                    //삭제할 데이터가 없습니다.
                    dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                    return false;
                }

                rows.each(function(index, row) {
                    grid2.removeRow(row);
                });

                /*
                //주문그리드
                var grid = $("#grid2").data("kendoExtGrid");
                var selectIdx = grid.select().index();
                var data = grid.dataSource.view();
                var rows = grid.select();
                var selectVal = data[selectIdx];
                var arrSave = [];

                if(selectIdx == -1){
                    // 삭제할 데이터가 존재하지 않습니다.
                    dms.notification.warning("<spring:message code='global.info.noDelData' />");
                    return false;
                }


                rows.each(function(index, row) {
                    var dataItem = grid.dataItem(row);
                    arrSave.push(dataItem);

                });


                // 삭제 하시겠습니까?
                if(confirm("<spring:message code='global.info.reallyDelete' />") == false ){
                    return false;
                }


                var saveData = {"deleteGroupSalesApplicationVehList":arrSave};

                $.ajax({
                    url:"<c:url value='/sal/svo/groupSalesApplication/deleteGroupSalesVeh.do' />",
                    dataType:"json",
                    type:"POST",
                    contentType:"application/json",
                    data:JSON.stringify(saveData),
                    error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(jqXHR, textStatus){
                        //정상적으로 처리되였습니다.
                        dms.notification.success("<spring:message code='global.info.deleteSuccess' />");
                        $('#grid2').data('kendoExtGrid').dataSource.page(1);
                    }
                }); */

            }
        });

/* 	    // 상세정보
	    $("#btnViewDetail").kendoButton({
	        click:function(e){

	            var grid = $("#grid").data("kendoExtGrid");
	            var selectedItem = grid.dataItem(grid.select());
	            if ( dms.string.isNotEmpty(selectedItem) ){

	                viewDetail(selectedItem);

	            } else {

	                // {상세정보}을(를) 확인하여 주세요.
	                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
	                return;
	            }

	        }
	        , enable:false
	    }) */

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
                             params["sApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();
                             // 신청일자
                             params["sApplyDtS"] = $("#sApplyDtS").data("kendoExtMaskedDatePicker").value();
                             params["sApplyDtE"] = $("#sApplyDtE").data("kendoExtMaskedDatePicker").value();

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
                              ,applyDt:{type:"date"}             //신청일자
                              ,approveCd:{type:"string"}        //상태
                              ,assignQty:{type:"number"}        //배정수량
                          }
                     }
                 }
            }
            //,height:460
        	,multiSelectWithCheckbox:false
            ,editable   :false
            //,autoBind:false
            ,navigatable:true
            ,selectable:"row"
            ,change:function(e){

                if(this.select().length != 0){
                    var selectedVal = this.dataItem(this.select());
                    var applyNo = selectedVal.applyNo;

                    /* if ( dms.string.isNotEmpty(applyNo) ) {
                        $("#btnViewDetail").data("kendoButton").enable(true);
                    }
                    */
                };
            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,columns:[
                {field:"dlrCd", hidden:true}        // 딜러코드
                ,{field:"usrId", hidden:true}       // 등록자
                ,{field:"reqSeq", hidden:true}      // 일련번호
                ,{field:"applyNo", title:"<spring:message code='global.lbl.applNumber' />"
                    , width:70
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 신청번호
                ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />"
                    ,width:80
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 고객명
                ,{field:"atcDstinCd", title:"<spring:message code='global.lbl.item' />"
                    ,width:80
                    ,template:"# if(atcDstinArr[atcDstinCd] != null) { # #= atcDstinArr[atcDstinCd].cmmCdNm# # }#"
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 항목
                ,{field:"reqQty", title:"<spring:message code='global.lbl.qty' />"
                    ,width:80
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:right"}
                }  // 수량
                ,{field:"applyDt", title:"<spring:message code='global.lbl.fincReqDt' />"
                    ,width:60
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "style":"text-align:center"}
                }  // 신청일자
                ,{field:"approveCd", title:"<spring:message code='global.lbl.signStatCd' />"
                    ,width:55
                    ,template:"# if(approveCdArr[approveCd] != null) { # #= approveCdArr[approveCd].cmmCdNm# # }#"
                    ,attributes:{ "style":"text-align:center"}
                }  // 상태
                /* ,{field:"assignQty", title:"<spring:message code='global.lbl.assignmentUnit' />"
                    ,width:35
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:right"}
                }  // 배정수량 */
            ]
    	});


        //그리드 설정
        $("#grid2").kendoExtGrid({
            gridId:"G-SAL-0721-115209"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/sal/svo/groupSalesApplication/selectDetlVehPop.do' />"
                        //url:"<c:url value='/sal/svo/groupSalesApplication/selectGroupSalesApplicationDetVeh.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sDlrCd"] = dlrCd;
                            params["sUsrId"] = usrId;
                            params["sReqSeq"] = reqSeq;
                            //params["sCarlineCd"] = carlineCd;
                            //params["sModelCd"] = modelCd;


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
                            ,carlineCd	  :{type:"string"}
                            ,carlineNm    :{type:"string"}
                            ,modelCd      :{type:"string"}
                            ,modelNm      :{type:"string"}
                            ,stockVinNo1  :{type:"string"}
                            ,stockVinNo2  :{type:"string"}
                            ,fileDocId    :{type:"string"}
                            ,whPrc        :{type:"number"}
                        }
                    }
                }
            }
	        /* ,dataBound:function(e) {
	            var rows = e.sender.tbody.children();

	            var sumQty = 0;
	            $.each(rows, function(idx, row){
	                var dataItem = e.sender.dataItem(row);

	                if(dataItem.sumQty != null){
	                    sumQty += Number(dataItem.sumQty);
	                }
	            });
	            $("#qtyTot").text(sumQty);
	         } */
            ,height:190
            ,editable:false
            ,multiSelectWithCheckbox:false
            ,autoBind:false
            ,navigatable:true
            ,sortable:false
            ,multiSelectWithCheckbox:true
            ,pageable:false
            ,indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true         //컬럼순서 변경 개인화 적용. default:true
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,change:function(e){

                var grid = e.sender;
                var selectRow = this.dataItem(this.select());
                var fileDocId = selectRow.fileDocId;
                reqLowerSeq = selectRow.reqLowerSeq ;

                $("#fileDocId").val(fileDocId);
                $("#fileDocNo").val(fileDocId);
                $('#fileGrid').data('kendoExtGrid').dataSource.page(1);


                //if( selectRow.reqNo != "" && selectRow.reqNo != null ){
                //    $('#grid3').data('kendoExtGrid').dataSource.page(1);
                //}
            }
            ,columns:[
                {field:"dlrCd"			,hidden:true}
                ,{field:"carId"			,hidden:true}
                ,{field:"modelCd"		,hidden:true}
                ,{field:"vinNo"			,hidden:true}
                ,{field:"usrId"			,hidden:true}
                ,{field:"reqSeq"		,hidden:true}
                ,{field:"reqLowerSeq"	,hidden:true}
                ,{field:"fileDocId"		,hidden:true}
                ,{field:"carlineNm"		,title:"<spring:message code='global.lbl.carlineNm' />"		,width:75	,attributes:{"class":"al"}}     	//차종명
                ,{field:"modelNm"		,title:"<spring:message code='global.lbl.modelNm' />"		,width:150	,attributes:{"class":"al"}}     	//모델명
                ,{field:"ocnNm"			,title:"<spring:message code='global.lbl.ocn' />"			,width:80	,attributes:{"class":"ac"}}        	//OCN
                ,{field:"extColorNm"	,title:"<spring:message code='global.lbl.extColor' />"		,width:80	,attributes:{"class":"ac"}}        	//외장색
                ,{field:"intColorNm"	,title:"<spring:message code='global.lbl.intColor' />"		,width:80	,attributes:{"class":"ac"}}        	//내장색
                ,{field:"vinNo"			,title:"<spring:message code='sal.lbl.carVinNo' />"			,width:150	,attributes:{"class":"ac"}}     	//Vin NO
                ,{field:"whPrc"		    ,title:"<spring:message code='sal.lbl.carRetlAmt' />"		,width:60	,attributes:{"class":"ar"}	,format:"{0:n2}"} //지도가
                ,{field:""				,title:" "	,width:80	,attributes:{"class":"ac"}
                    ,template:"<span class='txt_label bg_blue' onClick='fileViewPop()'>添加文件</span>"
                }//첨부파일
                ,{field:""				,title:""	,width:60	,attributes:{"class":"ac"}
                    ,template:"<span class='txt_label bg_green' onClick='imageViewPop(\"#=fileDocId#\")'>预览</span>"
                }//미리보기
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
                             params["sFileDocNo"] = $("#fileDocId").val();

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
            ,multiSelectWithCheckbox:true
            ,navigatable:false
            ,pageable:false
            ,resizable:false
            ,sortable:false
            ,filterable:false
            ,columns:[
                {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" ,width:50,attributes:{"class":"al"}}           // 파일명
               ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />" ,width:50,attributes:{"class":"al"}}       // 파일크기
               ,{title:"",width:50,attributes:{"class":"ac"}
                   ,template:"<span class='txt_label bg_blue' onClick='dms.fileManager.download(\"#=fileDocNo#\",\"#=fileNo#\")'>下载</span>"//다운로드
                }

            ]
         });
         // 파일 그리드 종료 //

        //그리드 3번 (심사정보 그리드)
        $("#grid3").kendoExtGrid({
            gridId:"G-SAL-0721-115210"
            ,dataSource:{
                transport:{
                     read:{
                         url:"<c:url value='/sal/svo/groupSalesApplication/selectGroupSalesApplicationDetJdg.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var grid = $("#grid").data('kendoExtGrid');
                             var selectRow = grid.dataItem(grid.select());

                             var params = {};
                            /*
                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             */
                             params["sort"] = options.sort;

                             // 딜러코드
                             params["sDlrCd"] = selectRow.dlrCd;
                             // 등록자
                             params["sUsrId"] = selectRow.usrId;
                             // 일련번호
                             params["sReqSeq"] = selectRow.reqSeq;

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
            ,height:130
            ,multiSelectWithCheckbox:false
            ,editable   :false
            ,autoBind:false
            ,navigatable:true
            ,selectable:"row"
            ,pageable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,filterable:false
            ,columns:[
                {field:"reqNo", hidden:true}       // 요청번호
                ,{field:"pevalId", title:"<spring:message code='global.lbl.screeningPrsnnl' />"
                    ,width:80
                    ,attributes:{"class":"ac"}
                }  // 심사담당자
                ,{field:"evalDt", title:"<spring:message code='global.lbl.evalDt' />"
                    ,width:60
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                        ,attributes:{"class":"ac"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 심사일자
                ,{field:"evalRsltYn", title:"<spring:message code='global.lbl.evalRslt' />"
                    ,width:55
                    ,attributes:{"class":"ac"}
                }  // 심사결과
                ,{field:"remark", title:"<spring:message code='global.lbl.evalRemark' />"
                    ,width:50
                    ,attributes:{"class":"al"}
                }  // 심사평가
            ]
        });

        //$("#btnVehAdd").data("kendoButton").enable(false);
        //$("#btnVehDel").data("kendoButton").enable(false);

        /* *************************************************************************
         **************************HEAD 정보 파일 첨부 (계약문서,사업자등록증, 기타 자료) ********************************************
         ***************************************************************************/
         //================================
        rs = new Resumable({
             target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
             ,chunkSize:1 * 1024 * 1024
             ,simultaneousUploads:4
             ,testChunks:true
             ,throttleProgressCallbacks:1
             ,method:"octet"
             //,fileType:["png", "jpg", "jpeg", "gif"]
             //,fileTypeErrorCallback:function(file, errorCount) {
             //    alert("只能上传图片,请重新上传图片");
             //}
             ,maxFiles:1
        });
        rs.assignBrowse($("#fileSelectContract")[0]);
        rs.assignBrowse($("#fileSelectBuss")[0]);
        rs.assignBrowse($("#fileSelectEtc")[0]);
        rs.assignBrowse($("#fileSelectAdd")[0]);

        //파일추가 이벤트
        rs.on('fileAdded', function(file) {

            ru = this;

            $("#progressWindow").kendoWindow({
                width:"600px"
                ,height:"300px"
                ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
                ,animation:false
                ,draggable:false
                ,visible:false
                ,resizable:false
                ,modal:true
            }).data("kendoWindow").center().open();

            $('.resumable-progress, .resumable-list').show();
            $('.resumable-progress .progress-resume-link').hide();
            $('.resumable-progress .progress-pause-link').show();

            //파일목록 출력
            $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
            $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

            //업로드 시작
            rs.upload();
         });
         rs.on('pause', function() {
             $('.resumable-progress .progress-resume-link').show();
             $('.resumable-progress .progress-pause-link').hide();
         });
         rs.on('uploadStart', function() {

             var _that = this;

             if (_that.opt["query"] == null) {
                  _that.opt["query"] = {};
             }

             if (dms.string.isEmpty($("#headFileDocId").val())) {
                 $.ajax({
                     url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                     dataType:"json",
                     type:"get",
                     async:false,
                     cache:false,
                     success:function(id) {
                         _that.opt["query"]["resumableSessionId"] = id;
                         $("#headFileDocId").val(id);
                     }
                 });
             } else {
                 _that.opt["query"]["resumableSessionId"] = $("#headFileDocId").val();
             }

             $('.resumable-progress .progress-resume-link').hide();
             $('.resumable-progress .progress-pause-link').show();
         });
         rs.on('fileSuccess', function(file, message) {
             //console.log("===============");
             ///console.log(message);
             var result = JSON.parse(message);
             if(result.status === "finished") {

                 if(dms.string.isEmpty($("#headFileDocId").val())){
                     $("#headFileDocId").val(result.fileDocNo);
                 }

                 console.log("fileBtn : " + fileBtn);


                 if(fileBtn == "fileSelectContract"){
                     $("#contractFileNm").val(result.fileNm);
                     $("#contractFileNo").val(result.fileNo);

                     $("#fileSelectContract").hide();
                     $("#contractFileDel").show();
                     $("#contractFile").show();

                 }else if(fileBtn == "fileSelectBuss"){
                     $("#bussLicenceNm").val(result.fileNm);
                     $("#bussLicenceNo").val(result.fileNo);

                     $("#fileSelectBuss").hide();
                     $("#bussLicenceDel").show();
                     $("#bussLicence").show();
                 }else if(fileBtn == "fileSelectEtc"){
                     $("#etcFileNm").val(result.fileNm);
                     $("#etcFileNo").val(result.fileNo);

                     $("#fileSelectEtc").hide();
                     $("#etcFileDel").show();
                     $("#etcFile").show();
                 }else if(fileBtn == "fileSelectAdd"){
                     $("#addFileNm").val(result.fileNm);
                     $("#addFileNo").val(result.fileNo);

                     $("#fileSelectAdd").hide();
                     $("#addFileDel").hide();
                     $("#addFile").show();
                 }
             }
         });
         rs.on('complete', function() {

             var _that = this;
             $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

             console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

             $("#progressWindow").data("kendoWindow").close();
             rs.files = [];
             $(".resumable-list").html("");
         });
         rs.on('fileError', function(file, message) {
             $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
         });
         rs.on('fileProgress', function(file) {
             var fileProgress = 0;

             if (file instanceof ResumableChunk) {
                 fileProgress = file.fileObj.progress();
             } else {
                 fileProgress = file.progress();
             }

             $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
             $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
             $('.progress-bar').css({width:Math.min(Math.floor(rs.progress() * 100), 100)+ '%'});
         });


         /* *************************************************************************
          **************************찰량정보 이미지 파일 올리기. ********************************************
          ***************************************************************************/
          //================================
         r = new Resumable({
              target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
              ,chunkSize:1 * 1024 * 1024
              ,simultaneousUploads:4
              ,testChunks:true
              ,throttleProgressCallbacks:1
              ,method:"octet"
              ,fileType:["png", "jpg", "jpeg", "gif"]
              ,fileTypeErrorCallback:function(file, errorCount) {
                  alert("只能上传图片,请重新上传图片");
              }
              //,maxFiles:1
          });
          r.assignBrowse($("#fileSelect")[0]);


          //파일추가 이벤트
          r.on('fileAdded', function(file) {

              ru = this;

              $("#progressWindow").kendoWindow({
                  width:"600px"
                  ,height:"300px"
                  ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
                  ,animation:false
                  ,draggable:false
                  ,visible:false
                  ,resizable:false
                  ,modal:true
              }).data("kendoWindow").center().open();


              $('.resumable-progress, .resumable-list').show();
              $('.resumable-progress .progress-resume-link').hide();
              $('.resumable-progress .progress-pause-link').show();

              //파일목록 출력
              $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
              $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

              //업로드 시작
              r.upload();

          });
          r.on('pause', function() {
              $('.resumable-progress .progress-resume-link').show();
              $('.resumable-progress .progress-pause-link').hide();
          });
          r.on('uploadStart', function() {

              var _that = this;

              if (_that.opt["query"] == null) {
                   _that.opt["query"] = {};
              }

              if (dms.string.isEmpty($("#fileDocNo").val())) {
                  $.ajax({
                      url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                      dataType:"json",
                      type:"get",
                      async:false,
                      cache:false,
                      success:function(id) {
                          _that.opt["query"]["resumableSessionId"] = id;
                          $("#fileDocNo").val(id);
                      }
                  });
              } else {
                  _that.opt["query"]["resumableSessionId"] = $("#fileDocNo").val();
              }

              $('.resumable-progress .progress-resume-link').hide();
              $('.resumable-progress .progress-pause-link').show();
          });
          r.on('complete', function() {

              var _that = this;

              $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

              //console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

              $("#progressWindow").data("kendoWindow").close();
              r.files = [];
              $(".resumable-list").html("");


          });
          r.on('fileSuccess', function(file, message) {
              //console.log("===============");
              ///console.log(message);

              var result = JSON.parse(message);
              if(result.status === "finished") {
                  $("#fileGrid").data("kendoExtGrid").dataSource.insert({
                      fileDocNo:result.fileDocNo
                      ,fileNo:result.fileNo
                      ,fileNm:result.fileNm
                      ,fileSize:dms.string.formatFileSize(result.fileSize)
                  });
                  //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');


                 if (dms.string.isEmpty($("#fileDocId").val()) && !dms.string.isEmpty($("#fileDocNo").val())) {
                      //집단판매신청 차량정보에(SA_0413T)에 첨부파일 FILE_DOC_ID 추가 .
                      var data = {"reqSeq":reqSeq
                                  ,"dlrCd":dlrCd
                                  ,"usrId":usrId
                                  ,"reqLowerSeq":reqLowerSeq
                                  ,"fileDocId":$("#fileDocNo").val()
                             };

                      $.ajax({
                          url:"<c:url value='/sal/svo/groupSalesApplication/updateGroupSalesFile.do' />",
                          data:JSON.stringify(data),
                          type:'POST',
                          dataType:'json',
                          contentType:'application/json',
                          error:function(jqXHR,status,error){
                              dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                          },
                          success:function(jqXHR, textStatus){
                              //정상적으로 반영 되었습니다.
                              $('#grid').data('kendoExtGrid').dataSource.read();
                          }
                      });
                  }

                 //$("#fileViewWindow").data("kendoWindow").close();
                 $('#grid2').data('kendoExtGrid').dataSource.page(1);

              }
          });
          r.on('fileError', function(file, message) {
              $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
          });
          r.on('fileProgress', function(file) {
              var fileProgress = 0;

              if (file instanceof ResumableChunk) {
                  fileProgress = file.fileObj.progress();
              } else {
                  fileProgress = file.progress();
              }

              $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
              $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
              $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
          });

	}); //document.ready End

</script>