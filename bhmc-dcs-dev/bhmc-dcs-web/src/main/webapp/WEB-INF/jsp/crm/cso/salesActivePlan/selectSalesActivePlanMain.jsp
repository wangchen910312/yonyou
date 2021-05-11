<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 영업활동 시행내역 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.salesActivePlan' /><!-- 영업활동 시행내역 --></h1>
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </div>
                </div>

                <div class="table_form">
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
                                <th scope="row"><spring:message code='sal.lbl.salesAdvisor' /><!-- 판매고문 --></th>
                                <td>
                                    <input id="sScId" name="sScId" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.commMthCd' /><!-- 연락방식 --></th>
                                <td>
                                    <input id="sCommMthCd" name="sCommMthCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.salesActiveTpCd' /><!-- 영업활동유형 --></th>
                                <td>
                                    <input id="sSalesActiveTpCd" name="sSalesActiveTpCd" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.salesActiveStatCd' /><!-- 영업활동상태 --></th>
                                <td>
                                    <input id="sSalesActiveStatCd" name="sSalesActiveStatCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.salesActiveDt' /><!-- 실제진행일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt" name="sStartDt" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt" name="sEndDt" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="grid01"></div>
                </div>

            </section>
            <!-- //영업활동 시행내역 -->

            <script type="text/javascript">

                // 판매고문
                var usersDS = [];
                <c:forEach var="obj" items="${users}">
                    usersDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                </c:forEach>

                // 연락방식 DS
                var commMthCdDs = [];
                var commMthCdArr = [];
                <c:forEach var="obj" items="${commMthCdList}">
                    commMthCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    commMthCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                commMthCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = commMthCdArr[val];
                    }
                    return returnVal;
                };

                // 영업활동유형 DS
                var salesActiveTpCdDs = [];
                var salesActiveTpCdArr = [];
                <c:forEach var="obj" items="${salesActiveTpCdList}">
                    salesActiveTpCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    salesActiveTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                salesActiveTpCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = salesActiveTpCdArr[val];
                    }
                    return returnVal;
                };

                // 영업활동상태 DS
                var salesActiveStatCdDs = [];
                var salesActiveStatCdArr = [];
                <c:forEach var="obj" items="${salesActiveStatCdList}">
                    salesActiveStatCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    salesActiveStatCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                salesActiveStatCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = salesActiveStatCdArr[val];
                    }
                    return returnVal;
                };

                // 잠재,보유고객
                var custCdMap = [];
                <c:forEach var="obj" items="${custCdList}">
                console.log("obj.cmmCdNm:"+"${obj.cmmCdNm}")
                    custCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                custCdVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custCdMap[val];
                    }
                    return returnVal;
                };

                /**
                * hyperlink in grid event of Customer Information
                */
                $(document).on("click", ".linkCust", function(e){

                    var grid = $("#grid01").data("kendoExtGrid"),
                    row = $(e.target).closest("tr");
                    var dataItem = grid.dataItem(row);

                    window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
                });

                $(document).ready(function() {

                    // s판매고문
                    $("#sScId").kendoExtDropDownList({
                        dataSource:usersDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:" "
                        , index:0
                    });

                    // s연락방식
                    $("#sCommMthCd").kendoExtDropDownList({
                        dataSource:commMthCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // s영업활동유형
                    $("#sSalesActiveTpCd").kendoExtDropDownList({
                        dataSource:salesActiveTpCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // s영업활동상태
                    $("#sSalesActiveStatCd").kendoExtDropDownList({
                        dataSource:salesActiveStatCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 계획일자
                    $("#sStartDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    $("#sEndDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){

                            $("#grid01").data("kendoExtGrid").dataSource.page(1);

                        }
                    });

                    // 영업활동 시행내역 그리드 시작
                    $("#grid01").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/cso/salesActivePlan/selectSalesActivePlans.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        params["sScId"] = $("#sScId").data("kendoExtDropDownList").value();
                                        params["sCommMthCd"] = $("#sCommMthCd").data("kendoExtDropDownList").value();
                                        params["sSalesActiveTpCd"] = $("#sSalesActiveTpCd").data("kendoExtDropDownList").value();

                                        params["sSalesActiveStatCd"] = $("#sSalesActiveStatCd").data("kendoExtDropDownList").value();
                                        params["sCustNm"] = $("#sCustNm").val();
                                        params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

                                        console.log("grid01 param:"+kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"salesActiveNo"
                                    ,fields:{
                                        rnum:{type:"number"}
                                        ,salesActiveNo:{type:"string"}
                                        ,scNm:{type:"string"}
                                        ,salesActiveStatCd:{type:"string"}
                                        ,planStartDt:{type:"date"}
                                        ,planEndDt:{type:"date"}
                                        ,activeStartDt:{type:"date"}
                                        ,activeEndDt:{type:"date"}
                                        ,salesActiveTpCd:{type:"string"}
                                        ,activeCont:{type:"string"}
                                        ,activeRsltCont:{type:"string"}
                                        ,saleOpptNo:{type:"string"}
                                        ,custNm:{type:"string"}
                                        ,prefCommNo:{type:"string"}
                                        ,startDt:{type:"date"}
                                        ,endDt:{type:"date"}
                                        ,regDt:{type:"date"}
                                        ,updtDt:{type:"date"}
                                    }
                                }
                            }
                        }
                        ,autoBind:true
                        ,editable:false
                        ,height:305
                        ,navigatable:false
                        ,selectable:"row"
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"scNm", title:"<spring:message code='sal.lbl.salesAdvisor' />", width:100}                    /* 판매고문 */
                            ,{field:"salesActiveTpCd", title:"<spring:message code='crm.lbl.salesActiveTpCd' />", width:100           /* 영업활동유형 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= salesActiveTpCdArrVal(salesActiveTpCd)#'
                            }
                            ,{field:"commMthCd", title:"<spring:message code='crm.lbl.commMthCd' />", width:100           /* 연락방식 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= commMthCdArrVal(commMthCd)#'
                            }
                            ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100        // 고객명
                                ,template:function(dataItem){
                                    var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                    return spanObj;
                                }
                            }
                            ,{field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"} // 잠재/보유고객
                                , template:'#= custCdVal(custCd)#'
                            }
                            ,{field:"remark", title:"<spring:message code='crm.lbl.saleRemark' />", width:100}                         /* 판매기회 개술 */
                            ,{field:"startDt", title:"<spring:message code='crm.lbl.planStartDt' />", width:110                   /* 시작일자 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }
                            ,{field:"endDt", title:"<spring:message code='crm.lbl.planEndDt' />", width:110                       /* 종료일자 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                            }
                            ,{field:"activeCont", title:"<spring:message code='crm.lbl.activeCont' />", width:100}                    /* 활동내용 */
                            ,{field:"salesActiveStatCd", title:"<spring:message code='crm.lbl.salesActiveStatCd' />", width:100       /* 영업활동상태 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= salesActiveStatCdArrVal(salesActiveStatCd)#'
                            }
                        ]
                    });
                    // 영업활동 시행내역 그리드 종료

                });

            </script>