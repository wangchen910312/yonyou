<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <input type="hidden" id="roleId" name="roleId" />
    <input type="hidden" id="roleNm" name="roleNm" />

    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_cancel" id="btnRoleSelect"><spring:message code="global.btn.select" /></button>
            <button class="btn_s btn_cancel" id="btnRoleClose"><spring:message code="global.btn.close" /></button>
        </div>
    </div>

    <div class="table_grid">
        <div id="rolePopupGrid" class="grid"></div>
    </div>
</section>

<script type="text/javascript">
    fnRoleInfo = function(dataItem) {
        $("#roleId").val(dataItem.roleId);
        $("#roleNm").val(dataItem.roleNm);
    }

    $(document).ready(function() {
        var options = parent.rolePopupWin.options.content.data;

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 선택 버튼.
        $("#btnRoleSelect").kendoButton({
            click:function(e){
                var grid = $("#rolePopupGrid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                options.callbackFunc($("#roleId").val(), $("#roleNm").val());
            }
        });

        // 닫기 버튼.
        $("#btnRoleClose").kendoButton({
            click:function(e){
                parent.rolePopupWin.close();
            }
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#rolePopupGrid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/mail/internalMail/selectInternalMailRoleByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number"}
                            ,roleId:{type:"string"}
                            ,roleNm:{type:"string"}
                        }
                    }
                }
            }
            ,height:280
            ,selectable:"row"
            ,multiSelectWithCheckbox:true
            ,editable:false
            ,navigatable:false
            ,pageable:false
            ,sortable:false
            ,change:function(e) {
                if (this.select().length > 0) {
                    var dataItem = this.dataItem(this.select());

                    fnRoleInfo(dataItem);
                }
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60 ,attributes:{"class":"ac"}}
                ,{field:"roleId", title:"<spring:message code='global.lbl.roleId' />", width:200 ,attributes:{"class":"al"}}
                ,{field:"roleNm", title:"<spring:message code='global.lbl.roleNm' />", width:200 ,attributes:{"class":"al"}}
                ,{title:""}
            ]
        });
    });
</script>