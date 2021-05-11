<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- OB 배정 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.OBAssignMgmt' /><!-- OB 리스트 배분 관리 --></h1>
                    <div class="btn_right">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /><!-- 조회 --></button>
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
                                <th scope="row"><spring:message code='global.lbl.bizCd' /><!-- 담당업무구분 --></th>
                                <td>
                                    <input id="sBizCd" name="sBizCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.callPrsnId' /><!-- 콜담당자ID --></th>
                                <td>
                                    <input id="sCallPrsnId" name="sCallPrsnId" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.assignYn' /><!-- 배정여부 --></th>
                                <td>
                                    <input id="sAssignYn" name="sAssignYn" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.regDt' /></th> <!-- 등록일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartRegDt" name="sStartRegDt" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndRegDt" name="sEndRegDt" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                                <td callspan="4">
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="leadGrid"></div>
                </div>

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.scIdAssign' /><!-- 담당자 재배정 --></h2>
                    <div class="btn_right">
                        <button id="btnAssign" class="btn_s"><spring:message code='global.btn.assign' /><!-- 배정 --></button>
                    </div>
                </div>

                <div class="table_form form_width_20per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.prsNm' /><!-- 담당자 --></th>
                                <td>
                                    <select id="assignUsers" name="assignUsers" multiple="multiple" data-bind="value:values"></select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </section>
            <!-- // IDCC OB 배정 -->

            <script type="text/javascript">

                // 리드출처
                var bizCdListDs = [];
                var bizCdListArr = [];
                <c:forEach var="obj" items="${bizCdList}">
                    bizCdListDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    bizCdListArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                bizCdListArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = bizCdListArr[val];
                    }
                    return returnVal;
                };

                // 판매고문 목록
                var assignUserDS = [];
                var assignUserArr = [];
                <c:forEach var="obj" items="${assignUserList}">
                    assignUserDS.push({"usrId":"${obj.usrId}", "usrNm":"${obj.usrNm}"});
                    assignUserArr["${obj.usrId}"] = "${obj.usrNm}";
                </c:forEach>
                assignUserArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = assignUserArr[val];
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

                     var grid = $("#leadGrid").data("kendoExtGrid"),
                     row = $(e.target).closest("tr");
                     var dataItem = grid.dataItem(row);

                     window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
                });


                $(document).ready(function() {

                    // 리드출처
                    $("#sBizCd").kendoExtDropDownList({
                        dataSource:bizCdListDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // S 판매고문
                    $("#sCallPrsnId").kendoExtDropDownList({
                        dataSource:assignUserDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:" "
                        , index:0
                    });

                    // S배정여부
                    $("#sAssignYn").kendoExtDropDownList({
                        //dataSource:[{"Y":"Y"},"N":"N"}]
                        dataSource:[{"text":"Y", "value":"Y"},{"text":"N", "value":"N"}]
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 배정일
                    $("#sStartRegDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 배정일
                    $("#sEndRegDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });


                    // 배정 담당자
                    $("#assignUsers").kendoMultiSelect({
                        dataSource:assignUserDS,
                        valuePrimitive:true,
                        placeholder:"",
                        dataTextField:"usrNm",
                        dataValueField:"usrId"
                        //dataBound:defaultLangDatasourceSetting,
                        //change:defaultLangDatasourceSetting
                    });


                    // 검색
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#leadGrid").data("kendoExtGrid").dataSource.read();
                        }
                    });

                    // 배정
                    $("#btnAssign").kendoButton({
                        click:function(e){

                            var saveList      = [],
                                grid          = $("#leadGrid").data("kendoExtGrid"),
                                rows          = grid.tbody.find("tr"),
                                userList      = $("#assignUsers").data("kendoMultiSelect").dataItems(),
                                dataValidate  = false,
                                chkRow,
                                saveData;

                            if(userList.length  == 0 ){
                                // 배정담당자 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='global.lbl.assignPrsNm' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                                return false;
                            }

                            rows.each(function(index, row) {
                                var gridData = grid.dataSource.at(index);
                                var data={};

                                chkRow   = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");

                                if(chkRow === true){

                                    /*
                                    if(gridData.statCd == "03"){
                                        // 종료 상태에는 배정이 불가능합니다.
                                        dms.notification.warning("<spring:message code='global.info.leadAssignChk' />");
                                        saveList = [];
                                        dataValidate = true;
                                        return false;
                                    }
                                     */

                                    data.callSeq = gridData.callSeq;          // callSeq
                                    //data.statCd = gridData.statCd;          // lead 상태 ( BIZ 에서 validation 체크 )
                                    saveList.push(data);

                                }
                            });

                            //if(dataValidate){ return false; }

                            if(saveList.length == 0 ){
                                // 배정목록 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='global.btn.assignList' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}' />");
                                return false;
                            }

                            if(saveList.length < userList.length ){
                                // 선택된 목록보다 담당자가 많습니다.
                                dms.notification.warning("<spring:message code='global.info.assignChk' />");
                                return false;
                            }

                            saveData ={
                                    "assignList":saveList
                                    ,"userList":userList
                            };

                            console.log(JSON.stringify(saveData));
                            console.log(saveData);
                            //return;

                            $.ajax({
                                url:"<c:url value='/crm/ass/assign/updateCallCenterAssign.do' />"
                                ,data:JSON.stringify(saveData)
                                ,type:'POST'
                                ,dataType:'json'
                                ,contentType:'application/json'
                                ,error:function(jqXHR, status, error) {
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                }
                                ,success:function(jqXHR, textStatus) {

                                    grid.dataSource._destroyed = [];
                                    grid.dataSource.page(1);

                                    var assignUsers = $("#assignUsers").data("kendoMultiSelect");
                                    assignUsers.dataSource.data([]);
                                    assignUsers.setDataSource(assignUserDS);
                                    //정상적으로 반영 되었습니다.
                                    dms.notification.success("<spring:message code='global.info.success'/>");


                                }
                            });


                        }
                        //, enable:false
                    });

                    // IDCC OB 배정 그리드 시작 //
                    $("#leadGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/ass/assign/selectCallCenterAssigns.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sBizCd"]            = $("#sBizCd").data("kendoExtDropDownList").value();
                                        params["sCallPrsnId"]               = $("#sCallPrsnId").data("kendoExtDropDownList").value();
                                        params["sAssignYn"]             = $("#sAssignYn").data("kendoExtDropDownList").value();
                                        params["sStartRegDt"]          = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                                        params["sEndRegDt"]            = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();

                                        console.log("leadGrid param:" + kendo.stringify(params));

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
                                        id:"rnum"
                                        ,fields:{
                                             rnum:{type:"number"}
                                            ,bizCd:{type:"string"}
                                            ,custNm:{type:"string"}
                                            ,hpNo:{type:"string"}
                                            ,callPrsnNm:{type:"string"}
                                            ,callCnt:{type:"number"}
                                            ,regDt:{type:"date"}
                                        }
                                    }
                            }
                            ,serverSorting:false
                        }
                        ,multiSelectWithCheckbox:true
                        ,editable:false
                        ,height:395
                        ,navigatable:false
                        ,sortable:false
                        ,columns:[
                                     {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                         , attributes:{"class":"ac"}
                                     }
                                     , {field:"bizCd" , title:"<spring:message code='global.lbl.bizCd' />", width:100        // 담당업무구분코드
                                         , attributes:{"class":"ac"}
                                         , template:'#= bizCdListArrVal(bizCd)#'
                                     }
                                    , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100           // 고객명
                                        ,template:function(dataItem){
                                            var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                            return spanObj;
                                        }
                                    }
                                    /*
                                    // TODO VOC 개발 미정이라서 고객이랑 join 안했음. 따라서 추후 적용
                                    , {field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"} // 잠재/보유고객
                                        , template:'#= custCdVal(custCd)#'
                                    }
                                     */
                                    , {field:"", title:"<spring:message code='global.lbl.assignYn' />",  width:60                 // 배정여부
                                        , attributes:{"class":"ac"}
                                        , template:'#if (callPrsnId !== "" && callPrsnId !== null){# #= "Y"# #} else {# #= "N"# #}#'
                                    }
                                    , {field:"hpNo" , title:"<spring:message code='global.lbl.hpNo' />",  width:120, attributes:{"class":"ac"}}              // 휴대전화
                                    , {field:"callPrsnNm" , title:"<spring:message code='crm.lbl.callPrsnId' />",  width:120, attributes:{"class":"ac"}}              // 콜담당자ID
                                    , {field:"callCnt" , title:"<spring:message code='global.lbl.callCnt' />",  width:120, attributes:{"class":"ac"}}              // 콜횟수
                                    , {field:"regDt"  , title:"<spring:message code='global.lbl.regDt' />", width:100             // 등록일
                                        , attributes:{"class":"ac"}
                                        , format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                                    , {field:""   , title:""}
                                ]
                    });
                    // OB 배정 그리드 시작 //


                });


            </script>