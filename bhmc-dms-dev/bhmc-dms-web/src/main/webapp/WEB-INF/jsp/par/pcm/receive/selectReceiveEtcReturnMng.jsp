<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 기타입고정보 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.etcReceiveInfo" /> --%><!-- 기타입고 정보 --></h1>
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
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
                    <tr class="hidden">
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.otherGrTp" /><!-- 기타입고유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGrTp" />" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.receiveEtcReturnNo" /><!-- 차출반환입고번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="etcGrDocNo" class="form_input form_readonly" readonly>
                                <a id="searchEtcGrDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.receiveEtcReturnDt" /><!-- 차출반환입고일자 --></th>
                        <td class="readonly_area">
                            <input id="regDt" type="text" value="" class="form_datepicker" data-type="maskDate" readonly>
                        </td>
                        <th scope="row"><span class="bu_required" id="othDlr"><spring:message code="par.lbl.bpCstCd" /><!-- 업무고객코드 --></span></th>
                        <td class="required_area" >
                            <div class="form_search" id="bpTd">
                                <input type="text" id="bpNm" class="form_input form_readonly"  readonly/>
                                <input type="text" id="bpCd" class="form_input hidden" />
                                <a id="searchBpCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row">
                            <span><spring:message code="par.lbl.ownDlrCd" /><!-- 딜러코드 --></span>
                        </th>
                        <td class="required_area" >
                            <input type="text" id="dlrCd" class="form_input form_readonly"  readonly/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td colspan="7">
                            <input id="remark" type="text" value="" class="form_input">
                            <input id="updtDtStr" type="text" class="form_input hidden" />
                        </td>
                        <th/>
                        <td/>
                         <!--
                        <th scope="row"><spring:message code="par.lbl.totalQty" /></th>
                        <td>
                            <input id="totQty" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totalQty" />"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmt" /></th>
                        <td>
                            <input id="totAmt" name="totAmt" data-type="number" min="1" class="form_numeric" readonly data-name="<spring:message code="par.lbl.totAmt" />"/>
                        </td>
                        -->
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s btn_add btn_s_min5"  id="btnReturnAdd"><spring:message     code="par.btn.addRentReturnDoc" /></button>
                <button class="btn_s btn_del btn_s_min5"  id="btnReturnDel"><spring:message     code="par.btn.delRentReturnDoc" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 부품기타입고 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>
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
        popItemObj          = {},
        issueEtcPopupWindow,
        customerSearchPopupWin,
        receiveEtcListPopupWindow,
        changeAmtEditor,
        changeUnitCd,
        changeItemDstinCd;


        locationObj[' '] = "";
        //mvtTpList.push({cmmCd:"36", cmmCdNm:"借出归还入库"}); //TODO [InBoShim] 대여반환입고 중문교체.
        <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
            if("36" === "${obj.cmmCd}"){
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

    $(document).ready(function() {

        //기타입고유형선택
        $("#mvtTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mvtTpList
            ,index:0
        });

        /*
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
        */

        $("#regDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pEtcGrDocNo = ''; //기타입고현황 화면에서 넘어온 기타입고번호 삭제.
                initPage();
            }
        });

        $("#searchBpCd").on('click', selectVenderMasterPopupWindow);
        $("#searchEtcGrDocNo").on('click', selectReceiveEtcListPopupWindow);

        // 대여문서추가 버튼
        $("#btnReturnAdd").kendoButton({
            click:function(e){
                if(dms.string.isEmpty($("#bpCd").val())){
                    // 업체를 선택해주세요.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    return false;
                }

                selectissueEtcPopupWindow();
            }
        });



        // 차입문서삭제 버튼
        $("#btnReturnDel").kendoButton({
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

                if(dms.string.isEmpty($("#bpCd").val())){
                    // 거래처를 입력해주세요
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    saveList = [];
                    return false;
                }

                header = {
                        mvtTp           :mvtType
                      , bpCd            :$("#bpCd").val()
                      , remark          :$("#remark").val()
                      , updtDtStr       :$("#updtDtStr").val()
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

                        if(Number(gridData.qty) > Number(gridData.remainQty)){
                            // 입고수량이 반환수량보다 클 수 없습니다.
                            dms.notification.error("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='par.lbl.returnQty' var='returnQty' /><spring:message code='global.err.chkGreateParam' arguments='${qty},${returnQty}'/>");
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

                    $.ajax({
                         url:"<c:url value='/par/pcm/receive/createReceiveEtc.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result) {

                            if (result.resultYn == true) {
                                dms.notification.success("<spring:message code='par.lbl.etcGrDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");

                                pEtcGrDocNo = result.etcGrDocNo;
                                $('#etcGrDocNo').val(result.etcGrDocNo);
                                // 부품기타입고 조회.
                                selectEtcReceive(pEtcGrDocNo);

                            } else {
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.etcGrDocNo' var='etcGrDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGrDocNo}'/>");
                                }
                            }
                        }
                        ,beforeSend:function(){
                            dms.loading.show($("#screenSection"));
                        }
                        ,complete:function(){
                            dms.loading.hide($("#screenSection"));
                        }
                        ,error:function(jqXHR,status,error) {
                            dms.loading.hide($("#screenSection"));
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
                 options.model.set("amt", options.model.prc * options.model.qty);
                 options.model.set("taxDdctAmt", options.model.prc * options.model.qty);

                 fnSetAmtInfo();

             });

             input.appendTo(container);
             input.kendoExtNumericTextBox({
                 format: "n0"
                 ,decimals:0
                 ,restrictDecimals: true
                 ,min:0
                 ,spinners:false
             });
         };

         grLocCdDropDownEditor = function(container, options) {

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


        // 부품기타입고등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0808-161301"
           ,height:480
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/receive/selectReceiveEtcItemByKey.do' />"
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
                         var dataLen      = result.data.length,
                             gridData     = $("#grid").data("kendoExtGrid"),
                             itemList     = [];

                         for(var i = 0; i < dataLen; i = i + 1){
                             itemList.push(result.data[i].itemCd);
                         }
                         fnSetLocCdObj(itemList);

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
                            , itemCd          :{ type:"string", editable:false }
                            , itemNm          :{ type:"string", editable:false }
                            , unitCd          :{ type:"string", editable:false }
                            , qty             :{ type:"number" }
                            , rentQty         :{ type:"number", editable:false }
                            , remainQty       :{ type:"number", editable:false }
                            , preReturnQty    :{ type:"number", editable:false }
                            , stdStrgeCd      :{ type:"string", editable:false }
                            , strgeCd         :{ type:"string", editable:false }
                            , locCd           :{ type:"string" }
                            , prc             :{ type:"number", editable:false }
                            , amt             :{ type:"number" }
                            , taxAmt          :{ type:"number" }
                            , refDocNo        :{ type:"string", editable:false }
                            , refDocLineNo    :{ type:"number", editable:false }
                            , grDt            :{ type:"date"   , editable:false }
                            , grTime          :{ type:"string" , editable:false }
                            , dcRate          :{ type:"number" }
                            , taxDdctPrc      :{ type:"number" }
                            , taxDdctAmt      :{ type:"number" }

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
                if(fieldName === "amt" ){
                     this.closeCell();
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
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"qty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n0}"
                  }
                , {   //기입고수량
                      title:"<spring:message code='par.lbl.receivedQty' />"
                     ,field:"preReturnQty"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                  }
                , {   //남은 수량
                      title:"<spring:message code='par.lbl.qty' />"
                     ,field:"remainQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true
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
                   ,template:'#= changeGrLocCd(strgeCd, locCd)#'
                   ,sortable:false
                }
              , {   //단가
                    title:"<spring:message code='par.lbl.prc' />"
                   ,field:"prc"
                   ,width:90
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                }
              , {   //금액
                    title:"<spring:message code='par.lbl.amt' />"
                   ,field:"amt"
                   ,width:90
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
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
                   ,width:80
                }
              , {   //세액
                    title:"<spring:message code='par.lbl.vatAmt' />"
                   ,field:"taxAmt"
                   ,width:90
                   ,attributes:{ "style":"text-align:right"}
                   ,format:"{0:n2}"
                   ,hidden:true
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
                    field:"taxDdctAmt"
                   ,title:"<spring:message code='par.lbl.amtTax' />"
                   ,width:80
                   ,attributes:{ "class":"ar"}
                   ,format:"{0:n2}"
                   ,hidden:true
                }//입고금액(세금미포함)
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

         // 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = strgeTpObj[val];
             }
             return returnVal;
         };

         // 로케이션
         changeGrLocCd = function(strgeCd, locCd){
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

        //$("#totQty").closest(".k-numerictextbox").addClass("form_readonly");
        //$("#totQty").data("kendoExtNumericTextBox").enable(false);
        //$("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
        //$("#totAmt").data("kendoExtNumericTextBox").enable(false);

        $("#mvtTp").data("kendoExtDropDownList").value('36');
        $("#mvtTp").data("kendoExtDropDownList").enable(false);

        $("#btnReturnAdd").data("kendoButton").enable(true);
        $("#btnReturnDel").data("kendoButton").enable(true);
        $("#btnSave").data("kendoButton").enable(true);

        popItemObj = {};

        //기타입고현황 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pEtcGrDocNo)){
            selectEtcReceive(pEtcGrDocNo);
        }

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
            $("#btnReturnAdd").data("kendoButton").enable(false);
            $("#btnReturnDel").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
        });
    }

    //차입문서추가 함수.
    function selectissueEtcPopupWindow(){
        var popMvtTp;

        popMvtTp = '47'; //대여출고
        issueEtcPopupWindow = dms.window.popup({
            windowId:"issueEtcPopupWindow"
            , title:"<spring:message code='par.title.issueEtcReturn' />"   // 기타출고 렌탈
            , content:{
                url:"<c:url value='/par/cmm/selectIssueEtcPopup.do'/>"
                , data:{
                      "type":""
                    , "autoBind"    :true
                    , "bpCd"        :$("#bpCd").val()
                    , "bpNm"        :$("#bpNm").val()
                    , "mvtTp"       :popMvtTp
                    , "popTp"       :'RETURN'
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
                            popItemData.qty            = data[i].remainQty;
                            popItemData.rentQty        = data[i].rentQty;
                            popItemData.preReturnQty   = data[i].returnQty;
                            popItemData.remainQty      = data[i].remainQty;
                            popItemData.prc            = data[i].prc;
                            popItemData.amt            = data[i].amt;
                            popItemData.stdStrgeCd     = data[i].strgeCd;
                            popItemData.strgeCd        = data[i].strgeCd;
                            popItemData.locCd          = data[i].locCd;
                            popItemData.etcGrDocNo     = '';
                            popItemData.etcGrDocLineNo = null;
                            popItemData.refDocNo       = data[i].etcGiDocNo;
                            popItemData.refDocLineNo   = data[i].etcGiDocLineNo;
                            popItemData.dcRate         = 0;
                            popItemData.taxAmt         = 0;
                            popItemData.taxDdctPrc     = data[i].prc;
                            popItemData.taxDdctAmt     = data[i].amt;


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
                        issueEtcPopupWindow.close();

                        fnSetAmtInfo();
                    }
                }
            }
        });
    }

    function selectVenderMasterPopupWindow(){

        customerSearchPopupWin = dms.window.popup({
            windowId:"customerSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderCstSelect'/>"   // customer select
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectCustomerMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"selectable":"row"
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#bpCd").val(data[0].bpCd);
                            $("#bpNm").val(data[0].bpNm);
                            customerSearchPopupWin.close();
                        }
                    }
                }
            }
        });
    }

    // 차출반환입고리스트 팝업 열기 함수.
    function selectReceiveEtcListPopupWindow(){

        receiveEtcListPopupWindow = dms.window.popup({
            windowId:"ReceiveEtcFundsListPopup"
            ,title:"<spring:message code='par.title.etcReceiveInfo' />"   // 기타입고정보
            ,content:{
                url:"<c:url value='/par/cmm/selectReceiveEtcListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"mvtTp"    :$("#mvtTp").data("kendoExtDropDownList").value()
                    ,"mvtTpNm"  :$("#mvtTp").data("kendoExtDropDownList").text()
                    ,"statCd"   :"02"
                    ,"bpCd"     :$("#bpCd").val()
                    ,"bpNm"     :$("#bpNm").val()
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
        //$("#totQty").data("kendoExtNumericTextBox").value(totalQty);
        //$("#totAmt").data("kendoExtNumericTextBox").value(totalAmt);
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

