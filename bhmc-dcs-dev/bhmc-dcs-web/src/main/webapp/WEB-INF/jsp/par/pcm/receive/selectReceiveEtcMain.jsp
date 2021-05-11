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
                <button class="btn_m" id="btnLinkEtcReceiveList"><spring:message code="par.btn.etcReceiveList" /><!-- 기타입고현황 --></button>
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.otherGrTp" /><!-- 기타입고유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGrTp" />" class="form_comboBox">
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
                            <input id="etcGrDocNo" class="form_input form_readonly" readonly>
                        </td>
                    </tr>
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

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s btn_add"  id="btnAddItem"><spring:message       code="par.btn.itemPop" /></button>
                <button class="btn_s btn_add"  id="btnAdd"><spring:message           code="par.btn.add" /></button>
                <button class="btn_s btn_del"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
                <button class="btn_s btn_add"  id="btnRentAdd"><spring:message       code="par.btn.addRentDoc" /></button>
                <button class="btn_s btn_del"  id="btnRentDel"><spring:message       code="par.btn.delRentDoc" /></button>
                <button class="btn_s btn_add"  id="btnReturnAdd"><spring:message     code="par.btn.addRentReturnDoc" /></button>
                <button class="btn_s btn_del"  id="btnReturnDel"><spring:message     code="par.btn.delRentReturnDoc" /></button>
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
        locationListObj     = {},
        locationObj         = {},
        grReasonCdObj       = {},
        grReasonCdList      = [],
        popItemObj          = {},
        itemSalePrcPopupWindow,
        receiveEtcPopupWindow,
        popupWindow,
        venderSearchPopupWin,
        changeAmtEditor,
        changeUnitCd,
        changeItemDstinCd;


        locationObj[' '] = "";
        mvtTpList.push({cmmCd:"35", cmmCdNm:"차입입고"});
        mvtTpList.push({cmmCd:"36", cmmCdNm:"대여반환입고"});
        mvtTpList.push({cmmCd:"49", cmmCdNm:"재고실사차입고"});

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
                pEtcGrDocNo = ''; //기타입고현황 화면에서 넘어온 기타입고번호 삭제.
                initPage();
            }
        });

        //기타입고현황
        $("#btnLinkEtcReceiveList").kendoButton({
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
                if(dms.string.isEmpty($("#bpCd").val()) && $("#mvtTp").data("kendoExtDropDownList").value() !== '49'){
                    // 업체를 선택해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    return false;
                }

                 selectItemSalePrcPopupWindow();
            }
        });

        // 대여문서추가 버튼
        $("#btnRentAdd").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#bpCd").val())){
                    // 업체를 선택해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    return false;
                }

                selectReceiveEtcBorrowPopupWindow();
            }
        });

        // 차입반환문서추가 버튼
        $("#btnReturnAdd").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#bpCd").val())){
                    // 업체를 선택해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    return false;
                }

                selectReceiveEtcBorrowPopupWindow();
            }
        });

      //버튼 - 추가
        $("#btnAdd").kendoButton({
            click:function(e) {

                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                     "etcGrDocNo"        :''
                    ,"etcGrDocLineNo"    :null
                    ,"itemCd"            :''
                    ,"itemNm"            :''
                    ,"unitCd"            :''
                    ,"rentQty"         :0
                    ,"returnQty"         :0
                    ,"qty"               :0
                    ,"stdStrgeCd"        :''
                    ,"strgeCd"           :''
                    ,"grReasonCd"        :''
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
                    delete locationObj[l_rowData.itemCd];

                });

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });

        // 차입문서삭제 버튼
        $("#btnRentDel").kendoButton({
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

                if(dms.string.isEmpty($("#bpCd").val()) && mvtType !== '49'){
                    // 거래처를 입력해주세요
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    saveList = [];
                    return false;
                }


                if(mvtType === '49'){
                    //bpCd = $("#custCd").val();
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

                        if(dms.string.isEmpty(gridData.qty) || gridData.qty == 0){
                            // 수량을 입력하십시오.
                            dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='global.info.chkSelectItemMsg' arguments='${itemCd}'/>");
                            saveList = [];
                            return false;
                        }

                        //대여입고인 경우
                        if(mvtType === '35'){

                        //차입반환입고 인 경우
                        }else if(mvtType === '36'){

                        //재고조정입고인 경우
                        }else if(mvtType === '49'){

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
                                dms.notification.success("<spring:message code='par.lbl.etcGrDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");

                                console.log('result:',result);
                                pEtcGrDocNo = result.etcGrDocNo;
                                $('#etcGrDocNo').val(result.etcGrDocNo);
                                // 부품기타입고 조회.
                                selectEtcReceive(pEtcGrDocNo);

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

         /**
          * grid 입고창고 DropDownList
          */
          grStrgeCdDropDownEditor = function(container, options) {


              $('<input data-bind="value:' + options.field + '"  />')
              .appendTo(container)
              .kendoExtDropDownList({
                  dataTextField: "cmmCdNm"
                 ,dataValueField:"cmmCd"
                 ,dataSource:  strgeTpList
                 ,change:function(e){
                     $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                  }
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

        // 부품기타입고등록 그리드
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/receive/selectEtcReceiveItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 기타입고현황 검색조건 코드.
                            params["sEtcGrDocNo"] = $("#etcGrDocNo").val();

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
                       id:"etcGrDocNo"
                      ,fields:{
                              etcGrDocNo      :{ type:"string", editable:false }
                            , etcGrDocLineNo  :{ type:"number", editable:false }
                            , itemCd          :{ type:"string" }
                            , itemNm          :{ type:"string" }
                            , unitCd          :{ type:"string" }
                            , qty             :{ type:"number", editable:false  }
                            , stdStrgeCd      :{ type:"string" }
                            , strgeCd         :{ type:"string" }
                            , grReasonCd      :{ type:"string" }
                            , locCd           :{ type:"string" }
                            , prc             :{ type:"number" }
                            , amt             :{ type:"number" }
                            , refDocNo        :{ type:"string", editable:false }
                            , refDocLineNo    :{ type:"number", editable:false }
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

                if(fieldName === "amt" ||fieldName === "itemNm"||fieldName === "stdStrgeCd"||fieldName === "unitCd" ){
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

                        if(dms.string.isEmpty($("#bpCd").val()) && mvtType !== '49'){
                            // 업체를 선택해주세요.
                            dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                            e.model.set('itemCd', orgVal);
                            return false;
                        }

                        if(dms.string.isEmpty($("#custCd").val()) && mvtType === '49'){
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
                                url:"<c:url value='/par/pmm/itemMaster/selectSalePrcItemrcByKey.do' />"
                               ,data:kendo.stringify({sItemCd:pVal, sPrcTp:'01'})
                               ,type:'POST'
                               ,dataType:'json'
                               ,contentType:'application/json'
                               ,async:false
                               ,success:function(result) {

                                   if (result.total === 1) {

                                       //재고조정실사차입고인 경우
                                       if(mvtType === '49'){
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
                                       e.model.set('stdStrgeCd',   result.data[0].grStrgeCd);
                                       e.model.set('strgeCd',      result.data[0].grStrgeCd);
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

                }

             }
            , columns:[
                  {   //기타입고현황번호
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
                 ,{   //대여문서번호
                      title:"<spring:message code='par.lbl.rentDocNo' />"
                     ,field:"refDocNo"
                     ,width:120
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"refDocLineNo"
                     ,width:35
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
                , {   //대여수량
                      title:"<spring:message code='par.lbl.rentQty' />"
                     ,field:"rentQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
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
                , {   //입고창고
                    title:"<spring:message code='par.lbl.grStrgeCd' />"
                   ,field:"strgeCd"
                   ,width:100
                   ,editor:grStrgeCdDropDownEditor
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
              , {   //입고사유
                    title:"<spring:message code='par.lbl.grReasonCd' />"
                   ,field:"grReasonCd"
                   ,width:100
                   ,editor:grReasonCdDropDownEditor
                   ,template:'#= changeGrReasonCd(grReasonCd)#'
                   ,sortable:false
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

         // 입고사유
         changeGrReasonCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = grReasonCdObj[val];
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
        function selectItemSalePrcPopupWindow(){

            itemSalePrcPopupWindow = dms.window.popup({
                windowId:"ItemMasterPopup"
                , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
                , content:{
                    url:"<c:url value='/par/cmm/selectItemSalePrcPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind"    :true
                        , "prcTp"       :'01'
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

                              //재고실사차 입고인 경우
                                if(mvtType === '49'){
                                    popItemData.prc            = data[i].movingAvgPrc;

                                }else if(mvtType === '35'){ //차입입고인 경우
                                    popItemData.prc            = data[i].salePrcAmt;
                                }else if(mvtType === '36'){ //대여입고 반환인 경우

                                }

                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.unitCd         = data[i].stockUnitCd;
                                popItemData.qty            = 1;
                                popItemData.rentQty        = 0;
                                popItemData.returnQty      = 0;
                                //popItemData.prc            = data[i].salePrcAmt;
                                popItemData.stdStrgeCd     = data[i].grStrgeCd;
                                popItemData.strgeCd        = data[i].grStrgeCd;
                                popItemData.locCd          = '';
                                popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                                popItemData.retailPrc      = data[i].salePrcAmt;
                                popItemData.grReasonCd     = '';
                                popItemData.etcGrDocNo     = '';
                                popItemData.etcGrDocLineNo = null;
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
                            itemSalePrcPopupWindow.close();

                            fnSetAmtInfo();
                        }
                    }
                }
            });
        }

        //문서추가 함수.
        function selectReceiveEtcBorrowPopupWindow(){

            var popMvtTp,
                mvtTp;

            mvtTp = $("#mvtTp").data("kendoExtDropDownList").value();

            if(mvtTp === '35'){//차입입고인 경우
                popMvtTp = '47'; //대여출고
            }else if(mvtTp === '36'){//대여반환입고인 경우
                popMvtTp = '48'; //차입반환출고
            }else{
                return false;
            }


            receiveEtcPopupWindow = dms.window.popup({
                windowId:"ReceiveEtcPopup"
                , title:"<spring:message code='par.title.receiveEtcBorrow' />"   // 기타입고 차입
                , content:{
                    url:"<c:url value='/par/cmm/selectReceiveEtcPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind"    :true
                        , "bpCd"        :$("#bpCd").val()
                        , "bpNm"        :$("#bpNm").val()
                        , "mvtTp"       :popMvtTp
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

                                console.log('data['+i+']:',data[i]);
                                popItemData.itemCd         = data[i].itemCd;
                                popItemData.itemNm         = data[i].itemNm;
                                popItemData.unitCd         = data[i].unitCd;
                                popItemData.qty            = 0;
                                popItemData.rentQty      = data[i].rentQty;
                                popItemData.returnQty      = data[i].returnQty;
                                popItemData.prc            = data[i].retailPrc;
                                popItemData.amt            = data[i].retailPrc;
                                popItemData.stdStrgeCd     = data[i].strgeCd;
                                popItemData.strgeCd        = data[i].strgeCd;
                                popItemData.locCd          = data[i].locCd;
                                popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                                popItemData.retailPrc      = data[i].retailPrc;
                                popItemData.grReasonCd     = '';
                                popItemData.etcGrDocNo     = '';
                                popItemData.etcGrDocLineNo = null;
                                popItemData.refDocNo       = data[i].etcGrDocNo;
                                popItemData.refDocLineNo   = data[i].etcGrDocLineNo;
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
                            receiveEtcPopupWindow.close();

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

            $("#mvtTp").data("kendoExtDropDownList").value('35');
            //$("#mvtTp").data("kendoExtDropDownList").enable(false);

            $("#btnRentAdd").data("kendoButton").enable(true);
            $("#btnRentDel").data("kendoButton").enable(true);
            $("#btnReturnAdd").data("kendoButton").enable(false);
            $("#btnReturnDel").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);


            $("#receiverId").hide();
            $("#othDlr").show();
            $("#custTd").hide();
            $("#bpTd").show();

            grid.showColumn('qty');
            grid.showColumn('rentQty');
            grid.hideColumn('returnQty');
            grid.hideColumn('grReasonCd');

            popItemObj = {};

            //기타입고현황 관리에서 넘어온 경우
            if(!dms.string.isEmpty(pEtcGrDocNo)){
                selectEtcReceive(pEtcGrDocNo);
            }

        }



        initPage();
    });

    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderMasterPopup"
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

                            console.log(data);

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



            totalAmt = totalAmt + (Math.floor(gridData.prc) * Math.floor(gridData.qty));
            totalQty = totalQty + Math.floor(gridData.qty);

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

        if(mvtTp === '35'){//차입반환입고

            $("#btnRentAdd").data("kendoButton").enable(false);
            $("#btnRentDel").data("kendoButton").enable(false);
            $("#btnReturnAdd").data("kendoButton").enable(true);
            $("#btnReturnDel").data("kendoButton").enable(true);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);

            $("#receiverId").hide();
            $("#othDlr").show();
            $("#custTd").hide();
            $("#bpTd").show();
            grid.showColumn('refDocNo');
            grid.showColumn('refDocLineNo');
            grid.hideColumn('grReasonCd');

        }else if(mvtTp === '36'){//대여입고

            $("#btnRentAdd").data("kendoButton").enable(true);
            $("#btnRentDel").data("kendoButton").enable(true);
            $("#btnReturnAdd").data("kendoButton").enable(false);
            $("#btnReturnDel").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(false);
            $("#btnAdd").data("kendoButton").enable(false);
            $("#btnDelItem").data("kendoButton").enable(false);

            $("#receiverId").hide();
            $("#othDlr").show();
            $("#custTd").hide();
            $("#bpTd").show();
            grid.showColumn('refDocNo');
            grid.showColumn('refDocLineNo');
            grid.hideColumn('grReasonCd');
            grid.hideColumn('rentQty');
            grid.showColumn('qty');
        }else if(mvtTp === '49'){//재고실사차입고

            $("#btnRentAdd").data("kendoButton").enable(false);
            $("#btnRentDel").data("kendoButton").enable(false);
            $("#btnReturnAdd").data("kendoButton").enable(false);
            $("#btnReturnDel").data("kendoButton").enable(false);
            $("#btnAddItem").data("kendoButton").enable(true);
            $("#btnAdd").data("kendoButton").enable(true);
            $("#btnDelItem").data("kendoButton").enable(true);

            $("#receiverId").show();
            $("#othDlr").hide();
            $("#custTd").show();
            $("#bpTd").hide();
            grid.hideColumn('refDocNo');
            grid.hideColumn('refDocLineNo');
            grid.hideColumn('grReasonCd');
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
</script>
<!-- //script -->

