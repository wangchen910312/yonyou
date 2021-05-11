<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- sale price history -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.salePriceHistoryTarget" /> --%><!-- salePriceHistoryTarget --></h1>
        <div class="btn_right">
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
        </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.supplyNm" /><!-- supplyNm --></th>
                    <td class="required_area">
                        <input type="hidden" id="sBpCd" name="sBpCd" value="${bpCd}" />
                        <div class="form_search">
                            <input id="sBpNm" name="sBpNm" class="form_input" value="${bpNm}" />
                            <a href="javascript:;" onclick="javascript:selectVenderMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.salePrcTp" /><!-- salePrcTp --></th>
                    <td>
                        <input id="sPrcTp" name="sPrcTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.regUsrId" /><!-- regUsrId --></th>
                    <td>
                        <input type="hidden" id="sRegUsrId" name="sRegUsrId" value="" />
                        <div class="form_search">
                            <input id="sRegUsrNm" name="sRegUsrNm" class="form_input" value="" />
                            <a href="javascript:;"><!-- search --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- itemDstinCd --></th>
                    <td>
                        <input id="sItemDstinCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABS Class --></th>
                    <td>
                        <input id="sAbcInd" name="sAbcInd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- carLine --></th>
                    <td>
                        <input id="sCarlineCd" name="sCarlineCd" class="form_comboBox" />
                    </td>

                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.applyDt" /><!-- applyDt--></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input data-type="date" id="sApplyStartDt" name="sApplyStartDt" required class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input data-type="date" id="sApplyEndDt" name="sApplyEndDt" required class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd --></th>
                    <td>
                        <div class="form_search">
                            <input id="sItemCd" class="form_input" />
                            <a href="javascript:;" onclick="javascript:selectPartsMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- itemNm --></th>
                    <td>
                        <input id="sItemNm" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <section class="group">
        <div class="header_area">
        </div>
        <div class="table_grid">
            <div id="grid" ></div>
    </div>
    </section>

</section>
<!-- //sale price history  -->

<!-- script -->
<script>
//unitCdDs
var unitCdDs = [];
<c:forEach var="obj" items="${unitCdDs}">
unitCdDs.push({
    "unitCd":"${obj.unitCd}"
    ,"unitNm":"${obj.unitNm}"
});
</c:forEach>
var unitCdMap = {};
$.each(unitCdDs, function(idx, obj){
    unitCdMap[obj.unitCd] = obj.unitNm;
});
//partsCarTpDs
var partsCarTpDs = [];
<c:forEach var="obj" items="${partsCarTpDs}">
partsCarTpDs.push({
    "carlineCd":"${obj.carlineCd}"
    ,"carlineNm":"${obj.carlineNm}"
});
</c:forEach>
//ABC CLASS
var abcIndList = [];
<c:forEach var="obj" items="${abcIndList}">
abcIndList.push({
    "abcCd":"${obj.cmmCd}"
    ,"abcCdNm":"${obj.cmmCd}"
});
</c:forEach>
//itemDstinCdList
var itemDstinCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var itemDstinCdMap = {};
$.each(itemDstinCdList, function(idx, obj){
    itemDstinCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//salePrcTpList
var salePrcTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${salePrcTpList}">
salePrcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//salePrcTpMap
var salePrcTpMap = {};
$.each(salePrcTpList, function(idx, obj){
    salePrcTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//supply search popup Func
var supplierSearchPopupWin;
function selectVenderMasterPopupWindow(){
    supplierSearchPopupWin = dms.window.popup({
        windowId:"supplierSearchPopupWin"
        ,title:"<spring:message code = 'par.title.supplyInfo'/>"   //supplyInfo
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectSupplierMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"bpCd":$("#sBpCd").val()
                ,"bpNm":$("#sBpNm").val()
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        $("#sBpCd").val(data[0].bpCd);
                        $("#sBpNm").val(data[0].bpNm);
                    }
                }
            }
        }
    });
}
//item search popup Func
var searchItemPopupWindow;
function selectPartsMasterPopupWindow(){
    searchItemPopupWindow = dms.window.popup({
        windowId:"searchItemPopupWindow"
        ,title:"<spring:message code='par.title.itemInfo' />"   //itemInfo
        ,content:{
            url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false
                ,"itemCd":$("#sItemCd").val()
                ,"callbackFunc":function(data){
                    if(data.length > 0){
                        $("#sItemCd").val(data[0].itemCd);
                        $("#sItemNm").val(data[0].itemNm);
                    }
                }
            }
        }
    });
}

    $(document).ready(function() {
        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                var vBpCd = $("#sBpCd").val();
                var vBpNm = $("#sBpNm").val();
                if(vBpCd === ""){
                   // supplyCd check message
                    dms.notification.info("<spring:message code='par.lbl.supplyCd' var='supplyCd' /><spring:message code='global.info.required.field' arguments='${supplyCd}' />");
                    $("#sBpNm").focus();

                    return false;
                }
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });
        // itemCd focus
        $("#sItemCd").focus();
        // carlineCd dropdownlist
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
            ,dataValueField:"carlineCd"
            ,optionLabel:" "
            ,dataSource:partsCarTpDs
            ,autoBind:false
            ,index:0
        });
        // abc class dropdownlist
        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"abcCdNm"
            ,dataValueField:"abcCd"
            ,optionLabel:" "
            ,dataSource:abcIndList
            ,autoBind:false
            ,index:0
        });
        //sPrcTp
        $("#sPrcTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:salePrcTpList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sItemDstinCd
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sApplyStartDt
        $("#sApplyStartDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sApplyEndDt
        $("#sApplyEndDt").kendoExtMaskedDatePicker({
            value:new Date("${sysDate}")
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //grid
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/partsPriceMaster/selectPartsVenderSalPriceTargetHistorys.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sBpCd"] = $("#sBpCd").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sPrcTp"] = $("#sPrcTp").val();
                            params["sAbcInd"] = $("#sAbcInd").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").val();
                            params["sCarlineCd"] = $("#sCarlineCd").val();
                            params["sApplyStartDt"] = $("#sApplyStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sApplyEndDt"] = $("#sApplyEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sRegUsrId"] = $("#sRegUsrId").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"itemCd"
                        ,fields:{
                            dlrCd:{ type:"string" ,validation:{required:true} }
                            ,applyDt:{ type:"date" , editable:false}
                            ,itemCd:{ type:"string" , editable:false}
                            ,itemNm:{ type:"string" , editable:false}
                            ,itemDstinCd:{ type:"string" , editable:false}
                            ,carlineCd:{ type:"string" , editable:false}
                            ,abcInd:{ type:"string" , editable:false}
                            ,prcTp:{ type:"string" , editable:false}
                            ,salePrcAmt:{ type:"number" , editable:false}
                            ,regUsrId:{ type:"string" , editable:false}
                        }
                    }
                }
            }
            ,editable:true
            ,autoBind:false
            ,columns :
                [{ title:"<spring:message code='par.lbl.applyDt' />", field:"applyDt", format:"{0:<dms:configValue code='dateFormat' />}", width:60 }    //applyDt
                ,{ title:"<spring:message code='par.lbl.salePrcTp' />", field:"prcTp", width:60
                    ,template:'#if(prcTp !== ""){# #= salePrcTpMap[prcTp]# #}#'
                }//prcTp
                ,{ title:"<spring:message code='par.lbl.itemCd' />", field:"itemCd", width:100 }          //itemCd
                ,{ title:"<spring:message code='par.lbl.itemNm' />", field:"itemNm", width:150 }          //itemNm
                ,{ title:"<spring:message code='par.lbl.itemDstinCd' />", field:"itemDstinCd", width:80
                    ,template:'#if(itemDstinCd !== ""){# #= itemDstinCdMap[itemDstinCd]# #}#'
                }//itemDstinCd
                ,{ title:"<spring:message code='par.lbl.carLine' />", field:"carlineCd", width:70 }       //carlineCd
                ,{ title:"<spring:message code='par.lbl.abcInd' />", field:"abcInd", width:50 }           //ABCInd
                ,{ title:"<spring:message code='par.lbl.prc' />", field:"salePrcAmt", width:70,attributes:{"class":"ar"}, format:"{0:n2}" }      //salePrcAmt
                ,{ title:"<spring:message code='par.lbl.regUsrId' />", field:"regUsrId", width:70 }       //regUsrId
            ]
        });
    });
</script>
<!-- //script -->

