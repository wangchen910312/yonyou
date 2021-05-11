<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- selectLeaveItemMain -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.leavingPartsMgr" /></h1> --%>
        <div class="btn_left">
		<dms:access viewId="VIEW-D-11983" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnInit" name="btnInit" class="btn_m btn_m_min btn_reset"><spring:message code="par.btn.init" /></button>
		</dms:access>
        </div>
        <div class="btn_right">
		<dms:access viewId="VIEW-D-11982" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_m_min btn_search"><spring:message code="par.btn.search" /></button>
		</dms:access>
        </div>
    </div>
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
                <col style="width:15%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.sellerDealerCd" /></th>
                    <td>
                        <input id="sSellerDealerCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.buyerDealerCd" /></th>
                    <td>
                        <input id="sBuyerDealerCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.sellType" /></th>
                    <td>
                        <input id="sSellType" value="" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.finishTime" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sFinishStartDt" class="form_comboBox" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sFinishEndDt" class="form_comboBox" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <section class="group">
        <div class="table_grid mt10">
            <div id="leavePartsInterGrid" class="resizable_grid" ></div>
        </div>
    </section>
</section>

</div>
<!-- // selectLeaveItemMain -->
<!-- script -->
<script type="text/javascript">

var sellTypeCdList = [];
<c:forEach var="obj" items="${sellTypeCdList}" varStatus="status">
    sellTypeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//page init Func
function pageInit(){

    $("#sSellerDealerCd").val("");
    $("#sBuyerDealerCd").val("");
    $("#sSellType").data("kendoExtDropDownList").select(0);
    $("#sFinishStartDt").data("kendoExtMaskedDatePicker").value("");
    $("#sFinishEndDt").data("kendoExtMaskedDatePicker").value("");

}

$(document).ready(function() {
    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            pageInit();
        }
    });
    //btnSearch
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#leavePartsInterGrid").data("kendoExtGrid").dataSource.read();
        }
    });
    //sSellType
    $("#sSellType").kendoExtDropDownList({
        dataSource:sellTypeCdList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,autoBind:true
        ,index:0
    });
    //sFinishStartDt
    $("#sFinishStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //sFinishEndDt
    $("#sFinishEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    //leavePartsInterGrid
    $("#leavePartsInterGrid").kendoExtGrid({
        gridId:"G-PAR-0808-150802"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/cpm/leaveItem/selectLeaveItemInterfaces.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSellerDealerCd"] = $("#sSellerDealerCd").val();
                        params["sBuyerDealerCd"] = $("#sBuyerDealerCd").val();
                        params["sSellType"] = $("#sSellType").val();
                        params["sFinishStartTime"] = $("#sFinishStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sFinishEndTime"] = $("#sFinishEndDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                        seq:{ type:"string" }
                        ,sellType:{ type:"string" }
                        ,buyerDealerCd:{ type:"string" }
                        ,buyerDealerNm:{ type:"string" }
                        ,sellerDealerCd:{ type:"string" }
                        ,sellerDealerNm:{ type:"string" }
                        ,parPartNocd:{ type:"string" }
                        ,num:{ type:"number" }
                        ,price:{ type:"number" }
                        ,totTurnover:{ type:"number" }
                        ,finishTime:{ type:"date" }
                    }
                }
            }
        }
        ,editable:false
        ,multiSelectWithCheckbox:false
        ,autoBind:true
        ,filterable:false
        ,selectable:"row"
        ,appendEmptyColumn:true//empty column. default:false
        ,columns:[
            {field:"seq", title:"<spring:message code='par.lbl.leaveItemOrdNo'/>", width:100 }
            ,{field:"finishTime", title:"<spring:message code='par.lbl.finishTime'/>", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
            ,{field:"buyerDealerCd", title:"<spring:message code='par.lbl.buyerDealerCd'/>", width:100 }
            ,{field:"buyerDealerNm", title:"<spring:message code='par.lbl.buyerDealerNm'/>", width:100 }
            ,{field:"sellerDealerCd", title:"<spring:message code='par.lbl.sellerDealerCd'/>", width:100 }
            ,{field:"sellerDealerNm", title:"<spring:message code='par.lbl.sellerDealerNm'/>", width:100 }
            ,{field:"parPartNocd", title:"<spring:message code='par.lbl.parPartNocd'/>", width:150 }
            ,{field:"num", title:"<spring:message code='par.lbl.num'/>", width:80 , format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"price", title:"<spring:message code='par.lbl.leaveItemPrice'/>", width:150 , format:"{0:n2}", attributes:{"class":"ar"} }
            ,{field:"totTurnover", title:"<spring:message code='par.lbl.totTurnover'/>", width:150 , format:"{0:n2}", attributes:{"class":"ar"} }
        ]
    });

});
</script>
<!-- //script -->