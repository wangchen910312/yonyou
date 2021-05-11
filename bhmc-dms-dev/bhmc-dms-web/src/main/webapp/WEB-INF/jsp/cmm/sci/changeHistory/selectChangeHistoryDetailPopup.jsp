<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <section class="group">
        <!-- // 탭 시작 -->
        <div id="tabstrip" class="tab_area">
            <ul>
                <li id ="tabBefore" class="k-state-active"><spring:message code="global.lbl.chgBef" /><!-- 변경 전 --></li>
                <li id ="tabAfter"><spring:message code="global.lbl.chgAft" /><!-- 변경 후 --></li>
            </ul>
            <!--역할 탭 영역 -->
            <div class="mt0">
                <div class="table_grid mt10">
                    <div id="beforeGrid" class="grid"></div>
                </div>
            </div>

            <!--역할 탭 영역 -->
            <div class="mt0">
                <div class="table_grid mt10">
                    <div id="afterGrid" class="grid"></div>
                </div>
            </div>
       </div>
</section>

<script type="text/javascript">
// Tab
$("#tabstrip").kendoExtTabStrip({
    animation:false
});

$(document).ready(function() {
    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var options = parent.detailPopupWin.options.content.data;

     var sChgHisSeq = options.sChgHisSeq;

    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#beforeGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/changeHistory/selectChangeHistoryByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sChgHisSeq"] = sChgHisSeq;
                        params["sFlag"] = "B";

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:false
            ,pageSize:0
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,chgKey:{type:"string"}
                        ,chgValue:{type:"string"}
                    }
                }
            }
        }
        ,editableOnlyNew:true
        ,autoBind:true
        ,pageable:false
        ,height:432
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60
                ,attributes:{"class":"ac"}
            }
            ,{field:"chgKey", title:"<spring:message code='global.lbl.field' />", width:200}
            ,{field:"chgValue", title:"<spring:message code='cmm.lbl.value' />"}
        ]
    });

    $("#afterGrid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/changeHistory/selectChangeHistoryByKey.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sChgHisSeq"] = sChgHisSeq;
                        params["sFlag"] = "A";

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:false
            ,pageSize:0
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,chgKey:{type:"string"}
                        ,chgValue:{type:"string"}
                    }
                }
            }
        }
        ,editableOnlyNew:true
        ,autoBind:true
        ,pageable:false
        ,height:432
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60
                ,attributes:{"class":"ac"}
            }
            ,{field:"chgKey", title:"<spring:message code='global.lbl.field' />", width:200}
            ,{field:"chgValue", title:"<spring:message code='cmm.lbl.value' />"}
        ]
    });
});
</script>