<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript"
    src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 基础库存入库 -->
<div id="resizableContainer">
    <section class="group" id="iniStockSection">
    <div class="header_area">
        <div class="btn_left">
            <button class="btn_m btn_reset" id="btnInit">
                <spring:message code="par.btn.init" />
                <!-- 초기화 -->
            </button>
        </div>
        <div class="btn_right">
            <button class="btn_m" id="btnSave">
                <spring:message code="par.btn.salePriceCreate" />
                <!-- 생성 -->
            </button>
            <button class="btn_m hidden" id="btnCnfm">
                <spring:message code="par.btn.confirm" />
                <!-- 확정 -->
            </button>
            <button class="btn_m" id="btnCnfmNew">
                <spring:message code="par.btn.confirm" />
                <!-- 확정 -->
            </button>
            <button class="btn_m btn_cancel hidden" id="btnCancel">
                <spring:message code="par.btn.cancel" />
                <!--취소  -->
            </button>
        </div>
    </div>
    <div class="table_form" id="headerForm">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">
                        <span class="bu_required"><spring:message code="par.lbl.otherGrTp" /><!-- 기타입고유형 --></span>
                    </th>
                    <td class="required_area">
                        <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                    </td>
                    <th scope="row">
                        <span class="bu_required"><spring:message code="par.lbl.sBpCd" /><!-- 공급업체 --></span>
                    </th>
                    <td class="required_area">
                        <input id="bpCd" class="form_input form_required form_readonly" readonly>
                        <input id="bpTp" name="bpTp" class="form_input hidden" />
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.sBpNm" /><!-- 공급업체 -->
                    </th>
                    <td>
                        <input type="text" id="bpNm" class="form_input form_readonly" readonly>
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.initStockReceiveDocNo" />
                        <!-- 기초재고입고문서번호 -->
                    </th>
                    <td>
                        <div class="form_search">
                            <input type="text" id="etcGrDocNo" class="form_input form_readonly" readonly>
                            <a id="searchEtcGrDocNo"><!-- 검색 --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <spring:message code="par.lbl.itemQty" />
                        <!-- 수량총계 -->
                    </th>
                    <td>
                        <input id="itemQty" data-type="number" class="form_numeric" readonly />
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.itemCnt" /><!-- 품목수 -->
                    </th>
                    <td>
                      <input id="itemCnt" data-type="number" class="form_numeric" readonly>
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.amt" /><!-- 금액총계 -->
                    </th>
                    <td>
                        <input id="grTotAmt" data-type="number" class="form_numeric" readonly />
                    </td>
                    <th/>
                    <td>
                        <input id="remark" type="text" value="" class="form_input form_readonly hidden" readonly/>
                        <input id="updtDtStr" type="text" class="form_input hidden"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_add  btn_s_min5" id="btnGrForSearch">
                <spring:message code="global.lbl.grForSearch" />
            </button>
        </div>
    </div>

    <div class="table_grid">
        <!-- 부품기타입고 그리드 -->
        <div id="grid" class="resizable_grid"></div>
    </div>

    </section>
</div>
<!-- // 其他出库信息 -->
<!-- 기초재고입고
           -부품 정보 가져올때 도매가 가져옴(세금 포함)
           -세금 17%적용항 TAX_DDCT 정보에 적용함.
           -부품팝업은 판매팝업의 도매가임.
     -->
<!-- script -->
<script>
var toDt                = "${toDt}",
    sevenDtBf           = "${sevenDtBf}",
    sessionDlrCd        = "${dlrCd}",
    sessionDlrNm        = "${dlrNm}",
    gVatCd              = Number("${vatCd}"),
    unitCdObj           = {},
    strgeTpObj          = {},
    strgeTpList         = [],
    locationListObj     = {},
    locationObj         = {},
    mvtTpList           = [],
    existItemChkObj     = {},
    pEtcGrDocNo         = {},
    issueEtcFundListPopupWindow,
    changeAmtEditor,
    receiveEtcListPopupWindow,
    itemByBpCdPopupWindow,
    grStrgeCdDropDownEditor,
    grLocCdDropDownEditor;

    locationObj[' '] = "";

    <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
        if("31" === "${obj.cmmCd}"){
            mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
    </c:forEach>

    strgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    </c:forEach>

    if(dms.string.isEmpty(gVatCd)){
        console.log('gVatCd 값 없음!');
        //gVatCd = .16;
        gVatCd = .13;
    }
    console.log('gVatCd:',gVatCd);

        $(document).ready(function() {



           //기타출고유형선택
            $("#mvtTp").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:mvtTpList
                ,index:0
            });

           //총계
            $("#grTotAmt").kendoExtNumericTextBox({
                format:"n2"
               ,spinners:false
            });
            //총수량
            $("#itemCnt").kendoExtNumericTextBox({
                format:"n0"
               ,spinners:false
            });
            //총품목수
            $("#itemQty").kendoExtNumericTextBox({
                format:"n2"
               ,spinners:false
            });

            // 초기화 버튼
            $("#btnInit").kendoButton({
                click:function(e){
                    pEtcGrDocNo = '';
                    initPage();
                }
            });

         // 부품추가 버튼
            $("#btnGrForSearch").kendoButton({
                click:function(e){
                    selectItemPopupWindow();
                }
            });

           // 부품삭제 버튼
            $("#btnDelItem").kendoButton({
                click:function(e){

                    var grid = $("#grid").data("kendoExtGrid"),
                        rows = grid.select();


                    rows.each(function(index, row) {
                        var l_rowData = grid.dataItem(row);
                        delete existItemChkObj[l_rowData.itemCd];

                    });

                    rows.each(function(index, row) {
                        grid.removeRow(row);
                    });

                    fnSetAmtInfo();

                }
            });

           // 저장 버튼(등록)
            $("#btnSave").kendoButton({
                click:function(e){

                    var saveList      = [],
                        grid          = $("#grid").data("kendoExtGrid"),
                        rows          = grid.tbody.find("tr"),
                        mvtType       = $("#mvtTp").data("kendoExtDropDownList").value(),
                        lCrud         = '',
                        paramUrl      = '',
                        header;

                    if(dms.string.isEmpty($("#bpCd").val())){
                        // 딜러를 선택하십시오
                        dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                        saveList = [];
                        return false;
                    }

                    header = {
                            mvtTp           :mvtType
                          , bpCd            :$("#bpCd").val()
                          , remark          :$("#remark").val()
                    };

                    $.ajax({
                         url:"<c:url value='/par/pcm/receive/createReceiveInitByDataReg.do' />"
                        ,data:kendo.stringify(header)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result) {

                            if (result.resultYn == true) {
                                dms.notification.success("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");

                                pEtcGrDocNo = result.etcGrDocNo;
                                $('#etcGrDocNo').val(result.etcGrDocNo);

                                fnSetButton('01');

                                // 부품기타출고 조회.
                                selectEtcReceive(pEtcGrDocNo);
                            } else {
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGrDocNo}'/>");
                                }
                            }
                        }
                        ,beforeSend:function(){
                            dms.loading.show($("#iniStockSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#iniStockSection"));
                        }
                        ,error:function(jqXHR,status,error) {
                            //var errorJsonType = JSON.parse(jqXHR.responseText);
                            //console.log("error : ", errorJsonType.errors[0].errorMessage);
                            //dms.notification.error(errorJsonType.errors[0].errorMessage);
                        }
                    });
                 }
            });

            // 확정 버튼
            $("#btnCnfm").kendoButton({
                click:function(e){

                    var grid           = $("#grid").data("kendoExtGrid"),
                        rows           = grid.tbody.find("tr"),
                        mvtType        = $("#mvtTp").data("kendoExtDropDownList").value(),
                        header;

                    if(dms.string.isEmpty($("#bpCd").val())){
                        // 딜러를 선택하십시오
                        dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                        saveList = [];
                        return false;
                    }

                    header = {
                            mvtTp           :mvtType
                          , etcGrDocNo      :$('#etcGrDocNo').val()
                          , bpCd            :$("#bpCd").val()
                          , remark          :$("#remark").val()
                          , updtDtStr       :$("#updtDtStr").val()
                    };

                    $.ajax({
                        url:"<c:url value='/par/pcm/receive/createReceiveInitByDataCnfm.do' />"
                       ,data:kendo.stringify(header)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:true
                       ,success:function(result) {

                           if (result.resultYn == true) {
                               dms.notification.success("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");
                               pEtcGrDocNo = $('#etcGrDocNo').val();
                               fnSetButton('02');

                               // 부품기타입고 조회.
                               selectEtcReceive(pEtcGrDocNo);
                           } else {
                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${parSaleOrdNo}'/>");
                               }
                           }
                       }
                        ,beforeSend:function(){
                            dms.loading.show($("#iniStockSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#iniStockSection"));
                        }
                       ,error:function(jqXHR,status,error) {
                           //var errorJsonType = JSON.parse(jqXHR.responseText);
                           //console.log("error : ", errorJsonType.errors[0].errorMessage);
                           //dms.notification.error(errorJsonType.errors[0].errorMessage);
                       }

                   });
                }
            });

            // 확정 버튼(프로시저실행)
            $("#btnCnfmNew").kendoButton({
                click:function(e){

                    var grid           = $("#grid").data("kendoExtGrid"),
                        rows           = grid.tbody.find("tr"),
                        mvtType        = $("#mvtTp").data("kendoExtDropDownList").value(),
                        header;

                    if(dms.string.isEmpty($("#bpCd").val())){
                        // 딜러를 선택하십시오
                        dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                        saveList = [];
                        return false;
                    }

                    if(rows.length < 1){
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    header = {
                            mvtTp           :mvtType
                          , etcGrDocNo      :$('#etcGrDocNo').val()
                          , bpCd            :$("#bpCd").val()
                          , remark          :$("#remark").val()
                          , updtDtStr       :$("#updtDtStr").val()
                          , etcGrDocTp      : 'P'
                    };

                    $.ajax({
                        url:"<c:url value='/par/pcm/executeReceiveEtcInitProcedure.do' />"
                       ,data:kendo.stringify(header)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:true
                       ,success:function(result) {

                           if (result == true) {
                               dms.notification.success("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");
                               pEtcGrDocNo = $('#etcGrDocNo').val();
                               fnSetButton('02');
                               // 부품기타입고 조회.
                               selectEtcReceive(pEtcGrDocNo);
                               dms.loading.hide($("#iniStockSection"));
                           } else if(result == false){
                               dms.notification.error("please wait process not end !!");
                               dms.loading.show($("#iniStockSection"));
                           }else{
                               dms.loading.hide($("#iniStockSection"));
                           }
                       }
                        ,beforeSend:function(R){
                            //R.setRequestHeader ("connection", "keep-alive");
                            dms.loading.show($("#iniStockSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#iniStockSection"));
                        }
                       ,error:function(jqXHR,status,error) {
                           //var errorJsonType = JSON.parse(jqXHR.responseText);
                           //console.log("error : ", errorJsonType.errors[0].errorMessage);
                           //dms.notification.error(errorJsonType.errors[0].errorMessage);
                       }

                   });
                }
            });


            // 취소 버튼
            $("#btnCancel").kendoButton({
                click:function(e){

                    var mvtType       = $("#mvtTp").data("kendoExtDropDownList").value(),
                        header;


                    header = {
                            etcGrDocNo      :$('#etcGrDocNo').val()
                           ,bpCd            :$('#bpCd').val()
                           ,mvtTp           :mvtType
                           ,updtDtStr       :$("#updtDtStr").val()
                    };

                    $.ajax({
                        url:"<c:url value='/par/pcm/receive/cancelReceiveInitByKey.do' />"
                       ,data:kendo.stringify(header)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:true
                       ,success:function(result) {

                           if (result === true) {
                               dms.notification.success("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.info.delSuccessParam' arguments='${etcGrDocNo}'/>");

                               fnSetButton('03');

                               selectEtcReceive($("#etcGrDocNo").val());

                           } else {
                               if(result === 0){
                                   dms.notification.error("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.err.delFailedParam' arguments='${etcGrDocNo}'/>");
                               }
                           }
                       }
                        ,beforeSend:function(){
                            dms.loading.show($("#iniStockSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#iniStockSection"));
                        }
                       ,error:function(jqXHR,status,error) {
                           //var errorJsonType = JSON.parse(jqXHR.responseText);
                           //console.log("error : ", errorJsonType.errors[0].errorMessage);
                           //dms.notification.error(errorJsonType.errors[0].errorMessage);
                       }

                   });
                }
            });

            $("#searchEtcGrDocNo").on('click', selectReceiveEtcListPopupWindow);

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
                     options.model.set("taxAmt",     (options.model.prc * options.model.qty) - ((options.model.prc * options.model.qty)  / ( 1 + gVatCd )));
                     options.model.set("taxDdctAmt", (options.model.prc * options.model.qty)  / ( 1 + gVatCd ));
                     options.model.set("taxDdctPrc",  options.model.prc / ( 1 + gVatCd ));
                     //options.model.set("taxAmt",     (options.model.prc * options.model.qty) *  gVatCd);
                     //options.model.set("taxDdctAmt", (options.model.prc * options.model.qty) - ((options.model.prc * options.model.qty) *  gVatCd));
                     //options.model.set("taxDdctPrc",  options.model.prc - (options.model.prc *  gVatCd));
                     options.model.set("dcRate",      gVatCd);

                     fnSetAmtInfo();

                 });

                 input.appendTo(container);
                 if(options.field === 'qty') {
                     input.kendoExtNumericTextBox({
                         format: "n2"
                         ,decimals:2
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
                        options.model.set('locCd','');
                        $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                     }
                 });
             };

            grLocCdDropDownEditor = function(container, options) {

                var itemCd  = options.model.itemCd,
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

          // 부품기타입고등록 그리드
             $("#grid").kendoExtGrid({
                 gridId:"G-PAR-0808-161196"
                ,height:480
                ,dataSource:{
                     transport:{
                         read:{
                              url:"<c:url value='/par/pcm/receive/selectReceiveInitDataByKey.do' />"
                         }
                         , parameterMap:function(options, operation) {
                             if (operation === "read") {

                                 var params = {};

                                 params["recordCountPerPage"] = options.pageSize;
                                 params["pageIndex"]          = options.page;
                                 params["firstIndex"]         = options.skip;
                                 params["lastIndex"]          = options.skip + options.take;
                                 params["sort"]               = options.sort;

                                 // 기타출고현황 검색조건 코드.
                                 params["sEtcGrDocNo"] = $("#etcGrDocNo").val();
                                 params["sStatCd"]     = '02';
                                 params["sMvtTp"]      = $("#mvtTp").data("kendoExtDropDownList").value();

                                 return kendo.stringify(params);
                             }
                         }
                     }
                     ,schema:{
                          data:function (result){
                              var dataLen      = result.data.length,
                                  gridData     = $("#grid").data("kendoExtGrid"),
                                  popItemData  = {},
                                  itemList     = [];

                              for(var i = 0; i < dataLen; i = i + 1){
                                  itemList.push(result.data[i].itemCd);
                                  existItemChkObj[result.data[i].itemCd] = result.data[i].itemNm;
                              }

                              locationListObj = {};

                              if(dataLen > 0){
                                  fnSetLocCdObj(itemList);
                              }

                              return result.data;
                          }
                         ,total:"total"
                         ,model:{
                            id:"etcGrDocNo"
                           ,fields:{
                                   etcGrDocNo      :{ type:"string", editable:false }
                                 , etcGrDocLineNo  :{ type:"number", editable:false }
                                 , itemCd          :{ type:"string", editable:false  }
                                 , itemNm          :{ type:"string", editable:false  }
                                 , qty             :{ type:"number", editable:false  }
                                 , strgeCd         :{ type:"string", editable:false  }
                                 , grReasonCd      :{ type:"string", editable:false  }
                                 , locCd           :{ type:"string", editable:false  }
                                 , prc             :{ type:"number", editable:false  }
                                 , amt             :{ type:"number", editable:false  }
                                 , dcRate          :{ type:"number", editable:false  }
                                 , taxAmt          :{ type:"number", editable:false  }
                                 , taxDdctPrc      :{ type:"number", editable:false  }
                                 , taxDdctAmt      :{ type:"number", editable:false  }
                                 , refDocNo        :{ type:"string", editable:false  }
                                 , refDocLineNo    :{ type:"number", editable:false  }
                                 , receiveUsrNm    :{ type:"string", editable:false  }
                                 , grDt            :{ type:"date"  , editable:false  }
                                 , grTime          :{ type:"string", editable:false  }
                                 , cancQty         :{ type:"number" , editable:false }
                                 , cancDt          :{ type:"date"   , editable:false }
                                 , cancTime        :{ type:"string" , editable:false }
                                 , cancId          :{ type:"string" , editable:false }
                                 , cancUsrNm       :{ type:"string" , editable:false }
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
                 //, multiSelectWithCheckbox:true
                 , pageable:{
                        refresh:false
                       ,pageSize:100
                       ,buttonCount:3
                       ,input:false
                     }
                 , editable:false
                 , columns:[
                        {   //기초재고입고현황번호
                           title:"<spring:message code='par.lbl.initStockReceiveDocNo' />"
                          ,field:"etcGrDocNo"
                          ,width:140
                       }
                     , {   //Line
                           title:"<spring:message code='par.lbl.lineNm' />"
                          ,field:"etcGrDocLineNo"
                          ,width:60
                          ,hidden:true
                       }
                     , {   //부품번호
                           title:"<spring:message code='par.lbl.itemCd' />"
                          ,field:"itemCd"
                          ,width:140
                       }
                     , {   //부품명
                           title:"<spring:message code='par.lbl.itemNm' />"
                          ,field:"itemNm"
                          ,width:200
                       }
                     , {   //수량
                           title:"<spring:message code='par.lbl.qty' />"
                          ,field:"qty"
                          ,width:80
                          ,attributes:{ "style":"text-align:right"}
                          ,format:"{0:n2}"
                          ,decimal:2
                       }
                     , {   //단가
                           title:"<spring:message code='par.lbl.prc' />"
                          ,field:"prc"
                          ,width:80
                          ,attributes:{ "style":"text-align:right"}
                          ,format:"{0:n2}"
                          ,decimals:2
                       }
                     , {   //출고창고
                           title:"<spring:message code='par.lbl.grStrgeCd' />"
                          ,field:"strgeCd"
                          ,width:120
                          ,template:'#= changeStrgeCd(strgeCd)#'
                          ,sortable:false
                       }
                     , {   //로케이션
                           title:"<spring:message code='par.lbl.locationCd' />"
                          ,field:"locCd"
                          ,width:140
                          ,template:'#= changeGrLocCd(strgeCd, locCd)#'
                          ,sortable:false
                       }
                     , {   //금액
                           title:"<spring:message code='par.lbl.amt' />"
                          ,field:"amt"
                          ,width:90
                          ,attributes:{ "style":"text-align:right"}
                          ,format:"{0:n2}"
                          ,decimals:2
                       }
                     , {   //기타출고현황번호
                           title:"<spring:message code='par.lbl.etcGiDocNo' />"
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
                     , {   //입고사유
                           title:"<spring:message code='par.lbl.grReasonCd' />"
                          ,field:"grReasonCd"
                          ,width:100
                          ,sortable:false
                          ,hidden:true
                       }
                     , {   //입고일
                           title:"<spring:message code='global.lbl.grDt' />"
                          ,field:"grDt"
                          ,width:90
                          ,format:"{0:<dms:configValue code='dateFormat' />}"
                          ,attributes:{ "style":"text-align:center"}
                       }
                     , {   //입고시간
                           title:"<spring:message code='par.lbl.grTime' />"
                          ,field:"grTime"
                          ,attributes:{ "style":"text-align:center"}
                          ,width:90
                       }
                     , {   //수령인
                           title:"<spring:message code='par.lbl.receiverNm' />"
                          ,field:"receiveUsrNm"
                          ,width:80
                       }
                     , {   //취소수량
                         title:"<spring:message code='par.lbl.cancQty' />"
                        ,field:"cancQty"
                        ,width:60
                        ,attributes:{ "style":"text-align:right"}
                        ,format:"{0:n2}"
                        ,decimal:2
                     }
                   , {   //취소일
                         title:"<spring:message code='par.lbl.cancDt' />"
                        ,field:"cancDt"
                        ,width:80
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                        ,attributes:{ "style":"text-align:center"}
                     }
                   , {   //취소시간
                         title:"<spring:message code='par.lbl.cancTime' />"
                        ,field:"cancTime"
                        ,attributes:{ "style":"text-align:center"}
                        ,width:80
                     }
                   , {   //반품인
                         title:"<spring:message code='par.lbl.cancer' />"
                        ,field:"cancId"
                        ,width:80
                        ,hidden:true
                     }
                   , {   //반품인
                         title:"<spring:message code='par.lbl.cancer' />"
                        ,field:"cancUsrNm"
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
                     }//입고단가(세금미포함)
                     ,{
                           field:"taxAmt"
                          ,title:"<spring:message code='par.lbl.vatAmt' />"
                          ,width:80
                          ,attributes:{ "class":"ar"}
                          ,format:"{0:n2}"
                          ,hidden:true
                     }//세금
                     ,{
                           field:"taxDdctAmt"
                          ,title:"<spring:message code='par.lbl.amtTax' />"
                          ,width:80
                          ,attributes:{ "class":"ar"}
                          ,format:"{0:n2}"
                          ,hidden:true
                     }//입고금액(세금미포함)
                 ]
             });

             // 창고
             changeStrgeCd = function(val){
                 var returnVal = "";
                 if(!dms.string.isEmpty(val)){
                     if(!dms.string.isEmpty(strgeTpObj[val])){
                         returnVal = strgeTpObj[val];
                     }else{
                         returnVal = "";
                     }
                 }
                 return returnVal;
             };

            // 로케이션
             changeGrLocCd = function(strgeCd, locCd){
                 var returnVal = "";
                 if(!dms.string.isEmpty(locCd)){
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

        function initPage(){
            var grid        = $("#grid").data("kendoExtGrid");

            //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#headerForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            $("#grid").data("kendoExtGrid").dataSource.data([]);

            $("#itemCnt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#itemCnt").data("kendoExtNumericTextBox").enable(false);
            $("#grTotAmt").closest(".k-numerictextbox").addClass("form_readonly");
            $("#grTotAmt").data("kendoExtNumericTextBox").enable(false);
            $("#itemQty").closest(".k-numerictextbox").addClass("form_readonly");
            $("#itemQty").data("kendoExtNumericTextBox").enable(false);

            $("#mvtTp").data("kendoExtDropDownList").enable(false);
            $("#mvtTp").data("kendoExtDropDownList").value("31");

            $("#bpCd").val(sessionDlrCd);
            $("#bpNm").val(sessionDlrNm);
            $("#bpTp").val("03");

            existItemChkObj = {};


            fnSetButton();


        }

        var venderSearchPopupWin;
        function selectCustSearchPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                , title:"<spring:message code='par.title.othDlrSearch' />"   // 타딜러 조회
                , content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    , data:{
                          "autoBind"   :false
                        , "type"       :null
                        , "bpTp"       :"05"
                        , "remark2"    :"02"
                        , "bpDstinCd"  :"N"
                        , "callbackFunc":function(data){
                            if(data.length >= 1) {
                                $("#bpCd").val(data[0].bpCd);
                                $("#bpNm").val(data[0].bpNm);
                                $("#bpTp").val(data[0].bpTp);
                            }

                            venderSearchPopupWin.close();
                        }
                    }
                }
            });
        }

        function selectVenderMasterPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                ,title:"<spring:message code = 'par.title.venderSelect'/>"//공급업체조회
                ,width:840
                ,height:400
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"bpCd":$("#bpCd").val()
                        ,"bpNm":$("#bpNm").val()
                        ,"bpTp":''
                        ,"callbackFunc":function(data){

                            existItemChkObj = {};

                            initPage();
                            $("#bpCd").val(data[0].bpCd);  //공급업체 기본셋팅
                            $("#bpNm").val(data[0].bpNm);
                            $("#bpTp").val(data[0].bpTp);
                            $("#grid").data("kendoExtGrid").dataSource.data([]);

                            venderSearchPopupWin.close();
                        }
                    }
                }
            });
        }

       // 조달입고리스트 팝업 열기 함수.
        function selectReceiveEtcListPopupWindow(){

           /*
            if(dms.string.isEmpty($("#bpCd").val())){
                // 딜러를 선택하십시오
                dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                saveList = [];
                return false;
            }
           */

            receiveEtcListPopupWindow = dms.window.popup({
                windowId:"receiveEtcListPopupWindow"
                ,title:"<spring:message code='par.title.etcReceiveInfo' />"   // 기타입고정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectReceiveEtcListPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"mvtTp"    :$("#mvtTp").data("kendoExtDropDownList").value()
                        ,"mvtTpNm"  :$("#mvtTp").data("kendoExtDropDownList").text()
                        //,"statCd"   :"02"
                        ,"bpCd"     :$("#bpCd").val()
                        ,"bpNm"     :$("#bpNm").val()
                        ,"initDataYn"   :'Y'
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                $("#etcGrDocNo").val(data[0].etcGrDocNo);
                                pEtcGrDocNo = data[0].etcGrDocNo;

                                selectEtcReceive(pEtcGrDocNo);
                            }

                            receiveEtcListPopupWindow.close();
                        }
                    }
                }
            });
        }

      //부품 팝업 열기 함수.
        function selectItemPopupWindow(){

            receiveInitTargetListPopupWindow = dms.window.popup({
                windowId:"receiveInitTargetListPopup"
                , width:860
                , height:550
                , title:"<spring:message code='global.lbl.grForSearch' />"   // 입고대상 조회
                , content:{
                    url:"<c:url value='/par/cmm/selectReceiveInitTargetListPopup.do'/>"
                    , data:{
                        "type":""
                        , "autoBind"    :true
                        , "initDataYn":"N"
                        , "selectable"  :"multiple"
                        , "callbackFunc":function(data){
                            receiveInitTargetListPopupWindow.close();
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
                totalAmt = totalAmt + (gridData.prc * gridData.qty);
                totalQty = totalQty + gridData.qty;

            });
            $("#itemQty").data("kendoExtNumericTextBox").value(totalQty);
            $("#itemCnt").data("kendoExtNumericTextBox").value(rows.length);
            $("#grTotAmt").data("kendoExtNumericTextBox").value(totalAmt);
        }

        // 부품기타입고 정보 조회.
        function selectEtcReceive(pEtcGrDocNo){

            $.ajax({
                url:"<c:url value='/par/pcm/receive/selectReceiveEtcByKey.do' />",
                data:JSON.stringify({ sEtcGrDocNo:pEtcGrDocNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {
                partsJs.validate.groupObjAllDataSet(result);

                $("#grid").data("kendoExtGrid").dataSource.read();

                $("#bpCd").val(sessionDlrCd);
                $("#bpNm").val(sessionDlrNm);
                $("#bpTp").val("03");


                fnSetButton(result.statCd);

            });
        }

        function fnSetButton(pType){
            if(pType === '01'){
                $("#btnCancel").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCnfmNew").data("kendoButton").enable(true);
            }else if(pType === '02'){
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCnfmNew").data("kendoButton").enable(false);
            }else if(pType === '03'){
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnCnfmNew").data("kendoButton").enable(false);
            }else{
                $("#btnCancel").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnCnfmNew").data("kendoButton").enable(false);
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

