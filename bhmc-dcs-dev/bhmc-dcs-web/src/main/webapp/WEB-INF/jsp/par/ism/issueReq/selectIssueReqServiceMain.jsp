<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 출고요청 서비스 테스트 관리(테스트 페이지 입니다.) -->
<div class="table_form" role="search" data-btnid="btnSearch">
    <table>
        <caption></caption>
        <colgroup>
            <col style="width:12%;">
            <col style="width:22%;">
            <col style="width:12%;">
            <col style="width:21%;">
            <col style="width:12%;">
            <col style="width:21%;">
        </colgroup>
        <tbody>
            <tr>
                <th scope="row">딜러코드</th>
                <td>
                    <input id="sDlrCd" readonly class="form_input form_readonly" style="width:150px" value="${dlrCd}" />
                </td>
                <th scope="row">부품요청문서번호</th>
                <td>
                    <input id="sParReqDocNo" class="form_input" style="width:150px" maxlength="20"  />
                </td>
                <th scope="row">부품출고유형</th>
                <td>
                    <input id="sParGiTp" style="width:150px" />
                </td>
            </tr>
            <tr>
                <th scope="row">부품요청상태코드</th>
                <td>
                    <input id="sParReqStatCd" style="width:150px" />
                </td>
                <th scope="row">취소여부</th>
                <td>
                    <input id="sCancYn" style="width:150px" />
                </td>
                <th scope="row">RO번호</th>
                <td>
                    <input id="sRoDocNo" class="form_input" style="width:150px" maxlength="18"  />
                </td>
            </tr>
            <tr>
                <th scope="row">예약문서번호</th>
                <td>
                    <input id="sResvDocNo" class="form_input" style="width:150px" maxlength="20"  />
                </td>
                <th scope="row">센터코드</th>
                <td>
                    <input id="sPltCd" readonly class="form_input form_readonly" style="width:150px" value="${pltCd}" />
                </td>
                <th scope="row">서비스담당자ID</th>
                <td>
                    <input id="sSerPrsnId" class="form_input" style="width:150px" />
                </td>
            </tr>
            <tr>
                <th scope="row">고객코드</th>
                <td>
                    <input id="sCustCd" class="form_input" style="width:150px" value="BP0000000000001" />
                </td>
                <th scope="row">고객명</th>
                <td>
                    <input id="sCustNm" class="form_input" style="width:150px" value="홍길동" />
                </td>
                <th scope="row">차대번호</th>
                <td>
                    <input id="sVinNo" class="form_input" style="width:150px" value="VIN0000000000001" />
                </td>
            </tr>
            <tr>
                <th scope="row">차량번호</th>
                <td>
                    <input id="sCarNo" class="form_input" style="width:150px" value="서울34 가 1234" />
                </td>
                <th scope="row">&nbsp;</th>
                <td>
                    &nbsp;
                </td>
                <th scope="row">&nbsp;</th>
                <td>
                    &nbsp;
                </td>
            </tr>

        </tbody>
    </table>
</div>

<!-- // 탭 시작 -->
    <div id="tabstrip" class="tab_area">
        <ul>
            <li id ="tabTargetRevReserve" class="k-state-active"><spring:message code="par.title.revReserve" /><!-- 서비스예약 --></li>
            <li id ="tabTargetRevRo"><spring:message code="par.title.revRo" /><!-- 서비스RO --></li>
            <li id ="tabTargetRevParts"><spring:message code="par.title.revParts" /><!-- 부품판매 --></li>
        </ul>
        <!--서비스예약 탭 영역 -->
        <div>
            <div class="btn_right_absolute">
                <button id="btnPartsAdd01" class="btn_s btn_add">부품추가01</button>
                <button id="btnPartsDel01" class="btn_s btn_delete">부품삭제01</button>
                <button id="btnPartsReq01" class="btn_s btn_delete">부품요청01</button>
            </div>
            <div class="table_grid">
                <!-- 서비스예약 그리드 -->
                <div id="targetRevReserveGrid" ></div>
                <!-- 서비스예약 그리드 -->
            </div>

        </div>
        <!--서비스RO 탭 영역 -->
        <div>
            <div class="btn_right_absolute">
                <button id="btnPartsAdd02" class="btn_s btn_add">부품추가02</button>
                <button id="btnPartsDel02" class="btn_s btn_delete">부품삭제02</button>
                <button id="btnPartsReq02" class="btn_s btn_delete">부품요청02</button>
            </div>
            <div class="table_grid">
                <!-- 서비스RO 그리드 -->
                <div id="targetRevRoGrid" ></div>
                <!-- 서비스RO 그리드 -->
            </div>
        </div>
        <!--부품판매 탭 영역 -->
        <div>
            <div class="btn_right_absolute">
                <button id="btnPartsAdd03" class="btn_s btn_add">부품추가03</button>
                <button id="btnPartsDel03" class="btn_s btn_delete">부품삭제03</button>
                <button id="btnPartsReq03" class="btn_s btn_delete">부품요청03</button>
            </div>
            <div class="table_grid">
                <!-- 부품판매 그리드 -->
                <div id="targetRevPartsGrid" ></div>
                <!-- 적용부품판매제외 그리드 -->
            </div>
        </div>

    </div>
    <!-- // 탭 종료 -->

<!-- 출고요청 서비스 테스트 관리 -->

<!-- script -->
<script>

//위탁서 유형
var parGiTpList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var parGiTpMap = [];
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//부품출고유형상태(상태)
var partsParReqStatCdList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var partsParReqStatCdMap = [];
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});

var cancYnDs = [];
<c:forEach var="obj" items="${cancYnDs}">
    cancYnDs.push({"usrCd":"${obj.usrCd}", "usrNm":"${obj.usrNm}"});
</c:forEach>

var selectTabId;
// 부품 팝업 열기 함수.
var searchItemPopupWindow;
function selectPartsMasterPopupWindow(){

    searchItemPopupWindow = dms.window.popup({
        windowId:"searchItemPopupWindow"
        ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
        ,content:{
            url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"selectable":"multiple"
                ,"dlrCd":"${dlrCd}"
                ,"itemCd":$("#sItemCd").val()
                ,"callbackFunc":function(data){
                    if(data.length > 0)
                    {
                        var itemDs = null;

                        if(selectTabId == "tabTargetRevRo")
                        {
                            insertRevRo(data);
                        }
                        else if(selectTabId == "tabTargetRevParts")
                        {
                            insertRevParts(data);
                        }
                        else
                        {
                            insertRevReserve(data);

                        }
                    }
                }
            }
        }
    });
}

function insertRevReserve(dataList)
{
    // 예약접수 그리드
    var itemDs = $("#targetRevReserveGrid").data("kendoExtGrid").dataSource;

    $.each(dataList, function(idx, data){

        var bCheck = false;
        var iRowCnt = itemDs.total();

        for(var i = 0 ;i < iRowCnt ;i++)
        {
            var vRowData = itemDs.at(i);
            var vRowItemCd = vRowData.itemCd;

            // 공급처 유무 확인.
            if(data.itemCd == vRowItemCd)
            {
                bCheck = true;
                break;
            }
        }

        // 항목 없을 때 추가
        if(bCheck == false)
        {
            console.log("부품데이타:", data);

            var iNextRowCnt = iRowCnt+ 1;

            $("#targetRevReserveGrid").data("kendoExtGrid").dataSource.add({
                "rnum":iNextRowCnt
                ,"dlrCd":""
                ,"pltCd":""
                ,"parReqDocNo":$("#sParReqDocNo").val()
                ,"parReqDocLineNo":iNextRowCnt
                ,"parReqStatCd":$("#sParReqStatCd").val()
                ,"cancYn":$("#sCancYn").val()
                ,"parGiTp":$("#sParGiTp").val()
                ,"roDocNo":$("#sRoDocNo").val()
                ,"roLineNo":iNextRowCnt
                ,"resvDocNo":$("#sResvDocNo").val()
                ,"resvDocLineNo":iNextRowCnt
                ,"grStrgeCd":data.grStrgeCd // 입고창고
                ,"giStrgeCd":data.giStrgeCd // 출고창고
                ,"itemCd":data.itemCd
                ,"itemNm":data.itemNm
                ,"reqQty":1
                ,"unitCd":data.stockUnitCd
                ,"endQty":0
                ,"reqStrgeCd":data.grStrgeCd // 요청창고
                ,"regUsrId":null
                ,"regDt":null
                ,"updtUsrId":null
                ,"updtDt":null
            });

        }

    });
}

function insertRevRo(dataList)
{
    // RO 그리드
    var itemDs = $("#targetRevRoGrid").data("kendoExtGrid").dataSource;

    $.each(dataList, function(idx, data){

        var bCheck = false;
        var iRowCnt = itemDs.total();

        for(var i = 0 ;i < iRowCnt ;i++)
        {
            var vRowData = itemDs.at(i);
            var vRowItemCd = vRowData.itemCd;

            // 공급처 유무 확인.
            if(data.itemCd == vRowItemCd)
            {
                bCheck = true;
                break;
            }
        }

        // 항목 없을 때 추가
        if(bCheck == false)
        {
            console.log("부품데이타:", data);

            var iNextRowCnt = iRowCnt+ 1;

            $("#targetRevRoGrid").data("kendoExtGrid").dataSource.add({
                "rnum":iNextRowCnt
                ,"dlrCd":""
                ,"pltCd":""
                ,"parReqDocNo":$("#sParReqDocNo").val()
                ,"parReqDocLineNo":iNextRowCnt
                ,"parReqStatCd":$("#sParReqStatCd").val()
                ,"cancYn":$("#sCancYn").val()
                ,"parGiTp":$("#sParGiTp").val()
                ,"roDocNo":$("#sRoDocNo").val()
                ,"roLineNo":iNextRowCnt
                ,"resvDocNo":$("#sResvDocNo").val()
                ,"resvDocLineNo":iNextRowCnt
                ,"grStrgeCd":data.grStrgeCd // 입고창고
                ,"giStrgeCd":data.giStrgeCd // 출고창고
                ,"itemCd":data.itemCd
                ,"itemNm":data.itemNm
                ,"reqQty":1
                ,"unitCd":data.stockUnitCd
                ,"endQty":0
                ,"reqStrgeCd":data.grStrgeCd // 요청창고
                ,"regUsrId":null
                ,"regDt":null
                ,"updtUsrId":null
                ,"updtDt":null
            });

        }

    });
}

function insertRevParts(dataList)
{
    // 부품판매
    var itemDs = $("#targetRevPartsGrid").data("kendoExtGrid").dataSource;
}

// 구매요청 전달.
function insertIssueReq(flag)
{
    var grid = null;
    var rows = null;
    var dateItems = [ ];
    var rowCnt = 0;

    if(flag == "02")
        grid = $("#targetRevRoGrid").data("kendoExtGrid");
    else if(flag == "03")
        grid = $("#targetRevPartsGrid").data("kendoExtGrid");
    else
        grid = $("#targetRevReserveGrid").data("kendoExtGrid");

    rows = grid.select();
    rowCnt = rows.length;

    console.log("줄갯수:"+rowCnt);

    if(grid.gridValidation()){

        if(rowCnt == 0){
            dms.notification.info("저장할 정보가 없습니다.");
            return;
        }

        // 체크된 리스트 추출.
        //dateItems = grid.dataItem(rows);

        $.each(rows, function(idx, row){
            dateItems.push(grid.dataItem(row));
        });

        //console.log("데이타 리스트:"+kendo.stringify(dateItems));
        //var multiPurcCostSgstes = { insertList:[], updateList:[dateItems], deleteList:[] };

        var issueReqVO = {
            dlrCd:""
            ,parReqDocNo:$("#sParReqDocNo").val()
            ,parGiTp:$("#sParGiTp").val()
            ,parReqStatCd:$("#sParReqStatCd").val()
            ,cancYn:$("#sCancYn").val()
            ,roDocNo:$("#sRoDocNo").val()
            ,resvDocNo:$("#sResvDocNo").val()
            ,pltCd:""
            ,serPrsnId:$("#sSerPrsnId").val()
            ,custCd:$("#sCustCd").val()
            ,custNm:$("#sCustNm").val()
            ,vinNo:$("#sVinNo").val()
            ,carNo:$("#sCarNo").val()
            ,regUsrId:null
            ,regDt:null
            ,updtUsrId:null
            ,updtDt:null
        }

        var issueReqSaveVO = { "issueReqVO":issueReqVO, "issueReqDetailVO":dateItems }

        //console.log("issueReqSaveVO", issueReqSaveVO);
        //console.log("issueReqSaveVO:"+kendo.stringify(issueReqSaveVO));

        $.ajax({
            url:"<c:url value='/par/ism/issueReq/insertIssueReqes.do' />"
            ,data:JSON.stringify(issueReqSaveVO)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(jqXHR, textStatus){
                //console.log("jqXHR:", jqXHR);
                //console.log("textStatus:", textStatus);

                grid.dataSource.read();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    }else{
        //입력값을 확인하여 주십시오.
        dms.notification.warning("<spring:message code='global.info.check.input'/>");
    }
}

    $(document).ready(function() {

        // 부품추가01.
        $("#btnPartsAdd01").kendoButton({
            enable:true
            ,click:function(e){

                selectPartsMasterPopupWindow();
            }
        });
        // 부품삭제01.
        $("#btnPartsDel01").kendoButton({
            enable:true
            ,click:function(e){

                var grid = $("#targetRevReserveGrid").data("kendoExtGrid");
                var rows = grid.select();
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });

            }
        });
        // 부품요청01.
        $("#btnPartsReq01").kendoButton({
            enable:true
            ,click:function(e){
                // 부품요청(예약접수)
                insertIssueReq("01");
            }
        });

        // 부품추가02.
        $("#btnPartsAdd02").kendoButton({
            enable:true
            ,click:function(e){

                selectPartsMasterPopupWindow();
            }
        });
        // 부품삭제02.
        $("#btnPartsDel02").kendoButton({
            enable:true
            ,click:function(e){

                var grid = $("#targetRevRoGrid").data("kendoExtGrid");
                var rows = grid.select();
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });
        // 부품요청02.
        $("#btnPartsReq02").kendoButton({
            enable:true
            ,click:function(e){
                // 부품요청(RO)
                insertIssueReq("02");
            }
        });

        // 부품추가03.
        $("#btnPartsAdd03").kendoButton({
            enable:true
            ,click:function(e){
              //selectPartsMasterPopupWindow();
            }
        });
        // 부품삭제03.
        $("#btnPartsDel03").kendoButton({
            enable:true
            ,click:function(e){

                var grid = $("#targetRevPartsGrid").data("kendoExtGrid");
                var rows = grid.select();
                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });
        // 부품요청03.
        $("#btnPartsReq03").kendoButton({
            enable:true
            ,click:function(e){
                // 부품요청(부품판매)
                //insertIssueReq("03");
            }
        });

        // 구매요청유형 드랍다운 리스트.
        $("#sParReqStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partsParReqStatCdList
            ,autoBind:false
            ,index:0
        });

        // 출고유형 드랍다운 리스트.
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parGiTpList
            ,autoBind:false
            ,index:0
        });

        // 취소유형 드랍다운 리스트.
        $("#sCancYn").kendoExtDropDownList({
            dataTextField:"usrNm"
            ,dataValueField:"usrCd"
            ,dataSource:cancYnDs
            ,autoBind:false
            ,index:0
        });

        // 탭
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                selectTabId = e.item.id;
            }
        });

        // 서비스예약 적용대상 그리드.
        $("#targetRevReserveGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;
                            params["sParGiTp"] = "SR";
                            /*
                            params["sItemCd"] = $("#sItemCd").val();                    // 품목코드.

                            params["sParReqStatCd"] = $("#sParReqStatCd").val();        // 부품요청상태.
                            params["sParReqDocNo"] = $("#sParReqDocNo").val();          // 부품요청문서번호.
                            params["sResvDocNo"] = $("#sResvDocNo").val();              // 예약문서번호. */

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} , editable:false }
                            ,dlrCd:{ type:"string" , validation:{required:true} , editable:false }
                            ,pltCd:{ type:"string" , editable:false }
                            ,parReqDocNo:{ type:"string" }
                            ,parReqDocLineNo:{ type:"number" , editable:false }
                            ,parReqStatCd:{ type:"string" }
                            ,cancYn:{ type:"string" }
                            ,parGiTp:{ type:"string" }
                            ,roDocNo:{ type:"string", editable:false }
                            ,roLineNo:{ type:"number" }
                            ,resvDocNo:{ type:"string" , editable:true}
                            ,resvDocLineNo:{ type:"number" , editable:false }
                            ,grStrgeCd:{ type:"string" }
                            ,giStrgeCd:{ type:"string" }
                            ,itemCd:{ type:"string" , editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true} , editable:false }
                            ,reqQty:{ type:"number" }
                            ,unitCd:{ type:"string" , editable:false }
                            ,endQty:{ type:"number" , editable:false }
                            ,reqStrgeCd:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"string" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"string" }
                        }
                    }
                }
            }
            ,editable:{
                mode:"incell"
                ,confirmation:false
            }
            ,pageable:false
            ,multiSelectWithCheckbox:true
            ,columns :
                [{ field:"rnum", title:"번호", width:40 }                  //번호
                ,{ field:"dlrCd", title:"딜러코드", width:70 }             //딜러코드
                ,{ field:"parReqDocNo", title:"부품요청문서", width:80 }    //부품요청문서
                ,{ field:"parReqDocLineNo", title:"Line", width:40 }      //Line
                ,{ field:"parReqStatCd", title:"상태", width:50 ,template:'#if(parReqStatCd !== ""){# #= partsParReqStatCdMap[parReqStatCd]# #}#'}          //부품요청상태코드
                ,{ field:"cancYn", title:"취소여부", width:60 }            //취소여부
                ,{ field:"parGiTp", title:"부품출고유형", width:80 ,template:'#if(parGiTp !== ""){# #= parGiTpMap[parGiTp]# #}#'}       //부품출고유형
                ,{ field:"roDocNo", title:"RO일련번호", width:80 }          //RO일련번호
                ,{ field:"roLineNo", title:"Line", width:40 }            //RO라인번호
                ,{ field:"resvDocNo", title:"예약문서번호", width:80 }     //예약문서번호
                ,{ field:"resvDocLineNo", title:"Line", width:40 }       //예약문서라인번호
                ,{ field:"grStrgeCd", title:"입고창고", width:80 }        //입고창고코드
                ,{ field:"giStrgeCd", title:"출고창고", width:80 }        //출고창고코드
                ,{ field:"itemCd", title:"품목코드", width:100 }           //품목코드
                ,{ field:"itemNm", title:"품목명", width:150 }            //품목명
                ,{ field:"reqQty", title:"요청수량", width:60 }          //요청수량
                ,{ field:"unitCd", title:"단위코드", width:60 }          //단위코드
                ,{ field:"endQty", title:"완료수량", width:60 }          //완료수량
                ,{ field:"reqStrgeCd", title:"요청창고코드", width:80 }   //요청창고코드
                ]
        });

        // 서비스RO 적용대상 그리드.
        $("#targetRevRoGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sort"] = options.sort;
                            params["sParGiTp"] = "RO";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} , editable:false }
                            ,dlrCd:{ type:"string" , validation:{required:true} , editable:false }
                            ,pltCd:{ type:"string" , editable:false }
                            ,parReqDocNo:{ type:"string" }
                            ,parReqDocLineNo:{ type:"number" , editable:false }
                            ,parReqStatCd:{ type:"string" }
                            ,cancYn:{ type:"string" }
                            ,parGiTp:{ type:"string" }
                            ,roDocNo:{ type:"string" }
                            ,roLineNo:{ type:"number" }
                            ,resvDocNo:{ type:"string" }
                            ,resvDocLineNo:{ type:"number" , editable:false }
                            ,grStrgeCd:{ type:"string" }
                            ,giStrgeCd:{ type:"string" }
                            ,itemCd:{ type:"string" , editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true} , editable:false }
                            ,reqQty:{ type:"number" }
                            ,unitCd:{ type:"string" , editable:false }
                            ,endQty:{ type:"number" , editable:false }
                            ,reqStrgeCd:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"string" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"string" }
                        }
                    }
                }
            }
            ,editable:{
                mode:"incell"
                ,confirmation:false
            }
            ,pageable:false
            ,multiSelectWithCheckbox:true
            ,columns:[
                { field:"rnum", title:"번호", width:40 }                  //번호
                ,{ field:"dlrCd", title:"딜러코드", width:70 }             //딜러코드
                ,{ field:"parReqDocNo", title:"부품요청문서", width:80 }    //부품요청문서
                ,{ field:"parReqDocLineNo", title:"Line", width:40 }      //Line
                ,{ field:"parReqStatCd", title:"상태", width:50 }          //부품요청상태코드
                ,{ field:"cancYn", title:"취소여부", width:60 }            //취소여부
                ,{ field:"parGiTp", title:"부품출고유형", width:80 }       //부품출고유형
                ,{ field:"roDocNo", title:"RO일련번호", width:80 }          //RO일련번호
                ,{ field:"roLineNo", title:"Line", width:40 }            //RO라인번호
                ,{ field:"resvDocNo", title:"예약문서번호", width:80 }     //예약문서번호
                ,{ field:"resvDocLineNo", title:"Line", width:40 }       //예약문서라인번호
                ,{ field:"grStrgeCd", title:"입고창고", width:80 }        //입고창고코드
                ,{ field:"giStrgeCd", title:"출고창고", width:80 }        //출고창고코드
                ,{ field:"itemCd", title:"품목코드", width:100 }           //품목코드
                ,{ field:"itemNm", title:"품목명", width:150 }            //품목명
                ,{ field:"reqQty", title:"요청수량", width:60 }          //요청수량
                ,{ field:"unitCd", title:"단위코드", width:60 }          //단위코드
                ,{ field:"endQty", title:"완료수량", width:60 }          //완료수량
                ,{ field:"reqStrgeCd", title:"요청창고코드", width:80 }   //요청창고코드
            ]
        });

        // 부품판매 적용대상 그리드.
        $("#targetRevPartsGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sParGiTp"] = "03";                                  // TODO:부품출고유형 정의 해야 함.

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} , editable:false }
                            ,dlrCd:{ type:"string" , validation:{required:true} , editable:false }
                            ,pltCd:{ type:"string" , editable:false }
                            ,parReqDocNo:{ type:"string" }
                            ,parReqDocLineNo:{ type:"number" , editable:false }
                            ,parReqStatCd:{ type:"string" }
                            ,cancYn:{ type:"string" }
                            ,parGiTp:{ type:"string" }
                            ,roDocNo:{ type:"string" , editable:false }
                            ,roLineNo:{ type:"number" }
                            ,resvDocNo:{ type:"string" }
                            ,resvDocLineNo:{ type:"number" , editable:false }
                            ,giStrgeCd:{ type:"string" }
                            ,itemCd:{ type:"string" , editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true} , editable:false }
                            ,reqQty:{ type:"number" }
                            ,unitCd:{ type:"string" , editable:false }
                            ,endQty:{ type:"number" , editable:false }
                            ,reqStrgeCd:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"string" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"string" }
                        }
                    }
                }
            }
            ,pageable:false
            ,multiSelectWithCheckbox:true
            ,columns :
                [{ field:"rnum", title:"번호", width:40 }                  //번호
                ,{ field:"dlrCd", title:"딜러코드", width:70 }             //딜러코드
                ,{ field:"parReqDocNo", title:"부품요청문서", width:80 }    //부품요청문서
                ,{ field:"parReqDocLineNo", title:"Line", width:40 }      //Line
                ,{ field:"parReqStatCd", title:"상태", width:50 }          //부품요청상태코드
                ,{ field:"cancYn", title:"취소여부", width:60 }            //취소여부
                ,{ field:"parGiTp", title:"부품출고유형", width:80 }       //부품출고유형
                ,{ field:"roDocNo", title:"RO일련번호", width:80 }          //RO일련번호
                ,{ field:"roLineNo", title:"Line", width:40 }            //RO라인번호
                ,{ field:"resvDocNo", title:"예약문서번호", width:80 }     //예약문서번호
                ,{ field:"resvDocLineNo", title:"Line", width:40 }       //예약문서라인번호
                ,{ field:"giStrgeCd", title:"출고창고코드", width:80 }     //출고창고코드
                ,{ field:"itemCd", title:"품목코드", width:100 }           //품목코드
                ,{ field:"itemNm", title:"품목명", width:150 }            //품목명
                ,{ field:"reqQty", title:"요청수량", width:60 }          //요청수량
                ,{ field:"unitCd", title:"단위코드", width:60 }          //단위코드
                ,{ field:"endQty", title:"완료수량", width:60 }          //완료수량
                ,{ field:"reqStrgeCd", title:"요청창고코드", width:80 }   //요청창고코드
                ,{ field:"" }
                ]
        });

    });
</script>
<!-- //script -->