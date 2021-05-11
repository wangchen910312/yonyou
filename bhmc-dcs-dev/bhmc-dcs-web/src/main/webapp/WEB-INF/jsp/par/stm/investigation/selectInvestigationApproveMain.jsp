<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 재고 실사 문서정보 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.stockDDDocInfo" /> --%><!-- 재고실사 문서정보 --></h1>
            <div class="btn_right">
                <button class="btn_m btn_save" id="btnApply"><spring:message   code="par.btn.approval" /><!-- 승인 --></button>
                <button class="btn_m btn_del" id="btnRejectDocNo"><spring:message  code="par.btn.appRollback" /><!-- 반려 --></button>
                <button class="btn_m btn_reset" id="btnInit"><spring:message       code="par.btn.init" /><!-- 초기화 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per" id="investigationForm">
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
                        <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sStockDdDocNo" class="form_input" readonly>
                                <a id="searchStockDdDocNo"><!-- 검색 --></a>
                                <input type="text" id="sStrgeCd" class="form_input hidden">
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockDdStatCd" /><!-- 재고실사상태 --></th>
                        <td>
                            <input id="sDocStatCd" class="form_comboBox" data-type="combo">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 재고실사 담당자 --></th>
                        <td>
                            <input id="sPrsnId" type="text" class="form_input form_readonly" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.date" /><!-- 등록일 --></th>
                        <td class="readonly_area">
                            <input type="text" id="sRegDt" class="form_datepicker" readonly>
                        </td>
<!-- 6/3 변경 전:승인요청일자, par.lbl.approveReqDt,sApproveReqDt  -->
                        <th scope="row"><spring:message code="par.lbl.invRsltRegDt" /><!-- 승인결과등록일자 --></th>
                        <td class="readonly_area">
                            <input type="text" id="sInvRsltRegDt" class="form_datepicker" readonly>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockLockYn" /><!-- 재고통제여부 --></th>
                        <td>
                            <input id="sStockLockYn" class="form_comboBox" data-type="combo">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td colspan="3">
                            <input id="remark" type="text" readonly class="form_input form_readonly">
                        </td>
<!-- 6/3 변경 전:반려일, par.lbl.rejectDt,sCancDt -->
                        <th scope="row"><spring:message code="par.lbl.evalDt" /><!-- 심사일자 --></th>
                        <td class="readonly_area">
                            <input type="text" id="sEvalDt" class="form_datepicker" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.signOpnCont" /><!--결제의견 --></th>
                        <td colspan="3">
                            <input id="sSignOpnCont" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.type" /><!-- 유형 --></th>
                        <td>
                            <input id="sType" class="form_comboBox" data-type="combo">
                        </td>
<%--                    <th scope="row"><spring:message code="par.lbl.completeDt" /><!-- 완료일 --></th>
                        <td class="readonly_area">
                            <input type="text" id="sEndDt" class="form_datepicker" readonly>
                        </td> --%>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="grid2" class="grid"></div>
        </div>

        <div class="table_grid mt10">
            <!-- 재고실사승인요청대상 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //재고실사 대상 조회 정보 -->


<!-- script -->
<script>

        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            binLocLvlCnt        = "${binLocLvlCnt}",
            pStockDdDocNo       = "${pStockDdDocNo}",
            purcOrdTpObj        = {},
            locationListObj     = {},
            locationObj         = {},
            unitCdObj           = {},
            stockYnList         = [],
            binLocObj           = {},
            binLocLvl1Obj       = {},
            binLocLvl2Obj       = {},
            binLocLvl3Obj       = {},
            binLocLvl4Obj       = {},
            binLocLvl5Obj       = {},
            docStatList         = [],
            docStatObj          = {},
            itemStatObj         = {},
            itemDstinCdObj      = {},
            abcIndObj           = {},
            carlineCdObj        = [],
            storageObj          = {},
            stockLockYnList     = [],
            searchRemark,
            rowNumber           = 0, //그리드 목록 번호
            investigationListPopupWindow;

        storageObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

        stockLockYnList.push({cmmCd:"", cmmCdNm:" "});
        stockLockYnList.push({cmmCd:"Y", cmmCdNm:"是"});
        stockLockYnList.push({cmmCd:"N", cmmCdNm:"否"});


        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>


        itemDstinCdObj[' '] = "";
        <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        abcIndObj[' '] = "";
        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        carlineCdObj[' '] = "";
        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
        </c:forEach>

        docStatList.push({cmmCd:"", cmmCdNm:" "});
        docStatObj[' '] = "";
        <c:forEach var="obj" items="${docStatList}" varStatus="status">
            docStatList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            docStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        itemStatObj[' '] = "";
        <c:forEach var="obj" items="${itemStatList}" varStatus="status">
            itemStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>


    $(document).ready(function() {

        //재고실사상태
       $("#sDocStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:docStatList
           ,index:0
       });


       $("#sStockLockYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:stockLockYnList
           ,index:0
       });


        //등록일
        $("#sRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //실사결과등록일자
        $("#sInvRsltRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

/*         //승인요청일
        $("#sApproveReqDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */

        //심사일자
        $("#sEvalDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

/*         //반려일
        $("#sCancDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */


        //완료일
        /*$("#sEndDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });*/

        //유형
        $("#sType").kendoExtDropDownList({
           dataSource:[
                         {"cmmCd":"01", "cmmCdNm":"盘盈"} //Overage
                        ,{"cmmCd":"02", "cmmCdNm":"盘亏"} //Shortage
                        ,{"cmmCd":"03", "cmmCdNm":"确认"} //확정
                   ]
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,optionLabel   :" "
        });

        $("#searchStockDdDocNo").on('click', selectInvestigationListPopupWindow);


        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });



        // 반려 버튼
        $("#btnRejectDocNo").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    paramUrl      = '',
                    chkRow,
                    header;



                if(dms.string.isEmpty($("#sStockDdDocNo").val())){
                    //재고실사정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.required.field' arguments='${stockDdDoc}'/>");
                    return false;
                }

                header = {
                    stockDdDocNo   :$("#sStockDdDocNo").val()
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
                        if(gridData.itemStatCd !== 'REQ'){
                            // 반려할 수 없습니다.
                            dms.notification.warning("<spring:message code='par.btn.appRollback' var='appRollback' /><spring:message code='global.err.failedParam' arguments='${appRollback}'/>");
                            saveList = [];
                            return false;
                        }
                        saveList.push(gridData);
                    }

                });

                if(saveList.length > 0){
                    var data ={
                           "investigationVO":header
                          ,"investigationItemList":saveList
                        };

                    $.ajax({
                        url:"<c:url value='/par/stm/investigation/updateInvestigationByReject.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:false
                       ,success:function(result) {

                           if (result === 1) {

                               //반려 완료 되었습니다.
                               dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.rejectSuccessParam' arguments='${stockDdDoc}'/>");
                              // 재 조회.
                              selectInvestigationListByKey($("#sStockDdDocNo").val());

                           } else {
                               if(result === 0){
                                   //반려 실패하였습니다.
                                   dms.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.rejectFailedParam' arguments='${stockDdDoc}'/>");
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

        // 승인 버튼
        $("#btnApply").kendoButton({
            click:function(e){

                var saveList      = [],
                    grid          = $("#grid").data("kendoExtGrid"),
                    rows          = grid.tbody.find("tr"),
                    paramUrl      = '',
                    header;

                if(dms.string.isEmpty($("#sStockDdDocNo").val())){
                    //재고실사정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.required.field' arguments='${stockDdDoc}'/>");
                    return false;
                }

                if($("#sDocStatCd").data("kendoExtDropDownList").value() !== 'REQ'){
                    //승인요청 상태에서만 승인가능합니다.
                    dms.notification.warning("<spring:message code='par.info.applyStatMsg' />");
                    return false;
                }


                header = {
                    stockDdDocNo   :$("#sStockDdDocNo").val()
                   ,stockLockYn    :$("#sStockLockYn").data("kendoExtDropDownList").value()
                   ,signOpnCont    :$("#sSignOpnCont").val()
                   ,strgeCd        :$("#sStrgeCd").val()
                };

                if(rows.length  == 0 ){
                    // 선택값이 없습니다.
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                rows.each(function(index, row) {
                    var gridData = grid.dataSource.at(index);


                    if(dms.string.isEmpty(gridData.ddQty) || gridData.ddQty === 0){
                        // 실사 수량을 입력하십시오
                        dms.notification.warning("<spring:message code='par.lbl.ddQty' var='ddQty' /><spring:message code='global.info.confirmMsgParam' arguments='${ddQty}'/>");
                        saveList = [];
                        return false;
                    }

                    if( gridData.diffQty !== 0){
                        if(dms.string.isEmpty(gridData.reasonCont)){
                            // 손익 수량이 존재하는 경우 차이사유는 필수 입력 사항입니다.
                            dms.notification.warning("<spring:message code='par.error.reasonContEmpty'/>");
                            saveList = [];
                            return false;
                        }
                    }

                    if(dms.string.isEmpty(gridData.itemStatCd) || gridData.itemStatCd !== 'REQ'){
                        // 승인요청시에만 승인가능합니다.
                        dms.notification.warning("<spring:message code='par.info.applyStatMsgParam' arguments='" + gridData.itemCd + "'/>");
                        saveList = [];
                        return false;
                    }

                    saveList.push(gridData);
                });

                if(saveList.length > 0){
                    var data ={
                           "investigationVO":header
                          ,"investigationItemList":saveList
                        };

                    $.ajax({
                        url:"<c:url value='/par/stm/investigation/updateInvestigationApplyCnfm.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:false
                       ,success:function(result) {

                           if (result === 1) {

                               //승인요청 완료 되었습니다.
                               dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.applyReqSuccessParam' arguments='${stockDdDoc}'/>");

                               selectInvestigationListByKey($("#sStockDdDocNo").val());


                           } else {
                               if(result === 0){
                                   //승인요청 실패하였습니다.
                                   dms.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.applyReqFailedParam' arguments='${stockDdDoc}'/>");
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


        $("#grid2").kendoGrid({
              height:90
            , scrollable :true
            , columns:[{
                title:"盘点对象",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:""
                   ,title:"<spring:message code='sal.lbl.totNo'  />"
                   ,width:60
                },{
                    field:""
                   ,title:"<spring:message code='par.lbl.qty'  />"
                   ,width:60
                },{
                    field:""
                   ,title:"<spring:message code='global.lbl.amt'  />"
                   ,width:80
                }]
            },{
                title:"实际",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:""
                   ,title:"<spring:message code='sal.lbl.totNo'  />"
                   ,width:60
                },{
                    field:""
                   ,title:"<spring:message code='par.lbl.qty'  />"
                   ,width:60
                },{
                    field:""
                   ,title:"<spring:message code='global.lbl.amt'  />"
                   ,width:80
                }]
            },{
                title:"盘盈",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:""
                   ,title:"<spring:message code='sal.lbl.totNo'  />"
                   ,width:60
                },{
                    field:""
                   ,title:"<spring:message code='par.lbl.qty'  />"
                   ,width:60
                },{
                    field:""
                   ,title:"<spring:message code='global.lbl.amt'  />"
                   ,width:80
                }]
            },{
                title:"盘亏",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:""
                   ,title:"<spring:message code='sal.lbl.totNo'  />"
                   ,width:60
                },{
                    field:""
                   ,title:"<spring:message code='par.lbl.qty'  />"
                   ,width:60
                },{
                    field:""
                   ,title:"<spring:message code='global.lbl.amt'  />"
                   ,width:80
                }]
            },{
                title:"确认",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:""
                   ,title:"<spring:message code='sal.lbl.totNo'  />"
                   ,width:60
                },{
                    field:""
                   ,title:"<spring:message code='par.lbl.qty'  />"
                   ,width:60
                },{
                    field:""
                   ,title:"<spring:message code='global.lbl.amt'  />"
                   ,width:80
                }]
            }]
        });



      // 재고실사관리 그리드
         $("#grid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                          url:"<c:url value='/par/stm/investigation/selectApproveReqInvestigations.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["sort"]               = options.sort;

                             // 재고실사대상 검색조건 코드.
                             params["sStockDdDocNo"]      = $("#sStockDdDocNo").val();

                             return kendo.stringify(params);
                         }
                     }
                 }
                 ,schema:{
                      data:function (result){

                          if(result.total === 0){
                              dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                          }

                          return result.data;
                      }
                     ,total:"total"
                     ,model:{
                        id:"stockDdDocNo"
                       ,fields:{
                               dlrCd          :{ type:"string" , validation:{required:true} }
                             , strgeCd        :{ type:"string", editable:false }
                             , stockDdDocNo   :{ type:"string", editable:false }
                             , stockDdDocLineNo:{ type:"number", editable:false }
                             , strgeCd        :{ type:"string", editable:false }
                             , locCd          :{type :"string", editable:false } //로케이션
                             , itemCd         :{ type:"string", editable:false }
                             , itemNm         :{ type:"string", editable:false }
                             , itemDstinCd    :{type :"string", editable:false } //품목구분
                             , itemStatCd     :{type :"string", editable:false } //품목구분
                             , carlineCd      :{type :"string", editable:false } //차종
                             , abcInd         :{type :"string", editable:false } //ABC CLASS
                             , lastGrDt       :{ type:"date"  , editable:false }
                             , lastGiDt       :{ type:"date"  , editable:false }
                             , unitCd         :{ type:"string", editable:false }
                             , bookQty        :{ type:"number", editable:false }
                             , ddQty          :{ type:"number", editable:false }
                             , diffQty        :{ type:"number", editable:false }
                             , movingAvgPrc   :{ type:"number", editable:false }
                             , reasonCont     :{ type:"string", editable:false }
                         }
                     }
                 }
             }
             , selectable :"multiple"
             , scrollable :true
             , sortable   :false
             , autoBind   :false
             , multiSelectWithCheckbox:true
             , editable   :false
             , dataBinding :function(e){
                   rowNumber = 0;
             }
             , pageable:false
             , columns:[
                   {
                       title:"<spring:message code='par.lbl.line'  />"
                      ,field:"rnum"
                      ,attributes:{ "style":"text-align:center"}
                      ,sortable:false
                      ,hidden  :true
                      ,template:"#= ++rowNumber #"
                      ,width:40
                   }    //No
                 , {   //딜러코드
                       title     :"<spring:message code='par.lbl.dlrCd' />"
                      ,field     :"dlrCd"
                      ,width     :80
                      ,hidden     :true
                   }
                 , {   //재고실사번호
                       title:"<spring:message code='par.lbl.stockDdDoc' />"
                      ,field:"stockDdDocNo"
                      ,width:140
                      ,hidden     :true
                   }
                 , {   //재고실사라인번호
                       title:"<spring:message code='par.lbl.lineNm' />"
                      ,field:"stockDdDocLineNo"
                      ,attributes:{ "style":"text-align:right"}
                      ,width:40
                      ,hidden     :true
                   }
                 , {   //창고
                       title     :"<spring:message code='par.lbl.strgeCd' />"
                      ,field     :"strgeCd"
                      ,width     :100
                      ,template  :'#= changeStrgeCd(strgeCd)#'
                   }
                 , {   //로케이션
                       title     :"<spring:message code='par.lbl.locationCd' />"
                      ,field     :"locCd"
                      ,width     :140
                      //,template  :'#= changeLocCd(locCd)#'
                   }
                 , {   //부품번호
                       title     :"<spring:message code='par.lbl.itemCd' />"
                      ,field     :"itemCd"
                      ,width     :140
                   }
                 , {   //부품명
                       title     :"<spring:message code='par.lbl.itemNm' />"
                      ,field     :"itemNm"
                      ,width     :200
                   }
                 , {   //품목상태
                       title     :"<spring:message code='par.lbl.itemStatCd' />"
                      ,field     :"itemStatCd"
                      ,width     :90
                      ,template  :'#= changeItemStatCd(itemStatCd)#'
                   }
                  ,{   //품목구분
                       title     :"<spring:message code='par.lbl.itemDstin'  />"
                      ,field     :"itemDstinCd"
                      ,width     :80
                      ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                      ,attributes:{ "style":"text-align:left"}
                   }
                  ,{   //차형
                       title     :"<spring:message code='par.lbl.model'  />"
                      ,field     :"carlineCd"
                      ,width     :120
                      ,template  :'#= changeCarlineCd(carlineCd)#'
                      ,attributes:{ "style":"text-align:left"}
                   }
                  ,{   //ABC Class
                       title     :"<spring:message code='par.lbl.abcInd'  />"
                      ,field     :"abcInd"
                      ,width     :90
                      ,template  :'#= changeAbcInd(abcInd)#'
                      ,attributes:{ "style":"text-align:left"}
                   }
                 , {   //최종입고일
                       title:"<spring:message code='par.lbl.lastGrDt' />"
                      ,field:"lastGrDt"
                      ,width:90
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                   }
                 , {   //최종출고일
                       title:"<spring:message code='par.lbl.lastGiDt' />"
                      ,field:"lastGiDt"
                      ,width:90
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                   }
                 , {   //단위
                       title:"<spring:message code='par.lbl.unitNm' />"
                      ,field:"unitCd"
                      ,width:80
                      ,attributes:{ "style":"text-align:center"}
                      ,hidden:true
                      ,template:'#= changeUnit(unitCd)#'
                   }
                 , {   //장부수량
                       title:"<spring:message code='par.lbl.bookQty' />"
                      ,field:"bookQty"
                      ,width:80
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                   }
                 , {   //실사수량
                       title:"<spring:message code='par.lbl.ddQty' />"
                      ,field:"ddQty"
                      ,width:80
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                   }
                 , {   //손익수량
                       title:"<spring:message code='par.lbl.diffQty' />"
                      ,field:"diffQty"
                      ,width:80
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                   }
                 , {   //단가
                       title:"<spring:message code='global.lbl.prc' />"
                      ,field:"movingAvgPrc"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //차이사유
                       title:"<spring:message code='par.lbl.reasonCont' />"
                      ,field:"reasonCont"
                      ,width:140
                   }
                 , { field:"" }
             ]
         });

         // 입고 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = storageObj[val];
             }
             return returnVal;
         };

         // 로케이션
         changeLocCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = locationObj[val];
             }
             return returnVal;
         };

         //단위
         changeUnit = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = unitCdObj[val];
             }
             return returnVal;
         };

         //품목구분
         changeItemDstinCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = itemDstinCdObj[val];
             }
             return returnVal;
         };

         //품목상태
         changeItemStatCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = itemStatObj[val];
             }
             return returnVal;
         };

         //ABC 클래스
         changeAbcInd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = abcIndObj[val];
             }
             return returnVal;
         };

         //차종
         changeCarlineCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = carlineCdObj[val];
             }
             return returnVal;
         };


        // 재고실사리스트 팝업 열기 함수.
        function selectInvestigationListPopupWindow(){

            investigationListPopupWindow = dms.window.popup({
                windowId:"investigationListPopup"
                ,title:"<spring:message code='par.title.stockDDDocInfo' />"   // 재고실사정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectInvestigationListPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"stockDdDocNo":$("#sStockDdDocNo").val()
                        ,"docStatCd"   :"REQ"
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                $("#sStockDdDocNo").val(data[0].stockDdDocNo);
                                $("#sStrgeCd").val(data[0].strgeCd);
                                $("#sDocStatCd").data("kendoExtDropDownList").value(data[0].docStatCd);
                                $("#sPrsnId").val(data[0].prsnId);
                                //$("#sApproveReqDt").data("kendoExtMaskedDatePicker").value(data[0].approveReqDt);
                                //$("#sCancDt").data("kendoExtMaskedDatePicker").value(data[0].cancDt);
                                //$("#sEndDt").data("kendoExtMaskedDatePicker").value(data[0].endDt);
                                $("#sRegDt").data("kendoExtMaskedDatePicker").value(data[0].regDt);
                                $("#sStockLockYn").data("kendoExtDropDownList").value(data[0].stockLockYn);
                                $("#sSignOpnCont").val(data[0].signOpnCont);
                                $("#remark").val(data[0].remark);

                                searchRemark = data[0].remark;


                                //$("#btnApply").show();
                                $("#btnApply").data("kendoButton").enable(true);
                                //$("#btnRejectDocNo").show();
                                $("#btnApply").data("kendoButton").enable(true);

                                $("#grid").data("kendoExtGrid").dataSource.read();
                            }
                            investigationListPopupWindow.close();
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
            if (!partsJs.validate.getAllPluginObjInfo($("#investigationForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            $("#grid").data("kendoExtGrid").dataSource.data([]);
           // $("#grid2").data("kendoExtGrid").dataSource.data([]);

            $("#sStockLockYn").data("kendoExtDropDownList").enable(false);
            $("#sDocStatCd").data("kendoExtDropDownList").enable(false);

            //$("#btnApply").hide();
            $("#btnApply").data("kendoButton").enable(false);
            //$("#btnRejectDocNo").hide();
            $("#btnRejectDocNo").data("kendoButton").enable(false);

            //재고실사 현황에서 넘어온경우
            if(!dms.string.isEmpty(pStockDdDocNo)){
                //$("#sStockDdDocNo").val(pStockDdDocNo);

                var header = {
                        sStockDdDocNo:pStockDdDocNo
                };

                $.ajax({
                    url:"<c:url value='/par/stm/investigation/selectInvestigationListByKey.do' />"
                   ,data:kendo.stringify(header)
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,async:false
                   ,success:function(result) {

                       if (!dms.string.isEmpty(result)) {
                           //dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.modifySuccessParam' arguments='${stockDdDoc}'/>");

                           $("#sStockDdDocNo").val(result.stockDdDocNo);
                           $("#sStrgeCd").val(result.strgeCd);
                           $("#sDocStatCd").data("kendoExtDropDownList").value(result.docStatCd);
                           $("#sPrsnId").val(result.prsnId);
                           //$("#sApproveReqDt").data("kendoExtMaskedDatePicker").value(result.approveReqDt);
                           //$("#sCancDt").data("kendoExtMaskedDatePicker").value(result.cancDt);
                           $("#sRegDt").data("kendoExtMaskedDatePicker").value(result.regDt);
                           $("#sStockLockYn").data("kendoExtDropDownList").value(result.stockLockYn);
                           $("#sSignOpnCont").val(result.signOpnCont);
                           $("#remark").val(result.remark);

                           // 재 조회.
                           $("#grid").data("kendoExtGrid").dataSource.read();

                       } else {
                           if(result === 0){
                               dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                           }
                       }
                   }
                   ,error:function(jqXHR,status,error) {
                       dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }

               });


            }
        }


        function selectInvestigationListByKey(pStockDdDocNo){
            var header = {
                    sStockDdDocNo:pStockDdDocNo
            };
            $.ajax({
                url:"<c:url value='/par/stm/investigation/selectInvestigationListByKey.do' />"
               ,data:kendo.stringify(header)
               ,type:'POST'
               ,dataType:'json'
               ,contentType:'application/json'
               ,async:false
               ,success:function(result) {

                   if (!dms.string.isEmpty(result)) {
                       //dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.modifySuccessParam' arguments='${stockDdDoc}'/>");

                       $("#sDocStatCd").data("kendoExtDropDownList").value(result.docStatCd);


                       if($("#sDocStatCd").data("kendoExtDropDownList").value() === 'END'){
                           //$("#sEndDt").data("kendoExtMaskedDatePicker").value(result.endDt);
                           //$("#btnApply").hide();
                           $("#btnApply").data("kendoButton").enable(false);
                           //$("#btnRejectDocNo").hide();
                           $("#btnRejectDocNo").data("kendoButton").enable(false);
                       }else if($("#sDocStatCd").data("kendoExtDropDownList").value() === 'RGST'){
                           //$("#btnApply").hide();
                           $("#btnApply").data("kendoButton").enable(false);
                           //$("#btnRejectDocNo").hide();
                           $("#btnRejectDocNo").data("kendoButton").enable(false);
                       }else{
                           //$("#btnApply").show();
                           $("#btnApply").data("kendoButton").enable(true);
                           //$("#btnRejectDocNo").show();
                           $("#btnRejectDocNo").data("kendoButton").enable(true);
                        }



                       // 재 조회.
                       $("#grid").data("kendoExtGrid").dataSource.read();

                   } else {
                       if(result === 0){
                           dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                       }
                   }
               }
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }

           });
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

</script>
<!-- //script -->

