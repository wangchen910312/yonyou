<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="clfix">
        <section class="left_areaStyle" style="width:480px;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="cmm.title.user.search" /><!-- 결재선 --></h2>
                <div class="btn_right">
                    <button id="btnUserSearch" class="btn_s btn_search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                </div>
            </div>

            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:18%;">
                        <col style="width:32%;">
                        <col style="width:18%;">
                        <col style="width:32%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.dept' /><!-- 부서 --></th>
                            <td>
                                <input id="sDeptCd" type="text" value="" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.task' /><!-- 직무 --></th>
                            <td>
                                <input id="sTskCd" type="text" value="" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='global.lbl.usrId' /><!-- 아이디 --></th>
                            <td>
                                <input id="sUsrId" type="text" value="" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.usrNm' /><!-- 이름 --></th>
                            <td>
                                <input id="sUsrNm" type="text" value="" class="form_input">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt10">
                <div id="userGrid"></div>
            </div>
        </section>

        <section class="left_areaStyle" style="width:20px;margin:190px 5px 0 5px;">
            <div><button class="btn_s btn_next" id="btnAdd" /></div>
            <div class="mt5"><button class="btn_s btn_prev" id="btnDel" /></div>
        </section>

        <section style="margin-left:510px;">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="global.title.signLine" /><!-- 결재선 --></h2>
                <div class="btn_right">
                    <button id="btnUp" type="button" class="btn_s btn_up"><spring:message code="global.btn.up" /><!--위로--></button>
                    <button id="btnDown" type="button" class="btn_s btn_down"><spring:message code="global.btn.down" /><!-- 아래로 --></button>
                    <button id="btnSave" type="button" class="btn_s btn_save"><spring:message code="global.btn.apply" /><!-- 적용 --></button>
                </div>
            </div>
            <div class="table_grid">
                <div id="signLineGrid"></div>
            </div>
        </section>
    </div>
</section>

<script type="text/javascript">
//부서목록
var deptCdList = [{"deptCd":"", "deptNm":"", "useYn":"Y"}];
<c:forEach var="obj" items="${deptCdList}">
deptCdList.push({"deptCd":"${obj.deptCd}", "deptNm":"${obj.deptNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//부서 Map
var deptCdMap = dms.data.arrayToMap(deptCdList, function(obj){ return obj.deptCd; });

//직무목록
var tskCdList = [{"tskCd":"", "tskNm":"", "deptCd":""}];
<c:forEach var="obj" items="${taskList}">
tskCdList.push({"tskCd":"${obj.tskCd}", "tskNm":"${obj.tskNm}", "deptCd":"${obj.deptCd}"});
</c:forEach>
//직무 Map
var tskCdMap = dms.data.arrayToMap(tskCdList, function(obj){ return obj.tskCd; });

//결재유형
var signTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${signTpList}">
signTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}" ,"useYn":"${obj.useYn}"});
</c:forEach>
var signTpMap = dms.data.arrayToMap(signTpList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    //팝업 옵션
    var popupWindow = parent.$("#changeSignLinePopupWin").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;
    var popupOptionsSignLines = JSON.parse(popupOptions.signLines);

    //조회조건 - 부서
    $("#sDeptCd").kendoExtDropDownList({
        dataSource:deptCdList
        ,dataValueField:"deptCd"
        ,dataTextField:"deptNm"
        ,change:function(e){
            var deptCd = this.value();
            var cmpTp = deptCdMap[deptCd].cmpTp;
            var tskCdListDatasource = [{"tskCd":"", "tskNm":"", "deptCd":"", "cmpTp":""}];

            if(dms.string.isNotEmpty(deptCd)){
                $.each(tskCdList, function(idx, obj){
                    if(cmpTp == "${cmpTpCorp}"){
                        if(obj.cmpTp == "${cmpTpCorp}"){
                            tskCdListDatasource.push(obj);
                        }
                    }else{
                        if(deptCd == obj.deptCd){
                            tskCdListDatasource.push(obj);
                        }
                    }
                });
            }

            $("#sTskCd").data("kendoExtDropDownList").setDataSource(tskCdListDatasource);
        }
    });

    //조회조건 - 직무
    $("#sTskCd").kendoExtDropDownList({
        dataSource:[]
        ,dataValueField:"tskCd"
        ,dataTextField:"tskNm"
    });

    //사용자 조회
    $("#btnUserSearch").kendoButton({
        click:function(e){
            $("#userGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    //결재라인 이동(UP)
    $("#btnUp").kendoButton({
        click:function(e){
            var signLineGrid = $("#signLineGrid").data("kendoExtGrid");
            var signLines = signLineGrid.dataSource.data();

            if (signLineGrid.select().length == 0) {
                dms.notification.warning("<spring:message code='global.info.required.select'/>");
                return;
            }

            var dataItem = signLineGrid.dataItem(signLineGrid.select());

            var index = signLineGrid.dataSource.indexOf(dataItem);
            var newIndex = Math.max(0, index - 1);

            if(index != newIndex) {
                signLineGrid.dataSource.remove(dataItem);
                signLineGrid.dataSource.insert(newIndex, dataItem);

                //마지막 결재라인 항목을  최종결재자로  설정
                $.each(signLines, function(idx, obj){
                    if(idx == signLines.length-1){
                        obj.set("lastSignYn", "Y");
                    }else{
                        obj.set("lastSignYn", "N");
                    }
                });

                signLineGrid.select("tr[data-uid='"+signLineGrid.dataSource.at(newIndex).uid+"']");
            }
        }
    });

    //결재라인 이동(DOWN)
    $("#btnDown").kendoButton({
        click:function(e){
            var signLineGrid = $("#signLineGrid").data("kendoExtGrid");
            var signLines = signLineGrid.dataSource.data();

            if (signLineGrid.select().length == 0) {
                dms.notification.warning("<spring:message code='global.info.required.select'/>");
                return;
            }

            var dataItem = signLineGrid.dataItem(signLineGrid.select());

            var index = signLineGrid.dataSource.indexOf(dataItem);
            var newIndex = Math.min(signLineGrid.dataSource.data().length - 1, index + 1);

            if(index != newIndex) {
                signLineGrid.dataSource.remove(dataItem);
                signLineGrid.dataSource.insert(newIndex, dataItem);

                //마지막 결재라인 항목을  최종결재자로  설정
                $.each(signLines, function(idx, obj){
                    if(idx == signLines.length-1){
                        obj.set("lastSignYn", "Y");
                    }else{
                        obj.set("lastSignYn", "N");
                    }
                });

                signLineGrid.select("tr[data-uid='"+signLineGrid.dataSource.at(newIndex).uid+"']");
            }

        }
    });

    //결재라인 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            var userGrid = $('#userGrid').data('kendoExtGrid');

            var rows = userGrid.select();
            if (rows.length == 0) {
                dms.notification.warning("<spring:message code='global.info.required.select'/>");
                return;
            }

            var signLineGrid = $('#signLineGrid').data('kendoExtGrid');

            $.each(rows, function(idx, row){
                var userDataItem = userGrid.dataItem(row);

                var flag = true
                $.each(signLineGrid.dataSource.data(), function(idx, obj){
                    if(userDataItem.usrId == obj.signUsrId){
                        flag = false;
                        return false;
                    }
                });

                if(flag){
                    //결재라인 항목의 최종결재자 여부 'N' 설정
                    $.each(signLineGrid.dataSource.data(), function(idx, obj){
                        obj.set("lastSignYn", "N");
                    });

                    //최종결재자로 추가한다.
                    signLineGrid.dataSource.add({
                        "signTp":"01" //구분:결제
                        ,"lastSignYn":"Y"
                        ,"signUsrId":userDataItem.usrId
                        ,"signUsrNm":userDataItem.usrNm
                    });
                }
            });
        }
    });

    //결재라인 삭제
    $("#btnDel").kendoButton({
        click:function(e){
            var signLineGrid = $("#signLineGrid").data("kendoExtGrid");
            var rows = signLineGrid.select();

            if (rows.length == 0) {
                dms.notification.warning("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                signLineGrid.removeRow(row);
            });

            var signLines = signLineGrid.dataSource.data();
            //마지막 결재라인 항목을  최종결재자로  설정
            $.each(signLines, function(idx, obj){
                if(idx == signLines.length-1){
                    obj.set("lastSignYn", "Y");
                }else{
                    obj.set("lastSignYn", "N");
                }
            });
        }
    });

    //결재라인 적용
    $("#btnSave").kendoButton({
        click:function(e) {
            var signLineGrid = $("#signLineGrid").data("kendoExtGrid");
            var signLines = signLineGrid.dataSource.data();

            if(signLines.length == 0){
                dms.notification.warning("<spring:message code='global.lbl.signLine' var='signLineMsg' /><spring:message code='global.info.required.min.list' arguments='${signLineMsg},"+1+"' />");
                return;
            }

            popupOptions.callbackFunc(signLines);
            popupWindow.close();
        }
    });

    //사용자 조회 그리드
    $("#userGrid").kendoExtGrid({
        gridId:"G-CMM-0114-111001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/user/selectUsersForDealer.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDeptCd"] = $("#sDeptCd").data("kendoExtDropDownList").value();
                        params["sTskCd"] = $("#sTskCd").data("kendoExtDropDownList").value();
                        params["sUsrId"] = $("#sUsrId").val();
                        params["sUsrNm"] = $("#sUsrNm").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"usrId"
                    ,fields:{
                        deptCd:{type:"string"}
                        ,tskCd:{type:"string"}
                        ,usrId:{type:"string"}
                        ,usrNm:{type:"string"}
                        ,empNo:{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,selectable:"row"
        ,editable:false
        ,autoBind:false
        ,height:390
        ,filterable:false
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,sortable:false
        ,columns:[
            {field:"deptCd", title:"<spring:message code='global.lbl.dept' />", width:100
                ,template:"# if(deptCdMap[deptCd] != null) { # #= deptCdMap[deptCd].deptNm# # }#"
            }
            ,{field:"tskCd", title:"<spring:message code='global.lbl.task' />", width:100
                ,template:"# if(tskCdMap[tskCd] != null) { # #= tskCdMap[tskCd].tskNm# # }#"
            }
            ,{field:"usrId", title:"<spring:message code='global.lbl.usrId' />", width:120}
            ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />"}
        ]
    });

    //결재라인설정 그리드
    $("#signLineGrid").kendoExtGrid({
        gridId:"G-CMM-0114-111002"
        ,dataSource:{
            data:popupOptionsSignLines
            ,transport:{
                read:function(options){
                    options.success(popupOptionsSignLines);
                }
            }
            ,navigatable:false
            ,pageSize:0
            ,schema:{
                model:{
                    id:"signUsrId"
                    ,fields:{
                         signDocLineNo:{type:"number"}
                        ,lastSignYn:{type:"string"}
                        ,signUsrId:{type:"string"}
                        ,signUsrNm:{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,selectable:"row"
        ,editable:false
        ,pageable:false
        ,height:454
        ,filterable:false
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,sortable:false
        ,columns:[
            {field:"lastSignYn", title:"<spring:message code='global.lbl.final' />", width:70,attributes:{"class":"ac"}}
            ,{field:"signTp", title:"<spring:message code='global.lbl.gubun' />", width:100, attributes:{"class":"ac"}
                ,template:"# if(signTpMap[signTp] != null) { # #= signTpMap[signTp].cmmCdNm# # }#"
            }
            ,{field:"signUsrNm", title:"<spring:message code='global.lbl.apprUsrNm' />"}
        ]
    });
});
</script>