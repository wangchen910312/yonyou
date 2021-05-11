<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 입고반품 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"></h1>
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.returnCnfm" /><!-- 반품확정 --></button>
                <button class="btn_m" id="btnPrint"><spring:message code="par.btn.exportReturnDoc" /><!-- 반품문서출력 --></button>
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpNm" /><!-- 공급업체 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="bpCd" name="bpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <input type="text" id="bpNm" class="form_input form_readonly" readonly/>
                                <input id="bpTp" name="bpTp" class="form_input hidden"  required data-name="<spring:message code="par.lbl.custTp" />" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매번호 --></th>
                        <td>
                            <input id="purcOrdNo" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordReqDt" /><!-- 구매신청일 --></th>
                        <td class="readonly_area">
                            <input id="purcRegDt" type="text" value="" class="form_datepicker" data-type="maskDate" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordRegId" /><!-- 구매신청자 --></th>
                        <td>
                            <input id="regUsrId" class="form_input form_readonly" readonly />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s btn_file" id="btnExcelUpload"><spring:message   code="par.btn.uploadExcel" /></button>
                <button class="btn_s"          id="btnPurcOrdListPop"><spring:message   code="par.btn.purcOrdRef" /><!-- 구매참조 --></button>
                <button class="btn_s btn_del"  id="btnDelItem"><spring:message       code="par.btn.del" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 입고확정대상 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //구매오더 -->

<!-- script -->
<script>

        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            sessionBpTp         = "${bpTp}",
            toDt                = "${toDt}",
            toDate              = new Date(toDt),
            sevenDtBf           = "${sevenDtBf}",
            pPurcOrdNo          = "${pPurcOrdNo}",
            pBpCd               = "${pBpCd}",
            pBpNm               = "${pBpNm}",
            gCrud               = "C",
            existItemChkObj     = {},
            venderSearchPopupWin,
            purcOrdItemPopupWindow;

    $(document).ready(function() {


        $("#purcRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });


        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);



        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                pPurcOrdNo  = ''; //구매등록 관리 화면에서 넘어온 구매번호 삭제.
                pBpCd       = ''; //구매등록 관리 화면에서 넘어온 공급처 삭제.
                pBpNm       = ''; //구매등록 관리 화면에서 넘어온 공급처 삭제.
                gCrud       = "C";
                initPage();
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

            }
        });


     // 구매리스트팝업
        $("#btnPurcOrdListPop").kendoButton({
            click:function(e) {

                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectPurcOrdListPopupWindow();
            }
        });

       // 엑셀 업로드
        $("#btnExcelUpload").kendoButton({
            click:function(e) {

                dms.notification.warning("<spring:message code='global.info.ready'/>");
            }
        });

       // 출력
        $("#btnPrint").kendoButton({
            click:function(e) {

                dms.notification.warning("<spring:message code='global.info.ready'/>");
            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    lCrud         = '',
                    paramUrl      = '',
                    chkRow;

                if(dms.string.isEmpty($("#bpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#purcOrdNo").val())){
                    //구매번호정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.purcOrdNo' var='purcOrdNo' /><spring:message code='global.info.required.field' arguments='${purcOrdNo}'/>");
                    return false;
                }


                if(gCrud === "C"){
                    if(rows.length  == 0 ){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);
                        //chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                        //if(chkRow === true){

                            if(dms.string.isEmpty(gridData.returnQty) || gridData.returnQty == 0){
                                // 수량을 입력하십시오
                                dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                                saveList = [];
                                return false;
                            }

                            if(gridData.returnQty > gridData.purcQty){
                                // 반품수량이 구매수량보다 큽니다.
                                dms.notification.info("<spring:message code='par.lbl.grReturnQty' var='returnQty' /><spring:message code='par.lbl.purcQty' var='purcQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${returnQty},${purcQty}' />");
                                saveList = [];
                                return false;
                            }

                            saveList.push(gridData);
                       // }
                    });

                    if(saveList.length > 0){
                        var data ={
                              "purcOrdItemList":saveList
                            };

                        $.ajax({
                             url:"<c:url value='/par/pcm/purcOrd/returnPurcOrdItems.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,success:function(result) {

                                if (result === 1) {
                                    dms.notification.success("<spring:message code='par.btn.invReturn' var='invReturn' /><spring:message code='global.info.regSuccessParam' arguments='${invReturn}'/>");
                                    existItemChkObj = {};

                                    $("#grid").data("kendoExtGrid").dataSource.read();

                                    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                                    $("#btnSave").data("kendoButton").enable(true);
                                    $("#btnPrint").data("kendoButton").enable(true);
                                    $("#btnExcelUpload").data("kendoButton").enable(true);
                                    $("#btnDelItem").data("kendoButton").enable(true);

                                } else {
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.btn.invReturn' var='invReturn' /><spring:message code='global.err.regFailedParam' arguments='${invReturn}'/>");
                                    }
                                }
                            }
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }

                        });
                    }
                 }else if(gCrud === "U"){
                     var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                     if (grid.gridValidation()) {

                         console.log('saveData:',saveData);
                         $.ajax({
                             url:"<c:url value='/par/pcm/purcOrd/multiReturnPurcOrdItems.do' />"
                            ,data:kendo.stringify(saveData)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,success:function(result) {

                                if (result === true) {
                                    dms.notification.success("<spring:message code='par.btn.invReturn' var='invReturn' /><spring:message code='global.info.modifySuccessParam' arguments='${invReturn}'/>");

                                    dms.notification.success("<spring:message code='par.btn.invReturn' var='invReturn' /><spring:message code='global.info.regSuccessParam' arguments='${invReturn}'/>");
                                    existItemChkObj = {};

                                    $("#grid").data("kendoExtGrid").dataSource.read();
                                    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                                    $("#btnSave").data("kendoButton").enable(true);
                                    $("#btnPrint").data("kendoButton").enable(true);
                                    $("#btnExcelUpload").data("kendoButton").enable(true);
                                    $("#btnDelItem").data("kendoButton").enable(true);


                                } else {
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.btn.invReturn' var='invReturn' /><spring:message code='global.err.modifyFailedParam' arguments='${invReturn}'/>");
                                    }
                                }
                            }
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }

                        });
                     }

                 }
              }
        });


         /**
          * grid 구매단가&구매수량
          */
          changeGrQtyEditor = function(container, options) {
              var input = $("<input/>"),
                  pValue;

              input.attr("name", options.field);

              input.keyup(function(){
                  if(options.field === 'returnQty'){

                      if($(this).val() > options.model.purcQty){
                          dms.notification.info("<spring:message code='par.lbl.grReturnQty' var='returnQty' /><spring:message code='par.lbl.purcQty' var='purcQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${returnQty},${purcQty}' />");
                          options.model.set('returnQty',     options.model.purcQty);
                          options.model.set("purcIncTaxAmt", options.model.purcQty * options.model.purcIncTaxPrc);
                          options.model.set("purcAmt",       options.model.purcQty * options.model.purcPrc);
                          return false;
                      }
                      pValue = Math.floor( $(this).val());

                      options.model.set("purcIncTaxAmt", pValue * options.model.purcIncTaxPrc);
                      options.model.set("purcAmt",       pValue * options.model.purcPrc);
                  }
              });

              input.blur(function(){
                 var resultGrid = $("#grid").data("kendoExtGrid"),
                     rows       = resultGrid.tbody.find("tr"),
                     totalAmt   = 0,
                     gridData;

                 if(!dms.string.isEmpty(pValue)){

                     if(options.field === 'returnQty'){
                         options.model.set("returnQty", pValue);
                     }

                 }

              });

              input.appendTo(container);
              input.kendoExtNumericTextBox({
                  min:0,
                  spinners:false
              });
          };


      // 입고반품 그리드
         $("#grid").kendoExtGrid({
             gridId:"G-PAR-0805-153702"
            ,dataSource:{
                 transport:{
                     read:{
                          url:"<c:url value='/par/pcm/purcOrd/selectReturnPurcOrdItemByKey.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["sort"]               = options.sort;

                             // 입고확정대상 검색조건 코드.
                             params["sBpCd"]              = $("#bpCd").val();
                             params["sPurcOrdNo"]         = $("#purcOrdNo").val();
                             params["sPurcRegDt"]         = $("#purcRegDt").data("kendoExtMaskedDatePicker").value();
                             params["sRegUsrId"]          = $("#regUsrId").val();


                             return kendo.stringify(params);
                         }
                     }
                 }
                 ,schema:{
                      data:function (result){

                          gCrud = "U";

                          return result.data;
                      }
                     ,total:"total"
                     ,model:{
                        id:"itemCd"
                       ,fields:{
                               dlrCd               :{ type:"string" , validation:{required:true} }
                             , purcOrdNo           :{ type:"string", editable:false }
                             , purcOrdLineNo       :{ type:"string", editable:false }
                             , purcOrdLineDetlNo   :{ type:"string", editable:false }
                             , itemCd              :{ type:"string", editable:false }
                             , itemNm              :{ type:"string", editable:false }
                             , purcQty             :{ type:"number", editable:false }
                             , returnQty           :{ type:"number" }
                             , remark              :{ type:"string"}
                             , purcPrc             :{ type:"number", editable:false }
                             , purcIncTaxPrc       :{ type:"number", editable:false }
                             , purcRegDt           :{ type:"date", editable:false }
                             , purcReturnDt        :{ type:"date", editable:false }
                             , purcAmt             :{ type:"number" }
                             , purcIncTaxAmt       :{ type:"number" }
                         }
                     }
                 }
             }
             , selectable :"multiple"
             , scrollable :true
             , sortable   :true
             , autoBind   :false
             , appendEmptyColumn:true           //빈컬럼 적용. default:false
            // , multiSelectWithCheckbox:true
             , change:function(e){
                 var grid = this,
                     rows = e.sender.select(),
                     selecLeng = e.sender.select().length;

                 if(selecLeng > 1){
                     rows.each(function(index, row) {
                         $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                     });
                 }else if(selecLeng === 1){
                     rows.each(function(index, row) {
                          if (!$(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked")) {
                              $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                          }else {
                              $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                          }
                      });
                 }

              }
             , pageable:false
             , filterable:false
             , edit:function(e){
                 var eles = e.container.find("input"),
                     rows = e.sender.select(),
                     selectedItem = e.sender.dataItem(rows[0]),
                     grid = this,
                     input = e.container.find(".k-input"),
                     pVal,
                     orgVal,
                     fieldName = grid.columns[e.container.index()].field;

                 if(fieldName === "returnQty"){
                     $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                 }else if(fieldName === "chk"||fieldName === "purcAmt"||fieldName === "purcIncTaxAmt"){
                     this.closeCell();
                 }
              }
             , columns:[
                   {
                       title:"&nbsp;"
                      ,field:"chk"
                      ,width:30
                      ,attributes:{style:"text-align:center;"}
                      ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"
                      ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                      ,sortable:false
                   }
                 , {   //딜러코드
                       title:"<spring:message code='par.lbl.dlrCd' />"
                      ,field:"dlrCd"
                      ,width:80
                      ,hidden:true
                   }
                 , {   //구매오더번호
                       title:"<spring:message code='par.lbl.purcOrdNo' />"
                      ,field:"purcOrdNo"
                      ,width:100
                   }
                 , {   //Line
                       title:"<spring:message code='par.lbl.lineNm' />"
                      ,field:"purcOrdLineNo"
                      ,attributes:{ "style":"text-align:right"}
                      ,width:70
                      ,sortable:false
                   }
                 , {   //라인구분자
                       title:" "
                      ,field:"purcOrdLineDetlNo"
                      ,attributes:{ "style":"text-align:right"}
                      ,width:20
                      ,sortable:false
                      ,hidden:true
                   }
                 , {   //업체
                       title:"<spring:message code='par.lbl.bpNm' />"
                      ,field:"bpCd"
                      ,width:140
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
                      ,sortable:false
                   }
                 , {   //구매수량
                       title:"<spring:message code='par.lbl.purcQty' />"
                      ,field:"purcQty"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                      ,sortable:false
                   }
                 , {   //반품수량
                       title:"<spring:message code='par.lbl.grReturnQty' />"
                      ,field:"returnQty"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,editor:changeGrQtyEditor
                      ,decimal:0
                      ,sortable:false
                   }
                 , {   //사유
                       title:"<spring:message code='par.lbl.reasonCont' />"
                      ,field:"remark"
                      ,width:140
                   }
                 , {   //구매단가(세금미포함)
                       title:"<spring:message code='par.lbl.purcPriceTax' />"
                      ,field:"purcPrc"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //구매단가(포함)
                       title:"<spring:message code='par.lbl.purcPrice' />"
                      ,field:"purcIncTaxPrc"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //구매금액(세금제외)
                       title:"<spring:message code='par.lbl.purcAmt' />"
                      ,field:"purcAmt"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //구매금액
                       title:"<spring:message code='par.lbl.purcIncTaxAmt' />"
                      ,field:"purcIncTaxAmt"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //납기일
                     title:"<spring:message code='par.lbl.periodDeliveryReqDt' />"
                    ,field:"purcReqDt"
                    ,width:100
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "style":"text-align:center"}
                    ,hidden:true
                   }
                 , {   //반품일자
                     title:"<spring:message code='par.lbl.periodDeliveryReqDt' />"
                    ,field:"purcReturnDt"
                    ,width:100
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "style":"text-align:center"}
                    ,hidden:true
                   }
             ]
         });

        function initPage(){
            var minDate = new Date(sevenDtBf),
                maxDate = new Date(toDt),
                toYY,
                toMM,
                toDD,
                frYY,
                frMM,
                frDD;

            //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            //$("#grid").data("kendoExtGrid").dataSource.data([]);

            existItemChkObj = {};

            //반품구매오더 관리에서 넘어온 경우
            if(!dms.string.isEmpty(pPurcOrdNo)){
                $("#purcOrdNo").val(pPurcOrdNo);
                $("#bpCd").val(pBpCd);
                $("#bpNm").val(pBpNm);
                $("#grid").data("kendoExtGrid").dataSource.read();
                $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

            }else{
                $("#purcOrdNo").attr("disabled", true);
                $("#grid").data("kendoExtGrid").dataSource.data([]);
            }


            if(!dms.string.isEmpty($("#bpCd").val())){
                $("#btnExcelUpload").data("kendoButton").enable(true);
                $("#btnDelItem").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnPrint").data("kendoButton").enable(true)
            }else{
                $("#btnExcelUpload").data("kendoButton").enable(false);
                $("#btnDelItem").data("kendoButton").enable(false);
                $("#btnSave").data("kendoButton").enable(false);
                $("#btnPrint").data("kendoButton").enable(false);
            }

        }

        function fnChkDateValue(e){

           var  elmt  = e.sender.element[0],
                id    = elmt.id,
                toYY,
                toMM,
                toDD,
                frYY,
                frMM,
                frDD;

           if(this.value() == null){
               if(id === 'purcRegDt'){
                   $("#purcRegDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
               }
           }

        }

        initPage();
    });

    $(document).on("click", ".grid-checkAll", function(e){
        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");

        if(checked){
            rows.each(function(index, row) {
                grid.select($(this));
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
            });



        }else{
            grid.clearSelection();

            rows.each(function(index, row) {
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });

    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":''
                    ,"bpNm":''
                    ,"bpTp":'03'
                    ,"callbackFunc":function(data){

                        existItemChkObj = {};

                        $("#bpCd").val(data[0].bpCd);  //공급업체 기본셋팅
                        $("#bpNm").val(data[0].bpNm);
                        $("#bpTp").val(data[0].bpTp);
                        $("#grid").data("kendoExtGrid").dataSource.data([]);

                    }
                }
            }
        });
    }

  //구매리스트 팝업 열기 함수.
    function selectPurcOrdListPopupWindow(){
            purcOrdItemPopupWindow = dms.window.popup({
                windowId:"purcOrdItemPopup"
              , title:"<spring:message code='par.title.purcOrdInfo' />"   // 구매오더정보
              , width:860
              , height:450
              , content:{
                    url:"<c:url value='/par/cmm/selectPurcOrdItemPopup.do'/>"
                  , data:{
                        "type":""
                      , "autoBind":false
                      , "bpCd":$("#bpCd").val()
                      , "bpNm":$("#bpNm").val()
                      , "purcOrdNo":$("#purcOrdNo").val()
                      , "purcOrdStatCd":'03'
                      , "returnYn":     'Y'
                      , "selectable":"single"
                      , "callbackFunc":function(data){

                          var dataLen      = data.length,
                              gridData     = $("#grid").data("kendoExtGrid"),
                              popItemData  = {},
                              tDate,
                              rows;

                          for(var i = 0; i < dataLen; i = i + 1){
                              //내용
                              if(dms.string.isEmpty($("#purcOrdNo").val())){
                                  $("#purcOrdNo").val(data[i].purcOrdNo);
                                  $("#purcRegDt").data("kendoExtMaskedDatePicker").value(new Date(data[i].purcRegDt));
                                  $("#regUsrId").val(data[i].regUsrId);



                              }else{
                                  if(data[i].purcOrdNo !== $("#purcOrdNo").val()){
                                      console.log('구매번호 다름:',data[i].purcOrdNo + '~' + data[i].itemCd);
                                      continue;
                                  }
                              }

                              popItemData.dlrCd              = data[i].dlrCd;
                              popItemData.purcOrdNo          = data[i].purcOrdNo;
                              popItemData.purcOrdLineNo      = data[i].purcOrdLineNo;
                              popItemData.purcOrdLineDetlNo  = data[i].purcOrdLineDetlNo ;
                              popItemData.itemCd             = data[i].itemCd;
                              popItemData.bpCd               = data[i].bpCd;
                              popItemData.itemNm             = data[i].itemNm;
                              popItemData.purcRegDt          = data[i].purcRegDt;
                              popItemData.purcQty            = data[i].purcQty;
                              popItemData.returnQty          = data[i].purcQty;
                              popItemData.purcPrc            = data[i].purcPrc;
                              popItemData.purcIncTaxPrc      = data[i].purcIncTaxPrc;
                              popItemData.purcAmt            = data[i].purcAmt;
                              popItemData.purcIncTaxAmt      = data[i].purcIncTaxAmt;

                              if(existItemChkObj.hasOwnProperty(data[i].itemCd)){
                                  //이미 등록되어있는 부품입니다.
                                  var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                  dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                              }else{
                                  existItemChkObj[data[i].itemCd] = data[i].itemNm;;
                                  gridData.dataSource.add(popItemData);
                              }

                          }

                          $("#btnSave").data("kendoButton").enable(true);
                          $("#btnPrint").data("kendoButton").enable(true);
                          $("#btnExcelUpload").data("kendoButton").enable(true);
                          $("#btnDelItem").data("kendoButton").enable(true);

                          gridData.select(gridData.tbody.find(">tr"));

                          purcOrdItemPopupWindow.close();


                      }
                  }
              }
          });

      }




</script>
<!-- //script -->