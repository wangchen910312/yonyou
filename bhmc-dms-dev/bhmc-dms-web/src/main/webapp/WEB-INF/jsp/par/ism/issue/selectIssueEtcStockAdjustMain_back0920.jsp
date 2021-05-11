<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 기타출고정보 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.etcIssueInfo" /> --%><!-- 기타출고 정보 --></h1>
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
                <button class="btn_m btn_print" id="btnPrint" type="button"><spring:message code="par.btn.print" /><!--출력  --></button>
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.giTp" /><!-- 기타출고유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.investigationPrsId" /><!-- 재고실사 담당자 --></span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="piMngUsrId" class="form_input hidden" />
                                <input type="text" id="piMngUsrNm" class="form_input form_readonly" readonly />
                                <a id="searchPiMngUsrId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="etcGiDocNo" class="form_input form_readonly" readonly>
                                <a id="searchEtcGiDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></span></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sStockDdDocNo" class="form_input form_readonly" readonly>
                                <a id="searchStockDdDocNo"><!-- 검색 --></a>
                                <input type="text" id="sStrgeCd" class="form_input hidden">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.totalQty" /><!-- 수량총계 --></th>
                        <td>
                            <input id="totQty" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totalQty" />"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /><!-- 금액총계 --></th>
                        <td>
                            <input id="totAmt" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />"/>
                            <input id="bpCd" class="form_input form_required form_readonly hidden" readonly>
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td>
                            <input id="remark" type="text" value="" class="form_input">
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
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 부품기타출고 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //부품기타출고 -->

<!-- script -->
<script>

    var toDt                = "${toDt}",
        sevenDtBf           = "${sevenDtBf}",
        pEtcGiDocNo         = "${pEtcGiDocNo}",
        mvtTpChkObj         = {},
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
        issueEtcListPopupWindow,
        changeAmtEditor,
        changeUnitCd,
        changeItemDstinCd,
        searchItemPopupWindow,
        userSearchPopupWin,
        investigationListPopupWindow;

        mvtTpChkObj["43"] = '';
        mvtTpChkObj["45"] = '';

        locationObj[' '] = "";
        //mvtTpList.push({cmmCd:"43", cmmCdNm:"盘亏出库"}); //실사출고
        //mvtTpList.push({cmmCd:"45", cmmCdNm:"报损出库"}); //손실출고

        <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
            if(mvtTpChkObj.hasOwnProperty("${obj.cmmCd}")){
                mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
        </c:forEach>


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


        $("#searchStockDdDocNo").on('click', selectInvestigationListPopupWindow);
        $("#searchPiMngUsrId").on('click', userSearchPopup);
        $("#searchEtcGiDocNo").on('click', selectIssueEtcListPopupWindow);
        $("#mvtTp").on('change', fnChangeMvtTp);

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

      //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {
                selectItemSalePrcPopupWindow();
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

      //취소
        $("#btnCancel").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    mvtType       = $("#mvtTp").data("kendoExtDropDownList").value(),
                    header;


                header = {
                        etcGiDocNo      :$('#etcGiDocNo').val()
                       ,bpCd            :$('#bpCd').val()
                       ,mvtTp           :mvtType
                };

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                        delete gridData['giDt'];

                        saveList.push(gridData);
                });

                if(saveList.length > 0){
                    var data ={
                            "issueEtcVO":header
                           ,"issueEtcItemList":saveList
                        };

                    $.ajax({
                        url:"<c:url value='/par/ism/issue/cancelIssueEtc.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:false
                       ,success:function(result) {

                           if (result === true) {
                               dms.notification.success("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.info.delSuccessParam' arguments='${etcGiDocNo}'/>");

                               $("#btnCancel").data("kendoButton").enable(false);
                               $("#btnSave").data("kendoButton").enable(false);
                               $("#btnAdd").data("kendoButton").enable(false);
                               $("#btnDelItem").data("kendoButton").enable(false);


                               // 부품기타출고 조회.
                               selectEtcIssue($('#etcGiDocNo').val());

                           } else {

                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.err.delFailedParam' arguments='${etcGiDocNo}'/>");
                               }
                           }
                       }
                       ,error:function(jqXHR,status,error) {
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }

                   });
                }
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
                    header;

                header = {
                        mvtTp           :mvtType
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

                        if(dms.string.isEmpty(gridData.qty) || gridData.qty == 0){
                            // 수량을 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.chkSelectItemMsg' arguments='${qty}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.giReasonCd)){
                            // 출고 사유를 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.giReasonCd' var='giReasonCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${giReasonCd}'/>");
                            saveList = [];
                            return false;
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
                        ,async:false
                        ,success:function(result) {

                            if (result.resultYn == true) {
                                dms.notification.success("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGiDocNo}'/>");

                                $("#btnCancel").data("kendoButton").enable(true);
                                $("#btnAdd").data("kendoButton").enable(false);
                                $("#btnDelItem").data("kendoButton").enable(false);
                                $("#btnSave").data("kendoButton").enable(false);

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
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
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
                 options.model.set("amt",         options.model.prc * options.model.qty);
                 options.model.set("taxAmt",     (options.model.prc * options.model.qty) *  0);
                 options.model.set("taxDdctAmt", (options.model.prc * options.model.qty) - ((options.model.prc * options.model.qty) *  0));
                 options.model.set("taxDdctPrc", (options.model.prc) - (options.model.prc *  0));
                 options.model.set("dcRate",      0);

                 fnSetAmtInfo();

             });

             input.appendTo(container);
             input.kendoExtNumericTextBox({
                 min:0,
                 spinners:false
             });
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

          /*
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
          };*/

        // 부품기타출고등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-173303"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/investigation/selectInvestigationForIssueByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                         // 재고실사대상 검색조건 코드.
                            params["sStockDdDocNo"]      = $("#sStockDdDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                     data:function (result){
                         if(result.total === 0){
                             dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                             return false;
                         }
                         var dataLen  = result.data.length,
                             itemList = [];

                         for(var i = 0; i < dataLen; i = i + 1){
                             popItemObj[result.data[i].itemCd] = result.data[i].itemNm;;
                         }

                         for(var i = 0; i < dataLen; i = i + 1){
                             itemList.push(result.data[i].itemCd);
                         }
                         fnSetLocCdObj(itemList);

                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"etcGiDocNo"
                      ,fields:{
                              etcGiDocNo      :{ type:"string", editable:false }
                            , etcGiDocLineNo  :{ type:"number", editable:false }
                            , refDocNo        :{ type:"string", editable:false }
                            , refDocLineNo    :{ type:"number", editable:false }
                            , itemCd          :{ type:"string" }
                            , itemNm          :{ type:"string" }
                            , unitCd          :{ type:"string" }
                            , qty             :{ type:"number" }
                            , strgeCd         :{ type:"string" }
                            , locCd           :{ type:"string" }
                            //, retailPrc       :{ type:"number" }
                            //, movingAvgPrc    :{ type:"number" }
                            , prc             :{ type:"number" }
                            , amt             :{ type:"number" }
                            , taxAmt          :{ type:"number" }
                            , regUsrId        :{ type:"string" , editable:false }
                            , giDt            :{ type:"date"   , editable:false }
                            , giTime          :{ type:"string" , editable:false }
                            , cancQty         :{ type:"number" , editable:false }
                            , cancDt          :{ type:"date"   , editable:false }
                            , cancTime        :{ type:"string" , editable:false }
                            , cancId          :{ type:"string" , editable:false }
                            , dcRate          :{ type:"number" }
                            , taxDdctPrc      :{ type:"number" }
                            , taxDdctAmt      :{ type:"number" }
                            , giReasonCd      :{ type:"string" }
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

                if(fieldName === "amt" ||fieldName === "itemNm"||fieldName === "prc"
                        ||fieldName === "movingAvgPrc"||fieldName === "avlbStockQty"||fieldName === "unitCd"){
                     this.closeCell();
                }else if(fieldName === "qty"||fieldName === "strgeCd"){
                    if(mvtType !== '45'){
                        this.closeCell();
                    }
                }else if(fieldName === "itemCd"){
                    if(mvtType !== '45'){
                        this.closeCell();
                    }

                    pVal = input.val();
                    orgVal = input.val();

                    input.keyup(function(){
                        pVal = input.val();
                    });

                    input.blur(function(){

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

                                       e.model.set('itemCd',       result.data[0].itemCd);
                                       e.model.set('itemNm',       result.data[0].itemNm);
                                       e.model.set('unitCd',       result.data[0].stockUnitCd);
                                       e.model.set('qty',          1);
                                       e.model.set('prc',          result.data[0].movingAvgPrc);
                                       e.model.set('amt',          result.data[0].movingAvgPrc);
                                       e.model.set('avlbStockQty', result.data[0].avlbStockQty);
                                       e.model.set('strgeCd',      '');
                                       e.model.set('movingAvgPrc', result.data[0].movingAvgPrc);
                                       e.model.set('dcRate',       0);
                                       e.model.set('taxAmt',       result.data[0].movingAvgPrc * 0);
                                       e.model.set('taxDdctPrc',   result.data[0].movingAvgPrc - (result.data[0].movingAvgPrc * 0));
                                       e.model.set('taxDdctAmt',   result.data[0].movingAvgPrc - (result.data[0].movingAvgPrc * 0));
                                       //e.model.set('retailPrc',    result.data[0].salePrcAmt);


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

                }
             }
            , columns:[
                  {   //기타출고현황번호
                      title:"<spring:message code='par.lbl.giDocNo' />"
                     ,field:"etcGiDocNo"
                     ,width:120
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"etcGiDocLineNo"
                     ,width:60
                     ,hidden:true
                  }
                , {   //참조문서
                      title:"<spring:message code='par.lbl.etcGrDocNo' />"
                     ,field:"refDocNo"
                     ,width:120
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"refDocLineNo"
                     ,width:60
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
                , {   //수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"qty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n0}"
                     ,decimal:0
                  }
                , {   //단가
                    title:"<spring:message code='par.lbl.prc' />"
                   ,field:"prc"
                   ,width:80
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                   ,decimals:2
                }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeUnitCd(unitCd)#'
                     ,hidden:true
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
              , {   //금액
                    title:"<spring:message code='global.lbl.amt' />"
                   ,field:"amt"
                   ,width:90
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                   ,decimals:2
                }
              , {   //이동평균단가
                  title:"<spring:message code='par.lbl.movingAvgPrc' />"
                 ,field:"movingAvgPrc"
                 ,width:90
                 ,attributes:{ "style":"text-align:right"}
                 ,format:"{0:n2}"
                 ,decimals:2
                 ,hidden:true
              }
              , {   //세액
                  title:"<spring:message code='par.lbl.vatAmt' />"
                 ,field:"taxAmt"
                 ,width:90
                 ,attributes:{ "style":"text-align:right"}
                 ,format:"{0:n2}"
                 ,hidden:true
              }
            , {   //출고사유
                  title:"<spring:message code='par.lbl.giReasonCd' />"
                 ,field:"giReasonCd"
                 ,width:100
                 ,sortable:false
              }
            , {   //출고일
                  title:"<spring:message code='global.lbl.giDt' />"
                 ,field:"giDt"
                 ,width:160
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
                 ,attributes:{ "style":"text-align:center"}
              }
            , {   //출고시간
                  title:"<spring:message code='par.lbl.receiveTime' />"
                 ,field:"giTime"
                 ,attributes:{ "style":"text-align:center"}
                 ,hidden:true
                 ,width:80
              }
            , {   //출고인
                  title:"<spring:message code='ser.lbl.outUser' />"
                 ,field:"regUsrId"
                 ,width:80
              }
            , {   //취소수량
                  title:"<spring:message code='par.lbl.cancQty' />"
                 ,field:"cancQty"
                 ,width:60
                 ,attributes:{ "style":"text-align:right"}
                 ,format:"{0:n0}"
                 ,decimal:0
              }
            , {   //취소일
                  title:"<spring:message code='par.lbl.cancDt' />"
                 ,field:"cancDt"
                 ,width:140
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
                 ,attributes:{ "style":"text-align:center"}
              }
            , {   //취소시간
                  title:"<spring:message code='par.lbl.cancTime' />"
                 ,field:"cancTime"
                 ,attributes:{ "style":"text-align:center"}
                 ,width:80
                 ,hidden:true
              }
            , {   //반품인
                  title:"<spring:message code='par.lbl.cancer' />"
                 ,field:"cancId"
                 ,width:80
              }
            , {   //D/C Rate
                title:"<spring:message code='par.lbl.dcRate' />"
                    ,field:"dcRate"
                    ,width:60
                    ,attributes:{ "style":"text-align:right"}
                    ,format:"{0:n2}"
                    ,hidden:true
                }
               ,{
                     field:"taxDdctPrc"
                    ,title:"<spring:message code='par.lbl.taxDdctPrc' />"
                    ,width:80
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,hidden:true
               }//출고단가(세금미포함)
               ,{
                     field:"taxDdctAmt"
                    ,title:"<spring:message code='par.lbl.amtTax' />"
                    ,width:80
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,hidden:true
               }//출고금액(세금미포함)
/*
              , {   //소매가
                    title:"<spring:message code='par.lbl.salePriceCost01' />"
                   ,field:"retailPrc"
                   ,width:80
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                   ,decimals:2
                }
              , {   //가용수량
                    title:"<spring:message code='par.lbl.avlbStockQty' />"
                   ,field:"avlbStockQty"
                   ,width:80
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n0}"
                   ,decimal:0
                } */
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
         /*changeGiReasonCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = giReasonCdObj[val];
             }
             return returnVal;
         };*/

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

        initPage();
    });

 // 부품기타출고 정보 조회.
    function selectEtcIssue(pEtcGiDocNo){

        var mvtTp = $("#mvtTp").data("kendoExtDropDownList").value();

        $.ajax({
            url:"<c:url value='/par/ism/issue/selectIssueEtcByKey.do' />",
            data:JSON.stringify({ sEtcGiDocNo:pEtcGiDocNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }

        }).done(function(result) {

                partsJs.validate.groupObjAllDataSet(result);

                $.ajax({
                    url:"<c:url value='/par/ism/issue/selectIssueEtcItemByKey.do' />",
                    data:JSON.stringify({ sEtcGiDocNo:pEtcGiDocNo}),
                    type:"POST",
                    dataType:"json",
                    contentType:"application/json",
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }

                }).done(function(result) {
                    var datalen = result.data.length;

                    $("#grid").data("kendoExtGrid").dataSource.data([]);
                    $("#grid").data("kendoExtGrid").dataSource.data(result.data);

                });

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

                            popItemData.prc            = data[i].movingAvgPrc;
                            popItemData.amt            = Number(data[i].giQty) * Number(data[i].movingAvgPrc);
                            popItemData.itemCd         = data[i].itemCd;
                            popItemData.itemNm         = data[i].itemNm;
                            popItemData.unitCd         = data[i].stockUnitCd;
                            popItemData.qty            = data[i].giQty;
                            //popItemData.prc            = data[i].salePrcAmt;
                            popItemData.strgeCd        = '';
                            popItemData.locCd          = '';
                            popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                            //popItemData.retailPrc      = data[i].salePrcAmt;
                            popItemData.dcRate         = 0;
                            popItemData.taxDdctPrc     = data[i].movingAvgPrc - (data[i].movingAvgPrc * 0);
                            popItemData.taxAmt         = (Number(data[i].giQty) * Number(data[i].movingAvgPrc)) * 0;
                            popItemData.taxDdctAmt     = Number(data[i].giQty) * Number(data[i].movingAvgPrc) - ((Number(data[i].giQty) * Number(data[i].movingAvgPrc)) * 0);
                            popItemData.giReasonCd     = '';
                            popItemData.etcGiDocNo     = '';
                            popItemData.etcGiDocLineNo = null;
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

    function initPage(){
        var minDate = new Date(sevenDtBf),
        maxDate = new Date(toDt),
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

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

        $("#mvtTp").data("kendoExtDropDownList").value('43');

        $("#btnAdd").data("kendoButton").enable(false);
        $("#btnDelItem").data("kendoButton").enable(false);
        $("#btnCancel").data("kendoButton").enable(false);
        $("#btnSave").data("kendoButton").enable(true);

        $("#searchEtcGiDocNo").hide();

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();


        popItemObj = {};

        //기타출고현황 관리에서 넘어온 경우
        //if(!dms.string.isEmpty(pEtcGiDocNo)){
        //    selectEtcIssue(pEtcGiDocNo);
        //}

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
            totalAmt = totalAmt + (Math.floor(gridData.prc) * Math.floor(gridData.qty));
            totalQty = totalQty + Math.floor(gridData.qty);

        });
        $("#totQty").data("kendoExtNumericTextBox").value(totalQty);
        $("#totAmt").data("kendoExtNumericTextBox").value(totalAmt);
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

    // 손실 및 실사출고리스트 팝업 열기 함수.
    function selectIssueEtcListPopupWindow(){

        issueEtcListPopupWindow = dms.window.popup({
            windowId:"issueEtcStockAdjustListPopup"
            ,title:"<spring:message code='par.title.etcIssueInfo' />"   // 기타출고정보
            ,content:{
                url:"<c:url value='/par/cmm/selectIssueEtcListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"mvtTp"    :$("#mvtTp").data("kendoExtDropDownList").value()
                    ,"mvtTpNm"  :$("#mvtTp").data("kendoExtDropDownList").text()
                    ,"statCd"   :"02"
                    ,"bpCd"     :$("#bpCd").val()
                    ,"bpCdNm"   :$("#bpNm").val()
                    ,"callbackFunc":function(data){
                        if(data.length > 0)
                        {

                            $("#btnCancel").data("kendoButton").enable(true);
                            $("#btnAdd").data("kendoButton").enable(false);
                            $("#btnDelItem").data("kendoButton").enable(false);
                            $("#btnSave").data("kendoButton").enable(false);

                            $("#etcGiDocNo").val(data[0].etcGiDocNo);
                            pEtcGiDocNo = data[0].etcGiDocNo;
                            selectEtcIssue(pEtcGiDocNo);

                        }
                        issueEtcListPopupWindow.close();
                    }
                }
            }
        });
    }

    // 재고실사리스트 팝업 열기 함수.
    function selectInvestigationListPopupWindow(){

        investigationListPopupWindow = dms.window.popup({
            windowId:"investigationListPopup"
            ,title:"<spring:message code='par.title.stockDDDocInfo' />"   // 재고실사정보
            ,content:{
                url:"<c:url value='/par/cmm/selectInvestigationListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"docStatCd"   :"END"
                    ,"callbackFunc":function(data){
                        if(data.length > 0)
                        {
                            $("#sStockDdDocNo").val(data[0].stockDdDocNo);
                           /*  $("#sStrgeCd").val(data[0].strgeCd);
                            $("#sDocStatCd").data("kendoExtDropDownList").value(data[0].docStatCd);
                            $("#sPrsnId").val(data[0].prsnId);
                            $("#sApproveReqDt").data("kendoExtMaskedDatePicker").value(data[0].approveReqDt);
                            $("#sCancDt").data("kendoExtMaskedDatePicker").value(data[0].cancDt);
                            $("#sEndDt").data("kendoExtMaskedDatePicker").value(data[0].endDt);
                            $("#sRegDt").data("kendoExtMaskedDatePicker").value(data[0].regDt);
                            $("#sStockLockYn").data("kendoExtDropDownList").value(data[0].stockLockYn);
                            $("#sSignOpnCont").val(data[0].signOpnCont);
                            $("#remark").val(data[0].remark);

                            searchRemark = data[0].remark; */
                            $("#grid").data("kendoExtGrid").dataSource.read();

                        }
                        investigationListPopupWindow.close();
                    }
                }
            }
        });
    }

    function userSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#piMngUsrId").val(data[0].usrId);
                            $("#piMngUsrNm").val(data[0].usrNm);

                        }
                        userSearchPopupWin.close();
                    }
                }
            }

        });
    }

    function fnChangeMvtTp(e){
        var mvtTp = $("#mvtTp").data("kendoExtDropDownList").value();

        initPage();

        if(mvtTp === '43'){
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#searchStockDdDocNo").show();
            $("#searchEtcGiDocNo").hide();

        }else if(mvtTp === '45'){
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#searchStockDdDocNo").hide();
            $("#searchEtcGiDocNo").show();

        }

        $("#mvtTp").data("kendoExtDropDownList").value(mvtTp);
    }

    function fnAddRow(i){
        $('#grid').data('kendoExtGrid').dataSource.insert(0, {
            "etcGiDocNo"        :''
           ,"etcGiDocLineNo"    :null
           ,"refDocNo"          :''
           ,"refDocLineNo"      :null
           ,"itemCd"            :''
           ,"itemNm"            :''
           ,"unitCd"            :''
           ,"qty"               :0
           ,"giReasonCd"        :''
           ,"strgeCd"           :''
           ,"locCd"             :''
           //,"retailPrc"         :0
           //,"movingAvgPrc"      :0
           ,"prc"               :0
           ,"amt"               :0
           ,"avlbStockQty"      :0
        });
    }



</script>
<!-- //script -->

