<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

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
                    <a href="#" onclick="attachment.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="attachment.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->

<!-- 부품선택 팝업 -->
<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <!-- 조회 버튼 -->
            <button id="btnSave" class="btn_m btn_save"><spring:message code="par.btn.save" /><!-- 저장 --></button>
            <button id="btnSend" class="btn_m btn_save"><spring:message code="par.btn.send" /><!-- 발송 --></button>
            <button id="btnDelete" class="btn_m btn_del"><spring:message code="par.btn.del" /><!-- 삭제 --></button>
        </div>
    </div>
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="claimForm">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:13%;">
                <col style="width:20%;">
                <col style="width:13%;">
                <col style="width:20%;">
                <col style="width:13%;">
                <col style="width:20%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /><!-- 딜러코드 --></span></th>
                    <td>
                        <input id="dlrCd" class="form_input form_readonly" data-mandatory="true" readonly/>
                        <input type="hidden" id="claimNo" class="form_input form_readonly"/>
                        <input type="hidden" id="arrivedDateChar" class="form_input" />
                        <input type="hidden" id="deliveryInventoryDateChar" class="form_input" />
                        <input type="hidden" id="claimantNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.dlrNm" /><!-- 딜러명 --></th>
                    <td>
                        <input id="dlrNm" class="form_input form_readonly" readonly/>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.requestDt" /><!-- 신청일자 --></th>
                    <td>
                        <input id="createTime" data-type="maskDate" class="form_datepicker" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.claimInvcNo" /><!-- 클레임송장번소 --></span></th>
                    <td>
                        <input id="boxingNo" class="form_input" data-mandatory="true"/>
                    </td>
                    <%-- <th scope="row"><spring:message code="par.lbl.sellInventoryNo" /><!-- 판매리스트번호 --></th>
                    <td>
                        <input id="sellInventoryNo" class="form_input" />
                    </td> --%>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.waybillNo" /><!-- 배송문서번호 --></span></th>
                    <td>
                        <input id="waybillNo" class="form_input" data-mandatory="true"/>
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.arrvDt" /><!-- 도착일자 --></span></th>
                    <td>
                        <input id="arrivedDate" data-type="maskDate" class="form_datepicker" data-mandatory="true"/>
                        <input type="hidden" id="updtDt" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.isIntact" /><!-- 포장파손여부 --></span></th>
                    <td>
                        <input id="isIntact" data-type="combo" class="form_comboBox" data-mandatory="true" required/>
                    </td>
                    <%-- <th scope="row"><spring:message code="par.lbl.deliveryInventoryDate" /><!-- 출고서일자 --></th>
                    <td>
                        <input id="deliveryInventoryDate" data-type="maskDate" class="form_datepicker"/>
                    </td> --%>
                    <th scope="row"><spring:message code="par.lbl.deliveryInventoryNo" /><!-- 출고서번호 --></th>
                    <td>
                        <input id="deliveryInventoryNo" class="form_input" />
                    </td>
                    <th/>
                    <td/>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.describe" /><!-- 상세묘사 --></span></th>
                    <td  colspan="5">
                        <input id="describe" class="form_input"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.attachment" /><!-- 첨부 --></th>
                    <td colspan="2">
                        <input id="attachmentName" class="form_input form_readonly" readonly="readonly" />
                    </td>
                    <td colspan="3">
                        <input type="file" id="attachmentFiles" name="attachmentFiles[]" class="form_file" />
                        <input type="hidden" id="attachmentUrl" name="attachmentUrl" data-json-obj="true" />
                        <input type="hidden" id="atchFileCont" name="atchFileCont" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"></th>
                    <td colspan="3">
                        <img id="fileViewAttachment" name="imgFile" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_add btn_s_min5"  id="btnAdd"><spring:message           code="par.btn.add" /></button>
            <button class="btn_s btn_del btn_s_min5"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
            <!--  <button class="btn_s btn_add btn_s_min5"  id="btnAddItem"><spring:message       code="par.btn.itemPop" /></button>-->
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <div class="table_grid">
        <!-- 과부족클레임 그리드 -->
        <div id="grid" class="grid"></div>
    </div>
</section>
<!-- //부품선택 팝업 -->

<script type="text/javascript">

 /************************************************************
 팝업옵션 설정
*************************************************************/
/**
* 팝업 옵션
*/
var options = parent.oversAndShortsClaimPopupWindow.options.content.data,
    claimTypeList         = [],
    claimTypeObj          = {},
    isIntactList          = [],
    dlrCd                 = "${dlrCd}",
    claimTypeDropDownEditor,
    searchItemPopupWindow,
    toDt                  = "${toDt}";




    claimTypeList.push({"cmmCd":'0', "cmmCdNm":" ", "useYn":""});
    claimTypeObj[0] = "";
    <c:forEach var="obj" items="${claimTypeList}" varStatus="status">
        claimTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        claimTypeObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${isIntactList}" varStatus="status">
        isIntactList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    $(document).ready(function() {


        //포장파손여부
        $("#isIntact").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:isIntactList
            ,index:0
        });


        $("#createTime").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#arrivedDate").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#deliveryInventoryDate").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        $("#attachmentFiles").on('change',  handleAttachmentFileSelect);

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var headData = '',
                    grid     = $("#grid").data("kendoExtGrid"),
                    rows     = grid.tbody.find("tr"),
                    saveData = grid.getCUDData("insertList", "updateList", "deleteList"),
                    header;

                if(!checkValidation()){
                    return false;
                }

                //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
                //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                delete partsJs.validate.formJs.Hash[''];
                delete partsJs.validate.formJs.Hash['attachmentFiles'];


                headData = partsJs.validate.formJs.Hash;

                headData.status = '0';


                saveData.oversAndShortsClaimVO      = headData;

                $.ajax({
                    url:"<c:url value='/par/pcm/claim/multiOversAndShortsClaim.do' />"
                    ,type:"POST"
                    ,data:kendo.stringify(saveData)
                    ,dataType:"json"
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {

                        if (result.resultYn === true) {
                            dms.notification.success("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.info.regSuccessParam' arguments='${claim}'/>");
                            $("#claimNo").val(result.claimNo);

                            $.ajax({
                                url:"<c:url value='/par/pcm/claim/selectOversAndShortsClaimByKey.do' />",
                                data:JSON.stringify({ sClaimNo:$("#claimNo").val()}),
                                type:"POST",
                                dataType:"json",
                                contentType:"application/json",
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                            }).done(function(result) {

                                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                                    return false;
                                }

                                partsJs.validate.groupObjAllDataSet(result);

                                if(!dms.string.isEmpty(result.claimantNo)){
                                    $("#btnDelete").data("kendoButton").enable(true);
                                }else{
                                    $("#btnDelete").data("kendoButton").enable(false);
                                }

                                $("#btnSend").data("kendoButton").enable(true);
                                $("#grid").data("kendoExtGrid").dataSource.read();
                            });
                        }else{
                            if(result === 0){
                                dms.notification.error("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.err.modifyFailedParam' arguments='${claim}'/>");
                            }// 에러 메시지 확인.
                        }
                    }
                    ,beforeSend:function(){
                        dms.loading.show($("#windows"));
                    }
                    ,complete:function(){
                        dms.loading.hide($("#windows"));
                    }
                    ,error:function(jqXHR,status,error) {
                        dms.loading.hide($("#windows"));
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                });
            }
        });

        // 전송 버튼
        $("#btnSend").kendoButton({
            click:function(e){


                var saveList = [],
                    grid     = $("#grid").data("kendoExtGrid"),
                    rows     = grid.tbody.find("tr"),
                    saveData = grid.getCUDData("insertList", "updateList", "deleteList"),
                    data     = {},
                    urlParam,
                    oversAndShortsClaimVO,
                    header;

                if(!checkValidation()){
                    return false;
                }

                if(dms.string.isEmpty($("#claimNo").val())){
                    //클레임번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.dmsClaimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                    return false;
                }

                //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
                //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                if(rows.length  > 0 ){
                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);

                        if(dms.string.isEmpty(gridData.partNo)){
                            // 부품을 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.confirmMsgParam' arguments='${itemCd}'/>");
                            saveList = [];
                            return false;
                        }

                        saveList.push(gridData);
                    });
                }

                delete partsJs.validate.formJs.Hash[''];
                delete partsJs.validate.formJs.Hash['attachmentFiles'];

                headData = partsJs.validate.formJs.Hash;

                headData.status = '1';
                saveData.oversAndShortsClaimVO      = headData;

                if(dms.string.isEmpty($("#claimantNo").val())){
                    urlParam = "<c:url value='/par/pcm/claim/sendCreateOversAndShortsClaim.do' />";
                }else{
                    urlParam = "<c:url value='/par/pcm/claim/sendUpdateOversAndShortsClaim.do' />";
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/par/pcm/claim/multiOversAndShortsClaim.do' />"
                        ,type:"POST"
                        ,data:kendo.stringify(saveData)
                        ,dataType:"json"
                        ,contentType:'application/json'
                        ,async:false
                        ,success:function(result) {

                            if (result.resultYn === true) {
                                data['oversAndShortsClaimVO']       = partsJs.validate.formJs.Hash;
                                data['oversAndShortsClaimItemList'] = saveList;

                                $.ajax({
                                    url:urlParam//"<c:url value='/par/pcm/claim/sendCreateOversAndShortsClaim.do' />"
                                    ,type:"POST"
                                    ,data:kendo.stringify(data)
                                    ,dataType:"json"
                                    ,contentType:'application/json'
                                    ,async:false
                                    ,success:function(result){
                                        if(result === 1){
                                            dms.notification.success("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.info.sendSuccessParam' arguments='${claim}'/>");
                                            $("#btnSend").data("kendoButton").enable(true);
                                            $("#btnAdd").data("kendoButton").enable(false);
                                            $("#btnDelItem").data("kendoButton").enable(false);
                                            $("#btnAddItem").data("kendoButton").enable(false);

                                            options.callbackFunc(data);
                                        }else{
                                            if(result === 0){
                                                dms.notification.error("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.err.modifyFailedParam' arguments='${claim}'/>");
                                            }
                                            // 에러 메시지 확인.
                                        }
                                    }
                                });
                            }else {
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.err.modifyFailedParam' arguments='${claim}'/>");
                                }// 에러 메시지 확인.
                            }
                        }
                        ,beforeSend:function(){
                            dms.loading.show($("#windows"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#windows"));
                        }
                        ,error:function(jqXHR,status,error) {
                            dms.loading.hide($("#windows"));
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    });
                }
            }
        });

        // 삭제 버튼
        $("#btnDelete").kendoButton({
            click:function(e){

                var saveData = {},
                    header;

                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                delete partsJs.validate.formJs.Hash[''];
                delete partsJs.validate.formJs.Hash['attachmentFiles'];



                if(dms.string.isEmpty($("#claimantNo").val())){
                    //클레임번호가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.required.field' arguments='${claimNo}'/>");
                    return false;
                }

                headData = partsJs.validate.formJs.Hash;

                saveData.oversAndShortsClaimVO      = headData;


                $.ajax({
                    url:"<c:url value='/par/pcm/claim/sendDeleteOversAndShortsClaim.do' />"
                   ,data:kendo.stringify(saveData)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,async:false
                   ,success:function(result) {

                       if (result === 1) {

                           //전송 완료 되었습니다.
                           dms.notification.success("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.info.sendSuccessParam' arguments='${claimNo}'/>");

                       } else {
                           if(result === 0){
                               //전송 실패하였습니다.
                               dms.notification.error("<spring:message code='par.lbl.claimNo' var='claimNo' /><spring:message code='global.err.sendFailedParam' arguments='${claimNo}'/>");
                           }
                       }
                   }
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }

               });
            }
        });

        //부품팝업
        $("#btnAddItem").kendoButton({

            click:function(e){

                //selectPartsMasterPopupWindow();
                purcOrderStatusSearchPopup();
            }
        });

      //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                /*$('#grid').data('kendoExtGrid').dataSource.insert(0, {
                     "dlrCd"         :$("#dlrCd").val()
                    ,"claimNo"       :''
                    ,"claimLine"     :0
                    ,"orderNo"       :''
                    ,"partNo"        :''
                    ,"claimantType"  :0
                    ,"errorPartNo"   :''
                    ,"orderNum"      :0
                    ,"realNum"       :0
                    ,"claimantNum"   :0
                    ,"control"       :''
                 });*/
                purcOrderStatusSearchPopup();
            }
        });

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){

                var grid = $("#grid").data("kendoExtGrid"),
                    rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        // 조회조건 설정

        if(!dms.string.isEmpty(options.claimNo)){
            //$("#claimNo").val(options.claimNo);
            $.ajax({
                url:"<c:url value='/par/pcm/claim/selectOversAndShortsClaimByKey.do' />",
                data:JSON.stringify({ sClaimNo:options.claimNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                partsJs.validate.groupObjAllDataSet(result);
                $("#grid").data("kendoExtGrid").dataSource.read();

                if(!dms.string.isEmpty(result.claimantNo)){
                    $("#btnDelete").data("kendoButton").enable(true);
                }else{
                    $("#btnDelete").data("kendoButton").enable(false);
                }

                $("#btnSend").data("kendoButton").enable(true);
                imageLoader();

            });
        }

        $("#dlrCd").val(dlrCd);

        if(dms.string.isEmpty($("#updtDt").val())){
            $("#btnSend").data("kendoButton").enable(false);
        }
        if(!dms.string.isEmpty($("#claimantNo").val())){
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
        }

        $("#arrivedDate").data("kendoExtMaskedDatePicker").value(toDt);


        /**
         * grid 클레임유형 DropDownList
         */
         claimTypeDropDownEditor = function(container, options) {

             $('<input data-bind="value:' + options.field + '"  />')
             .appendTo(container)
             .kendoExtDropDownList({
                 dataTextField: "cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:  claimTypeList
                ,change:function(){
                    var grid = $("#grid").data("kendoExtGrid");
                    var selectedVal = grid.dataItem(grid.select());
                    if(selectedVal.claimantType != "2"){
                        selectedVal.set("errorPartNo", "");
                    }
                }
             });
         };

         /**
          * grid 숫자
          */
          changeNumberEditor = function(container, options) {
              var input = $("<input/>"),
                  pValue;

              input.attr("name", options.field);

              input.appendTo(container);
              input.kendoExtNumericTextBox({
                  format: "n0"
                  ,decimals:0
                  ,restrictDecimals: true
                  ,min:0
                  ,spinners:false
              });
          };

        // 클레임 관리 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-182702"
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/claim/selectOversAndShortsClaimItemsByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 입고확정대상 검색조건 코드.
                            params["sClaimNo"]           = $("#claimNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
            ,schema:{
                     data:function (result){
                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"claimNo"
                      ,fields:{
                              dlrCd                :{ type:"string" }
                            , claimNo              :{ type:"string" }
                            , claimLine            :{ type:"number" }
                            , orderNo              :{ type:"string" }
                            , partNo               :{ type:"string" }
                            , claimantType         :{ type:"number" }
                            , errorPartNo          :{ type:"string" }
                            , orderNum             :{ type:"number" }
                            , realNum              :{ type:"number" }
                            , claimantNum          :{ type:"number" }
                            , control              :{ type:"string" }
                        }
                    }
                }
            }
            , selectable :"row"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
            , filterable:false
            , height     :150
            , pageable   :false
            , edit:function(e){
                var eles = e.container.find("input"),
                    grid = this,
                    rows = e.sender.select(),
                    selectedItem = e.sender.dataItem(rows[0]),
                    input = e.container.find(".k-input"),
                    pVal,
                    orgVal,
                    tDate,
                    fieldName = grid.columns[e.container.index()].field;


                if(fieldName === "orderNum"){
                      this.closeCell();
                }else if(fieldName === "partNo"){
                    /*
                    pVal = input.val();
                    orgVal = input.val();

                    input.keyup(function(){
                        pVal = input.val();
                    });

                    input.blur(function(){
                        $.ajax({
                            url:"<c:url value='/par/pmm/itemMaster/selectSalePrcItemByKey.do'/>"
                           ,data:kendo.stringify({sItemCd:pVal})
                           ,type:'POST'
                           ,dataType:'json'
                           ,contentType:'application/json'
                           ,async:false
                           ,success:function(result) {

                               if (result.total === 1) {

                                   e.model.set('partNo', result.data[0].itemCd);

                               } else {
                                   dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                   e.model.set('partNo', '');
                               }
                           }
                           ,error:function(jqXHR,status,error) {
                               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                               e.model.set('partNo', orgVal);
                           }

                       });

                    });
                    */
                }else if(fieldName === "errorPartNo"){
                    // 클레임유형이 착오(2)인경우에만 오배송부번 입력가능
                    if(selectedItem.claimantType != "2"){
                        this.closeCell();
                    }

                    /*
                    pVal = input.val();
                    orgVal = input.val();

                    input.keyup(function(){
                        pVal = input.val();
                    });

                    input.blur(function(){
                        $.ajax({
                            url:"<c:url value='/par/pmm/itemMaster/selectSalePrcItemByKey.do'/>"
                           ,data:kendo.stringify({sItemCd:pVal})
                           ,type:'POST'
                           ,dataType:'json'
                           ,contentType:'application/json'
                           ,async:false
                           ,success:function(result) {

                               if (result.total === 1) {

                                   e.model.set('errorPartNo', result.data[0].itemCd);

                               } else {
                                   dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                   e.model.set('errorPartNo', '');
                               }
                           }
                           ,error:function(jqXHR,status,error) {
                               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                               e.model.set('errorPartNo', orgVal);
                           }

                       });

                    });
                    */
                }

             }
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                , {   //클레임번호
                      title:"<spring:message code='par.lbl.oversAndShortsClaimNo' />"
                     ,field:"claimNo"
                     ,width:100
                     ,hidden:true
                  }
                , {   //클레임라인번호
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"claimLine"
                     ,width:100
                     ,hidden:true
                  }
                , {   //BMP오더번호
                      title:"<spring:message code='par.lbl.bmpOrdNo' />"
                     ,field:"orderNo"
                     ,width:100
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"partNo"
                     ,width:140
                  }
                , {   //클레임유형
                      title:"<spring:message code='par.lbl.claimType' />"
                     ,field:"claimantType"
                     ,editor:claimTypeDropDownEditor
                     ,template:'#= changeClaimType(claimantType)#'
                     ,width:100
                  }
                , {   //오배송부품번호
                      title:"<spring:message code='par.lbl.errorPartNo' />"
                     ,field:"errorPartNo"
                     ,width:140
                  }
                , {   //오더수량
                      title:"<spring:message code='par.lbl.ordQty' />"
                     ,field:"orderNum"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,editor:changeNumberEditor
                     ,decimals:2
                  }
                , {   //실제도착수량
                      title:"<spring:message code='par.lbl.realArrivedQty' />"
                     ,field:"realNum"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,editor:changeNumberEditor
                     ,decimals:2
                  }
                , {   //클레임수량
                      title:"<spring:message code='par.lbl.claimReqQty' />"
                     ,field:"claimantNum"
                     ,width:100
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,editor:changeNumberEditor
                     ,decimals:2
                  }
                , {   //조작
                      title:"<spring:message code='par.lbl.itemOper' />"
                     ,field:"control"
                     ,width:140
                     ,hidden:true
                  }
            ]
        });

        // 클레임유형
        changeClaimType = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = claimTypeObj[val];
            }
            return returnVal;
        };


    });


     function checkValidation(){
         if(dms.string.isEmpty($("#dlrCd").val())){
             //딜러정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.dlrCd' var='dlrCd' /><spring:message code='global.info.required.field' arguments='${dlrCd}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#boxingNo").val())){
             //송장번호정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.invcDocNo' var='invcDocNo' /><spring:message code='global.info.required.field' arguments='${invcDocNo}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#waybillNo").val())){
             //배송문서번호정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.waybillNo' var='waybillNo' /><spring:message code='global.info.required.field' arguments='${waybillNo}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#arrivedDate").data("kendoExtMaskedDatePicker").value())){
             //도착일자는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.arrvDt' var='arrvDt' /><spring:message code='global.info.required.field' arguments='${arrvDt}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#isIntact").data("kendoExtDropDownList").value())){
             //포장파손여부는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.isIntact' var='isIntact' /><spring:message code='global.info.required.field' arguments='${isIntact}'/>");
             return false;
         }

         if(dms.string.isEmpty($("#describe").val())){
             //상세묘사정보는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.describe' var='describe' /><spring:message code='global.info.required.field' arguments='${describe}'/>");
             return false;
         }

         /* if(dms.string.isEmpty($("#deliveryInventoryNo").val())){
             //출고서번호는 필수 입력 사항입니다.
             dms.notification.warning("<spring:message code='par.lbl.deliveryInventoryNo' var='deliveryInventoryNo' /><spring:message code='global.info.required.field' arguments='${deliveryInventoryNo}'/>");
             return false;
         } */

         return true;
     }

   //부품 팝업 열기 함수
   /*
     function selectPartsMasterPopupWindow(){

         searchItemPopupWindow = dms.window.popup({
            windowId:"searchItemPopupWindow"
            ,title  :"<spring:message code='par.title.partSearch' />" // 부품 조회
            , width:700
            , height:400
            ,content:{
                url :"<c:url value='/par/cmm/selectSearchItemPopup.do' />"
               ,data:{
                   "type"        :""
                  ,"autoBind"    :true
                  ,"selectable"  :"multiple"
                  ,"callbackFunc":function(data){

                      var dataLen      = data.length
                         ,gridData     = $("#grid").data("kendoExtGrid")
                         ,dataItem;

                      for(var i = 0; i < dataLen; i = i + 1){

                          gridData.dataSource.insert(0, {});

                          dataItem = $("#grid").data("kendoExtGrid").dataSource.data()[0];
                          dataItem.set('partNo', data[i].itemCd);

                      }

                      searchItemPopupWindow.close();
                  }

               }
            }
         });
     }
   */

   //file Handler Func
     function handleAttachmentFileSelect(evt){
         //input files
         var files = evt.target.files,
         //file 5MB size
             fileMaxSiz5Mb = 5 * 1024 * 1024,
         //fileView
             fileView = document.querySelector("#fileViewAttachment"),
             output = [];

         for(var i = 0,f; f = files[i]; i++){
             //file only one.
             if(i < 1){
                 //file size check
                 if(f.size > fileMaxSiz5Mb){
                     return false;
                 }

                 //file type check
                 if(!f.type.match("image.*")){
                     return false;
                 }

                 //fileName.
                 $("#attachmentUrl").val(f.name);
                 $("#attachmentName").val(f.name);

                 var reader = new FileReader();

                 var file = f;

                 reader.onload = (function(theFile) {
                     return function(e) {

                         $("#atchFileCont").val(window.btoa(e.target.result));
                         fileView.src = e.target.result;
                         fileView.style.height = '100px';
                         fileView.style.width  = '300px';
                     };
                 })(file);
                 //readAsDataURL call
                 reader.readAsDataURL(file);
             }
         }
     }

   //imageLoader Func
     function imageLoader(){
         var fileViewAttachment   = document.querySelector("#fileViewAttachment"),
             bolbBytesAttachment  = $("#atchFileCont").val(),
             fileDataAttachment   = window.atob(bolbBytesAttachment);

         fileViewAttachment.src = fileDataAttachment;
         fileViewAttachment.style.height  = '100px';
         fileViewAttachment.style.width   = '300px';
         $("#attachmentName").val($("#attachmentUrl").val());
     }

     function purcOrderStatusSearchPopup() {

         var left = 70,
         top = 30;

         //left = $("#orderNo").offset().left;
         x = left;
         //top = $("#orderNo").offset().top;
         y = top;

         purcOrdListAndItemPopupWindow = dms.window.popup({
             windowId:"purcOrdListAndItemPopupWindow"
             ,title:""
             ,width:700
             ,height:320
             ,content:{
                 url:"<c:url value='/par/cmm/selectPurcOrdListAndItemPopup.do'/>"
                 ,data:{
                     "autoBind":false
                     ,"purcOrdNo":$("#orderNo").val()
                     ,"itemCd":$("#partNo").val()
                     ,"callbackFunc":function(data){
                         var dataLen      = data.length,
                             gridData     = $("#grid").data("kendoExtGrid"),
                             popItemData  = {},
                             rows;

                         if(data.length > 0){
                             //내용
                             popItemData.orderNo           = data[0].bmpOrdNo;
                             popItemData.partNo            = data[0].itemCd;
                             popItemData.orderNum          = data[0].bmpChkQty;
                             popItemData.dlrCd           = $("#dlrCd").val();
                             popItemData.claimNo           = '';
                             popItemData.claimLine         = 0;
                             popItemData.claimantType      = 0;
                             popItemData.errorPartNo       = '';
                             popItemData.realNum           = data[0].bmpChkQty;
                             popItemData.claimantNum       = 0;
                             popItemData.control           = '';

                             gridData.dataSource.add(popItemData);
                         }

                         gridData.select(gridData.tbody.find(">tr"));
                         purcOrdListAndItemPopupWindow.close();

                     }
                 }
             }
             /* ,position:{
                 top : x
                 ,left : y
             } */
         });

         $("#purcOrdListAndItemPopupWindow").closest(".k-window").css({
            top:x
            ,left:y
         });
     }

 </script>

