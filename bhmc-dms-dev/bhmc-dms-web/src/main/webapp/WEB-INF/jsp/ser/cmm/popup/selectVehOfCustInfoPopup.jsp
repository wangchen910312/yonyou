<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_left">
            <button type="button" id="init" class="btn_m btn_reset"><spring:message code="global.btn.init" /><!-- 초기화 --></button>
        </div>
        <div class="btn_right">
            <button type="button" id="btnCustNew" class="btn_m btn_New"><spring:message code="global.btn.new" /></button>
            <button type="button" id="btnCustUpdate" class="btn_m btnUpdate" style="display:none;"><spring:message code="global.btn.update" /></button>
            <button type="button" id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <%-- <button type="button" id="btnVerify" class="btn_m verify" style="display:none;"><spring:message code="ser.btn.verify" /></button> --%>
            <button type="button" id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div id="searchDiv" class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="reqField"><spring:message code='ser.lbl.carNo' /></span></th><!-- 차량번호 -->
                    <td>
                        <input id="sCarNo" name="sCarNo" class="form_input" style="text-transform:uppercase"/>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carlineNm' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" name="sCarlineCd" class="form_comboBox"/>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.telNo' /></th><!-- 휴대전화 -->
                    <td class="useable">
                        <input id="sTelNo" name="sTelNo" class="form_input cust" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="reqField" class=""><spring:message code='ser.lbl.vinNo' /></span></th><!-- VIN -->
                    <td>
                        <input id="sVinNo" name="sVinNo" class="form_input" maxlength="17" style="text-transform:uppercase"/>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.carOwner' /></th><!-- 고객명 -->
                    <td class="useable">
                        <input id="sCustNm" name="sCustNm" class="form_input cust" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.hpNo' /></th><!-- 휴대전화 -->
                    <td class="useable">
                        <input id="sHpNo" name="sHpNo" class="form_input cust" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div>
        <div class="table_grid mt10">
            <div id="grid" class="grid"></div>
        </div>
    </div>
    <input type="hidden" id="sLinkType" name="sLinkType">
</section>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->


<script type="text/javascript">

var popupUrl ="<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfo.do' />";
var sanbaoYn;
var selectTabId;

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

/** 브랜드 코드 **/
var brandCdList = [];
<c:forEach var="obj" items="${brandCdDs}">
    brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){return obj.cmmCd});

//브랜드 코드
getBrandCdMap = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(brandCdMap[val] != undefined)
            returnVal = brandCdMap[val].cmmCdNm;
    }
    return returnVal;
};

    $(document).ready(function() {


        /* $("#custList").kendoExtTabStrip({
            animation:false
            ,select: function(e) {
                selectTabId = e.item.id;
                if(selectTabId == "DMS"){
                    $("#searchDiv").attr("data-btnid", "btnSearch");
                    $("#btnCustNew").show();
                    $("#btnSearch").show();
                    $("#btnCustUpdate").show();
                    $("#btnVerify").hide();
                    $(".cust").attr("readonly", false);
                    $(".useable").removeClass("readonly_area");
                    $(".reqField").removeClass("bu_required");
                    $(".reqField").removeClass("bu_required");
                } else {
                    $("#searchDiv").attr("data-btnid", "btnVerify");
                    $("#btnCustNew").hide();
                    $("#btnSearch").hide();
                    $("#btnCustUpdate").hide();
                    $("#btnVerify").show();
                    $(".cust").attr("readonly", true);
                    $(".reqField").addClass("bu_required");
                    $(".reqField").addClass("bu_required");
                    $(".useable").addClass("readonly_area");

                }
            }
        }); */

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
        var parentData = parent.vehOfCustInfoSearchPopup.options.content.data;

        var sanbaoYn = (parentData.sanboCust == undefined) ? "N":"Y";
        var preFixId = parentData.preFixId;
        var newEnableYn = parentData.newEnableYn;
        var newEnableYn = parentData.newEnableYn;

        if(parentData.hasOwnProperty("newEnableYn")){
            if(newEnableYn == "Y"){
                $("#btnCustNew").attr("style","display:none");
            }
        }

        if(sanbaoYn == "Y"){
            popupUrl = "<c:url value='/ser/cmm/vehOfCustInfo/selectSanbaoVehOfCustInfo.do' />";
        }else{
            popupUrl = "<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfo.do' />";
        }


        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });

        /************************************************************
                조회조건 설정
        *************************************************************/
        if (parentData.vinNo) {
            $("#sVinNo").val(parentData.vinNo);
        }
        if (parentData.carRegNo) {
            $("#sCarNo").val(parentData.carRegNo);
        }
        if (parentData.carOwnerNm) {
            $("#sCustNm").val(parentData.carOwnerNm);
        }
        if (parentData.linkType) {
            $("#sLinkType").val(parentData.linkType);
        }

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.page(1);
            }
        });

        // 초기화
        $("#init").kendoButton({
            click:function(e) {
                $("#sVinNo").val("");
                $("#sCarNo").val("");
                $("#sCustNm").val("");
                $("#sHpNo").val("");
                $("#sTelNo").val("");
                $("#sLinkType").val("");
                $("#sCarlineCd").data("kendoExtDropDownList").value("");
            }
        });

        // 신규 버튼.
        $("#btnCustNew").kendoButton({
            click:function(e){

                var data = {
                    "isNew":"new"
                };
                parentData.callbackFunc(data);
                parent.vehOfCustInfoSearchPopup.close();
            }
        });

        // 수정 버튼.
        $("#btnCustUpdate").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var row = grid.dataItem(grid.select());

                if(row != null) {
                    var data = {
                        "isNew":"update"
                        ,"carId":row.carId
                        ,"vinNo":row.vinNo
                    };
                    parentData.callbackFunc(data);
                    parent.vehOfCustInfoSearchPopup.close();
                } else {
                    dms.notification.info("<spring:message code='global.info.targetInput'  />");
                    return false;
                }
            }
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if(rows !== null)
                {
                    var data = [];
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });
                    parentData.callbackFunc(data);
                    parent.vehOfCustInfoSearchPopup.close();
                }
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.vehOfCustInfoSearchPopup.close();
            }
        });

        //차종
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carLineCdList
           ,optionLabel:" "   // 전체
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-SER-1011-000039"
            ,dataSource:{
                 transport:{
                    read:{
                        url:popupUrl
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sVinNo"] = $("#sVinNo").val();
                            params["sCarNo"] = $("#sCarNo").val();
                            params["sCustNm"] = $("#sCustNm").val();
                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sHpNo"] = $("#sHpNo").val();
                            params["sTelNo"] = $("#sTelNo").val();
                            params["sPreFixId"] = preFixId;
                            params["sLinkType"] = $("#sLinkType").val();

                            if(parentData.hasOwnProperty("sOwnCarYn")){
                                if(parentData.sOwnCarYn == "Y"){
                                    params["sOwnCarYn"] = parentData.sOwnCarYn;
                                }
                            }

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
                             vinNo:{type:"string"}
                            ,carRegNo:{type:"string"}
                            ,carOwnerNm:{type:"string"}
                            ,carOwnerTelNo:{type:"string"}
                            ,carOwnerHpNo:{type:"string"}
                        }
                    }
                }
            }
            ,autoBind:false
            ,selectable:parentData.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,sortable:false
            ,pageable:{
                         pageSize:30
                        ,pageSizes:[ "30", "50", "100", "200" ]
                        }
            ,height:350
            ,columns:[
                 {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100}          //차량번호
                 ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:180 ,attributes:{"class":"ac"}}//VIN
                 ,{field:"carBrandCd", title:"<spring:message code='ser.lbl.brandNm' />", width:100
                     ,attributes:{"class":"ac"}
                     ,template:"#=getBrandCdMap(ncarDstinCd)#"
                 }         //브랜드명
                 ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}       //차종명칭
                 ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}           //모델명칭
                 ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}       //고객명
                 ,{field:"carOwnerTelNo", title:"<spring:message code='ser.lbl.tel' />", width:100}         //전화번호
                 ,{field:"carOwnerHpNo", title:"<spring:message code='ser.lbl.hpNo' />", width:100}         //휴대전화
                 ,{field:"driverNm", title:"<spring:message code='ser.lbl.driverCust' />", width:100, hidden:true}          //운전자
                 ,{field:"driverHpNo", title:"<spring:message code='global.lbl.driverHpNo' />", width:100, hidden:true}     //운전자휴대폰
                ]
        });

        if(parentData.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

</script>
