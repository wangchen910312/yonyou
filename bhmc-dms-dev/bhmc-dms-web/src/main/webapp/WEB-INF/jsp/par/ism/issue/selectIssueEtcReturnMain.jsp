<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
    <!-- 기타출고정보 -->
<div id="resizableContainer">
    <section class="group" id="screenSection">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11926" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11925" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.save" /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11924" hasPermission="${dms:getPermissionMask('READ')}">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.receiveEtcBorrowNo" /><!-- 차입입고번호 --></th>
                        <td>
                            <input id="sEtcGrDocNo" class="form_input" />
                            <input type="hidden" id="sSelectEtcGrDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.borrowDocDt" /><!-- 차입입고일자 --></th>
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
                        <th scope="row"><spring:message code="par.lbl.borrower" /><!-- 차입입고인 --></th>
                        <td>
                            <input id="sRegUsrNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.borrowRemark" /><!--차입입고비고 --></th>
                        <td>
                            <input id="sRemark" type="text" value="" class="form_input">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <!-- 차입입고 그리드 -->
            <div id="gridHeader" class="grid"></div>
        </div>

        <div class="table_form form_width_70per mt10" id="etcGiForm">
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
                        <th scope="row"><spring:message code="par.lbl.borrowReturnNo" /><!-- 차입반환출고번호 --></th>
                        <td>
                            <input type="text" id="etcGiDocNo" class="form_input form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.borrowReturnDt" /><!-- 차입반환일자 --></th>
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
                <button class="btn_s btn_add btn_s_min5"  id="btnBorrowAdd"><spring:message     code="par.btn.addBorrowDoc" /></button>
                <button class="btn_s btn_del btn_s_min5"  id="btnBorrowDel"><spring:message     code="par.btn.delBorrowDoc" /></button>
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <div class="table_grid">
            <!-- 부품기타출고 그리드 -->
            <div id="grid" class="resizable_grid"></div>
        </div>

    </section>
    <!-- //부품기타출고 -->
</div>
<!-- script -->
<script>

    var toDt                = "${toDt}",
        frDt                = "${frDt}",
        sessionDlrCd        = "${dlrCd}",
        pIssueEtcNo         = "${pIssueEtcNo}",
        gVatCd              = Number("${vatCd}"),
        mvtTpList           = [],
        unitCdObj           = {},
        strgeTpObj          = {},
        strgeTpList         = [],
        locationListObj     = {},
        locationObj         = {},
        statCdObj           = {},
        popItemObj          = {},
        issueEtcRentalPopupWindow,
        customerSearchPopupWin,
        issueEtcListPopupWindow,
        changeAmtEditor,
        changeUnitCd,
        changeItemDstinCd,
        firstTimeOpen = true;  //차입입고에서 취소로 넘어온 경우 초기화 버튼이 디폴트로 안먹는 것을 위해 만듬.


        locationObj[' '] = "";
        //mvtTpList.push({cmmCd:"48", cmmCdNm:"借进归还出库"});//TODO [InBoShim] 차입반환출고 중문교체.

        if(dms.string.isEmpty(gVatCd)){
            console.log('gVatCd 값 없음!');
            //gVatCd = .16;
            gVatCd = .13;
        }
        console.log('gVatCd:',gVatCd);

        <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
            if("48" === "${obj.cmmCd}"){
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

    $(document).ready(function() {

        //기타출고유형선택
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

        //입고일자
        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //입고일자
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
                    paramUrl      = '',
                    readObj       = {},
                    chkRow,
                    header,
                    chkCalcAmt;

                if(dms.string.isEmpty($("#bpCd").val())){
                    // 거래처을 입력하십시오
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
                      , refDocNo        :$('#sSelectEtcGrDocNo').val()
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
                        if(!dms.string.isEmpty(gridData.itemCd)){

                            if(dms.string.isEmpty(gridData.prc) || gridData.prc == 0){
                                // 단가를 입력하십시오.
                                dms.notification.warning("<spring:message code='par.lbl.prc' var='prc' /><spring:message code='global.info.confirmMsgParam' arguments='${prc}'/>");
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
                                // 차입수량보다 클 수 없습니다.
                                dms.notification.warning("<spring:message code='par.lbl.qty' var='qty' /><spring:message code='par.lbl.avlbInQty' var='avlbInQty' /><spring:message code='global.err.chkGreateParam' arguments='${qty},${avlbInQty}'/>");
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
                           "issueEtcVO":header
                          ,"issueEtcItemList":saveList
                        };

                    $.ajax({
                         url:"<c:url value='/par/ism/issue/createIssueEtc.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:true
                        ,success:function(result) {

                            if (result.resultYn == true) {
                                dms.notification.success("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGiDocNo}'/>");

                                if (!partsJs.validate.getAllPluginObjInfo($("#etcGiForm")[0])) {
                                    return false;
                                }

                                partsJs.validate.groupObjAllDataSet(result);

                                readObj.etcGrDocNo = $('#sSelectEtcGrDocNo').val();
                                $("#gridHeader").data("kendoExtGrid").dataSource.read();
                                $("#grid").data("kendoExtGrid").dataSource.read(readObj);

                            } else {

                                if(result === 0){
                                    dms.notification.error("<spring:message code='par.lbl.etcGiDocNo' var='etcGiDocNo' /><spring:message code='global.err.regFailedParam' arguments='${etcGiDocNo}'/>");
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
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
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
                 options.model.set("amt", Math.round(Number(options.model.prc) * Number(options.model.qty) * 100)/100 );
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
                 max:options.model.borrowQty
             });
         };


         giLocCdDropDownEditor = function(container, options) {

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
              gridId:"G-PAR-0921-141501"
             ,dataSource:{
                  transport:{
                      read:{
                          url:"<c:url value='/par/pcm/receive/selectReceiveEtcs.do' />"
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

                              params["sMvtTp"]             = '35';
                              params["sEtcGrDocNo"]        = $("#sEtcGrDocNo").val();
                              params["sRegDtFr"]           = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                              params["sRegDtTo"]           = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
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
                              , etcGrDocNo        :{ type:"string" }
                              , etcGrDocLineNo    :{ type:"number" }
                              , regUsrId          :{ type:"string" }
                              , itemCnt           :{ type:"number" }
                              , itemQty           :{ type:"number" }
                              , returnItemCnt     :{ type:"number" }
                              , returnItemQty     :{ type:"number" }
                              , regDt             :{ type:"date"   }
                              , grTotAmt          :{ type:"number" }
                              , returnTotAmt      :{ type:"number" }
                              , grTaxDdctAmt      :{ type:"number" }
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
                      $("#etcGiDocNo").val('');
                      $("#regDt").data("kendoExtMaskedDatePicker").value('');
                      $("#sSelectEtcGrDocNo").val(selectedItem.etcGrDocNo);
                      $("#updtDtStr").val(selectedItem.updtDtStr);
                      readObj.etcGrDocNo = selectedItem.etcGrDocNo;
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
                  ,{field:"etcGrDocNo"
                       ,title:"<spring:message code='par.lbl.receiveEtcBorrowNo' />"
                       ,width:150} //차입입고번호
                  ,{field:"etcGrDocLineNo"
                       ,title:"<spring:message code='par.lbl.lineNm' />"
                       ,width:35
                       ,hidden:true}   //Line
                  ,{field:"regDt"
                       ,title:"<spring:message code='par.lbl.borrowDocDt' />"
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                       ,attributes:{ "style":"text-align:center"}
                       ,width:90}  //차입등록일
                  ,{field:"regUsrId"
                       ,title:"<spring:message code='par.lbl.borrower' />"
                       ,width:120
                       ,hidden:true} //차입입고인
                  ,{field:"regUsrNm"
                       ,title:"<spring:message code='par.lbl.borrower' />"
                       ,width:120} //차입입고인
                  ,{field:"remark"
                       ,title:"<spring:message code='par.lbl.borrowRemark' />"
                       ,width:100}              //비고
                  ,{field:"bpCd"
                       ,title:"<spring:message code='par.lbl.bpCstCd' />"
                       ,width:105}  //거래처 코드
                  ,{field:"bpNm"
                       ,title:"<spring:message code='par.lbl.bpCstNm' />"
                       ,width:200}  //공급업체
                  ,{field:"itemCnt"
                       ,title:"<spring:message code='par.lbl.borrowItemCnt' />"
                       ,width:80
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n0}"}                //차입건수
                  ,{field:"itemQty"
                       ,title:"<spring:message code='par.lbl.borrowItemQty' />"
                       ,width:80
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n0}"}                //차입수량
                  ,{field:"grTotAmt"
                       ,title:"<spring:message code='par.lbl.borrowAmt' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"}                //차입금액
                  ,{field:"grTaxDdctAmt"
                       ,title:"<spring:message code='par.lbl.borrowTaxDdctAmt' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"
                       ,hidden:true}                //차입금액(세금제외)
                  ,{field:"returnItemCnt"
                       ,title:"<spring:message code='par.lbl.returnBorrowItemCnt' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n0}"}                //차입반환건수
                  ,{field:"returnItemQty"
                       ,title:"<spring:message code='par.lbl.returnBorrowItemQty' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n0}"}                //차입반환수량
                  ,{field:"returnTotAmt"
                       ,title:"<spring:message code='par.lbl.returnBorrowAmt' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"}                //차입반환금액
                  ,{field:"returnTaxDdctAmt"
                       ,title:"<spring:message code='par.lbl.returnBorrowTaxDdctAmt' />"
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,format:"{0:n2}"
                       ,hidden:true}                //차입반환금액(세금제외)
                  ,{field:"updtDtStr"
                       ,title:" "
                       ,width:100
                       ,attributes:{ "style":"text-align:right"}
                       ,hidden:true}                //수정일시
              ]
          });

        // 부품기타출고등록 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0921-151701"
           ,height:480
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/receive/selectBorrowItemByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 차입입고현황 검색조건 코드.
                            params["sEtcGrDocNo"] = options.etcGrDocNo;

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
                            , borrowQty       :{ type:"number", editable:false }
                            , qty             :{ type:"number"}
                            , remainQty       :{ type:"number", editable:false }
                            , returnQty       :{ type:"number", editable:false }
                            , prc             :{ type:"number", editable:false }
                            , movingAvgPrc    :{ type:"number", editable:false }
                            , amt             :{ type:"number" }
                            , taxAmt          :{ type:"number" }
                            , avlbStockQty    :{ type:"number", editable:false }
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
                    orgVal,
                    lineDisabled;

                $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", true);
                if(fieldName === "chk"){
                    this.closeCell();
                } else if(fieldName === "qty") {
                    lineDisabled = selectedItem.qty;
                    if(selectedItem.remainQty == 0) { //남은수량 = 0 일때 editorable 삭제
                        this.closeCell();
                        $(".grid-checkbox-item[data-uid=" + e.model.uid + "]").prop("checked", false);
                    }
                }
             }
            ,dataBound:function(e){
                var grid         = this,
                    //fieldName    = grid.columns[e.container.qty].field,
                    rowsChk      = e.sender.select(),
                    selectedItem = e.sender.dataItem(rowsChk[0]),
                    rows = e.sender.tbody.children();
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
                , {   //차입입고번호
                      title:"<spring:message code='par.lbl.receiveEtcBorrowNo' />"
                     ,field:"refDocNo"
                     ,width:140
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
                     //,editor:giLocCdDropDownEditor
                     //,template:'#= changeGiLocCd(strgeCd, locCd)#'
                     ,sortable:false
                     ,hidden:true
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "class":"ac"}
                     ,template:'#= changeUnitCd(unitCd)#'
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.giQty' />"
                     ,field:"qty"
                     ,width:80
                     ,attributes:{ "class":"bg_white ar"}
                     ,editor:changeAmtEditor
                     ,format:"{0:n0}"
                  }
                , {   //차입수량
                      title:"<spring:message code='par.lbl.avlbInQty' />"
                     ,field:"borrowQty"
                     ,width:80
                     ,attributes:{ "class":"ar"}
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
                }//출고단가(세금미포함)
               ,{
                      field:"taxDdctAmt"
                     ,title:"<spring:message code='par.lbl.amtTax' />"
                     ,width:80
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,hidden:true
                }//출고금액(세금미포함)
              , {   //가용수량
                      title:"<spring:message code='par.lbl.avlbStockQty' />"
                     ,field:"avlbStockQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,hidden:true
                }
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
         changeGiLocCd = function(strgeCd, locCd){
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
        if (!partsJs.validate.getAllPluginObjInfo($("#etcGiForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#gridHeader").data("kendoExtGrid").dataSource.data([]);

        $("#mvtTp").data("kendoExtDropDownList").value('48');
        $("#mvtTp").data("kendoExtDropDownList").enable(false);

        //$("#btnBorrowAdd").data("kendoButton").enable(true);
        //$("#btnBorrowDel").data("kendoButton").enable(true);
        $("#btnBorrowAdd").hide();
        $("#btnBorrowDel").hide();
        $("#btnSave").data("kendoButton").enable(true);

        $("#dlrCd").val(sessionDlrCd);

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();


        popItemObj = {};


        //기타입고현황 관리에서 넘어온 경우
        if(!dms.string.isEmpty(pIssueEtcNo) && firstTimeOpen === true){
            //selectEtcReceive(pIssueEtcNo);
            $("#sEtcGrDocNo").val(pIssueEtcNo);
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

