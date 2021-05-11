<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 판매기회관리 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='global.title.salesOpptMgmt' /><!-- 판매기회관리 --></h1>
                    <div class="btn_right">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </div>
                </div>

                <div class="table_form form_width_70per">
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
                                <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.intrCarLine' /><!-- 관심차종--></th>
                                <td>
                                    <input id="sIntrCarLine" name="sIntrCarLine" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.intrModel' /><!-- 관심모델--></th>
                                <td>
                                    <input id="sIntrModel" name="sIntrModel" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.trsfStatCd' /><!-- 전출상태 --></th>
                                <td>
                                    <input id="sTrsfStatCd" name="sTrsfStatCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.saleOpptStepCd' /><!-- 판매기회단계 --></th>
                                <td>
                                    <input id="sSaleOpptStepCd" name="sSaleOpptStepCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.scId' /><!-- 담당 SC --></th>
                                <td>
                                    <input id="sScId" name="sScId" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.regDt' /><!-- 등록일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartRegDt" name="sStartRegDt" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndRegDt" name="sEndRegDt" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"></th>
                                <td></td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="salesOpptGrid"></div>
                </div>

            </section>

            <!-- 판매기회 상세 정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.salesOpptDetlInfo' /><!-- 판매기회 상세정보 --></h2>
                    <div class="btn_right">
                        <button id="btnSomSave" class="btn_s"><spring:message code='global.btn.scIdAssign' /><!-- 담당자 재배정 --></button>
                    </div>
                </div>
                <div class="table_form form_width_70per">
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
                        <tbody id="salesOpptMgmtInputForm" >
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.saleRemark' /><!-- 판매기회 개술 --></th>
                                <td colspan="5">
                                    <input type="text" id="remark" name="remark" class="form_input form_readonly" readonly data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                <td>
                                    <input type="hidden" id="saleOpptSeq" name="saleOpptSeq" data-json-obj="true" />
                                    <input type="hidden" id="custNo" name="custNo" data-json-obj="true" />
                                    <input id="custNm" name="custNm" readonly class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></th>
                                <td>
                                    <input id="hpNo" name="hpNo" class="form_input form_readonly numberic" readonly data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.scId' /><!-- 담당 SC --></th>
                                <td>
                                    <input type="text" id="scId" name="scId" class="form_input form_readonly" readonly data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.saleOpptStepCd' /><!-- 판매기회단계 --></th>
                                <td>
                                    <input id="saleOpptStepCd" name="saleOpptStepCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.expcSaleDt' /><!-- 예상판매일자 --></th>
                                <td>
                                    <input id="expcSaleDt" name="expcSaleDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.succPrbCd' /><!-- 성공확률 --></th>
                                <td>
                                    <input id="succPrbCd" name="succPrbCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.saleOpptSrcCd' /><!-- 판매기회출처 --></th>
                                <td>
                                    <input id="saleOpptSrcCd" name="saleOpptSrcCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.trsfStatCd' /><!-- 전출상태 --></th>
                                <td>
                                    <input id="trsfStatCd" name="trsfStatCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.saleOpptStatCd' /><!-- 판매기회상태 --></th>
                                <td>
                                    <input id="saleOpptStatCd" name="saleOpptStatCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.regUsrId' /><!-- 등록자 --></th>
                                <td>
                                    <input type="text" id="regUsrId" name="regUsrId" readonly class="form_input form_readonly" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.regDt' /><!-- 등록일 --></th>
                                <td>
                                    <input type="text" id="regDt" name="regDt" readonly class="form_input form_readonly" data-json-obj="true" />
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.intrCar' /><!-- 관심차 --></th>
                                <td colspan="5">
                                    <!-- 관심차 그리드 -->
                                    <div class="table_grid">
                                        <div id="carGrid"></div>
                                    </div>
                                    <!-- //관심차 그리드 -->
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //판매기회 상세 정보 -->

            <!-- 실패 상세 정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.saleOpptFailDetl' /><!-- 판매기회 실패 상세정보 --></h2>
                </div>
                <div class="table_grid">
                    <div id="salesOpptFailDetlGrid"></div>
                </div>
            </section>
            <!--  // 실패 상세 정보-->

            <!-- 탭메뉴 -->
            <div class="tab_area">
                <ul>
                    <li id="activeListTab" class="k-state-active"><spring:message code='global.title.active' /><!-- 활동 --></li>
                    <li id="custInfoTab" ><spring:message code='global.title.custinfo' /><!-- 고객정보 --></li>
                    <li id="callListTab" ><spring:message code='global.title.callList' /><!-- 콜목록 --></li>
                    <li id="salesOpptHistoryTab" ><spring:message code='crm.title.salesOpptHistory' /><!-- HISTORY --></li>
                </ul>
                <div>
                    <div class="table_grid">
                        <div id="activeGrid"></div>
                    </div>
                </div>
                <div>
                    <iframe id="custInfoTabDivIframe" border="0" frameborder="0" width="100%" height="400"></iframe>
                </div>
                <div>
                    <div class="table_grid">
                        <div id="callGrid"></div>
                    </div>
                </div>
                <div>
                    <div class="table_grid">
                        <div id="salesOpptHistorysGrid"></div>
                    </div>
                </div>
            </div>
            <!-- //탭메뉴 -->

            <script type="text/javascript">

                // 초기화
                function initForm(){

                    $("#saleOpptSeq").val("");
                    $("#custNo").val("");
                    $("#custNm").val("");
                    $("#hpNo").data("kendoMaskedTextBox").value("");
                    $("#remark").val("");
                    $("#saleOpptStepCd").data("kendoExtDropDownList").value("");
                    $("#saleOpptStatCd").data("kendoExtDropDownList").value("");
                    $("#trsfStatCd").data("kendoExtDropDownList").value("");
                    $("#expcSaleDt").data("kendoExtMaskedDatePicker").value("");
                    $("#succPrbCd").data("kendoExtDropDownList").value("");
                    $("#scId").val("");
                    $("#saleOpptSrcCd").data("kendoExtDropDownList").value("");
                    $("#regUsrId").val("");
                    $("#regDt").val("");

                    $("#btnSomSave").data("kendoButton").enable(true);

                    $("#carGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#salesOpptFailDetlGrid").data("kendoExtGrid").dataSource.data([]);

                    // 탭 초기화
                    $("#callGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#salesOpptHistorysGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#activeGrid").data("kendoExtGrid").dataSource.data([]);

                    var tabStrip = $(".tab_area").kendoExtTabStrip().data("kendoExtTabStrip");
                    tabStrip.select("li:first");

                }

                // 차종 ( 관심차종 )
                var carLineCdDSList = [];
                var carLineCdObj = {};

                <c:forEach var="obj" items="${carLineCdInfo}">
                    carLineCdDSList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
                    carLineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
                </c:forEach>

                // 모델 ( 관심 모델 )
                var modelCdDSList = [];
                var modelCdObj = {};

                //1 Grid- 차종의 template 정의
                function bf_selectCarLine(carlineCd) {
                    if(carlineCd == ""){
                        return "";
                    }else{
                        return carLineCdObj[carlineCd];
                    }
                }

                //2 Grid- 모델의 template 정의
                function bf_selectModel(modelCd, modelNm){
                    if(modelNm != ""){
                        return modelNm;
                    }
                    if(modelCd == ""){
                        return "";
                    }
                    return modelCdObj[modelCd];
                }

                $(document).ready(function() {

                    /**
                     * 차종에 따른 모델 조회
                     */
                    function selectGridCarlineCd(e) {
                        var dataItem = this.dataItem(e.item);
                        var responseJson = dms.ajax.getJson({
                            url:_contextPath + "/sal/svo/askHelpCar/selectModel.do"
                            ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
                            ,async:false
                        });

                        //console.log("selectGridCarlineCd", responseJson.data);
                        modelCdDSList = responseJson.data;
                        $("#sIntrModel").data("kendoExtDropDownList").setDataSource(responseJson.data);

                        modelCdObj = [];
                        $.each(modelCdDSList, function(idx, obj){
                            modelCdObj[obj.modelCd] = obj.modelNm;
                        });
                    };

                    // SC 목록
                    var usersDS = [];
                    var usersArr = [];
                    <c:forEach var="obj" items="${users}">
                        usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                        usersArr["${obj.usrId}"] = "${obj.usrNm}";
                    </c:forEach>
                    usersArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = usersArr[val];
                        }
                        return returnVal;
                    };


                    // 전출상태 DS
                    var trsfStatCdDs = [];
                    var trsfStatCdArr = [];
                    <c:forEach var="obj" items="${trsfStatCdList}">
                        trsfStatCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        trsfStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    trsfStatCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = trsfStatCdArr[val];
                        }
                        return returnVal;
                    };

                    // 판매기회단계 DS
                    var saleOpptStepCdDs = [];
                    var saleOpptStepCdArr = [];
                    <c:forEach var="obj" items="${saleOpptStepCdList}">
                        saleOpptStepCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        saleOpptStepCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    saleOpptStepCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = saleOpptStepCdArr[val];
                        }
                        return returnVal;
                    };

                    // 성공확률 DS
                    var succPrbCdDs = [];
                    var succPrbCdArr = [];
                    <c:forEach var="obj" items="${succPrbCdList}">
                        succPrbCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        succPrbCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>

                    succPrbCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = succPrbCdArr[val];
                        }
                        return returnVal;
                    };

                    // 판매기회 출처 DS
                    var saleOpptSrcCdDs = [];
                    var saleOpptSrcCdArr = [];
                    <c:forEach var="obj" items="${saleOpptSrcCdList}">
                        saleOpptSrcCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        saleOpptSrcCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    saleOpptSrcCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = saleOpptSrcCdArr[val];
                        }
                        return returnVal;
                    };

                    // 판매기회 상태 ds
                    var saleOpptStatCdDs = [];
                    var saleOpptStatCdArr = [];
                    <c:forEach var="obj" items="${saleOpptStatCdList}">
                        saleOpptStatCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        saleOpptStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    saleOpptStatCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = saleOpptStatCdArr[val];
                        }
                        return returnVal;
                    };

                    // 실패유형 DS
                    //var failTpCdDs = [];
                    var failTpCdArr = [];
                    <c:forEach var="obj" items="${failTpCdList}">
                        //failTpCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        failTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    failTpCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = failTpCdArr[val];
                        }
                        return returnVal;
                    };

                    // 실패1급원인 DS
                    //var failCau1CdDs = [];
                    var failCau1CdArr = [];
                    <c:forEach var="obj" items="${failCau1CdList}">
                        //failCau1CdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        failCau1CdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    failCau1CdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = failCau1CdArr[val];
                        }
                        return returnVal;
                    };

                    // 실패2급원인 DS
                    //var failCau2CdDs = [];
                    var failCau2CdArr = [];
                    <c:forEach var="obj" items="${failCau2CdList}">
                        //failCau2CdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        failCau2CdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    failCau2CdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = failCau2CdArr[val];
                        }
                        return returnVal;
                    };

                    // 등록차량 브랜드 DS
                    //var brandCdDs = [];
                    var brandCdArr = [];
                    <c:forEach var="obj" items="${brandCdList}">
                        //brandCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        brandCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    brandCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = brandCdArr[val];
                        }
                        return returnVal;
                    };

                    // 활동형태 DS
                    var activeCdDs = [];
                    var activeCdArr = [];
                    <c:forEach var="obj" items="${activeCdList}">
                        activeCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        activeCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    activeCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = activeCdArr[val];
                        }
                        return returnVal;
                    };

                    // 활동내용 DS
                    var activeContCdDs = [];
                    var activeContCdArr = [];
                    <c:forEach var="obj" items="${activeContCdList}">
                        activeContCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                        activeContCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                    </c:forEach>
                    activeContCdArrVal = function(val){
                        var returnVal = "";
                        if(val != null && val != ""){
                            returnVal = activeContCdArr[val];
                        }
                        return returnVal;
                    };

                    // 관심차종
                    $("#sIntrCarLine").kendoExtDropDownList({
                        dataSource:carLineCdDSList
                        , dataTextField:"carlineNm"
                        , dataValueField:"carlineCd"
                        , optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
                        , index:0
                        , select:selectGridCarlineCd
                    });

                    // 관심모델
                    $("#sIntrModel").kendoExtDropDownList({
                        dataSource:modelCdDSList
                        , autoBind:false
                        , dataTextField:"modelNm"
                        , dataValueField:"modelCd"
                        //, optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
                        //, index:0
                    });

                    // s전출상태
                    $("#sTrsfStatCd").kendoExtDropDownList({
                        dataSource:trsfStatCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
                        , index:0
                    });

                    // S판매기회단계
                    $("#sSaleOpptStepCd").kendoExtDropDownList({
                        dataSource:saleOpptStepCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
                        , index:0
                    });

                    // s담당 SC
                    $("#sScId").kendoExtDropDownList({
                        dataSource:usersDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
                        , index:0
                    });

                    // 판매기회단계
                    $("#saleOpptStepCd").kendoExtDropDownList({
                        dataSource:saleOpptStepCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "   // 선택
                        , index:0
                        , enable:false
                    });

                    // 성공확률
                    $("#succPrbCd").kendoExtDropDownList({
                        dataSource:succPrbCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "   // 선택
                        , index:0
                        , enable:false
                    });

                    // 판매기회출처
                    $("#saleOpptSrcCd").kendoExtDropDownList({
                        dataSource:saleOpptSrcCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "   // 선택
                        , index:0
                        , enable:false
                    });

                    // 전출상태
                    $("#trsfStatCd").kendoExtDropDownList({
                        dataSource:trsfStatCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "   // 선택
                        , index:0
                        , enable:false
                    });

                    // 판매기회상태
                    $("#saleOpptStatCd").kendoExtDropDownList({
                        dataSource:saleOpptStatCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "   // 선택
                        , index:0
                        , enable:false
                    });

                    // 등록 시작일
                    $("#sStartRegDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 등록 종료일
                    $("#sEndRegDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 예상판매일
                    $("#expcSaleDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    var expcSaleDt = $("#expcSaleDt").data("kendoExtMaskedDatePicker");
                    expcSaleDt.enable(false);

                    // 휴대전화
                    $("#hpNo").kendoMaskedTextBox({
                        mask:"00000000000000"
                        , promptChar:" "
                    });
                    $("#hpNo").focusout(function(){
                        $(this).val($.trim($(this).val()));
                    });

                    // 조회 버튼
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#salesOpptGrid").data("kendoExtGrid").dataSource.read();
                        }
                    });

                    // 담당자 재배정 버튼
                    $("#btnSomSave").kendoButton({
                        click:function(e){

                            // TODO [이인문]  담당자 재배정 이동
                            alert("담당자 재배정 이동")
                        }
                        , enable:false
                    });

                    $(".tab_area").kendoExtTabStrip({
                        animation:false
                        , select:function(e) {

                            var selectTabId = e.item.id;
                            var saleOpptSeq = $("#saleOpptSeq").val();

                            if(saleOpptSeq != ""){

                                if (selectTabId == "custInfoTab") {

                                    var custInfoTabUrl = "<c:url value='/crm/cif/customerInfo/selectCustomerInfoViewMain.do?custNo=' />";
                                    callUrl = custInfoTabUrl + $("#custNo").val();
                                    $("#custInfoTabDivIframe").attr("src",custInfoTabUrl);

                                } else if (selectTabId == "callListTab"){

                                    $("#callGrid").data("kendoExtGrid").dataSource.read();

                                } else if (selectTabId == "salesOpptHistoryTab") {

                                    $("#salesOpptHistorysGrid").data("kendoExtGrid").dataSource.read();

                                } else {

                                    $("#activeGrid").data("kendoExtGrid").dataSource.read();

                                }

                            }

                        }

                    });

                    // 판매기회 관리 그리드 시작 //
                    $("#salesOpptGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sCustNm"]               = $("#sCustNm").val();
                                        params["sIntrCarLine"]          = $("#sIntrCarLine").val();
                                        params["sIntrModel"]            = $("#sIntrModel").val();

                                        console.log("sIntrCarLine:"+$("#sIntrCarLine").data("kendoExtDropDownList").value());
                                        console.log("sIntrModel:"+$("#sIntrModel").data("kendoExtDropDownList").value());

                                        params["sSaleOpptStepCd"]       = $("#sSaleOpptStepCd").data("kendoExtDropDownList").value();
                                        params["sScId"]                 = $("#sScId").data("kendoExtDropDownList").value();
                                        params["sStartRegDt"]           = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndRegDt"]             = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();

                                        console.log(params);
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                errors:"error"
                                    ,data:"data"
                                    ,total:"total"
                                    ,model:{
                                        id:"saleOpptSeq"
                                        ,fields:{
                                            rnum:{type:"number"}
                                            ,saleOpptSeq:{type:"number"}
                                            ,custNm:{type:"string"}
                                            ,carlineNm:{type:"string"}
                                            ,modelNm:{type:"string"}
                                            ,expcSaleDt:{type:"date"}
                                            ,succPrbCd:{type:"string"}
                                            ,saleOpptSrcCd:{type:"string"}
                                            ,saleOpptStepCd:{type:"string"}
                                            ,scNm:{type:"string"}
                                            ,regDt:{type:"date"}
                                        }
                                    }
                            }
                        }
                        ,change:function(e){

                            var selectedVal = this.dataItem(this.select());
                            var saleOpptSeq = selectedVal.saleOpptSeq;

                            if(saleOpptSeq != null && saleOpptSeq != "undefined" ){

                                var param = {
                                        "sSaleOpptSeq":saleOpptSeq
                                        };

                                console.log(JSON.stringify(param));
                                //return;

                                $.ajax({
                                        url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptMgmtByKey.do' />"
                                        ,data:JSON.stringify(param)      //파라미터
                                        ,type:'POST'                        //조회요청
                                        ,dataType:'json'                  //json 응답
                                        ,contentType:'application/json'   //문자열 파라미터
                                        ,error:function(jqXHR,status,error){
                                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                        }
                                }).done(function(body) {

                                    console.log("selectSalesOpptMgmtByKey:",body);
                                    initForm();

                                    $("#saleOpptSeq").val(body.saleOpptSeq);
                                    $("#custNo").val(body.custNo);
                                    $("#custNm").val(body.custNm);
                                    $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);
                                    $("#remark").val(body.remark);
                                    $("#saleOpptStepCd").data("kendoExtDropDownList").value(body.saleOpptStepCd);
                                    $("#saleOpptStatCd").data("kendoExtDropDownList").value(body.saleOpptStatCd);
                                    $("#trsfStatCd").data("kendoExtDropDownList").value(body.trsfStatCd);
                                    $("#expcSaleDt").data("kendoExtMaskedDatePicker").value(body.expcSaleDt);
                                    $("#succPrbCd").data("kendoExtDropDownList").value(body.succPrbCd);
                                    $("#scId").val(body.scId);
                                    $("#saleOpptSrcCd").data("kendoExtDropDownList").value(body.saleOpptSrcCd);
                                    $("#regUsrId").val(body.regUsrId);
                                    $("#regDt").val(body.regDt);

                                    $("#btnSomSave").data("kendoButton").enable(true);

                                    $("#salesOpptFailDetlGrid").data("kendoExtGrid").dataSource.read();

                                    $("#carGrid").data("kendoExtGrid").dataSource.read();
                                    $("#activeGrid").data("kendoExtGrid").dataSource.read();

                                });

                            }

                        }
                        ,editable:false
                        ,navigatable:false
                        ,resizable:false
                        //,sortable:false
                        ,selectable:"row"
                        ,columns:[
                                    //{field:"saleOpptSeq", title:"SEQ", width:30}
                                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                        ,attributes:{"class":"ac"}
                                    }
                                    ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:90}/* 고객명 */
                                    ,{field:"carlineNm", title:"<spring:message code='global.lbl.intrCarLine' />", width:90} /* 관심차종 */
                                    ,{field:"modelNm", title:"<spring:message code='global.lbl.intrModel' />", width:230} /* 관심모델 */
                                    ,{field:"expcSaleDt", title:"<spring:message code='global.lbl.expcSaleDt' />", width:90, attributes:{"class":"ac"}/* 예상판매일자 */
                                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                                    ,{field:"succPrbCd", title:"<spring:message code='global.lbl.succPrbCd' />", width:90, attributes:{"class":"ac"}/* 성공확률 */
                                        ,template:'#= succPrbCdArrVal(succPrbCd)#'
                                    }
                                    ,{field:"saleOpptSrcCd", title:"<spring:message code='global.lbl.saleOpptSrcCd' />", width:90/* 판매기회출처 */
                                        ,template:'#= saleOpptSrcCdArrVal(saleOpptSrcCd)#'
                                    }
                                    ,{field:"saleOpptStepCd", title:"<spring:message code='global.lbl.saleOpptStepCd' />", width:90/* 판매기회단계 */
                                        ,template:'#= saleOpptStepCdArrVal(saleOpptStepCd)#'
                                    }
                                    ,{field:"scNm", title:"<spring:message code='crm.lbl.scId' />", width:90, sortable:false}/* 담당SC */
                                    ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:90, attributes:{"class":"ac"}/* 등록일 */
                                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                                    ,{title:""}
                        ]
                    });
                    // 판매기회 관리 그리드 종료 //

                    // 관심차종 그리드 시작 //
                    $("#carGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cmm/carLineInfo/selectCarLineInfo.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sRefTableNm"]           = "CR_0201T";
                                        params["sRefKeyNm"]             = $("#saleOpptSeq").val();

                                        console.log('carGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"seq",
                                    fields:{
                                         seq:{type:"string"}                //
                                        ,rnum  :{type:"number" , editable:false}           //
                                        ,carlineCd  :{type:"string"}           //
                                        ,carlineNm  :{type:"string"}           //
                                        ,modelCd    :{type:"string"}           //
                                        ,modelNm    :{type:"string"}           //
                                        ,flagYn     :{type:"string", editable:true}
                                        ,regDt      :{type:"date"}           //
                                        ,updtDt     :{type:"date"}           //
                                    }
                                }
                            }
                        }
                       ,multiSelectWithCheckbox:false
                       ,editableOnlyNew:true
                       ,editableOnlyNewExcludeColumns:["modelCd"]
                       ,height:120
                       ,navigatable:true
                       ,sortable:false
                       ,pageable:false
                       ,autoBind:false
                       ,selectable:false
                       /* ,dataBound:function(e){
                           // 행추가 후 셀 포커스 처리.
                           var sender = e.sender;
                           var cellToEdit = sender.content.find("td:eq(1)");
                           sender.editCell(cellToEdit);
                       } */
                       ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                          //,{field:"seq", title:"SEQ", width:30, sortable:false }       // 시퀀스
                          //,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", hidden:true}       // 차종명
                          //,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", hidden:true}       // 모델명
                          ,{  // 관심차종
                              field:"carlineCd" , title:"<spring:message code='global.lbl.intrCarLine' />" , width:90
                             , template:"#=bf_selectCarLine(carlineCd)#"
                             , editor:function (container, options){
                                 if( options.model.seq == "" || options.model.carlineCd == ""){
                                     $('<input required name="carlineNm" data-bind="value:' + options.field + '"/>')
                                     .appendTo(container)
                                     .kendoExtDropDownList({
                                         autoBind:false
                                         , dataTextField:"carlineNm"
                                         , dataValueField:"carlineCd"
                                         , dataSource:carLineCdDSList
                                         , select:selectGridCarlineCd
                                     });
                                 }else{
                                     container.context.innerText = carLineCdObj[options.model.carlineCd];
                                 }
                             }
                          }
                          ,{    // 관심모델
                              field:"modelCd" , title:"<spring:message code='global.lbl.intrModel' />" , width:225
                              , template:"#= bf_selectModel(modelCd, modelNm) #"
                              , editor:function (container, options){
                                  if( options.model.carlineCd != "" && (options.model.modelCd == "" || options.model.seq == "") ){
                                      $('<input required name="modelCd" data-bind="value:' + options.field + '"/>')
                                      .appendTo(container)
                                      .kendoExtDropDownList({
                                          autoBind:false
                                          ,dataTextField:"modelNm"
                                          ,dataValueField:"modelCd"
                                          ,dataSource:modelCdDSList
                                      });
                                  }else{
                                      if(options.model.modelNm != ""){
                                          container.context.innerText = options.model.modelNm;
                                      }else{
                                          // 관심차종 / 을(를) 선택해주세요.
                                          container.context.innerText = "<spring:message code='global.lbl.intrCarLine' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />";
                                      }
                                  }
                              }
                          }
                          ,{field:"flagYn", title:"<spring:message code='global.lbl.typicalCar' />", width:100     // 대표차
                              ,attributes:{"class":"ac"}
                          }
                          ,{title:""}
                       ]
                    });
                    // 관심차종 그리드 종료 //

                    // 판매기회 실패 상세 그리드 시작 //
                    $("#salesOpptFailDetlGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptFailMgmt/selectSalesOpptFailDetlMgmts.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sSaleOpptSeq"]          = $("#saleOpptSeq").val();

                                        console.log('salesOpptFailDetlGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"seq",
                                    fields:{
                                        rnum:{type:"number"}
                                        ,seq:{type:"number"}
                                        ,saleOpptSeq:{type:"number"}
                                        ,failTpCd   :{type:"string"}
                                        ,failCau1Cd:{type:"string"}
                                        ,failCau2Cd:{type:"string"}
                                        ,failBrandCd:{type:"string"}
                                        ,failModelCd:{type:"string"}
                                        ,regDt:{type:"date"}
                                    }
                                }
                            }
                        }
                       ,height:200
                       ,autoBind:false
                       ,editable:false
                       //,sortable:false
                       ,selectable:false
                       ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                               ,attributes:{"class":"ac"}
                            }
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:90, attributes:{"class":"ac"}/* 등록일 */
                                ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{field:"failTpCd", title:"<spring:message code='global.lbl.failTpCd' />", width:100
                                , template:"#=failTpCdArrVal(failTpCd)#"
                            }/* 실패유형 */
                            ,{field:"failCau1Cd", title:"<spring:message code='global.lbl.failCau1Cd' />", width:200
                                , template:"#=failCau1CdArrVal(failCau1Cd)#"
                            }/* 실패1급원인 */
                            ,{field:"failCau2Cd", title:"<spring:message code='global.lbl.failCau2Cd' />", width:200
                                , template:"#=failCau2CdArrVal(failCau2Cd)#"
                            }/* 실패2급원인 */
                            ,{field:"failBrandCd", title:"<spring:message code='global.lbl.failBrandCd' />", width:100
                                , template:"#=brandCdArrVal(failBrandCd)#"
                            }/* 실패브랜드 */
                            ,{field:"failModelCd", title:"<spring:message code='global.lbl.failModelCd' />", width:200}/* 실패차형 */
                            ,{title:""}

                        ]
                    });
                    // 판매기회 실패 상세 그리드 시작 //


                    // 활동 그리드 시작 //
                    $("#activeGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesActives.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sSaleOpptSeq"]             = $("#saleOpptSeq").val();

                                        console.log('activeGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"activeSeq",
                                    fields:{
                                         activeSeq:{type:"number"}                //
                                        ,activeTitleNm:{type:"string"}           //
                                        ,startDt      :{type:"date"}           //
                                        ,endDt        :{type:"date"}           //
                                        ,regDt        :{type:"date"}           //
                                    }
                                }
                            }
                        }
                       ,height:200
                       ,autoBind:false
                       ,editable:false
                       ,sortable:false
                       ,selectable:false
                       ,columns:[
                                   {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                      ,attributes:{"class":"ac"}
                                   }
                                 //{field:"activeSeq", hidden:true}       // 시퀀스
                                 ,{field:"activeTitleNm", title:"<spring:message code='global.lbl.title' />"}/* 제목 */
                                 ,{field:"activeCd", title:"<spring:message code='global.lbl.activeCd' />", width:100
                                     ,template:'#= activeCdArrVal(activeCd)#'
                                 }/* 활동형태 */
                                 ,{field:"activeContCd", title:"<spring:message code='global.lbl.activeContCd' />", width:100
                                     ,template:'#= activeContCdArrVal(activeContCd)#'
                                 }/* 활동내용 */
                                 ,{field:"remark", title:"<spring:message code='global.lbl.memo' />", width:100}/* 메모 */
                                 ,{field:"startDt", title:"<spring:message code='global.lbl.startDt' />", width:120
                                     ,attributes:{"class":"ac"}/* 시작일 */
                                     ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                                 }
                                 ,{field:"endDt", title:"<spring:message code='global.lbl.endDt' />", width:120
                                     ,attributes:{"class":"ac"}/* 종료일자 */
                                     ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                                 }
                                 ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100
                                     ,attributes:{"class":"ac"}/* 등록일 */
                                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                                 }
                                 ,{title:""}
                          ]
                   });
                    // 활동 그리드 종료 //

                    // 콜그리드 시작 //
                    $("#callGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesCalls.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sSaleOpptSeq"]             = $("#saleOpptSeq").val();

                                        console.log('callGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"activeSeq",
                                    fields:{
                                         activeSeq:{type:"number"}                //
                                        ,activeTitleNm:{type:"string"}           //
                                        ,regDt        :{type:"date"}           //
                                    }
                                }
                            }
                        }
                       ,height:200
                       ,autoBind:false
                       ,editable:false
                       ,sortable:false
                       ,selectable:false
                       ,columns:[
                           {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                               ,attributes:{"class":"ac"}
                            }
                          ,{field:"activeSeq", hidden:true}       // 시퀀스
                          ,{field:"", title:"통화일", width:100}/* 통화일 */
                          ,{field:"", title:"통화결과", width:100}/* 통화결과 */
                          ,{field:"", title:"예약구분", width:100}/* 예약구분 */
                          ,{field:"", title:"담당자", width:100}/* 담당자 */
                          ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100
                              ,attributes:{"class":"ac"}/* 등록일 */
                              ,format:"{0:<dms:configValue code='dateFormat' />}"
                          }
                          ,{title:""}
                       ]
                   });
                    // 콜 그리드 종료 //

                    // 판매기회 히스토리 그리드 시작 //
                    $("#salesOpptHistorysGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptMgmt/selectSalesOpptHistorys.do' />"
                                },
                                parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sSaleOpptSeq"]             = $("#saleOpptSeq").val();

                                        console.log('salesOpptHistorysGrid params:',kendo.stringify(params) );
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"seq",
                                    fields:{
                                        rnum:{type:"number"}
                                        ,seq:{type:"number"}
                                        ,saleOpptSeq:{type:"number"}
                                        ,expcSaleDt:{type:"date"}
                                        ,succPrbCd:{type:"string"}
                                        ,saleOpptSrcCd:{type:"string"}
                                        ,saleOpptStepCd:{type:"string"}
                                        ,regDt:{type:"date"}
                                    }
                                }
                            }
                        }
                       ,height:200
                       ,autoBind:false
                       ,editable:false
                       ,sortable:false
                       ,selectable:false
                       ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                               ,attributes:{"class":"ac"}
                            }
                            ,{field:"bhmcYn", title:"<spring:message code='global.lbl.bhmcyn' />", width:100, attributes:{"class":"ac"}}/* BHMC여부 */
                            ,{field:"expcSaleDt", title:"<spring:message code='global.lbl.expcSaleDt' />", width:90, attributes:{"class":"ac"}/* 예상판매일자 */
                                ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{field:"succPrbCd", title:"<spring:message code='global.lbl.succPrbCd' />", width:90, attributes:{"class":"ac"}/* 성공확률 */
                                ,template:'#= succPrbCdArrVal(succPrbCd)#'
                            }
                            ,{field:"saleOpptSrcCd", title:"<spring:message code='global.lbl.saleOpptSrcCd' />", width:90/* 판매기회출처 */
                                ,template:'#= saleOpptSrcCdArrVal(saleOpptSrcCd)#'
                            }
                            ,{field:"saleOpptStepCd", title:"<spring:message code='global.lbl.saleOpptStepCd' />", width:90/* 판매기회단계 */
                                ,template:'#= saleOpptStepCdArrVal(saleOpptStepCd)#'
                            }
                            ,{field:"saleOpptStatCd", title:"<spring:message code='global.lbl.saleOpptStatCd' />", width:90/* 판매기회상태 */
                                ,template:'#= saleOpptStatCdArrVal(saleOpptStatCd)#'
                            }
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:90, attributes:{"class":"ac"}/* 등록일 */
                                ,format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{title:""}

                        ]
                    });
                    // 판매기회 히스토리 그리드 종료 //

                });

            </script>