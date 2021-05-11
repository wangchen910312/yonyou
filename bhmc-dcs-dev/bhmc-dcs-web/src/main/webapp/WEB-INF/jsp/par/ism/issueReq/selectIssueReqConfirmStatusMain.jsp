<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- issueReqConfirmStatus -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.parReqConfirmStatus" /> --%><!-- parReqConfirmStatus --></h1>
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--search -->
            </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:12%;">
                <col style="width:21%;">
                <col style="width:12%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.parGiTp" /><!-- parGiTp --></th>
                    <td>
                        <input id="sParGiTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.parReqDocNo" /><!-- parReqDocNo --></th>
                    <td>
                        <input id="sParReqDocNo" name="sParReqDocNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- giDocNo --></th>
                    <td>
                        <input id="sGiDocNo" name="sGiDocNo" class="form_input" />
                    </td>
                </tr>
                <tr>
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
                    <th scope="row"><spring:message code="par.lbl.custNo" /><!-- custNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCustCd" name="sCustCd" class="form_input" />
                                <a href="javascript:;"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.giDocStatCd" /><!-- giDocStatCd --></th>
                    <td>
                        <input id="sGiDocStatCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.giDocRegDt" /><!-- giDocRegDt --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sGiDocStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sGiDocEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNm" /><!-- custNm --></th>
                    <td>
                        <input id="sCustNm" name="sCustNm" class="form_input" maxlength="15" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carNo" /><!-- carNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCarNo" name="sCarNo" class="form_input" />
                                <a href="javascript:;"><!-- search --></a>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.serPrsnId" /><!-- serPrsnId --></th>
                    <td>
                        <div class="form_search">
                            <input id="sSerPrsnId" name="sSerPrsnId" class="form_input" />
                                <a href="javascript:;"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABS Class --></th>
                    <td>
                        <input id="sAbcInd" name="sAbcInd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- carLine --></th>
                    <td>
                        <input id="sCarLineCd" name="sCarLineCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd--></th>
                    <td>
                        <div class="form_search">
                            <input id="sItemCd" name="sItemCd" class="form_input" />
                                <a href="javascript:;"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- itemNm --></th>
                    <td>
                        <input id="sItemNm" name="sItemNm" class="form_input" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="targetReqStatusGrid" ></div>
    </div>

</section>
<!-- //issueReqConfirmStatus -->
<!-- script -->
<script>
//parGiTpList
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
if("${obj.cmmCd}" !== "SR"){
    parGiTpList.push({
        "cmmCd":"${obj.cmmCd}"
        ,"cmmCdNm":"${obj.cmmCdNm}"
    });
}
</c:forEach>
var parGiTpMap = [];
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCdList
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    ,"cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var partsParReqStatCdMap = [];
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//ABC Class
var abcIndList = [];
<c:forEach var="obj" items="${abcIndList}">
abcIndList.push({
    "abcCd":"${obj.abcCd}"
    ,"abcNm":"${obj.abcCd}"
});
</c:forEach>
//carLineList
var carLineList = [];
<c:forEach var="obj" items="${carLineList}">
carLineList.push({
    "carlineCd":"${obj.carlineCd}"
    ,"carlineNm":"${obj.carlineNm}"
});
</c:forEach>
//giStrgeCdList
var giStrgeCdList = [];
<c:forEach var="obj" items="${giStrgeCdList}">
giStrgeCdList.push({
    "strgeCd":"${obj.strgeCd}"
    ,"strgeNm":"${obj.strgeNm}"
});
</c:forEach>
var giStrgeCdMap = [];
$.each(giStrgeCdList, function(idx, obj){
    giStrgeCdMap[obj.strgeCd] = obj.strgeNm;
});
//giLocCdList
var giLocCdList = [];
<c:forEach var="obj" items="${giLocCdList}">
giLocCdList.push({
    "locCd":"${obj.locCd}"
    ,"locNm":"${obj.locNm}"
});
</c:forEach>
var giLocCdMap = [];
$.each(giLocCdList, function(idx, obj){
    giLocCdMap[obj.locCd] = obj.locNm;
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
//selectIssueReqes Func
function selectIssueReqes(){
    $("#targetReqStatusGrid").data("kendoExtGrid").dataSource.read();
}

    $(document).ready(function() {
        //btnSearch
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                //selectIssueReqes Func call
                selectIssueReqes();
            }
        });
        //sParGiTp
        $("#sParGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:parGiTpList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sGiDocStatCd
        $("#sGiDocStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:partsParReqStatCdList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sAbcInd
        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"abcNm"
            ,dataValueField:"abcCd"
            ,dataSource:abcIndList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
        });
        //sCarLineCd
        $("#sCarLineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
            ,dataValueField:"carlineCd"
            ,dataSource:carLineList
            ,optionLabel:" "
            ,autoBind:false
            ,index:0
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
        //sGiDocStartDt
        $("#sGiDocStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //sGiDocEndDt
        $("#sGiDocEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //tab
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                var selectTabId = e.item.id;
            }
        });
        //targetReqStatusGrid
        $("#targetReqStatusGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqDetailConfirms.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sParGiTp"] = $("#sParGiTp").val();
                            params["sParReqDocNo"] = $("#sParReqDocNo").val();
                            params["sGiDocNo"] = $("#giDocNo").val();
                            params["sGiDocStatCd"] = $("#sGiDocStatCd").val();
                            params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sGiDocStartDt"] = $("#sGiDocStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sGiDocEndDt"] = $("#sGiDocEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sCustCd"] = $("#sCustCd").val();
                            params["sCustNm"] = $("#sCustNm").val();
                            params["sSerPrsnId"] = $("#sSerPrsnId").val();
                            params["sCarNo"] = $("#sCarNo").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sAbcInd"] = $("#sAbcInd").val();
                            params["sCarLineCd"] = $("#sCarLineCd").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"giDocNo"
                            ,fields:{
                                rnum:{ type:"number", validation:{required:true}, editable:false }
                                ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                                ,giDocNo:{ type:"string", validation:{required:true}, editable:false }
                                ,giDocLineNo:{ type:"string", validation:{required:true}, editable:false }
                                ,giDocStatCd:{ type:"string", validation:{required:true}, editable:false }
                                ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                                ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                                ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                                ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                                ,roDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                                ,giStrgeCd:{ type:"string", validation:{required:true} }
                                ,giLocCd:{ type:"string", validation:{required:true} }
                                ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                                ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                                ,giQty:{ type:"number" , validation:{required:true}, editable:false }
                                ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                                ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                                ,mvtDocYyMm:{ type:"string" , validation:{required:true}, editable:false }
                                ,mvtDocNo:{ type:"string" , validation:{required:true}, editable:false }
                                ,mvtDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                                ,regDt:{ type:"date" , validation:{required:true}, editable:false }
                                ,updtDt:{ type:"date" , validation:{required:true}, editable:false }
                            }
                    }
                }
            }
            ,multiSelectWithCheckbox:false
            ,columns:[
                { field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{ field:"giDocStatCd", title:"<spring:message code='par.lbl.statNm'/>"
                    ,width:70
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.giDocStatCd){
                            case "02"://ok
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.giDocStatCd]+"</span>";
                                break;
                            case "03"://cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.giDocStatCd]+"</span>";
                                break;
                            default: //request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.giDocStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//rnum
                ,{ field:"regDt", title:"<spring:message code='par.lbl.reqDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }          //regDt
                ,{ field:"updtDt", title:"<spring:message code='par.lbl.giDocRegDt'/>", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }    //updtDt
                ,{ field:"giDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:110 }                                                           //giDocNo
                ,{ field:"giDocLineNo", title:"Line", width:50 }                                                                                            //giDocLineNo
                ,{ field:"parGiTp", title:"<spring:message code='par.lbl.parGiTp'/>"
                    ,width:90
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parGiTp){
                            case "SR"://SR
                                spanObj = "<span class='txt_label bg_yellow'>"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "RO"://RO
                                spanObj = "<span class='txt_label bg_green'>"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            default: //request
                                spanObj = "<span class='txt_label bg_gray'>"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parGiTp
                ,{ field:"parReqDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:120 }//parReqDocNo
                ,{ field:"parReqDocLineNo", title:"Line", width:50 }//parReqDocLineNo
                ,{ field:"custNm", title:"<spring:message code='par.lbl.custNm'/>", width:70 }//custNm
                ,{ field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:100 }//carNo
                ,{ field:"serPrsnId", title:"<spring:message code='par.lbl.serPrsnId'/>", width:100 }//serPrsnId
                ,{ field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>", width:100 }//itemCd
                ,{ field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }//itemNm
                ,{ field:"unitCd", title:"<spring:message code='par.lbl.unitCd'/>", width:70 }//unitCd
                ,{ field:"giQty", title:"<spring:message code='par.lbl.giQty'/>"
                    ,width:70
                    ,attributes:{"class":"ac"}
                }//giQty
                ,{ field:"giStrgeCd", title:"<spring:message code='par.lbl.giStrgeCd'/>"
                    ,width:100
                    ,template:"#if(giStrgeCd != null){# #= giStrgeCdMap[giStrgeCd] # #}#"
                }//giStrgeCd
                ,{ field:"giLocCd", title:"<spring:message code='par.lbl.giLocCd'/>"
                    ,width:100
                    ,template:"#if(giLocCd != null){# #= giLocCdMap[giLocCd] # #}#"
                }//giLocCd
            ]
        });

    });
</script>
<!-- //script -->
