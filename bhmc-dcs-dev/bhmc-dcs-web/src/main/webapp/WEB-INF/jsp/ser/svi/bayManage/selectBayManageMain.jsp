<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 소조관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.bayMng" /><!-- BAY관리 --></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </div>
    </div>
    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_40per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="ser.lbl.bayNo" /><!-- BAY NO --></th>
                    <td>
                        <input id="sBayNo" type="text" class="form_input" maxlength="10"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.bayMngNm" /><%-- BAY 관리자 --%></th>
                    <td>
                        <input id="sAdmSaNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- Grid 시작 -->
    <div class="table_grid mt10">
        <div id="gridMaster"></div>
    </div>
    <!-- Grid 종료-->

    <!-- Bay정보 -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_add" id="btnBayInit"><spring:message code="global.btn.init" /></button>
            <button class="btn_s btn_save" id="btnBaySave"><spring:message code="global.btn.save" /></button>
            <button class="btn_s btn_del" id="btnBayDel"><spring:message code="global.btn.del" /></button>
        </div>
    </div>

    <form id="bayManageForm" name="bayManageForm" method="POST" action="/">
    <input type="hidden" id="dlrCd" name="dlrCd" value="${dlrCd}" data-json-obj="true">
    <div class="table_form form_width_50per">
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
                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.bayNo" /><!-- BAY NO --></span></th>
                    <td class="required_area">
                        <input id="bayNo" name="bayNo" data-json-obj="true" type="text" class="form_input" required maxlength="10" data-name="<spring:message code="ser.lbl.bayNo" />" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.bayTp" /><!-- BAY구분 --></th>
                    <td>
                        <input id="bayTp" name="bayTp" data-json-obj="true" class="form_comboBox"/>
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.bayMngNm" /><!-- BAY 관리자 --></span></th>
                    <td class="required_area">
                        <div class="form_search">
                            <input id="admSaNm" name="admSaNm" type="text" data-json-obj="true" class="form_input" required data-name="<spring:message code="ser.lbl.bayMngNm" />">
                            <a href="javascript:techmanPopup();"></a>
                        </div>
                        <input id="admSaId" name="admSaId" type="hidden" data-json-obj="true" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.rpirTp" /><!-- 수리유형 --></th>
                    <td>
                        <input id="rpirTp" name="rpirTp" data-json-obj="true" class="form_comboBox"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.useYn" /><!-- 사용여부 --></th>
                    <td>
                        <input id="useYn" name="useYn" data-json-obj="true" class="form_comboBox"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.vrYn" /><!-- 가상여부 --></th>
                    <td>
                        <input id="vrYn" name="vrYn" data-json-obj="true" class="form_comboBox"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.eqmCd" /><!-- 설비번호 --></th>
                    <td>
                        <input id="eqmCd" name="eqmCd" type="text" class="form_input" data-json-obj="true"/>
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.eqmNm" /><!-- 설비명 --></th>
                    <td colspan="3">
                        <input id="eqmNm" name="eqmNm" type="text" class="form_input" data-json-obj="true"/>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.bayInfo" /><!-- BAY 내역 --></th>
                    <td colspan="5">
                        <input id="bayNm" name="bayNm" type="text" data-json-obj="true" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
    <!-- //Bay정보 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_add" id="btnDetailAdd"><spring:message code="global.btn.rowAdd" /></button>
            <button class="btn_s btn_del" id="btnDetailDel"><spring:message code="global.btn.rowDel" /></button>
        </div>
    </div>
     <!-- Grid 시작 -->
    <div class="table_grid">
        <div id="gridDetail"></div>
    </div>
    <!-- Grid 종료-->

</section>
<!-- //원인 코드마스터 -->

<!-- script -->
<script type="text/javascript">

    //공통코드:BAY구분
    var bayTpCdList = [];
    <c:forEach var="obj" items="${bayTpCdList}">
    bayTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    var bayTpCdArr = dms.data.arrayToMap(bayTpCdList, function(obj){return obj.cmmCd});

    // 공통코드:수리유형
    var rpirTpCdList = [];
    <c:forEach var="obj" items="${rpirTpCdList}">
    rpirTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>

    //공통코드:BAY상세구분
    var bayGrpTpCdList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${bayGrpTpCdList}">
    bayGrpTpCdList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach> 
    
    var bayGrpTpCdArr = dms.data.arrayToMap(bayGrpTpCdList, function(obj){return obj.cmmCd});
    
  //공통코드:사용여부
    var useYnList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${userYnList}">
    useYnList.push({
        "cmmCd":"${obj.cmmCd}"
        , "cmmCdNm":"${obj.cmmCdNm}"
    });
    </c:forEach>
    
    var wkgrpSearchPopup;
    
  //그리드 선택 Row
    var gridSelectedRow = 0;
    var selectedYn = false;

    $(document).ready(function() {

        // 검색
        $("#btnSearch").kendoButton({
            click:function(e) {
                $("#gridMaster").data("kendoExtGrid").dataSource.read();
            }
        });

        // 수리유형
        $("#rpirTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:rpirTpCdList
            ,optionLabel:" "
            ,index:0
        });

        // 구분
        $("#bayTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bayTpCdList
            ,optionLabel:" "
            ,index:0
        });

        // 김경목 - 추후변경
        // 사용여부
        $("#useYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:1
        });

        // 가상여부
        $("#vrYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:useYnList
            ,index:1
        });

        $("#gridMaster").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/ser/svi/bayManage/selectBayManages.do' />"
                    }
                    ,parameterMap:function(options, operation)
                    {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = "${dlrCd}";
                            params["sBayNo"] = $("#sBayNo").val();
                            params["sAdmSaNm"] = $("#sAdmSaNm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                       id:"rnum"
                       ,fields:{
                           rnum:{type:"number"}
                           ,bayNo:{ type:"string" }
                           ,dlrCd:{ type:"string" }
                           ,bayNm:{ type:"string" }
                           ,rpirTp:{ type:"string" }
                           ,modNm:{ type:"string" }
                           ,bayTp:{ type:"string" }
                           ,bayTpNm:{ type:"string" }
                           ,useYn:{ type:"string" }
                           ,strgeCd:{ type:"string" }
                           ,strgeNm:{ type:"string" }
                           ,admSaId:{ type:"string" }
                           ,admSaNm:{ type:"string" }
                           ,vrYn:{ type:"string" }
                      }
                   }
                }
            }
            ,height:160
            ,editable:false
            ,pageable:false
            ,selectable:"row"
            ,dataBound:function(e) {
                if(selectedYn ){
                    e.sender.select(e.sender.tbody.find("tr")[gridSelectedRow]);
                }
            }
            ,change:function(e) {

                if(!e.sender.dataItem(e.sender.select()).isNew()){

                    var selectedVal = this.dataItem(this.select());
                    var bayNo = selectedVal.bayNo;
                    var dlrCd = selectedVal.dlrCd;

                    $.ajax({
                        url:"<c:url value='/ser/svi/bayManage/selectBayMasterByKey.do' />",
                        data:JSON.stringify({sBayNo:bayNo, sDlrCd:dlrCd}),
                        type:"POST",
                        dataType:"json",
                        contentType:"application/json",
                        error:function(request,status,error){
                            //globalNotification.show('에러발생:'+ error, 'error');
                        }

                    }).done(function(result) {
                        $("#bayNo").val(result["bayNo"]);
                        $("#admSaNm").val(result["admSaNm"]);
                        $("#bayNm").val(result["bayNm"]);
                        $("#bayTp").data("kendoExtDropDownList").value(result["bayTp"]);
                        $("#rpirTp").data("kendoExtDropDownList").value(result["rpirTp"]);
                        $("#useYn").data("kendoExtDropDownList").value(result["useYn"]);
                        $("#vrYn").data("kendoExtDropDownList").value(result["vrYn"]);
                        $("#vrYn").data("kendoExtDropDownList").value(result["vrYn"]);
                        $("#eqmCd").val(result["eqmCd"]);
                        $("#eqmNm").val(result["eqmNm"]);

                        $("#btnDetailAdd").data("kendoButton").enable(true);
                        $("#btnDetailDel").data("kendoButton").enable(true);

                        var gridDetail = $("#gridDetail").data("kendoExtGrid");
                        gridDetail.dataSource.read();

                    });
                };
            }
            ,columns:[
                {field:"bayTp"
                 ,title:"<spring:message code='ser.lbl.gubun' />", width:80      // 구분
                 ,template:"#=bayTpCdGrid(bayTp)#"
                }
                ,{field:"bayNo", title:"<spring:message code='ser.lbl.bayNo' />", width:60}
                ,{field:"bayNm", title:"<spring:message code='ser.lbl.dtiInfo' />", width:100}
                ,{field:"admSaNm", title:"<spring:message code='ser.lbl.bayMngNm' />", width:100}
            ]
        });

        $("#gridDetail").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/ser/svi/bayManage/selectBayDetails.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sBayNo"] = $("#bayNo").val();

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,dlrCd:{type:"string", editable:false}
                            ,bayGrpTp:{type:"string", editable:false}
                            ,bayNo:{type:"string", editable:false}
                            ,lineNo:{type:"string", validation:{required:true}}
                            ,tecId:{type:"string", validation:{required:true}}
                            ,tecNm:{type:"string"}
                        }
                    }
                }
            }
            ,height:160
            ,pageable:false
            ,autoBind:false
            ,editable:false
            ,columns:[
                {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                ,{field:"bayGrpTp", title:"<spring:message code='ser.lbl.gubun' />", width:100
                    ,template:"#=bayGrpTpCdGrid(bayGrpTp)#"
                }                          // 구분
                ,{field:"lineNo", title:"<spring:message code='ser.lbl.prefRank' />", width:100}                       // 우선순위
                ,{field:"tecId", title:"<spring:message code='ser.lbl.tecId' />", width:100}                           // 테크니션ID
                ,{field:"tecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:150}                           // 테크니션명
                ,{field:"jobNm", title:"<spring:message code='ser.lbl.jobNm' />", width:150}                           // 직무명
            ]
        });

        // 저장/수정
        $("#btnBaySave").kendoButton({
            click:function(e) {

                var validator = $("#bayManageForm").kendoExtValidator().data("kendoExtValidator");
                
                var gridMaster = $("#gridMaster").data("kendoExtGrid")
                var gridDetail = $("#gridDetail").data("kendoExtGrid");
                
                var saveData = gridDetail.getCUDData("insertList", "updateList", "deleteList");

                // form 데이터 및 그리드 변경 데이터 세팅
                var param = $.extend(
                   {"bayMasterVO":$("#bayManageForm").serializeObject($("#bayManageForm").serializeArrayInSelector("[data-json-obj='true']"))}
                   ,{"bayManageSaveVO":saveData}
                )

                if(validator.validate()) {
                    $.ajax({
                        url:"<c:url value='/ser/svi/bayManage/multiBayManages.do' />"
                        ,data:JSON.stringify(param)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    }).done(function(result) {

                        selectedYn = true;
                        gridSelectedRow = gridMaster.select().index();
                        
                        dms.notification.success("<spring:message code='global.info.success'/>");
                        gridMaster.dataSource.read();

                    });
                }
            }
        });

        // 초기화
        $("#btnBayInit").kendoButton({
            click:function(e) {
                bayReset();
            }
        });

        // 삭제
        $("#btnBayDel").kendoButton({
            click:function(e) {
                $.ajax({
                    url:"<c:url value='/ser/svi/workGroupManage/deleteBayManage.do' />"
                    ,data:JSON.stringify({bayNo:$("#bayNo").val(), dlrCd:"${dlrCd}"})
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(request,status,error){
                       //globalNotification.show("에러발생" + error, "error");
                    }
                }).done(function(result) {

                    bayReset();

                });
            }
        });
    });

    // 디테일 추가
    $("#btnDetailAdd").kendoButton({
        click:function(e) {
            wkgrpSearchPopup = dms.window.popup({
                windowId:"teckManFnSearchWin"
                , height:430
                , title:"<spring:message code='ser.title.tecSearch' />"   // 테크니션 조회
                , content:{
                    url:"<c:url value='/ser/cmm/popup/selectTechManTabPopup.do'/>"
                    , data:{
                        "autoBind":true
                        ,"selectable":"multiple"
                        , "callbackFunc":function(jsonObj) {

                            if(jsonObj.length > 0) {

                                var grid = $('#gridDetail').data('kendoExtGrid');
                                var dataItem = grid.dataSource._data;
                                var maxLineNo = 0;

                                $.each(jsonObj, function(idx, data){

                                    var copyData;

                                    // 우선순위 생성
                                    if(grid.dataSource.total() != 0) {
                                        maxLineNo = dataItem[grid.dataSource.total()-1].lineNo;
                                    }

                                    var checkVal = true;

                                    // 중복값 체크
                                    $.each(dataItem, function(idx, obj){
                                        if( (data.tecId == obj.tecId) || (data.wkgrpNo == obj.tecId)){
                                            checkVal = false;
                                        }
                                    });

                                    if(checkVal) {
                                        if(data.tabId=="techTab"){
                                            copyData = {
                                                lineNo:Number(maxLineNo) + 1              // 우선순위
                                                ,bayGrpTp:data.bayGrpTp                   // 구분
                                                ,tecId:data.tecId                         // 테크니션ID
                                                ,tecNm:data.tecNm                         // 테크니션명
                                                ,dlrCd:"${dlrCd}"
                                                ,bayNo:$("#bayNo").val()
                                            }
                                        } else {
                                            copyData = {
                                                lineNo:Number(maxLineNo) + 1              // 우선순위
                                                ,bayGrpTp:data.bayGrpTp                   // 구분
                                                ,tecId:data.wkgrpNo                       // 테크니션ID
                                                ,tecNm:data.mngSaNm                       // 테크니션명
                                                ,dlrCd:"${dlrCd}"
                                                ,bayNo:$("#bayNo").val()
                                            }
                                        }

                                        grid.dataSource.add(copyData);
                                    }


                                });
                            }
                        }
                    }
                }
            });
        }
    });

    // 디테일 삭제
    $("#btnDetailDel").kendoButton({
        click:function(e) {

            var grid = $("#gridDetail").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

        }
    });

    $("#btnDetailAdd").data("kendoButton").enable(false);
    $("#btnDetailDel").data("kendoButton").enable(false);

    // BAY 구분
    bayTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(bayTpCdArr[val] != undefined)
            returnVal = bayTpCdArr[val].cmmCdNm;
        }
        return returnVal;
    }

    // BAY 구분
    bayGrpTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(bayGrpTpCdArr[val] != undefined)
            returnVal = bayGrpTpCdArr[val].cmmCdNm;
        }
        return returnVal;
    }

    // 초기화
    bayReset = function() {

        // Bay번호 추가모드.
        var bayNo = $("#bayNo").prop("disabled", false);

        // 수리유형.
        var rpirTp = $("#rpirTp").data("kendoExtDropDownList");
        rpirTp.select(0);

        // Bay구분.
        var bayTp = $("#bayTp").data("kendoExtDropDownList")
        bayTp.select(0);

        // 사용여부.
        var useYn = $("#useYn").data("kendoExtDropDownList")
        useYn.select(0);

        // 가상여부.
        var vrYn = $("#vrYn").data("kendoExtDropDownList")
        vrYn.select(0);

        $("#bayNo").val("");
        $("#bayNm").val("");
        $("#admSaNm").val("");

        var gridMaster = $("#gridMaster").data("kendoExtGrid");
        gridMaster.dataSource.read();

        // 기술자 상세 리스트 초기화.
        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
    }

    var tecSearchPopup;
    techmanPopup = function() {
        tecSearchPopup = dms.window.popup({
            windowId:"teckManFnSearchWin"
            , title:"<spring:message code='ser.title.tecSearch' />"   // 테크니션 조회
            , content:{
                url:"<c:url value='/ser/cmm/popup/selectTechManFnPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "callbackFunc":function(jsonObj) {

                        if(jsonObj.length > 0) {

                            $("#admSaId").val(jsonObj[0].tecId);
                            $("#admSaNm").val(jsonObj[0].tecNm);
                        }
                    }
                }
            }
        });
    }
</script>
<!-- //script -->


