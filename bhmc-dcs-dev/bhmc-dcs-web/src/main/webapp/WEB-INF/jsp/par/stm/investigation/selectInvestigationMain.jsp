<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 재고 실사 대상 선정 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.selectInvestigationTarget" /> --%><!-- 재고실사 대상선정 --></h1>
            <div class="btn_right">
                <button class="btn_m" id="btnSave"><spring:message code="par.btn.createPhysInvDoc" /><!-- 재고실사문서생성 --></button>
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.strge" /><!-- 창고 --></span></th>
                        <td class="required_area">
                            <input id="sStrgeCd" name="sStrgeCd" class="form_comboBox" data-type="combo" required data-name="<spring:message code="par.lbl.strge" />" >
                        </td>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC CLASS --></th>
                        <td>
                            <input id="sAbcInd" class="form_comboBox" data-type="combo">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sItemCd" class="form_input">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" class="form_input">
                                </div>
                            </div>
                        </td>
                        <th scope="row" class="hidden"><spring:message code="par.lbl.stockStat" /><!-- 재고 상태 --></th>
                        <td>
                            <input id="sStockStatCd" class="form_comboBox hidden" data-type="combo"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.zoneCd" /><!-- Location --></span></th>
                        <td class="required_area">
                            <input class="form_comboBox" data-type="combo" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                        <td>
                            <input id="sItemDstinCd" class="form_comboBox" data-type="combo">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.salePrice" /><!-- 단가 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" class="form_input">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" class="form_input">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th/>
                        <td/>
                        <th scope="row"><spring:message code="par.lbl.locationCd" /><!-- 로케이션 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" class="form_input">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" class="form_input">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.lastGrDt" /><!-- 최근입고일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sLastGrDtFr" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sLastGrDtTo" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.lastGiDt" /><!-- 최근출고일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sLastGiDtFr" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sLastGiDtTo" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th/>
                        <td/>
                    </tr>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.locationCd" /><!-- Location --></th>
                        <td colspan="5">
                            <div class="form_float">
                                <div class="form_left" style="width:20%;">
                                    <input id="sLocLvl1" class="form_comboBox" data-type="combo">
                                </div>
                                <div class="form_left" style="width:20%;">
                                    <input id="sLocLvl2" class="form_comboBox lt3" data-type="combo">
                                </div>
                                <div class="form_left" style="width:20%;">
                                    <input id="sLocLvl3" class="form_comboBox lt3" data-type="combo">
                                </div>
                                <div class="form_left" style="width:20%;">
                                    <input id="sLocLvl4" class="form_comboBox lt3" data-type="combo">
                                </div>
                                <div class="form_right" style="width:20%;">
                                    <input id="sLocLvl5" class="form_comboBox lt3" data-type="combo">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //재고실사 대상 조회 정보 -->

    <!-- 실사 관리 정보 -->
    <section class="group mt10">
        <div class="table_form form_width_70per"  id="investigationSettForm">
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
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.stockLockYn" /><!-- 재고통제여부 --></span></th>
                        <td class="required_area">
                            <input id="stockLockYn" name="stockLockYn" class="form_comboBox" data-type="combo" required data-name="<spring:message code="par.lbl.stockLockYn" />" >
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.investigationPrsId" /><!-- 재고실사 담당자 --></span></th>
                        <td class="required_area">
                            <div class="form_search">
                                <input type="text" id="piMngUsrId" name="piMngUsrId" class="form_input" required data-name="<spring:message code="par.lbl.investigationPrsId" />" />
                                <a id="searchPiMngUsrId"><!-- 검색 --></a>
                                <input type="text" id="piMngUsrNm" class="form_input form_readonly hidden" readonly />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.remark" /><!--비고 --></th>
                        <td colspan="3">
                            <input id="remark" type="text" class="form_input" />
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="clfix">
            <div class="left_areaStyle" style="width:62%">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="par.title.searchPartsList" /><!-- 조회 부품리스트 --></h2>
                    <div class="btn_right">
                        <button id="btnAdd" class="btn_s btn_Select"><spring:message code="par.btn.add" /><!-- 추가 --></button>
                    </div>
                </div>
                <div class="table_grid">
                <!-- 그리드1 -->
                    <div id="searchGrid" class="grid"></div>
                <!-- 그리드1 -->
                </div>
            </div>
            <div class="right_areaStyle" style="width:37%;">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="par.title.selectPartsList" /><!-- 선택부품리스트 --></h2>
                    <div class="btn_right">
                        <button id="btnDelete" class="btn_s btn_del"><spring:message code="par.btn.del" /><!-- 삭제 --></button>
                    </div>
                </div>
                <div class="table_grid">
                <!-- 그리드1 -->
                    <div id="selectGrid" class="grid"></div>
                <!-- 그리드1 -->
                </div>
            </div>
        </div>
    </section>
    <!-- //실사 관리정보 -->

<!-- script -->
<script>

        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            binLocLvlCnt        = "${binLocLvlCnt}",
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
            binLocLevelList     = [],
            stockStatList       = [],
            stockStatObj        = {},
            itemDstinCdList     = [],
            itemDstinCdObj      = {},
            abcIndList          = [],
            abcIndObj           = {},
            carlineCdList       = [],
            carlineCdObj        = [],
            storageList         = [],
            storageObj          = {},
            stockLockYnList     = [],
            venderSearchPopupWin,
            userSearchPopupWin;
            //searchItemPopupWindow;


        storageObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            storageList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
            storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

        stockLockYnList.push({cmmCd:"", cmmCdNm:" "});
        stockLockYnList.push({cmmCd:"Y", cmmCdNm:"Yes"});
        stockLockYnList.push({cmmCd:"N", cmmCdNm:"No"});


        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        <c:forEach var="obj" items="${binLocLevelList}" varStatus="status">
            binLocLevelList["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        itemDstinCdList.push({cmmCd:"", cmmCdNm:" "});
        itemDstinCdObj[' '] = "";
        <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
            itemDstinCdList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        binLocLvl1Obj[' '] = "";
        binLocLvl2Obj[' '] = "";
        binLocLvl3Obj[' '] = "";
        binLocLvl4Obj[' '] = "";
        binLocLvl5Obj[' '] = "";
        binLocLvl1Obj['0'] = [];
        <c:forEach var="obj" items="${binLocList}">
            if("${obj.lvlId}" == 1){
                binLocLvl1Obj['0'].push({cmmCd:"${obj.locCd}", cmmCdNm:"${obj.locCd}"});
                binLocLvl1Obj["${obj.locCd}"] = "${obj.locCd}";
            }else if(Number("${obj.lvlId}") === 2){
                if(binLocLvl2Obj.hasOwnProperty("${obj.upperLocId}")){
                    binLocLvl2Obj["${obj.upperLocId}"]['0'].push({cmmCd:"${obj.locCd}", cmmCdNm:"${obj.locCd}"});
                    binLocLvl2Obj["${obj.upperLocId}"]["${obj.locCd}"] = "${obj.locCd}";
                }else{
                    binLocLvl2Obj["${obj.upperLocId}"] = {};
                    binLocLvl2Obj["${obj.upperLocId}"]['0'] = [];
                    binLocLvl2Obj["${obj.upperLocId}"]['0'].push({cmmCd:"${obj.locCd}", cmmCdNm:"${obj.locCd}"});
                    binLocLvl2Obj["${obj.upperLocId}"]["${obj.locCd}"] = "${obj.locCd}";
                }
            }else if(Number("${obj.lvlId}") === 3){
                if(binLocLvl3Obj.hasOwnProperty("${obj.upperLocId}")){
                    binLocLvl3Obj["${obj.upperLocId}"]['0'].push({cmmCd:"${obj.locCd}", cmmCdNm:"${obj.locCd}"});
                    binLocLvl3Obj["${obj.upperLocId}"]["${obj.locCd}"] = "${obj.locCd}";
                }else{
                    binLocLvl3Obj["${obj.upperLocId}"] = {};
                    binLocLvl3Obj["${obj.upperLocId}"]['0'] = [];
                    binLocLvl3Obj["${obj.upperLocId}"]['0'].push({cmmCd:"${obj.locCd}", cmmCdNm:"${obj.locCd}"});
                    binLocLvl3Obj["${obj.upperLocId}"]["${obj.locCd}"] = "${obj.locCd}";
                }
            }else if(Number("${obj.lvlId}") === 4){
                if(binLocLvl4Obj.hasOwnProperty("${obj.upperLocId}")){
                    binLocLvl4Obj["${obj.upperLocId}"]['0'].push({cmmCd:"${obj.locCd}", cmmCdNm:"${obj.locCd}"});
                    binLocLvl4Obj["${obj.upperLocId}"]["${obj.locCd}"] = "${obj.locCd}";
                }else{
                    binLocLvl4Obj["${obj.upperLocId}"] = {};
                    binLocLvl4Obj["${obj.upperLocId}"]['0'] = [];
                    binLocLvl4Obj["${obj.upperLocId}"]['0'].push({cmmCd:"${obj.locCd}", cmmCdNm:"${obj.locCd}"});
                    binLocLvl4Obj["${obj.upperLocId}"]["${obj.locCd}"] = "${obj.locCd}";
                }
            }else if(Number("${obj.lvlId}") === 5){
                if(binLocLvl5Obj.hasOwnProperty("${obj.upperLocId}")){
                    binLocLvl5Obj["${obj.upperLocId}"]['0'].push({cmmCd:"${obj.locCd}", cmmCdNm:"${obj.locCd}"});
                    binLocLvl5Obj["${obj.upperLocId}"]["${obj.locCd}"] = "${obj.locCd}";
                }else{
                    binLocLvl5Obj["${obj.upperLocId}"] = {};
                    binLocLvl5Obj["${obj.upperLocId}"]['0'] = [];
                    binLocLvl5Obj["${obj.upperLocId}"]['0'].push({cmmCd:"${obj.locCd}", cmmCdNm:"${obj.locCd}"});
                    binLocLvl5Obj["${obj.upperLocId}"]["${obj.locCd}"] = "${obj.locCd}";
                }
            }
        </c:forEach>

        console.log('binLocLvl1Obj:',binLocLvl1Obj);
        console.log('binLocLvl2Obj:',binLocLvl2Obj);
        console.log('binLocLvl3Obj:',binLocLvl3Obj);
        console.log('binLocLvl4Obj:',binLocLvl4Obj);
        console.log('binLocLvl5Obj:',binLocLvl5Obj);
        console.log('binLocLvlCnt:' ,binLocLvlCnt);

        abcIndList.push({cmmCd:"", cmmCdNm:" "});
        abcIndObj[' '] = "";
        <c:forEach var="obj" items="${abcIndList}" varStatus="status">
            abcIndList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        carlineCdList.push({cmmCd:"", cmmCdNm:" "});
        carlineCdObj[' '] = "";
        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
        </c:forEach>

        stockStatList.push({cmmCd:"", cmmCdNm:" "});
        stockStatObj[' '] = "";
        <c:forEach var="obj" items="${stockStatList}" varStatus="status">
            stockStatList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            stockStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

    $(document).ready(function() {
        var validator = $("#searchForm").kendoExtValidator().data("kendoExtValidator");

        //창고선택
        $("#sStrgeCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:storageList
            ,index:0
        });

        //ABC CLASS
        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:abcIndList
           ,index:0
        });

        //재고상태
       $("#sStockStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:stockStatList
           ,index:0
       });

       //Loc Level1
       $("#sLocLvl1").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:binLocLvl1Obj['0']
           ,index:0
       });

       //Loc Level2
       $("#sLocLvl2").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:[]
           ,index:0
       });

       //Loc Level3
       $("#sLocLvl3").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:[]
           ,index:0
       });

       //Loc Level4
       $("#sLocLvl4").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:[]
           ,index:0
       });

       //Loc Level5
       $("#sLocLvl5").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:[]
           ,index:0
       });

       $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:carlineCdList
           ,index:0
       });

       $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:itemDstinCdList
           ,index:0
       });

       $("#stockLockYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:stockLockYnList
           ,index:0
       });

       //조회조건-최근입고일 선택
        $("#sLastGrDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sLastGrDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //조회조건-최근출고일 선택
        $("#sLastGiDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#sLastGiDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });


        //$("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchPiMngUsrId").on('click', userSearchPopup);

        $("#sLocLvl1").on("change", function (){
            console.log('sLocLvl1 Change:',$(this).data("kendoExtDropDownList").value());
            console.log('binLocLvlCnt:',binLocLvlCnt);

            if(Number(binLocLvlCnt) >= 2){
                $("#sLocLvl2").data("kendoExtDropDownList").wrapper.show();
                if(!dms.string.isEmpty(binLocLvl2Obj[$(this).data("kendoExtDropDownList").value()])){
                    $("#sLocLvl2").data("kendoExtDropDownList").setDataSource(binLocLvl2Obj[$(this).data("kendoExtDropDownList").value()]['0']);
                }else{
                    $("#sLocLvl2").data("kendoExtDropDownList").setDataSource([]);
                }
                $("#sLocLvl3").data("kendoExtDropDownList").setDataSource([]);
                $("#sLocLvl4").data("kendoExtDropDownList").setDataSource([]);
                $("#sLocLvl5").data("kendoExtDropDownList").setDataSource([]);
            }
        });
        $("#sLocLvl2").on("change", function (){
            console.log('sLocLvl2 Change:',$(this).data("kendoExtDropDownList").value());
            if(Number(binLocLvlCnt) >= 3){
                $("#sLocLvl3").data("kendoExtDropDownList").wrapper.show();
                if(!dms.string.isEmpty(binLocLvl3Obj[$(this).data("kendoExtDropDownList").value()])){
                    $("#sLocLvl3").data("kendoExtDropDownList").setDataSource(binLocLvl3Obj[$(this).data("kendoExtDropDownList").value()]['0']);
                }else{
                    $("#sLocLvl3").data("kendoExtDropDownList").setDataSource([]);
                }
                $("#sLocLvl4").data("kendoExtDropDownList").setDataSource([]);
                $("#sLocLvl5").data("kendoExtDropDownList").setDataSource([]);
            }
        });
        $("#sLocLvl3").on("change", function (){
            console.log('sLocLvl3 Change:',$(this).data("kendoExtDropDownList").value());
            if(Number(binLocLvlCnt) >= 4){
                $("#sLocLvl4").data("kendoExtDropDownList").wrapper.show();
                if(!dms.string.isEmpty(binLocLvl4Obj[$(this).data("kendoExtDropDownList").value()])){
                    $("#sLocLvl4").data("kendoExtDropDownList").setDataSource(binLocLvl4Obj[$(this).data("kendoExtDropDownList").value()]['0']);
                }else{
                    $("#sLocLvl4").data("kendoExtDropDownList").setDataSource([]);
                }
                $("#sLocLvl5").data("kendoExtDropDownList").setDataSource([]);
            }
        });
        $("#sLocLvl4").on("change", function (){
            console.log('sLocLvl4 Change:',$(this).data("kendoExtDropDownList").value());
            if(Number(binLocLvlCnt) >= 5){
                $("#sLocLvl5").data("kendoExtDropDownList").wrapper.show();
                if(!dms.string.isEmpty(binLocLvl5Obj[$(this).data("kendoExtDropDownList").value()])){
                    $("#sLocLvl5").data("kendoExtDropDownList").setDataSource(binLocLvl5Obj[$(this).data("kendoExtDropDownList").value()]['0']);
                }else{
                    $("#sLocLvl5").data("kendoExtDropDownList").setDataSource([]);
                }
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
                if (validator.validate()) {
                    $("#searchGrid").data("kendoExtGrid").dataSource.read();
                }
            }
        });

     // 부품추가 버튼
        $("#btnAdd").kendoButton({
            click:function(e){
                var frGrid   = $("#searchGrid").data("kendoExtGrid"),
                    toGrid   = $("#selectGrid").data("kendoExtGrid"),
                    rows     = frGrid.select(),
                    toRows,
                    rowObj   = {};

                if(rows !== null){
                    if(rows.length < 1){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }
                    $.each(rows, function(idx, row){

                        if(frGrid.dataItem(row).stockLockYn !== 'Y'){
                            rowObj.dlrCd            = frGrid.dataItem(row).dlrCd;
                            rowObj.strgeCd          = frGrid.dataItem(row).strgeCd;
                            rowObj.locCd            = frGrid.dataItem(row).locCd;
                            rowObj.itemCd           = frGrid.dataItem(row).itemCd;
                            rowObj.itemNm           = frGrid.dataItem(row).itemNm;
                            rowObj.itemDstinCd      = frGrid.dataItem(row).itemDstinCd;
                            rowObj.carlineCd        = frGrid.dataItem(row).carlineCd;
                            rowObj.abcInd           = frGrid.dataItem(row).abcInd;
                            rowObj.lastGrDt         = frGrid.dataItem(row).lastGrDt;
                            rowObj.lastGiDt         = frGrid.dataItem(row).lastGiDt;
                            rowObj.unitCd           = frGrid.dataItem(row).unitCd;
                            rowObj.stockQty         = frGrid.dataItem(row).stockQty;
                            rowObj.stockPrc         = frGrid.dataItem(row).stockPrc;
                            rowObj.stockAmt         = frGrid.dataItem(row).stockAmt;
                            rowObj.stockLockYn      = frGrid.dataItem(row).stockLockYn;

                            if(popItemObj.hasOwnProperty(frGrid.dataItem(row).itemCd)){
                                //이미 등록되어있는 부품입니다.
                                var itemInfo = frGrid.dataItem(row).itemCd + '[' + frGrid.dataItem(row).itemNm + ']';
                                dms.notification.warning("<spring:message code='par.info.duplicatePartInfoChk' arguments='" + itemInfo + "'/>");
                            }else{
                                popItemObj[frGrid.dataItem(row).itemCd] = frGrid.dataItem(row).itemNm;;
                                toGrid.dataSource.add(rowObj);

                                //toGrid.select($(this));
                                //$(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                            }
                        }
                    });

                    toRows = toGrid.tbody.find("tr");

                    toRows.each(function(index, row) {
                        toGrid.select($(this));

                        $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                    });
                    frGrid.clearSelection();
                }
            }
        });

     // 부품삭제 버튼
        $("#btnDelete").kendoButton({
            click:function(e){
                var fromGrid   = $("#selectGrid").data("kendoExtGrid"),
                    toGrid     = $("#searchGrid").data("kendoExtGrid"),
                    rows       = fromGrid.select();



                rows.each(function(index, row) {
                    delete popItemObj[fromGrid.dataItem(row).itemCd];
                });
                rows.each(function(index, row) {
                    fromGrid.removeRow(row);
                });
            }
        });

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                if (validator.validate()) {
                    var saveList      = [],
                        grid          = $("#selectGrid").data("kendoExtGrid"),
                        rows          = grid.tbody.find("tr"),
                        lCrud         = '',
                        paramUrl      = '',
                        chkRow,
                        header;

                    header = {
                            strgeCd     :$("#sStrgeCd").val()
                           ,stockLockYn :$("#stockLockYn").data("kendoExtDropDownList").value()
                           ,prsnId      :$("#piMngUsrId").val()
                           ,remark      :$("#remark").val()
                    };

                    if(dms.string.isEmpty($("#sStrgeCd").val())){
                        //창고정보는 필수 입력 사항입니다.
                        dms.notification.warning("<spring:message code='par.lbl.strgeCd' var='strgeCd' /><spring:message code='global.info.required.field' arguments='${strgeCd}'/>");
                        return false;
                    }

                    if(dms.string.isEmpty($("#stockLockYn").val())){
                        //재고통제여부정보는 필수 입력 사항입니다.
                        dms.notification.warning("<spring:message code='par.lbl.stockLockYn' var='stockLockYn' /><spring:message code='global.info.required.field' arguments='${stockLockYn}'/>");
                        return false;
                    }

                    if(dms.string.isEmpty($("#piMngUsrId").val())){
                        //실사 담당자 정보는 필수 입력 사항입니다.
                        dms.notification.warning("<spring:message code='par.lbl.investigationPrsId' var='investigationPrsId' /><spring:message code='global.info.required.field' arguments='${investigationPrsId}'/>");
                        return false;
                    }

                    if(rows.length  == 0 ){
                        // 선택값이 없습니다.
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }

                    rows.each(function(index, row) {
                        var gridData = grid.dataSource.at(index);
                        chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                        if(chkRow === true){

                            if(dms.string.isEmpty(gridData.itemCd)){
                                // 부품정보가 없습니다.
                                dms.notification.warning("<spring:message code='par.lbl.itemCd' var='itemCd' /><spring:message code='par.info.itemInsertNotMsg' arguments='${itemCd}'/>");
                                saveList = [];
                                return false;
                            }

                            if(dms.string.isEmpty(gridData.unitCd)){
                                // 단위정보가 없습니다.
                                dms.notification.warning("<spring:message code='par.lbl.unitNm' var='unitNm' /><spring:message code='par.info.itemInsertNotMsg' arguments='${unitNm}'/>");
                                saveList = [];
                                return false;
                            }

                            if(gridData.stockLockYn === 'Y'){
                                // 재고통제 설정된 부품은 실사 대상이 될 수 없습니다.
                                dms.notification.warning("<spring:message code='par.err.stockLockMsgParam' arguments='"+ gridData.itemCd + "'/>");
                                saveList = [];
                                return false;
                            }

                            saveList.push({
                                locCd     :gridData.locCd
                               ,itemCd    :gridData.itemCd
                               ,unitCd    :gridData.unitCd
                            });
                        }
                    });

                    if(saveList.length > 0){
                        var data ={
                               "investigationVO"      :header
                              ,"investigationItemList":saveList
                            };
                        console.log("saveData::"+kendo.stringify(data),paramUrl );

                        $.ajax({
                             url:"<c:url value='/par/stm/investigation/createInvestigation.do' />"
                            ,data:kendo.stringify(data)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,async:false
                            ,success:function(result) {

                                if (result === 1) {
                                    dms.notification.success("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.info.regSuccessParam' arguments='${stockDdDoc}'/>");
                                    initPage();
                                    //$("#grid").data("kendoExtGrid").dataSource.read();

                                } else {
                                    console.log('errorResult:',result);
                                    if(result === 0){
                                        dms.notification.error("<spring:message code='par.lbl.stockDdDoc' var='stockDdDoc' /><spring:message code='global.err.regFailedParam' arguments='${stockDdDoc}'/>");
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





      // 재고실사조회 그리드
         $("#searchGrid").kendoExtGrid({
             dataSource:{
                 transport:{
                     read:{
                          url:"<c:url value='/par/stm/stockInOut/selectInvestigationTargetList.do' />"
                     }
                     , parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};

                             params["sort"]               = options.sort;

                             // 재고실사대상 검색조건 코드.
                             params["sStrgeCd"]           = $("#sStrgeCd").data("kendoExtDropDownList").value();
                             params["sAbcInd"]            = $("#sAbcInd").data("kendoExtDropDownList").value();
                             params["sStockStatCd"]       = $("#sStockStatCd").data("kendoExtDropDownList").value();
                             params["sItemCd"]            = $("#sItemCd").val();
                             params["sItemDstinCd"]       = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                             params["sLastGrDtFr"]        = $("#sLastGrDtFr").data("kendoExtMaskedDatePicker").value();
                             params["sLastGrDtTo"]        = $("#sLastGrDtTo").data("kendoExtMaskedDatePicker").value();
                             params["sLastGiDtFr"]        = $("#sLastGiDtFr").data("kendoExtMaskedDatePicker").value();
                             params["sLastGiDtTo"]        = $("#sLastGiDtTo").data("kendoExtMaskedDatePicker").value();
                             params["sCarlineCd"]         = $("#sCarlineCd").data("kendoExtDropDownList").value();
                             params["sLocLvl1"]           = $("#sLocLvl1").data("kendoExtDropDownList").value();
                             params["sLocLvl2"]           = $("#sLocLvl2").data("kendoExtDropDownList").value();
                             params["sLocLvl3"]           = $("#sLocLvl3").data("kendoExtDropDownList").value();
                             params["sLocLvl4"]           = $("#sLocLvl4").data("kendoExtDropDownList").value();
                             params["sLocLvl5"]           = $("#sLocLvl5").data("kendoExtDropDownList").value();


                             return kendo.stringify(params);
                         }
                     }
                 }
                 ,schema:{
                      data:function (result){
                          var itemList = [];

                          if(result.total === 0){
                              dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                          }

                          for(var i = 0, dataLen = result.total; i < dataLen; i = i + 1 ){
                              itemList.push(result.data[i].itemCd);
                          }

                          var header = {
                                  sItemCdLst       :itemList
                          };

                          $.ajax({
                              url:"<c:url value='/par/pmm/binlocation/selectBinLocationMasterByItemCd.do' />"
                             ,data:kendo.stringify(header)
                             ,type:'POST'
                             ,dataType:'json'
                             ,contentType:'application/json'
                             ,async:false
                             ,success:function(result) {

                                 locationListObj = {};

                                 locationObj[' '] = "";
                                 for(var i = 0, dataLen = result.data.length; i < dataLen; i = i + 1 ){
                                     if(locationListObj.hasOwnProperty(result.data[i].itemCd)){
                                         locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
                                     }else{
                                         locationListObj[result.data[i].itemCd] = [];
                                         locationListObj[result.data[i].itemCd].push({cmmCd:result.data[i].locCd, cmmCdNm:result.data[i].locNm});
                                     }

                                     if(!locationObj.hasOwnProperty(result.data[i].locCd)){
                                         locationObj[result.data[i].locCd] = result.data[i].locNm;
                                     }
                                 }

                             }
                             ,error:function(jqXHR,status,error) {
                                 dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                 return false;
                             }

                         });

                          return result.data;
                      }
                     ,total:"total"
                     ,model:{
                        id:"receiveNo"
                       ,fields:{
                               dlrCd          :{ type:"string" , validation:{required:true} }
                             , strgeCd        :{ type:"string", editable:false }
                             , locCd          :{type :"string"} //로케이션
                             , itemCd         :{ type:"string", editable:false }
                             , itemNm         :{ type:"string", editable:false }
                             , itemDstinCd    :{type :"string"} //품목구분
                             , carlineCd      :{type :"string"} //차종
                             , abcInd         :{type :"string"} //ABC CLASS
                             , lastGrDt       :{ type:"date"  , editable:false }
                             , lastGiDt       :{ type:"date"  , editable:false }
                             , unitCd         :{ type:"string", editable:false }
                             , stockQty       :{ type:"number", editable:false }
                             , stockPrc       :{ type:"number", editable:false }
                             , stockAmt       :{ type:"number", editable:false }
                             , stockLockYn    :{ type:"string", editable:false }
                         }
                     }
                 }
             }
             , height:355
             , selectable :"multiple"
             , scrollable :true
             , sortable   :true
             , autoBind   :false
             , multiSelectWithCheckbox:false
             , editable:false
             , pageable:false
             , columns:[
                   {   //딜러코드
                       title     :"<spring:message code='par.lbl.dlrCd' />"
                      ,field     :"dlrCd"
                      ,width     :80
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
                 , {   //재고통제여부
                       title     :"<spring:message code='par.lbl.stockLockYn' />"
                      ,field     :"stockLockYn"
                      ,width     :90
                      ,hidden     :true
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
                  ,{   //품목구분
                       title     :"<spring:message code='par.lbl.itemDstinCd'  />"
                      ,field     :"itemDstinCd"
                      ,width     :80
                      ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                      ,attributes:{ "style":"text-align:left"}
                   }
                  ,{   //차형
                       title     :"<spring:message code='par.lbl.carLine'  />"
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
                      ,template:'#= changeUnit(unitCd)#'
                      ,hidden     :true
                   }
                 , {   //현재고
                       title:"<spring:message code='par.lbl.currStock' />"
                      ,field:"stockQty"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                   }
                 , {   //단가
                       title:"<spring:message code='par.lbl.prc' />"
                      ,field:"invcPrc"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , {   //금액
                       title:"<spring:message code='par.lbl.amt' />"
                      ,field:"invcAmt"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                   }
                 , { field:"" }
             ]
         });

      // 재고실사조회 그리드
         $("#selectGrid").kendoExtGrid({
               dataSource:[]
             , height:355
             , selectable :"multiple"
             , scrollable :true
             , sortable   :true
             , autoBind   :false
             , multiSelectWithCheckbox:false
             , editable:false
             , pageable:false
             /*
             , change:function(e){
                 var rows = e.sender.select(),
                     selectedItem;

                 rows.each(function(index, row) {
                     selectedItem = e.sender.dataItem(row);
                     if(!dms.string.isEmpty(selectedItem)){
                         if(selectedItem.stockLockYn === 'Y'){
                             $(".grid-checkbox-item[data-uid=" + selectedItem.uid + "]").prop("checked", false);
                         }else{
                             if($(".grid-checkbox-item[data-uid=" + selectedItem.uid + "]").prop("checked")){
                                 $(".grid-checkbox-item[data-uid=" + selectedItem.uid + "]").prop("checked", false);
                             }else{
                                 $(".grid-checkbox-item[data-uid=" + selectedItem.uid + "]").prop("checked", true);
                             }

                         }
                     }
                 });

              }
              */
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
                       title     :"<spring:message code='par.lbl.dlrCd' />"
                      ,field     :"dlrCd"
                      ,width     :80
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
                 , {   //재고통제여부
                       title     :"<spring:message code='par.lbl.stockLockYn' />"
                      ,field     :"stockLockYn"
                      ,width     :90
                      ,hidden     :true
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
                      ,hidden     :true
                   }
                  ,{   //품목구분
                       title     :"<spring:message code='par.lbl.itemDstinCd'  />"
                      ,field     :"itemDstinCd"
                      ,width     :80
                      ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                      ,attributes:{ "style":"text-align:left"}
                      ,hidden     :true
                   }
                  ,{   //차형
                       title     :"<spring:message code='par.lbl.carLine'  />"
                      ,field     :"carlineCd"
                      ,width     :120
                      ,template  :'#= changeCarlineCd(carlineCd)#'
                      ,attributes:{ "style":"text-align:left"}
                      ,hidden     :true
                   }
                  ,{   //ABC Class
                       title     :"<spring:message code='par.lbl.abcInd'  />"
                      ,field     :"abcInd"
                      ,width     :90
                      ,template  :'#= changeAbcInd(abcInd)#'
                      ,attributes:{ "style":"text-align:left"}
                      ,hidden     :true
                   }
                 , {   //최종입고일
                       title:"<spring:message code='par.lbl.lastGrDt' />"
                      ,field:"lastGrDt"
                      ,width:90
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,hidden     :true
                   }
                 , {   //최종출고일
                       title:"<spring:message code='par.lbl.lastGiDt' />"
                      ,field:"lastGiDt"
                      ,width:90
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,hidden     :true
                   }
                 , {   //단위
                       title:"<spring:message code='par.lbl.unitNm' />"
                      ,field:"unitCd"
                      ,width:80
                      ,attributes:{ "style":"text-align:center"}
                      ,template:'#= changeUnit(unitCd)#'
                      ,hidden     :true
                   }
                 , {   //현재고
                       title:"<spring:message code='par.lbl.currStock' />"
                      ,field:"stockQty"
                      ,width:60
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n0}"
                      ,decimal:0
                      ,hidden     :true
                   }
                 , {   //단가
                       title:"<spring:message code='par.lbl.prc' />"
                      ,field:"invcPrc"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                      ,hidden     :true
                   }
                 , {   //금액
                       title:"<spring:message code='par.lbl.amt' />"
                      ,field:"invcAmt"
                      ,width:100
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:n2}"
                      ,decimals:2
                      ,hidden     :true
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

         //재고상태
         /*changeStockStat = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = stockStatObj[val];
             }
             return returnVal;
         };*/

         //품목구분
         changeItemDstinCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = itemDstinCdObj[val];
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


        // 부품 팝업 열기 함수.
        /*
        function selectPartsMasterPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"partsMasterPopup"
                ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
                ,content:{
                    url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"itemCd":$("#sItemCd").val()
                        ,"callbackFunc":function(data){
                            if(data.length > 0)
                            {
                                $("#sItemCd").val(data[0].itemCd);

                            }
                            searchItemPopupWindow.close();
                        }
                    }
                }
            });
        }
        */

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

          //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#investigationSettForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            $("#selectGrid").data("kendoExtGrid").dataSource.data([]);
            $("#searchGrid").data("kendoExtGrid").dataSource.data([]);

            popItemObj = {};

            $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
            $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅

            $("#sLocLvl2").data("kendoExtDropDownList").wrapper.hide();
            $("#sLocLvl3").data("kendoExtDropDownList").wrapper.hide();
            $("#sLocLvl4").data("kendoExtDropDownList").wrapper.hide();
            $("#sLocLvl5").data("kendoExtDropDownList").wrapper.hide();

            $("#stockLockYn").data("kendoExtDropDownList").value('N');

            $("#sStockStatCd").data("kendoExtDropDownList").value('01');
            $("#sStockStatCd").data("kendoExtDropDownList").enable(false);

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

           console.log("val:" + this.value());
           console.log('id:',id);
           if(this.value() == null){
               if(id === 'sInvcDtFr'){
                   var minDate = new Date(sevenDtBf);
                       frYY = minDate.getFullYear();
                       frMM = minDate.getMonth();
                       frDD = minDate.getDate();
                       $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                       $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sInvcDtTo'){
                   var maxDate = new Date(toDt);
                       toYY = maxDate.getFullYear();
                       toMM = maxDate.getMonth();
                       toDD = maxDate.getDate();

                       $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                       $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }else if(id === 'sConfirmDtFr'){
                   var minDate = new Date(sevenDtBf);
                       frYY = minDate.getFullYear();
                       frMM = minDate.getMonth();
                       frDD = minDate.getDate();
                       $("#sConfirmDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                       $("#sConfirmDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sConfirmDtTo'){
                   var maxDate = new Date(toDt);
                       toYY = maxDate.getFullYear();
                       toMM = maxDate.getMonth();
                       toDD = maxDate.getDate();

                       $("#sConfirmDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                       $("#sConfirmDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }else{
               if(id === 'sInvcDtFr'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sInvcDtTo'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = this.value().getDate();
                   $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }else if(id === 'sConfirmDtFr'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sConfirmDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sConfirmDtTo'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = this.value().getDate();
                   $("#sConfirmDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }

        }

        initPage();
    });


    $(document).on("click", ".grid-checkAll", function(e){
        console.log('chkAll!');
        var grid = $("#selectGrid").data("kendoExtGrid"),
            checked = $(this).is(":checked"),
            rows = grid.tbody.find("tr");

        if(checked){
            rows.each(function(index, row) {
                console.log('$(this):',$(this));
                console.log('row1:',row);
                console.log('rowItem:',grid.dataItem(row));
                if(grid.dataItem(row).stockLockYn !== 'Y'){
                    $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                }
            });



        }else{
            grid.clearSelection();

            rows.each(function(index, row) {
                console.log('row2:',row);
                $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
            });
        }
    });

    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderMasterPopup"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
            ,deactivate :false
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":true
                    ,"bpTp":'04'
                    ,"callbackFunc":function(data){
                        var grid     = $("#grid").data("kendoExtGrid"),
                            //rowIndex = grid.items().index(grid.select()),
                            tr       = grid.select().closest("tr"),
                            dataItem = grid.dataItem(tr);
                        //$("#sBpCd").val(data[0].bpCd);
                        //$("#sBpNm").val(data[0].bpNm);
                        dataItem.set("dlBpCd", data[0].bpCd);
                        dataItem.set("dlBpNm", data[0].bpNm);
                      //  dataItem.dlBpCd = data[0].bpCd;
                      //  dataItem.dlBpNm = data[0].bpNm;
                    }
                }
            }
        });
    }

    function userSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#piMngUsrId").val(data[0].usrId);
                            $("#piMngUsrNm").val(data[0].usrNm);

                        }
                       // userSearchPopupWin.close();
                    }
                }
            }

        });
    }
</script>
<!-- //script -->

