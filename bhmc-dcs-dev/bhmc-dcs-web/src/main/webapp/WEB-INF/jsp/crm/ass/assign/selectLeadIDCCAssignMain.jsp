<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- IDCC 리드 배분 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.idccLeadAssign' /><!-- IDCC 리드배정 --></h1>
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
                                <th scope="row"><spring:message code='global.lbl.leadSrc' /><!-- 리드출처 --></th>
                                <td>
                                    <input id="sLeadSrcCd" name="sLeadSrcCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.statNm' /><!-- 상태 --></th>
                                <td>
                                    <input id="sStatCd" name="sStatCd" class="form_comboBox"  />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.callPrsNm' /><!-- 콜업무 담당자 --></th>
                                <td>
                                    <input id="sPrsnId" name="sPrsnId" class="form_comboBox" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.assignYn' /><!-- 배정여부 --></th>
                                <td>
                                    <input id="sAssignYn" name="sAssignYn" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.allocDt' /></th> <!-- 배정일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sAllocDtFrom" name="sAllocDtFrom" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sAllocDtTo" name="sAllocDtTo" class="form_datepicker" />
                                        </div>
                                    </div>
                                </td>
                                <th></th>
                                <td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="leadGrid"></div>
                </div>

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.IDCCLeadAssign' /><!-- IDCC리드배분 --></h2>
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
                                <th scope="row"><spring:message code='global.lbl.callPrsNm' /><!-- 담당자 --></th>
                                <td>
                                    <select id="assignUsers" name="assignUsers" multiple="multiple" data-bind="value:values"></select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </section>
            <!-- // IDCC 리드 배분 -->

            <script type="text/javascript">

                var ynCdList = [];
                var yesMap = [];
                ynCdList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
                ynCdList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
                yesMap["Y"] = "<spring:message code='global.lbl.yes' />";
                yesMap["N"] = "<spring:message code='global.lbl.n' />";

                // 리드출처
                var leadSrcDs = [];
                var leadSrcArr = [];
                <c:forEach var="obj" items="${leadSrcList}">
                    leadSrcDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    leadSrcArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                leadSrcArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = leadSrcArr[val];
                    }
                    return returnVal;
                };

                // 리드상태
                var statDs = [];
                var statArr = [];
                <c:forEach var="obj" items="${statList}">
                    statDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    statArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                statArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = statArr[val];
                    }
                    return returnVal;
                };

                // 콜업무담당자 목록
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
                    $("#sLeadSrcCd").kendoExtDropDownList({
                        dataSource:leadSrcDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 리드상태
                    $("#sStatCd").kendoExtDropDownList({
                        dataSource:statDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // 콜업무 담당자
                    $("#sPrsnId").kendoExtDropDownList({
                        dataSource:assignUserDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:" "
                        , index:0
                    });

                    // S배정여부
                    $("#sAssignYn").kendoExtDropDownList({
                        dataSource:ynCdList
                        , dataTextField:"cmmCdNm"
                        , dataValueField:"cmmCd"
                        , optionLabel:" "
                        , index:0
                    });

                    // 배정일
                    $("#sAllocDtFrom").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 배정일
                    $("#sAllocDtTo").kendoExtMaskedDatePicker({
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

                                    if(gridData.statCd == "03"){
                                        // 종료 상태에는 배정이 불가능합니다.
                                        dms.notification.warning("<spring:message code='global.info.leadAssignChk' />");
                                        saveList = [];
                                        dataValidate = true;
                                        return false;
                                    }
                                    data.leadNo = gridData.leadNo;          // lead 번호
                                    data.statCd = gridData.statCd;          // lead 상태 ( BIZ 에서 validation 체크 )
                                    saveList.push(data);

                                }
                            });

                            if(dataValidate){ return false; }

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

                            console.log(saveData);

                            $.ajax({
                                url:"<c:url value='/crm/ass/assign/updateLeadAssign.do' />"
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

                    // IDCC 리드 배분 그리드 시작 //
                    $("#leadGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/ass/assign/selectLeadAssigns.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sLeadTp"]               = "IDCC";
                                        params["sLeadSrcCd"]            = $("#sLeadSrcCd").data("kendoExtDropDownList").value();
                                        params["sStatCd"]               = $("#sStatCd").data("kendoExtDropDownList").value();
                                        params["sPrsnId"]               = $("#sPrsnId").data("kendoExtDropDownList").value();
                                        params["sAllocDtFrom"]          = $("#sAllocDtFrom").data("kendoExtMaskedDatePicker").value();
                                        params["sAllocDtTo"]            = $("#sAllocDtTo").data("kendoExtMaskedDatePicker").value();
                                        params["sAssignYn"]             = $("#sAssignYn").data("kendoExtDropDownList").value();

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
                                        id:"leadNo"
                                        ,fields:{
                                             rnum:{type:"number"}
                                            ,custNm:{type:"string"}
                                            ,hpNo:{type:"string"}
                                            ,carlineNm:{type:"string"}
                                            ,modelNm:{type:"string"}
                                            ,leadSrcCd:{type:"string"}
                                            ,bhmcYn:{type:"string"}
                                            ,allocDt:{type:"date"}
                                            ,statCd:{type:"string"}
                                            ,prsnId:{type:"string"}
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
                                   , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />"          // 고객명
                                       ,template:function(dataItem){
                                           var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                           return spanObj;
                                       }
                                   }
                                   , {field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"} // 잠재/보유고객
                                       , template:'#= custCdVal(custCd)#'
                                   }
                                   , {field:"hpNo" , title:"<spring:message code='global.lbl.hpNo' />",  width:120, attributes:{"class":"ac"}}              // 휴대전화
                                   , {field:"carlineNm" , title:"<spring:message code='global.lbl.intrCarLine' />",  width:150}  // 관심차종
                                   , {field:"modelNm" , title:"<spring:message code='global.lbl.intrModel' />",  width:220}      // 관심모델
                                   , {field:"leadSrcCd" , title:"<spring:message code='global.lbl.leadSrc' />", width:100        // 리드출처
                                       , attributes:{"class":"ac"}
                                       , template:'#= leadSrcArrVal(leadSrcCd)#'
                                   }
                                   , {field:"bhmcYn" , title:"<spring:message code='global.lbl.bhmcyn' />",  width:80            // BHMC여부
                                       , attributes:{"class":"ac"}
                                       , template:'#if (bhmcYn !== "" && bhmcYn !== null){# #= yesMap[bhmcYn]# #} else {# #= yesMap[bhmcYn]# #}#'
                                   }
                                   , {field:"allocDt"  , title:"<spring:message code='global.lbl.allocDt' />", width:100         // 배정일
                                       , attributes:{"class":"ac"}
                                       , format:"{0:<dms:configValue code='dateFormat' />}"
                                   }
                                   , {field:"", title:"<spring:message code='global.lbl.assignYn' />",  width:60                 // 배정여부
                                       , attributes:{"class":"ac"}
                                       , template:'#if (prsnId !== "" && prsnId !== null){# #= yesMap["Y"]# #} else {# #= yesMap["N"]# #}#'
                                   }
                                   , {field:"statCd" , title:"<spring:message code='global.lbl.statNm' />", width:100            // 상태
                                       , attributes:{"class":"ac"}
                                       , template:'#= statArrVal(statCd)#'
                                   }
                                   , {field:"prsnId"   , title:"<spring:message code='global.lbl.callPrsNm' />", width:100               // 콜업무 담당자
                                       , attributes:{"class":"ac"}
                                       , template:'#= assignUserArrVal(prsnId)#'
                                   }
                                   , {field:"regDt"  , title:"<spring:message code='global.lbl.regDt' />", width:100             // 등록일
                                       , attributes:{"class":"ac"}
                                       , format:"{0:<dms:configValue code='dateFormat' />}"
                                   }
                                   , {field:""   , title:""}
                               ]
                    });
                    // IDCC 리드 배분 그리드 시작 //


                });


            </script>