<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 테크멘 기능관리 마스터 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">

            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-12938" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12044" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12047" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnSave" class="btn_m"><spring:message code="global.btn.confirm" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12046" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnAdd" class="btn_m btn_add"><spring:message code="global.btn.add" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12045" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnDel" class="btn_m btn_del"><spring:message code="global.btn.del" /></button>
                    </dms:access>
                </div>
            </div>
            <!-- 그리드 기능 버튼 종료 -->

            <form id="searchForm">
            <!-- 조회 조건 시작 -->
            <div class="table_form form_width_40per" role="search" data-btnid="btnSearch">
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
                            <th scope="row"><spring:message code='ser.lbl.systemId' /></th><!-- 시스템번호 -->
                            <td>
                                <input type="text" id="sTecId" class="form_input"/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.empNm' /></th><!-- 직원이름 -->
                            <td>
                                <input type="text" id="sTecNm" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.deptNm' /></th><!-- 부서명 -->
                            <td>
                                <input type="text" id="sDeptNm" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='sal.lbl.btoWrkTp' /></th><!-- 업무구분 -->
                            <td>
                                <input type="sWrkTp" id="sWrkTp" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 조회 조건 종료 -->
            </form>

            <!-- 그리드 시작 -->
            <div class="table_grid mt10">
                <div id="grid" class="resizable_grid"></div>
            </div>
            <!-- 그리드 종료 -->
        </section>
    </div>
</div>
<script type="text/javascript">

var userSearchPopupWin;

var selectable;
var isTablet="${isTablet}";
if(isTablet=="true"){
    selectable = "row"
}else{
    selectable = "multiple"
}

//기능유형 Array
var fnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${fnList}">
fnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//기능 Map
var fnMap = dms.data.arrayToMap(fnList, function(obj){ return obj.cmmCd; });

//업무구분 Array
var wrkTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${wrkTpCdList}">
    <c:if test="${obj.useYn eq 'Y'}">
    wrkTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
</c:forEach>
//기능 Map
var wrkTpCdMap = dms.data.arrayToMap(wrkTpCdList, function(obj){ return obj.cmmCd; });

// 테크니션 구분
fnTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(fnMap[val] != undefined)
        returnVal = fnMap[val].cmmCdNm;
    }
    return returnVal;
};

//테크니션 구분
wrkTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(wrkTpCdMap[val] != undefined)
        returnVal = wrkTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

$(document).ready(function() {

    // 조회조건 : 업무유형
    $("#sWrkTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:wrkTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#searchForm").get(0).reset();
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $("#grid").data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            tecManAddPopup();
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                dms.notification.info( "<spring:message code='global.info.required.change' />");
                return;
            }

            var result = true;
            $.each(grid.dataSource._data, function(idx, data){


                if(dms.string.strNvl(data.sysNo) == ""){
                    msgText = "<spring:message code='ser.lbl.staffNo' var='tecId' />"+
                    "<spring:message code='global.info.required.field' arguments='${tecId}' />";

                    result = false;
                    return dms.notification.warning(msgText);;
                }
                if(dms.string.strNvl(data.tecId) == ""){
                    msgText = "<spring:message code='ser.lbl.systemId' var='systemId' />"+
                    "<spring:message code='global.info.required.field' arguments='${systemId}' />";

                    result = false;
                    return dms.notification.warning(msgText);;
                }
                if(dms.string.strNvl(data.wrkTp) == ""){
                    msgText = "<spring:message code='sal.lbl.btoWrkTp' var='btoWrkTp' />"+
                    "<spring:message code='global.info.required.field' arguments='${btoWrkTp}' />";

                    result = false;
                    return dms.notification.warning(msgText);;
                }

            });

            if(!result) return;

            $.ajax({
                url:"<c:url value='/ser/svi/techManFnMaster/multiTechManFnMasters.do' />",
                data:JSON.stringify(saveData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.loading.hide($("#resizableContainer"));
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(jqXHR, textStatus) {

                    grid.dataSource._destroyed = [];
                    grid.dataSource.page(1);

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000138"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/svi/techManFnMaster/selectTechManFnMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSysNo"] = $("#sSysNo").val();
                        params["sTecNm"] = $("#sTecNm").val();
                        params["sWrkTp"] = $("#sWrkTp").val();
                        params["sDeptNm"] = $("#sDeptNm").val();
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
                        dlrCd:{type:"string"}
                        ,sysNo:{type:"string"}
                        ,tecId:{type:"string"}
                        ,tecNm:{type:"string"}
                        ,sexCd:{type:"string"}
                        ,tecMfnNm:{type:"string"}
                        ,tecSfnNm1:{type:"string"}
                        ,tecSfnNm2:{type:"string"}
                        ,tecSfnNm3:{type:"string"}
                        ,deptCd:{type:"string", editable:false}
                        ,deptNm:{type:"string", editable:false}
                        ,tskCd:{type:"string", editable:false}
                        ,tskNm:{type:"string", editable:false}
                    }
                }
            }
        }
        ,selectable:selectable
        ,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:function(e){
            var fieldName = e.container.find("input").attr("name");
            if(!e.model.isNew()){
                if(fieldName=="tecId"||fieldName=="tecNm"){
                    this.closeCell();
                }
            }
        }
        ,height:600
        ,columns:[
            {field:"tecId", title:"<spring:message code='ser.lbl.systemId' />", width:100//시스템번호
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="tecId" data-name="<spring:message code='ser.lbl.tecId'/>" class="form_input" readonly="true" /><a href="#" onclick="tecManAdd()" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="tecId"></span>')
                    .appendTo(container);
                 }
            }
            ,{field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", width:100, attributes:{"class":"al"}
                ,sortable:false
                ,editor:function(container, options){
                    $('<input required type="text" id="sysNo" name="sysNo" maxLength="10" data-bind="value:' + options.field + '" class="form_input" />')
                    .appendTo(container)
                    $('<span class="k-invalid-msg" data-for="sysNo"></span>')
                    .appendTo(container);
                }
            } // 직원번호
            ,{field:"tecNm", title:"<spring:message code='ser.lbl.empNm' />", width:150, attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<div class="form_search"><input type="text" name="tecNm" data-name="<spring:message code='ser.lbl.tecNm'/>" class="form_input" readonly="true" /><a href="#" onclick="tecManAdd()" >&nbsp;</a></div>')
                    .appendTo(container);
                    $('<span class="k-invalid-msg" data-for="tecNm"></span>')
                    .appendTo(container);
                 }
            }//테크니션명
            ,{field:"sexCd", title:"<spring:message code='ser.lbl.userSex' />", width:80,sortable:false}      // 성별
            ,{field:"deptCd", title:"<spring:message code='ser.lbl.deptCd' />", width:150,sortable:false}     // 부서코드
            ,{field:"deptNm", title:"<spring:message code='ser.lbl.deptNm' />", width:150,sortable:false}     // 부서코드
            ,{field:"tskCd", title:"<spring:message code='ser.lbl.tskCd' />", width:150,sortable:false}       // 직무코드
            ,{field:"tskNm", title:"<spring:message code='ser.lbl.tskNm' />", width:150,sortable:false}       // 직무명칭
            ,{field:"tecMfnNm", title:"<spring:message code='ser.lbl.fnNm' />", width:150, attributes:{"class":"ac"}
                ,template:"#=fnTpCdGrid(tecMfnNm)#"
                ,editor:function(container, options) {
                    $('<input required name="tecMfnNm" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataSource:fnList
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                    });
                }
                ,hidden:true
            }//테크멘 주기능명
            ,{
                title:"<spring:message code='ser.lbl.sFnNm' />"  // 부기능
               ,headerAttributes:{ "class":"hasBob" }
               ,width:200
               ,columns:[
                     {   title:"1"
                        ,field:"tecSfnNm1"
                        ,headerAttributes:{"class":"hasBol"}
                        ,attributes:{"class":"ac"}
                        ,sortable:false
                        ,width:150
                        ,template:"#=fnTpCdGrid(tecSfnNm1)#"
                        ,editor:function(container, options) {
                            $('<input required name="tecSfnNm1" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                valuePrimitive:true
                                ,dataSource:fnList
                                ,dataValueField:"cmmCd"
                                ,dataTextField:"cmmCdNm"
                            });
                        },hidden : true
                    }
                    ,{   title:"2"
                        ,field:"tecSfnNm2"
                        ,attributes:{"class":"ac"}
                        ,sortable:false
                        ,width:150
                        ,template:"#=fnTpCdGrid(tecSfnNm2)#"
                        ,editor:function(container, options) {
                            $('<input required name="tecSfnNm2" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                valuePrimitive:true
                                ,dataSource:fnList
                                ,dataValueField:"cmmCd"
                                ,dataTextField:"cmmCdNm"
                            });
                        },hidden : true
                    }
                    ,{   title:"3"
                        ,field:"tecSfnNm3"
                        ,attributes:{"class":"ac"}
                        ,sortable:false
                        ,width:150
                        ,template:"#=fnTpCdGrid(tecSfnNm3)#"
                        ,editor:function(container, options) {
                            $('<input required name="tecSfnNm3" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                valuePrimitive:true
                                ,dataSource:fnList
                                ,dataValueField:"cmmCd"
                                ,dataTextField:"cmmCdNm"
                            });
                        },hidden : true
                    }
                   ]
            }
            ,{field:"wrkTp", title:"<spring:message code='sal.lbl.btoWrkTp' />", width:150, attributes:{"class":"ac"}
                ,sortable:false
                ,template:"#=wrkTpCdGrid(wrkTp)#"
                ,editor:function(container, options) {
                    $('<input required name="wrkTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        valuePrimitive:true
                        ,dataSource:wrkTpCdList
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                    });
                }
            }//테크멘 주기능명
        ]

    });

    if(isTablet=="true"){
        $(".checkAll").css("display","none");
        $(".km-pane-wrapper").css("width","100%");
        $(".colSetting_open").css("display","none");
        if(window.matchMedia('(max-width:1024px)').matches){
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }else{
        $(".checkAll").css("display","true");
    }


});

tecManAdd = function(){
    userSearchPopupWin = dms.window.popup({
        windowId:"userSearchPopupWin"
        ,height:530
        ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectServiceUserPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"single"
                ,"closeAfterSelect":true
                ,"callbackFunc":function(data){
                    if(data.length > 0)
                    {
                        var rows = $("#grid").data("kendoExtGrid").tbody.find("tr");
                        rows.each(function(index, row) {
                            var dataItem = $("#grid").data("kendoExtGrid").dataSource._data;
                            if($(this).hasClass("k-state-selected")){
                                dataItem[index].tecId = data[0].usrId;
                                dataItem[index].tecNm = data[0].usrNm;
                                dataItem[index].deptCd = data[0].deptCd;
                                dataItem[index].deptNm = data[0].deptNm;
                                dataItem[index].tskCd = data[0].tskCd;
                                dataItem[index].tskNm = data[0].tskNm;
                                dataItem[index].dirty = true;
                            }
                        });
                        $("#grid").data("kendoExtGrid").refresh();
                    }
                }
            }
        }
    });
}

tecManAddPopup = function(){
    userSearchPopupWin = dms.window.popup({
        windowId:"userSearchPopupWin"
        ,height:530
        ,title:"<spring:message code='cmm.title.user.search' />"   // 사용자조회
        ,content:{
            url:"<c:url value='/ser/cmm/popup/selectServiceUserPopup.do'/>"
            ,data:{
                "autoBind":true
                ,"selectable":"multiple"
                ,"closeAfterSelect":true
                ,"callbackFunc":function(data){
                    if(data.length > 0)
                    {
                        var gridData = $('#grid').data('kendoExtGrid').dataSource;

                        $.each(data, function(idx, data){
                            var checkVal = true;

                            // 중복값 체크
                            $.each(gridData._data, function(idx, obj){
                                if(data.usrId == obj.tecId){
                                    checkVal = false;
                                }
                            });

                            if(checkVal){
                                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                                    wrkTp:""
                                    ,tecId:data.usrId
                                    ,tecNm:data.usrNm
                                    ,deptCd:data.deptCd
                                    ,deptNm:data.deptNm
                                    ,tskCd:data.tskCd
                                    ,tskNm:data.tskNm
                                    ,tecMfnNm:""
                                    ,tecSfnNm1:""
                                    ,tecSfnNm2:""
                                    ,tecSfnNm3:""
                                    ,dirty:true
                                });
                            }
                        });
                    }
                }
            }
        }
    });
}
</script>
