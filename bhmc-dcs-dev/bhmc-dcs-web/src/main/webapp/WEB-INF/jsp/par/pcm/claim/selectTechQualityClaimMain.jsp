<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 装车前索赔管理 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.menu.partSkillClaimMgr" /> --%></h1>
            <div class="btn_right">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                        <th scope="row"><spring:message code="par.lbl.claimDocNo" /><!-- 클레임번호 --></th>
                        <td>
                            <input id="sClaimCode" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sOrderNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <input type="text" id="sItemCd" class="form_input" value="${itemCd}">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.compensationWay" /><!-- 배상방식 --></th>
                        <td>
                            <input id="sCompensationWay" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.procStatus" /><!-- 처리상태 --></th>
                        <td>
                            <input id="sStatus" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dealMark" /><!-- 배상표기 --></th>
                        <td>
                            <input id="sDealMark" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.requestDt" /><!-- 신청일자 --></th>
                        <td colspan="3">
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sCreateTimeFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sCreateTimeTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.claimStatus" /><!-- 클레임상태 --></th>
                        <td>
                            <input id="sWornStatus" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.hasSubmit" /><!-- 변상수령증 --></th>
                        <td>
                            <input id="sHasSubmit" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dealYm" /><!-- 배상년월 --></th>
                        <td colspan="3">
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sDealDateFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sDealDateTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="header_area">
            <div class="btn_right">
                <button class="btn_s"  id="btnRequestClaim"><spring:message  code="par.btn.requestClaim" /></button>
                <button class="btn_s"  id="btnDownloadClaim"><spring:message  code="par.btn.downloadClaim" /></button>
                <button class="btn_s"  id="btnDownloadClaimList"><spring:message  code="par.btn.downloadClaimList" /></button>
            </div>
        </div>

        <div class="table_grid">
            <!-- 품질클레임 그리드 -->
            <div id="grid" class="grid"></div>
        </div>

    </section>
    <!-- // 其他出库信息 -->

<!-- script -->
<script>
    var ynObj                 = {},
        clWayObj              = {},
        clStatusList          = [],
        clStatusObj           = {},
        isCheckObj            = {},
        statusList            = [],
        statusObj             = {},
        compensationWayList   = [],
        dealMarkList          = [],
        dealMarkObj           = {},
        hasSubmitList         = [],
        hasSubmitObj          = {},
        hasArrivedObj         = {},
        toDt                  = "${toDt}",
        sevenDtBf             = "${sevenDtBf}",
        qualityClaimPopupWindow;
    
        ynObj["1"] = "Yes";
        ynObj["0"] = "No";
        
        clStatusList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${clStatusList}" varStatus="status">
            clStatusList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            clStatusObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        
        statusList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${statusList}" varStatus="status">
            statusList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            statusObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        
        dealMarkList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${dealMarkList}" varStatus="status">
            dealMarkList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            dealMarkObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        
        hasSubmitList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${hasSubmitList}" varStatus="status">
            hasSubmitList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            hasSubmitObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        
        compensationWayList.push({cmmCd:" ", cmmCdNm:" "});
        <c:forEach var="obj" items="${compensationWayList}" varStatus="status">
            compensationWayList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
        </c:forEach>
        
        <c:forEach var="obj" items="${clWayList}" varStatus="status">
            clWayObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        
        <c:forEach var="obj" items="${isCheckList}" varStatus="status">
            isCheckObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        
        <c:forEach var="obj" items="${hasArrivedList}" varStatus="status">
            hasArrivedObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>



        $(document).ready(function() {

            //배상방식선택
            $("#sCompensationWay").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:compensationWayList
                ,index:0
            });
                
            //처리상태선택
            $("#sStatus").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:statusList
                ,index:0
            });
                
            //배상표기선택
            $("#sDealMark").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:dealMarkList
                ,index:0
            });
                
            //클레임건상태선택
            $("#sWornStatus").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:clStatusList
                ,index:0
            });
                
            //변상수령증선택
            $("#sHasSubmit").kendoExtDropDownList({
                 dataTextField:"cmmCdNm"
                ,dataValueField:"cmmCd"
                ,dataSource:hasSubmitList
                ,index:0
            });
            
            $("#sCreateTimeFr").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
            });

            $("#sCreateTimeTo").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
            });
            
            $("#sDealDateFr").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
            });

            $("#sDealDateTo").kendoExtMaskedDatePicker({
                format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
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

                    $("#grid").data("kendoExtGrid").dataSource.read();
                }
            });
            
            // 클레임신청 버튼
            $("#btnRequestClaim").kendoButton({
                click:function(e){

                    // ready message
                    selectQualityClaimPopupWindow();

                }
            });
            
            // 클레임다운로드 버튼
            $("#btnDownloadClaim").kendoButton({
                click:function(e){

                    // ready message
                    dms.notification.success("<spring:message code='global.info.ready'/>");

                }
            });
            
            // 클레임리스트 다운로드 버튼
            $("#btnDownloadClaimList").kendoButton({
                click:function(e){

                    // ready message
                    dms.notification.success("<spring:message code='global.info.ready'/>");

                }
            });
            
            
            // 품질클레임  그리드
            $("#grid").kendoExtGrid({
                dataSource:{
                    transport:{
                        read:{
                             url:"<c:url value='/par/pcm/claim/selectQualityClaimByCondition.do' />"
                        }
                        , parameterMap:function(options, operation) {
                            if (operation === "read") {

                                var params = {};

                                // 품질클레임 검색조건 코드.
                                params["sClaimCode"]       = $("#sClaimCode").val();
                                params["sOrderNo"]         = $("#sOrderNo").val();
                                params["sPartNo"]          = $("#sItemCd").val();
                                params["sCompensationWay"] = $("#sCompensationWay").data("kendoExtDropDownList").value();
                                params["sStatus"]          = $("#sStatus").data("kendoExtDropDownList").value();
                                params["sDealMark"]        = $("#sDealMark").data("kendoExtDropDownList").value();
                                params["sCreateTimeFr"]    = $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value();
                                params["sCreateTimeTo"]    = $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value();
                                params["sWornStatus"]      = $("#sWornStatus").data("kendoExtDropDownList").value();
                                params["sHasSubmit"]       = $("#sHasSubmit").data("kendoExtDropDownList").value();
                                params["sDealDateFr"]      = $("#sDealDateFr").data("kendoExtMaskedDatePicker").value();
                                params["sDealDateTo"]      = $("#sDealDateTo").data("kendoExtMaskedDatePicker").value();

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
                           id:"claimNo"
                          ,fields:{
                                  dlrCd               :{ type:"string" , validation:{required:true} }
                                , claimNo             :{ type:"string" }
                                , claimCode           :{ type:"string" }
                                , partNo              :{ type:"string"}
                                , partNm              :{ type:"string"}
                                , claimNum            :{ type:"number" }
                                , dealerClaimWay      :{ type:"number" }
                                , totalMoneyTax       :{ type:"number" }
                                , claiCategory        :{ type:"number" }
                                , responsibility      :{ type:"number" }
                                , status              :{ type:"string" }
                                , dealDate            :{ type:"date" }
                                , dealMark            :{ type:"string" }
                                , wornDeal            :{ type:"number" }
                                , wornStatus          :{ type:"string" }
                                , isCheck             :{ type:"string" }
                                , wornArrivalNum      :{ type:"number" }
                                , hasSubmit           :{ type:"string" }
                                , transportNo        :{ type:"string" }
                                , billNo              :{ type:"string" }
                            }
                        }
                    }
                }
                , selectable :"row"
                , scrollable :true
                , sortable   :false
                , autoBind   :false
                , multiSelectWithCheckbox:true
                , pageable:false
                , editable  :false
                , columns:[
                      {   //딜러코드
                          title:"<spring:message code='par.lbl.dlrCd' />"
                         ,field:"dlrCd"
                         ,width:80
                         ,hidden:true
                      }
                    , {   //클레임번호
                          title:"<spring:message code='par.lbl.claimDocNo' />"
                         ,field:"claimNo"
                         ,width:100
                         ,hidden:true
                      }
                    , {   //클레임번호
                          title:"<spring:message code='par.lbl.claimDocNo' />"
                         ,field:"claimCode"
                         ,width:100
                      }
                    , {   //부품번호
                          title:"<spring:message code='par.lbl.itemCd' />"
                         ,field:"partNo"
                         ,width:100
                      }
                    , {   //부품명
                          title:"<spring:message code='par.lbl.itemNm' />"
                         ,field:"partNm"
                         ,width:200
                      }
                    , {   //클레임수량
                          title:"<spring:message code='par.lbl.claimQty' />"
                         ,field:"claimNum"
                         ,width:80
                         ,attributes:{ "style":"text-align:right"}
                         ,format:"{0:n0}"
                         ,decimal:0
                      }
                    , {   //클레임방식
                          title:"<spring:message code='par.lbl.dealerClaimWay' />"
                         ,field:"dealerClaimWay"
                         ,width:80
                         ,attributes:{ "style":"text-align:right"}
                         ,template:'#= changeDealerClaimWay(dealerClaimWay)#'
                      }
                    , {   //배상 총금액(세금포함)
                          title:"<spring:message code='par.lbl.totalMoneyTax' />"
                         ,field:"totalMoneyTax"
                         ,width:120
                         ,attributes:{ "style":"text-align:right"}
                         ,format:"{0:n2}"
                         ,decimals:2
                      }
                    , {   //유형표기
                          title:"<spring:message code='par.lbl.claiCategory' />"
                         ,field:"claiCategory"
                         ,width:80
                         ,attributes:{ "style":"text-align:right"}
                         ,template:'#= changeYesNo(claiCategory)#'
                      }
                    , {   //책임표기
                          title:"<spring:message code='par.lbl.responsibility' />"
                         ,field:"responsibility"
                         ,width:80
                         ,attributes:{ "style":"text-align:right"}
                         ,template:'#= changeYesNo(responsibility)#'
                      }
                    , {   //처리상태
                          title:"<spring:message code='par.lbl.procStatus' />"
                         ,field:"status"
                         ,width:90
                         ,attributes:{ "style":"text-align:right"}
                         ,template:'#= changeStatus(status)#'
                      }
                    , {   //배상년월
                          title:"<spring:message code='par.lbl.dealYm' />"
                         ,field:"dealDate"
                         ,width:100
                         ,format:"{0:<dms:configValue code='dateFormat' />}"
                         ,attributes:{ "style":"text-align:center"}
                         ,hidden:true
                      }
                    , {   //배상표기
                          title:"<spring:message code='par.lbl.dealMark' />"
                         ,field:"dealMark"
                         ,width:80
                         ,attributes:{ "style":"text-align:right"}
                         ,template:'#= changeDealMark(dealMark)#'
                      }
                    , {   //클레임처리
                          title:"<spring:message code='par.lbl.wornDeal' />"
                         ,field:"wornDeal"
                         ,width:80
                         ,attributes:{ "style":"text-align:right"}
                         ,template:'#= changeWornDeal(wornDeal)#'
                      }
                    , {   //클레임상태
                          title:"<spring:message code='par.lbl.claimStatus' />"
                         ,field:"wornStatus"
                         ,width:80
                         ,attributes:{ "style":"text-align:right"}
                         ,template:'#= changeWornStatus(wornStatus)#'
                      }
                    , {   //탁송여부
                          title:"<spring:message code='par.lbl.isCheck' />"
                         ,field:"isCheck"
                         ,width:60
                         ,attributes:{ "style":"text-align:right"}
                         ,template:'#= changeIsCheck(isCheck)#'
                      }
                    , {   //도착수량
                          title:"<spring:message code='par.lbl.arrivedQty' />"
                         ,field:"wornArrivalNum"
                         ,width:80
                         ,attributes:{ "style":"text-align:right"}
                         ,format:"{0:n2}"
                         ,decimals:2
                      }
                    , {   //변상수령증
                          title:"<spring:message code='par.lbl.hasSubmit' />"
                         ,field:"hasSubmit"
                         ,width:80
                         ,attributes:{ "style":"text-align:right"}
                         ,template:'#= changeHasSubmit(hasSubmit)#'
                      }
                    , {   //화물운송장번호
                          title:"<spring:message code='par.lbl.transportNo' />"
                         ,field:"transportNo"
                         ,width:100
                      }
                    , { //영수증번호
                          title:"<spring:message code='par.lbl.billNo' />"
                         ,field:"billNo"
                         ,width:100
                      }
                    , { field:"" }
                ]
            });
            
            // 그리드 더블 클릭 이벤트.
            $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
                selectQualityClaimPopupWindow();
            });
            
            // Yes or No
            changeYesNo = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = ynObj[val];
                }
                return returnVal;
            };
            
            // 클레임방식
            changeDealerClaimWay = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = clWayObj[val];
                }
                return returnVal;
            };
            
            // 처리상태
            changeStatus = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = statusObj[val];
                }
                return returnVal;
            };
            
            // 배상표기
            changeDealMark = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = dealMarkObj[val];
                }
                return returnVal;
            };
            
            // 클레임처리
            changeWornDeal = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = ynObj[val];
                }
                return returnVal;
            };
            
            //클레임상태
            changeWornStatus = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = clStatusObj[val];
                }
                return returnVal;
            };
            
            // 탁송여부
            changeIsCheck = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = isCheckObj[val];
                }
                return returnVal;
            };
            
            // 변상수령증
            changeHasSubmit = function(val){
                var returnVal = "";
                if(val != null && val != ""){
                    returnVal = hasSubmitObj[val];
                }
                return returnVal;
            };
            
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

                $("#grid").data("kendoExtGrid").dataSource.data([]);

                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();

                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();


                console.log('sevenDtBf:',sevenDtBf);
                /*
                $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sDealDateFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sDealDateTo").data("kendoExtMaskedDatePicker").value(toDt);

                $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                $("#sDealDateFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                $("#sDealDateTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                */

            }
                
            //품질클레임 팝업 열기 함수.
            function selectQualityClaimPopupWindow(){
                
                var grid     = $("#grid").data("kendoExtGrid"),
                    rows     = grid.select(),
                    gridData = $("#grid").data("kendoExtGrid").dataItem(rows[0]),
                    claimNo;
                
                console.log(rows);
                if(rows.length === 0 || dms.string.isEmpty(rows)){
                    claimNo = '';
                }else{
                    if(dms.string.isEmpty(gridData.claimNo)){
                        claimNo = '';
                    }else{
                        claimNo = gridData.claimNo;   
                    }
                }

                qualityClaimPopupWindow = dms.window.popup({
                    windowId:"qualityClaimPopup"
                    , title:"<spring:message code='par.title.qualityClaim' />"   // 기술품질클레임
                    , width:860
                    , height:450
                    , content:{
                        url:"<c:url value='/par/cmm/selectQualityClaimPopup.do'/>"
                        , data:{
                            "type":""
                            , "autoBind":false
                            , "claimNo":claimNo
                            , "selectable":"single"
                            , "callbackFunc":function(data){

                                //dms.notification.error("<spring:message code='par.lbl.claim' var='claim' /><spring:message code='global.info.modifySuccessParam' arguments='${claim}'/>");
                                $("#grid").data("kendoExtGrid").dataSource.read();
                                qualityClaimPopupWindow.close();
                            }
                        }
                    }
                });
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
                    if(id === 'sCreateTimeFr'){
                        var minDate = new Date(sevenDtBf);
                        frYY = minDate.getFullYear();
                        frMM = minDate.getMonth();
                        frDD = minDate.getDate();
                        $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                        $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                    }else if(id === 'sCreateTimeTo'){
                        var maxDate = new Date(toDt);
                        toYY = maxDate.getFullYear();
                        toMM = maxDate.getMonth();
                        toDD = maxDate.getDate();

                        $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").value(toDt);
                        $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                    }else if(id === 'sDealDateFr'){
                        var minDate = new Date(sevenDtBf);
                        frYY = minDate.getFullYear();
                        frMM = minDate.getMonth();
                        frDD = minDate.getDate();
                        $("#sDealDateFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                        $("#sDealDateTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                    }else if(id === 'sDealDateTo'){
                        var maxDate = new Date(toDt);
                        toYY = maxDate.getFullYear();
                        toMM = maxDate.getMonth();
                        toDD = maxDate.getDate();

                        $("#sDealDateTo").data("kendoExtMaskedDatePicker").value(toDt);
                        $("#sDealDateFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                    }
                }else{
                    if(id === 'sCreateTimeFr'){
                        frYY = this.value().getFullYear();
                        frMM = this.value().getMonth();
                        frDD = this.value().getDate();
                        $("#sCreateTimeTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                    }else if(id === 'sCreateTimeTo'){
                        toYY = this.value().getFullYear();
                        toMM = this.value().getMonth();
                        toDD = this.value().getDate();
                        $("#sCreateTimeFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                    }else if(id === 'sDealDateFr'){
                        frYY = this.value().getFullYear();
                        frMM = this.value().getMonth();
                        frDD = this.value().getDate();
                        $("#sDealDateTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                    }else if(id === 'sDealDateTo'){
                        toYY = this.value().getFullYear();
                        toMM = this.value().getMonth();
                        toDD = this.value().getDate();
                        $("#sDealDateFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                    }
                }
             }
            initPage();
        });
</script>
<!-- //script -->

