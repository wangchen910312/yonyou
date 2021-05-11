<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 기타입고정보 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.etcReceiveInfo" /> --%><!-- 기타입고 정보 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
                <button class="btn_m" id="btnPrint">打印 <!-- 인쇄 --></button>
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:20%;">
                    <col style="width:10%;">
                    <col style="width:20%;">
                    <col style="width:10%;">
                    <col style="width:30%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.grTp" /><!-- 입고유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGrTp" />" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.investigationPrsId" /><!-- 담당자 --></span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="piMngUsrId" class="form_input hidden" />
                                <input type="text" id="piMngUsrNm" class="form_input form_readonly" readonly />
                                <a id="searchPiMngUsrId"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.etcGrDocNo" /><!-- 入库单号 --></th>
                        <td>
                            <input id="etcGrDocNo" class="form_input form_readonly" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input">
                        </td>

                        <th scope="row"><spring:message code="par.lbl.date" /><!-- 출고일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="form_left" style="width:25%;">
                                    <input id="dtTp" name="dtTp" class="form_comboBox">
                                </div>
                                <div class="form_right" style="width:75%;">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sGrDocRegDtFr" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sGrDocRegDtTo" class="form_datepicker">
                                        </div>
                                    </div>
                                </div>
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
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sStockDdDocNo" class="form_input" readonly>
                                <a id="searchStockDdDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button type="button" class="btn_s" id="btnCopy">从表格复制</button>
                <button class="btn_s btn_add"  id="btnAddItem"><spring:message       code="par.btn.itemPop" /></button>
                <button class="btn_s btn_add"  id="btnAdd"><spring:message           code="par.btn.add" /></button>
                <button class="btn_s btn_del"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div>
            <!-- 부품기타입고 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //부품기타입고 -->

<!-- script -->
<script>

    var toDt                = "${toDt}",
        pEtcGrDocNo         = "${pEtcGrDocNo}",
        mvtTpList           = [],
        unitCdObj           = {},
        strgeTpObj          = {},
        strgeTpList         = [],
        dtTpList            = [],
        locationListObj     = {},
        locationObj         = {},
        grReasonCdObj       = {},
        grReasonCdList      = [],
        popItemObj          = {},
        userSearchPopupWin,
        searchItemPopupWindow,
        investigationListPopupWindow,
        changeAmtEditor,
        changeUnitCd,
        changeItemDstinCd;


        locationObj[' '] = "";
        mvtTpList.push({cmmCd:"49", cmmCdNm:"盘亏入库"}); //TODO [InBoShim] 재고조정입고 중문교체해야함.
        mvtTpList.push({cmmCd:"59", cmmCdNm:"报溢入库"}); //TODO [InBoShim] 재고조정입고 중문교체해야함.

        dtTpList.push({cmmCd:"01", cmmCdNm:'<spring:message       code="par.lbl.receive" />'}); //TODO [InBoShim] 재고조정입고 중문교체해야함.
        dtTpList.push({cmmCd:"02", cmmCdNm:'<spring:message       code="par.lbl.cancel" />'}); //TODO [InBoShim] 재고조정입고 중문교체해야함.

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        strgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
            strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        </c:forEach>

        grReasonCdObj[' '] = "";
        <c:forEach var="obj" items="${grReasonCdList}" varStatus="status">
            grReasonCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            grReasonCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        </c:forEach>

    $(document).ready(function() {

        //기타입고유형선택
        $("#mvtTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mvtTpList
            ,index:0
        });

      //날짜구분
        $("#dtTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:dtTpList
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

        $("#searchPiMngUsrId").on('click', userSearchPopup);
        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchStockDdDocNo").on('click', selectInvestigationListPopupWindow);

        $("#mvtTp").on('change', fnChangeMvtTp);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pEtcGrDocNo = ''; //기타입고현황 화면에서 넘어온 기타입고번호 삭제.
                initPage();
            }
        });

        //인쇄
        $("#btnPrint").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready'/>");
            }
        });

        //취소
        $("#btnCancel").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready'/>");
            }
        });

        //카피
        $("#btnCopy").kendoButton({
            click:function(e){
                dms.notification.warning("<spring:message code='global.info.ready'/>");
            }
        });


        // 부품추가 버튼
        $("#btnAddItem").kendoButton({
            click:function(e){
                 selectSearchItemPopupWindow();
            }
        });



      //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {

                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                     "etcGrDocNo"        :$('#etcGrDocNo').val()
                    ,"etcGrDocLineNo"    :null
                    ,"refDocNo"          :''
                    ,"refDocLineNo"      :null
                    ,"itemCd"            :''
                    ,"itemNm"            :''
                    ,"unitCd"            :''
                    ,"qty"               :0
                    ,"strgeCd"           :''
                    ,"grReasonCd"        :''
                    ,"locCd"             :''
                   // ,"retailPrc"         :0
                   // ,"movingAvgPrc"      :0
                    ,"prc"               :0
                    ,"amt"               :0
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
                    delete locationObj[l_rowData.itemCd];

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

                header = {
                        mvtTp           :mvtType
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
                            dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                            saveList = [];
                            return false;
                        }

                        if(dms.string.isEmpty(gridData.grReasonCd)){
                            // 입고 사유를 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.grReasonCd' var='grReasonCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${grReasonCd}'/>");
                            saveList = [];
                            return false;
                        }



                        saveList.push(gridData);
                    }
                });

                if(saveList.length > 0){
                    var data ={
                            "receiveEtcVO":header
                           ,"receiveEtcItemList":saveList
                        };
                    console.log("saveData::"+kendo.stringify(data),paramUrl );

                    $.ajax({
                         url:"<c:url value='/par/pcm/receive/createReceiveEtc.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,success:function(result) {

                            if (result.resultYn == true) {
                                dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.regSuccessParam' arguments='${stockDdDoc}'/>");

                                console.log('result:',result);
                                pEtcGrDocNo = result.etcGrDocNo;
                                $('#etcGrDocNo').val(result.etcGrDocNo);
                                // 부품기타입고 조회.
                                //selectEtcReceive(pEtcGrDocNo);

                            } else {
                                console.log('errorResult:',result);
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.etcGrDocNo' var='etcGrDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGrDocNo}'/>");
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
                 if(options.field === 'qty'){
                     pValue = Math.floor( $(this).val());
                     options.model.set("amt", options.model.prc * pValue);
                 }else if(options.field === 'prc'){
                     pValue =  Number(Number($(this).val()).toFixed(2));
                     options.model.set("amt", pValue * options.model.qty);
                 }

                 fnSetAmtInfo();

             });

             input.appendTo(container);
             input.kendoExtNumericTextBox({
                 min:0,
                 spinners:false
             });
         };

         grLocCdDropDownEditor = function(container, options) {

             var itemCd = options.model.itemCd;

              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  locationListObj[itemCd]
                 ,change:function(e){
                     $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                  }
              });
          };

          /*
          grReasonCdDropDownEditor = function(container, options) {

              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  grReasonCdList
                 ,change:function(e){
                     $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                  }
              });
          };
          */

        // 부품기타입고등록 그리드
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/stm/investigation/selectInvestigationForReserveByKey.do' />"
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
                         }else{
                             var dataLen = result.data.length;
                             for(var i = 0; i < dataLen; i = i + 1){
                                 popItemObj[result.data[i].itemCd] = result.data[i].itemNm;;
                             }
                         }

                         console.log('result:',result);
                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"etcGrDocNo"
                      ,fields:{
                              etcGrDocNo      :{ type:"string", editable:false }
                            , etcGrDocLineNo  :{ type:"number", editable:false }
                            , refDocNo        :{ type:"string", editable:false }
                            , refDocLineNo    :{ type:"number", editable:false }
                            , itemCd          :{ type:"string" }
                            , itemNm          :{ type:"string" }
                            , unitCd          :{ type:"string" }
                            , qty             :{ type:"number"}
                            , strgeCd         :{ type:"string" }
                            , locCd           :{ type:"string" }
                            //, retailPrc       :{ type:"number" }
                            //, movingAvgPrc    :{ type:"number" }
                            , prc             :{ type:"number" }
                            , amt             :{ type:"number" }
                            , grReasonCd      :{ type:"string" }
                            , avlbStockQty    :{ type:"number" }
                        }
                    }
                }
            }
            , selectable :"multiple"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
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

                console.log('fieldName:',fieldName);
                console.log('e.model:',e.model);

                if(fieldName === "amt" ||fieldName === "itemNm"||fieldName === "strgeCd"||fieldName === "qty"||fieldName === "prc"
                    ||fieldName === "movingAvgPrc"||fieldName === "avlbStockQty"||fieldName === "unitCd" ){
                     this.closeCell();
                }else if(fieldName === "itemCd"){
                    console.log('eles:', eles);
                    console.log('input:', input);
                    pVal = input.val();
                    orgVal = input.val();

                    console.log('pVal:', pVal);
                    console.log('selectedItem:', selectedItem);


                    input.keyup(function(){
                        pVal = input.val();
                    });

                    input.blur(function(){

                        console.log('a:',pVal, orgVal);
                        console.log('a:',popItemObj);


                        if(orgVal !== pVal){

                            if(popItemObj.hasOwnProperty(pVal)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = pVal;
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");

                                e.model.set('itemCd', orgVal);

                                return false;
                            }

                            $.ajax({
                                url:"<c:url value='/par/pmm/itemMaster/selectSalePrcItemrcByKey.do' />"
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
                                       //e.model.set('movingAvgPrc', result.data[0].movingAvgPrc);
                                       //e.model.set('retailPrc',    result.data[0].salePrcAmt);
                                       //e.model.set('retailPrc',    0);


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
                  {   //입고문서
                      title:"<spring:message code='par.lbl.etcGrDocNo' />"
                     ,field:"etcGrDocNo"
                     ,width:120
                     ,hidden:true
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"etcGrDocLineNo"
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
                , {   //입고창고
                    title:"<spring:message code='par.lbl.grStrgeCd' />"
                   ,field:"strgeCd"
                   ,width:100
                   ,template:'#= changeStrgeCd(strgeCd)#'
                   ,sortable:false
                }
                , {   //로케이션
                    title:"<spring:message code='par.lbl.locationCd' />"
                   ,field:"locCd"
                   ,width:140
                   ,editor:grLocCdDropDownEditor
                   ,template:'#= changeGrLocCd(locCd)#'
                   ,sortable:false
                }
             /* , {   //이동평균단가
                    title:"<spring:message code='par.lbl.movingAvgPrc' />"
                   ,field:"movingAvgPrc"
                   ,width:90
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                   ,decimals:2
                   ,hidden:true
                }
              , {   //소매가
                   title:"<spring:message code='par.lbl.salePriceCost01' />"
                  ,field:"retailPrc"
                  ,width:80
                  ,attributes:{ "style":"text-align:right"}
                  ,format:"{0:n2}"
                  ,decimals:2
                  ,hidden:true
                }
              , {   //가용수량
                  title:"<spring:message code='par.lbl.avlbStockQty' />"
                 ,field:"avlbStockQty"
                 ,width:80
                 ,attributes:{ "style":"text-align:right"}
                 ,format:"{0:n0}"
                 ,decimal:0
              }
              */
              , {   //금액
                    title:"<spring:message code='par.lbl.amt' />"
                   ,field:"amt"
                   ,width:90
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                   ,decimals:2
                }
              , {   //입고사유
                    title:"<spring:message code='par.lbl.grReasonCd' />"
                   ,field:"grReasonCd"
                   ,width:100
                  // ,editor:grReasonCdDropDownEditor
                  // ,template:'#= changeGrReasonCd(grReasonCd)#'
                   ,sortable:false
                }
              , {   //处理者
                  title:"处理者"
                 ,width:100
              }
            , {   //출고일자
                  title:"<spring:message code='par.lbl.grDocRegDt' />"
                 ,width:100
              }
            , {   //출고시간
                  title:"<spring:message code='par.lbl.grTime' />"
                 ,width:100
              }
            , {   //취소수량
                  title:"<spring:message code='global.lbl.cancQty' />"
                 ,width:100
              }
            , {   //취소일자
                  title:"<spring:message code='global.lbl.cancDt' />"
                 ,width:100
              }
            , {   //취소시간
                  title:"<spring:message code='par.lbl.giReasonCd' />"
                 ,width:100
              }
            , {   //취소인
                  title:"取消者"
                 ,width:100
              }
              , { field:"" }
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

         /*
         // 입고사유
         changeGrReasonCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = grReasonCdObj[val];
             }
             return returnVal;
         };
         */


         // 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = strgeTpObj[val];
             }
             return returnVal;
         };

         // 로케이션
         changeGrLocCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = locationObj[val];
             }
             return returnVal;
         };

        // 부품기타입고 정보 조회.
        function selectEtcReceive(pEtcGrDocNo){

            $.ajax({
                url:"<c:url value='/par/pcm/receive/selectEtcReceiveByKey.do' />",
                data:JSON.stringify({ sEtcGrDocNo:pEtcGrDocNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {


                    console.log('selectEtcReceive result:', result);

                    partsJs.validate.groupObjAllDataSet(result);

                    $("#grid").data("kendoExtGrid").dataSource.read();


            });
        }


        //부품 팝업 열기 함수.
        function selectSearchItemPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"ItemMasterPopup"
                , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
                , content:{
                    url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind"    :true
                        , "itemDstinCd" :'02'
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
                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.unitCd         = data[i].stockUnitCd;
                                popItemData.qty            = 1;
                                //popItemData.prc            = data[i].salePrcAmt;
                                popItemData.strgeCd        = '';
                                popItemData.locCd          = '';
                                //popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                                popItemData.grReasonCd     = '';
                                popItemData.etcGrDocNo     = $('#etcGrDocNo').val();
                                popItemData.etcGrDocLineNo = null;
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
                            searchItemPopupWindow.close();

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

            $("#mvtTp").data("kendoExtDropDownList").value('49');
           // $("#mvtTp").data("kendoExtDropDownList").enable(false);

            $("#btnCopy").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);

            $("#searchStockDdDocNo").show();

            popItemObj = {};

            //기타입고현황 관리에서 넘어온 경우
            if(!dms.string.isEmpty(pEtcGrDocNo)){
                selectEtcReceive(pEtcGrDocNo);
            }

        }

        initPage();
    });

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

 // 부품 팝업 열기 함수.
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
            windowId:"partsMasterPopup"
            ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
            ,content:{
                url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"itemCd":$("#sItemCd").val()
                    ,"callbackFunc":function(data){
                        if(data.length > 0)
                        {
                            $("#sItemCd").val(data[0].itemCd);
                            $("#sItemNm").val(data[0].itemNm);
                        }
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
                       // userSearchPopupWin.close();
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

               for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                   if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                       locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
                   }else{
                       locationListObj[result.data[i].itemCd] = [];
                       locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
                   }

                   if(!locationObj.hasOwnProperty(result.data[i].locCd)){
                       locationObj[result.data[i].locCd] = result.data[i].locNm;
                   }
               }

           }
           ,error:function(jqXHR,status,error) {
               dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               return false;
           }

       });
    }

    function fnChangeMvtTp(e){
        if($("#mvtTp").data("kendoExtDropDownList").value() === '49'){
            $("#btnCopy").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);

            $("#searchStockDdDocNo").show();
        }else if($("#mvtTp").data("kendoExtDropDownList").value() === '59'){
            $("#btnCopy").data("kendoButton").enable(true);
            $("#btnAddItem").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#searchStockDdDocNo").hide();
        }

    }
</script>
<!-- //script -->

