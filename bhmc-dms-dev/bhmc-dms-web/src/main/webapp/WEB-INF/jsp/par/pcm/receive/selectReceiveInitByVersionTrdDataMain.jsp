<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 기초재고입고 V3 -->
<div id="resizableContainer">
    <section class="group" id="iniStockSection">
    <div class="header_area">
        <div class="btn_left">
            <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
        </div>
        <div class="btn_right">
            <button class="btn_m" id="btnCnfm"><spring:message code="par.btn.confirm" /><!-- 확정 --></button>
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!--조회  --></button>
        </div>
    </div>
    <div class="table_form" id="headerForm">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">
                        <span class="bu_required"><spring:message code="par.lbl.otherGrTp" /><!-- 기타입고유형 --></span>
                    </th>
                    <td class="required_area">
                        <input id="mvtTp" name="mvtTp" type="text" data-type="combo" required data-name="<spring:message code="par.lbl.otherGiTp" />" class="form_comboBox">
                    </td>
                    <th scope="row">
                        <span class="bu_required"><spring:message code="par.lbl.sBpCd" /><!-- 공급업체 --></span>
                    </th>
                    <td class="required_area">
                        <input id="bpCd" class="form_input form_required form_readonly" readonly>
                        <input id="bpTp" name="bpTp" class="form_input hidden" />
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.sBpNm" /><!-- 공급업체 -->
                    </th>
                    <td>
                        <input type="text" id="bpNm" class="form_input form_readonly" readonly>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.applyYn" /><!-- 입고적용여부 --></th>
                    <td>
                        <input id="sApplyYn" class="form_comboBox" />
                        <input id="remark" type="text" value="" class="form_input form_readonly hidden" readonly/>
                        <input id="updtDtStr" type="text" class="form_input hidden"/>
                        <input type="text" id="etcGrDocNo" class="form_input form_readonly hidden" readonly />
                    </td>
                </tr>
                <tr class="hidden">
                    <th scope="row">
                        <spring:message code="par.lbl.itemQty" />
                        <!-- 수량총계 -->
                    </th>
                    <td>
                        <input id="itemQty" data-type="number" class="form_numeric" readonly />
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.itemCnt" /><!-- 품목수 -->
                    </th>
                    <td>
                      <input id="itemCnt" data-type="number" class="form_numeric" readonly>
                    </td>
                    <th scope="row">
                        <spring:message code="par.lbl.amt" /><!-- 금액총계 -->
                    </th>
                    <td>
                        <input id="grTotAmt" data-type="number" class="form_numeric" readonly />
                    </td>
                    <th scope="row"></th>
                    <td>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area mt10">
        <!-- 탭메뉴 -->
        <ul>
            <li id="tabOtherHeader" class="k-state-active"><spring:message code="par.title.partsInitStock3rd" /><!-- 기초재고입고V3 --></li>
            <li id="tabOtherHeaderPartOut"><spring:message code="par.title.partsInitStockOut3rd" /><!-- 기초재고출고V3 --></li>
        </ul>
        <div class="mt0"><!-- tab01 -->
            <section class="group">
                <div class="header_area">
                </div>
                <div class="table_grid">
                    <div id="grid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
        <div class="mt0"><!-- tab02 -->
            <section class="group">
                <div class="header_area">
                </div>
                <div class="table_grid">
                    <div id="gridPartOut" class="resizable_grid"></div>
                </div>
            </section>
        </div>
    </div>
    </section>
</div>
<!-- // 기초재고입고 V3 -->
<!-- script -->
<script>
    var sessionDlrCd = "${dlrCd}",
    sessionDlrNm = "${dlrNm}",
    selectTabId = "",
    strgeTpObj = {},
    strgeTpList = [],
    applyYnList = [],
    applyYnMap = {},
    mvtTpList = [],
    existItemChkObj = {},
    pEtcGrDocNo = {},
    receiveEtcListPopupWindow;

    <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
        if("31" === "${obj.cmmCd}"){
            mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
    </c:forEach>

    strgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${applyYnList}">
        applyYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        applyYnMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    function initPage(){
        var grid = $("#grid").data("kendoExtGrid");
        var gridPartOut = $("#gridPartOut").data("kendoExtGrid");

        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#gridPartOut").data("kendoExtGrid").dataSource.data([]);

        $("#itemCnt").closest(".k-numerictextbox").addClass("form_readonly");
        $("#itemCnt").data("kendoExtNumericTextBox").enable(false);
        $("#grTotAmt").closest(".k-numerictextbox").addClass("form_readonly");
        $("#grTotAmt").data("kendoExtNumericTextBox").enable(false);
        $("#itemQty").closest(".k-numerictextbox").addClass("form_readonly");
        $("#itemQty").data("kendoExtNumericTextBox").enable(false);

        $("#mvtTp").data("kendoExtDropDownList").enable(false);
        $("#mvtTp").data("kendoExtDropDownList").value("31");//수불유형

        $("#bpCd").val(sessionDlrCd);//공급처코드
        $("#bpNm").val(sessionDlrNm);//공급처명
        $("#bpTp").val("03");//공급처유형 : 기타

        //부품존재체크 Json
        existItemChkObj = {};
    }

    // 조달입고리스트 팝업 열기 함수.
    function selectReceiveEtcListPopupWindow(){

        receiveEtcListPopupWindow = dms.window.popup({
            windowId:"receiveEtcListPopupWindow"
            ,title:"<spring:message code='par.title.etcReceiveInfo' />"   // 기타입고정보
            ,content:{
                url:"<c:url value='/par/cmm/selectReceiveEtcListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"mvtTp":$("#mvtTp").data("kendoExtDropDownList").value()
                    ,"mvtTpNm":$("#mvtTp").data("kendoExtDropDownList").text()
                    ,"bpCd":$("#bpCd").val()
                    ,"bpNm":$("#bpNm").val()
                    ,"initDataYn":'Y'
                    ,"callbackFunc":function(data){

                        if(data.length > 0){
                            $("#etcGrDocNo").val(data[0].etcGrDocNo);
                            pEtcGrDocNo = data[0].etcGrDocNo;
                            selectEtcReceive(pEtcGrDocNo);
                        }

                        receiveEtcListPopupWindow.close();
                    }
                }
            }
        });
    }

    // 부품기타입고 정보 조회.
    function selectEtcReceive(pEtcGrDocNo){

        $.ajax({
            url:"<c:url value='/par/pcm/receive/selectReceiveEtcByKey.do' />",
            data:JSON.stringify({ sEtcGrDocNo:pEtcGrDocNo}),
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }

        }).done(function(result) {

            $("#grid").data("kendoExtGrid").dataSource.page(1);
            $("#gridPartOut").data("kendoExtGrid").dataSource.page(1);

            $("#bpCd").val(sessionDlrCd);
            $("#bpNm").val(sessionDlrNm);
            $("#bpTp").val("03");

        });
    }
    //order receive popup Func
    var issueReceivePopupButtonWindow;
    function selectIssueReceivePopupButtonWindow(){
        issueReceivePopupButtonWindow = dms.window.popup({
            windowId:"issueReceivePopupButtonWindow"
            ,title:""
            ,width:500
            ,height:400
            ,modal:true
            ,content:{
                url:"<c:url value='/par/ism/issueReq/selectIssueReceiveCheckDetailPopup.do'/>"
                ,data:{
                    "callbackFunc":function(data){
                        //receive y or n
                        if(data.flag == "Y"){

                            insertIssuePartsOutAutoInves(data.receiveNm);

                        }
                    }
                }
            }
        });
    }
    //기초재고입고 정비수령 자동출고 함수.
    function insertIssuePartsOutAutoInves(receiveId){

        $.ajax({
            url:"<c:url value='/par/ism/issueReq/insertIssuePartsOutAutoInves.do' />"
            ,data:kendo.stringify({"sDlrCd":"","sReceiveId":receiveId})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,async:true
            ,success:function() {

                $("#gridPartOut").data("kendoExtGrid").dataSource.read();
                //parts Out complete message.
                dms.notification.success("<spring:message code='par.lbl.releaseComf' var='releaseComf' /><spring:message code='global.info.successMsg' arguments='${releaseComf}' />");

            }
            ,beforeSend:function(){
                dms.loading.show($("#iniStockSection"));
            }
            ,complete:function(){
                dms.loading.hide($("#iniStockSection"));
            }
            ,error:function(jqXHR,status,error) {
                console.log("error : ", jqXHR);
            }
       });
    }

$(document).ready(function() {
    //기타출고유형선택
    $("#mvtTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:mvtTpList
        ,index:0
    });
    //parReqStatCd dropdownlist
    $("#sApplyYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:applyYnList
        ,optionLabel:" "
        ,autoBind:false
        ,index:0
    });
    //총계
    $("#grTotAmt").kendoExtNumericTextBox({
        format:"n2"
        ,spinners:false
    });
    //총수량
    $("#itemCnt").kendoExtNumericTextBox({
        format:"n0"
        ,spinners:false
    });
    //총품목수
    $("#itemQty").kendoExtNumericTextBox({
        format:"n2"
        ,spinners:false
    });
    // 초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
            pEtcGrDocNo = '';
            initPage();
        }
    });
    //확정 버튼
    $("#btnCnfm").kendoButton({
        click:function(e){

            var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
            var tabIndex = tabStrip.select().index();

            if(tabIndex === 0){//stockIn
                var grid = $("#grid").data("kendoExtGrid"),
                rows = grid.tbody.find("tr"),
                mvtType = $("#mvtTp").data("kendoExtDropDownList").value(),
                header;

                if(dms.string.isEmpty($("#bpCd").val())){
                    // 딜러를 선택하십시오
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
                    saveList = [];
                    return false;
                }

                header = {
                    mvtTp:mvtType
                    ,etcGrDocNo:$('#etcGrDocNo').val()
                    ,bpCd:$("#bpCd").val()
                    ,remark:$("#remark").val()
                    ,updtDtStr:$("#updtDtStr").val()
                };

                $.ajax({
                    url:"<c:url value='/par/pcm/receive/insertReceiveEtcVerThd.do' />"
                    ,data:kendo.stringify(header)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,async:true
                    ,success:function(result) {

                        if (result.resultYn === true) {
                            $("#grid").data("kendoExtGrid").dataSource.page(1);
                            dms.notification.success("<spring:message code='par.lbl.initStockReceiveDocNo' var='etcGrDocNo' /><spring:message code='global.info.regSuccessParam' arguments='${etcGrDocNo}'/>");
                        }else{
                            if(result === 0){
                                dms.notification.error("<spring:message code='par.lbl.parSaleOrdNo' var='parSaleOrdNo' /><spring:message code='global.info.cnfmFailedParam' arguments='${parSaleOrdNo}'/>");
                            }
                        }
                    }
                    ,beforeSend:function(){
                        dms.loading.show($("#iniStockSection"));
                    }
                    ,complete:function(){
                        dms.loading.hide($("#iniStockSection"));
                    }
                    ,error:function(jqXHR,status,error) {
                        console.log("error : ", jqXHR);
                    }
               });

            }else if(tabIndex === 1){//stockOut
                //수령인팝업 호출 후 자동출고 처리.
                selectIssueReceivePopupButtonWindow();
            }else{

            }


        }
    });
    // 조회 버튼
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.page(1);
            $("#gridPartOut").data("kendoExtGrid").dataSource.page(1);
        }
    });
    //tabstrip
    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select: function(e) {
            selectTabId = e.item.id;
        }
    });
    //기타입고문서.
    $("#searchEtcGrDocNo").on("click", selectReceiveEtcListPopupWindow);
    //부품기타입고등록 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-PAR-0807-140299"
        ,height:480
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/receive/selectReceiveEtcVerThdesByCondition.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if(operation === "read"){

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]          = options.page;
                        params["firstIndex"]         = options.skip;
                        params["lastIndex"]          = options.skip + options.take;
                        params["sort"]               = options.sort;

                        //기타입고(정비수령) 검색조건 코드.
                        params["sApplyYn"] = $("#sApplyYn").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                total:"total"
                ,model:{
                    id:"seqNo"
                    ,fields:{
                        dlrCd : {type:"string", editable:false}
                        ,seqNo : {type:"number", editable:false}
                        ,strgeCd : {type:"string", editable:false}
                        ,pltCd : {type:"string", editable:false}
                        ,itemCd : {type:"string", editable:false}
                        ,grScheQty : {type:"number", editable:false}
                        ,giScheQty : {type:"number", editable:false}
                        ,giAmt : {type:"number", editable:false}
                        ,giDt : {type:"date", editable:false}
                        ,applyYn : {type:"string", editable:false}
                        ,applyDt : {type:"date", editable:false}
                        ,stockAmt : {type:"number", editable:false}
                        ,parReqDocNo : {type:"string", editable:false}
                        ,roDocNo : {type:"string", editable:false}
                        ,roLineNo : {type:"number", editable:false}
                        ,applyGiYn : {type:"string", editable:false}
                        ,applyGiDt : {type:"date", editable:false}
                        ,regUsrId : {type:"string", editable:false}
                        ,regDt : {type:"date", editable:false}
                        ,updtUsrId : {type:"string", editable:false}
                        ,updtDt : {type:"date", editable:false}
                    }
                }
            }
        }
        ,selectable:"multiple"
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true//빈컬럼 적용. default:false
        ,editable:false
        ,columns:[
            {field:"seqNo" ,title:"<spring:message code='par.lbl.seq' />" ,attributes:{ "class":"ac"} ,width:50}//일련번호
            ,{field:"dlrCd" ,title:"<spring:message code='global.lbl.dlrCd' />" ,width:70}//딜러코드
            ,{field:"strgeCd" ,title:"<spring:message code='global.lbl.strgeCd' />" ,width:80}//창고코드
            ,{field:"pltCd" ,title:"<spring:message code='global.lbl.pltCd' />" ,width:70}//센터코드
            ,{field:"roDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:130}//RO문서번호
            ,{field:"roLineNo", title:"<spring:message code='par.lbl.roDocLineNo'/>", width:90, attributes:{ "class":"ar"}}//RO라인번호
            ,{field:"itemCd", title:"<spring:message code='global.lbl.itemCd' />" ,width:120}//품목코드
            ,{field:"grScheQty", title:"<spring:message code='par.lbl.grScheQty' />" ,width:80 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//입고예정수량
            ,{field:"giScheQty", title:"<spring:message code='par.lbl.giScheQty' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//출고예정수량
            ,{field:"giAmt", title:"<spring:message code='par.lbl.giAmt' />" ,width:140 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//최신입고가
            //,{field:"giDt", title:"<spring:message code='par.lbl.giDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//최신입고일자
            ,{field:"applyDt", title:"<spring:message code='par.lbl.applyDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:80}//적용일자
            ,{field:"stockAmt", title:"<spring:message code='par.lbl.stockPrice' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//재고금액
            ,{field:"applyYn", title:"<spring:message code='par.lbl.applyYn' />" ,attributes:{ "class":"ac"} ,width:80
                ,template:'#if(applyYnMap[applyYn] !== undefined){# #= applyYnMap[applyYn]# #}#'
            }//적용여부
         ]
     });
     //부품기타출고등록 그리드
    $("#gridPartOut").kendoExtGrid({
        gridId:"G-PAR-0814-175701"
        ,height:480
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/receive/selectReceiveEtcVerThdesByCondition.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if(operation === "read"){

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //기타입고(정비수령) 검색조건 코드.
                        params["sApplyGiYn"] = $("#sApplyYn").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                total:"total"
                ,model:{
                    id:"seqNo"
                    ,fields:{
                        dlrCd : {type:"string", editable:false}
                        ,seqNo : {type:"number", editable:false}
                        ,strgeCd : {type:"string", editable:false}
                        ,pltCd : {type:"string", editable:false}
                        ,itemCd : {type:"string", editable:false}
                        ,grScheQty : {type:"number", editable:false}
                        ,giScheQty : {type:"number", editable:false}
                        ,giAmt : {type:"number", editable:false}
                        ,giDt : {type:"date", editable:false}
                        ,applyYn : {type:"string", editable:false}
                        ,applyDt : {type:"date", editable:false}
                        ,stockAmt : {type:"number", editable:false}
                        ,parReqDocNo : {type:"string", editable:false}
                        ,roDocNo : {type:"string", editable:false}
                        ,roLineNo : {type:"number", editable:false}
                        ,applyGiYn : {type:"string", editable:false}
                        ,applyGiDt : {type:"date", editable:false}
                        ,regUsrId : {type:"string", editable:false}
                        ,regDt : {type:"date", editable:false}
                        ,updtUsrId : {type:"string", editable:false}
                        ,updtDt : {type:"date", editable:false}
                    }
                }
            }
        }
        ,selectable:"multiple"
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true//빈컬럼 적용. default:false
        ,editable:false
        ,columns:[
            {field:"seqNo" ,title:"<spring:message code='par.lbl.seq' />" ,attributes:{ "class":"ac"} ,width:50}//일련번호
            ,{field:"dlrCd" ,title:"<spring:message code='global.lbl.dlrCd' />" ,width:70}//딜러코드
            ,{field:"strgeCd" ,title:"<spring:message code='global.lbl.strgeCd' />" ,width:80}//창고코드
            ,{field:"pltCd" ,title:"<spring:message code='global.lbl.pltCd' />" ,width:70}//센터코드
            ,{field:"roDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:130}//RO문서번호
            ,{field:"roLineNo", title:"<spring:message code='par.lbl.roDocLineNo'/>", width:90, attributes:{ "class":"ar"}}//RO라인번호
            ,{field:"itemCd", title:"<spring:message code='global.lbl.itemCd' />" ,width:120}//품목코드
            ,{field:"grScheQty", title:"<spring:message code='par.lbl.grScheQty' />" ,width:80 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//입고예정수량
            ,{field:"giScheQty", title:"<spring:message code='par.lbl.giScheQty' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//출고예정수량
            ,{field:"giAmt", title:"<spring:message code='par.lbl.giAmt' />" ,width:140 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//최신입고가
            //,{field:"giDt", title:"<spring:message code='par.lbl.giDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//최신입고일자
            ,{field:"applyGiDt", title:"<spring:message code='par.lbl.applyDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:80}//적용일자
            ,{field:"stockAmt", title:"<spring:message code='par.lbl.stockPrice' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//재고금액
            ,{field:"applyGiYn", title:"<spring:message code='par.lbl.applyYn' />" ,attributes:{ "class":"ac"} ,width:80
                ,template:'#if(applyYnMap[applyGiYn] !== undefined){# #= applyYnMap[applyGiYn]# #}#'
            }//적용여부
         ]
     });


     initPage();
});

</script>
<!-- //script -->

