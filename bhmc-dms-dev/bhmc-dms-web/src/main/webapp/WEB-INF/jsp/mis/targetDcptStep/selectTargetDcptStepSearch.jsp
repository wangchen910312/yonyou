<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name:selectTargetDcptStepSearch.jsp
    Description:목표 분해 공구 탭 화면
    author chibeom.song
    since 2016. 9. 20.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016. 9. 20.   chibeom.song     최초 생성
--%>
<div id="resizableContainer">

    <section class="group">
        <div class="header_area">
            <div class="left_area ml0">
                <input type="hidden" id="sDlrCd" name="sDlrCd" value="${dlrCd}">
                <input type="hidden" id="idccDealRate" name="idccDealRate" value="${custResultListVO.idccDealRate}">
                <input type="hidden" id="shopDealRate" name="shopDealRate" value="${custResultListVO.shopDealRate}">
                <span class="span_txt"><spring:message code="mis.lbl.monitordate" /><!-- 모니터링일자 --></span>
                <input type="text" id="sMonitorDate" name="sMonitorDate" value="${targetDcptStepSearchVO.sMonitorDate}" style="width:150px;" class="form_comboBox" style="text-align=center;">
                <dms:access viewId="VIEW-D-10803" hasPermission="${dms:getPermissionMask('READ')}">
                	<button type="button" class="btn_s" id="btnTargetDcptStepSearch" name="btnTargetDcptStepSearch"><spring:message code="global.btn.search" /></button>
				</dms:access>
            </div>
        </div>

        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.marketstatus" /><!-- 시장현황 --></h2>
        </div>
        <!-- 시장현황 그리드 시작 -->
        <div class="table_grid mt0">
            <div id="marketStatusGrid"></div>
        </div>
        <!-- 시장현황 그리드 종료 -->

        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.dealerstatus" /><!-- 딜러현황 --></h2>
        </div>
        <!-- 딜러현황 그리드 시작 -->
        <div class="table_grid">
            <div id="dealerStatusBasicGrid"></div>
        </div>
        <!-- 딜러현황 그리드 종료 -->
        <!-- 딜러현황(채널) 그리드 시작 -->
        <div class="table_grid mt5">
            <div id="channelGrid"></div>
        </div>
        <!-- 딜러현황(채널) 그리드 종료 -->


<div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.title.targetrefersamebsns" /><!-- 딜러현황 --></h2>
  </div>

 <!-- 동종업계 참조  , 새로 추가된 그리드 -->

        <!-- 그리드 시작 -->
        <div class="table_grid mt0">
            <div id="grid" ></div>
        </div>
        <!-- 그리드 종료 -->

        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.manutarget" /><!-- 제조사 목표 --></h2>
        </div>


        <!-- 제조사 목표(당월 총목표) 그리드 시작 -->
        <div class="table_grid">
            <div id="manuTargetGrid"></div>
        </div>
        <!-- 제조사 목표(당월 총목표) 그리드 종료 -->




        <!-- 제조사 목표 그리드 시작 -->
        <div class="table_grid mt5">
            <div id="manuChannelGrid"></div>
        </div>
        <!-- 제조사 목표 그리드 종료 -->

        <br>

        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.dealersaledcpt" /><!-- 딜러분해(차형) --></h2>
            <div class="btn_right">
            	<dms:access viewId="VIEW-D-10804" hasPermission="${dms:getPermissionMask('READ')}">
                	<button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장  --></button>
                </dms:access>
            </div>
        </div>

        <!-- 딜러분해(차형) 그리드 시작 -->
        <div class="table_grid">
            <div id="dealerTargetGrid"></div>
        </div>
        <!-- 딜러분해(차형) 그리드 종료 -->

        <!-- 딜러분해(채널) 그리드 시작 -->
        <div class="table_grid mt5">
            <div id="dealerChannelGrid"></div>
        </div>
        <!-- 딜러분해(채널) 그리드 종료 -->

        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.collectcustomertarget" /><!-- 집객목표 --></h2>
        </div>
        <!-- 집객목표 그리드 시작 -->
        <div class="table_grid">
            <div id="dealerCustGrid"></div>
        </div>
        <!-- 집객목표 그리드 종료 -->

        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.processtarget" /><!-- 과정목표 --></h2>
        </div>
        <!-- 과정목표 그리드 시작 -->
        <div class="table_grid">
            <div id="dealerProcessTarget"></div>
        </div>
        <!-- 과정목표 그리드 종료 -->

        <div class="header_area pt0">
            <h2 class="title_basic"><spring:message code="mis.lbl.derivationprediction" /><!-- 파생예측 --></h2>
        </div>
        <!-- 파생예측 그리드 시작 -->
        <div class="table_grid">
            <div id="processDerivationGrid"></div>
        </div>
        <!-- 파생예측 그리드 종료 -->

    </section>
</div>



<script type="text/javascript">

    $(document).ready(function() {

        $("#sMonitorDate").kendoDatePicker({
            value:"${sysDate}"
            ,start:"year"
            ,depth:"year"
            ,format:"yyyyMM"
        });

        $("#btnTargetDcptStepSearch").kendoButton({
            click:function(e) {

                $("#marketStatusGrid").data('kendoExtGrid').dataSource.page(1);         //시장현황
                $("#dealerStatusBasicGrid").data('kendoExtGrid').dataSource.page(1);    //딜러현황
                $("#channelGrid").data('kendoExtGrid').dataSource.page(1);              //딜러현황(채널)
                $("#manuTargetGrid").data('kendoExtGrid').dataSource.page(1);           //제조사목표
                $("#manuChannelGrid").data('kendoExtGrid').dataSource.page(1);          //제조사목표(차종)
                $("#dealerTargetGrid").data('kendoExtGrid').dataSource.page(1);         //딜러분해(차형)
                /*
                [딜러분해(차형)] 그리드 조회 후 딜러분해(채널), 파생예측에서 상단 그리드를 가지고 가공하기 때문에 [딜러분해(차형] 그리드가 조회되면 나머지 그리드 조회.
                $("#dealerChannelGrid").data('kendoExtGrid').dataSource.page(1);        //딜러분해(채널)
                $("#dealerCustGrid").data('kendoExtGrid').dataSource.page(1);           //집객목표
                $("#dealerProcessTarget").data('kendoExtGrid').dataSource.page(1);      //과정목표
                $("#processDerivationGrid").data('kendoExtGrid').dataSource.page(1);    //파생예측
                */

           }
        });

        var gridColumns = [];

        // 시장현황 그리드 설정
        $("#marketStatusGrid").kendoExtGrid({
            gridId:"G-MIS-0922-143353"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptMarketStatusGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["sMonitorDate"] = $("#sMonitorDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                    ,async:false
                }
                ,schema:{
                    model:{
                        id:"searchDate"
                        ,fields:{
                             searchDate:{type:"string"}
                            ,nameArea:{type:"string"}
                            ,localPossessionRate:{type:"string"}
                            ,localLastMonthContrast:{type:"string"}
                            ,localLastYearMonth:{type:"string"}
                        }
                    }
                }
            }
            ,height:94
            ,scrollable:false
            ,alwaysVisible:false
            ,filterable: false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,selectable :false
            ,autoBind   :false
            ,columns:[
                {field:"searchDate", title:"<spring:message code='mis.dateTime' />", width:100, sortable:false, attributes:{"class":"ac"}} //시간
                ,{field:"nameArea", title:"<spring:message code='mis.lbl.scope' />", width:250, sortable:false, attributes:{"class":"ac"}} //범위
                ,{field:"localPossessionRate"
                 ,template:function(dataItem){
                        if(dataItem.localPossessionRate == null || dataItem.localPossessionRate == "" ){
                            return "-";
                        }else{
                            return dataItem.localPossessionRate;
                        }   }
                   , title:"<spring:message code='mis.lbl.marketShare' />", width:250, attributes:{"class":"ar"}} //마켓 셰어%
                ,{field:"localLastMonthContrast"
                  ,template:function(dataItem){
                        if(dataItem.localLastMonthContrast == null || dataItem.localLastMonthContrast == "" ){
                            return "-";
                        }else{
                            return dataItem.localLastMonthContrast;
                        }   }
                  , title:"<spring:message code='mis.lbl.lastmonthcontrast' />", width:250, attributes:{"class":"ar"}} //전월 대비
                ,{field:"localLastYearMonth"
                  ,template:function(dataItem){
                        if(dataItem.localLastYearMonth == null || dataItem.localLastYearMonth == "" ){
                            return "-";
                        }else{
                            return dataItem.localLastYearMonth;
                        }   }
                 , title:"<spring:message code='mis.lbl.lastyearmonth' />", width:250, attributes:{"class":"ar"}} //작년 동월
            ]
        });

        // 딜러현황 그리드 설정
        $("#dealerStatusBasicGrid").kendoExtGrid({
            gridId:"G-MIS-0922-160341"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptDealerStatusBasicGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorDate"] = $("#sMonitorDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                    ,async:false
                }
                ,schema:{
                    model:{
                        id:"stockValue"
                        ,fields:{
                             stockValue:{type:"number"}
                            ,stockCount:{type:"string"}
                            ,saleStatus3Month:{type:"number"}
                            ,salemanCount:{type:"number"}
                            ,idccPotentialCustomer:{type:"number"}
                            ,shopPotentialCustomer:{type:"number"}
                            ,lastMonthRestOrder:{type:"number"}
                            ,goodsCarQty:{type:"number"}
                            ,insApplyRate:{type:"number"}
                            ,fincApplyRate:{type:"number"}
                        }
                    }
                }
            }
            ,height:48
            ,scrollable:false
            ,filterable: false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,selectable :false
            ,autoBind   :false
            ,columns:[
                {field:"stockValue", title:"<spring:message code='mis.lbl.stockvalue' />", width:80, format:"{0:n0}", sortable:false, attributes:{"class":"ar"}}    //재고
                ,{field:"stockCount", title:"<spring:message code='mis.lbl.stockvaluecnt' />", width:80, attributes:{"class":"ar"}} //재고계수
                ,{field:"saleStatus3Month", title:"<spring:message code='mis.lbl.salestatus3month' />", width:150, format:"{0:n0}", attributes:{"class":"ar"}}  //판매현황(최근 3개월)
                ,{field:"salemanCount", title:"<spring:message code='mis.lbl.salemancount' />", width:100, format:"{0:n0}", attributes:{"class":"ar"}}  //판매고문수
                ,{field:"lastMonthRestOrder", title:"<spring:message code='mis.lbl.lastmonthrestorder' />", width:100, format:"{0:n0}", attributes:{"class":"ar"}}  //전월잔여오더
                ,{field:"idccPotentialCustomer", title:"<spring:message code='mis.lbl.idccpotentialcustomer' />", width:150, format:"{0:n0}", attributes:{"class":"ar"}}    //IDCC 잠재고객(H,A,B)
                ,{field:"shopPotentialCustomer", title:"<spring:message code='mis.lbl.shoppotentialcustomer' />", width:150, format:"{0:n0}", attributes:{"class":"ar"}}    //전시장 잠재고객(H,A,B)
                ,{field:"goodsCarQty", title:"<spring:message code='mis.lbl.localOption' /><spring:message code='mis.lbl.goodscarqty' />", width:130, format:"{0:n0}", attributes:{"class":"ar"}}   //용품대당생산액
                ,{field:"insApplyRate", title:"<spring:message code='mis.lbl.inspassesrate' />", width:130, format:"{0:n0}", attributes:{"class":"ar"}} //보험침투율
                ,{field:"fincApplyRate", title:"<spring:message code='mis.lbl.fncpassesrate' />", width:130, format:"{0:n0}", attributes:{"class":"ar"}}    //금융침투율
            ]
        });

        // 딜러현황 (채널) 그리드 설정
        $("#channelGrid").kendoExtGrid({
            gridId:"G-MIS-0922-170623"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptDealerStatusChannelGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorDate"] = $("#sMonitorDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                    ,async:false
                }
                ,schema:{
                    model:{
                        id:"channelGubn"
                        ,fields:{
                             channelGubn:{type:"string"}
                            ,idccCollectCustQty:{type:"number"}
                            ,idccVisitReqRate:{type:"string"}
                            ,idccDealQty:{type:"string"}
                            ,idccVisitDealRate:{type:"number"}
                            ,idccDealRate:{type:"string"}
                        }
                    }
                }
            }
            ,height:72
            ,scrollable:false
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,selectable :false
            ,autoBind   :false
            ,columns:[
                {field:"channelGubn", title:"<spring:message code='mis.lbl.salechannel' />", width:150, sortable:false, attributes:{"class":"ac"}}  //채널
                ,{field:"idccCollectCustQty", title:"<spring:message code='mis.lbl.collectcustomerqty' />", width:150, format:"{0:n0}", sortable:false, attributes:{"class":"ar"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if ( dataItem.idccCollectCustQty > 0 ) {
                            spanObj = kendo.toString(dataItem.idccCollectCustQty/3, "n0");
                        } else {
                            spanObj = "0";
                        };
                        return spanObj;
                    }
                }  //집객량
                ,{field:"idccVisitReqRate", title:"<spring:message code='mis.lbl.visitrequestrate' />", width:300, format:"{0:n2}", attributes:{"class":"ar"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if ( dataItem.idccVisitReqRate > 0 ) {
                            spanObj = kendo.toString(dataItem.idccVisitReqRate/3, "n2");
                        } else {
                            spanObj = "0";
                        };
                        return spanObj;
                    }
                }    //내방 요청율/개인정보 준사람비율(%)
                ,{field:"idccDealQty", title:"<spring:message code='mis.lbl.dealqty' />", width:150, format:"{0:n0}", attributes:{"class":"ar"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if ( dataItem.idccDealQty > 0 ) {
                            spanObj = kendo.toString(dataItem.idccDealQty/3, "n0");
                        } else {
                            spanObj = "0";
                        };
                        return spanObj;
                    }
                }     //거래량
                ,{field:"idccVisitDealRate", title:"<spring:message code='mis.lbl.visitdealrate' />", width:150, attributes:{"class":"ar"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        var channelGubn = dataItem.channelGubn;

                        if ( channelGubn == "IDCC" ) {
                            if ( dataItem.idccDealQty == 0 && dataItem.idccVisitReqRate == 0) {
                                spanObj = "0";
                            } else {
                                spanObj = kendo.toString(dataItem.idccDealQty/dataItem.idccVisitReqRate*100 , "n0");
                            }
                        } else {
                            spanObj = "-";
                        }
                        return spanObj;
                    }
                }   //방문거래율(%)
                ,{field:"idccDealRate", title:"<spring:message code='mis.lbl.dealrate' />", width:150, attributes:{"class":"ar"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        if ( dataItem.idccVisitReqRate > 0 ) {
                            spanObj = kendo.toString((dataItem.idccDealQty/dataItem.idccCollectCustQty)*100 , "n2");
                        } else {
                            spanObj = "0";
                        };
                        return spanObj;
                    }
                }    //거래율(%)
            ]
        });


        //  동종업계 참조 그리드
        $("#grid").kendoExtGrid({
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-MIS-0802-180702"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tmp/selectTargetReferSameBsnsMainSearch2.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};


                              // 파라미터를 제대로 못받을 거 같음 ...
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sReferYearMonth"] = $("#sReferYearMonth").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"referDt"
                        ,fields:{
                             referDt:{type:"string", validation:{required:true}}
                            ,referYearDt:{type:"string"}
                            ,referMonthDt:{type:"string"}
                            ,referDayDt:{type:"string"}
                            ,visitReqVal:{type:"number"}
                            ,visitDealVal:{type:"number"}
                            ,totDealVal:{type:"number"}
                            ,perOfterVal:{type:"number"}
                            ,successVal:{type:"number"}
                            ,targetAchVal:{type:"number"}
                            ,goodsCarQty:{type:"number"}
                            ,insApplyRate:{type:"number"}
                            ,fincApplyRate:{type:"number"}
                        }
                    }
                }
            }
            ,height:"auto"
            ,filterable:{
                mode:"row"
            }
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                 //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:true            //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,filterable: false
            ,columns:[{
                title:"<spring:message code='mis.lbl.idcc' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"visitReqVal", title:"<spring:message code='mis.lbl.visitReqVal' />",
                    width:150, attributes:{"class":"ac"}
                        ,editor:function(container, options){
                            $('<input required name="visitReqVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:1                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                            });
                            $('<span class="k-invalid-msg" data-for="visitReqVal"></span>').appendTo(container);
                        }
                },{
                    field:"visitDealVal", title:"<spring:message code='mis.lbl.visitDealVal' />",
                    width:150, attributes:{"class":"ac"}
                        ,editor:function(container, options){
                            $('<input required name="visitDealVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:1                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                            });
                            $('<span class="k-invalid-msg" data-for="visitDealVal"></span>').appendTo(container);
                        }
                },{
                    field:"totDealVal", title:"<spring:message code='mis.lbl.totDealVal' />",
                    width:150, attributes:{"class":"ac"}
                        ,editor:function(container, options){
                            $('<input required name="totDealVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:1                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                            });
                            $('<span class="k-invalid-msg" data-for="totDealVal"></span>').appendTo(container);
                        }
                }]
                },{
                title:"<spring:message code='mis.lbl.market' />",
                headerAttributes:{ "class":"hasBob" },
                columns:[ {
                    field:"perOfterVal", title:"<spring:message code='mis.lbl.perOfterVal' />",
                    width:150, attributes:{"class":"ac"}
                        ,editor:function(container, options){
                            $('<input required name="perOfterVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:1                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                            });
                            $('<span class="k-invalid-msg" data-for="perOfterVal"></span>').appendTo(container);
                        }
                },{
                    field:"successVal", title:"<spring:message code='mis.lbl.successVal' />",
                    width:150, attributes:{"class":"ac"}
                        ,editor:function(container, options){
                            $('<input required name="successVal" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                 format:"n0"                // n0:###,###, n2:###,###.##
                                ,decimals:1                 // 소숫점
                                ,min:0
                                ,value:0
                                ,spinners:false
                            });
                            $('<span class="k-invalid-msg" data-for="successVal"></span>').appendTo(container);
                        }
                }]
                },{
                    title:"<spring:message code='mis.lbl.predictionoptional' />",
                    headerAttributes:{ "class":"hasBob" },
                    columns: [ {
                        field:"goodsCarQty", title: "<spring:message code='mis.lbl.localOption' /><spring:message code='mis.lbl.goodscarqty' />",
                        width: 150, attributes:{"class":"ac"}
                            ,editor:function(container, options){
                                $('<input required name="goodsCarQty" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                     format:"n0"                // n0:###,###, n2:###,###.##
                                    ,decimals:1                 // 소숫점
                                    ,min:0
                                    ,value:0
                                    ,spinners:false
                                });
                                $('<span class="k-invalid-msg" data-for="goodsCarQty"></span>').appendTo(container);
                            }
                    },{
                        field:"insApplyRate", title:"<spring:message code='mis.lbl.inspassesrate' />",
                        width:150, attributes:{"class":"ac"}
                            ,editor:function(container, options){
                                $('<input required name="insApplyRate" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                     format:"n0"                // n0:###,###, n2:###,###.##
                                    ,decimals:1                 // 소숫점
                                    ,min:0
                                    ,value:0
                                    ,spinners:false
                                });
                                $('<span class="k-invalid-msg" data-for="insApplyRate"></span>').appendTo(container);
                            }
                    },{
                        field:"fincApplyRate", title:"<spring:message code='mis.lbl.fncpassesrate' />",
                        width:150, attributes:{"class":"ac"}
                            ,editor:function(container, options){
                                $('<input required name="fincApplyRate" data-bind="value:' + options.field + '"/>')
                                .appendTo(container)
                                .kendoExtNumericTextBox({
                                     format:"n0"                // n0:###,###, n2:###,###.##
                                    ,decimals:1                 // 소숫점
                                    ,min:0
                                    ,value:0
                                    ,spinners:false
                                });
                                $('<span class="k-invalid-msg" data-for="fincApplyRate"></span>').appendTo(container);
                            }
                    }]
                }]
        });





        // 제조사목표 그리드 설정
        $("#manuTargetGrid").kendoExtGrid({
            gridId:"G-MIS-0901-093600"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptManuTargetAllGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorDate"] = $("#sMonitorDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                    ,async:false
                }
                ,schema:{
                    model:{
                        id:"deliverGoal"
                        ,fields:{
                            deliverGoal:{type:"number", validation:{required:true}, editable:false}
                            ,terminalObjectGoal:{type:"number", validation:{required:true}, editable:false}
                        }
                    }
                }
            }
            ,height:48
            ,scrollable:false
            ,filterable:false
            ,indvColumnVisible:false         //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,editable:false
            ,sortable:false
            ,pageable:false
            ,selectable :false
            ,autoBind   :false
            ,columns:[
                {field:"deliverGoal", title:"<spring:message code='mis.lbl.deliverGoal' />", width:220, format:"{0:n0}", attributes:{"class":"ar"}}     //인도목표
                ,{field:"terminalObjectGoal", title:"<spring:message code='mis.lbl.terminalObjectGoal' />", width:220, format:"{0:n0}", attributes:{"class":"ar"}}   //단말목표
            ]
        });

        // 제조사목표 (차종별) 그리드 설정
        $("#manuChannelGrid").kendoExtGrid({
            gridId:"G-MIS-0922-185824"
            ,dataSource:{
                requestEnd:function(e) {

                    var manuChannelList = e.response.manuColumnList;
                    var sColumn = [];
                    sColumn = gridColumns1.concat(sColumn);

                    $.each(manuChannelList, function(idx, row){
                        var manuChannelColumn = {};
                        manuChannelColumn["field"] = row.carlineCd;
                        manuChannelColumn["title"] = row.carlineNm;
                        manuChannelColumn["width"] = 60;
                        manuChannelColumn["attributes"] = {"class":"ar"};
                        manuChannelColumn["template"] = row.manuTargQty;
                        sColumn.push(manuChannelColumn);
                    });

                    $("#manuChannelGrid").data("kendoExtGrid").setOptions({ columns:sColumn } );

                }
                ,transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptManuTargetChannelGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorDate"] = $("#sMonitorDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                    ,async:false
                }
                ,batch:false
                ,schema:{
                    model:{
                        id:"manuDlrCd"
                        ,fields:{
                             manuDlrCd:{type:"string"}
                            ,manuCarlineCd:{type:"string"}
                            ,manuCarlineNm:{type:"string"}
                            ,manuTargQty:{type:"string"}
                        }
                    }
                }
            }
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false      //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,filterable:false
        ,height:48
        ,scrollable:false
        ,editable   :false
        ,resizable  :false
        ,autoBind   :false
        ,selectable :false
        ,navigatable:true
        ,sortable:false
        ,pageable:false
        ,reorderable:true
            ,columns:[
                //{field:"manuDlrCd", title:"<spring:message code='global.lbl.dlrCd' />", attributes:{"class":"ac"}, width:80}
            ]
        });

        gridColumns1 = $("#manuChannelGrid").data("kendoExtGrid").columns;

        //딜러분해(차형) 그리드 설정
        $("#dealerTargetGrid").kendoExtGrid({
            gridId:"G-MIS-1004-204839"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptDealerTargetAllGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorDate"] = $("#sMonitorDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                    ,async:false
                }
                ,schema:{
                    model:{
                        id:"allDealerGoalDate"
                        ,fields:{
                             allDealerGoalDate:{type:"string",editable:false}
                            ,allDealerGoalPrefVal:{type:"number",editable:true}
                            ,idccDealerGoalPrefVal:{type:"number",editable:true}
                            ,shopDealerGoalPrefVal:{type:"number",editable:true}
                            ,orgDealerGoalPrefVal:{type:"number",editable:true}
                            ,etcDealerGoalPrefVal:{type:"number",editable:true}
                        }
                    }
                }
            }
            ,height:48
            ,scrollable:false
            ,filterable:false
            ,indvColumnVisible:false            //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false        //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,pageable:false
            ,selectable :"row"
            ,autoBind   :false
            ,dataBound:function (e) {

                $("#dealerChannelGrid").data('kendoExtGrid').dataSource.page(1);    //딜러분해(채널) - [딜러분해(차형)] 그리드 로딩 후 조회
                $("#dealerCustGrid").data('kendoExtGrid').dataSource.page(1);       //집객목표
                $("#dealerProcessTarget").data('kendoExtGrid').dataSource.page(1);  //과정목표

            }
            ,edit:function(e){
                var fieldName = $(e.container.find("input")[1]).attr("name");
                 if(fieldName=="allDealerGoalPrefVal"){
                     this.closeCell();
                 }
             }
            ,columns:[
                {field:"allDealerGoalPrefVal", title:"<spring:message code='mis.lbl.monthalltarget' />", width:220, format:"{0:n0}", attributes:{"class":"f_font02 ar"}}   //당월 총목표
                ,{field:"idccDealerGoalPrefVal", title:"<spring:message code='mis.lbl.idcc' />", width:220, format:"{0:n0}", attributes:{"class":"ar"}  //IDCC
                    ,editor:function(container, options){
                        $('<input required name="idccDealerGoalPrefVal" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:0                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                            ,change:dealerTargetQty
                        });
                        $('<span class="k-invalid-msg" data-for="idccDealerGoalPrefVal"></span>').appendTo(container);
                    }
                }
                ,{field:"shopDealerGoalPrefVal", title:"<spring:message code='mis.lbl.market' />", width:220, format:"{0:n0}", attributes:{"class":"ar"}    //전시장
                    ,editor:function(container, options){
                        $('<input required name="shopDealerGoalPrefVal" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:0                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                            ,change:dealerTargetQty
                        });
                        $('<span class="k-invalid-msg" data-for="shopDealerGoalPrefVal"></span>').appendTo(container);
                    }

                }
                ,{field:"orgDealerGoalPrefVal", title:"<spring:message code='mis.lbl.lv2DlrOrg' />", width:220, format:"{0:n0}", attributes:{"class":"ar"}  //2급딜러
                    ,editor:function(container, options){
                        $('<input required name="orgDealerGoalPrefVal" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:0                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                            ,change:dealerTargetQty
                        });
                        $('<span class="k-invalid-msg" data-for="orgDealerGoalPrefVal"></span>').appendTo(container);
                    }

                }
                ,{field:"etcDealerGoalPrefVal", title:"<spring:message code='mis.lbl.etc' />", width:220, format:"{0:n0}", attributes:{"class":"ar"}    //기타
                    ,editor:function(container, options){
                        $('<input required name="etcDealerGoalPrefVal" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:0                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                            ,change:dealerTargetQty
                        });
                        $('<span class="k-invalid-msg" data-for="etcDealerGoalPrefVal"></span>').appendTo(container);
                    }
                }
            ]
        });

        //딜러분해(채널) 그리드 설정
        $("#dealerChannelGrid").kendoExtGrid({
            gridId:"G-MIS-1005-151602"
            ,dataSource:{
                requestEnd:function(e) {

                    var dealerChannelList = e.response.dealerColumnList;
                    var sColumn = [];
                    sColumn = gridColumns2.concat(sColumn);

                    $.each(dealerChannelList, function(idx, row){
                        var dealerChannelColumn = {};
                        dealerChannelColumn["field"] = row.carlineCd;
                        dealerChannelColumn["title"] = row.carlineNm;
                        dealerChannelColumn["width"] = 60;
                        dealerChannelColumn["attributes"] = {"class":"ar"};
                        dealerChannelColumn["template"] = row.dealerGoalPrefVal;
                        sColumn.push(dealerChannelColumn);
                    });

                    $("#dealerChannelGrid").data("kendoExtGrid").setOptions({ columns:sColumn } );

                }
                ,transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptDealerTargetChannelGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorDate"] = $("#sMonitorDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                    ,async:false
                }
                ,batch:false
                ,schema:{
                    model:{
                        id:"dealerGoalYy"
                        ,fields:{
                             dealerGoalYy:{type:"string", editable:false}
                            ,dealerGoalMm:{type:"string", editable:false}
                            ,dealerCarlineCd:{type:"string", editable:false}
                            ,dealerCarlineNm:{type:"string", editable:false}
                            ,dealerDlrTp:{type:"string", editable:false}
                            ,dealerGoalTp:{type:"string", editable:false}
                            ,dealerGoalPrefVal:{type:"string", editable:true}
                            ,dealerSumGoalPrefVal:{type:"string", editable:true}
                            ,dealerGapGoalPrefVal:{type:"string", editable:true}
                        }
                    }

                }
            }
            ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,filterable:false
            ,height:90
            ,scrollable:false
            ,resizable  :false
            ,autoBind   :false
            ,selectable :"row"
            ,navigatable:true
            ,sortable:false
            ,pageable:false
            ,edit:function(e){
                var grid = this,

                fieldName = e.container.find("input[name][data-bind]").attr("name");

                    if(fieldName=="dealerSumGoalPrefVal" || fieldName=="dealerGapGoalPrefVal"){
                        this.closeCell();
                    }

             }
            ,columns:[
                {field:"dealerDlrTp", title:"<spring:message code='mis.lbl.salechannel' />", width:80, attributes:{"class":"ac"}    //채널
                    ,template:function(dataItem){
                        if(dataItem.dealerDlrTp == "I"){
                            return '<spring:message code="mis.lbl.idcc" />';
                        } else if(dataItem.dealerDlrTp == "M"){
                            return '<spring:message code="mis.lbl.market" />';
                        }
                        return '-';
                    }
                }
                ,{field:"dealerSumGoalPrefVal", title:"<spring:message code='mis.lbl.total' />", attributes:{"class":"f_font02 ar"}, width:80} //합계
                ,{field:"dealerGapGoalPrefVal", title:"<spring:message code='mis.lbl.gap' />", attributes:{"class":"f_font02 ar"}, width:80    //차이
                    ,template:function(dataItem){


                        var dealerChannelGap = "";
                        var dealerChannelGapVal = 0;
                        var dealerDlrTp = dataItem.dealerDlrTp;
                        var allDealerGoalPrefVal = dataItem.dealerSumGoalPrefVal;
                        var dealerTargetGrid = $("#dealerTargetGrid").data('kendoExtGrid');
                        var idccDealerGoalPrefVal = dealerTargetGrid.dataSource._data[0].idccDealerGoalPrefVal;
                        var shopDealerGoalPrefVal = dealerTargetGrid.dataSource._data[0].shopDealerGoalPrefVal;

                        if ( dealerDlrTp === "I" ) {
                            dealerChannelGapVal = allDealerGoalPrefVal-idccDealerGoalPrefVal;
                        } else if ( dealerDlrTp === "M" ) {
                            dealerChannelGapVal = allDealerGoalPrefVal-shopDealerGoalPrefVal;
                        };

                        if ( dealerChannelGapVal < 0 ) {
                            dealerChannelGap = "<span class='f_font01'>" + dealerChannelGapVal + "</span>";        //빨간색
                        } else if ( dealerChannelGapVal > 0 ) {
                            dealerChannelGap = "<span class='f_font04'>" + dealerChannelGapVal + "</span>";        //초록색
                        } else {
                            dealerChannelGap = "<span class='f_font02'>" + dealerChannelGapVal + "</span>";        //-
                        };

                        return dealerChannelGap;

                    }
                }
            ]
        });

        gridColumns2 = $("#dealerChannelGrid").data("kendoExtGrid").columns;

        //집객목표 그리드 설정
        $("#dealerCustGrid").kendoExtGrid({
            gridId:"G-MIS-1005-164802"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptMgmtDealerDcptCustGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorDate"] = $("#sMonitorDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                    ,async:false
                }
                ,schema:{
                    model:{
                        id:"valueChk"
                        ,fields:{
                             valueChk:{type:"string", editable:false}
                            ,dealerCustDate:{type:"string", editable:false}
                            ,allCustDealerOpinionvalue:{type:"number", editable:true}
                            ,idccCustDealerOpinionvalue:{type:"number", editable:true}
                            ,shopCustDealerOpinionvalue:{type:"number", editable:true}
                        }
                    }
                }
            }
            ,height:72
            ,scrollable:false
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,pageable:false
            ,selectable :"row"
            ,autoBind   :false
            ,edit:function(e){
                var grid = this,

                fieldName = e.container.find("input[name][data-bind]").attr("name");

                if (e.model.valueChk == "OP") {
                    if(fieldName=="allCustDealerOpinionvalue" || fieldName=="idccCustDealerOpinionvalue" || fieldName=="shopCustDealerOpinionvalue"){
                        this.closeCell();
                    }
                }
                if (e.model.valueChk == "CF") {
                    if(fieldName=="allCustDealerOpinionvalue"){
                        this.closeCell();
                    }
                }

             }
            ,columns:[
                {field:"valueChk", title:"<b><spring:message code='mis.lbl.collectcustomertarget' /></b>", width:80, attributes:{"class":"ac"}  //집객목표
                    ,template:function(dataItem){
                        if(dataItem.valueChk == "OP"){
                            return '<spring:message code="mis.lbl.opinionvalue" />';
                        } else if(dataItem.valueChk == "CF"){
                            return '<spring:message code="mis.lbl.prefVal" />';
                        }
                        return '-';
                    }
                }
                ,{field:"allCustDealerOpinionvalue", title:"<spring:message code='mis.lbl.total' />", attributes:{"class":"f_font02 ar"}, format:"{0:n0}", width:80}   //합계
                ,{field:"idccCustDealerOpinionvalue", title:"<spring:message code='mis.lbl.idcc' />", attributes:{"class":"ar"}, format:"{0:n0}", width:80  //IDCC
                    ,editor:function(container, options){
                        $('<input required name="idccCustDealerOpinionvalue" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:0                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                            ,change:dealerCustCnt
                        });
                        $('<span class="k-invalid-msg" data-for="idccCustDealerOpinionvalue"></span>').appendTo(container);
                    }
                 }
                ,{field:"shopCustDealerOpinionvalue", title:"<spring:message code='mis.lbl.market' />", attributes:{"class":"ar"}, format:"{0:n0}", width:80    //전시장
                    ,editor:function(container, options){
                        $('<input required name="shopCustDealerOpinionvalue" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:0                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                            ,change:dealerCustCnt
                        });
                        $('<span class="k-invalid-msg" data-for="shopCustDealerOpinionvalue"></span>').appendTo(container);
                    }
                }
            ]
        });

        //과정목표 그리드 설정
        $("#dealerProcessTarget").kendoExtGrid({
            gridId:"G-MIS-1005-170652"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptStepProcessDerivationGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorDate"] = $("#sMonitorDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                    ,async:false
                }
                ,schema:{
                    model:{
                        id:"kpiIdccCustVsitRate"
                        ,fields:{
                             dealerProcessDate:{type:"string", validation:{required:true}}
                            ,kpiIdccCustVsitRate:{type:"number", validation:{required:true}}
                            ,kpiIdccVsitDealCnt:{type:"string", validation:{required:true}}
                            ,kpiIdccDealrate:{type:"string", validation:{required:true}}
                            ,custInfoInputRate:{type:"string", validation:{required:true}}
                            ,kpiMarketDealrate:{type:"string", validation:{required:true}}
                            ,fncPassesRate:{type:"string", validation:{required:true}}  // 금융 침투율
                            ,oneFinanceProfit:{type:"string", validation:{required:true}}  // 대당 금융 이윤
                            ,insPassesRate:{type:"string", validation:{required:true}}
                            ,oneInsuranceProfit:{type:"string", validation:{required:true}}
                            ,oneOptionMaueVal:{type:"string", validation:{required:true}}
                            ,goodScarRate:{type:"string", validation:{required:true}}
                            ,financeProfit:{type:"string", validation:{required:true}}
                            ,optionProfit:{type:"string", validation:{required:true}}
                            ,insuranceProfit:{type:"string", validation:{required:true}}
                            ,sumDerivationProfit:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            ,height:48
            ,scrollable:false
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,pageable:false
            ,selectable :false
            ,autoBind   :false
            ,dataBound:function (e) {

                // 딜러분해(차형) / 과정목표 그리드 로딩 후 조회
                $("#processDerivationGrid").data('kendoExtGrid').dataSource.page(1);

            }
            ,columns:[
                 {field:"kpiIdccCustVsitRate", title:"<spring:message code='mis.lbl.idcc' /><spring:message code='mis.lbl.kpiIdccCustVsitRate' />", format:"{0:n0} %", width:80, attributes:{"class":"ar"}  //IDCC내방요청율
                     ,editor:function(container, options){
                         $('<input required name="kpiIdccCustVsitRate" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtNumericTextBox({
                              format:"n0"         // n0:###,###, n2:###,###.##
                             ,decimals:1                 // 소숫점
                             ,min:0
                             ,value:0
                             ,spinners:false
                         });
                         $('<span class="k-invalid-msg" data-for="kpiIdccCustVsitRate"></span>').appendTo(container);
                     }
                 }
                ,{field:"kpiIdccVsitDealCnt", title:"<spring:message code='mis.lbl.idcc' /><spring:message code='mis.lbl.kpiIdccVsitDealCnt' />", format:"{0:n0} %", attributes:{"class":"ar"}, width:80    //IDCC방문거래율
                    ,editor:function(container, options){
                        $('<input required name="kpiIdccVsitDealCnt" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:1                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="kpiIdccVsitDealCnt"></span>').appendTo(container);
                    }
                }
                ,{field:"kpiIdccDealrate", title:"<spring:message code='mis.lbl.idcc' /><spring:message code='mis.lbl.dealrate' />", format:"{0:n0} %", attributes:{"class":"ar"}, width:80 //IDCC거래율
                    ,editor:function(container, options){
                        $('<input required name="kpiIdccDealrate" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:1                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="kpiIdccDealrate"></span>').appendTo(container);
                    }
                }
                ,{field:"custInfoInputRate", title:"<spring:message code='mis.lbl.market' /><spring:message code='mis.lbl.custinfoinputrate' />", format:"{0:n0} %", attributes:{"class":"ar"}, width:80    //전시장개인정보취득율
                    ,editor:function(container, options){
                        $('<input required name="custInfoInputRate" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:1                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="custInfoInputRate"></span>').appendTo(container);
                    }
                }
                ,{field:"kpiMarketDealrate", title:"<spring:message code='mis.lbl.market' /><spring:message code='mis.lbl.dealrate' />", format:"{0:n0} %", attributes:{"class":"ar"}, width:80 //전시장거래율
                    ,editor:function(container, options){
                        $('<input required name="kpiMarketDealrate" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:1                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="kpiMarketDealrate"></span>').appendTo(container);
                    }
                }
                ,{field:"fncPassesRate", title:"<spring:message code='mis.lbl.fncpassesrate' />", format:"{0:n0} %", attributes:{"class":"ar"}, width:80    //금융침투율(%)
                    ,editor:function(container, options){
                        $('<input required name="fncPassesRate" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:1                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="fncPassesRate"></span>').appendTo(container);
                    }
                }
                ,{field:"oneFinanceProfit", title:"<spring:message code='mis.lbl.onefinanceprofit' />", format:"￥ {0:n0}", attributes:{"class":"ar"}, width:80  //대당금융이윤
                    ,editor:function(container, options){
                        $('<input required name="oneFinanceProfit" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:0                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="oneFinanceProfit"></span>').appendTo(container);
                    }
                }
                ,{field:"insPassesRate", title:"<spring:message code='mis.lbl.inspassesrate' />", format:"{0:n0} %", attributes:{"class":"ar"}, width:80    //보험침투율(%)
                    ,editor:function(container, options){
                        $('<input required name="insPassesRate" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:1                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="insPassesRate"></span>').appendTo(container);
                    }
                }
                ,{field:"oneInsuranceProfit", title:"<spring:message code='mis.lbl.oneinsuranceprofit' />", format:"￥ {0:n0}", attributes:{"class":"ar"}, width:80  //대당보험이윤
                    ,editor:function(container, options){
                        $('<input required name="oneInsuranceProfit" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:0                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="oneInsuranceProfit"></span>').appendTo(container);
                    }
                }
                ,{field:"oneOptionMaueVal", title:"<spring:message code='mis.lbl.oneoptionmaueval' />", format:"￥ {0:n0}", attributes:{"class":"ar"}, width:80  //용품대당생산액
                    ,editor:function(container, options){
                        $('<input required name="oneOptionMaueVal" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:0                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="oneOptionMaueVal"></span>').appendTo(container);
                    }
                }
                ,{field:"goodsCarRate", title:"<spring:message code='mis.lbl.goodscarrate' />", format:"{0:n0} %", attributes:{"class":"ar"}, width:80  //용품이윤율
                    ,editor:function(container, options){
                        $('<input required name="goodsCarRate" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtNumericTextBox({
                             format:"n0"                // n0:###,###, n2:###,###.##
                            ,decimals:1                 // 소숫점
                            ,min:0
                            ,value:0
                            ,spinners:false
                        });
                        $('<span class="k-invalid-msg" data-for="goodsCarRate"></span>').appendTo(container);
                    }
                }

            ]
        });

        //파생예측 그리드 설정
        $("#processDerivationGrid").kendoExtGrid({
            gridId:"G-MIS-1005-175252"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/mis/tds/selectTargetDcptStepProcessDerivationGrid.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sMonitorDate"] = $("#sMonitorDate").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                    ,async:false
                }
                ,schema:{
                    model:{
                        id:"kpiIdccCustVsitRate"
                        ,fields:{
                             dealerProcessDate:{type:"string", editable:false}
                            ,sumDerivationProfit:{type:"number", editable:true}
                            ,financeProfit:{type:"number", editable:true}
                            ,optionProfit:{type:"number", editable:true}
                            ,insuranceProfit:{type:"number", editable:true}
                        }
                    }
                }
            }
            ,height:48
            ,scrollable:false
            ,filterable:false
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,sortable:false
            ,pageable:false
            ,selectable :"row"
            ,autoBind   :false
            ,edit:function(e){
                var grid = this,

                fieldName = e.container.find("input[name][data-bind]").attr("name");

                    if ( fieldName === "sumDerivationProfit" || fieldName === "financeProfit" || fieldName === "optionProfit"  || fieldName === "insuranceProfit" ){
                        this.closeCell();
                    }
             }
            ,dataBound:function (e) {


                var dealerTargetGrid = $("#dealerTargetGrid").data('kendoExtGrid');                     //딜러분해(차형) 그리드
                var allDealerGoalPrefVal = dealerTargetGrid.dataSource._data[0].allDealerGoalPrefVal;   //당월 총목표

                var dealerProcessTarget = $("#dealerProcessTarget").data('kendoExtGrid');               //과정목표 그리드
                var fncPassesRate = 0;      //금융침투율
                var oneFinanceProfit = 0;   //대당금융이윤
                var insPassesRate = 0;      //보험침투율
                var oneInsuranceProfit = 0; //대당보험이윤
                var oneOptionMaueVal = 0;   //용품대당생산액
                var goodsCarRate = 0;       //용품이윤율

                if ( dealerProcessTarget._data.length > 0 ) {
                    fncPassesRate = dealerProcessTarget.dataSource._data[0].fncPassesRate;              //금융침투율
                    oneFinanceProfit = dealerProcessTarget.dataSource._data[0].oneFinanceProfit;        //대당금융이윤
                    insPassesRate = dealerProcessTarget.dataSource._data[0].insPassesRate;              //보험침투율
                    oneInsuranceProfit = dealerProcessTarget.dataSource._data[0].oneInsuranceProfit;    //대당보험이윤
                    oneOptionMaueVal = dealerProcessTarget.dataSource._data[0].oneOptionMaueVal;        //용품대당생산액
                    goodsCarRate = dealerProcessTarget.dataSource._data[0].goodsCarRate;                //용품이윤율
                };

                var processDerivationGrid = $("#processDerivationGrid").data("kendoExtGrid");

                if ( dealerProcessTarget._data.length > 0 ) {

                    var rowData = processDerivationGrid.dataItem("tr:eq(0)");
                    rowData.set("financeProfit", allDealerGoalPrefVal * fncPassesRate/100 * oneFinanceProfit );
                    rowData.set("optionProfit", allDealerGoalPrefVal * oneOptionMaueVal * goodsCarRate/100 );
                    rowData.set("insuranceProfit", allDealerGoalPrefVal * insPassesRate/100 * oneInsuranceProfit );
                    rowData.set("sumDerivationProfit", (allDealerGoalPrefVal * fncPassesRate/100 * oneFinanceProfit)+(allDealerGoalPrefVal * oneOptionMaueVal * goodsCarRate/100)+(allDealerGoalPrefVal * insPassesRate/100 * oneInsuranceProfit ) );
                };

            }
            ,columns:[
                 {field:"sumDerivationProfit", title:"<spring:message code='mis.lbl.sumderivationprofit' />"   , format:"￥ {0:n0}", width:80, attributes:{"class":"f_font02 ar"}} //파생이윤합계
                ,{field:"financeProfit", title:"<spring:message code='mis.lbl.financeprofit' />", attributes:{"class":"ar"}, format:"￥ {0:n0}", width:80}    //금융이윤
                ,{field:"optionProfit", title:"<spring:message code='mis.lbl.optionprofit' />", attributes:{"class":"ar"}, format:"￥ {0:n0}", width:80}  //용품이윤
                ,{field:"insuranceProfit", title:"<spring:message code='mis.lbl.insuranceprofit' />", attributes:{"class":"ar"}, format:"￥ {0:n0}", width:80}    //보험이윤
            ]
        });

        /** 딜러사 당월 총목표 계산**/
        dealerTargetQty = function(e){

            // 당월 총목표: IDCC + 전시장 + 2급딜러 + 기타
            var grid = $("#dealerTargetGrid").data("kendoExtGrid");
            var gridData = grid.dataSource._data;

            var selectedVal = grid.dataItem(grid.select());

            var idccDealerGoalPrefVal = Number(selectedVal.idccDealerGoalPrefVal);
            var shopDealerGoalPrefVal  = Number(selectedVal.shopDealerGoalPrefVal);
            var orgDealerGoalPrefVal = Number(selectedVal.orgDealerGoalPrefVal);
            var etcDealerGoalPrefVal = Number(selectedVal.etcDealerGoalPrefVal);

            var allDealerGoalPrefVal = Number((idccDealerGoalPrefVal + shopDealerGoalPrefVal + orgDealerGoalPrefVal +  etcDealerGoalPrefVal));

            selectedVal.set("allDealerGoalPrefVal",allDealerGoalPrefVal);

        };

        /** 딜러사 당월 총목표 계산**/
        dealerCustCnt = function(e){

            // 당월 총목표: IDCC + 전시장
            var grid = $("#dealerCustGrid").data("kendoExtGrid");
            var gridData = grid.dataSource._data;

            var selectedVal = grid.dataItem(grid.select());

            var idccCustDealerOpinionvalue = Number(selectedVal.idccCustDealerOpinionvalue);
            var shopCustDealerOpinionvalue  = Number(selectedVal.shopCustDealerOpinionvalue);

            var allCustDealerOpinionvalue = Number((idccCustDealerOpinionvalue + shopCustDealerOpinionvalue));

            selectedVal.set("allCustDealerOpinionvalue",allCustDealerOpinionvalue);

        };

        /** 파생예측 합계 계산**/
        processDerivation = function(e){

            // 파생예측 합계: 금융이윤 + 용품이윤 + 보험이윤
            var grid = $("#processDerivationGrid").data("kendoExtGrid");
            var gridData = grid.dataSource._data;

            var selectedVal = grid.dataItem(grid.select());

            var sumDerivationProfit = Number(selectedVal.sumDerivationProfit);
            var financeProfit  = Number(selectedVal.financeProfit);
            var optionProfit  = Number(selectedVal.optionProfit);
            var insuranceProfit  = Number(selectedVal.insuranceProfit);

            var sumDerivationProfit = Number((financeProfit + optionProfit + insuranceProfit));

            selectedVal.set("sumDerivationProfit",sumDerivationProfit);

        };

        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e){

                // 딜러분해(차형) 총목표 저장
                var dealerTargetGrid = $("#dealerTargetGrid").data("kendoExtGrid");
                var dlTgGdSaveData = dealerTargetGrid.getCUDData("insertList", "updateList", "deleteList");

                if (dealerTargetGrid.cudDataLength != 0) {
                    $.ajax({
                        url:"<c:url value='/mis/tds/multiDealerTargetGridSave.do' />"
                        ,data:JSON.stringify(dlTgGdSaveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(error);
                        }
                        ,success:function(jqXHR, textStatus) {
                            var dealerTargetGrid = $("#dealerTargetGrid").data("kendoExtGrid");
                            dealerTargetGrid.dataSource._destroyed = [];
                            dealerTargetGrid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            //dms.notification.success("<spring:message code='mis.lbl.dealersaledcpt' /> "+" <spring:message code='global.info.success'/>");
                        }
                    });
                }

                // 딜러분해(차형) 개별목표 저장
                var dealerChannelGrid = $("#dealerChannelGrid").data("kendoExtGrid");
                var dlCnGdSaveData = $("#dealerChannelGrid").data("kendoExtGrid").getCUDData("insertChanList", "updateChanList", "deleteChanList");
                if (dealerChannelGrid.cudDataLength != 0) {
                    $.ajax({
                        url:"<c:url value='/mis/tds/multiDealerChannelGridSave.do' />"
                        ,data:JSON.stringify(dlCnGdSaveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(error);
                        }
                        ,success:function(jqXHR, textStatus) {
                            var dealerChannelGrid = $("#dealerChannelGrid").data("kendoExtGrid");
                            dealerChannelGrid.dataSource._destroyed = [];
                            dealerChannelGrid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='mis.lbl.dealersaledcpt' /> "+" <spring:message code='global.info.success'/>");
                        }
                    });
                }
                // 집객목표 저장
                var dealerCustGrid = $("#dealerCustGrid").data("kendoExtGrid");
                var dlCuGdSaveData =dealerCustGrid.getCUDData("insertList", "updateList", "deleteList");
                if (dealerCustGrid.cudDataLength != 0) {
                    $.ajax({
                        url:"<c:url value='/mis/tds/multiDealerCustGridSave.do' />"
                        ,data:JSON.stringify(dlCuGdSaveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(error);
                        }
                        ,success:function(jqXHR, textStatus) {
                            var dealerCustGrid = $("#dealerCustGrid").data("kendoExtGrid");
                            dealerCustGrid.dataSource._destroyed = [];
                            dealerCustGrid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='mis.lbl.collectcustomertarget' /> "+" <spring:message code='global.info.success'/>");
                        }
                    });
                }

                // 과정목표 저장
                var dealerProcessTarget = $("#dealerProcessTarget").data("kendoExtGrid");
                var dlPcTgSaveData =dealerProcessTarget.getCUDData("insertList", "updateList", "deleteList");
                if (dealerProcessTarget.cudDataLength != 0) {
                    $.ajax({
                        url:"<c:url value='/mis/tds/multiDealerProcessTargetSave.do' />"
                        ,data:JSON.stringify(dlPcTgSaveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(error);
                        }
                        ,success:function(jqXHR, textStatus) {
                            var dealerProcessTarget = $("#dealerProcessTarget").data("kendoExtGrid");
                            dealerProcessTarget.dataSource._destroyed = [];
                            dealerProcessTarget.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='mis.lbl.processtarget' /> "+" <spring:message code='global.info.success'/>");
                        }
                    });
                }

                // 파생예측 저장
                var processDerivationGrid = $("#processDerivationGrid").data("kendoExtGrid");
                var pcDvGdSaveData =processDerivationGrid.getCUDData("insertList", "updateList", "deleteList");
                if (processDerivationGrid.cudDataLength != 0) {
                    $.ajax({
                        url:"<c:url value='/mis/tds/multiProcessDerivationGridSave.do' />"
                        ,data:JSON.stringify(pcDvGdSaveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(error);
                        }
                        ,success:function(jqXHR, textStatus) {
                            var processDerivationGrid = $("#processDerivationGrid").data("kendoExtGrid");
                            processDerivationGrid.dataSource._destroyed = [];
                            processDerivationGrid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='mis.lbl.derivationprediction' /> "+" <spring:message code='global.info.success'/>");
                        }
                    });
                }


            }

        });
    });
</script>