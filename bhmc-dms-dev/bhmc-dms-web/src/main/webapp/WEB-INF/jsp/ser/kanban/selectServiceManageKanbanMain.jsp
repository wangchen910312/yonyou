<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 정비관리칸반 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.serviceManage" /></h1>   <!-- ser.title.serviceManage -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13096" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
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
                    <th scope="row"><spring:message code="global.lbl.applyDt" /></th><!--적용일자  -->
                    <td>
                        <div class="form_float">
                            <input id="sBaseDt" class="form_datepicker ac">
                        </div>
                    </td>
                    <th></th><td></td>
                    <th></th><td></td>
                    <th></th><td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 수리 그리드 시작 -->
    <div class="table_grid">
        <div id="workGrid" class="resizable_grid"></div>
    </div>
    <!-- 수리 그리드 종료 -->

</section>
</div>
<!-- //정비관리칸반 -->


<!-- script -->
<script type="text/javascript">

$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            //조회시 필터 초기화 예제
            $('#workGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    // 적용일자
    $("#sBaseDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sysDate}"
    });

    //그리드 설정
    $("#workGrid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-SER-0426-134105"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/kanban/selectServiceManage.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = "${dlrCd}";
                        params["sBaseDt"] = $("#sBaseDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,mesgSeq:{type:"number", editable:false}
                        ,bundleNm:{type:"string", validation:{required:true}}
                        ,langCd:{type:"string", validation:{required:true}}
                        ,cntryCd:{type:"string"}
                        ,mesgKey:{type:"string", validation:{required:true}}
                        ,mesgTxt:{type:"string", validation:{required:true}}
                        ,lstUpdtDt:{type:"date", editable:false}
                        ,lstUpdtDtFormat:{type:"date", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.lstUpdtDtFormat = kendo.parseDate(elem.lstUpdtDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }

         }
        ,height:250
        ,autoBind:false
        ,pageable:false
        //,selectable:_selectable
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false
                ,attributes:{"class":"ac"}
                ,hidden:true
            }
            ,{field:"bayNm", title:"기전수리", width:100}
            ,{field:"t0800", title:"08:00", width:100}
            ,{field:"t0830", title:"08:30", width:100}
            ,{field:"t0900", title:"09:00", width:100}
            ,{field:"t0930", title:"09:30", width:100}
            ,{field:"t1000", title:"10:00", width:100}
            ,{field:"t1030", title:"10:30", width:100}
            ,{field:"t1100", title:"11:00", width:100}
            ,{field:"t1130", title:"11:30", width:100}
            ,{field:"t1200", title:"12:00", width:100}
            ,{field:"t1230", title:"12:30", width:100}
            ,{field:"t1300", title:"13:00", width:100}
            ,{field:"t1330", title:"13:30", width:100}
            ,{field:"t1400", title:"14:00", width:100}
            ,{field:"t1430", title:"14:30", width:100}
            ,{field:"t1500", title:"15:00", width:100}
            ,{field:"t1530", title:"15:30", width:100}
            ,{field:"t1600", title:"16:00", width:100}
            ,{field:"t1630", title:"16:30", width:100}
            ,{field:"t1700", title:"17:00", width:100}
            ,{field:"t1730", title:"17:30", width:100}
            ,{field:"t1800", title:"18:00", width:100}
            ,{field:"t1830", title:"18:30", width:100}
            ,{field:"t1900", title:"19:00", width:100}
            ,{field:"t1930", title:"19:30", width:100}
        ]
    });

});

</script>
