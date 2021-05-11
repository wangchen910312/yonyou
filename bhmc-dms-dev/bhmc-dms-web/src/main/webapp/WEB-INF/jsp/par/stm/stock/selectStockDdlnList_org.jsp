<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- 월마감조회 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
             <h1 class="title_basic"><%-- <spring:message code="par.title.purcSubStsList" /> --%><!-- 구매현황 조회 --></h1>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11861" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11860" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnExcelDownload"><spring:message code="par.btn.excelDownload" /><!-- 엑셀다운로드 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11859" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </dms:access>
            </div>
        </div>

        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.accMm" /><!-- 회계월 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sAccYyMmFr" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                    <input id="sAccYy" data-type="multicombo" class="form_comboBox hidden" />
                                    <input id="sAccMm" data-type="multicombo" class="form_comboBox hidden" />
                                </div>
                                <div class="date_right">
                                    <input id="sAccYyMmTo" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                        <td>
                             <input id="sItemDstinCd" data-type="combo" class="form_comboBox" />
                            <input id="sAccPeriod" class="form_input hidden">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.strge" /><!-- 창고 --></th>
                        <td>
                            <input id="sStrgeCd" class="form_comboBox" data-type="combo"/>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.carlineNm' /></th>       <!-- 차종 -->
                        <td>
                            <input id="sCarlineCd" class="form_comboBox" data-type="combo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번(부품번호) --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" />
                            <input id="sStartStocQty" data-type="number" min="1" class="form_numeric hidden" />
                            <input id="sEndStocQty" data-type="number" min="1" class="form_numeric hidden" />
                            <input id="sBpTp" class="form_comboBox hidden" data-type="combo" />
                            <input id="sLocCd" class="form_input hidden" />
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- // tab start-->
        <div id="tabstrip" class="tab_area mt10">
            <ul>
                <li id="stockDdlnHd" class="k-state-active"><spring:message code="par.title.grGiSaleList" /><!-- 입출고판매현황 --></li>
                <li id="stockDdlnDtl" ><spring:message code="par.title.grGiSaleDetailList" /><!-- 입출고판매명세 --></li>
            </ul>

            <div>
                <div  class="table_grid">
                    <!-- 입고 그리드 -->
                    <div id="grid" class="resizable_grid"></div>
                </div>
            </div>
            <div>
                <div  class="table_grid">
                    <!-- 출고 그리드 -->
                    <div id="gridDetail" class="resizable_grid"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- //구매오더 -->
</div>
<!-- script -->
<script>
     var abcIndList      = []
        ,carlineCdList   = []
        ,carlineCdObj    = {}
        ,itemDstinList   = []
        ,itemDstinCdObj  = {}
        ,mvtTpChkObj     = {"R": '', "I": ''}
        ,toDt            = "${toDt}"
        ,searchDtBf      = "${searchDtBf}"
        ,selectTabId     = "stockDdlnHd"
        ,unitObj         = {}
        ,strgeTpList     = []
        ,strgeTpObj      = {}
        ,bpTpList        = []
        ,bpTpObj         = {}
        ,accYyList       = []
        ,accMmList       = []
        ,toYy            = new Date()
        ,searchItemPopupWindow;

    toYy = toYy.getFullYear();
    for(var i = 2005; i <= toYy; i = i + 1){
        accYyList.push({cmmCd: i, cmmCdNm: i});
    }

    for(var i = 1; i <= 12; i = i + 1){
        accMmList.push({cmmCd: dms.string.lpad(i+'','0',2), cmmCdNm: dms.string.lpad(i+'','0',2)});
    }

    //차종조회
    <c:forEach var="obj" items="${carlineCdList}">
        carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
        carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
    </c:forEach>

    //단위
    <c:forEach var="obj" items="${unitCdList}" varStatus="status">
        unitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
    </c:forEach>

    //창고
    strgeTpObj[' '] = "";
    strgeTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    //품목구분선택
    <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
        if("${obj.useYn}" !== 'N'){
            itemDstinList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
        itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    bpTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${bpTpList}" varStatus="status">
        if("01" === "${obj.remark2}"){
            bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }

        bpTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    $(document).ready(function() {

        //거래처유형선택
        $("#sBpTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bpTpList
        });

        //조회조건-회계년도
        $("#sAccYy").kendoExtDropDownList({
           dataSource    :accYyList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
        });

        //조회조건-회계월
        $("#sAccMm").kendoExtDropDownList({
           dataSource    :accMmList
          ,dataTextField :"cmmCdNm"
          ,dataValueField:"cmmCd"
        });

        $("#sAccYyMmFr").kendoExtMaskedDatePicker({
            start:"year"
           ,depth:"year"
           ,format:"yyyy-MM"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#sAccYyMmTo").kendoExtMaskedDatePicker({
            start:"year"
           ,depth:"year"
           ,format:"yyyy-MM"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });


      //창고선택
        $("#sStrgeCd").kendoExtDropDownList({
             dataTextField: "cmmCdNm"
            ,dataValueField: "cmmCd"
            ,dataSource:strgeTpList
            ,index:0
        });

        //품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField: "cmmCdNm"
            ,dataValueField: "cmmCd"
            ,dataSource:itemDstinList
            ,optionLabel:" "
            ,index:0
        });

        /**
         * 차종 콤보박스
         */
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carlineCdList
           ,optionLabel:" "
           , filter:"contains"
           ,filtering:function(e){
               var filter = e.filter;
           }
        });

        $("#sStartStocQty").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        $("#sEndStocQty").kendoExtNumericTextBox({
            format:"n0"
           ,spinners:false
        });

        //tab
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                selectTabId = e.item.id;
            }
        });

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click: function(e){
                initPage();
            }
        });

        // 엑셀다운로드버튼
        $("#btnExcelDownload").kendoButton({
            click: function(e){

                var beanName;
                var templateFile;
                var fileName;

                if(selectTabId == "stockDdlnHd"){
                    beanName = "stockDdlnService"
                    templateFile = "StockDdlnHeader_Tpl.xlsx";
                    fileName = "StockDdlnHeader.xlsx";
                } else {
                    beanName = "stockDdlnService"
                    templateFile = "StockDdlnDetail_Tpl.xlsx";
                    fileName = "StockDdlnDetail.xlsx";
                }

                dms.ajax.excelExport({
                    "beanName":beanName
                    ,"templateFile":templateFile
                    ,"fileName":fileName
                    ,"sAccYyMmFr": kendo.toString($("#sAccYyMmFr").data("kendoExtMaskedDatePicker").value(), "yyyyMM")
                    ,"sAccYyMmTo": kendo.toString($("#sAccYyMmTo").data("kendoExtMaskedDatePicker").value(), "yyyyMM")
                    ,"sItemCd": $("#sItemCd").val()
                    ,"sItemNm": $("#sItemNm").val()
                    ,"sItemDstinCd": $("#sItemDstinCd").data("kendoExtDropDownList").value()
                    ,"sCarlineCd": $("#sCarlineCd").data("kendoExtDropDownList").value()
                    ,"sStrgeCd": $("#sStrgeCd").data("kendoExtDropDownList").value()
                    ,"sLocCd": $("#sLocCd").val()
                    ,"sStartStocQty": $("#sStartStocQty").data("kendoExtNumericTextBox").value()
                    ,"sEndStocQty": $("#sEndStocQty").data("kendoExtNumericTextBox").value()
                    ,"sBpTp": $("#sBpTp").data("kendoExtDropDownList").value()
                    ,"sListType":selectTabId
                });
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click: function(e){

                if(dms.string.isEmpty($("#sAccYy").data("kendoExtDropDownList").value())){
                    // 딜러를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.accYy' var='accYy' /><spring:message code='global.info.confirmMsgParam' arguments='${accYy}'/>");
                    return false;
                }

                if(dms.string.isEmpty($("#sAccMm").data("kendoExtDropDownList").value())){
                    // 딜러를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.accMm' var='accMm' /><spring:message code='global.info.confirmMsgParam' arguments='${accMm}'/>");
                    return false;
                }


                $("#grid").data("kendoExtGrid").dataSource.read();
                $("#gridDetail").data("kendoExtGrid").dataSource.read();
            }
        });

        // 입고 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0917-162001"
           ,height: 450
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stock/selectStockDdlnByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            params["sAccYyMmFr"]         = kendo.toString($("#sAccYyMmFr").data("kendoExtMaskedDatePicker").value(), "yyyyMM");
                            params["sAccYyMmTo"]         = kendo.toString($("#sAccYyMmTo").data("kendoExtMaskedDatePicker").value(), "yyyyMM");
                            //params["sAccYyMm"]           = $("#sAccYy").data("kendoExtDropDownList").value() + $("#sAccMm").data("kendoExtDropDownList").value();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sItemDstinCd"]       = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]         = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sStrgeCd"]           = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sLocCd"]             = $("#sLocCd").val();
                            params["sStartStocQty"]      = $("#sStartStocQty").data("kendoExtNumericTextBox").value();
                            params["sEndStocQty"]        = $("#sEndStocQty").data("kendoExtNumericTextBox").value();
                            params["sBpTp"]              = $("#sBpTp").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        if(result.total === 0){
                        }

                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                       id:"itemCd"
                      ,fields:{
                            dlrCd              :{ type:"string", editable: false }
                          , strgeCd            :{ type:"string", editable: false } //창고
                          , locCd              :{ type:"string", editable: false } //로케이션번호
                          , itemCd             :{ type:"string", editable: false } //부번
                          , itemNm             :{ type:"string", editable: false } //품명
                          , yyMm               :{ type:"string", editable: false } //년월
                          , unitCd             :{ type:"string", editable: false } //단위
                          , firstTp            :{ type:"string", editable: false } //부품1급분류
                          , secondTp           :{ type:"string", editable: false } //부품2급분류
                          , thirdTp            :{ type:"string", editable: false } //부품3급분류
                          , itemDstinCd        :{ type:"string", editable: false } //부품유형
                          , bpCd               :{ type:"string", editable: false } //업체
                          , bpNm               :{ type:"string", editable: false } //업체
                          , carlineCd          :{ type:"string", editable: false } //차형
                          , modelCd            :{ type:"string", editable: false } //차종
                          , preMmDdlnStockQty  :{ type:"number", editable: false } //전월마감재고수량
                          , preMmDdlnStockPrc  :{ type:"number", editable: false } //전월마감이동평균가격
                          , preMmDdlnStockAmt  :{ type:"number", editable: false } //전월마감재고금액
                          , psntMmDdlnStockQty :{ type:"number", editable: false } //당월마감재고수량
                          , psntMmDdlnStockPrc :{ type:"number", editable: false } //당월마감이동평균가격
                          , psntMmDdlnStockAmt :{ type:"number", editable: false } //당월마감재고금액
                          , grQty              :{ type:"number", editable: false } //입고수량
                          , grAmt              :{ type:"number", editable: false } //입고금액
                          , giQty              :{ type:"number", editable: false } //출고수량
                          , giBaseAmt          :{ type:"number", editable: false } //출고원가금액
                          , giAmt              :{ type:"number", editable: false } //출고금액
                          , purcGrQty          :{ type:"number", editable: false } //구매입고수량
                          , purcGrAmt          :{ type:"number", editable: false } //구매입고금액
                          , movingAvgPrc       :{ type:"number", editable: false } //이동평균단가
                          , obtGrQty           :{ type:"number", editable: false } //조달입고수량
                          , obtGrAmt           :{ type:"number", editable: false } //조달입고금액
                          , palGrQty           :{ type:"number", editable: false } //손익입고수량
                          , palGrAmt           :{ type:"number", editable: false } //손익입고금액
                          , strgeMoveGrQty     :{ type:"number", editable: false } //창고이동입고수량
                          , strgeMoveGrAmt     :{ type:"number", editable: false } //창고이동입고금액
                          , etcGrQty           :{ type:"number", editable: false } //기타입고수량
                          , etcGrAmt           :{ type:"number", editable: false } //기타입고금액
                          , ctSaleQty          :{ type:"number", editable: false } //COUNTER판매수량
                          , ctSaleBaseAmt      :{ type:"number", editable: false } //COUNTER판매원가금액
                          , ctSaleAmt          :{ type:"number", editable: false } //COUNTER판매금액
                          , wksSaleQty         :{ type:"number", editable: false } //WORKSHOP판매수량
                          , wksSaleBaseAmt     :{ type:"number", editable: false } //WORKSHOP판매원가금액
                          , wksSaleAmt         :{ type:"number", editable: false } //WORKSHOP판매금액
                          , serSaleQty         :{ type:"number", editable: false } //정비판매수량
                          , serSaleBaseAmt     :{ type:"number", editable: false } //정비판매원가금액
                          , serSaleAmt         :{ type:"number", editable: false } //정비판매금액
                          , parSaleQty         :{ type:"number", editable: false } //부품판매수량
                          , parSaleBaseAmt     :{ type:"number", editable: false } //부품판매원가금액
                          , parSaleAmt         :{ type:"number", editable: false } //부품판매금액
                          , strgeMoveGiQty     :{ type:"number", editable: false } //창고이동출고수량
                          , strgeMoveGiBaseAmt :{ type:"number", editable: false } //창고이동출고원가금액
                          , intRcvGiQty        :{ type:"number", editable: false } //내부수령출고수량
                          , intRcvGiBaseAmt    :{ type:"number", editable: false } //내부수령출고원가금액
                          , intRcvGiAmt        :{ type:"number", editable: false } //내부수령출고금액
                          , obtGiQty           :{ type:"number", editable: false } //조달출고수량
                          , obtGiBaseAmt       :{ type:"number", editable: false } //조달출고원가금액
                          , obtGiAmt           :{ type:"number", editable: false } //조달출고금액
                          , lossGiQty          :{ type:"number", editable: false } //손실출고수량
                          , lossGiBaseAmt      :{ type:"number", editable: false } //손실출고원가금액
                          , etcGiQty           :{ type:"number", editable: false } //기타출고수량
                          , etcGiBaseAmt       :{ type:"number", editable: false } //기타출고원가금액
                          , etcGiAmt           :{ type:"number", editable: false } //기타출고금액
                        }
                    }
                }
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , pageable:{
                refresh:false
               ,pageSize:100
               ,buttonCount:3
               ,input:false
             }
            , columns:[
                  {//딜러코드
                      title     :"<spring:message code='par.lbl.dlrCd' />"
                     ,field     :"dlrCd"
                     ,width     :80
                     ,hidden    :true
                  }
                , {//창고
                      field      :"strgeCd"
                     ,title      :"<spring:message code='par.lbl.strgeCd' />"
                     ,template   :'#= changeStrgeCd(strgeCd)#'
                     ,width      :100
                  }
                , {//로케이션
                      field      :"locCd"
                     ,title      :"<spring:message code='par.lbl.locCd' />"
                     ,width      :100
                     ,hidden    :true
                  }
                 ,{//부품번호
                      field     :"itemCd"
                     ,title     :"<spring:message code='par.lbl.itemCd' />"
                     ,width     :140
                   }
                 ,{//부품명
                      field     :"itemNm"
                     ,title     :"<spring:message code='par.lbl.itemNm' />"
                     ,width     :200
                   }
                 , {//단위
                     field      :"unitCd"
                    ,title      :"<spring:message code='par.lbl.unitNm' />"
                    ,attributes :{"class":"ac"}
                    ,template   :'#= changeItemUnit(unitCd)#'
                    ,width      :80
                 }
                 , {//부품1급분류
                     field      :"firstTp"
                    ,title      :"<spring:message code='par.lbl.partsFirstTp' />"
                    ,width      :100
                 }
                 , {//부품2급분류
                     field      :"secondTp"
                    ,title      :"<spring:message code='par.lbl.partsSecondTp' />"
                    ,width      :100
                 }
                 , {//부품3급분류
                     field      :"thirdTp"
                    ,title      :"<spring:message code='par.lbl.partsThirdTp' />"
                    ,width      :100
                 }
                 ,{//차종명칭
                     field     :"carlineCd"
                    ,title     :"<spring:message code='par.lbl.carLine' />"
                    ,template  :'#= changeCarlineCd(carlineCd)#'
                    ,width:100}
                 ,{//차종명칭
                     field     :"modelCd"
                    ,title     :"<spring:message code='par.lbl.modelNm' />"
                    ,width:100}
                 ,{//거래처 코드
                      field     :"bpCd"
                     ,title     :"<spring:message code='par.lbl.bpCd' />"
                     ,width     :105
                     ,hidden    :true
                   }
                 ,{//공급업체
                     field      :"bpNm"
                    ,title      :"<spring:message code='par.lbl.bpCd' />"
                    ,width      :140
                    ,hidden    :true
                   }
                 , {//기초수량
                     field      :"preMmDdlnStockQty"
                    ,title      :"<spring:message code='par.lbl.startStockQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기초단가
                     field      :"preMmDdlnStockPrc"
                    ,title      :"<spring:message code='par.lbl.startStockPrc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기초금액
                     field      :"preMmDdlnStockAmt"
                    ,title      :"<spring:message code='par.lbl.startStockAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기말수량
                     field      :"psntMmDdlnStockQty"
                    ,title      :"<spring:message code='par.lbl.endStockQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기말단가
                     field      :"psntMmDdlnStockPrc"
                    ,title      :"<spring:message code='par.lbl.endStockPrc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기말금액
                     field      :"psntMmDdlnStockAmt"
                    ,title      :"<spring:message code='par.lbl.endStockAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//입고수량
                     field      :"grQty"
                    ,title      :"<spring:message code='par.lbl.grQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//입고금액
                     field      :"grAmt"
                    ,title      :"<spring:message code='par.lbl.grAmtTax' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//출고수량
                     field      :"giQty"
                    ,title      :"<spring:message code='par.lbl.giQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//출고이동금액
                     field      :"giBaseAmt"
                    ,title      :"<spring:message code='par.giMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//출고금액
                     field      :"giAmt"
                    ,title      :"<spring:message code='par.lbl.giIncTaxAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//구매입고수량
                     field      :"purcGrQty"
                    ,title      :"<spring:message code='par.lbl.purcGrQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//구매입고금액
                     field      :"purcGrAmt"
                    ,title      :"<spring:message code='par.lbl.purcGrAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//이동단가
                     field      :"movingAvgPrc"
                    ,title      :"<spring:message code='par.lbl.movingAvgPrc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//조달입고수량
                     field      :"obtGrQty"
                    ,title      :"<spring:message code='par.lbl.obtGrQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//조달입고금액
                     field      :"obtGrAmt"
                    ,title      :"<spring:message code='par.lbl.obtGrAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//손익입고수량
                     field      :"palGrQty"
                    ,title      :"<spring:message code='par.lbl.palGrQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//손익입고금액
                     field      :"palGrAmt"
                    ,title      :"<spring:message code='par.lbl.palGrAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//창고이동입고수량
                     field      :"strgeMoveGrQty"
                    ,title      :"<spring:message code='par.lbl.strgeMoveGrQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//창고이동입고금액
                     field      :"strgeMoveGrAmt"
                    ,title      :"<spring:message code='par.lbl.strgeMoveGrAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기타입고수량
                     field      :"etcGrQty"
                    ,title      :"<spring:message code='par.lbl.etcGrQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기타입고금액
                     field      :"etcGrAmt"
                    ,title      :"<spring:message code='par.lbl.etcGrAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//소매판매수량
                     field      :"ctSaleQty"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//소매판매이동금액
                     field      :"ctSaleBaseAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//소매판매금액
                     field      :"ctSaleAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//도매판매수량
                     field      :"wksSaleQty"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//도매판매이동금액
                     field      :"wksSaleBaseAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//도매판매금액
                     field      :"wksSaleAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//정비수령수량
                     field      :"serSaleQty"
                    ,title      :"<spring:message code='par.lbl.serSaleQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//정비수령이동금액
                     field      :"serSaleBaseAmt"
                    ,title      :"<spring:message code='par.lbl.serSaleMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//정비수령금액
                     field      :"serSaleAmt"
                    ,title      :"<spring:message code='par.lbl.serSaleAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//부품판매수량
                     field      :"parSaleQty"
                    ,title      :"<spring:message code='par.lbl.parSaleQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//부품판매이동금액
                     field      :"parSaleBaseAmt"
                    ,title      :"<spring:message code='par.lbl.parSaleMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//부품판매금액
                     field      :"parSaleAmt"
                    ,title      :"<spring:message code='par.lbl.parSaleAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//창고이동 출고수량
                     field      :"strgeMoveGiQty"
                    ,title      :"<spring:message code='par.lbl.strgeMoveGiQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//창고이동출고이동금액
                     field      :"strgeMoveGiBaseAmt"
                    ,title      :"<spring:message code='par.lbl.strgeMoveGiMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//내부수령수량
                     field      :"intRcvGiQty"
                    ,title      :"<spring:message code='par.lbl.intRcvGiQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//내부수령이동금액
                     field      :"intRcvGiBaseAmt"
                    ,title      :"<spring:message code='par.lbl.intRcvGiMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//내부수령금액
                     field      :"intRcvGiAmt"
                    ,title      :"<spring:message code='par.lbl.intRcvGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//조달출고수량
                     field      :"obtGiQty"
                    ,title      :"<spring:message code='par.lbl.obtGiQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//조달출고이동금액
                     field      :"obtGiBaseAmt"
                    ,title      :"<spring:message code='par.lbl.obtGiMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//조달출고금액
                     field      :"obtGiAmt"
                    ,title      :"<spring:message code='par.lbl.obtGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//손실출고수량
                     field      :"lossGiQty"
                    ,title      :"<spring:message code='par.lbl.lossGiQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//손실출고금액
                     field      :"lossGiBaseAmt"
                    ,title      :"<spring:message code='par.lbl.lossGiMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기타출고수량
                     field      :"etcGiQty"
                    ,title      :"<spring:message code='par.lbl.etcGiQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기타출고이동금액
                     field      :"etcGiBaseAmt"
                    ,title      :"<spring:message code='par.lbl.etcGiMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기타출고금액
                     field      :"etcGiAmt"
                    ,title      :"<spring:message code='par.lbl.etcGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
            ]
        });

        // 출고 헤더 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0917-162002"
           ,height: 450
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stock/selectStockDdlnByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};


                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            params["sAccYyMmFr"]         = kendo.toString($("#sAccYyMmFr").data("kendoExtMaskedDatePicker").value(), "yyyyMM");
                            params["sAccYyMmTo"]         = kendo.toString($("#sAccYyMmTo").data("kendoExtMaskedDatePicker").value(), "yyyyMM");
                            //params["sAccYyMm"]           = $("#sAccYy").data("kendoExtDropDownList").value() + $("#sAccMm").data("kendoExtDropDownList").value();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sItemDstinCd"]       = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]         = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sStrgeCd"]           = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sLocCd"]             = $("#sLocCd").val();
                            params["sStartStocQty"]      = $("#sStartStocQty").data("kendoExtNumericTextBox").value();
                            params["sEndStocQty"]        = $("#sEndStocQty").data("kendoExtNumericTextBox").value();
                            params["sBpTp"]              = $("#sBpTp").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        if(result.total === 0){
                           // dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }

                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                       id:"itemCd"
                           ,fields:{
                               dlrCd              :{ type:"string", editable: false }
                             , strgeCd            :{ type:"string", editable: false } //창고
                             , locCd              :{ type:"string", editable: false } //로케이션번호
                             , itemCd             :{ type:"string", editable: false } //부번
                             , itemNm             :{ type:"string", editable: false } //품명
                             , yyMm               :{ type:"string", editable: false } //년월
                             , unitCd             :{ type:"string", editable: false } //단위
                             , firstTp            :{ type:"string", editable: false } //부품1급분류
                             , secondTp           :{ type:"string", editable: false } //부품2급분류
                             , thirdTp            :{ type:"string", editable: false } //부품3급분류
                             , itemDstinCd        :{ type:"string", editable: false } //부품유형
                             , bpCd               :{ type:"string", editable: false } //업체
                             , bpNm               :{ type:"string", editable: false } //업체
                             , carlineCd          :{ type:"string", editable: false } //차형
                             , modelCd            :{ type:"string", editable: false } //차종
                             , preMmDdlnStockQty  :{ type:"number", editable: false } //전월마감재고수량
                             , preMmDdlnStockPrc  :{ type:"number", editable: false } //전월마감이동평균가격
                             , preMmDdlnStockAmt  :{ type:"number", editable: false } //전월마감재고금액
                             , psntMmDdlnStockQty :{ type:"number", editable: false } //당월마감재고수량
                             , psntMmDdlnStockPrc :{ type:"number", editable: false } //당월마감이동평균가격
                             , psntMmDdlnStockAmt :{ type:"number", editable: false } //당월마감재고금액
                             , grQty              :{ type:"number", editable: false } //입고수량
                             , grAmt              :{ type:"number", editable: false } //입고금액
                             , giQty              :{ type:"number", editable: false } //출고수량
                             , giBaseAmt          :{ type:"number", editable: false } //출고원가금액
                             , giAmt              :{ type:"number", editable: false } //출고금액
                             , purcGrQty          :{ type:"number", editable: false } //구매입고수량
                             , purcGrAmt          :{ type:"number", editable: false } //구매입고금액
                             , movingAvgPrc       :{ type:"number", editable: false } //이동평균단가
                             , obtGrQty           :{ type:"number", editable: false } //조달입고수량
                             , obtGrAmt           :{ type:"number", editable: false } //조달입고금액
                             , palGrQty           :{ type:"number", editable: false } //손익입고수량
                             , palGrAmt           :{ type:"number", editable: false } //손익입고금액
                             , strgeMoveGrQty     :{ type:"number", editable: false } //창고이동입고수량
                             , strgeMoveGrAmt     :{ type:"number", editable: false } //창고이동입고금액
                             , etcGrQty           :{ type:"number", editable: false } //기타입고수량
                             , etcGrAmt           :{ type:"number", editable: false } //기타입고금액
                             , ctSaleQty          :{ type:"number", editable: false } //COUNTER판매수량
                             , ctSaleBaseAmt      :{ type:"number", editable: false } //COUNTER판매원가금액
                             , ctSaleAmt          :{ type:"number", editable: false } //COUNTER판매금액
                             , wksSaleQty         :{ type:"number", editable: false } //WORKSHOP판매수량
                             , wksSaleBaseAmt     :{ type:"number", editable: false } //WORKSHOP판매원가금액
                             , wksSaleAmt         :{ type:"number", editable: false } //WORKSHOP판매금액
                             , serSaleQty         :{ type:"number", editable: false } //정비판매수량
                             , serSaleBaseAmt     :{ type:"number", editable: false } //정비판매원가금액
                             , serSaleAmt         :{ type:"number", editable: false } //정비판매금액
                             , parSaleQty         :{ type:"number", editable: false } //부품판매수량
                             , parSaleBaseAmt     :{ type:"number", editable: false } //부품판매원가금액
                             , parSaleAmt         :{ type:"number", editable: false } //부품판매금액
                             , strgeMoveGiQty     :{ type:"number", editable: false } //창고이동출고수량
                             , strgeMoveGiBaseAmt :{ type:"number", editable: false } //창고이동출고원가금액
                             , intRcvGiQty        :{ type:"number", editable: false } //내부수령출고수량
                             , intRcvGiBaseAmt    :{ type:"number", editable: false } //내부수령출고원가금액
                             , intRcvGiAmt        :{ type:"number", editable: false } //내부수령출고금액
                             , obtGiQty           :{ type:"number", editable: false } //조달출고수량
                             , obtGiBaseAmt       :{ type:"number", editable: false } //조달출고원가금액
                             , obtGiAmt           :{ type:"number", editable: false } //조달출고금액
                             , lossGiQty          :{ type:"number", editable: false } //손실출고수량
                             , lossGiBaseAmt      :{ type:"number", editable: false } //손실출고원가금액
                             , etcGiQty           :{ type:"number", editable: false } //기타출고수량
                             , etcGiBaseAmt       :{ type:"number", editable: false } //기타출고원가금액
                             , etcGiAmt           :{ type:"number", editable: false } //기타출고금액
                        }
                    }
                }
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true
            , pageable:{
                refresh:false
               ,pageSize:100
               ,buttonCount:3
               ,input:false
             }//빈컬럼 적용. default:false
            , columns:[
                  {//딜러코드
                      title     :"<spring:message code='par.lbl.dlrCd' />"
                     ,field     :"dlrCd"
                     ,width     :80
                     ,hidden    :true
                  }
                , {//창고
                      field      :"strgeCd"
                     ,title      :"<spring:message code='par.lbl.strgeCd' />"
                     ,template   :'#= changeStrgeCd(strgeCd)#'
                     ,width      :100
                     ,hidden    :true
                  }
                , {//로케이션
                      field      :"locCd"
                     ,title      :"<spring:message code='par.lbl.locCd' />"
                     ,width      :100
                     ,hidden    :true
                  }
                , {   //품목구분
                    title     :"<spring:message code='par.lbl.itemDstinCd'  />"
                   ,field     :"itemDstinCd"
                   ,width     :80
                   ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                   ,attributes:{ "style":"text-align:left"}
                }
                 ,{//부품번호
                      field     :"itemCd"
                     ,title     :"<spring:message code='par.lbl.itemCd' />"
                     ,width     :140
                   }
                 ,{//부품명
                      field     :"itemNm"
                     ,title     :"<spring:message code='par.lbl.itemNm' />"
                     ,width     :200
                   }
                 , {//단위
                     field      :"unitCd"
                    ,title      :"<spring:message code='par.lbl.unitNm' />"
                    ,attributes :{"class":"ac"}
                    ,template   :'#= changeItemUnit(unitCd)#'
                    ,width      :80
                 }
                 , {//부품1급분류
                     field      :"firstTp"
                    ,title      :"<spring:message code='par.lbl.partsFirstTp' />"
                    ,width      :100
                 }
                 , {//부품2급분류
                     field      :"secondTp"
                    ,title      :"<spring:message code='par.lbl.partsSecondTp' />"
                    ,width      :100
                 }
                 , {//부품3급분류
                     field      :"thirdTp"
                    ,title      :"<spring:message code='par.lbl.partsThirdTp' />"
                    ,width      :100
                 }
                 ,{//차종명칭
                     field     :"carlineCd"
                    ,title     :"<spring:message code='par.lbl.carLine' />"
                    ,template  :'#= changeCarlineCd(carlineCd)#'
                    ,width:100}
                 ,{//차종명칭
                     field     :"modelCd"
                    ,title     :"<spring:message code='par.lbl.modelNm' />"
                    ,width:100}
                 ,{//거래처 코드
                      field     :"bpCd"
                     ,title     :"<spring:message code='par.lbl.bpCd' />"
                     ,width     :105
                     ,hidden    :true
                   }
                 ,{//공급업체
                     field      :"bpNm"
                    ,title      :"<spring:message code='par.lbl.bpCd' />"
                    ,width      :140
                    ,hidden    :true
                   }
                 , {//기초수량
                     field      :"preMmDdlnStockQty"
                    ,title      :"<spring:message code='par.lbl.startStockQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기초단가
                     field      :"preMmDdlnStockPrc"
                    ,title      :"<spring:message code='par.lbl.startStockPrc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기초금액
                     field      :"preMmDdlnStockAmt"
                    ,title      :"<spring:message code='par.lbl.startStockAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기말수량
                     field      :"psntMmDdlnStockQty"
                    ,title      :"<spring:message code='par.lbl.endStockQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기말단가
                     field      :"psntMmDdlnStockPrc"
                    ,title      :"<spring:message code='par.lbl.endStockPrc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기말금액
                     field      :"psntMmDdlnStockAmt"
                    ,title      :"<spring:message code='par.lbl.endStockAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//입고수량
                     field      :"grQty"
                    ,title      :"<spring:message code='par.lbl.grQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//입고금액
                     field      :"grAmt"
                    ,title      :"<spring:message code='par.lbl.grAmtTax' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//출고수량
                     field      :"giQty"
                    ,title      :"<spring:message code='par.lbl.giQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//출고이동금액
                     field      :"giBaseAmt"
                    ,title      :"<spring:message code='par.giMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//출고금액
                     field      :"giAmt"
                    ,title      :"<spring:message code='par.lbl.giIncTaxAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//구매입고수량
                     field      :"purcGrQty"
                    ,title      :"<spring:message code='par.lbl.purcGrQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//구매입고금액
                     field      :"purcGrAmt"
                    ,title      :"<spring:message code='par.lbl.purcGrAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//이동단가
                     field      :"movingAvgPrc"
                    ,title      :"<spring:message code='par.lbl.movingAvgPrc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//조달입고수량
                     field      :"obtGrQty"
                    ,title      :"<spring:message code='par.lbl.obtGrQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//조달입고금액
                     field      :"obtGrAmt"
                    ,title      :"<spring:message code='par.lbl.obtGrAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//손익입고수량
                     field      :"palGrQty"
                    ,title      :"<spring:message code='par.lbl.palGrQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//손익입고금액
                     field      :"palGrAmt"
                    ,title      :"<spring:message code='par.lbl.palGrAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//창고이동입고수량
                     field      :"strgeMoveGrQty"
                    ,title      :"<spring:message code='par.lbl.strgeMoveGrQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//창고이동입고금액
                     field      :"strgeMoveGrAmt"
                    ,title      :"<spring:message code='par.lbl.strgeMoveGrAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기타입고수량
                     field      :"etcGrQty"
                    ,title      :"<spring:message code='par.lbl.etcGrQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//기타입고금액
                     field      :"etcGrAmt"
                    ,title      :"<spring:message code='par.lbl.etcGrAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//소매판매수량
                     field      :"ctSaleQty"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//소매판매이동금액
                     field      :"ctSaleBaseAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//소매판매금액
                     field      :"ctSaleAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//도매판매수량
                     field      :"wksSaleQty"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//도매판매이동금액
                     field      :"wksSaleBaseAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//도매판매금액
                     field      :"wksSaleAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//정비수령수량
                     field      :"serSaleQty"
                    ,title      :"<spring:message code='par.lbl.serSaleQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//정비수령이동금액
                     field      :"serSaleBaseAmt"
                    ,title      :"<spring:message code='par.lbl.serSaleMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//정비수령금액
                     field      :"serSaleAmt"
                    ,title      :"<spring:message code='par.lbl.serSaleAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//부품판매수량
                     field      :"parSaleQty"
                    ,title      :"<spring:message code='par.lbl.parSaleQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//부품판매이동금액
                     field      :"parSaleBaseAmt"
                    ,title      :"<spring:message code='par.lbl.parSaleMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//부품판매금액
                     field      :"parSaleAmt"
                    ,title      :"<spring:message code='par.lbl.parSaleAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//창고이동 출고수량
                     field      :"strgeMoveGiQty"
                    ,title      :"<spring:message code='par.lbl.strgeMoveGiQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//창고이동출고이동금액
                     field      :"strgeMoveGiBaseAmt"
                    ,title      :"<spring:message code='par.lbl.strgeMoveGiMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//내부수령수량
                     field      :"intRcvGiQty"
                    ,title      :"<spring:message code='par.lbl.intRcvGiQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//내부수령이동금액
                     field      :"intRcvGiBaseAmt"
                    ,title      :"<spring:message code='par.lbl.intRcvGiMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//내부수령금액
                     field      :"intRcvGiAmt"
                    ,title      :"<spring:message code='par.lbl.intRcvGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//조달출고수량
                     field      :"obtGiQty"
                    ,title      :"<spring:message code='par.lbl.obtGiQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//조달출고이동금액
                     field      :"obtGiBaseAmt"
                    ,title      :"<spring:message code='par.lbl.obtGiMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//조달출고금액
                     field      :"obtGiAmt"
                    ,title      :"<spring:message code='par.lbl.obtGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//손실출고수량
                     field      :"lossGiQty"
                    ,title      :"<spring:message code='par.lbl.lossGiQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//손실출고금액
                     field      :"lossGiBaseAmt"
                    ,title      :"<spring:message code='par.lbl.lossGiMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기타출고수량
                     field      :"etcGiQty"
                    ,title      :"<spring:message code='par.lbl.etcGiQty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//기타출고이동금액
                     field      :"etcGiBaseAmt"
                    ,title      :"<spring:message code='par.lbl.etcGiMoveAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
                 , {//기타출고금액
                     field      :"etcGiAmt"
                    ,title      :"<spring:message code='par.lbl.etcGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n2}"
                    ,width      :100
                 }
            ]
        });


        //changeCarlineCd Func
        changeCarlineCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(carlineCdObj[val] != undefined){
                    returnVal = carlineCdObj[val];
                }
            }
            return returnVal;
        };


        // 품목단위
        changeItemUnit = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = unitObj[val];
            }
            return returnVal;
        };

        // 창고
        changeStrgeCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                if(dms.string.isEmpty(strgeTpObj[val])){
                    returnVal = "";
                }else{
                    returnVal = strgeTpObj[val];
                }
            }
            return returnVal;
        };

     // 부품유형
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = itemDstinCdObj[val];
            }
            return returnVal;
        };


    initPage();

    });

  //부품 팝업 열기 함수.
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            , content:{
                url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                , data: {
                    "type":""
                    , "itemCd":$("#sItemCd").val()
                    , "autoBind":false
                     , "callbackFunc":function(data){
                        $("#sItemCd").val(data[0].itemCd);
                        $("#sItemNm").val(data[0].itemNm);

                        searchItemPopupWindow.close();
                    }
               }
            }
        });
    }

    function initPage(){
        var minDate = new Date(searchDtBf),
            maxDate = new Date(toDt),
            nowDt = new Date(),
            nowYy = nowDt.getFullYear(),
            preMM = nowDt.getMonth(),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

            preMM = dms.string.lpad(preMM +'','0',2);

        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]: dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]: dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

        $("#sItemCd").val("");                                     //부품명
        $("#sItemNm").val("");                                     //부품명
        $("#sItemDstinCd").data("kendoExtDropDownList").value('02');
        $("#sAccYy").data("kendoExtDropDownList").value(nowYy);
        $("#sAccMm").data("kendoExtDropDownList").value(preMM);

        $("#sAccYyMmFr").data("kendoExtMaskedDatePicker").value(searchDtBf.substring(0,8));
        $("#sAccYyMmTo").data("kendoExtMaskedDatePicker").value(toDt.substring(0,8));
        $("#sAccYyMmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM));
        $("#sAccYyMmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM));
        $("#sAccYyMmTo").data("kendoExtMaskedDatePicker").max(new Date(frYY,frMM));

    }

    //날짜 검증
    function fnChkDateValue(e){
        var  elmt    = e.sender.element[0],
             id      = elmt.id,
             maxDate = new Date(toDt),
             toYY,
             toMM,
             frYY,
             frMM,
             maxToYY,
             maxToMM;

       maxToYY = maxDate.getFullYear();
       maxToMM = maxDate.getMonth();

       if(this.value() == null){
         //INVOICE입고일
           if(id === 'sAccYyMmFr'){
               var minDate = new Date(searchDtBf);
                   frYY = minDate.getFullYear();
                   frMM = minDate.getMonth();
                   $("#sAccYyMmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM));
                   $("#sAccYyMmTo").data("kendoExtMaskedDatePicker").max(new Date(maxToYY,maxToMM));
           }else if(id === 'sAccYyMmTo'){
               var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   $("#sAccYyMmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM));
           }
       }else{
         //INVOICE입고일
           if(id === 'sAccYyMmFr'){
               frYY = this.value().getFullYear();
               frMM = this.value().getMonth();
               $("#sAccYyMmTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM));
               $("#sAccYyMmTo").data("kendoExtMaskedDatePicker").max(new Date(maxToYY,maxToMM));
           }else if(id === 'sAccYyMmTo'){
               toYY = this.value().getFullYear();
               toMM = this.value().getMonth();
               $("#sAccYyMmFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM));
           }
       }

    }

</script>
<!-- //script -->

