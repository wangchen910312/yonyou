<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 입고반품 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
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
                            <div class="form_search">
                                <input id="purcOrdNo" class="form_input" />
                                <a id="searchPurcOrdNo"><!-- 검색 --></a>
                            </div>
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
                <button class="btn_s btn_file btn_s_min5 hidden" id="btnExcelUpload"><spring:message code="par.btn.uploadExcel" /></button>
                <button class="btn_s btn_s_min5" id="btnPurcOrdItemPop"><spring:message code="par.btn.purcOrdRef" /><!-- 구매참조 --></button>
                <button class="btn_s btn_del btn_s_min5" id="btnDelItem"><spring:message code="par.btn.del" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 입고확정대상 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>
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
            purcOrdItemPopupWindow;

    $(document).ready(function() {


        $("#purcRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });


        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchPurcOrdNo").on('click', selectPurcOrdListPopupWindow);
        $("#purcOrdNo").on('keypress', selectPurcOrdNoKey);



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
        $("#btnPurcOrdItemPop").kendoButton({
            click:function(e) {

                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                selectPurcOrdItemPopupWindow();
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
                 }else if(gCrud === "U"){
                     var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                     if (grid.gridValidation()) {

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
                          options.model.set("taxDdctAmt",    options.model.purcQty * options.model.taxDdctPrc);
                          options.model.set("purcAmt",       options.model.purcQty * options.model.purcPrc);
                          return false;
                      }
                      pValue = Math.floor( $(this).val());

                      options.model.set("taxDdctAmt",    pValue * options.model.taxDdctPrc);
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
                             , taxDdctPrc          :{ type:"number", editable:false }
                             , purcRegDt           :{ type:"date", editable:false }
                             , purcReturnDt        :{ type:"date", editable:false }
                             , purcAmt             :{ type:"number" }
                             , taxDdctAmt          :{ type:"number" }
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
                 }else if(fieldName === "chk"||fieldName === "purcAmt"||fieldName === "taxDdctAmt"){
                     this.closeCell();
                 }
              }
              , columns:[
                  {field:"chk" ,title:"&nbsp;",width:30 ,attributes:{"class":"ac"} ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>" ,sortable:false
                       ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' data-chk=false/>"
                  }
                  ,{field:"rnum" ,title:"<spring:message code='par.lbl.no' />" ,width:50}//번호
                  ,{field:"purcOrdNo" ,title:"<spring:message code='par.lbl.purcOrdNo' />" ,width:100, hidden:true}//구매오더번호
                  ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:140}//부품번호
                  ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200 ,sortable:false}//부품명
                  ,{field:"returnQty" ,title:"<spring:message code='par.lbl.grReturnQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0 ,sortable:false
                      ,editor:changeGrQtyEditor
                  }//반품수량
                  ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.prcTax' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매단가(포함)
                  ,{field:"purcPrc" ,title:"<spring:message code='par.lbl.prc' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매단가(세금미포함)
                  ,{field:"taxDdctAmt" ,title:"<spring:message code='par.lbl.amtTax' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액
                  ,{field:"purcAmt" ,title:"<spring:message code='par.lbl.amt' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액(세금제외)
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
                //$("#purcOrdNo").attr("disabled", true);
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

    var venderSearchPopupWin;
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

                        venderSearchPopupWin.close();

                    }
                }
            }
        });
    }

 // 구매번호로 구매건 조회 함수.
    function selectPurcOrdNoKey(e){

        if(dms.string.isEmpty($("#bpCd").val())){
            // 딜러를 선택하십시오
            dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
            saveList = [];
            return false;
        }

        if(e.keyCode === 13){

            $.ajax({
                url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdByKey.do' />",
                data:JSON.stringify({ sPurcOrdNo:$("#purcOrdNo").val()}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    selectPurcOrdListPopupWindow();
                }
            }).done(function(result) {
                    $("#purcOrdNo").val(result.purcOrdNo);
                    $("#purcRegDt").data("kendoExtMaskedDatePicker").value(new Date(result.purcRegDt));
                    $("#regUsrId").val(result.regUsrId);
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
            });
        }

    }

    // 구매리스트 팝업 열기 함수.
    function selectPurcOrdListPopupWindow(){

        if(dms.string.isEmpty($("#bpCd").val())){
            // 딜러를 선택하십시오
            dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
            saveList = [];
            return false;
        }

        purcOrdListPopupWindow = dms.window.popup({
            windowId:"purcOrdListPopup"
            ,title:"<spring:message code='par.title.purcOrdInfo' />"   // 구매오더정보
            ,content:{
                url:"<c:url value='/par/cmm/selectPurcOrdListPopup.do'/>"
                ,data:{
                      "type":"custom1"
                    , "autoBind":false
                    , "bpCd":$("#bpCd").val()
                    , "bpNm":$("#bpNm").val()
                    , "purcOrdStatCd":'01'
                    , "selectable":"single"
                    , "callbackFunc":function(data){
                        if(data.length === 1)
                        {

                            $("#purcOrdNo").val(data[0].purcOrdNo);
                            $("#purcRegDt").data("kendoExtMaskedDatePicker").value(new Date(data[0].purcRegDt));
                            $("#regUsrId").val(data[0].regUsrId);

                            $("#grid").data("kendoExtGrid").dataSource.read();

                            $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
                        }
                        purcOrdListPopupWindow.close();
                    }
                }
            }
        });
    }

  //구매리스트 팝업 열기 함수.
    function selectPurcOrdItemPopupWindow(){
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
                              popItemData.taxDdctPrc         = data[i].taxDdctPrc;
                              popItemData.purcAmt            = data[i].purcAmt;
                              popItemData.taxDdctAmt         = data[i].taxDdctAmt;

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