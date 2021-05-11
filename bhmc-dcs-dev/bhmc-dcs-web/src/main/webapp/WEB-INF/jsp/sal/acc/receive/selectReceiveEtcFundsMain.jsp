<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 其他入库信息 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><!-- 其他入库信息 --></h1>
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.otherGrTp" /><!-- 기타입고유형 --></span></th>
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
                        <th scope="row"><spring:message code="par.lbl.grDocNo" /><!-- 입고문서번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="etcGrDocNo" class="form_input form_readonly" readonly>
                                <a id="searchEtcGrDocNo"><!-- 검색 --></a>
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
                <button class="btn_s" id="btndlrGiDocNo" ><spring:message         code="par.btn.dlrGiDocNo" /><!-- 딜러출고문서번호 --></button>
            </div>
        </div>

         <div>
            <!-- 부품기타입고 그리드 -->
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
    mvtTpList           = [],
    popItemObj          = {},
    issueEtcFundListPopupWindow,
    changeAmtEditor,
    venderSearchPopupWin,
    venderSearchPopupWin,
    receiveEtcListPopupWindow,
    grStrgeCdDropDownEditor,
    grLocCdDropDownEditor;

    locationObj[' '] = "";
    //mvtTpList.push({cmmCd:"63", cmmCdNm:"调拨入库"});

    <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
        if("63" === "${obj.cmmCd}"){
            mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
    </c:forEach>

    strgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
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

            // 딜러출고문서번호
            $("#btndlrGiDocNo").kendoButton({
                click:function(e){

                    if(dms.string.isEmpty($("#bpCd").val())){
                        // 딜러를 선택하십시오
                        dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                        saveList = [];
                        return false;
                    }
                    selectIssueEtcFundsPopupWindow();
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
                                    dms.notification.success("<spring:message code='par.lbl.etcGrDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");

                                    console.log('result:',result);
                                    pEtcGrDocNo = result.etcGrDocNo;
                                    $('#etcGrDocNo').val(result.etcGrDocNo);
                                    // 부품기타출고 조회.
                                    //selectEtcIssue(pEtcGiDocNo);
                                    $("#grid").data("kendoExtGrid").dataSource.read();

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

            $("#searchCustCd").on('click', selectCustSearchPopupWindow);
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

          // 부품기타입고등록 그리드
             $("#grid").kendoExtGrid({
                 gridId:"G-PAR-0808-161102"
                ,dataSource:{
                     transport:{
                         read:{
                              url:"<c:url value='/par/pcm/receive/selectReceiveEtcItemByKey.do' />"
                         }
                         , parameterMap:function(options, operation) {
                             if (operation === "read") {

                                 var params = {};

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
                                  popItemObj[result.data[i].itemCd] = result.data[i].itemNm;;
                              }
                              locationListObj = {};

                              fnSetLocCdObj(itemList);

                              $("#btndlrGiDocNo").data("kendoButton").enable(false);

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
                                 , qty             :{ type:"number" }
                                 , strgeCd         :{ type:"string", editable:false  }
                                 , grReasonCd      :{ type:"string" }
                                 , locCd           :{ type:"string" }
                                 , prc             :{ type:"number" }
                                 , amt             :{ type:"number", editable:false  }
                                 , refDocNo        :{ type:"string", editable:false  }
                                 , refDocLineNo    :{ type:"number", editable:false  }
                                 , receiveId       :{ type:"string", editable:false  }
                                 , grDt            :{ type:"date"  , editable:false  }
                                 , grTime          :{ type:"string", editable:false  }
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
                 , columns:[
                       {   //기타입고현황번호
                           title:"<spring:message code='par.lbl.etcGrDocNo' />"
                          ,field:"etcGrDocNo"
                          ,width:120
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
                       }
                     , {   //입고일
                           title:"<spring:message code='global.lbl.grDt' />"
                          ,field:"grDt"
                          ,width:80
                          ,format:"{0:<dms:configValue code='dateFormat' />}"
                          ,attributes:{ "style":"text-align:center"}
                       }
                     , {   //입고시간
                           title:"<spring:message code='par.lbl.grTime' />"
                          ,field:"grTime"
                          ,attributes:{ "style":"text-align:center"}
                          ,width:80
                       }
                     , {   //수령인
                           title:"<spring:message code='par.lbl.receiveId' />"
                          ,field:"receiveId"
                          ,width:80
                       }
                 ]
             });

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
                 $("#mvtTp").data("kendoExtDropDownList").value("63");

                 $("#btndlrGiDocNo").data("kendoButton").enable(true);

                 popItemObj = {};

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

                                $("#bpCd").val(data[0].bpCd);
                                $("#bpNm").val(data[0].bpNm);

                            }
                        }
                    }
                }
            });
        }

       // 조달입고리스트 팝업 열기 함수.
        function selectReceiveEtcListPopupWindow(){

            if(dms.string.isEmpty($("#bpCd").val())){
                // 딜러를 선택하십시오
                dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                saveList = [];
                return false;
            }

            receiveEtcListPopupWindow = dms.window.popup({
                windowId:"ReceiveEtcFundsListPopup"
                ,title:"<spring:message code='par.title.etcReceiveInfo' />"   // 기타입고정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectReceiveEtcListPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"mvtTp"    :$("#mvtTp").data("kendoExtDropDownList").value(),
                        ,"mvtTpNm"  :$("#mvtTp").data("kendoExtDropDownList").text(),
                        ,"statCd"   :"02"
                        ,"bpCd"     :$("#bpCd").val()
                        ,"bpNm"     :$("#bpNm").val()
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                $("#etcGrDocNo").val(data[0].etcGrDocNo);
                                $("#grid").data("kendoExtGrid").dataSource.read();
                            }
                            receiveEtcListPopupWindow.close();
                        }
                    }
                }
            });
        }

       // 딜러출고 팝업 열기 함수.
        function selectIssueEtcFundsPopupWindow(){

            issueEtcFundListPopupWindow = dms.window.popup({
                windowId:"IssueEtcFundListPopup"
                ,title:"<spring:message code='par.title.etcIssueInfo' />"   // 기타출고정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectIssueEtcFundListPopup.do'/>"
                    ,data:{

                        "type":""
                        ,"autoBind":false
                        ,"bpCd"     :$("#bpCd").val()
                        ,"bpNm"     :$("#bpNm").val()
                        , "selectable"  :"multiple"
                        ,"callbackFunc":function(data){
                            console.log('issueEtcFundListPopupWindow:',data);
                            if(data.length > 0)
                            {


                                var dataLen      = data.length,
                                    gridData     = $("#grid").data("kendoExtGrid"),
                                    popItemData  = {},
                                    itemList     = [];

                                //$("#etcGrDocNo").val(data[0].etcGrDocNo);
                                //$("#grid").data("kendoExtGrid").dataSource.read();


                                for(var i = 0; i < dataLen; i = i + 1){
                                    itemList.push(data[i].itemCd);
                                }
                                console.log('itemList:',itemList);
                                locationListObj = {};
                                fnSetLocCdObj(itemList);

                                for(var i = 0; i < dataLen; i = i + 1){

                                    popItemData.itemCd         = data[i].itemCd;
                                    popItemData.itemNm         = data[i].itemNm;
                                    popItemData.qty            = data[i].qty;
                                    popItemData.prc            = data[i].prc;
                                    popItemData.amt            = data[i].amt;
                                    popItemData.strgeCd        = data[i].grStrgeCd;
                                    popItemData.locCd          = '';
                                    popItemData.grReasonCd     = '';
                                    popItemData.refDocNo       = data[i].etcGiDocNo;
                                    popItemData.refDocLineNo   = data[i].etcGiDocLineNo;
                                    popItemData.etcGrDocNo     = '';
                                    popItemData.etcGrDocLineNo = null;


                                    console.log('popItemData:',popItemData);

                                    popItemObj[data[i].itemCd] = data[i].itemNm;;
                                    gridData.dataSource.add(popItemData);


                                }

                                gridData.select(gridData.tbody.find(">tr"));

                            }
                            issueEtcFundListPopupWindow.close();
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
</script>
<!-- //script -->

