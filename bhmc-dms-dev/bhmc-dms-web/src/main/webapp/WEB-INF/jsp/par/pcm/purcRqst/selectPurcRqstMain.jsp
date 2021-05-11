<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- partsOrderReqeust -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.purcRqst" /> --%><!-- purcRqst --></h1>
        <div class="btn_right">
            <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /></button><!--search  -->
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
                    <th scope="row"><spring:message code="par.lbl.purcReqTp" /><!-- purcReqTp --></th>
                    <td>
                        <input id="sPurcReqTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.purcReqStatCd" /><!-- purcReqStatCd --></th>
                    <td>
                        <input id="sPurcReqStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row">&nbsp;</th>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.strgeNm" /><!-- strgeNm --></th>
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.purcReqNo" /><!-- purcReqNo --></th>
                    <td>
                        <input id="sPurcReqNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd --></th>
                    <td>
                        <div class="form_search">
                            <input id="sItemCd" class="form_input" />
                            <a href="javascript:;" onclick="javascript:selectPartsMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span></span><spring:message code="par.lbl.reqDt" /><!-- reqDt --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPurcReqStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPurcReqEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.regDt" /><!-- regDt --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sReqStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sReqEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.delYn" /><!-- delYn --></th>
                    <td>
                        <input type="checkbox" id="sDelYn" value="N" class="form_check" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" ></div>
    </div>

</section>
<!-- //partOrderRequest -->

<!-- script -->
<script>
//purcReqTpList
var purcReqTpList = [];
<c:forEach var="obj" items="${purcReqTpList}">
purcReqTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//purcReqTpMap
var purcReqTpMap = {};
$.each(purcReqTpList, function(idx, obj){
    purcReqTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//purcReqStatCdList
var purcReqStatCdList = [];
<c:forEach var="obj" items="${purcReqStatCdList}">
purcReqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//purcReqStatCdMap
var purcReqStatCdMap = {};
$.each(purcReqStatCdList, function(idx, obj){
    purcReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//prcQtyUnitCdDs
var prcQtyUnitCdDs = [];
<c:forEach var="obj" items="${prcQtyUnitCdDs}">
prcQtyUnitCdDs.push({
    "unitCd":"${obj.unitCd}"
    ,"unitNm":"${obj.unitExtCd}"
});
</c:forEach>
//prcQtyUnitCdMap
var prcQtyUnitCdMap = {};
$.each(prcQtyUnitCdDs, function(idx, obj){
    prcQtyUnitCdMap[obj.unitCd] = obj.unitNm;
});
//strgeCdDs
var strgeCdDs = [];
<c:forEach var="obj" items="${strgeCdDs}">
strgeCdDs.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
//strgeCdMap
var strgeCdMap = {};
$.each(strgeCdDs, function(idx, obj){
    strgeCdMap[obj.strgeCd] = obj.strgeNm;
});
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
                var ds = $("#grid").data("kendoExtGrid").dataSource.page(1);
            }
        });
        //sPurcReqTp
        $("#sPurcReqTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcReqTpList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sPurcReqStatCd
        $("#sPurcReqStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcReqStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sStrgeCd
        $("#sStrgeCd").kendoExtDropDownList({
            dataTextField:"strgeNm"
            ,dataValueField:"strgeCd"
            ,dataSource:strgeCdDs
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sPurcReqNo focus
        $("#sPurcReqNo").focus();
        //sPurcReqStartDt
        var startDt = new Date();
        startDt.setDate(1);
        $("#sPurcReqStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sPurcReqEndDt
        $("#sPurcReqEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sReqStartDt
        $("#sReqStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sReqEndDt
        $("#sReqEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //grid
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0808-160801"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcRqst/selectPurcRqstes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sPurcReqTp"] = $("#sPurcReqTp").val();
                            params["sPurcReqNo"] = $("#sPurcReqNo").val();
                            params["sStrgeCd"] = $("#sStrgeCd").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sPurcReqStatCd"] = $("#sPurcReqStatCd").val();
                            params["sPltCd"] = "${pltCd}";
                            params["sStrgeCd"] = $("#sStrgeCd").val();

                            params["sPurcReqStartDt"] = $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sPurcReqEndDt"] = $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();

                            params["sDelYn"] = $("#sDelYn").prop("checked") == true ? "Y":"N";

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"purcReqNo"
                        ,fields:{
                            dlrCd:{ type:"string" , validation:{required:true} }
                            ,purcReqNo:{ type:"string" }
                            ,purcReqLineNo:{ type:"number" }
                            ,purcReqTp:{ type:"string" }
                            ,purcReqStatCd:{ type:"string" }
                            ,refDocNo:{ type:"string" }
                            ,refDocLineNo:{ type:"string" }
                            ,pltCd:{ type:"string" }
                            ,strgeCd:{ type:"string" }
                            ,itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,purcReqQty:{ type:"number" }
                            ,purcReqUnitCd:{ type:"string" }
                            ,purcReqDt:{ type:"date" }
                            ,delYn:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"date" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"date" }
                        }
                    }
                }
            }
            ,editable:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,columns :
                [{ field:"purcReqDt", title:"<spring:message code='par.lbl.reqDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{ field:"purcReqTp", title:"<spring:message code='par.lbl.reqTp' />"
                    ,width:80
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.purcReqTp){
                            case "01":// Service
                                spanObj = "<span class='txt_label bg_yellow'>"+purcReqTpMap[dataItem.purcReqTp]+"</span>";
                                break;
                            case "02":// Manual
                                spanObj = "<span class='txt_label bg_green'>"+purcReqTpMap[dataItem.purcReqTp]+"</span>";
                                break;
                            default: // request
                                spanObj = "<span class='txt_label bg_gray'>"+purcReqTpMap[dataItem.purcReqTp]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{ field:"purcReqNo", title:"<spring:message code='par.lbl.purcReqNo' />", width:150 }
                ,{ field:"purcReqLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60 }
                ,{ field:"purcReqStatCd", title:"<spring:message code='par.lbl.statNm' />"
                    ,width:80
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.purcReqStatCd){
                            case "02":// ok
                                spanObj = "<span class='txt_label bg_blue'>"+purcReqStatCdMap[dataItem.purcReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+purcReqStatCdMap[dataItem.purcReqStatCd]+"</span>";
                                break;
                            default: // request
                                spanObj = "<span class='txt_label bg_gray'>"+purcReqStatCdMap[dataItem.purcReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{ field:"delYn", title:"<spring:message code='par.lbl.delYn' />", width:60 }
                ,{ field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:150 }
                ,{ field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:200 }
                ,{ field:"purcReqQty", title:"<spring:message code='par.lbl.reqQty' />", attributes:{"class":"ar"}, width:60 }
                ,{ field:"purcReqUnitCd", title:"<spring:message code='par.lbl.unitNm' />", width:80
                    ,template:'#if(prcQtyUnitCdMap != null){# #= prcQtyUnitCdMap[purcReqUnitCd]# #}#'
                }
                , { field:"strgeCd", title:"<spring:message code='par.lbl.strgeNm' />", width:100
                    ,template:'#if(strgeCd != null){# #= strgeCdMap[strgeCd]# #}#'
                }
                , { field:"refDocNo", title:"<spring:message code='par.lbl.refDocNo' />", width:150 }
                , { field:"refDocLineNo", title:"<spring:message code='par.lbl.lineNm' />", width:60 }
            ]
        });

    });
</script>
<!-- //script -->

