<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 월마감조회 -->
    <section class="group">
        <div class="header_area">
             <h1 class="title_basic"><%-- <spring:message code="par.title.purcSubStsList" /> --%><!-- 구매현황 조회 --></h1>
            <div class="btn_left">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m" id="btnExcelDownload"><spring:message code="par.btn.excelDownload" /><!-- 엑셀다운로드 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                        <th scope="row"><spring:message code="par.lbl.accYyMm" /><!-- 회계년월 --></th>
                        <td>
                           <input class="form_datepicker" id="sAccYyMm">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.accStatus" /><!-- 회계상태 --></th>
                        <td>
                             <input id="sAccStat" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                        <td>
                            <input id="sItemDstinCd" name="sItemDstinCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.partsFirstTp" /><!-- 부품1급분류 --></th>
                        <td>
                             <input id="sFirstTp" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.strge" /><!-- 창고 --></th>
                        <td>
                            <input id="sStrgeCd" class="form_comboBox" data-type="combo"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번(부품번호) --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.carlineNm' /></th>       <!-- 차종 -->
                        <td>
                            <input id="sCarlineCd" class="form_comboBox" data-type="combo" />
                        </td>
                        <th scope="row"><spring:message code='par.lbl.partsSecondTp' /></th>       <!-- 부품2급분류 -->
                        <td>
                            <input id="sSecondTp" class="form_comboBox" data-type="combo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.locCd" /><!-- 로케이션 --></th>
                        <td>
                            <input id="sLocCd" class="form_comboBox" data-type="combo"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                        <td>
                            <input id="sModelCd" class="form_comboBox" data-type="combo" />
                        </td>
                        <th scope="row"><spring:message code='par.lbl.partsThirdTp' /></th>     <!-- 부품3급분류 -->
                        <td>
                            <input id="sThirdTp" class="form_comboBox" data-type="combo" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- // tab start-->
        <div id="tabstrip" class="tab_area mt10">
            <ul>
                <li class="k-state-active"><spring:message code="par.title.grGiSaleDetail" /><!-- 입출고/판매명세 --></li>
                <li><spring:message code="par.title.grGiSaleSummary" /><!-- 입출고/판매집계 --></li>
            </ul>

            <div>
                <div  class="table_grid">
                    <!-- 입고 그리드 -->
                    <div id="grid"></div>
                </div>
            </div>
            <div>
                <div  class="table_grid">
                    <!-- 출고 그리드 -->
                    <div id="gridDetail"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- //구매오더 -->

<!-- script -->
<script>
     var abcIndList      = []
        ,carlineCdList   = []
        ,carlineCdObj    = {}
        ,itemDstinList   = []
        ,itemDstinCdObj  = {}
        ,mvtTpChkObj     = {"R": '', "I": ''}
        ,toDt            = "${toDt}"
        ,sevenDtBf       = "${sevenDtBf}"
        ,unitObj         = {}
        ,strgeTpList     = []
        ,strgeTpObj      = {}
        ,accStatList     = []
        ,searchItemPopupWindow;

    //회계상태
    accStatList.push({cmmCdNm:"Yes", cmmCd:"Y"});
    accStatList.push({cmmCdNm:"No", cmmCd:"N"});

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

    $(document).ready(function() {

        //회계년도 년
        $("#sAccYyMm").kendoDatePicker({
            //define the start view
             start: "year"
            //defines when the calendar shoule retrun date
            ,depth: "year"
            //display month and year in the input
            ,format: "yyyyMM"
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
            ,optionLabel:" "
            ,dataSource:itemDstinList
            ,index:0
        });

        //회계상태
        $("#sAccStat").kendoExtDropDownList({
            dataTextField: "cmmCdNm"
            ,dataValueField: "cmmCd"
            ,dataSource:accStatList
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
           ,select:onSelectSearchCarlineCd
        });

        /**
         * 모델 콤보박스
         */
         $("#sModelCd").kendoExtDropDownList({
             dataTextField:"modelNm"
            ,dataValueField:"modelCd"
            ,filter:"contains"
            ,optionLabel:" "
         });
         //$("#sModelCd").data("kendoExtDropDownList").wrapper.hide();  // 숨김
         $("#sModelCd").data("kendoExtDropDownList").enable(false);

        //tab
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
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
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click: function(e){

                $("#grid").data("kendoExtGrid").dataSource.read();
                $("#gridDetail").data("kendoExtGrid").dataSource.read();
            }
        });

        // 입고 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-184805"
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

                            params["sAccYyMm"]           = $("#sAccYyMm").val();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sItemDstinCd"]       = $("#sItemDstinCd").data("kendoExtDropDownList").value();

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
                          , stockUnitCd        :{ type:"string", editable: false } //단위
                          , firstTp            :{ type:"string", editable: false } //부품1급분류
                          , secondTp           :{ type:"string", editable: false } //부품2급분류
                          , thirdTp            :{ type:"string", editable: false } //부품3급분류
                          , itemDstinTp        :{ type:"string", editable: false } //부품유형
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
                          , moveAvgPrc         :{ type:"number", editable: false } //이동평균단가
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
                     field      :"stockUnitCd"
                    ,title      :"<spring:message code='par.lbl.unitNm' />"
                    ,attributes :{"class":"ac"}
                    ,template   :'#= changeItemUnit(stockUnitCd)#'
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
                    ,title     :"<spring:message code='global.lbl.model' />"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기초금액
                     field      :"preMmDdlnStockAmt"
                    ,title      :"<spring:message code='par.lbl.startStockAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기말금액
                     field      :"psntMmDdlnStockAmt"
                    ,title      :"<spring:message code='par.lbl.endStockAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//출고금액
                     field      :"giAmt"
                    ,title      :"<spring:message code='par.lbl.giIncTaxAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//이동단가
                     field      :"moveAvgPrc"
                    ,title      :"<spring:message code='par.lbl.movingAvgPrc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//소매판매금액
                     field      :"ctSaleAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//도매판매금액
                     field      :"wksSaleAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//정비수령금액
                     field      :"serSaleAmt"
                    ,title      :"<spring:message code='par.lbl.serSaleAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//부품판매금액
                     field      :"parSaleAmt"
                    ,title      :"<spring:message code='par.lbl.parSaleAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//내부수령금액
                     field      :"intRcvGiAmt"
                    ,title      :"<spring:message code='par.lbl.intRcvGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//조달출고금액
                     field      :"obtGiAmt"
                    ,title      :"<spring:message code='par.lbl.obtGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기타출고금액
                     field      :"etcGiAmt"
                    ,title      :"<spring:message code='par.lbl.etcGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
            ]
        });

        // 출고 헤더 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0519-184702"
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

                            params["sAccYyMm"]           = $("#sAccYyMm").val();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sItemDstinCd"]       = $("#sItemDstinCd").data("kendoExtDropDownList").value();

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
                             , stockUnitCd        :{ type:"string", editable: false } //단위
                             , firstTp            :{ type:"string", editable: false } //부품1급분류
                             , secondTp           :{ type:"string", editable: false } //부품2급분류
                             , thirdTp            :{ type:"string", editable: false } //부품3급분류
                             , itemDstinTp        :{ type:"string", editable: false } //부품유형
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
                             , moveAvgPrc         :{ type:"number", editable: false } //이동평균단가
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
                     field      :"stockUnitCd"
                    ,title      :"<spring:message code='par.lbl.unitNm' />"
                    ,attributes :{"class":"ac"}
                    ,template   :'#= changeItemUnit(stockUnitCd)#'
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
                    ,title     :"<spring:message code='global.lbl.model' />"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기초금액
                     field      :"preMmDdlnStockAmt"
                    ,title      :"<spring:message code='par.lbl.startStockAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기말금액
                     field      :"psntMmDdlnStockAmt"
                    ,title      :"<spring:message code='par.lbl.endStockAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//출고금액
                     field      :"giAmt"
                    ,title      :"<spring:message code='par.lbl.giIncTaxAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//이동단가
                     field      :"moveAvgPrc"
                    ,title      :"<spring:message code='par.lbl.movingAvgPrc' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//소매판매금액
                     field      :"ctSaleAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                    ,hidden    :true
                 }
                 , {//도매판매금액
                     field      :"wksSaleAmt"
                    ,title      :"<spring:message code='par.lbl.qty' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//정비수령금액
                     field      :"serSaleAmt"
                    ,title      :"<spring:message code='par.lbl.serSaleAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//부품판매금액
                     field      :"parSaleAmt"
                    ,title      :"<spring:message code='par.lbl.parSaleAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//내부수령금액
                     field      :"intRcvGiAmt"
                    ,title      :"<spring:message code='par.lbl.intRcvGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//조달출고금액
                     field      :"obtGiAmt"
                    ,title      :"<spring:message code='par.lbl.obtGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
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
                    ,format     :"{0:n0}"
                    ,width      :100
                 }
                 , {//기타출고금액
                     field      :"etcGiAmt"
                    ,title      :"<spring:message code='par.lbl.etcGiAmt' />"
                    ,attributes :{"class":"ar"}
                    ,format     :"{0:n0}"
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
            if(val != null && val != ""){
                returnVal = strgeTpObj[val];
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
        var minDate = new Date(sevenDtBf),
            maxDate = new Date(toDt),
            nowDt = new Date(),
            nowYy = nowDt.getFullYear(),
            preMM = nowDt.getMonth();

            preMM = dms.string.lpad(preMM,'0',2);

        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]: dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]: dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

        $("#sItemCd").val("");                                     //부품명
        $("#sItemNm").val("");                                     //부품명
        $("#sItemDstinCd").data("kendoExtDropDownList").value('02');
        $("#sAccYyMm").data("kendoDatePicker").value(nowYy + '' + preMM);  //고객유형 기본셋팅
        $("#btnExcelDownload").data("kendoButton").enable(false);
    }

    /** [조회조건 영역] ComboBox Select() **/
    // 차종에 따른 모델검색
    function onSelectSearchCarlineCd(e){
        var dataItem = this.dataItem(e.item),
            responseJson;

        $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sModelCd").data("kendoExtDropDownList").enable(true);

        if(dataItem.carlineCd == ""){
            $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sModelCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        responseJson = dms.ajax.getJson({
            url:"<c:url value='/sal/cnt/contractRe/selectModel.do' />"
            ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
            ,async:false
        });

        $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    }
</script>
<!-- //script -->

