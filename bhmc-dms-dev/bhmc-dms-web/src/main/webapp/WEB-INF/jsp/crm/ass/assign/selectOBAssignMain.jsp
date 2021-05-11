<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

        <div id="resizableContainer">
            <!-- OB 배정 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.OBAssignMgmt' /><!-- OB 리스트 배분 관리 --></h1>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11371" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-13232" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                    </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col>
                            <col style="width:9%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.customer' /><!-- 고객 客户--></th>
                                <td>
                                    <input type="text" id="sCust" value="" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />"  />
                                </td>
                                <td class="ar">
                                    <button type="button" id="btnHidden" class="btn_xs2 btn_detail"><spring:message code='crm.lbl.more' /></button> <!-- 더많음  ?件?情-->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form mt5" id="hiddenTable" role="search" data-btnid="btnSearch" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col style="width:15%;">
                            <col style="width:9%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" maxlength="20" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                                <td>
                                    <input id="sHpNo" name="sHpNo" class="form_input numberic" maxlength="14" />
                                </td>
                                <th scope="row"><spring:message code="global.lbl.telNo" /><!-- 집전화 --></th>
                                <td>
                                    <input id="sTelNo" name="sTelNo" class="form_input numberic" maxlength="14" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.bizCd' /><!-- 업무구분 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="form_left" >
                                            <input id="sBizCd" name="sBizCd" class="form_comboBox" />
                                        </div>
                                        <div class="form_right">
                                            <input id="sBizSubCd" name="sBizSubCd" class="form_comboBox" />
                                        </div>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.title.bizTitle' /><!-- 업무명 --></th>
                                <td>
                                    <input type="text" id="sCallBizTitleNm" name="sCallBizTitleNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.callPrsnId' /><!-- 콜담당자ID --></th>
                                <td>
                                    <input id="sCallPrsnId" name="sCallPrsnId" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.assignYn' /><!-- 배정여부 --></th>
                                <td>
                                    <input id="sAssignYn" name="sAssignYn" class="form_comboBox" />
                                </td>
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
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="leadGrid" class="resizable_grid"></div>
                </div>

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='global.title.scIdAssign' /><!-- 담당자 배정 --></h2>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11372" hasPermission="${dms:getPermissionMask('READ')}">
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
                                <th scope="row"><spring:message code='crm.lbl.prsNm' /><!-- 담당자 --></th>
                                <td>
                                    <select id="assignUsers" name="assignUsers" multiple="multiple" ></select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </section>
            <!-- // IDCC OB 배정 -->
        </div>

            <script type="text/javascript">

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

                // 담당업무코드
                var bizCdListDs = [];
                <c:forEach var="obj" items="${bizCdList}">
                <c:if test="${obj.remark1 == '10'}">
                    bizCdListDs.push({"cmmCdNm":"${obj.cmmCdNm}", "cmmCd":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
                </c:if>
                </c:forEach>

                // 만족도 조사 타입 DS
                var stsfIvstTpCdListDs = [];
                <c:forEach var="obj" items="${stsfIvstTpCdList}">
                    stsfIvstTpCdListDs.push({"cmmCdNm":"${obj.cmmCdNm}", "cmmCd":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
                </c:forEach>

                // 마케팅 유형 DS
                var makTpListDs = [];
                <c:forEach var="obj" items="${makTpList}">
                    makTpListDs.push({"cmmCdNm":"${obj.cmmCdNm}", "cmmCd":"${obj.cmmCd}", "useYn":"${obj.useYn}"});
                </c:forEach>

                /**
                * hyperlink in grid event of Customer Information
                */
                $(document).on("click", ".linkCust", function(e){

                     var grid = $("#leadGrid").data("kendoExtGrid"),
                     row = $(e.target).closest("tr");
                     var dataItem = grid.dataItem(row);

                     window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10272"); // CUST NO
                });


                function gridCommonParams() {

                    var params = {};

                    // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
                    params["sCust"] = $("#sCust").val();
                    params["sCustNm"] = $("#sCustNm").val();
                    params["sHpNo"] = $("#sHpNo").val();
                    params["sTelNo"] = $("#sTelNo").val();
                    params["sBizCd"] = $("#sBizCd").data("kendoExtDropDownList").value();
                    params["sBizSubCd"] = $("#sBizSubCd").data("kendoExtDropDownList").value();

                    params["sCallBizTitleNm"] = $("#sCallBizTitleNm").val();
                    params["sCallPrsnId"] = $("#sCallPrsnId").data("kendoExtDropDownList").value();
                    params["sAssignYn"] = $("#sAssignYn").data("kendoExtDropDownList").value();
                    params["sStartRegDt"] = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                    params["sEndRegDt"] = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();
                    params["sListTp"] = "A"

                    return params;

                };

                $(document).ready(function() {

                    // show/hide
                    $("#btnHidden").kendoButton({
                        click:function(e){
                            $("#hiddenTable").toggle();
                            resizeGrid();
                        }
                    });

                    // 리드출처
                    $("#sBizCd").kendoExtDropDownList({
                        dataSource:bizCdListDs
                        , dataTextField:"cmmCdNm"
                        , dataValueField:"cmmCd"
                        , optionLabel:" "
                        , index:0
                        , select:function(e){

                            var dataItem = this.dataItem(e.item);
                            var cmmCd = dataItem.cmmCd;

                            $("#sBizSubCd").data("kendoExtDropDownList").setDataSource([]);
                            $("#sBizSubCd").data("kendoExtDropDownList").enable(false);

                            if ( cmmCd === "05" ) {

                                $("#sBizSubCd").data("kendoExtDropDownList").enable(true);
                                $("#sBizSubCd").data("kendoExtDropDownList").setDataSource(stsfIvstTpCdListDs);

                            } else if ( cmmCd === "06" ) {

                                $("#sBizSubCd").data("kendoExtDropDownList").enable(true);
                                $("#sBizSubCd").data("kendoExtDropDownList").setDataSource(makTpListDs);

                            };

                        }
                    });
                    // 업무구분 SUB
                    $("#sBizSubCd").kendoExtDropDownList({
                          dataTextField:"cmmCdNm"
                        , dataValueField:"cmmCd"
                        , optionLabel:" "
                        , enable:false
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
                        dataSource:[{"text":"<spring:message code='global.lbl.assign' />", "value":"Y"},{"text":"<spring:message code='global.lbl.unAssign' />", "value":"N"}]
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:2
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
                    var onlyNum = new RegExp("[^0-9]","i");
                    $(".numberic").keyup(function(e)
                    {
                        var content = $(this).val();
                        if(content.match(onlyNum)){
                            $(this).val('');
                        }
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

                            if(crmJs.isDateValidPeriod($("#sStartRegDt").data("kendoExtMaskedDatePicker").value()
                                    ,$("#sEndRegDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                                $("#leadGrid").data("kendoExtGrid").dataSource.read();
                            }else{
                                $("#sEndRegDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                                $("#sEndRegDt").focus();
                                return false;
                            }

                        }
                    });

                    setKendoDate = function( dtValue){
                        return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
                    };

                    //엑셀Export
                    $("#btnExcelExport").kendoButton({
                        click:function(e) {

                            if ( $("#leadGrid").data("kendoExtGrid").dataSource._total > 0 ) {

                                var params = {};
                                params = gridCommonParams();

                                // 엑셀Export 수량 데이터를 조회한다.
                                $.ajax({
                                    url:"<c:url value='/crm/ass/assign/selectCallCenterAssignsExcelExportCnt.do' />",
                                    data:JSON.stringify(params),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(resultCnt) {

                                        //console.log("resultCnt : ",resultCnt)
                                        <c:set value="10000" var="maxCnt" />;
                                        var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                                        if ( resultCnt > excelMaxExportCnt ) {
                                            // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                                            dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                                            return;
                                        };

                                        dms.ajax.excelExport({
                                            "beanName":"callCenterActionService"
                                            ,"templateFile":"CallCenterAssigns_Tpl.xlsx"
                                            ,"fileName":"<spring:message code='crm.menu.OBAssignMgmt' />_"+kendo.toString(new Date(), "yyyy-MM-dd-HHmmss")+".xlsx"
                                            ,"field":"regDtFormat"  // [20170911-이인문] OB 배정, 실행에서 excelExport 할때 grid default sort 랑 excel sort 랑 동일하게 맞춤.
                                            ,"dir":"desc"
                                            ,"sCust":$("#sCust").val()
                                            ,"sCustNm":$("#sCustNm").val()
                                            ,"sHpNo":$("#sHpNo").val()
                                            ,"sTelNo":$("#sTelNo").val()
                                            ,"sBizCd":$("#sBizCd").data("kendoExtDropDownList").value()
                                            ,"sBizSubCd":$("#sBizSubCd").data("kendoExtDropDownList").value()
                                            ,"sCallBizTitleNm":$("#sCallBizTitleNm").val()
                                            ,"sCallPrsnId":$("#sCallPrsnId").data("kendoExtDropDownList").value()
                                            ,"sAssignYn":$("#sAssignYn").data("kendoExtDropDownList").value()
                                            ,"sStartRegDt":setKendoDate($("#sStartRegDt").data("kendoExtMaskedDatePicker").value())
                                            ,"sEndRegDt":setKendoDate($("#sEndRegDt").data("kendoExtMaskedDatePicker").value())
                                            ,"sListTp":"A"
                                        });

                                    }
                                });

                            } else {
                                //목록을 선택하여 주십시오.
                                dms.notification.info("<spring:message code='global.info.required.select'/>");
                                return;
                            }

                        }
                        , enable:false
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

                            //console.log(JSON.stringify(saveData));
                            //console.log(saveData);
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
                                ,beforeSend:function(xhr) {
                                    dms.loading.show();
                                }
                                ,complete:function(xhr, status) {
                                    dms.loading.hide();
                                }
                            });


                        }
                        //, enable:false
                    });

                    assignYnVal = function(val){

                        var returnVal = "";

                        if ( val === "Y" ) {
                            returnVal = "<spring:message code='global.lbl.assign' />"
                        } else {
                            returnVal = "<spring:message code='global.lbl.unAssign' />"
                        };
                        return returnVal;

                    };

                    // IDCC OB 배정 그리드 시작 //
                    $("#leadGrid").kendoExtGrid({
                        gridId:"G-CRM-0814-095301"
                        ,dataSource:{
                            transport:{
                                read:{
                                    url:"<c:url value='/crm/ass/assign/selectCallCenterAssigns.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        if ( dms.string.isEmpty(options.sort) ){
                                            params["sort"] = [{"field":"regDtFormat","dir":"desc"}];       // 20160910 수정
                                        } else {
                                            params["sort"] = options.sort;
                                        }

                                        params = $.extend(params, gridCommonParams());
                                        //console.log("leadGrid param:" + kendo.stringify(params));

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
                                        id:"callSeq"
                                        ,fields:{
                                             rnum:{type:"number"}
                                            ,bizCdNm:{type:"string"}
                                            ,custNm:{type:"string"}
                                            ,hpNo:{type:"string"}
                                            ,assignYn:{type:"string"}
                                            ,callPrsnNm:{type:"string"}
                                            ,callCnt:{type:"number"}
                                            ,regDt:{type:"date"}
                                            ,callStartDt:{type:"date"}
                                            ,callEndDt:{type:"date"}
                                            ,regDtFormat:{type:"date", editable:false}
                                            ,callStartDtFormat:{type:"date", editable:false}
                                            ,callEndDtFormat:{type:"date", editable:false}
                                        }
                                    }
                                    ,parse:function(d) {
                                        if(d.data){
                                            $.each(d.data, function(idx, elem) {
                                                elem.callStartDtFormat = kendo.parseDate(elem.callStartDt, "<dms:configValue code='dateFormat' />");
                                                elem.callEndDtFormat = kendo.parseDate(elem.callStartDt, "<dms:configValue code='dateFormat' />");
                                                elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                            });
                                        }
                                        return d;
                                    }
                            }
                        }
                        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
                        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
                        , multiSelectWithCheckbox:true     //멀티선택 적용. default:false
                        , appendEmptyColumn:true           //빈컬럼 적용. default:false
                        , enableTooltip:true               //Tooltip 적용, default:false
                        ,editable:false
                        ,navigatable:false
                        ,dataBound:function(e) {

                            if ( e.sender.dataSource._total > 0 ) {
                                $("#btnExcelExport").data("kendoButton").enable(true);
                            } else {
                                $("#btnExcelExport").data("kendoButton").enable(false);
                            }

                        }
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                                ,filterable:false
                            }
                            ,{field:"callBizTitleNm", title:"<spring:message code='crm.title.bizTitle' />", width:150}    // 업무명
                            ,{field:"bizCdNm", title:"<spring:message code='crm.lbl.bizCd' />", width:100, sortable:false, attributes:{"class":"ac"}} //업무구분
                            ,{field:"bizSubCdNm", title:"<spring:message code='crm.lbl.bizSubCd' />", width:100, sortable:false, attributes:{"class":"ac"}}    //업무구분SUB
                            ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:100           // 고객명
                                ,template:function(dataItem){
                                    var spanObj = "<a href='#' class='linkCust'>"+dataItem.custNm+"</a>";
                                    return spanObj;
                                }
                            }
                            ,{field:"assignYnNm", title:"<spring:message code='global.lbl.assignYn' />", width:60, attributes:{"class":"ac"}}    // 배정여부
                            ,{field:"hpNo" , title:"<spring:message code='global.lbl.hpNo' />", width:100 ,attributes:{"class":"ac"}}   // 휴대전화
                            ,{field:"telNo", title:"<spring:message code='global.lbl.telNo' />", width:100 ,attributes:{"class":"ac"}}  //전화번호
                            ,{field:"purcMngNm", title:"<spring:message code='crm.lbl.companyContacts'/>", attributes:{"class":"al"}, width:100}//구매담당자 명
                            ,{field:"useCustNm", title:"<spring:message code='crm.lbl.driver'/>", attributes:{"class":"al"}, width:100}//방문자명
                            ,{field:"useHpNo", title:"<spring:message code='crm.lbl.driverHp'/>", attributes:{"class":"ac"}, width:100}//방문자 이동전화
                            ,{field:"mngUsrNm", title:"<spring:message code='crm.lbl.saAndsc'/>", attributes:{"class":"al"}, width:100}//담당자
                            ,{field:"callPrsnNm" , title:"<spring:message code='crm.lbl.callPrsnId' />", width:120, attributes:{"class":"ac"}} // 콜담당자ID
                            ,{field:"callCnt" , title:"<spring:message code='global.lbl.callCnt' />", width:120 ,attributes:{ "style":"text-align:right"}}  // 콜횟수
                            ,{field:"callStartDtFormat", title:"<spring:message code='crm.lbl.callStartDt' />", width:100          // 콜시작일자
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (callStartDtFormat !== null ){# #= kendo.toString(data.callStartDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }
                            ,{field:"callEndDtFormat", title:"<spring:message code='crm.lbl.callEndDt' />", width:100          // 콜종료일자
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (callEndDtFormat !== null ){# #= kendo.toString(data.callEndDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }
                            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:100          // 등록일
                                ,attributes:{"class":"ac tooltip-disabled"}
                                ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                            }
                        ]
                    });
                    // OB 배정 그리드 시작 //


                });


            </script>