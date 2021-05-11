<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <!-- 고객케어 관리 -->
            <section class="group">

                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.custCareMgmt' /><!-- 고객케어 관리 --></h1>
                    <div class="btn_right">
                        <button type="button" class="btn_m" id="btnRcpeExtr" ><spring:message code='crm.btn.rcpeExtrMapping' /><!-- 대상자 추출 --></button>
                        <button type="button" class="btn_m btn_search" id="btnSearch" ><spring:message code='global.btn.search' /><!-- 조회 --></button>
                        <button type="button" class="btn_m btn_add" id="btnAdd" ><spring:message code='global.btn.add' /><!-- 추가 --></button>
                        <button type="button" class="btn_m btn_delete" id="btnDelete" ><spring:message code='global.btn.del' /><!-- 삭제 --></button>
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
                                <th scope="row"><spring:message code='crm.lbl.custCareNm' /><!-- 고객케어명 --></th>
                                <td>
                                    <input type="text" id="sCustCareNm" name="sCustCareNm" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.activeTpCd' /><!-- 실행유형 --></th>
                                <td>
                                    <input id="sActiveTpCd" name="sActiveTpCd" class="form_comboBox" />
                                </td>
                                <th scope="row"><spring:message code='crm.lbl.startDt' /><!-- 시작일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartStartDt" name="sStartStartDt" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sStartEndDt" name="sStartEndDt" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div id="custCareMgmtGrid"></div>
                </div>

            </section>
            <!-- //고객케어 관리 -->

            <script type="text/javascript">

                var custCareSeq
                    , isGridReload = false      // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , resultKey                 // 저장완료후 해당 번호로 다시 조회 하기 위한 전역변수( grid dataBound 에서 처리 )
                    , popupWindow
                    , isSmsUseYn = "N"
                ;

                // 사용여부 DS
                var useYnDs = [{text:"N", value:"N"},{text:"Y", value:"Y"}];

                // 고객캐어미션유형 DS
                var activeTpCdDs = [];
                var activeTpCdArr = [];
                <c:forEach var="obj" items="${activeTpCdList}">
                    activeTpCdDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
                    activeTpCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
                </c:forEach>
                activeTpCdArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = activeTpCdArr[val];
                    }
                    return returnVal;
                };

                // 템플릿 - SMS
                var smsTemplateDs = [];
                var smsTemplateArr = [];
                <c:forEach var="obj" items="${smsTemplateList}">
                    smsTemplateDs.push({text:"${obj.mesgTmplNm}", value:"${obj.mesgTmplNo}"});
                    smsTemplateArr["${obj.mesgTmplNo}"] = "${obj.mesgTmplNm}";
                </c:forEach>
                smsTemplateArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = smsTemplateArr[val];
                    }
                    return returnVal;
                };

                // 고객추출조건명 DS
                var custExtrTermNoDs = [];
                var custExtrTermNoArr = [];
                <c:forEach var="obj" items="${custExtrTermNoList}">
                    custExtrTermNoDs.push({text:"${obj.custExtrTermNm}", value:"${obj.custExtrTermNo}"});
                    custExtrTermNoArr["${obj.custExtrTermNo}"] = "${obj.custExtrTermNm}";
                </c:forEach>
                custExtrTermNoArrVal = function(val){
                    var returnVal = "";
                    if(val != null && val != ""){
                        returnVal = custExtrTermNoArr[val];
                    }
                    return returnVal;
                };

                $(document).ready(function() {

                    // s실행유형
                    $("#sActiveTpCd").kendoExtDropDownList({
                        dataSource:activeTpCdDs
                        , dataTextField:"text"
                        , dataValueField:"value"
                        , optionLabel:" "
                        , index:0
                    });

                    // s시작일
                    $("#sStartStartDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });
                    $("#sStartEndDt").kendoExtMaskedDatePicker({
                        format:"<dms:configValue code='dateFormat' />"
                        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                    });

                    // 대상자 추출
                    $("#btnRcpeExtr").kendoButton({
                        click:function(e){

                            // 고객케어 리스트 그리드의 선택된 CUST_NO
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());

                            if ( dms.string.isEmpty(selectedVal) ) {

                                // 고객케어명 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.custCareNm' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                return;

                            } else if ( dms.string.isNotEmpty(selectedVal) ) {

                                var custExtrTermNo = selectedVal.custExtrTermNo
                                var extrDgreCnt = selectedVal.extrDgreCnt
                                var custExtrAutoYn = selectedVal.custExtrAutoYn
                                var activeTpCd = selectedVal.activeTpCd

                                if ( dms.string.isEmpty(custExtrTermNo) ) {
                                        // {고객추출조건}을(를) 선택해주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.custExtrTermNo' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                        return;
                                }

                                if ( dms.string.isEmpty(extrDgreCnt) ) {
                                        // {추출차수}을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.extrDgreCnt' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                if ( custExtrAutoYn !== "N" ) {
                                        // {고객추출자동여부}을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.custExtrAutoYn' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                if ( dms.string.isEmpty(activeTpCd) ) {
                                        // {실행유형}을(를) 확인하여 주세요.
                                        dms.notification.warning("<spring:message code='crm.lbl.activeTpCd' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        return;
                                }

                                var param = {
                                          "custCareSeq":custCareSeq
                                        , "custExtrTermNo":custExtrTermNo
                                        , "extrDgreCnt":extrDgreCnt
                                        , "custExtrAutoYn":custExtrAutoYn
                                        , "activeTpCd":activeTpCd

                                }
                                console.log("saveData:",JSON.stringify(param));
                                return;

                                $.ajax({
                                    url:"<c:url value='/crm/crq/customerCare/selectTargetExtractSave.do' />",
                                    data:JSON.stringify(param),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {

                                        console.log("jqXHR:",jqXHR)
                                        console.log("status:",status)
                                        console.log("error:",error)

                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(jqXHR, textStatus) {

                                        console.log("jqXHR:" ,jqXHR)
                                        console.log("textStatus:" ,textStatus)

                                        // 저장완료일경우 해당 데이터를 다시 조회한다.
                                        if(textStatus == "success" && jqXHR === true ){

                                            // {대상자 추출}이(가) 완료 되었습니다.
                                            dms.notification.success("<spring:message code='crm.lbl.rcpeExtrSeq' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");

                                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                                            $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);

                                            resultKey = custCareSeq;
                                            isGridReload = true;

                                        }else{
                                            // 저장정보 / 을(를) 확인하여 주세요.
                                            dms.notification.error("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                        }

                                    }
                                });


                            }


                        }
                        , enable:false
                    });

                    // 조회
                    $("#btnSearch").kendoButton({
                        click:function(e){
                            $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);
                        }
                    });

                    var validator = $("#salesActiveMgmtForm").kendoExtValidator().data("kendoExtValidator");

                    // 추가
                    $("#btnAdd").kendoButton({
                        click:function(e){

                            // TODO 팝업사이즈 1050
                            // 고객케어 리스트 그리드의 선택된 CUST_NO
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());

                            if ( dms.string.isEmpty(selectedVal) ) {

                            } else if ( dms.string.isNotEmpty(selectedVal) ) {

                                var custCareSeq = selectedVal.custCareSeq;
                            }

                            console.log("custCareSeq:",custCareSeq)

                            popupWindow = dms.window.popup({
                                windowId:"popupWindow"
                                , title:"<spring:message code='crm.title.custCareInfo' />"   // <!-- 고객케어 상세정보 -->
                                , width:1050
                                , height:380
                                , content:{
                                    url:"<c:url value='/crm/crq/customerCare/selectCustomerCareMgmtPopup.do'/>"
                                    , data:{
                                        "autoBind" :false
                                        , "type"   :null
                                        , "custCareSeq":custCareSeq
                                        , "callbackFunc":function(data){

                                            console.log("data:",data)
                                            if ( data > 0 ) {

                                                // 저장 / 이 완료 되었습니다.
                                                dms.notification.success("<spring:message code='global.lbl.save' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                                                resultKey = data;
                                                isGridReload = true;
                                                popupWindow.close();

                                            }


                                        }
                                    }
                                }
                            });

                        }
                    });

                    // 삭제
                    $("#btnDelete").kendoButton({
                        click:function(e){

                            // TODO 추출 대상자 확인후 추출 대상자가 없으면 삭제.
                            // 고객케어 리스트 그리드의 선택된 CUST_NO
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid");
                            var selectedVal = grid.dataItem(grid.select());

                            if ( dms.string.isEmpty(selectedVal) ) {

                                // 고객케어명 / 을(를) 선택해주세요.
                                dms.notification.warning("<spring:message code='crm.lbl.custCareNm' var='arguMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arguMsg}'/>");
                                return;

                            } else if ( dms.string.isNotEmpty(selectedVal) ) {

                                custCareSeq = selectedVal.custCareSeq;
                                var param = {
                                        "sCustCareSeq":custCareSeq
                                        };

                                console.log("custCareSeq:",custCareSeq);
                                return;

                                $.ajax({
                                        url:"<c:url value='/crm/crq/customerCare/deleteCustomerCareMgmt.do' />"
                                        ,data:JSON.stringify(param)      //파라미터
                                        ,type:'POST'                        //조회요청
                                        ,dataType:'json'                  //json 응답
                                        ,contentType:'application/json'   //문자열 파라미터
                                        ,error:function(jqXHR,status,error){
                                            dms.notification.error(jqXHR.responseJSON.errors);
                                        }
                                }).done(function(jqXHR, textStatus) {


                                    console.log("jqXHR:" ,jqXHR)      // 삭제 수량
                                    console.log("textStatus:" ,textStatus)

                                    // 저장완료일경우 해당 데이터를 다시 조회한다.
                                    if(textStatus == "success" && jqXHR === 1 ){

                                        // 고객케어일련번호 / 삭제 성공하였습니다
                                        dms.notification.success("<spring:message code='crm.lbl.custCareSeq' var='arguMsg' /><spring:message code='global.info.delSuccessParam' arguments='${arguMsg}'/>");

                                        $("#custCareMgmtGrid").data("kendoExtGrid").dataSource.page(1);

                                    }else{
                                        // 저장정보 / 을(를) 확인하여 주세요.
                                        dms.notification.success("<spring:message code='crm.info.saveInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                                    }

                                });

                            }

                        }
                        , enable:false

                    });

                    // 고객캐어미션 그리드 시작
                    $("#custCareMgmtGrid").kendoExtGrid({
                        dataSource:{
                             transport:{
                                read:{
                                    url:"<c:url value='/crm/crq/customerCare/selectCustomerCareMgmts.do' />"
                                }
                                ,parameterMap:function(options, operation) {
                                    if (operation === "read") {

                                        var params = {};

                                        params["recordCountPerPage"] = options.pageSize;
                                        params["pageIndex"] = options.page;
                                        params["firstIndex"] = options.skip;
                                        params["lastIndex"] = options.skip + options.take;
                                        params["sort"] = options.sort;

                                        params["sCustCareNm"] = $("#sCustCareNm").val();
                                        params["sActiveTpCd"] = $("#sActiveTpCd").data("kendoExtDropDownList").value();
                                        params["sStartStartDt"] = $("#sStartStartDt").data("kendoExtMaskedDatePicker").value();
                                        params["sStartEndDt"] = $("#sStartEndDt").data("kendoExtMaskedDatePicker").value();

                                        console.log("custCareMgmtGrid param:"+kendo.stringify(params));

                                        return kendo.stringify(params);

                                    } else if (operation !== "read" && options.models) {
                                        return kendo.stringify(options.models);
                                    }
                                }
                            }
                            ,schema:{
                                model:{
                                    id:"custCareSeq"
                                    ,fields:{
                                        rnum:{type:"number"}
                                        ,custCareSeq:{type:"number"}
                                        ,custCareNm:{type:"string"}
                                        ,useYn:{type:"string"}
                                        ,activeTpCd:{type:"string"}
                                        ,autoActiveYn:{type:"string"}
                                        ,activeTmplId:{type:"string"}
                                        ,custExtrTermNo:{type:"string"}
                                        ,custExtrAutoYn:{type:"string"}
                                        ,custExtrCycleCont:{type:"string"}
                                        ,custCareCont:{type:"string"}
                                        ,startDt:{type:"date"}
                                        ,endDt:{type:"date"}
                                        ,updtDt:{type:"date"}
                                        ,regDt:{type:"date"}

                                    }
                                }
                            }
                        }
                        ,dataBound:function(e) {

                            // 저장완료후 해당 번호로 다시 조회 ( grid dataBound 에서 처리 )
                            var grid = $("#custCareMgmtGrid").data("kendoExtGrid")
                            , rows = grid.tbody.find("tr")
                            , gridData
                            , selectRow

                            //console.log("isGridReload:" + isGridReload);

                            if ( isGridReload && dms.string.isNotEmpty(resultKey) ) {

                                rows.each(function(index, row) {

                                    gridData = grid.dataSource.at(index);

                                    if ( gridData.custCareSeq === resultKey ) {

                                        selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(index);
                                        grid.select(selectRow);
                                    }

                                });

                                isGridReload = false;

                            }

                        }
                        ,change:function(e){

                            var selectedItem = this.dataItem(this.select());
                            custCareSeq = selectedItem.custCareSeq;

                            console.log("selectedItem:",selectedItem)
                            if (dms.string.isNotEmpty(custCareSeq)) {

                                $("#btnDelete").data("kendoButton").enable(true);

                                var sysDate = "${sysDate}"+" 00:00:00";
                                var dateCompare = false;

                                // 오늘날짜 - 시작일 비교 ( 시작일이 지났으면 true )
                                if ( sysDate >= selectedItem.startDt ) {
                                    dateCompare = true;
                                };

                                // 대상자 추출 버튼 활성화:날짜 체크 ( 자동/수동여부에 상관없이 추출이 시작되면 조건이 바뀌면 안됨 )
                                if ( !dateCompare && selectedItem.custExtrAutoYn === "N" && selectedItem.useYn === "Y" ) {
                                    $("#btnRcpeExtr").data("kendoButton").enable(true);
                                }else{
                                    $("#btnRcpeExtr").data("kendoButton").enable(false);
                                }



                            }

                        }
                        //,autoBind:false
                        ,editable:false
                        ,height:519
                        ,navigatable:false
                        ,selectable:"row"
                        ,columns:[
                            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                                ,attributes:{"class":"ac"}
                            }
                            ,{field:"custCareNm", title:"<spring:message code='crm.lbl.custCareNm' />", width:100}            /* 고객케어명 */
                            ,{field:"custCareCont", title:"<spring:message code='crm.lbl.custCareCont' />", width:100}        /* 고객케어내용 */
                            ,{field:"activeTpCd", title:"<spring:message code='crm.lbl.activeTpCd' />", width:100             /* 실행유형 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= activeTpCdArrVal(activeTpCd)#'
                            }
                            ,{field:"activeTmplId", title:"<spring:message code='crm.lbl.activeTmplId' />", width:100         /* SMS템플릿 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= smsTemplateArrVal(activeTmplId)#'
                            }
                            ,{field:"custExtrAutoYn", title:"<spring:message code='crm.lbl.custExtrAutoYn' />", width:110      /* 고객추출자동여부*/
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"custExtrCycleCont", title:"<spring:message code='crm.lbl.custExtrCycleCont' />", width:110}      /* 고객추출주기*/
                            ,{field:"useYn", title:"<spring:message code='crm.lbl.useYn' />", width:60                        /* 사용여부*/
                                , attributes:{"class":"ac"}
                            }
                            ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:100}             /* 등록자 */
                            ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:100                    /* 등록일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                            }
                            ,{field:"custExtrTermNo", title:"<spring:message code='crm.lbl.custExtrTermNo' />", width:100             /* 고객추출조건 */
                                , sortable:false, attributes:{"class":"ac"}
                                , template:'#= custExtrTermNoArrVal(custExtrTermNo)#'
                                , hidden:true
                            }
                            ,{field:"startDt", title:"<spring:message code='crm.lbl.startDt' />", width:100                    /* 시작일 */
                                , attributes:{"class":"ac"}
                                , format:"{0:<dms:configValue code='dateFormat' />}"
                                , hidden:true
                            }
                        ]
                    });
                    // 고객캐어미션 그리드 종료

                });

            </script>