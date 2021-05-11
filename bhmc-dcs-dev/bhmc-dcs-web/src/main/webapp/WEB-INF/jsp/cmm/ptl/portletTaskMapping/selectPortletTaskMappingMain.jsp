<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 포틀릿-직무매핑 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.portletTaskMapping" /></h1>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11434" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11436" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
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
                    <th scope="row"><spring:message code="global.lbl.tskCd" /></th>
                    <td>
                        <input id="sTskCd" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.tskNm" /></th>
                    <td>
                        <input id="sTskNm" type="text" class="form_input" >
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

    <div class="clfix">
        <section class="left_areaStyle" style="width:30%;">
            <!-- 그리드 시작 -->
            <div class="table_grid mt10">
                <div id="taskGrid" class="resizable_grid"></div>
            </div>
            <!-- 그리드 종료 -->
        </section>

        <section class="right_areaStyle" style="width:70%;">
            <!-- 그리드 시작 -->
            <div class="table_grid mt10" style="margin-left:10px;">
                <div id="portletTaskMappingGrid" class="resizable_grid"></div>
            </div>
            <!-- 그리드 종료 -->
        </section>
    </div>
</section>
</div>

<script type="text/javascript">
var selectedTskCd = "";

$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#taskGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            if(dms.string.isEmpty(selectedTskCd)){
                dms.notification.info("<spring:message code='global.lbl.task' var='taskMsg' /><spring:message code='global.info.validation.select' arguments='${taskMsg}' />");
                return;
            }

            var portletTaskMappingGrid = $("#portletTaskMappingGrid").data("kendoExtGrid");
            var portlets = [];
            $.each($("input.grid-checkbox-item:checked", portletTaskMappingGrid.tbody), function(idx, obj){
                portlets.push($(obj).data("portletId"));
            });

            $.ajax({
                url:"<c:url value='/cmm/ptl/portletTaskMapping/deleteAndInsertPortletTaskMapping.do' />"
                ,data:JSON.stringify({
                    "tskCd":selectedTskCd
                    ,"portlets":portlets
                })
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,beforeSend:function(jqXHR, settings){
                    dms.loading.show();
                }
                ,complete:function(jqXHR, textStatus){
                    dms.loading.hide();
                }
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data, textStatus, jqXHR) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });

    //직무 그리드
    $("#taskGrid").kendoExtGrid({
        gridId:"G-CMM-0308-180801"
       ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ptl/portletTaskMapping/selectTasks.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCmpTp"] = "10";
                        params["sTskCd"] = $("#sTskCd").val();
                        params["sTskNm"] = $("#sTskNm").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"tskCd"
                    ,fields:{
                        rnum:{type:"number"}
                        ,tskCd:{type:"string"}
                        ,tskNm:{type:"string"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                        });
                    }
                    return d;
                }
            }
        }
        ,editable:false
        ,appendEmptyColumn:false
        ,selectable:"row"
        ,dataBound:function(e){
            var portletTaskMappingGrid = $("#portletTaskMappingGrid").data("kendoExtGrid");
            $.each(portletTaskMappingGrid.dataSource.data(), function(idx, dataItem){
                dataItem.set("tskCd", null);
            });

            portletTaskMappingGrid.refresh();
            selectedTskCd = "";
        }
        ,change:function(e){
            selectedTskCd = this.dataItem(this.select()).tskCd;

            //포틀릿-직무 매핑 적용 절차
            //1.포틀릿-직무 매핑 목록을 조회한다.
            //2.포틀릿-직무 매핑 그리드에 적용한다.

            //1.포틀릿-직무 매핑 목록을 조회한다.
            $.ajax({
                url:"<c:url value='/cmm/ptl/portletTaskMapping/selectPortletTaskMappingsByTskCd.do' />"
                ,data:"tskCd="+selectedTskCd
                ,type:'POST'
                ,dataType:'json'
                ,beforeSend:function(jqXHR, settings){
                    dms.loading.show();
                }
                ,complete:function(jqXHR, textStatus){
                    dms.loading.hide();
                }
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(res, textStatus, jqXHR) {
                    //2.포틀릿-직무 매핑 그리드에 적용한다.
                    var portletTaskMappingMap = dms.data.arrayToMap(res.data, function(obj){
                        return obj.portletId;
                    });

                    var portletTaskMappingGrid = $("#portletTaskMappingGrid").data("kendoExtGrid");
                    $.each(portletTaskMappingGrid.dataSource.data(), function(idx, dataItem){
                        if(portletTaskMappingMap.hasOwnProperty(dataItem.portletId)){
                            dataItem.set("tskCd", selectedTskCd);
                        }else{
                            dataItem.set("tskCd", null);
                        }
                    });

                    portletTaskMappingGrid.refresh();
                }
            });
        }
        ,columns:[
             {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"tskCd", title:"<spring:message code='global.lbl.tskCd' />", width:80 ,attributes:{"class":"ac"}}
            ,{field:"tskNm", title:"<spring:message code='global.lbl.tskNm' />"}
        ]
    });

    //포틀릿-직무 매핑 그리드
    $("#portletTaskMappingGrid").kendoExtGrid({
        gridId:"G-CMM-0308-180802"
       ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ptl/portletTaskMapping/selectPortlets.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sort"] = options.sort;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,serverSorting:false
            ,serverPaging:false
            ,schema:{
                model:{
                    id:"portletId"
                    ,fields:{
                        rnum:{type:"number"}
                        ,portletId:{type:"string"}
                        ,portletNm:{type:"string"}
                        ,tskCd:{type:"string"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                        });
                    }
                    return d;
                }
            }
        }
        ,editable:false
        ,appendEmptyColumn:true
        ,columns:[
             {field:"tskCd", title:"", width:30, sortable:false
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                  var checked = "";
                  if(!dms.string.isEmpty(dataItem.tskCd)){
                      checked = "checked";
                  }
                  return "<input type='checkbox' data-portlet-id='"+dataItem.portletId+"' "+checked+" class='grid-checkbox-item' />";
                }
                ,headerTemplate:"<input type='checkbox' class='checkAll' />"
             }
            ,{field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"portletId", title:"<spring:message code='global.lbl.portletId' />", width:150 ,attributes:{"class":"ac"}}
            ,{field:"portletNm", title:"<spring:message code='global.lbl.portletNm' />", width:400}
        ]
    });
});
</script>