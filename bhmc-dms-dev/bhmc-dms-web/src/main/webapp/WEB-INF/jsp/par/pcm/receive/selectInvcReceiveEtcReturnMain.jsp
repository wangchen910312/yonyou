<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 입고반품 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11645" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11644" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.returnCnfm" /><!-- 반품확정 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11643" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnPrint"><spring:message code="par.btn.exportReturnDoc" /><!-- 반품문서출력 --></button>
            </dms:access>
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
                        <th scope="row"><spring:message code="par.lbl.sBpNm" /><!-- 공급업체 --></th>
                        <td>
                            <input type="text" id="bpCd" name="bpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                            <input type="text" id="bpNm" class="form_input form_readonly" readonly/>
                            <input id="bpTp" name="bpTp" class="form_input hidden"  required data-name="<spring:message code="par.lbl.custTp" />" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.receiveReturnNo" /><!-- 반품번호 --></th>
                        <td>
                            <div class="form_search">
                                <input id="etcGrDocNo" class="form_input" />
                                <a id="searchEtcGrDocNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.returnConfirmer" /><!-- 반품인 --></th>
                        <td>
                            <input id="regUsrId" class="form_input form_readonly hidden" readonly />
                            <input id="regUsrNm" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.receiveReturnDt" /><!-- 반품일자 --></th>
                        <td class="readonly_area">
                            <input id="regDt" type="text" value="" class="form_datepicker" data-type="maskDate" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11642" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_s_min5" id="btnReceiveEtcItemPop"><spring:message code="par.btn.receiveRef" /><!-- 입고참조 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11641" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_del btn_s_min5" id="btnDelItem"><spring:message code="par.btn.del" /></button>
            </dms:access>
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
            strgeTpObj          = {},
            existItemChkObj     = {};


    strgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    $(document).ready(function() {


        $("#regDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });


        //$("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchEtcGrDocNo").on('click', selectEtcGrDocListPopupWindow);
        $("#etcGrDocNo").on('keypress', selectReturnEtcGrDocNoKey);



        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
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
                    delete existItemChkObj[l_rowData.refDocNo][l_rowData.itemCd];
                });

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });


        //기타입고 문서 추가팝업
        $("#btnReceiveEtcItemPop").kendoButton({
            click:function(e) {

                /*
                var bpCd = $("#bpCd").val();

                if(dms.string.isEmpty(bpCd)){
                    //공급업체 정보가 없습니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.emptyParamInfo' arguments='${bpCd}'/>");
                    return false;
                }
                */
                selectAddReceiveEtcPopupWindow();
            }
        });

       // 출력
        $("#btnPrint").kendoButton({
            click:function(e) {

                parent._createOrReloadTabMenu("<spring:message code='par.btn.exportReturnDoc'/>", "<c:url value='/ReportServer?reportlet=par/selectInvcReturnPrintMain2.cpt'/>&sDlrCd=${dlrCd}&sInvcDocNo="+$("#etcGrDocNo").val());
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
                    header,
                    chkRow;

                if(dms.string.isEmpty($("#bpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                header = {
                        bpCd            :$("#bpCd").val()
                       ,bpNm            :$("#bpNm").val()
                };

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);

                        chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                    if(chkRow === true){

                        if(dms.string.isEmpty(gridData.returnQty) || gridData.returnQty == 0){
                            // 수량을 입력하십시오
                            dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='global.info.confirmMsgParam' arguments='${qty}'/>");
                            saveList = [];
                            return false;
                        }

                        if((Number(gridData.returnQty) + Number(gridData.preReturnQty)) > Number(gridData.qty)){
                            // 반품수량이 구매수량보다 큽니다.
                            dms.notification.info("<spring:message code='par.lbl.returnQtyOverMsg' />");
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
                         url:"<c:url value='/par/pcm/receive/returnInvcReceiveEtc.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result) {

                            if (result.resultYn == true) {
                                dms.notification.success("<spring:message code='par.lbl.returnCnfm' var='invReturn' /><spring:message code='global.info.regSuccessParam' arguments='${invReturn}'/>");

                                selectEtcReceiveReturn(result.etcGrDocNo);

                            } else {
                                dms.notification.error("<spring:message code='par.lbl.returnCnfm' var='invReturn' /><spring:message code='global.err.regFailedParam' arguments='${invReturn}'/>");
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
                }else{
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }
              }
        });

        $(document).on("click", ".grid-checkAll", function(e){
            var grid = $("#grid").data("kendoExtGrid"),
                checked = $(this).is(":checked"),
                rows = grid.tbody.find("tr"),
                lineDisabled;

            if(checked){
                rows.each(function(index, row) {
                    lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                    if(!lineDisabled){
                        grid.select($(this));
                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                    }
                });



            }else{
                grid.clearSelection();

                rows.each(function(index, row) {
                    lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                    if(!lineDisabled){
                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                    }
                });
            }
        });


         /**
          * grid 구매단가&구매수량
          */
          changeGrQtyEditor = function(container, options) {
              var input = $("<input/>");

              input.attr("name", options.field);

              input.appendTo(container);
              input.kendoExtNumericTextBox({
                  format: "n2"
                  ,decimals:2
                  ,min:0
                  ,spinners:false
              });
          };


      // 입고반품 그리드
         $("#grid").kendoExtGrid({
             gridId:"G-PAR-1129-102101"
            ,dataSource:{
                 transport:{
                     read:{
                          //url:"<c:url value='/par/pcm/receive/selectReceiveEtcReturnItemByKey.do' />"
                          url:"<c:url value='/par/pcm/receive/selectReceiveEtcReturnDocItemByKey.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["sort"]               = options.sort;

                             // 기타입고현황 검색조건 코드.
                             params["sEtcGrDocNo"] = $("#etcGrDocNo").val();


                             return kendo.stringify(params);
                         }
                     }
                 }
                 ,schema:{
                      data:function (result){


                          return result.data;
                      }
                     ,total:"total"
                     ,model:{
                        id:"itemCd"
                       ,fields:{
                               dlrCd               :{ type:"string" , validation:{required:true} }
                             , etcGrDocNo          :{ type:"string",  editable:false }
                             , etcGrDocLineNo      :{ type:"string",  editable:false }
                             , refDocNo            :{ type:"string", editable:false }
                             , refDocLineNo        :{ type:"number", editable:false }
                             , itemCd              :{ type:"string",  editable:false }
                             , itemNm              :{ type:"string",  editable:false }
                             , strgeCd             :{ type:"string",  editable:false }
                             , qty                 :{ type:"number",  editable:false }
                             , returnQty           :{ type:"number" }
                             , preReturnQty        :{ type:"number",  editable:false }
                             , remark              :{ type:"string"}
                             , prc                 :{ type:"number",  editable:false }
                             , movingAvgPrc        :{ type:"number",  editable:false }
                             , taxDdctPrc          :{ type:"number",  editable:false }
                             , grDt                :{ type:"date",    editable:false }
                             , purcReturnDt        :{ type:"date",    editable:false }
                             , amt                 :{ type:"number" }
                             , movingAvgAmt        :{ type:"number" }
                             , taxDdctAmt          :{ type:"number" }
                             , dcRate              :{ type:"number" }
                             , updtDtStr           :{ type:"string" }
                         }
                     }
                 }
             }
             , selectable :"row"
             , scrollable :true
             , sortable   :false
             , autoBind   :false
             , appendEmptyColumn:true
             , change:function(e){
                 var grid = this,
                     rows = e.sender.select(),
                     selecLeng = e.sender.select().length,
                     lineDisabled;

                 if(selecLeng > 1){
                     rows.each(function(index, row) {
                         lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                         if(!lineDisabled){
                             $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                         }
                     });
                 }else if(selecLeng === 1){
                     rows.each(function(index, row) {
                         lineDisabled = $(this).find(".grid-checkbox-item").prop("disabled");
                         if(!lineDisabled){
                              if (!$(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked")) {
                                  $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                              }else {
                                  $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                              }
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
                     lineDisabled,
                     fieldName = grid.columns[e.container.index()].field;

                 if(e.model.etcGrDocNo != undefined){//반품문서 있을 때 모든 셀 닫기.
                     this.closeCell();
                 }else{
                     if(fieldName === "returnQty"){

                         if(selectedItem.qty === selectedItem.preReturnQty){
                             this.closeCell();
                         }else{
                             orgVal = input.val();

                             input.keyup(function(){
                             });

                             input.blur(function(){
                                 pVal = input.val();
                                 if(Number(pVal) + Number(e.model.preReturnQty) > Number(e.model.qty)){
                                     dms.notification.info("<spring:message code='par.lbl.returnQtyOverMsg' />");
                                     e.model.set('returnQty',     orgVal);
                                     e.model.set("taxDdctAmt",    orgVal * e.model.taxDdctPrc);
                                     e.model.set("amt",           orgVal * e.model.prc);
                                     e.model.set("movingAvgAmt",  orgVal * e.model.movingAvgPrc);
                                     return false;
                                 }else{

                                     e.model.set("taxDdctAmt",    pVal * e.model.taxDdctPrc);
                                     e.model.set("amt",           pVal * e.model.prc);
                                     e.model.set("movingAvgAmt",  pVal * e.model.movingAvgPrc);
                                 }
                             });

                             $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                         }
                     }else if(fieldName === "amt"||fieldName === "taxDdctAmt"||fieldName === "movingAvgAmt"||fieldName === "chk"){
                         this.closeCell();
                     }
                 }
              }
              , columns:[
                   {field:"rnum" ,title:"<spring:message code='par.lbl.no' />" ,width:50, hidden:true}//번호
                  ,{field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                       ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                       ,sortable:false
                       ,template:"<input type='checkbox' data-uid='#= uid #' #= changeStatCd(qty,preReturnQty)# class='grid-checkbox-item' data-chk=false/>"
                   }
                  ,{field:"etcGrDocNo" ,title:"<spring:message code='par.lbl.returnDocNo' />" ,width:140}//입고번호
                  ,{   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"etcGrDocLineNo"
                     ,width:35
                  }
                  ,{   //참조문서번호
                      title:"<spring:message code='par.lbl.grDocNo' />"
                     ,field:"refDocNo"
                     ,width:140
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"refDocLineNo"
                     ,width:35
                  }
                  ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:140}//부품번호
                  ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200 ,sortable:false}//부품명
                  , {   //입고창고
                      title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,field:"strgeCd"
                     ,width:140
                     ,template:'#= changeStrgeCd(strgeCd)#'
                     ,sortable:false
                  }
                  ,{field:"qty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0 ,sortable:false
                      ,template:function(dataItem){
                          var retVal= 0;

                          if(dataItem.etcGrDocNo != undefined){//반품문서 있을 때
                              retVal = "";
                          }else{//반품문서 없을 때
                              retVal = dataItem.qty;
                          }
                          return retVal;
                      }
                  }//입고수량
                  ,{field:"returnQty" ,title:"<spring:message code='par.lbl.grReturnQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2 ,sortable:false
                      ,editor:changeGrQtyEditor
                      ,template:function(dataItem){
                          var retVal = 0;

                          if(dataItem.etcGrDocNo != undefined){//반품문서 있을 때
                              retVal = dataItem.qty;//반품입고수량 대체
                          }else{//반품문서 없을 때
                              retVal = dataItem.returnQty;
                          }
                          return retVal;
                      }
                  }//반품수량
                  , {   //기반품수량
                      title:"<spring:message code='par.lbl.preReturnPartsQty' />"
                     ,field:"preReturnQty"
                     ,width:80
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                  }
                  ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.prcTax' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매단가(포함)
                  ,{field:"prc" ,title:"<spring:message code='par.lbl.prc' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매단가(세금미포함)
                  ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.movingAvgPrc' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//이평가가(세금미포함)
                  ,{field:"taxDdctAmt" ,title:"<spring:message code='par.lbl.amtTax' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액
                  ,{field:"amt" ,title:"<spring:message code='par.lbl.amt' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액(세금제외)
                  ,{field:"movingAvgAmt" ,title:"<spring:message code='par.lbl.movingAvgCost' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액(세금제외)
                  ,{field:"updtDtStr" ,title:" " ,width:100,hidden:true}//수정일자
                  ,{field:"dcRate" ,title:"<spring:message code='par.lbl.taxRate' />" ,width:100,hidden:true }//할인율
             ]
         });

         // 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(!dms.string.isEmpty(val)){
                 if(!dms.string.isEmpty(strgeTpObj[val])){
                     returnVal = strgeTpObj[val];
                 }
             }
             return returnVal;
         };

         // 상태
         changeStatCd = function(qty, preReturnQty){
             var returnVal = "";
             if(qty === preReturnQty){
                 returnVal = 'disabled';
             }
             return returnVal;
         };



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

        $("#grid").data("kendoExtGrid").dataSource.data([]);

        $("#btnSave").data("kendoButton").enable(true);
        $("#btnPrint").data("kendoButton").enable(false);
        $("#btnDelItem").data("kendoButton").enable(true);
        $("#btnReceiveEtcItemPop").data("kendoButton").enable(true);
        /*
        if(!dms.string.isEmpty($("#bpCd").val())){
            $("#btnDelItem").data("kendoButton").enable(true);
            $("#btnSave").data("kendoButton").enable(true);
            $("#btnPrint").data("kendoButton").enable(true);
        }else{
            $("#btnDelItem").data("kendoButton").enable(false);
            $("#btnSave").data("kendoButton").enable(false);
            $("#btnPrint").data("kendoButton").enable(false);
        }
        */

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
           if(id === 'regDt'){
               $("#regDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
           }
       }

    }

 // 부품기타입고 정보 조회.
    function selectEtcReceiveReturn(pEtcGrDocNo){

        $.ajax({
            url:"<c:url value='/par/pcm/receive/selectReceiveReturnEtcByKey.do' />",
            data:JSON.stringify({ sEtcGrDocNo:pEtcGrDocNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                selectEtcGrDocListPopupWindow();
            }

        }).done(function(result) {
                existItemChkObj = {};

                if(dms.string.isEmpty(result)){
                    selectEtcGrDocListPopupWindow();
                }else{
                    partsJs.validate.groupObjAllDataSet(result);

                    $("#grid").data("kendoExtGrid").dataSource.read();

                    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];

                    $("#btnSave").data("kendoButton").enable(false);
                    $("#btnPrint").data("kendoButton").enable(true);
                    $("#btnDelItem").data("kendoButton").enable(false);
                    $("#btnReceiveEtcItemPop").data("kendoButton").enable(false);
                }

        });
    }

    // 입고번호로 구매건 조회 함수.
    function selectReturnEtcGrDocNoKey(e){

        if(e.keyCode === 13){

           if(dms.string.isEmpty($("#etcGrDocNo").val())){
               // 입고번호를 선택하십시오
               dms.notification.warning("<spring:message code='par.lbl.purcGrDocNo' var='purcGrDocNo' /><spring:message code='global.info.confirmMsgParam' arguments='${purcGrDocNo}'/>");
               return false;
           }

           selectEtcReceiveReturn($("#etcGrDocNo").val());

        }

    }
    //입고반품 팝업 함수.
    function selectEtcGrDocListPopupWindow(){

        receiveReturnEtcListPopupWindow = dms.window.popup({
            windowId:"receiveReturnEtcListPopupWindow"
            ,title:"<spring:message code='par.title.receiveReturnInfo' />" //입고반품정보
            ,width:800
            ,height:400
            ,content:{
                url:"<c:url value='/par/cmm/selectReceiveReturnEtcListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":$("#bpCd").val()
                    ,"bpNm":$("#bpNm").val()
                    ,"selectable":"single"
                    ,"mvtTp":"03" //수불유형 : 구매입고반품
                    ,"callbackFunc":function(data){
                        if(data.length === 1){
                            selectEtcReceiveReturn(data[0].etcGrDocNo);
                        }
                        receiveReturnEtcListPopupWindow.close();
                    }
                }
            }
        });
    }

    //입고문서추가 함수.
    function selectAddReceiveEtcPopupWindow(){


        receiveEtcListPopupWindow = dms.window.popup({
            windowId : "receiveEtcListPopupWindow"
            ,title : "<spring:message code='par.title.storingInfo' />"//입고단정보
            ,width:800
            ,height:400
            ,content : {
                url : "<c:url value='/par/cmm/selectReceiveEtcListPopup.do'/>"
                ,data: {
                    "type" : ""
                    ,"autoBind"     : true
                    ,"bpNm"         : $("#bpNm").val()
                    ,"mvtTp"        : "01" //수불유형 [구매입고]
                    ,"bpTp"         : "ETC" //공급처 BMP제외
                    ,"statCd"       : "02" //확정 상태
                    ,"returnYn"     : "Y"
                    ,"bpReadOnly"   : false
                    ,"selectable"   : "multiple"
                    ,"callbackFunc" : function(data){
                        var gridData      = $("#grid").data("kendoExtGrid"),
                            rows          = gridData.tbody.find("tr"),
                            dataLen       = data.length,
                            hdUpdtDt      = data[0].updtDtStr,
                            popItemData   = {},
                            itemList      = [];

                        if(($("#bpCd").val() === data[0].bpCd) || (dms.string.isEmpty($("#bpCd").val()))){
                            $("#bpCd").val(data[0].bpCd);
                            $("#bpNm").val(data[0].bpNm);

                            $.ajax({
                                url:"<c:url value='/par/pcm/receive/selectReceiveEtcReturnItemByKey.do' />",
                                data:JSON.stringify({ sEtcGrDocNo:data[0].etcGrDocNo}),
                                type:"POST",
                                dataType:"json",
                                contentType:"application/json",
                                error:function(jqXHR,status,error) {
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }

                            }).done(function(result) {
                                var lDatalen = result.data.length,
                                    data     = result.data;

                                for(var i = 0; i < lDatalen; i = i + 1){
                                    popItemData.itemCd         = data[i].itemCd;
                                    popItemData.itemNm         = data[i].itemNm;
                                    popItemData.qty            = data[i].qty;
                                    popItemData.preReturnQty   = data[i].returnQty;
                                    popItemData.returnQty      = Number(data[i].qty - data[i].returnQty).toFixed(2);
                                    popItemData.prc            = data[i].prc;
                                    popItemData.movingAvgPrc   = data[i].movingAvgPrc;
                                    popItemData.amt            = Number(data[i].prc * (data[i].qty - data[i].returnQty)).toFixed(2);
                                    popItemData.movingAvgAmt   = data[i].movingAvgAmt;
                                    popItemData.strgeCd        = data[i].strgeCd;
                                    popItemData.refDocNo       = data[i].etcGrDocNo;
                                    popItemData.refDocLineNo   = data[i].etcGrDocLineNo;
                                    popItemData.taxDdctPrc     = data[i].taxDdctPrc;
                                    popItemData.taxDdctAmt     = Number(data[i].taxDdctPrc * (data[i].qty - data[i].returnQty)).toFixed(2);
                                    popItemData.dcRate         = data[i].dcRate;
                                    popItemData.updtDtStr      = hdUpdtDt;  //해당 입고건의 헤더 수정일시

                                    if(existItemChkObj.hasOwnProperty(data[i].etcGrDocNo)){
                                        if(existItemChkObj[data[i].etcGrDocNo].hasOwnProperty(data[i].itemCd)){
                                            //이미 등록되어있는 부품입니다.
                                            var itemInfo = data[i].itemCd + '[' + data[i].itemNm + ']';
                                            dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                                        }else{
                                            existItemChkObj[data[i].etcGrDocNo][data[i].itemCd] = data[i].itemNm;
                                            gridData.dataSource.add(popItemData);
                                        }
                                    }else{
                                        existItemChkObj[data[i].etcGrDocNo] = {};
                                        existItemChkObj[data[i].etcGrDocNo][data[i].itemCd] = data[i].itemNm;
                                        gridData.dataSource.add(popItemData);
                                    }
                                }
                            });

                            gridData.select(gridData.tbody.find(">tr"));
                            receiveEtcListPopupWindow.close();
                        }else{
                            dms.notification.warning("<spring:message code='par.lbl.sBpNm' var='bpCd' /><spring:message code='global.info.validation.check' arguments='${bpCd}'/>");
                        }

                    }
                }
            }
        });
    }

</script>
<!-- //script -->