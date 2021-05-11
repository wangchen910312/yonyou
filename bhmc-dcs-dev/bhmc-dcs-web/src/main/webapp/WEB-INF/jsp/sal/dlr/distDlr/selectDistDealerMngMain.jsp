<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 지역사무소관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.localOfficeMgmt" /></h1><!-- 지역사무소관리 -->
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12367" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnViewDetail" type="button" class="btn_m"><spring:message code='global.btn.detail' /></button>           <!-- 상세 -->
            <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
		</dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
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
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.dept' /><!-- 부서 --></th>
                    <td>
                        <input id="sDeptCd" type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.usrId' /></th>      <!-- 사용자ID -->
                    <td>
                        <input id="sUsrId" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.usrNm' /></th>      <!-- 고객 -->
                    <td>
                        <input id="sUsrNm" class="form_input" />
                    </td>
                    <th scope="row"></th>
                    <td class="bor_none"></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>
</div>

<section id="callDealerWindow" class="pop_wrap">
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.title.dealerInfo' /></h2><!-- 딜러정보 -->
        <div class="btn_right">
            <button id="btnSubSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
        </div>
    </div>
    
    <div class="table_form form_width_40per" role="search" data-btnid="btnSubSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
               <tr>
                    <th scope="row"><spring:message code='sal.lbl.sdpt' /></th><!-- 사업부 -->
                    <td>
                        <input id="sDiviCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.officeNm' /></th><!-- 사무소 -->
                    <td>
                        <input id="sOffCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th><!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" class="form_input" style="text-transform:uppercase;">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="dealerGrid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<!-- script -->
<script type="text/javascript">
var usrId = "";
var gridRows;

//직무공통코드 Array
var dutyCdDs = [];
<c:forEach var="obj" items="${dutyCdList}">
    dutyCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//직무공통코드 Map
var dutyCdMap = dms.data.arrayToMap(dutyCdDs, function(obj){ return obj.cmmCd; });

//부서목록
var deptCdList = [];
<c:forEach var="obj" items="${deptCdList}">
    deptCdList.push({"deptCd":"${obj.deptCd}", "deptNm":"${obj.deptNm}", "useYn":"${obj.useYn}", "cmpTp":"${obj.cmpTp}"});
</c:forEach>
//부서 Map
//var deptCdMap = dms.data.arrayToMap(deptCdList, function(obj){ return obj.deptCd; });

//사업부
var sdptList = [];
<c:forEach var="obj" items="${sdptList}">
    sdptList.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
</c:forEach>

$(document).ready(function() {
    
    // 본문 팝업 설정
    $("#callDealerWindow").kendoWindow({
        animation :false
        ,draggable:true
        ,pinned:true        // 팝업스크롤링 막음
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.title.dealerInfo' />"      // 딜러정보
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow").center();

    // 상세
    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#mainGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){
                usrId = selectedItem.usrId;
                viewDetailPopup();
                $("#dealerGrid").data('kendoExtGrid').dataSource.read();
            } else {
                $("#dealerGrid").data('kendoExtGrid').dataSource.data([]);
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });
    
    // 조회
    $("#btnSearch").kendoButton({
        enable:true,
        click:function(e){
            $('#mainGrid').data('kendoExtGrid').dataSource.read();
            $('#dealerGrid').data('kendoExtGrid').dataSource.data([]);
        }
    });
    
    // 팝업 조회
    $("#btnSubSearch").kendoButton({
        enable:true,
        click:function(e){
            $('#dealerGrid').data('kendoExtGrid').dataSource.read();
        }
    });
    
    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            dms.loading.show();
            
            var grid = $("#dealerGrid").data("kendoExtGrid");
            var mainGrid = $("#mainGrid").data("kendoExtGrid");
            var selectIdx = mainGrid.select().index();
            var rows = grid.tbody.find("tr"), saveList = [];
            rows.each(function(index, row) {
                var item = grid.dataItem(row);
                saveList.push({"chkYn":item.chkYn, "usrId":usrId, "mngDlrCd":item.mngDlrCd});
            });
            var saveVO = {"usrId":usrId, "dealerVO":{"insertList":saveList}};
            
            $.ajax({
                url:"<c:url value='/sal/dlr/distDlr/saveDistDealer.do' />"
                ,data:JSON.stringify(saveVO)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(request,status,error){
                    dms.loading.hide();
                    dms.notification.error(request.responseJSON.errors[0].errorMessage);
                }
                ,success :function(jqXHR, textStatus) {
                    dms.loading.hide();
                    gridRows = selectIdx;
                    grid.dataSource.read();
                    mainGrid.dataSource.read();
                    
                    //수정이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='save' /><spring:message code='global.info.successMsg' arguments='${save},' />");
                }
            });
        }
    });

    /*******************  //버튼   *******************************************/
    
    //사업부
    $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"sdptNm"
       ,dataValueField:"sdptCd"
       ,dataSource:sdptList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOffCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.sdptCd == ""){
               $("#sOffCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           
           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/cmm/selectDealerOffice.do' />"
               ,data :JSON.stringify({"sSdptCd":dataItem.sdptCd})
               ,async :false
           });
           $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           $("#sOffCd").data("kendoExtDropDownList").enable(true);
        }
    });

    // 사무소
    $("#sOffCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
       ,dataValueField:"distOfficeCd"
       ,optionLabel:" "
       ,enable:false
    });

    //조회조건 - 부서
    $("#sDeptCd").kendoExtDropDownList({
        dataSource:deptCdList
        ,dataValueField:"deptCd"
        ,dataTextField:"deptNm"
        ,optionLabel:" "
    });

    //그리드 설정
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0721-113325"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/dlr/distDlr/selectDistDealerMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;
                        
                        params["sUsrId"] = $("#sUsrId").val();
                        params["sUsrNm"] = $("#sUsrNm").val();
                        params["sDeptCd"] = $("#sDeptCd").data("kendoExtDropDownList").value();
                        
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"usrId"
                    ,fields:{
                        usrId :{type:"string"}
                        ,usrNm:{type:"string"}
                        ,dutyCd:{type:"string"}
                        ,deptNm:{type:"string"}
                    }
                }
            }
        }
        ,pageable:false
        ,editable:false
        ,autoBind:true
        ,height:173
        ,dataBound:function(e) {
            if(gridRows != 0){
                e.sender.select(e.sender.tbody.find("tr")[gridRows]);
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                {field:"usrId", title:"<spring:message code = 'global.lbl.usrId'/>", width:120, attributes:{"class":"ac"}} //사용자 ID
                ,{field:"usrNm", title:"<spring:message code = 'sal.lbl.usrNm'/>", width:80, attributes:{"class":"al"}} //성명
                ,{field:"dutyCd", title:"<spring:message code = 'sal.lbl.dutyNm'/>", width:100, attributes:{"class":"ac"}  //담당업무
                    ,template:"# if(dutyCdMap[dutyCd] != null) { # #= dutyCdMap[dutyCd].cmmCdNm# # }#", hidden:true
                 }
                ,{field:"deptNm", title:"<spring:message code='global.lbl.deptNm' />", width:150}
                ]
    });

    // 그리드 더블클릭.
    $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#mainGrid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());

        if( selectedItem != null && selectedItem != 'undefined'){
            $("#btnSave").data("kendoButton").enable(dms.string.strNvl(selectedItem.disabledYn)=="Y"?false:true);
            usrId = selectedItem.usrId;
            viewDetailPopup();
            $("#dealerGrid").data('kendoExtGrid').dataSource.read();
        }else{
            $("#btnSave").data("kendoButton").enable(true);
            $("#dealerGrid").data('kendoExtGrid').dataSource.data([]);
        }
    });
    
    // 메인 더블클릭
    /*
    fn_gridDBclick = function (selectedItem){
        if( selectedItem != null && selectedItem != 'undefined'){
            usrId = selectedItem.usrId;
            
           // dms.loading.show($("#callDealerWindow"));
            
            var dealerGrid = $("#dealerGrid").data("kendoExtGrid");
            var dataSource = dealerGrid.dataSource.view();

            for(i=0;i<dataSource.length;i++){
                var arrUsrId = dataSource[i].usrId;
                var chkUsrId = false ;

                if(arrUsrId != null && arrUsrId != ""){
                    var usrIdVl = arrUsrId.split(",");

                    for(j=0;j<usrIdVl.length;j++){
                        if(usrId == usrIdVl[j]){
                            chkUsrId = true;
                        }
                    }

                    if(chkUsrId == true){
                        $(".grid-checkbox-item[data-uid=" + dealerGrid._data[i].uid + "]").prop("checked", true);
                    }else {
                        $(".grid-checkbox-item[data-uid=" + dealerGrid._data[i].uid + "]").prop("checked", false);
                    }
                }
            }
                        
           // dms.loading.hide($("#callDealerWindow"));
        }
    }
    */

    // 딜러그리드.
    $("#dealerGrid").kendoExtGrid({
        gridId:"G-SAL-0721-113326"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/dlr/distDlr/selectDealer.do' />"
                    , dataType:"json"
                    , type:"POST"
                    , contentType:"application/json;"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sort"] = options.sort;
                        params["sUsrId"]  = usrId;
                        params["sDiviCd"] = $("#sDiviCd").data("kendoExtDropDownList").value();
                        params["sOffCd"]  = $("#sOffCd").data("kendoExtDropDownList").value();
                        params["sDlrCd"]  = $("#sDlrCd").val();
                        
                        return kendo.stringify(params);
                    }
                }
            }
            , schema:{
                model:{
                    id:"dlrCd"
                    ,fields:{
                        chkYn:{type:"string"}
                       ,mngDlrCd:{type:"string"}
                       ,dlrNm:{type:"string"}
                    }
                }
            }
            , requestEnd:function(e){if(e.type =="read"){$(".checkedAll").prop("checked", false);}}
        }
        , editable:false
        , pageable:false
        , height:385
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , appendEmptyColumn:false
        , columns:[
              {field:"chkYn", title:"<spring:message code='global.btn.select' />", width:60,attributes:{"class":"ac"}
                ,template  :"<input type='checkbox' id='chkYn' data-uid='#= uid #' onclick='bf_checkDlr(this, \"#=uid#\")' class='grid-checkbox-item' #= chkYn=='Y' ? checked='checked':'' # />"
                ,headerTemplate:"<input type='checkbox' class='checkedAll'/>"
                ,filterable:false, sortable:false
              }//선택
             ,{field:"mngDlrCd" ,title:"<spring:message code = 'global.lbl.dlrCd'/>", width:200 ,attributes:{"class":"ac"}}  //딜러코드
             ,{field:"dlrNm" ,title:"<spring:message code = 'global.lbl.dlrNm'/>", width:500  ,attributes:{"class":"al"}}  //딜러명
             ,{_field:"_empty" ,title:"&nbsp;", width:100  ,filterable:false}  // 공백
            ]
    });

    
    $(document).on("click", ".checkedAll", function(e){
        var grid = $("#dealerGrid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");

        if(checked){
            rows.each(function(index, row) {
                var chkObj = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]");
                chkObj.prop("checked", true);
                bf_checkDlr(chkObj[0], $(this).attr("data-uid"));
            });
        }else{
            rows.each(function(index, row) {
                var chkObj = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]"); 
                chkObj.prop("checked", false);
                bf_checkDlr(chkObj[0], $(this).attr("data-uid"));
            });
        }
    });

});

bf_checkDlr = function(obj, uidVal){
    var grid = $("#dealerGrid").data("kendoExtGrid");
    var selectRow = grid.dataSource.getByUid(uidVal);
    
    if(obj.checked){
        selectRow[obj.id] = "Y";
    }else{
        selectRow[obj.id] = "N";
    }
    selectRow["dirty"] = true;
}

//상세내용 팝업 호출
function viewDetailPopup(){
    reFreshAll();
    var win = $("#callDealerWindow").data("kendoWindow").open();
}

// 검색 초기화
function reFreshAll(){
    $("#sDiviCd").data("kendoExtDropDownList").value("");
    $("#sOffCd").data("kendoExtDropDownList").value("");
    $("#sDlrCd").val("");
}

function isUser(usrId, obj){
    var isReturn = false; 
    
    $.each(obj, function(index, row) {
        if(usrId === row ){
            isReturn = true;
        }
    });
    return isReturn;
}

</script>
<!-- //script -->