<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<!-- 20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 start -->
<!--<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()%>" /> -->
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- 20191219 update by sunzq3 去掉安卓判断操作系统逻辑,将手机平板判断合起来 end -->

<!-- //khskhs  문제시 삭제 -->

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <button id="btnClose" class="btn_m btn_Clost"><spring:message code="global.btn.close" /></button>
        </div>
    </div>

    <div class="table_form form_width_50per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:40%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.searchCondition" /></th>
                    <td>
                        <div class="form_float">
                            <div class="form_left" style="width:30%;">
                                <input id="sGubun" type="text" class="form_comboBox" />
                            </div>
                            <div class="form_right" style="width:70%;">
                                <input id="sValue" type="text" class="form_input" >
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.zipCd" /></th>
                    <td>
                        <input id="sZipCd" type="text" class="form_input" >
                    </td>
                    <th scope="row"></th>
                    <td></td>

                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

    <div class="table_form form_width_50per mt5" id="addrDetlUsingYnDiv">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:10%;">
                <col style="width:50%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.type" /></span></th>
                    <td>
                        <input id="sAddrTp" type="text" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.addrDetlCont" /></span></th>
                    <td>
                        <input id="addrDetl" type="text" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>

<script type="text/javascript">
//검색구분 목록
var gubunList = [];
<c:forEach var="obj" items="${gubunList}">
gubunList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var addrTpList = [];
<c:forEach var="obj" items="${addrTpList}">
    <c:if test="${obj.remark1 ne 'SA'}">
        addrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}", "remark1":"${obj.remark1}"});
    </c:if>
</c:forEach>

var zipInfoList = [];
<c:forEach var="obj2" items="${zipInfoList}" begin="0" end="0">
zipInfoList.push({"sungNm":"${obj2.sungNm}"});
</c:forEach>

$(document).ready(function() {
    var isTablet = ${isTablet}+"";
    if(isTablet=="true") {
        $("#windows").width(580);
    }

    // 갬색구분 드랍다운 리스트.
    $("#sAddrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(addrTpList)
        ,optionLabel:" "
        ,index:1
    });

 // 갬색구분 드랍다운 리스트.
    $("#sGubun").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(gubunList)
        ,optionLabel:" "
        ,index:1
    });



    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var options = parent.zipCodeSearchPopupWin.options.content.data;
    //get a parameter from parent jsp page for choose detail address input  show or not.
    if (parent.zipCodeSearchPopupWin.options.content.data.addrDetlUsingYn == "Y"){
         $("#addrDetlUsingYnDiv").show();
     }else{
         $("#addrDetlUsingYnDiv").hide();
     }

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

    /************************************************************
                기능버튼 설정
    *************************************************************/
    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
             var grid = $("#grid").data("kendoExtGrid");
             var rows = grid.select();
             var sAddrTp = $("#sAddrTp").data("kendoExtDropDownList").value();
             var addrDetl = $("#addrDetl").val();

             if(rows !== null){
                 var data = [];
                 if(rows.length < 1){
                     dms.notification.info("<spring:message code='crm.info.noSelectedRow'/>");
                     return false;
                 }

                 if(parent.zipCodeSearchPopupWin.options.content.data.addrDetlUsingYn == "Y"){
                     if ( dms.string.isEmpty(sAddrTp) ) {   //주소 유형 필수 값.

                         dms.notification.warning("<spring:message code='global.lbl.type' var='init' /><spring:message code='global.info.check.field' arguments='${init}' />");
                         return;
                     } else {
                         data.sAddrTp = sAddrTp;
                     }
                     if ( dms.string.isEmpty(addrDetl) ) {    //상세주소 유형 필수 값.

                         dms.notification.warning("<spring:message code='crm.lbl.addrDetlCont' var='init' /><spring:message code='global.info.check.field' arguments='${init}' />");
                         return;
                     } else {
                         data.addrDetl = addrDetl;
                     }
                 }

                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                    // add the addrDetal para into the Data list
                    data.addrTp=$("#sAddrTp").val();
                    data.addrDetl=$("#addrDetl").val();
                });

                options.callbackFunc(data);
                // 창닫기
                parent.zipCodeSearchPopupWin.close();
            }
        }
    });

    // 닫기 버튼.
    $("#btnClose").kendoButton({
        click:function(e){
            parent.zipCodeSearchPopupWin.close();
        }
    });

    /************************************************************
                조회조건 설정
    *************************************************************/
    if (options.sGubun) {
        $("#sGubun").data("kendoExtDropDownList").value(options.sGubun);
    }
    if (options.sValue) {
        $("#sValue").val(options.sValue);
    }
    if (options.sZipCd) {
        $("#sZipCd").val(options.sZipCd);
    }

    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/zipCode/selectZipCodes.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sGubun"] = $("#sGubun").val();
                        params["sValue"] = $("#sValue").val();
                        params["sZipCd"] = $("#sZipCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"zipCd"
                    ,fields:{
                        rnum:{type:"string", editable:false}
                        ,sungCd:{type:"string", validation:{required:true}, editable:false}
                        ,sungNm:{type:"string", validation:{required:true}, editable:false}
                        ,cityCd:{type:"string", validation:{required:true}, editable:false}
                        ,cityNm:{type:"string", validation:{required:true}, editable:false}
                        ,distCd:{type:"string", validation:{required:true}, editable:false}
                        ,distNm:{type:"string", validation:{required:true}, editable:false}
                        ,zipCd:{type:"string", validation:{required:true}, editable:false}
                        ,extZipCd:{type:"string", editable:true, editable:false}
                    }
                }
            }
        }
        ,selectable:options.selectable === "multiple"? "multiple,row":"row"
        ,editable:false
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,height:305
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"zipCd", title:"<spring:message code='global.lbl.zipCd' />", width:80, attributes:{"class":"ac"}}
//             ,{field:"sungCd", title:"<spring:message code='global.lbl.sungCd' />", width:60, attributes:{"class":"ac"} }
            ,{field:"sungNm", title:"<spring:message code='global.lbl.sungNm' />", width:150}
//             ,{field:"cityCd", title:"<spring:message code='global.lbl.cityCd' />", width:80,  attributes:{"class":"ac"}}
            ,{field:"cityNm", title:"<spring:message code='global.lbl.cityNm' />", width:150}
//             ,{field:"distCd", title:"<spring:message code='cmm.lbl.distCd' />", width:80}
            ,{field:"distNm", title:"<spring:message code='cmm.lbl.distNm' />", width:150}
            ,{field:"extZipCd", title:"<spring:message code='global.lbl.extZipCd' />", width:120, attributes:{"class":"ac"}}
        ]
    });

    if(options.autoBind){
        $("#grid").data("kendoExtGrid").dataSource.read();
    }

    // sValue input focus.
    $("#sValue").focus();

    //get the first zipcode date from grid, and get address info with this zipcode.
    if(dms.string.isEmpty(options.sValue) && zipInfoList != null && zipInfoList.length > 0){
        $("#sValue").val("${sungNm}");
        $("#grid").data("kendoExtGrid").dataSource.read();
    }
});
</script>