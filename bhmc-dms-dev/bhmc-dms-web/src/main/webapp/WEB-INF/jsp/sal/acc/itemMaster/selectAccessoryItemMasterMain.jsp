<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 용품마스터 관리 -->
<div id="resizableContainer">
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.accessoryItemMaster" /><!-- 용품마스터 --></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10976" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-10975" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_new" id="btnNew"><spring:message code="global.btn.new" /><!-- 신규 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-10974" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.goodsCd" /><!-- 용품코드 --></th>
                    <td>
                        <input id="sItemCd" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.goodsName" /><!-- 용품명칭 --></th>
                    <td>
                        <input id="sItemNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.goodsGubun" /><!-- 용품유형 --></th>
                    <td>
                        <input id="sEtcCd1" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.endYn" /><!-- 사용중지 --></th>
                    <td>
                        <input id="sEndYn" type="text" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.bpTp" /><!-- 업체유형 --></th>
                    <td>
                        <input id="sBpTp" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.bpNm" /><!-- 공급업체명 --></th>
                    <td>
                        <input id="sBpNm" type="text" class="form_input" >
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<script type="text/javascript">
//용품유형 목록
var etcCd1List = [];
<c:forEach var="obj" items="${etcCd1List}">
etcCd1List.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//용품유형 Map
var etcCd1Map = dms.data.arrayToMap(etcCd1List, function(obj){ return obj.cmmCd; });

//공급업체유형 목록
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//공급업체유형 Map
var bpTpMap = dms.data.arrayToMap(bpTpList, function(obj){ return obj.cmmCd; });

//용품정보 상세 팝업 화면을 출력한다.
function openAccessoryItemMasterDetailPopup(itemCd){
    dms.window.popup({
        windowId:"accessoryItemMasterDetailPopup"
        ,title:"<spring:message code='sal.lbl.goodsInfo'/>" //용품정보
        ,height:350
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/acc/itemMaster/selectAccessoryItemMasterDetailPopup.do?itemCd="+itemCd+"'/>"
            ,data:{
                "callbackFunc":function(){
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                }
            }
        }
    });
}

//용품정보 상세 팝업 화면에서 업체정보 조회 팝업 화면을 출력한다.
var venderSearchPopupWin;
function selectVenderMasterSearchPopup(itemMasterViewModel){
    venderSearchPopupWin = dms.window.popup({
        windowId:"venderSearchPopupWin"
        ,modal:true
        ,title:"<spring:message code='ser.title.venderSelect'/>" //거래처 조회
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"bpTp":"03"//기타
                ,"callbackFunc":function(data){
                    itemMasterViewModel.set("bpCd", data[0].bpCd);
                    itemMasterViewModel.set("bpNm", data[0].bpNm);

                    venderSearchPopupWin.close();
                }
            }
        }
    });
}

$(document).ready(function() {
    //조회조건 - 용품유형
    $("#sEtcCd1").kendoExtDropDownList({
         dataSource:etcCd1List
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 공급업체유형
    $("#sBpTp").kendoExtDropDownList({
         dataSource:bpTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 사용중지
    $("#sEndYn").kendoExtDropDownList({
         dataSource:["Y", "N"]
        ,optionLabel:" "
        ,index:0
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 신규
    $("#btnNew").kendoButton({
        click:function(e) {
            openAccessoryItemMasterDetailPopup("");
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.required.select'/>");
                return;
            }

            var dataItem = grid.dataItem(rows);

            if(dataItem.spyrCd != "02"){
                //로컬부품만 삭제 가능합니다.
                dms.notification.warning("<spring:message code='par.err.deleteOnlyLocalItem' />");
                return false;
            }

            dms.window.confirm({
                message:"<spring:message code='par.info.delYn' />"
                ,width:300
                ,callback:function(result){
                    if(result){
                        $.ajax({
                            url:"<c:url value='/sal/acc/itemMaster/deleteAccessoryItemMaster.do' />",
                            data:JSON.stringify({
                                 "itemCd":dataItem.itemCd
                                ,"dlrCd":dataItem.dlrCd
                                ,"spyrCd":dataItem.spyrCd
                                ,"endYn":dataItem.endYn
                                ,"prndYn":dataItem.prndYn
                                ,"dgrItemYn":dataItem.dgrItemYn
                            })
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            }
                            ,success:function(jqXHR, textStatus) {
                                $("#grid").data("kendoExtGrid").dataSource.page(1);

                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                        });
                    }
                }
            });
        }
    });

    //그리드 더블클릭시 용품정보 팝업 화면을 오픈한다.
    $("#grid").on("dblclick", "tr.k-state-selected", function(e){
        var grid = $(e.delegateTarget).data("kendoExtGrid");
        var row = grid.select();

        if(row.length > 0){
            openAccessoryItemMasterDetailPopup(grid.dataItem(row).itemCd);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0127-184401"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemMaster/selectAccessoryItemMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sEtcCd1"] = $("#sEtcCd1").val();
                        params["sEndYn"]  = $("#sEndYn").val();
                        params["sBpTp"]   = $("#sBpTp").val();
                        params["sBpNm"]   = $("#sBpNm").val();
                        params["sBmpYn"]  = "Y";
                        params["sStrgeDupYn"]  = "N";

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                         dlrCd:{type:"string"}          //딜러코드
                        ,itemCd:{type:"string"}         //용품코드
                        ,itemNm:{type:"string"}         //용품명
                        ,itemEnNm:{type:"string"}       //용품영문명
                        ,etcCd1:{type:"string"}         //용품유형
                        ,stockUnitCd:{type:"string"}    //단위
                        ,bpCd:{type:"string"}           //공급업체코드
                        ,bpNm:{type:"string"}           //공급업체명
                        ,etc1:{type:"string"}           //생산공장
                        ,endYn:{type:"string"}          //사용중지
                        ,startDt:{type:"date"}          //유효시작일
                        ,endDt:{type:"date"}            //유효종료일
                    }
                }
            }
        }
        ,editable:false
        ,sortable:true
        ,appendEmptyColumn:true
        ,columns:[
              {field:"itemCd", title:"<spring:message code='sal.lbl.goodsCd' />", width:120} //용품코드
             ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm' />", width:250}  //용품명
             ,{field:"itemEnNm", title:"<spring:message code='sal.lbl.itemEnNm' />", width:200}  //용품영문명
             ,{field:"etcCd1", title:"<spring:message code='sal.lbl.goodsGubun' />", width:150  //용품유형
                 ,template:"# if(etcCd1Map[etcCd1] != null) { # #= etcCd1Map[etcCd1].cmmCdNm# # }#"
             }
             ,{field:"stockUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:60, attributes:{"class":"ac"}}    //단위
             ,{field:"bpTp", title:"<spring:message code='sal.lbl.bpTp' />", width:80   //공급업체유형 -> 업체유형
                 ,template:"# if(bpTpMap[bpTp] != null) { # #= bpTpMap[bpTp].cmmCdNm# # }#"
             }
             ,{field:"bpCd", title:"<spring:message code='sal.lbl.bpCd' />", width:120} //공급업체코드 > 업체코드
             ,{field:"bpNm", title:"<spring:message code='global.lbl.bpNm' />", width:250}  //공급업체명
             ,{field:"etc1", title:"<spring:message code='sal.lbl.prodFactory' />", width:200}   //생산공장
             ,{field:"endYn", title:"<spring:message code='sal.lbl.endYn' />", width:60, attributes:{"class":"ac"}}    //사용중지
             ,{field:"startDt", title:"<spring:message code='sal.lbl.validStartDt' />", width:100, attributes:{"class":"ac"} //유효시작일
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
             ,{field:"endDt", title:"<spring:message code='sal.lbl.validEndDt' />", width:100, attributes:{"class":"ac"}   //유효종료일
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
             }
        ]
    });
});
</script>