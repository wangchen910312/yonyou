<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div id="resizableContainer">
    <!--  resizableContainer Div -->
    <!-- 추적 등급별 다음 추적일 설정 -->
    <section class="group"> <!-- 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic">
            <spring:message code="crm.title.traceGradeSetting" />
        </h1>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11139" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11140" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
        </dms:access>
        </div>
    </div>
    <!-- 타이틀 종료 --> <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    </section>
</div>
<!--  resizableContainer Div -->

<script type="text/javascript">

$(document).ready(function(){

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList", "deleteList", ["lstUpdtDtFormat"]);

            if (grid.cudDataLength == 0) {
                // 변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }
            //console.log(saveData);
            //console.log(JSON.stringify(saveData));


             if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/crm/cso/traceGradeMgmt/multiTraceGrade.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
                        //console.log("jqXHR:::::"+jqXHR);
                        //console.log("textStatus:::::"+textStatus);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success' />");
                    }
                });
            } else {
              //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
       //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
       gridId:"G-CRM-0203-110633"
       ,columns:[
          {field:"rnum", title:"<spring:message code='crm.lbl.rnum' />", width:60, sortable:false
              ,attributes:{"class":"ac"}
          }
          ,{field:"cmmCdNm", title:"<spring:message code='crm.lbl.activeGrade' />", width:150
          }
          ,{field:"traceIvalDay", title:"<spring:message code='crm.lbl.nextTracePrid' />", width:150
              ,attributes:{"style":"text-align:right"}
              ,editor:function(container, options){
                      var input = $("<input/>");
                      input.attr("name", options.field);
                      input.appendTo(container);
                      input.kendoExtNumericTextBox({
                          min:0
                          ,max:999
                          ,decimal:0
                          ,spinners:true
                      });
              }
          }
          ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:150
              ,attributes:{"class":"ac tooltip-disabled"}
              ,template:"#if (regDt !== null ){# #= kendo.toString(regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
          }
          ,{field:"usrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:150
              ,attributes:{"class":"ac"}
          }
       ]
       ,dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/crm/cso/traceGradeMgmt/selectTraceGrade.do' />"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                       //console.log(kendo.stringify(params));

                       return kendo.stringify(params);

                   } else if (operation != "read" && options.models){
                       return kendo.stringify(options.models);
                   }

               }
         }
         ,schema:{
             errors:"error"
             ,model:{
                  id:"rnum"
                  ,fields:{
                      rnum:{type:"number", editable:false, sortable:false}
                      ,cmmCdNm:{type:"string", editable:false}
                      ,traceIvalDay:{type:"number", editable:true}
                      ,regDt:{type:"date", editable:false}
                      ,usrNm:{type:"string", editable:false}
                  }
             }
             ,parse:function(d) {
                if(d.data){
                    $.each(d.data, function(idx, elem) {
                        elem.regDt = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                    });
                }
                return d;
             }
         }
       }
       ,editable:true
       ,navigatable:false
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,indvColumnRows:10
       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
    });

});

</script>