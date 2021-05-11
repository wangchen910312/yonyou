<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 고객 담당영업사원 배정 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.custAssignMng' /><!-- 영업사원 배정 --></h1>
                    <div class="btn_right">
					<dms:access viewId="VIEW-I-12513" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /><!-- 조회 --></button>
					</dms:access>
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
                                <th scope="row"><spring:message code='global.lbl.assignYn' /><!-- 배정여부 --></th>
                                <td>
                                    <input id="sAssignYn" name="sAssignYn" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.scId' /><!-- 담당 SC --></th>
                                <td>
                                    <input id="sMngScId" name="sMngScId" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.custNm' /><!-- 고객명 --></th>
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.regDt' /><!-- 등록일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sRegDtFrom" name="sRegDtFrom" class="form_datepicker" />
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sRegDtTo" name="sRegDtTo" class="form_datepicker" />
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
                    <div id="customerGrid"></div>
                </div>

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.scIdAssign' /><!-- 담당자 재배정 --></h2>
                    <div class="btn_right">
					<dms:access viewId="VIEW-I-12512" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnAssign" class="btn_s"><spring:message code='global.btn.assign' /><!-- 배정 --></button>
					</dms:access>
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

            <script type="text/javascript">

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

                // 고객유형
                var custTpMap = [];
                <c:forEach var="obj" items="${custTpList}">
                    custTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                custTpCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custTpMap[val];
                    }
                    return returnVal;
                };

                // 고객확보유형
                var custHoldTpMap = [];
                <c:forEach var="obj" items="${custHoldTpList}">
                    custHoldTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                custHoldTpArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custHoldTpMap[val];
                    }
                    return returnVal;
                };

                var ynCdList = [];
                ynCdList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
                ynCdList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});

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

                     var grid = $("#customerGrid").data("kendoExtGrid"),
                     row = $(e.target).closest("tr");
                     var dataItem = grid.dataItem(row);

                     window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-I-10232"); // CUST NO
                });

                $(document).ready(function() {

                    // S배정여부
                    $("#sAssignYn").kendoExtDropDownList({
                        dataSource:ynCdList
                        , dataTextField:"cmmCdNm"
                        , dataValueField:"cmmCd"
                        , optionLabel:" "
                        , index:0
                    });

                    // S SC
                    $("#sMngScId").kendoExtDropDownList({
                        dataSource:usersDS
                        , dataTextField:"usrNm"
                        , dataValueField:"usrId"
                        , optionLabel:" "
                        , index:0
                    });

                    // 등록 시작일
                    $("#sRegDtFrom").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 등록 종료일
                    $("#sRegDtTo").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });


                    // 배정 담당자
                    $("#assignUsers").kendoMultiSelect({
                        dataSource:usersDS,
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
                            $("#customerGrid").data("kendoExtGrid").dataSource.read();
                        }
                    });

                    // 활동
                    $("#btnAssign").kendoButton({
                        click:function(e){

                            var saveList      = [],
                                grid          = $("#customerGrid").data("kendoExtGrid"),
                                rows          = grid.tbody.find("tr"),
                                userList      = $("#assignUsers").data("kendoMultiSelect").dataItems(),
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

                                    data.custNo = gridData.custNo;           // 고객명, 폰번호 수정확인을 위한 필수값
                                    data.custNm = gridData.custNm;           // 고객명, 폰번호 수정확인을 위한 필수값
                                    data.hpNo = gridData.hpNo;               // 고객명, 폰번호 수정확인을 위한 필수값
                                    data.custTp = gridData.custTp;           // 고객명, 폰번호 수정확인을 위한 필수값
                                    data.prefCommMthCd = gridData.prefCommMthCd;
                                    data.prefCommNo = gridData.prefCommNo;
                                    data.officeTelNo = gridData.officeTelNo;
                                    data.oldCustNm = gridData.oldCustNm;     // 고객명, 폰번호 수정확인을 위한 필수값
                                    data.oldHpNo = gridData.oldHpNo;         // 고객명, 폰번호 수정확인을 위한 필수값
                                    data.mngScId = gridData.mngScId;         // 변경 [전] SC 아이디 설정
                                    saveList.push(data);

                                }
                            });

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
                                url:"<c:url value='/crm/ass/assign/updateCustomerInfoAssign.do' />"
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
                                    assignUsers.setDataSource(usersDS);
                                    //정상적으로 반영 되었습니다.
                                    dms.notification.success("<spring:message code='global.info.success'/>");


                                }
                            });


                        }
                        //, enable:false
                    });


                    // 고객 배정 그리드 시작 //
                    $("#customerGrid").kendoExtGrid({
                        dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/ass/assign/selectCustomerInfoAssigns.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"]    = options.pageSize;
                                        params["pageIndex"]             = options.page;
                                        params["firstIndex"]            = options.skip;
                                        params["lastIndex"]             = options.skip + options.take;
                                        params["sort"]                  = options.sort;

                                        params["sAssignYn"]             = $("#sAssignYn").data("kendoExtDropDownList").value();
                                        params["sMngScId"]              = $("#sMngScId").data("kendoExtDropDownList").value();
                                        params["sCustNm"]               = $("#sCustNm").val();
                                        params["sRegDtFrom"]            = $("#sRegDtFrom").data("kendoExtMaskedDatePicker").value();
                                        params["sRegDtTo"]              = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

                                        console.log("customerGrid param:" + kendo.stringify(params));

                                        return kendo.stringify(params);

                                    }else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                errors:"error"
                                    , data:"custInfoDS"
                                    , total:"total"
                                    , model:{
                                        id:"custNo"
                                        , fields:{
                                            custNo         :{type:"string", editable:false}
                                            , custNm       :{type:"string", editable:false}
                                            , custTp       :{type:"string", editable:false}
                                            , mngScId      :{type:"string", editable:false}
                                            , befMngScId   :{type:"string", editable:false}
                                            , emailNm      :{type:"string", editable:false}
                                            , custHoldTp   :{type:"string", editable:false}
                                            , hpNo         :{type:"string", editable:false}
                                            , telNo        :{type:"string", editable:false}
                                            , bhmcYn       :{type:"string", editable:false}
                                            , regDt        :{type:"date", editable:false}
                                        }
                                    }
                            }
                            ,requestEnd:function(e){
                                if (e.type !== "read"){
                                    //this.page(1);
                                }
                            }
                            ,serverSorting:false
                        }
                        ,multiSelectWithCheckbox:true
                        ,editable:false
                        ,height:395
                        ,navigatable:false
                        ,resizable:false
                        ,sortable:false
                        ,columns:[
                                    // {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                                    // {field:"custNo" , title:"<spring:message code='global.lbl.custNo' />",  width:100, attributes:{"class":"ac"}}
                                    {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100         // 고객명
                                        ,template:function(dataItem){
                                            var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                            return spanObj;
                                        }
                                    }
                                    , {field:"custCd" , title:"<spring:message code='global.lbl.custCd' />", width:120, attributes:{"class":"ac"} // 잠재/보유고객
                                        , template:'#= custCdVal(custCd)#'
                                    }
                                    , {field:"custTp" , title:"<spring:message code='global.lbl.custTp' />", width:100        // 고객유형
                                        , attributes:{"class":"ac"}
                                        , template:'#= custTpCdArrVal(custTp)#'
                                    }
                                    , {field:"mngScId"   , title:"<spring:message code='crm.lbl.scId' />", width:100          // 담당 SC
                                        , template:'#= usersArrVal(mngScId)#'
                                    }
                                    , {field:"befMngScId"   , title:"<spring:message code='crm.lbl.preScId' />", width:100    // 이전 담당 SC
                                        , template:'#= usersArrVal(befMngScId)#'
                                    }
                                    , {field:"emailNm"   , title:"<spring:message code='global.lbl.emailNm' />", width:250}   // 이메일
                                    , {field:"custHoldTp"   , title:"<spring:message code='crm.lbl.custHoldTp' />", width:100 // 고객확보유형
                                        , template:'#= custHoldTpArrVal(custHoldTp)#'
                                    }
                                    , {field:"hpNo"   , title:"<spring:message code='global.lbl.hpNo' />", width:100}
                                    , {field:"telNo"  , title:"<spring:message code='global.lbl.homeTelNo' />", width:100}
                                    , {field:"bhmcYn" , title:"<spring:message code='global.lbl.bhmcyn' />", width:100
                                        , attributes:{"class":"ac"}
                                    }
                                    , {field:"regDt"  , title:"<spring:message code='global.lbl.regDt' />", width:100
                                        , attributes:{"class":"ac"}
                                        , format:"{0:<dms:configValue code='dateFormat' />}"
                                    }
                                    , {field:""   , title:""}
                                ]
                    });
                    // 고객 배정 그리드 종료 //


                });


            </script>