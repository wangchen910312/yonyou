<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 기타출고정보 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.etcIssueInfo" /> --%><!-- 기타출고 정보 --></h1>
            <div class="btn_right">
                <button class="btn_m" id="btnLinkEtcIssueList"><spring:message code="par.btn.etcIssueList" /><!-- 기타출고현황 --></button>
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per" id="searchForm">
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.otherGiTp" /><!-- 기타출고유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                        </td>
                        <th scope="row">
                            <span class="bu_required" id="othDlr"><spring:message code="par.lbl.othDlr" /><!-- 타딜러 --></span>
                            <span class="bu_required" id="receiverId"><spring:message code="par.lbl.receiverId" /><!-- 수령자 ID --></span>
                        </th>
                        <td class="required_area" >
                            <div class="form_search" id="bpTd">
                                <input type="text" id="bpNm" class="form_input form_readonly"  readonly/>
                                <input type="text" id="bpCd" class="form_input hidden" />
                                <a id="searchBpCd"><!-- 검색 --></a>
                            </div>
                            <div class="form_search" id="custTd">
                                <input type="text" id="custNm" class="form_input form_readonly"  readonly/>
                                <input type="text" id="custCd" class="form_input hidden" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.docNo" /><!-- 문서번호 --></th>
                        <td>
                            <input id="etcGiDocNo" class="form_input form_readonly" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s btn_add btn_s_min5"  id="btnAddItem"><spring:message       code="par.btn.itemPop" /></button>
                <button class="btn_s btn_add btn_s_min5"  id="btnAdd"><spring:message           code="par.btn.add" /></button>
                <button class="btn_s btn_del btn_s_min5"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
                <button class="btn_s btn_add btn_s_min5"  id="btnBorrowAdd"><spring:message     code="par.btn.addBorrowDoc" /></button>
                <button class="btn_s btn_del btn_s_min5"  id="btnBorrowDel"><spring:message     code="par.btn.delBorrowDoc" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 부품기타출고 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>

        <div class="table_form  form_width_60per mt10">
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
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td>
                            <input id="remark" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totalQty" /><!-- 수량총계 --></th>
                        <td>
                            <input id="totQty" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totalQty" />"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /><!-- 금액총계 --></th>
                        <td>
                            <input id="totAmt" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
</div>
    <!-- //부품기타출고 -->

<!-- script -->
<script>

    var toDt                = "${toDt}",
        pEtcGiDocNo         = "${pEtcGiDocNo}",
        mvtTpList           = [],
        unitCdObj           = {},
        strgeTpObj          = {},
        strgeTpList         = [],
        locationListObj     = {},
        locationObj         = {},
        giReasonCdObj       = {},
        giReasonCdList      = [],
        popItemObj          = {},
        selectShareStockGiItemPopupWindow,
        issueEtcRentalPopupWindow,
        popupWindow,
        changeAmtEditor,
        changeUnitCd,
        changeItemDstinCd;


        locationObj[' '] = "";
        mvtTpList.push({cmmCd:"41", cmmCdNm:"내부출고"});
        mvtTpList.push({cmmCd:"43", cmmCdNm:"재고실사차출고"});
        mvtTpList.push({cmmCd:"47", cmmCdNm:"대여출고"});
        mvtTpList.push({cmmCd:"48", cmmCdNm:"차입반환출고"});

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        strgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
            strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        </c:forEach>

        giReasonCdObj[' '] = "";
        <c:forEach var="obj" items="${giReasonCdList}" varStatus="status">
            giReasonCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            giReasonCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

    $(document).ready(function() {

        //기타출고유형선택
        $("#mvtTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mvtTpList
            ,index:0
        });

        //총계
        $("#totAmt").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });
        //총수량
        $("#totQty").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pEtcGiDocNo = ''; //기타출고현황 화면에서 넘어온 기타출고번호 삭제.
                initPage();
            }
        });

        //기타출고현황
        $("#btnLinkEtcIssueList").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready'/>");
            }
        });

        $("#searchBpCd").on('click', selectVenderMasterPopupWindow);
        $("#searchCustCd").on('click', selectCustSearchPopupWindow);
        $("#mvtTp").on('change', fnChangeMvtTp);



        // 부품추가 버튼
        $("#btnAddItem").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#bpCd").val()) && $("#mvtTp").data("kendoExtDropDownList").value() !== '41'){
                    // 업체를 선택해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#custCd").val()) && $("#mvtTp").data("kendoExtDropDownList").value() === '41'){
                    // 업체를 선택해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.custCd' var='custCd' /><spring:message code='global.info.confirmMsgParam' arguments='${custCd}'/>");
                    saveList = [];
                    return false;
                }
                 selectItemSalePrcPopupWindow();
            }
        });

        // 차입문서추가 버튼
        $("#btnBorrowAdd").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#bpCd").val())){
                    // 업체를 선택해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    return false;
                }

                selectIssueEtcRentalPopupWindow();
            }
        });

      //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {

                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                     "etcGiDocNo"        :''
                    ,"etcGiDocLineNo"    :null
                    ,"itemCd"            :''
                    ,"itemNm"            :''
                    ,"unitCd"            :''
                    ,"borrowQty"         :0
                    ,"returnQty"         :0
                    ,"procQty"           :0
                    ,"qty"               :0
                    ,"stdStrgeCd"        :''
                    ,"strgeCd"           :''
                    ,"giReasonCd"        :''
                    ,"locCd"             :''
                    ,"retailPrc"         :0
                    ,"movingAvgPrc"      :0
                    ,"prc"               :0
                    ,"amt"               :0
                    ,"refDocNo"          :''
                    ,"refDocLineNo"      :null
                    ,"avlbStockQty"      :0
                 });
            }
        });

        // 부품삭제 버튼
        $("#btnDelItem").kendoButton({
            click:function(e){

                var grid = $("#grid").data("kendoExtGrid"),
                    rows = grid.select();


                rows.each(function(index, row) {
                    var l_rowData = grid.dataItem(row);
                    delete popItemObj[l_rowData.itemCd];

                });

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        // 차입문서삭제 버튼
        $("#btnBorrowDel").kendoButton({
            click:function(e){

                var grid = $("#grid").data("kendoExtGrid"),
                    rows = grid.select();


                rows.each(function(index, row) {
                    var l_rowData = grid.dataItem(row);
                    delete popItemObj[l_rowData.itemCd];

                });

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    mvtType       = $("#mvtTp").data("kendoExtDropDownList").value(),
                    lCrud         = '',
                    paramUrl      = '',
                    bpCd,
                    header;

                if(dms.string.isEmpty($("#bpCd").val()) && mvtType !== '41'){
                    // 수량을 입력하십시오
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    saveList = [];
                    return false;
                }

                if(dms.string.isEmpty($("#custCd").val()) && mvtType === '41'){
                    // 수량을 입력하십시오
                    dms.notification.warning("<spring:message code='par.lbl.custCd' var='custCd' /><spring:message code='global.info.confirmMsgParam' arguments='${custCd}'/>");
                    saveList = [];
                    return false;
                }

                if(mvtType === '41'){
                    bpCd = $("#custCd").val();
                }else{
                    bpCd = $("#bpCd").val();
                }

                header = {
                        mvtTp           :mvtType
                      , bpCd            :bpCd
                      , remark          :$("#remark").val()
                };

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                    if(!dms.string.isEmpty(gridData.itemCd)){

                        if(dms.string.isEmpty(gridData.prc) || gridData.prc == 0){
                            // 단가를 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.itemCd)){
                            // 부품을 선택하십시오
                            dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                            saveList = [];
                            return false;
                        }

                        //내부출고인 경우
                        if(mvtType === '41'){
                            if(dms.string.isEmpty(gridData.qty) || gridData.qty == 0){
                                // 수량을 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.giReasonCd)){
                                // 출고 사유를 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                                saveList = [];
                                return false;
                            }
                        //대여출고인 경우
                        }else if(mvtType === '47'){
                            if(dms.string.isEmpty(gridData.qty) || gridData.qty == 0){
                                // 수량을 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                                saveList = [];
                                return false;
                            }
                        //차입반환출고 인 경우
                        }else if(mvtType === '48'){
                            if(dms.string.isEmpty(gridData.procQty) || gridData.procQty == 0){
                                // 수량을 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                                saveList = [];
                                return false;
                            }
                        }

                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                           "issueEtcVO":header
                          ,"issueEtcItemList":saveList
                        };

                    $.ajax({
                         url:"<c:url value='/par/ism/issue/createIssueEtc.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result) {

                            if (result.resultYn == true) {
                                dms.notification.success("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGiDocNo}'/>");

                                pEtcGiDocNo = result.etcGiDocNo;
                                $('#etcGiDocNo').val(result.etcGiDocNo);
                                // 부품기타출고 조회.
                                selectEtcIssue(pEtcGiDocNo);

                            } else {
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGiDocNo}'/>");
                                }
                            }
                        }
                        ,error:function(jqXHR,status,error) {
                            dms.loading.hide($("#screenSection"));
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                        ,beforeSend:function(){
                            dms.loading.show($("#screenSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#screenSection"));
                        }
                    });
                }
             }
        });

        /**
         * grid 단가&수량
         */
         changeAmtEditor = function(container, options) {
             var input = $("<input/>"),
                 mvtTp,
                 pValue;

             mvtTp = $("#mvtTp").data("kendoExtDropDownList").value();
             input.attr("name", options.field);

             input.keyup(function(){

             });

             input.blur(function(){
                 if(options.field === 'qty'){
                     pValue = Math.floor( $(this).val());
                     options.model.set("amt", options.model.prc * pValue);
                 }else if(options.field === 'procQty'){
                     pValue = Math.floor( $(this).val());
                     options.model.set("amt", options.model.prc * pValue);
                 }else if(options.field === 'prc'){
                     if(mvtTp === '48'){
                         pValue =  Number(Number($(this).val()).toFixed(2));
                         options.model.set("amt", pValue * options.model.procQty);
                     }else{
                         pValue =  Number(Number($(this).val()).toFixed(2));
                         options.model.set("amt", pValue * options.model.qty);
                     }
                 }

                 fnSetAmtInfo();

             });

             input.appendTo(container);
             if(options.field === 'qty' || options.field === 'procQty') {
                 input.kendoExtNumericTextBox({
                     format: "n0"
                     ,decimals:0
                     ,restrictDecimals: true
                     ,min:0
                     ,spinners:false
                 });
             } else {
                 input.kendoExtNumericTextBox({
                     format: "n2"
                     ,decimals:2
                     ,restrictDecimals: true
                     ,min:0
                     ,spinners:false
                 });
             }
         };

         /**
          * grid 출고창고 DropDownList
          */
          giStrgeCdDropDownEditor = function(container, options) {


              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  strgeTpList
                 ,change:function(e){
                     options.model.set('locCd','');
                     $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                  }
              });
          };

         giLocCdDropDownEditor = function(container, options) {

             var itemCd = options.model.itemCd,
                 strgeCd = options.model.strgeCd;

             if(!dms.string.isEmpty(locationListObj[itemCd])){
                 $('<input data-bind="value:' + options.field + '"  />')
                 .appendTo(container)
                 .kendoExtDropDownList({
                     dataTextField: "cmmCdNm"
                    ,dataValueField:"cmmCd"
                    ,dataSource:  locationListObj[itemCd][strgeCd]
                    ,change:function(e){
                        $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                     }
                 });
             }
          };

          giReasonCdDropDownEditor = function(container, options) {

              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  giReasonCdList
                 ,change:function(e){
                     $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                  }
              });
          };

        // 부품기타출고등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0808-151501"
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/ism/issue/selectEtcIssueItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 기타출고현황 검색조건 코드.
                            params["sEtcGiDocNo"] = $("#etcGiDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     data:function (result){
                         var dataLen = result.data.length;
                         for(var i = 0; i < dataLen; i = i + 1){
                             popItemObj[result.data[i].itemCd] = result.data[i].itemNm;;
                         }

                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"etcGiDocNo"
                      ,fields:{
                              etcGiDocNo      :{ type:"string", editable:false }
                            , etcGiDocLineNo  :{ type:"number", editable:false }
                            , itemCd          :{ type:"string" }
                            , itemNm          :{ type:"string" }
                            , unitCd          :{ type:"string" }
                            , borrowQty       :{ type:"number", editable:false }
                            , returnQty       :{ type:"number", editable:false }
                            , procQty         :{ type:"number" }
                            , qty             :{ type:"number" }
                            , stdStrgeCd      :{ type:"string" }
                            , strgeCd         :{ type:"string" }
                            , giReasonCd      :{ type:"string" }
                            , locCd           :{ type:"string" }
                            , retailPrc       :{ type:"number" }
                            , movingAvgPrc    :{ type:"number" }
                            , prc             :{ type:"number" }
                            , amt             :{ type:"number" }
                            , refDocNo        :{ type:"string", editable:false }
                            , refDocLineNo    :{ type:"number", editable:false }
                            , avlbStockQty    :{ type:"number" }
                        }
                    }
                }
            }
            , selectable :"multiple"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , multiSelectWithCheckbox:true
            , pageable:false
            , edit:function(e){
                var eles         = e.container.find("input"),
                    grid         = this,
                    rows         = e.sender.select(),
                    selectedItem = e.sender.dataItem(rows[0]),
                    input        = e.container.find(".k-input"),
                    mvtType      = $("#mvtTp").data("kendoExtDropDownList").value(),
                    itemList     = [],
                    fieldName    = grid.columns[e.container.index()].field,
                    pVal,
                    orgVal;


                if(fieldName === "amt" ||fieldName === "itemNm"||fieldName === "stdStrgeCd"||fieldName === "retailPrc"
                        ||fieldName === "movingAvgPrc"||fieldName === "avlbStockQty"||fieldName === "unitCd" ){
                     this.closeCell();
                }else if(fieldName === "itemCd"){

                    pVal = input.val();
                    orgVal = input.val();

                    input.keyup(function(){
                        pVal = input.val();
                    });

                    input.blur(function(){

                        if(dms.string.isEmpty($("#bpCd").val()) && $("#mvtTp").data("kendoExtDropDownList").value() !== '41'){
                            // 업체를 선택해주세요.
                            dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                            e.model.set('itemCd', orgVal);
                            return false;
                        }

                        if(dms.string.isEmpty($("#custCd").val()) && $("#mvtTp").data("kendoExtDropDownList").value() === '41'){
                            // 업체를 선택해주세요.
                            dms.notification.warning("<spring:message code='par.lbl.custCd' var='custCd' /><spring:message code='global.info.confirmMsgParam' arguments='${custCd}'/>");
                            e.model.set('itemCd', orgVal);
                            return false;
                        }


                        if(orgVal !== pVal){

                            if(popItemObj.hasOwnProperty(pVal)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = pVal;
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");

                                e.model.set('itemCd', orgVal);

                                return false;
                            }

                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/selectSalePrcItemByKey.do' />"
                               ,data:kendo.stringify({sItemCd:pVal, sPrcTp:'01'})
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {

                                   if (result.total === 1) {

                                       //내부출고인 경우
                                       if(mvtType === '41'){
                                           e.model.set('prc',          result.data[0].movingAvgPrc);

                                       }else{
                                           e.model.set('prc',          result.data[0].salePrcAmt);
                                       }

                                       e.model.set('itemCd',       result.data[0].itemCd);
                                       e.model.set('itemNm',       result.data[0].itemNm);
                                       e.model.set('unitCd',       result.data[0].stockUnitCd);
                                       e.model.set('qty',          1);
                                       //e.model.set('prc',          result.data[0].salePrcAmt);
                                       e.model.set('amt',          result.data[0].salePrcAmt);
                                       e.model.set('avlbStockQty', result.data[0].avlbStockQty);
                                       e.model.set('stdStrgeCd',   result.data[0].giStrgeCd);
                                       e.model.set('strgeCd',      result.data[0].giStrgeCd);
                                       e.model.set('movingAvgPrc', result.data[0].movingAvgPrc);
                                       e.model.set('retailPrc',    result.data[0].salePrcAmt);


                                       delete popItemObj[orgVal];

                                       popItemObj[pVal] = pVal;

                                       itemList.push(result.data[0].itemCd);

                                       fnSetLocCdObj(itemList);

                                   } else {
                                       dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                                       e.model.set('itemCd', orgVal);
                                   }
                               }
                               ,error:function(jqXHR,status,error) {
                                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                   e.model.set('itemCd', orgVal);
                               }

                           });
                        }

                    });

                }else if(fieldName === "prc"){
                   //내부출고인 경우
                    if(mvtType === '41'){
                        this.closeCell();
                    }
                }

             }
            , columns:[
                  {   //기타출고현황번호
                      title:"<spring:message code='par.lbl.etcGiDocNo' />"
                     ,field:"etcGiDocNo"
                     ,width:120
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"etcGiDocLineNo"
                     ,width:60
                     ,hidden:true
                  }
                 ,{   //차입문서번호
                      title:"<spring:message code='par.lbl.borrowDocNo' />"
                     ,field:"refDocNo"
                     ,width:120
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"refDocLineNo"
                     ,width:35
                     ,hidden:true
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:100
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.itemNm' />"
                     ,field:"itemNm"
                     ,width:180
                  }
                , {   //차입수량
                      title:"<spring:message code='par.lbl.borrowQty' />"
                     ,field:"borrowQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true
                  }
                , {   //반환수량
                      title:"<spring:message code='par.lbl.returnQty' />"
                     ,field:"returnQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true
                  }
                , {   //처리수량
                      title:"<spring:message code='par.lbl.procQty' />"
                     ,field:"procQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"qty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeUnitCd(unitCd)#'
                  }
                , {   //기준창고
                    title:"<spring:message code='par.lbl.stdStrgeCd' />"
                   ,field:"stdStrgeCd"
                   ,width:100
                   ,template:'#= changeStrgeCd(stdStrgeCd)#'
                   ,sortable:false
                }
                , {   //출고창고
                    title:"<spring:message code='par.lbl.giStrgeCd' />"
                   ,field:"strgeCd"
                   ,width:100
                   ,editor:giStrgeCdDropDownEditor
                   ,template:'#= changeStrgeCd(strgeCd)#'
                   ,sortable:false
                }
                , {   //로케이션
                    title:"<spring:message code='par.lbl.locationCd' />"
                   ,field:"locCd"
                   ,width:140
                   ,editor:giLocCdDropDownEditor
                   ,template:'#= changeGiLocCd(strgeCd, locCd)#'
                   ,sortable:false
                }
              , {   //이동평균단가
                    title:"<spring:message code='par.lbl.movingAvgPrc' />"
                   ,field:"movingAvgPrc"
                   ,width:90
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                   ,decimals:2
                }
              , {   //소매가
                    title:"<spring:message code='par.lbl.salePriceCost01' />"
                   ,field:"retailPrc"
                   ,width:80
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                   ,decimals:2
                }
              , {   //단가
                    title:"<spring:message code='par.lbl.prc' />"
                   ,field:"prc"
                   ,width:80
                   ,attributes:{ "style":"text-align:right"}
                   ,editor:changeAmtEditor
                   ,format:"{0:n2}"
                   ,decimals:2
                }
              , {   //금액
                    title:"<spring:message code='par.lbl.amt' />"
                   ,field:"amt"
                   ,width:90
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                   ,decimals:2
                }
              , {   //가용수량
                    title:"<spring:message code='par.lbl.avlbStockQty' />"
                   ,field:"avlbStockQty"
                   ,width:60
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n0}"
                   ,decimal:0
                   ,hidden:true
                }
              , {   //출고사유
                    title:"<spring:message code='par.lbl.giReasonCd' />"
                   ,field:"giReasonCd"
                   ,width:100
                   ,editor:giReasonCdDropDownEditor
                   ,template:'#= changeGiReasonCd(giReasonCd)#'
                   ,sortable:false
                }
            ]
        });

         // 단위
         changeUnitCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = unitCdObj[val];
             }
             return returnVal;
         };

         // 출고사유
         changeGiReasonCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = giReasonCdObj[val];
             }
             return returnVal;
         };

         // 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = strgeTpObj[val];
             }
             return returnVal;
         };

      // 로케이션
         changeGiLocCd = function(strgeCd, locCd){
             var returnVal = "";
             if(locCd != null && locCd != ""){
                 if(dms.string.isEmpty(locationObj[strgeCd])){
                     returnVal = '';
                 }else{
                     if(dms.string.isEmpty(locationObj[strgeCd][locCd])){
                         returnVal = '';
                     }else{
                         returnVal = locationObj[strgeCd][locCd];
                     }
                 }
             }else{
                 returnVal = '';
             }

             return returnVal;
         };

        // 부품기타출고 정보 조회.
        function selectEtcIssue(pEtcGiDocNo){

            $.ajax({
                url:"<c:url value='/par/ism/issue/selectEtcIssueByKey.do' />",
                data:JSON.stringify({ sEtcGiDocNo:pEtcGiDocNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                    partsJs.validate.groupObjAllDataSet(result);

                    $("#grid").data("kendoExtGrid").dataSource.read();

            });
        }


        //부품 팝업 열기 함수.
        function selectItemSalePrcPopupWindow(){

            selectShareStockGiItemPopupWindow = dms.window.popup({
                windowId:"ItemMasterPopup"
                , width:900
                , height:550
                , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
                , content:{
                      url:"<c:url value='/par/cmm/selectShareStockGiItemPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind"    :true
                        , "prcTp"       :'01'
                        , "itemDstinCd" :'02'
                        , "itemCd"      :''
                        , "selectable"  :"multiple"
                        , "callbackFunc":function(data){

                            var dataLen      = data.length,
                                gridData     = $("#grid").data("kendoExtGrid"),
                                popItemData  = {},
                                itemList     = [],
                                tDate,
                                rows;

                            for(var i = 0; i < dataLen; i = i + 1){
                                itemList.push(data[i].itemCd);
                            }
                            fnSetLocCdObj(itemList);

                            for(var i = 0; i < dataLen; i = i + 1){

                              //내부출고인 경우
                                if(mvtType === '41'){
                                    popItemData.prc            = data[i].movingAvgPrc;

                                }else{
                                    popItemData.prc            = data[i].salePrcAmt;
                                }

                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.unitCd         = data[i].stockUnitCd;
                                popItemData.qty            = data[i].giQty;
                                popItemData.borrowQty      = 0;
                                popItemData.returnQty      = 0;
                                popItemData.procQty        = 0;
                                //popItemData.prc          = data[i].salePrcAmt;
                                popItemData.stdStrgeCd     = data[i].giStrgeCd;
                                popItemData.strgeCd        = data[i].giStrgeCd;
                                popItemData.locCd          = '';
                                popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                                popItemData.retailPrc      = data[i].salePrcAmt;
                                popItemData.giReasonCd     = '';
                                popItemData.etcGiDocNo     = '';
                                popItemData.etcGiDocLineNo = null;
                                popItemData.refDocNo       = '';
                                popItemData.refDocLineNo   = null;
                                popItemData.avlbStockQty   = data[i].avlbStockQty;


                                if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                }else{
                                    popItemObj[data[i].itemCd] = data[i].itemNm;;
                                    gridData.dataSource.add(popItemData);
                                }


                            }

                            gridData.select(gridData.tbody.find(">tr"));
                            selectShareStockGiItemPopupWindow.close();

                            fnSetAmtInfo();
                        }
                    }
                }
            });
        }

        //차입문서추가 함수.
        function selectIssueEtcRentalPopupWindow(){

            issueEtcRentalPopupWindow = dms.window.popup({
                windowId:"IssueEtcRentalPopup"
                , title:"<spring:message code='par.title.issueEtcRental' />"   // 기타출고 렌탈
                , content:{
                    url:"<c:url value='/par/cmm/selectIssueEtcRentalPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind"    :true
                        , "bpCd"        :$("#bpCd").val()
                        , "bpNm"        :$("#bpNm").val()
                        , "selectable"  :"multiple"
                        , "callbackFunc":function(data){

                            var dataLen      = data.length,
                                gridData     = $("#grid").data("kendoExtGrid"),
                                popItemData  = {},
                                itemList     = [],
                                tDate,
                                rows;

                            for(var i = 0; i < dataLen; i = i + 1){
                                itemList.push(data[i].itemCd);
                            }
                            fnSetLocCdObj(itemList);

                            for(var i = 0; i < dataLen; i = i + 1){

                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.unitCd         = data[i].unitCd;
                                popItemData.qty            = 0;
                                popItemData.borrowQty      = data[i].borrowQty;
                                popItemData.returnQty      = data[i].returnQty;
                                popItemData.procQty        = data[i].borrowQty - data[i].returnQty;
                                popItemData.prc            = data[i].retailPrc;
                                popItemData.amt            = data[i].retailPrc;
                                popItemData.stdStrgeCd     = data[i].strgeCd;
                                popItemData.strgeCd        = data[i].strgeCd;
                                popItemData.locCd          = data[i].locCd;
                                popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                                popItemData.retailPrc      = data[i].retailPrc;
                                popItemData.giReasonCd     = '';
                                popItemData.etcGiDocNo     = '';
                                popItemData.etcGiDocLineNo = null;
                                popItemData.refDocNo       = data[i].etcGiDocNo;
                                popItemData.refDocLineNo   = data[i].etcGiDocLineNo;
                                popItemData.avlbStockQty   = data[i].avlbStockQty;


                                if(popItemObj.hasOwnProperty(data[i].itemCd)){
                                    //이미 등록되어있는 부품입니다.
                                    var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                    dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                }else{
                                    popItemObj[data[i].itemCd] = data[i].itemNm;;
                                    gridData.dataSource.add(popItemData);
                                }
                            }

                            gridData.select(gridData.tbody.find(">tr"));
                            issueEtcRentalPopupWindow.close();

                            fnSetAmtInfo();
                        }
                    }
                }
            });
        }

        function initPage(){
            var grid        = $("#grid").data("kendoExtGrid");

            //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            $("#grid").data("kendoExtGrid").dataSource.data([]);

            $("#totQty").closest(".k-numerictextbox").addClass("form_readonly");
            $("#totQty").data("kendoExtNumericTextBox").enable(false);
            $("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#totAmt").data("kendoExtNumericTextBox").enable(false);

            $("#mvtTp").data("kendoExtDropDownList").value('41');
            //$("#mvtTp").data("kendoExtDropDownList").enable(false);

            $("#btnBorrowAdd").data("kendoButton").enable(false);
            $("#btnBorrowDel").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);


            $("#receiverId").show();
            $("#othDlr").hide();
            $("#custTd").show();
            $("#bpTd").hide();

            grid.hideColumn('refDocNo');
            grid.hideColumn('refDocLineNo');
            grid.showColumn('qty');
            grid.hideColumn('borrowQty');
            grid.hideColumn('returnQty');
            grid.hideColumn('procQty');
            grid.showColumn('giReasonCd');

            popItemObj = {};

            //기타출고현황 관리에서 넘어온 경우
            if(!dms.string.isEmpty(pEtcGiDocNo)){
                selectEtcIssue(pEtcGiDocNo);
            }

        }



        initPage();
    });

    var venderSearchPopupWin;
    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                     "type":"default"
                    ,"bpTp":"02"
                    ,"autoBind":false
                    ,"callbackFunc":function(data){
                        $("#bpCd").val(data[0].bpCd);
                        $("#bpNm").val(data[0].bpNm);

                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='par.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {

                            $("#custCd").val(data[0].custNo);
                            $("#custNm").val(data[0].custNm);

                        }
                    }
                }
            }
        });
    }

    function fnSetAmtInfo(){
        var grid        = $("#grid").data("kendoExtGrid"),
            rows        = grid.tbody.find("tr"),
            totalAmt    = 0,
            totalQty    = 0,
            mvtTp,
            gridData;

        mvtTp = $("#mvtTp").data("kendoExtDropDownList").value();

        rows.each(function(index, row) {
            gridData = grid.dataSource.at(index);


            if(mvtTp === '48'){
                totalAmt = totalAmt + (Math.floor(gridData.prc) * Math.floor(gridData.procQty));
                totalQty = totalQty + Math.floor(gridData.procQty);
            }else{
                totalAmt = totalAmt + (Math.floor(gridData.prc) * Math.floor(gridData.qty));
                totalQty = totalQty + Math.floor(gridData.qty);
            }

        });
        $("#totQty").data("kendoExtNumericTextBox").value(totalQty);
        $("#totAmt").data("kendoExtNumericTextBox").value(totalAmt);
    }

    function fnChangeMvtTp(){
        var grid        = $("#grid").data("kendoExtGrid"),
            rows        = grid.tbody.find("tr"),
            mvtTp,
            gridData;

        mvtTp = $("#mvtTp").data("kendoExtDropDownList").value();
        $("#grid").data("kendoExtGrid").dataSource.data([]);

        if(mvtTp === '48'){//차입반환출고

            $("#btnBorrowAdd").data("kendoButton").enable(true);
            $("#btnBorrowDel").data("kendoButton").enable(true);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);

            $("#receiverId").hide();
            $("#othDlr").show();
            $("#custTd").hide();
            $("#bpTd").show();
            grid.showColumn('refDocNo');
            grid.showColumn('refDocLineNo');
            grid.hideColumn('qty');
            grid.showColumn('borrowQty');
            grid.showColumn('returnQty');
            grid.showColumn('procQty');
            grid.hideColumn('giReasonCd');
        }else if(mvtTp === '47'){//대여출고

            $("#btnBorrowAdd").data("kendoButton").enable(false);
            $("#btnBorrowDel").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);

            $("#receiverId").hide();
            $("#othDlr").show();
            $("#custTd").hide();
            $("#bpTd").show();
            grid.hideColumn('refDocNo');
            grid.hideColumn('refDocLineNo');
            grid.showColumn('qty');
            grid.hideColumn('borrowQty');
            grid.hideColumn('returnQty');
            grid.hideColumn('procQty');
            grid.hideColumn('giReasonCd');
        }else if(mvtTp === '41'){//내부출고

            $("#btnBorrowAdd").data("kendoButton").enable(false);
            $("#btnBorrowDel").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);

            $("#receiverId").show();
            $("#othDlr").hide();
            $("#custTd").show();
            $("#bpTd").hide();
            grid.hideColumn('refDocNo');
            grid.hideColumn('refDocLineNo');
            grid.showColumn('qty');
            grid.hideColumn('borrowQty');
            grid.hideColumn('returnQty');
            grid.hideColumn('procQty');
            grid.showColumn('giReasonCd');
        }
    }

    function fnSetLocCdObj(pItemList){

        var header = {
                sItemCdLst       :pItemList
        };

        $.ajax({
            url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
           ,data:kendo.stringify(header)
           ,type:'POST'
           ,dataType:'json'
           ,contentType:'application/json'
           ,async:false
           ,success:function(result) {

               if(result.total > 0){
                   for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                       if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                           if(locationListObj.hasOwnProperty(result.data[i].strgeCd)){

                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                           }else{
                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                               locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                           }

                           //locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }else{
                           locationListObj[result.data[i].itemCd] = {};
                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd] = [];
                           locationListObj[result.data[i].itemCd][result.data[i].strgeCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }


                       if(!locationObj.hasOwnProperty(result.data[i].strgeCd)){
                           locationObj[result.data[i].strgeCd] = {};
                           locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                       }else{

                           if(!locationObj[result.data[i].strgeCd].hasOwnProperty(result.data[i].locCd)){
                               locationObj[result.data[i].strgeCd][result.data[i].locCd] = result.data[i].locCd;
                           }
                       }

                   }
               }

           }
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               return false;
           }

       });
    }
</script>
<!-- //script -->

