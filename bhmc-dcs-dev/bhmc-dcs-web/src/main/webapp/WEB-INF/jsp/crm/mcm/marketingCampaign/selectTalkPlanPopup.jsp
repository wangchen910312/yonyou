<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSelect" class="btn_m"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div class="table_grid mt10">
        <input id="sDlrCd" name="sDlrCd" type="hidden">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">
    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.talkPlanSearchPopupWin.options.content.data;


        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();
                if(rows.length == 0){
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                options.callbackFunc(data);

                parent.talkPlanSearchPopupWin.close();
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.talkPlanSearchPopupWin.close();
            }
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-CRM-0721-113210"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/crm/mcm/marketingCampaign/selectTalkPlans.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sDlrCd"] = $("#sDlrCd").val();
                            params["sort"] = options.sort;

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
                        id:"makNm"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,makCd:{type:"string", editable:false}
                            ,makNm:{type:"string", editable:false}
                            ,talkPlan:{type:"string", editable:false}
                        }
                    }
                }
            }
            ,dataBound:function (e) {
              var dataItems = e.sender.dataSource.view();
              for (var j=0; j < dataItems.length; j++) {
                delete  dataItems[j]["usrPw"];
              }
            }
            , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            , multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            , appendEmptyColumn:false          //빈컬럼 적용. default:false
            , enableTooltip:true               //Tooltip 적용, default:false
            , filterable:true
            , selectable:options.selectable === "multiple"? "multiple,row":"row"
            , editable:false
            , autoBind:false
            , pageable:false
            , height:305
            , columns:[
                {field:"makNm", title:"<spring:message code='global.lbl.crNm' />", width:150}
                ,{field:"talkPlan", title:"<spring:message code='global.lbl.talkPlan' />"}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //그리드 조회
        $("#grid").data("kendoExtGrid").dataSource.read();
    });
</script>