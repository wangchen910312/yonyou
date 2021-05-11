<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <input type="hidden" id="usrId" name="usrId" />
    <input type="hidden" id="usrNm" name="usrNm" />

    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_cancel" id="btnUserSelect"><spring:message code="global.btn.select" /></button>
            <button class="btn_s btn_cancel" id="btnUserClose"><spring:message code="global.btn.close" /></button>
        </div>
    </div>

    <div class="table_grid">
        <div id="userPopupGrid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">
    fnUserInfo = function(dataItem) {
        $("#usrId").val(dataItem.usrId);
        $("#usrNm").val(dataItem.usrNm);
    }

    $(document).ready(function() {
        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.userPopupWin.options.content.data;

         var sDistCd = options.distCd;
         var sDlrCd = options.dlrCd;

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 선택 버튼.
        $("#btnUserSelect").kendoButton({
            click:function(e){
                var grid = $("#userPopupGrid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                options.callbackFunc($("#usrId").val(), $("#usrNm").val());
            }
        });

        // 닫기 버튼.
        $("#btnUserClose").kendoButton({
            click:function(e){
                parent.userPopupWin.close();
            }
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#userPopupGrid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/mail/internalMail/selectInternalMailUsrByCondition.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["sDistCd"] = sDistCd;
                            params["sDlrCd"] = sDlrCd;

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
                            rnum:{type:"number"}
                            ,usrId:{type:"string"}
                            ,usrNm:{type:"string"}
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

                    fnUserInfo(dataItem);
                }
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, attributes:{"class":"ac"}}
                ,{field:"usrId", title:"<spring:message code='global.lbl.usrId' />", width:200, attributes:{"class":"al"}}
                ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:200, attributes:{"class":"al"}}
                ,{title:""}
            ]

        });
    });
</script>