<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 기타입고정보 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11936" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11935" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
			</dms:access>
			<dms:access viewId="VIEW-D-11934" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
			</dms:access>
            </div>
        </div>

        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.issueEtcRentNo" /><!-- 차출등기번호 --></th>
                        <td>
                            <input id="sEtcGiDocNo" class="form_input" />
                            <input type="hidden" id="sSelectEtcGiDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.issueEtcRentalDt" /><!-- 차출등기일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegDtFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegDtTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.issueEtcRentaler" /><!-- 차출출고인 --></th>
                        <td>
                            <input id="sRegUsrNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.issueEtcRentRemark" /><!--차출출고비고 --></th>
                        <td>
                            <input id="sRemark" type="text" value="" class="form_input">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 차출출고 그리드 -->
            <div id="gridHeader" class="grid"></div>
        </div>

        <div class="table_form form_width_70per mt10" id="etcGrForm">
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.otherGiTp" /><!-- 기타출고유형 --></span></th>
                        <td class="required_area">
                            <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.rentalReturnNo" /><!-- 차출반환번호 --></th>
                        <td>
                            <input type="text" id="etcGrDocNo" class="form_input form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.rentalReturnDt" /><!-- 차출반환일자 --></th>
                        <td class="readonly_area">
                            <input id="regDt" type="text" value="" class="form_datepicker" data-type="maskDate" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bpCstCd" /><!-- 업무고객코드 --></th>
                        <td>
                            <input type="text" id="bpCd" class="form_input form_readonly"  readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.bpCstNm" /><!-- 업무고객명 --></th>
                        <td>
                            <input type="text" id="bpNm" class="form_input form_readonly"  readonly/>
                            <input id="updtDtStr" type="text" class="form_input hidden" />
                        </td>
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
        frDt                = "${frDt}",
        pReceiveEtcNo       = "${pReceiveEtcNo}",
        gVatCd              = Number("${vatCd}"),
        mvtTpList           = [],
        unitCdObj           = {},
        strgeTpObj          = {},
        strgeTpList         = [],
        locationListObj     = {},
        locationObj         = {},
        statCdObj           = {},
        popItemObj          = {},
        issueEtcPopupWindow,
        customerSearchPopupWin,
        receiveEtcListPopupWindow,
        changeAmtEditor,
        changeUnitCd,
        changeItemDstinCd,
        firstTimeOpen = true;


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

        <c:forEach var="obj" items="${statCdList}" varStatus="status">
            statCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        if(dms.string.isEmpty(gVatCd)){
            console.log('gVatCd 값 없음!');
           // gVatCd = .16;
            gVatCd = .13;
        }
        console.log('gVatCd:',gVatCd);

    $(document).ready(function() {

        //기타입고유형선택
        $("#mvtTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mvtTpList
            ,index:0
        });

        $("#regDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //출고일자
        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //출고일자
        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $(document).on("click", ".grid-checkAll", function(e){
            var grid = $("#grid").data("kendoExtGrid"),
                checked = $(this).is(":checked"),
                rows = grid.tbody.find("tr"),
                gridData,
                lineDisabled;

            if(checked){
                rows.each(function(index, row) {
                    gridData = grid.dataSource.at(index);
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
                    gridData = grid.dataSource.at(index);
                    if(!lineDisabled){
                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                    }
                });
            }
        });


        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#gridHeader").data("kendoExtGrid").dataSource.read();
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
                    readObj       = {},
                    chkCnt        = 0,
                    chkRow,
                    header,
                    chkCalcAmt;

                if(dms.string.isEmpty($("#bpCd").val())){
                    // 거래처를 입력해주세요
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    saveList = [];
                    return false;
                }

                header = {
                        mvtTp           :mvtType
                      , bpCd            :$("#bpCd").val()
                      , bpNm            :$("#bpNm").val()
                      , remark          :$("#remark").val()
                      , updtDtStr       :$("#updtDtStr").val()
                      , refDocNo        :$('#sSelectEtcGiDocNo').val()
                };

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);
                    chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                    if(chkRow === true){

                        chkCnt = chkCnt + 1;

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

                            if(Number(gridData.qty) > Number(gridData.remainQty)){
                                // 입고수량이 차출수량보다 클 수 없습니다.
                                dms.notification.error("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='par.lbl.rentItemQty' var='rentItemQty' /><spring:message code='global.err.chkGreateParam' arguments='${qty},${rentItemQty}'/>");
                                saveList = [];
                                return false;
                            }

                            chkCalcAmt = Math.round(Number(gridData.prc) * Number(gridData.qty) * 100)/100;

                            if(Math.abs(Number(chkCalcAmt) - Number(gridData.amt)) > 0.5 ){
                                // 금액을 확인해주세요.
                                dms.notification.warning("<spring:message code='par.lbl.amt' var='amt' /><spring:message code='global.info.confirmMsgParam' arguments='${amt}'/>");
                                saveList = [];
                                return false;
                            }

                            saveList.push(gridData);
                        }
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

                                if (!partsJs.validate.getAllPluginObjInfo($("#etcGrForm")[0])) {
                                    return false;
                                }
                                partsJs.validate.groupObjAllDataSet(result);

                                readObj.etcGiDocNo = $('#sSelectEtcGiDocNo').val();
                                $("#grid").data("kendoExtGrid").dataSource.read(readObj);
                                $("#gridHeader").data("kendoExtGrid").dataSource.read();

                            } else {
                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.etcGrDocNo' var='etcGrDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGrDocNo}'/>");
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
                }else{
                    if(chkCnt === 0){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }
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
                 options.model.set("amt", Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100);
                 options.model.set("taxDdctAmt", Math.round((Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100) / ( 1 + gVatCd ) * 100)/100);
                 options.model.set("taxAmt", (Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100) - (Math.round((Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100) / ( 1 + gVatCd ) * 100)/100));
                 options.model.set("taxDdctPrc", Math.round(Number(options.model.prc) / ( 1 + gVatCd ) * 100)/100);
                 options.model.set("dcRate", gVatCd);
             });

             input.appendTo(container);
             input.kendoExtNumericTextBox({
                 min:0,
                 spinners:false,
                 format: "n0",
                 decimals:0,
                 restrictDecimals: true
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

          $("#gridHeader").kendoExtGrid({
              gridId:"G-PAR-0922-143901"
             ,dataSource:{
                  transport:{
                      read:{
                          url:"<c:url value='/par/ism/issue/selectIssueEtcs.do' />"
                          , dataType:"json"
                          , type:"POST"
                          , contentType:"application/json;"
                      }
                      , parameterMap:function(options, operation) {
                          if (operation === "read") {

                              var params = {};

                              params["recordCountPerPage"] = options.pageSize;
                              params["pageIndex"]          = options.page;
                              params["firstIndex"]         = options.skip;
                              params["lastIndex"]          = options.skip + options.take;
                              params["sort"]               = options.sort;

                              params["sMvtTp"]             = '47';
                              params["sEtcGiDocNo"]        = $("#sEtcGiDocNo").val();
                              params["sGiDtFr"]            = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                              params["sGiDtTo"]            = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                              params["sRegUsrNm"]          = $("#sRegUsrNm").val();
                              params["sRemark"]            = $("#sRemark").val();
                              params["sStatCd"]            = '02'; //확정된 데이터만 조회

                              return kendo.stringify(params);
                          }
                      }
                  }
                  ,navigatable:false
                  ,serverPaging:true
                  ,schema:{
                      data:"data"
                      , total:"total"
                      , model:{
                          id:"etcGrDocNo"
                          , fields:{
                                dlrCd             :{ type:"string" }
                              , mvtTp             :{ type:"string" }
                              , bpCd              :{ type:"string" }
                              , bpNm              :{ type:"string" }
                              , etcGiDocNo        :{ type:"string" }
                              , etcGiDocLineNo    :{ type:"number" }
                              , regUsrId          :{ type:"string" }
                              , regUsrNm          :{ type:"string" }
                              , itemCnt           :{ type:"number" }
                              , itemQty           :{ type:"number" }
                              , returnItemCnt     :{ type:"number" }
                              , returnItemQty     :{ type:"number" }
                              , regDt             :{ type:"date"   }
                              , giTotAmt          :{ type:"number" }
                              , giTaxDdctAmt      :{ type:"number" }
                              , returnTotAmt      :{ type:"number" }
                              , returnTaxDdctAmt  :{ type:"number" }
                              , remark            :{ type:"string" }
                              , statCd            :{ type:"string" }
                              , updtDtStr         :{ type:"string" }
                          }
                      }
                  }
              }
              ,selectable:"multiple"
              ,editable:false
              ,autoBind:false
              ,filterable:false
              ,appendEmptyColumn:true           //빈컬럼 적용. default:false
              ,height:200
              ,change:function(e){
                  var selectedItem = this.dataItem(this.select()),
                      readObj = {};

                  if( selectedItem != null && selectedItem != 'undefined'){

                      $("#bpCd").val(selectedItem.bpCd);
                      $("#bpNm").val(selectedItem.bpNm);
                      $("#etcGrDocNo").val('');
                      $("#regDt").data("kendoExtMaskedDatePicker").value('');
                      $("#sSelectEtcGiDocNo").val(selectedItem.etcGiDocNo);
                      $("#updtDtStr").val(selectedItem.updtDtStr);
                      readObj.etcGiDocNo = selectedItem.etcGiDocNo;
                      $("#grid").data("kendoExtGrid").dataSource.read(readObj);
                  }
              }
              ,columns:[
                   {field:"dlrCd"
                       ,title:"<spring:message code='par.lbl.dlrCd' />"
                       ,width:105
                       ,hidden:true}  //딜러 코드
                  ,{field:"statCd"
                       ,title:"<spring:message code='par.lbl.docStatCd' />"
                       ,width:100
                       ,attributes:{ "class":"ac"}
                       ,template:'#= changeStatCd(statCd)#'
                       ,hidden:true}  //문서상태
                  ,{field:"etcGiDocNo"
                       ,title:"<spring:message code='par.lbl.issueEtcRentNo' />"
                       ,width:150} //차출출고번호
                  ,{field:"etcGiDocLineNo"
                       ,title:"<spring:message code='par.lbl.lineNm' />"
                       ,width:35
                       ,hidden:true}   //Line
                  ,{field:"regDt"
                       ,title:"<spring:message code='par.lbl.issueEtcRentalDt' />"
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                       ,attributes:{ "style":"text-align:center"}
                       ,width:90}  //차입등록일
                  ,{field:"regUsrId"
                       ,title:"<spring:message code='par.lbl.issueEtcRentaler' />"
                       ,width:120
                       ,hidden:true} //차출출고인
                  ,{field:"regUsrNm"
                       ,title:"<spring:message code='par.lbl.issueEtcRentaler' />"
                       ,width:120} //차출출고인
                  ,{field:"remark"
                       ,title:"<spring:message code='par.lbl.issueEtcRentRemark' />"
                       ,width:100}              //비고
                  ,{field:"bpCd"
                       ,title:"<spring:message code='par.lbl.bpCstCd' />"
                       ,width:105}  //거래처 코드
                  ,{field:"bpNm"
                       ,title:"<spring:message code='par.lbl.bpCstNm' />"
                       ,width:200}  //공급업체
                  ,{field:"itemCnt"
                       ,title:"<spring:message code='par.lbl.rentalItemCnt' />"
                       ,width:80
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n0}"}                //차입건수
                  ,{field:"itemQty"
                       ,title:"<spring:message code='par.lbl.rentalItemQty' />"
                       ,width:80
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n0}"}                //차입수량
                  ,{field:"giTotAmt"
                       ,title:"<spring:message code='par.lbl.rentAmt' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"}                //차출금액(세금제외)
                  ,{field:"giTaxDdctAmt"
                       ,title:"<spring:message code='par.lbl.rentTaxDdctAmt' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"
                       ,hidden:true}                //차출금액(세금제외)
                  ,{field:"returnItemCnt"
                       ,title:"<spring:message code='par.lbl.returnBorrowItemCnt' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n0}"}                //차출반환건수
                  ,{field:"returnItemQty"
                       ,title:"<spring:message code='par.lbl.returnBorrowItemQty' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n0}"}                //차출반환수량
                  ,{field:"returnTotAmt"
                       ,title:"<spring:message code='par.lbl.returnRentAmt' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"}                //차출반환금액
                  ,{field:"returnTaxDdctAmt"
                       ,title:"<spring:message code='par.lbl.returnBorrowTaxDdctAmt' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"
                       ,hidden:true}                //차출반환금액(세금제외)
                  ,{field:"updtDtStr"
                       ,title:" "
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,hidden:true}                //수정일시
              ]
          });


        // 부품기타입고등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0922-161301"
           ,height:480
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/ism/issue/selectRentalItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 차입입고현황 검색조건 코드.
                            params["sEtcGiDocNo"] = options.etcGiDocNo;

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
                             popItemObj[result.data[i].itemCd] = result.data[i].itemNm;
                         }

                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"itemCd"
                      ,fields:{
                              refDocNo        :{ type:"string", editable:false }
                            , refDocLineNo    :{ type:"number", editable:false }
                            , itemCd          :{ type:"string", editable:false }
                            , itemNm          :{ type:"string", editable:false }
                            , unitCd          :{ type:"string", editable:false }
                            , strgeCd         :{ type:"string", editable:false }
                            , locCd           :{ type:"string", editable:false }
                            , rentQty         :{ type:"number", editable:false }
                            , qty             :{ type:"number" }
                            , remainQty       :{ type:"number", editable:false }
                            , returnQty       :{ type:"number", editable:false }
                            , prc             :{ type:"number", editable:false }
                            , movingAvgPrc    :{ type:"number", editable:false }
                            , amt             :{ type:"number" }
                            , taxAmt          :{ type:"number" }
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

                $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);

                if(fieldName === "chk"){
                    this.closeCell();
                }

                if(fieldName === "qty") {
                    if(selectedItem.remainQty == 0){
                        this.closeCell();
                        $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", false);
                    }
                }
             }
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();
                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        if(dataItem.remainQty == 0) {
                            row.children().eq(8).removeClass("bg_white");
                        }
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            , columns:[
                  {
                      field:"chk" ,title:"&nbsp;" ,width:30 ,attributes:{"class":"ac"}
                     ,headerTemplate:"<input type='checkbox' class='grid-checkAll'/>"
                     ,sortable:false
                     ,template:"<input type='checkbox' data-uid='#= uid #' #= changeChkStat(remainQty)# class='grid-checkbox-item' data-chk=false/>"
                  }
                 ,{   //대여문서번호
                      title:"<spring:message code='par.lbl.issueEtcRentNo' />"
                     ,field:"refDocNo"
                     ,width:120
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"refDocLineNo"
                     ,width:35
                     ,hidden:true
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:120
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.itemNm' />"
                     ,field:"itemNm"
                     ,width:200
                  }
                , {   //창고
                      title:"<spring:message code='par.lbl.strgeCd' />"
                     ,field:"strgeCd"
                     ,width:140
                     ,template:'#= changeStrgeCd(strgeCd)#'
                     ,sortable:false
                  }
                , {   //로케이션
                      title:"<spring:message code='par.lbl.locCd' />"
                     ,field:"locCd"
                     ,width:140
                     //,editor:grLocCdDropDownEditor
                     //,template:'#= changeGrLocCd(strgeCd, locCd)#'
                     ,sortable:false
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeUnitCd(unitCd)#'
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.grQty' />"
                     ,field:"qty"
                     ,width:80
                     ,attributes:{ "style":"text-align:right", "class":"bg_white"}
                     ,editor:changeAmtEditor  /* 부분 입력 못하게 막음. */
                     ,format:"{0:n0}"
                  }
                , {   //차출수량
                      title:"<spring:message code='par.lbl.rentItemQty' />"
                     ,field:"rentQty"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                  }
                , {   //남은 수량
                      title:"<spring:message code='par.lbl.unReturnQty' />"
                     ,field:"remainQty"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                  }
                , {   //반환수량
                      title:"<spring:message code='par.lbl.returnQty' />"
                     ,field:"returnQty"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.orgBorrowPrc' />"
                     ,field:"prc"
                     ,width:100
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }
                , {   //원가
                      title:"<spring:message code='par.lbl.movingAvgPrc' />"
                     ,field:"movingAvgPrc"
                     ,width:100
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.amt' />"
                     ,field:"amt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
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

        $("#grid .k-grid-content").on("change","input.grid-checkbox-item",function(e){
            var grid = $("#grid").data("kendoExtGrid"),
                dataItem = grid.dataItem($(e.target).closest("tr")),
                row = grid.tbody.find("tr[data-uid='" + dataItem.uid + "']");

            if ($(this).is(":checked")) {
                grid.select(row);
            } else {
                $(e.currentTarget).closest("tr").removeClass("k-state-selected");
                $(row).removeClass("k-state-selected");
            }
        });

        //상태에 따른 체크
        changeChkStat = function(pRemainQty){
            var returnVal = "";
            if(pRemainQty <= 0){
                returnVal = 'disabled';
            }

            return returnVal;
        };

         // 단위
         changeUnitCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = unitCdObj[val];
             }
             return returnVal;
         };

         //문서상태
         changeStatCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = statCdObj[val];
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
        var grid        = $("#grid").data("kendoExtGrid"),
            minDate     = new Date(frDt),
            maxDate     = new Date(toDt),
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

        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#etcGrForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#gridHeader").data("kendoExtGrid").dataSource.data([]);

        //$("#totQty").closest(".k-numerictextbox").addClass("form_readonly");
        //$("#totQty").data("kendoExtNumericTextBox").enable(false);
        //$("#totAmt").closest(".k-numerictextbox").addClass("form_readonly");
        //$("#totAmt").data("kendoExtNumericTextBox").enable(false);

        $("#mvtTp").data("kendoExtDropDownList").value('36');
        $("#mvtTp").data("kendoExtDropDownList").enable(false);

        //$("#btnReturnAdd").data("kendoButton").enable(true);
        //$("#btnReturnDel").data("kendoButton").enable(true);
        $("#btnReturnAdd").hide();
        $("#btnReturnDel").hide();
        $("#btnSave").data("kendoButton").enable(true);

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        popItemObj = {};

        //기타출고현황 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pReceiveEtcNo) && firstTimeOpen === true){
            //selectEtcReceive(pIssueEtcNo);
            $("#sEtcGiDocNo").val(pReceiveEtcNo);
            $("#sRegDtFr").data("kendoExtMaskedDatePicker").value('');
            $("#sRegDtTo").data("kendoExtMaskedDatePicker").value('');
            $("#gridHeader").data("kendoExtGrid").dataSource.read();
            firstTimeOpen = false;
        }else{
            $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(frDt);
            $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
            $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

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
            if(id === 'sRegDtFr'){
                var minDate = new Date(frDt);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(frDt);
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sRegDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
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

