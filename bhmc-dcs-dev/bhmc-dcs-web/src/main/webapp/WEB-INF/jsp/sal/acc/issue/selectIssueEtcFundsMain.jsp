<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 其他出库信息 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><!-- 其他出库信息 --></h1>
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="par.btn.cancel" /><!--취소  --></button>
                <button class="btn_m btn_print" id="btnPrint" type="button"><spring:message code="par.btn.print" /><!--출력  --></button>
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.confirm" /><!-- 확정 --></button>
            </div>
        </div>
        <div class="table_form" id="headerForm">
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.otherGiTp" /><!-- 기타출고유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /></span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input id="bpCd" class="form_input form_required">
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dlrNm" /><!-- 딜러명 --></th>
                        <td>
                            <input type="text" id="bpNm" class="form_input form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="etcGiDocNo" class="form_input" readonly>
                                <a id="searchEtcGiDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.totalQty" /><!-- 수량총계 --></th>
                        <td>
                            <input id="totQty" name="totQty" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totalQty" />"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /><!-- 금액총계 --></th>
                        <td>
                            <input id="totAmt" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />"/>
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s" id="btnCopy" ><spring:message         code="par.btn.copyFromExcel" /><!-- btnCopyFromExcel --></button>
                <button class="btn_s btn_add"  id="btnAdd"><spring:message           code="par.btn.add" /></button>
                <button class="btn_s btn_del"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
            </div>
        </div>

        <div>
            <!-- 부품기타출고 그리드 -->
            <div id="grid" class="grid"></div>
        </div>

    </section>
    <!-- // 其他出库信息 -->

<!-- script -->
<script>
    var toDt                = "${toDt}",
        sevenDtBf           = "${sevenDtBf}",
        unitCdObj           = {},
        strgeTpObj          = {},
        strgeTpList         = [],
        locationListObj     = {},
        locationObj         = {},
        giReasonCdObj       = {},
        giReasonCdList      = [],
        mvtTpList           = [],
        popItemObj          = {},
        itemSalePrcPopupWindow,
        changeAmtEditor,
        changeUnitCd,
        venderSearchPopupWin,
        searchItemPopupWindow,
        venderSearchPopupWin,
        issueEtcListPopupWindow,
        giStrgeCdDropDownEditor,
        giLocCdDropDownEditor;

        locationObj[' '] = "";
        //mvtTpList.push({cmmCd:"61", cmmCdNm:"调拨出库"});

        <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
            if("61" === "${obj.cmmCd}"){
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

            // 초기화 버튼
            $("#btnInit").kendoButton({
                click:function(e){
                    initPage();
                }
            });


            //버튼 - 추가
            $("#btnAdd").kendoButton({
                click:function(e) {

                    if(dms.string.isEmpty($("#bpCd").val())){
                        // 업체를 선택해주세요.
                        dms.notification.warning("<spring:message code='par.lbl.dlrCd' var='dlrCd' /><spring:message code='global.info.confirmMsgParam' arguments='${dlrCd}'/>");
                        return false;
                    }
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
                        console.log("saveData::"+kendo.stringify(data),paramUrl );

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

                                    console.log('result:',result);
                                    pEtcGiDocNo = result.etcGiDocNo;
                                    $('#etcGiDocNo').val(result.etcGiDocNo);
                                    // 부품기타출고 조회.
                                    //selectEtcIssue(pEtcGiDocNo);
                                    $("#grid").data("kendoExtGrid").dataSource.read();

                                } else {
                                    console.log('errorResult:',result);
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

            $("#searchCustCd").on('click', selectCustSearchPopupWindow);
            $("#searchEtcGiDocNo").on('click', selectIssueEtcListPopupWindow);

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
                         options.model.set("taxAmt", (options.model.prc * pValue) *  0.17);
                     }else if(options.field === 'prc'){
                         pValue =  Number(Number($(this).val()).toFixed(2));
                         options.model.set("amt", pValue * options.model.qty);
                         options.model.set("taxAmt", (pValue * options.model.qty) *  0.17);
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
                        $(".grid-checkbox-item[data-uid=" + options.model.uid + "]").prop("checked", true);
                     }
                 });
             };

            giLocCdDropDownEditor = function(container, options) {

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
             */

            // 부품기타출고등록 그리드
            $("#grid").kendoExtGrid({
                gridId:"G-PAR-0808-151203"
               ,dataSource:{
                    transport:{
                        read:{
                             url:"<c:url value='/par/ism/issue/selectIssueEtcItemByKey.do' />"
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
                                , qty             :{ type:"number" }
                                , stdStrgeCd      :{ type:"string" }
                                , strgeCd         :{ type:"string" }
                                , giReasonCd      :{ type:"string" }
                                , locCd           :{ type:"string" }
                                , retailPrc       :{ type:"number" }
                                , prc             :{ type:"number" }
                                , amt             :{ type:"number" }
                                , taxAmt          :{ type:"number" }
                                , receiveId       :{ type:"string" }
                                , giDt            :{ type:"date"   }
                                , giTime          :{ type:"string" }
                                , cancQty         :{ type:"number" }
                                , cancDt          :{ type:"date"   }
                                , cancTime        :{ type:"string" }
                                , cancId          :{ type:"string" }
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

                    console.log('fieldName:',fieldName);
                    console.log('e.model:',e.model);

                    if(fieldName === "amt" ||fieldName === "itemNm"||fieldName === "retailPrc"||fieldName === "taxAmt"
                            ||fieldName === "unitCd"||fieldName === "receiveId"||fieldName === "cancDt"||fieldName === "cancTime"||fieldName === "cancId"  ){
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

                            if(dms.string.isEmpty($("#bpCd").val()) && $("#mvtTp").data("kendoExtDropDownList").value() === '41'){
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

                                           e.model.set('itemCd',       result.data[0].itemCd);
                                           e.model.set('itemNm',       result.data[0].itemNm);
                                           e.model.set('unitCd',       result.data[0].stockUnitCd);
                                           e.model.set('qty',          1);
                                           e.model.set('prc',          result.data[0].salePrcAmt);
                                           e.model.set('amt',          result.data[0].salePrcAmt);
                                           e.model.set('taxAmt',       result.data[0].salePrcAmt * 0.17);
                                           e.model.set('strgeCd',      result.data[0].giStrgeCd);
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
                      {   //기타출고현황번호
                          title:"<spring:message code='par.lbl.etcGiDocNo' />"
                         ,field:"etcGiDocNo"
                         ,width:120
                      }
                    , {   //Line
                          title:"<spring:message code='par.lbl.lineNm' />"
                         ,field:"etcGiDocLineNo"
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
                         ,editor:changeAmtEditor
                         ,format:"{0:n2}"
                         ,decimals:2
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
                         ,template:'#= changeGiLocCd(locCd)#'
                         ,sortable:false
                      }
                    , {   //소매가
                          title:"<spring:message code='par.lbl.salePriceCost01' />"
                         ,field:"retailPrc"
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
                      }
                    , {   //금액
                          title:"<spring:message code='par.lbl.amt' />"
                         ,field:"amt"
                         ,width:90
                         ,attributes:{ "style":"text-align:right"}
                         ,format:"{0:n2}"
                         ,decimals:2
                      }
                    , {   //세액
                          title:"<spring:message code='par.lbl.vatAmt' />"
                         ,field:"taxAmt"
                         ,width:90
                         ,attributes:{ "style":"text-align:right"}
                         ,format:"{0:n2}"
                         ,decimals:2
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
                         ,width:80
                         ,format:"{0:<dms:configValue code='dateFormat' />}"
                         ,attributes:{ "style":"text-align:center"}
                      }
                    , {   //출고시간
                          title:"<spring:message code='par.lbl.receiveTime' />"
                         ,field:"giTime"
                         ,attributes:{ "style":"text-align:center"}
                         ,width:80
                      }
                    , {   //수령인
                          title:"<spring:message code='par.lbl.receiveId' />"
                         ,field:"receiveId"
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
            /*
            changeGiReasonCd = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = giReasonCdObj[val];
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
            changeGiLocCd = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = locationObj[val];
                }
                return returnVal;
            };

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

                                    popItemData.itemCd         = data[i].itemCd;
                                    popItemData.itemNm         = data[i].itemNm;
                                    popItemData.unitCd         = data[i].stockUnitCd;
                                    popItemData.qty            = 1;
                                    popItemData.amt            = data[i].salePrcAmt;
                                    popItemData.taxAmt         = data[i].salePrcAmt * 0.17;
                                    popItemData.prc            = data[i].salePrcAmt;
                                    popItemData.strgeCd        = data[i].giStrgeCd;
                                    popItemData.locCd          = '';
                                    popItemData.retailPrc      = data[i].salePrcAmt;
                                    popItemData.giReasonCd     = '';
                                    popItemData.etcGiDocNo     = '';
                                    popItemData.etcGiDocLineNo = null;


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

                $("#totQty").closest(".k-numerictextbox").addClass("form_readonly");
                $("#totQty").data("kendoExtNumericTextBox").enable(false);
                $("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
                $("#totAmt").data("kendoExtNumericTextBox").enable(false);

                $("#mvtTp").data("kendoExtDropDownList").enable(false);
                $("#mvtTp").data("kendoExtDropDownList").value("61");

                popItemObj = {};

                fnAddRow(0);

            }


            initPage();

        });

        function selectCustSearchPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"customerSearchPopup"
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

                                console.log(data);
                                //if(data[0].bpCd !== "02"){
                                //    dms.notification.warning("<spring:message code='par.info.selectOnlyDealer'/>");
                                //    return false;
                                //}

                                $("#bpCd").val(data[0].bpCd);
                                $("#bpNm").val(data[0].bpNm);

                            }
                        }
                    }
                }
            });
        }

       // 조달출고리스트 팝업 열기 함수.
        function selectIssueEtcListPopupWindow(){

            issueEtcListPopupWindow = dms.window.popup({
                windowId:"issueEtcFundsListPopup"
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
                                $("#etcGiDocNo").val(data[0].etcGiDocNo);
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
                            issueEtcListPopupWindow.close();
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
                           locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }else{
                           locationListObj[result.data[i].itemCd] = [];
                           locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locCd});
                       }

                       if(!locationObj.hasOwnProperty(result.data[i].locCd)){
                           locationObj[result.data[i].locCd] = result.data[i].locCd;
                       }
                   }

               }
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   return false;
               }

           });
        }

        function fnAddRow(i){
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "etcGiDocNo"        :''
               ,"etcGiDocLineNo"    :null
               ,"itemCd"            :''
               ,"itemNm"            :''
               ,"unitCd"            :''
               ,"qty"               :0
               ,"strgeCd"           :''
               ,"giReasonCd"        :''
               ,"locCd"             :''
               ,"retailPrc"         :0
               ,"prc"               :0
               ,"amt"               :0
            });
        }

</script>
<!-- //script -->