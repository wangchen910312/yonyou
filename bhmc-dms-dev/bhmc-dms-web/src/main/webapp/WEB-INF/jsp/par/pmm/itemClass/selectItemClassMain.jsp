<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- ItemClass -->
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.itemClassList" /></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11506" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInit" name="btnInit" class="btn_m btn_m_min btn_reset"><spring:message code="par.btn.init" /></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11505" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnItemClassUpdate" class="btn_m btn_m_min"><spring:message code="par.btn.itemClassUpdate" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11504" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" class="btn_m btn_m_min btn_search"><spring:message code="par.btn.search" /></button>
            </dms:access>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.dlrCd" /><!-- 딜러코드 --></th>
                        <td>
                            <input type="text" id="sDlrCd"  readonly class="form_input form_readonly" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpTp" /><!-- 업체유형 --></th>
                        <td>
                            <input id="sSpyrCd" type="text" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <input type="text" id="sItemCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></th>
                        <td>
                            <input id="sBrandCd" name="sBrandCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemBpNm" /><!-- 업체명칭 --></th>
                        <td>
                            <input id="sBpNm" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" name="sCarlineCd" type="text" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC Ind --></th>
                        <td>
                            <input id="sAbcInd" name="sAbcInd" type="text" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목유형 --></th>
                        <td>
                            <input id="sItemDstinCd" name="sItemDstinCd" type="text" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt5">
            <div id="gridItem" class="grid"></div>
        </div>
        <div class="table_list table_list_v2 mt5">
            <table class="grid">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="width:30%;">
                    <col>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2"><spring:message code="par.lbl.classLvl" /></th><!-- 等级:등급 -->
                        <th scope="col"><spring:message code="par.lbl.classGrn" /></th><!-- 标准:표준 -->
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="ac">A</td><td class="ac"><spring:message code="par.lbl.classLvlA" /><!-- 快速流通 --></td><td class="ac"><spring:message code="par.lbl.classGrnA" /><!-- 销售和订货频率80％ --> </td>
                    </tr>
                    <tr>
                        <td class="ac">B</td><td class="ac"><spring:message code="par.lbl.classLvlB" /><!-- 中等流通 --></td><td class="ac"><spring:message code="par.lbl.classGrnB" /><!-- 销售和订货频率15％  --></td>
                    </tr>
                    <tr>
                        <td class="ac">C</td><td class="ac"><spring:message code="par.lbl.classLvlC" /><!-- 慢速流通 --> </td><td class="ac"><spring:message code="par.lbl.classGrnC" /><!-- 销售和订货频率5％ --></td>
                    </tr>
                    <tr>
                        <td class="ac">D</td><td class="ac"><spring:message code="par.lbl.classLvlD" /><!-- 没有流通 --> </td><td class="ac"><spring:message code="par.lbl.classGrnD" /><!-- 一年内销售为0 --></td>
                    </tr>
                    <tr>
                        <td class="ac">E</td><td class="ac"><spring:message code="par.lbl.classLvlE" /><!-- 新配件 --></td><td class="ac"><spring:message code="par.lbl.classGrnE" /><!-- 登记时间一年内 --></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_list table_list_v2 mt5">
            <table class="grid">
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2"><spring:message code="par.lbl.classLvlGrn" /></th><!-- 配件等级标准:부품등급표준 -->
                        <th scope="col" colspan="4"><spring:message code="par.lbl.itemPurcPrc" /></th><!-- 配件采购单价:부품구매가격 -->
                    </tr>
                    <tr>
                        <th scope="col" colspan="2"><spring:message code="par.lbl.classWonTp" /></th><!-- 根据销售额及销售频率的综合排名升序排序 -->
                        <th scope="col" class="ac">50<spring:message code="par.lbl.yuanDown" /></th><!-- 元以下 -->
                        <th scope="col" class="ac">50<spring:message code="global.lbl.yuan" />~400<spring:message code="global.lbl.yuan" /></th>
                        <th scope="col" class="ac">400<spring:message code="global.lbl.yuan" />~1000<spring:message code="global.lbl.yuan" /></th>
                        <th scope="col" class="ac">1000<spring:message code="par.lbl.yuanUp" /></th><!-- 元以上 -->
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="ac" rowspan="3"><spring:message code="par.lbl.classWonTpA" /></td><!-- 销售额累计 -->
                        <td class="ac">80%</td>
                        <td class="ac">A1</td>
                        <td class="ac">A2</td>
                        <td class="ac">A3</td>
                        <td class="ac">A4</td>
                    </tr>
                    <tr>
                        <td class="ac">15%</td>
                        <td class="ac">B1</td>
                        <td class="ac">B2</td>
                        <td class="ac">B3</td>
                        <td class="ac">B4</td>
                    </tr>
                    <tr>
                        <td class="ac">5%</td>
                        <td class="ac">C1</td>
                        <td class="ac">C2</td>
                        <td class="ac">C3</td>
                        <td class="ac">C4</td>
                    </tr>
                    <tr>
                        <td class="ac" colspan="2"><spring:message code="par.lbl.classWonTpB" /></td><!-- 过去12个月未发生销售 -->
                        <td class="ac">D1(<spring:message code="par.lbl.stockYes" />)</td><!-- D1(有库存) -->
                        <td class="ac">D2(<spring:message code="par.lbl.stockNo" />)</td><!-- D2(无库存) -->
                        <td class="ac">&nbsp;</td>
                        <td class="ac">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="ac" colspan="2"><spring:message code="par.lbl.classWonTpC" /></td><!-- 新品种( 配件启用未满12个月 ) -->
                        <td class="ac">E1</td>
                        <td class="ac">E2</td>
                        <td class="ac">E3</td>
                        <td class="ac">E4</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </section>
    <!-- //itemClass -->
<script>
var spyrCdList = [],
spyrCdMap = {};
spyrCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${spyrCdList}" varStatus="status">
    spyrCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//spyrCdMap
$.each(spyrCdList, function(idx, obj){
    spyrCdMap[obj.cmmCd] = obj.cmmCdNm;
});
var itemDstinCdList = [],
itemDstinCdAllList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
    if("${obj.useYn}" !== 'N'){
        itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    itemDstinCdAllList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//itemDstinCdObj
var itemDstinCdObj = {};
$.each(itemDstinCdAllList, function(idx, obj){
    itemDstinCdObj[obj.cmmCd] = obj.cmmCdNm;
});
var abcIndList = [],
abcIndObj = {},
abcIndMap = {};
<c:forEach var="obj" items="${abcIndList}">
abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//abcIndMap
$.each(abcIndList, function(idx, obj){
    abcIndMap[obj.cmmCd] = obj.cmmCdNm;
});
//carlineCdList
var carlineCdList = [];
var carlineCdObj = {};
<c:forEach var="obj" items="${carlineCdList}">
    carlineCdList.push({"cmmCd":"${obj.carlineCd}", "cmmCdNm":"${obj.carlineNm}"});
    carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>
var modelCdList = [];
<c:forEach var="obj" items="${modelCdList}">
modelCdList.push({
    "cmmCd":"${obj.modelCd}"
    ,"cmmCdNm":"${obj.modelNm}"
});
</c:forEach>
//modelCdMap
var modelCdMap = {};
$.each(modelCdList, function(idx, obj){
    modelCdMap[obj.cmmCd] = obj.cmmCdNm;
});
var useYnList = [],
useYnObj = {};
//useYnList
<c:forEach var="obj" items="${useYnList}">
useYnList.push({"cmmCd":"${obj.cmmCd}" ,"cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//useYnObj
$.each(useYnList, function(idx, obj){
    useYnObj[obj.cmmCd] = obj.cmmCdNm;
});
var brandCdList = [],
brandCdObj = {};
brandCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${brandCdList}" varStatus="status">
    brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    brandCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//bpTpList
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//bpTpMap
var bpTpMap = {};
$.each(bpTpList, function(idx, obj){
    bpTpMap[obj.cmmCd] = obj.cmmCdNm;
});

var itemKey;

//initPage Func
function initPage(){
    $("#sItemCd").val("");
    $("#sItemNm").val("");
    $("#sBpNm").val("");
    $("#sSpyrCd").data("kendoExtDropDownList").select(0);
    $("#sBrandCd").data("kendoExtDropDownList").select(0);
    $("#sCarlineCd").data("kendoExtDropDownList").select(0);
    $("#sAbcInd").data("kendoExtDropDownList").select(0);
    $("#sItemDstinCd").data("kendoExtDropDownList").select(0);
    itemKey = "";
}

$(document).ready(function() {

    //btnInit
    $("#btnInit").kendoButton({
        click:function(e){
            initPage();
        }
    });
    //btnItemClassUpdate
    $("#btnItemClassUpdate").kendoButton({
        click:function(e){
            //TODO : 등급갱신 프로시져 실행 기능 구현 해야 함.
            $.ajax({
                url:"<c:url value='/par/pmm/itemClass/updateItemClassProcedure.do' />"
                ,data:null
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(jqXHR, textStatus){
                    //data save complete message.
                    dms.notification.success("<spring:message code='global.info.save.regSuccessParam' />");

                    $("#gridItem").data("kendoExtGrid").dataSource.read();
                }
            });
        }
    });

    //btnSelect
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#gridItem").data("kendoExtGrid").dataSource.read();
        }
    });

    //search sAbcInd
    $("#sAbcInd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:abcIndList
        ,optionLabel:" "
        ,index:0
    });

    //search sItemDstinCd
    $("#sItemDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:itemDstinCdList
        ,optionLabel:" "
        ,index:0
    });
    //search sSpyrCd
    $("#sSpyrCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
        ,dataSource:bpTpList
        ,index:0
    });

    //차종(검색))
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carlineCdList
        ,optionLabel:" "
        ,index:0
    });
    //브랜드:검색
    $("#sBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:brandCdList
        ,index:0
    });
    //gridItem
    $("#gridItem").kendoExtGrid({
        gridId:"G-PAR-0728-000001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pmm/itemMaster/selectItemMasters.do' />"
                }
                , parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //search input parameter
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sBpTp"] = $("#sSpyrCd").data("kendoExtDropDownList").value();

                        params["sBrandCd"] = $("#sBrandCd").val();
                        params["sBpNm"] = $("#sBpNm").val();
                        params["sCarlineCd"] = $("#sCarlineCd").val();
                        params["sAbcInd"] = $("#sAbcInd").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,serverPaging:true
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                        dlrCd:{ type:"string" }
                        ,itemCd:{ type:"string" }
                        ,itemNm:{ type:"string" }
                        ,itemNmEng:{ type:"string" }
                        ,itemDstinCd:{ type:"string" }
                        ,brandCd:{ type:"string" }
                        ,carlineCd:{ type:"string" }
                        ,carlineCd2:{ type:"string" }
                        ,abcInd:{ type:"string" }
                        ,bpTp:{ type:"string" }
                        ,bpCd:{ type:"string" }
                        ,bpNm:{ type:"string" }
                        ,newRplcItemCd:{ type:"string" }
                        ,oldRplcItemCd:{ type:"string" }
                        ,lastCmptItemCd:{ type:"string" }
                        ,stockUnitCd:{ type:"string" }
                        ,nonMovingFlg:{ type:"string" }
                        ,endYn:{ type:"string" }
                        ,dgrItemYn:{ type:"string" }
                        ,renewDt:{ type:"date" }
                        ,updtDt:{ type:"date" }
                        ,startDt:{ type:"date" }
                        ,endDt:{ type:"date" }
                    }
                }
            }
        }
        ,change:function(e){
        }
        ,editable:false
        ,selectable:"row"
        ,autoBind:false
        ,height:196
        ,filterable:false
        ,dataBound:function(e){
            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if( dataItem != null && dataItem != 'undefined'){
                    //update row reselect.
                    if(dataItem.itemCd === itemKey){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-state-selected");
                    }
                    e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                }
            });
        }
        ,columns:[
            {field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:100}
            ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:140}
            ,{field:"itemNmEng", title:"<spring:message code='par.lbl.itemNmEng' />", width:140}
            ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />"
                , template:'#= changeCarlineCd(carlineCd)#', width:100
            }
            ,{field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />",width:60 }
            ,{field:"newRplcItemCd", title:"<spring:message code='par.lbl.newRplcItemCd' />", width:120 }
            ,{field:"lastCmptItemCd", title:"<spring:message code='par.lbl.lastCmptItemCd' />", width:120 }
            ,{field:"stockUnitCd", title:"<spring:message code='par.lbl.unitNm' />", attributes:{"class":"ac"}, width:80}
            ,{field:"bpTp", title:"<spring:message code='par.lbl.itemMasterBpTp' />", width:100
                ,template:'#if(bpTpMap[bpTp] !== undefined ){# #= bpTpMap[bpTp]# #}#'
            }//bpTp
            ,{field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:100}//bpCd
            ,{field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:140 }//bpNm
            ,{field:"brandCd", title:"<spring:message code='par.lbl.brand' />", template:'#= changeBrandCd(brandCd)#', width:80 }
            ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", template:'#= changeItemDstinCd(itemDstinCd)#', width:80 }
            ,{field:"endYn", title:"<spring:message code='par.lbl.endYn' />", attributes:{"class":"ac"}, template:'#= changeYnCd(endYn)#', width:80}
            ,{field:"renewDt", title:"<spring:message code='par.lbl.updtDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
            ,{field:"startDt", title:"<spring:message code='par.lbl.startDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
            ,{field:"endDt", title:"<spring:message code='par.lbl.endDt' />", width:100 , format:"{0:<dms:configValue code='dateFormat' />}"}
        ]
    });
    //changeItemDstinCd Func
    changeItemDstinCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(itemDstinCdObj[val] != undefined){
                returnVal = itemDstinCdObj[val];
            }
        }
        return returnVal;
    };
    //changeAbcInd Func
    changeAbcInd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = abcIndObj[val];
        }
        return returnVal;
    };
    //changeCarlineCd Func
    changeCarlineCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(carlineCdObj[val] != undefined){
                returnVal = carlineCdObj[val];
            }
        }
        return returnVal;
    };
    //changeBrandCd Func
    changeBrandCd = function(val){
        var returnVal = "";
        if(!dms.string.isEmpty(val)){
            if(!dms.string.isEmpty(brandCdObj[val])){
                returnVal = brandCdObj[val];
            }
        }
        return returnVal;
    };
    //changeYnCd
    changeYnCd = function(val){
        var returnVal = "";
        if(!dms.string.isEmpty(val)){
            if(!dms.string.isEmpty(useYnObj[val])){
                returnVal = useYnObj[val];
            }
        }
        return returnVal;
    };
    //changeUnitCd Func
    changeUnitCd = function(val){
        var returnVal = "";
        if(!dms.string.isEmpty(val)){
            if(!dms.string.isEmpty(stockUnitObj[val])){
                returnVal = stockUnitObj[val];
            }
        }
        return returnVal;
    };

});
</script>
<!-- //script -->
