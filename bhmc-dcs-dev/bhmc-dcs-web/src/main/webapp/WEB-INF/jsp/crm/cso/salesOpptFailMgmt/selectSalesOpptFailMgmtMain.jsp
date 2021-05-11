<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 판매기회 실패관리 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='global.title.saleOpptFailMgmt' /><!-- 판매기회 실패관리 --></h1>
                    <div class="btn_right">
                        <button id="btnReOpen" class="btn_m "><spring:message code='crm.btn.reOpen' /><!-- 재오픈 --></button>
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
                                            <input id="sEndRegDt" name="sEndRegDt" class="form_datepicker" />
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
                    <div id="salesOpptFailGrid"></div>
                </div>

                <!-- <input type="hidden" name="saleOpptNo" id="saleOpptNo" /> -->

            </section>

            <!-- 판매기회 상세 정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.salesOpptDetlInfo' /><!-- 판매기회 상세정보 --></h2>
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
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.saleRemark' /><!-- 판매기회 개술 --></span></th>
                                <td colspan="5" class="required_area">
                                    <input type="text" id="remark" name="remark" class="form_input form_readonly" data-json-obj="true" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></span></th>
                                <td class="required_area" id="custSearch" >
                                    <input type="hidden" id="saleOpptNo" name="saleOpptNo" data-json-obj="true" />
                                    <input type="hidden" id="custNo" name="custNo" data-json-obj="true" />
                                <div class="form_search" >
                                    <input id="custNm" name="custNm" readonly class="form_input form_readonly" />
                                    <a href="javascript:;"><spring:message code="global.lbl.custSearch" /><!-- 고객조회 --></a>
                                </div>
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.hpNo' /><!-- 휴대전화 --></span></th>
                                <td class="required_area">
                                    <input id="hpNo" name="hpNo" class="form_input numberic" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.scId' /><!-- 담당 SC --></th>
                                <td>
                                    <input type="text" id="scId" name="scId" class="form_input form_readonly" data-json-obj="true" readonly />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.saleOpptStepCd' /><!-- 판매기회단계 --></span></th>
                                <td class="required_area">
                                    <input id="saleOpptStepCd" name="saleOpptStepCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.expcSaleDt' /><!-- 예상판매일자 --></span></th>
                                <td class="required_area">
                                    <input id="expcSaleDt" name="expcSaleDt" class="form_datepicker" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.succPrbCd' /><!-- 성공확률 --></span></th>
                                <td class="required_area">
                                    <input id="succPrbCd" name="succPrbCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.saleOpptSrcCd' /><!-- 판매기회출처 --></span></th>
                                <td class="required_area">
                                    <input id="saleOpptSrcCd" name="saleOpptSrcCd" class="form_comboBox" data-json-obj="true" />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.trsfStatCd' /><!-- 전출상태 --></span></th>
                                <td class="required_area">
                                    <input id="trsfStatCd" name="trsfStatCd" class="form_comboBox" data-json-obj="true" />
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
                                <th scope="row"><span class="bu_required"><spring:message code='global.lbl.intrCar' /><!-- 관심차 --></span></th>
                                <td colspan="5" class="required_area">
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

            <!-- 실패 상세정보 -->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.saleOpptFailDetl' /><!-- 판매기회 실패 상세정보 --></h2>
                </div>
                <div class="table_grid">
                    <div id="salesOpptFailDetlGrid"></div>
                </div>
            </section>
            <!-- //실패 상세정보-->


            <script type="text/javascript">

                function initForm(){

                    $("#saleOpptNo").val("");
                    $("#custNo").val("");
                    $("#custNm").val("");
                    $("#hpNo").data("kendoMaskedTextBox").value("");
                    $("#remark").val("");
                    $("#saleOpptStepCd").data("kendoExtDropDownList").value("");
                    $("#trsfStatCd").data("kendoExtDropDownList").value("");
                    $("#expcSaleDt").data("kendoExtMaskedDatePicker").value("");
                    $("#succPrbCd").data("kendoExtDropDownList").value("");
                    $("#scId").val("");
                    $("#saleOpptSrcCd").data("kendoExtDropDownList").value("");
                    $("#regUsrId").val("");
                    $("#regDt").val("");

                    //$("#btnActive").data("kendoButton").enable(false);
                    $("#carGrid").data("kendoExtGrid").dataSource.data([]);
                    $("#salesOpptFailDetlGrid").data("kendoExtGrid").dataSource.data([]);

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


                    // s관심차종
                    $("#sIntrCarLine").kendoExtDropDownList({
                        dataSource:carLineCdDSList
                        , dataTextField:"carlineNm"
                        , dataValueField:"carlineCd"
                        , optionLabel:"<spring:message code='global.lbl.all' />"   // 전체
                        , index:0
                        , select:selectGridCarlineCd
                    });

                    // s관심모델
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

                    // s담당SC
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
                            , enable:false
                    });
                    var hpNo = $("#hpNo").data("kendoMaskedTextBox");
                    hpNo.enable(false);

                    // 조회 버튼
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#salesOpptFailGrid").data("kendoExtGrid").dataSource.read();
                        }
                    });

                    // 재오픈 ( 판매기회 실패 재오픈 )
                    $("#btnReOpen").kendoButton({
                        click:function(e){

                            var saveList      = [],
                                grid          = $("#salesOpptFailGrid").data("kendoExtGrid"),
                                rows          = grid.tbody.find("tr"),
                                chkRow;

                            console.log(rows)
                            console.log(rows.length);

                            if(rows.length  == 0 ){
                                // 선택값이 없습니다.
                                dms.notification.warning("<spring:message code='global.info.unselected' />");
                                return false;
                            }

                            rows.each(function(index, row) {
                                var gridData = grid.dataSource.at(index);
                                chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                                if(chkRow === true){
                                    saveList.push(gridData.saleOpptNo);

                                }

                            });

                            console.log("salesOpptFailGrid:" + JSON.stringify(saveList));
                            console.log("aaa:"+saveList.length);

                            if(saveList.length == 0 ){
                                // 판매기회 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                                return false;
                            }

                            $.ajax({
                                url:"<c:url value='/crm/cso/salesOpptMgmt/updateSalesOpptFail.do' />"
                                ,data:JSON.stringify(saveList)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR, status, error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                }
                                ,success:function(jqXHR, textStatus) {

                                    grid.dataSource._destroyed = [];
                                    grid.dataSource.page(1);

                                    //정상적으로 반영 되었습니다.
                                    dms.notification.success("<spring:message code='global.info.success'/>");

                                    initForm();


                                }
                            });

                        }
                    });

                    // 판매기회 실패 마스터 그리드 시작 //
                    $("#salesOpptFailGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesOpptFailMgmt/selectSalesOpptFailMgmts.do' />"
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
                                        params["sIntrCarLine"]          = $("#sIntrCarLine").data("kendoExtDropDownList").value();
                                        params["sIntrModel"]            = $("#sIntrModel").data("kendoExtDropDownList").value();
                                        params["sTrsfStatCd"]           = $("#sTrsfStatCd").data("kendoExtDropDownList").value();

                                        params["sScId"]                 = $("#sScId").data("kendoExtDropDownList").value();
                                        //params["sSaleOpptStepCd"]       = $("#sSaleOpptStepCd").data("kendoExtDropDownList").value();
                                        params["sStartRegDt"]           = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndRegDt"]             = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();

                                        console.log("salesOpptFailGrid:" + params);
                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                     id:"saleOpptNo"
                                    ,fields:{
                                         rnum:{type:"number"}
                                        ,saleOpptNo:{type:"string"}
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
                            var saleOpptNo = selectedVal.saleOpptNo;

                            if(saleOpptNo != null && saleOpptNo != "undefined" ){

                                var param = {
                                        "sSaleOpptNo":saleOpptNo
                                        };

                                console.log(JSON.stringify(param));
                                //return;

                                $.ajax({
                                        url:"<c:url value='/crm/cso/salesOpptFailMgmt/selectSalesOpptFailMgmtByKey.do' />"
                                        ,data:JSON.stringify(param)      //파라미터
                                        ,type:'POST'                        //조회요청
                                        ,dataType:'json'                  //json 응답
                                        ,contentType:'application/json'   //문자열 파라미터
                                        ,error:function(jqXHR,status,error){
                                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                        }
                                }).done(function(body) {

                                    console.log("selectSalesOpptMgmtByKey:",body);

                                    //initForm();

                                    $("#saleOpptNo").val(body.saleOpptNo);
                                    $("#custNo").val(body.custNo);
                                    $("#custNm").val(body.custNm);
                                    $("#hpNo").data("kendoMaskedTextBox").value(body.hpNo);
                                    $("#remark").val(body.remark);
                                    $("#saleOpptStepCd").data("kendoExtDropDownList").value(body.saleOpptStepCd);
                                    $("#trsfStatCd").data("kendoExtDropDownList").value(body.trsfStatCd);
                                    $("#expcSaleDt").data("kendoExtMaskedDatePicker").value(body.expcSaleDt);
                                    $("#succPrbCd").data("kendoExtDropDownList").value(body.succPrbCd);
                                    $("#scId").val(body.scId);
                                    $("#saleOpptSrcCd").data("kendoExtDropDownList").value(body.saleOpptSrcCd);
                                    $("#regUsrId").val(body.regUsrId);
                                    $("#regDt").val(body.regDt);

                                    //$("#btnActive").data("kendoButton").enable(true);

                                    //$("#saleOpptNo").val(saleOpptNo);
                                    $("#carGrid").data("kendoExtGrid").dataSource.read();
                                    $("#salesOpptFailDetlGrid").data("kendoExtGrid").dataSource.read();

                                });

                            }

                        }
                        ,columns:[
                                    //{field:"saleOpptNo", title:"SEQ", width:30}
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
                                    ,{field:"trsfStatCd", title:"<spring:message code='global.lbl.trsfStatCd' />", width:90/* 전출상태 */
                                        ,attributes:{"class":"ac"}
                                        ,template:'#= trsfStatCdArrVal(trsfStatCd)#'
                                    }
                                    ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:90, attributes:{"class":"ac"}/* 등록일 */
                                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                                    ,{title:""}
                        ]
                        ,editable:false
                        ,multiSelectWithCheckbox:true
                        //,height:120
                        ,navigatable:true
                    });
                    // 판매기회 실패 마스터 그리드 종료 //

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

                                        params["sSaleOpptNo"]          = $("#saleOpptNo").val();

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
                                        ,saleOpptNo:{type:"number"}
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
                                        params["sRefKeyNm"]             = $("#saleOpptNo").val();

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
                                        ,rnum  :{type:"number" }           //
                                        ,carlineCd  :{type:"string"}           //
                                        ,carlineNm  :{type:"string"}           //
                                        ,modelCd    :{type:"string"}           //
                                        ,modelNm    :{type:"string"}           //
                                        ,flagYn     :{type:"string"}
                                        ,regDt      :{type:"date"}           //
                                        ,updtDt     :{type:"date"}           //
                                    }
                                }
                            }
                        }
                       ,height:200
                       ,navigatable:true
                       ,sortable:false
                       ,pageable:false
                       ,autoBind:false
                       ,editable:false
                       ,selectable:false
                       ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
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

                          ,{field:"flagYn", title:"<spring:message code='global.lbl.typicalCar' />", width:100     // 관심
                              ,attributes:{"class":"ac"}
                          }
                          ,{title:""}
                       ]
                   });
                 // 관심차종 그리드 종료 //


                });


            </script>