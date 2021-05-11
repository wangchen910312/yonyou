<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- issueReqStatus -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><%-- <spring:message code="par.title.parReqStatus" /> --%><!-- parReqStatus --></h1>
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--search  -->
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
                <col style="">
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
                    <th scope="row"><spring:message code="par.lbl.parReqStatCd" /><!-- parReqStatCd --></th>
                    <td>
                        <input id="sParReqStatCd" class="form_comboBox" />
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
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.custNm" /><!-- custNm --></th>
                    <td>
                        <input id="sCustNm" name="sCustNm" class="form_input" maxlength="15" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.serPrsnId" /><!-- serPrsnId --></th>
                    <td>
                        <div class="form_search">
                            <input id="sSerPrsnId" name="sSerPrsnId" class="form_input" />
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carNo" /><!-- carNo --></th>
                    <td>
                        <div class="form_search">
                            <input id="sCarNo" name="sCarNo" class="form_input" />
                                <a href="javascript:;" onclick="javascript:selectReadyPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABS Class --></th>
                    <td>
                        <input id="sAbcInd" name="sAbcInd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd--></th>
                    <td>
                        <div class="form_search">
                            <input id="sItemCd" name="sItemCd" class="form_input" />
                                <a href="javascript:;" onclick="javascript:selectPartsMasterPopupWindow();"><!-- search --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- itemNm --></th>
                    <td>
                        <input id="sItemNm" name="sItemNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.carLine" /><!-- carLine --></th>
                    <td>
                        <input id="sCarLineCd" name="sCarLineCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="targetReqStatusGrid" ></div>
    </div>

</section>
<!-- //issueReqStatus -->

<!-- script -->
<script>
//parGiTpList
var parGiTpList = [];
<c:forEach var="obj" items="${parGiTpList}">
parGiTpList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//parGiTpMap
var parGiTpMap = [];
$.each(parGiTpList, function(idx, obj){
    parGiTpMap[obj.cmmCd] = obj.cmmCdNm;
});
//partsParReqStatCdList
var partsParReqStatCdList = [];
<c:forEach var="obj" items="${partsParReqStatCdList}">
partsParReqStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//partsParReqStatCdMap
var partsParReqStatCdMap = [];
$.each(partsParReqStatCdList, function(idx, obj){
    partsParReqStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});
//abcIndList
var abcIndList = [];
<c:forEach var="obj" items="${abcIndList}">
abcIndList.push({
    "abcCd":"${obj.abcCd}"
    , "abcNm":"${obj.abcCd}"
});
</c:forEach>
//carLineList
var carLineList = [];
<c:forEach var="obj" items="${carLineList}">
carLineList.push({
    "carlineCd":"${obj.carlineCd}"
    , "carlineNm":"${obj.carlineNm}"
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
//location Array
var locCdList = [];
<c:forEach var="obj" items="${locCdList}">
locCdList.push({
    "locCd":"${obj.locCd}"
    ,"locNm":"${obj.locNm}"
});
</c:forEach>
var locCdMap = [];
$.each(locCdList, function(idx, obj){
    locCdMap[obj.locCd] = obj.locNm;
});
//popup ready Func
function selectReadyPopupWindow(){
    // ready message
    dms.notification.success("<spring:message code='global.info.ready'/>");
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
                //sReqEndDt value is not empty
                if($("#sReqEndDt").val() != ""){
                    //sReqStartDt value is  empty
                    if($("#sReqStartDt").val() == ""){
                        //reqStartDt check message
                        dms.notification.info("<spring:message code='par.lbl.regStartDt' var='regStartDt' /><spring:message code='global.info.emptyCheckParam' arguments='${regStartDt}' />");
                        return false;
                    }
                }
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
        //sParReqStatCd
        $("#sParReqStatCd").kendoExtDropDownList({
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
                        url:"<c:url value='/par/ism/issueReq/selectIssueReqStatues.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sParGiTp"] = "RO";
                            params["sParReqDocNo"] = $("#sParReqDocNo").val();
                            params["sParReqStatCd"] = $("#sParReqStatCd").val();
                            params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();
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
                        id:"parReqDocLineNo"
                        ,fields:{
                            rnum:{ type:"number", validation:{required:true}, editable:false }
                            ,dlrCd:{ type:"string", validation:{required:true}, editable:false }
                            ,pltCd:{ type:"string", validation:{required:true}, editable:false }
                            ,parReqDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,parReqDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,parReqStatCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,purcReqNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqStrgeCd:{ type:"string" , validation:{required:true} }
                            ,cancYn:{ type:"string" , validation:{required:true}, editable:false }
                            ,parGiTp:{ type:"string" , validation:{required:true}, editable:false }
                            ,roDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,roLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,giCauNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocNo:{ type:"string" , validation:{required:true}, editable:false }
                            ,resvDocLineNo:{ type:"number" , validation:{required:true}, editable:false }
                            ,grStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giStrgeCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,giLocCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,dbItemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,pkgItemCd:{ type:"string", editable:false }
                            ,itemCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,itemNm:{ type:"string" , validation:{required:true}, editable:false }
                            ,unitCd:{ type:"string" , validation:{required:true}, editable:false }
                            ,reqQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,endQty:{ type:"number" , validation:{required:true}, editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,clamStockQty:{ type:"number", editable:false }
                            ,grScheQty:{ type:"number", editable:false }
                            ,giScheQty:{ type:"number", editable:false }
                            ,resvQty:{ type:"number", editable:false }
                            ,purcReqDt:{ type:"date" , editable:false }
                            ,giDocNo:{ type:"string" , editable:false }
                            ,giDocTp:{ type:"string" , editable:false }
                            ,giDocStatCd:{ type:"string" , editable:false }
                            ,dbYn:{ type:"string" , editable:false }
                            ,itemPrc:{ type:"number" , editable:false }
                            ,itemAmt:{ type:"number" , editable:false }
                            ,taxDdctAmt:{ type:"number" , editable:false }
                            ,taxAmt:{ type:"number" , editable:false }
                            ,receiveDt:{ type:"date" , editable:false }
                            ,receiveId:{ type:"string" , editable:false }
                            ,returnPartsQty:{ type:"number" , editable:false }
                            ,returnDt:{ type:"date" , editable:false }
                            ,returnId:{ type:"string" , editable:false }
                            ,etcGiTp:{ type:"string" , editable:false }
                            ,giDt:{ type:"date" , editable:false }
                        }
                    }
                }
            }
            ,editable:false
            ,multiSelectWithCheckbox:false
            ,columns :
                [{field:"rnum", title:"<spring:message code='par.lbl.no' />",width:30,attributes:{"class":"ac"},sortable:false}//rnum
                ,{field:"parReqStatCd", title:"<spring:message code='par.lbl.parReqStatCd'/>"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parReqStatCd){
                            case "02":// complete
                                spanObj = "<span class='txt_label bg_blue'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            case "03":// cancel
                                spanObj = "<span class='txt_label bg_red'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+partsParReqStatCdMap[dataItem.parReqStatCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }
                ,{field:"giDt", title:"<spring:message code='par.lbl.giDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"parReqDocNo", title:"<spring:message code='par.lbl.giDocNo'/>", width:100 }
                ,{field:"parReqDocLineNo", title:"<spring:message code='par.lbl.lineNm'/>", width:50 }
                ,{ field:"parGiTp", title:"<spring:message code='par.lbl.parGiTp'/>"
                    ,width:120
                    ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                        var spanObj = "";
                        switch(dataItem.parGiTp){
                            case "SR"://SR
                            case "IN"://IN
                                spanObj = "<span class='txt_label bg_yellow'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "RO"://RO
                                spanObj = "<span class='txt_label bg_green'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            case "SA"://SA(Parts Sale)
                                spanObj = "<span class='txt_label bg_blue'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                            default: // ready:request
                                spanObj = "<span class='txt_label bg_gray'>"+"["+dataItem.parGiTp+"]"+parGiTpMap[dataItem.parGiTp]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//parGiTp
                ,{ field:"roDocNo", title:"<spring:message code='par.lbl.parReqDocNo'/>", width:130}
                ,{ field:"custNm", title:"<spring:message code='par.lbl.custNm'/>", width:70}
                ,{ field:"carNo", title:"<spring:message code='par.lbl.carNo'/>", width:80}
                ,{ field:"serPrsnId", title:"<spring:message code='par.lbl.techNm'/>", width:80}
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>",width:120 }
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm'/>", width:150 }
                ,{field:"endQty", title:"<spring:message code='par.lbl.qty'/>", attributes:{"class":"ar"}, width:70}
                ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.strge' />"
                    ,width:100
                    ,attributes:{"class":"ar"}
                    ,template:'#if(giStrgeCd !== "" && giStrgeCd !== null){# #= giStrgeCdMap[giStrgeCd]# #}#'
                }
                ,{field:"giLocCd", title:"<spring:message code='par.lbl.locId' />", attributes:{"class":"ar"}, width:100
                    ,template:'#if(giLocCd !== "" && giLocCd !== null){# #= locCdMap[giLocCd]# #}#'
                }
                ,{field:"itemAmt", title:"<spring:message code='par.lbl.amt' />", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.receiveDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"receiveDt", title:"<spring:message code='par.lbl.receiveTime' />", format:"{0:HH:mm }", width:80 }
                ,{field:"receiveId", title:"<spring:message code='par.lbl.receiveId' />", width:80 }
                ,{field:"returnPartsQty", title:"<spring:message code='par.lbl.returnPartsQty' />", width:80, attributes:{"class":"ar"}}
                ,{field:"returnDt", title:"<spring:message code='par.lbl.returnDt' />", format:"{0:<dms:configValue code='dateFormat' />}", width:80 }
                ,{field:"returnDt", title:"<spring:message code='par.lbl.returnTime' />", format:"{0:HH:mm }", width:80 }
                ,{field:"returnId", title:"<spring:message code='par.lbl.returnId' />", width:80 }
            ]
        });

    });
</script>
<!-- //script -->
