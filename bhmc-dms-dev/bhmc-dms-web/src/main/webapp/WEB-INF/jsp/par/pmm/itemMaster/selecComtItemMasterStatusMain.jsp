<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <!-- 통용부번설정 -->
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.itemList" /><!-- 품목리스트 --></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11498" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnInit" name="btnInit" class="btn_m btn_m_min btn_reset"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11497" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11496" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" class="btn_m btn_search btn_m_min "><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                            <input type="text" id="sDlrCd" readonly class="form_input form_readonly" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpTpNm" /><!-- 업체유형 --></th>
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
                            <input id="sBrandCd" name="sBrandCd" type="text" data-type="combo" data-mandatory="true" class="form_comboBox" />
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

        <section class="group">
            <div class="header_area">
            </div>
            <div class="table_grid">
            <!-- 그리드2 -->
                <div id="gridComItem" class="resizable_grid"></div>
            <!-- 그리드2 -->
            </div>
        </section>
    </section>
</div>
    <!-- script -->
    <script>

        var spyrCdList = [],
           spyrCdMap = {},
           itemDstinCdList = [],
           itemDstinCdObj = {},
           carlineCdList = [],
           carlineCdObj = {},
           comCarlineCdList = [],
           modelCdList = [],
           modelCdObj = {},
           modelCdMap = {},
           useYnList = [],
           useYnObj = {},
           storageList = [],
           abcIndList = [],
           abcIndObj = {},
           abcIndMap = {},
           brandCdList = [],
           brandCdObj = {},
           popItemObj = {},
           stockUnitList = [],
           stockUnitObj = {},
           searchItemPopupWindow,
           itemKey;

        spyrCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${spyrCdList}" varStatus="status">
            spyrCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>
        //spyrCdMap
        $.each(spyrCdList, function(idx, obj){
            spyrCdMap[obj.cmmCd] = obj.cmmCdNm;
        });

        itemDstinCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${itemDstinCdList}" varStatus="status">
            if("${obj.useYn}" !== 'N'){
                itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
                itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            }
        </c:forEach>

        <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
            carlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            comCarlineCdList.push({cmmCd:"${obj.carlineCd}", cmmCdNm:"${obj.carlineNm}"});
            carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
        </c:forEach>

        <c:forEach var="obj" items="${modelCdList}">
        if(modelCdObj.hasOwnProperty("${obj.carlineCd}")){
            modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
        }else{
            modelCdObj["${obj.carlineCd}"] = [];
            modelCdObj["${obj.carlineCd}"].push({cmmCd:"${obj.modelCd}", cmmCdNm:"${obj.modelNm}"});
        }
        //carline2 List
        modelCdList.push({"cmmCd":"${obj.modelCd}" ,"cmmCdNm":"${obj.modelNm}"});
        </c:forEach>
        //carline2 Map
        $.each(modelCdList, function(idx, obj){
            modelCdMap[obj.cmmCd] = obj.cmmCdNm;
        });
        //useYnList
        <c:forEach var="obj" items="${useYnList}">
        useYnList.push({"cmmCd":"${obj.cmmCd}" ,"cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>
        //useYnObj
        $.each(useYnList, function(idx, obj){
            useYnObj[obj.cmmCd] = obj.cmmCdNm;
        });

        <c:forEach var="obj" items="${abcIndList}">
        abcIndList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>
        //abcIndMap
        $.each(abcIndList, function(idx, obj){
            abcIndMap[obj.cmmCd] = obj.cmmCdNm;
        });

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

        stockUnitList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${stockUnitList}" varStatus="status">
            stockUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
            stockUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

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
        popItemObj = {};
    }

    $(document).ready(function() {
        //search sItemDstinCd
        $("#sItemDstinCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
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

        //search sCarlineCd
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:carlineCdList
            ,optionLabel:" "
            ,index:0
        });
        //search sAbcInd
        $("#sAbcInd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:abcIndList
            ,optionLabel:" "
            ,index:0
        });

        //search sBrandCd
        $("#sBrandCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:brandCdList
            ,index:0
        });
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });
        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#gridComItem").data("kendoExtGrid").dataSource.read();
            }
        });

      //btnExcelExport
        $("#btnExcelExport").kendoButton({
            click:function(e){

                var sItemDstinCd = $("#sItemDstinCd").data("kendoExtDropDownList").value();

                    dms.ajax.excelExport({
                        "beanName":"comItemMasterStatusService"
                        ,"templateFile":"ComPartItemMasterTarget_Tpl.xlsx"
                        ,"fileName":"ComPartItemMasterDownload_Tpl.xlsx"
                        ,"sItemCd":$("#sItemCd").val()
                        ,"sItemNm":$("#sItemNm").val()
                        ,"sItemDstinCd":sItemDstinCd
                        ,"sBpTp":$("#sSpyrCd").data("kendoExtDropDownList").value()
                        ,"sBpNm":$("#sBpNm").val()
                        ,"sBrandCd":$("#sBrandCd").val()
                        ,"sCarlineCd":$("#sCarlineCd").val()
                        ,"sAbcInd":$("#sAbcInd").val()
                    });
            }
        });

        //gridComItem
        $("#gridComItem").kendoExtGrid({
            gridId:"G-PAR-0926-210401"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/itemMaster/selectComItemMasterStatues.do' />"
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
                        params["sBpTp"] = $("#sSpyrCd").val();
                        params["sBpNm"] = $("#sBpNm").val();
                        params["sBrandCd"] = $("#sBrandCd").val();
                        params["sCarlineCd"] = $("#sCarlineCd").val();
                        params["sAbcInd"] = $("#sAbcInd").val();
                        params["sItemDstinCd"] = $("#sItemDstinCd").val();

                        return kendo.stringify(params);
                    }
                }
                }
                ,schema:{
                    model:{
                         id:"comItemCd"
                        ,fields:{
                            rnum:{ type:"string", editable:false}
                            ,itemCd:{ type:"string" }
                            ,itemNm:{ type:"string" }
                            ,comItemCd:{ type:"string" }
                            ,comItemNm:{ type:"string" }
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
            ,multiSelectWithCheckbox:false
            ,selectable:"row"
            ,autoBind:false
            ,filterable:false
            ,editable:false
            ,height:501
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if( dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }
                ,{field:"comItemCd",title:"<spring:message code='par.lbl.comItemCd' />", width :120 }
                ,{field:"comItemNm" ,title:"<spring:message code='par.lbl.comItemNm' />", width:140 }
                ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd' />", width:120}
                ,{field:"itemNm", title:"<spring:message code='par.lbl.itemNm' />", width:140}
                ,{field:"itemNmEng", title:"<spring:message code='par.lbl.itemNmEng' />", width:140}
                ,{field:"carlineCd", title:"<spring:message code='par.lbl.carLine' />"
                    , template:'#= changeCarlineCd(carlineCd)#', width:100
                }
                /* ,{field:"carlineCd2", title:"<spring:message code='par.lbl.model' />", width:200
                    ,template:'#if(modelCdMap[carlineCd2] !== undefined ){# #= modelCdMap[carlineCd2]# #}#'
                } */
                ,{field:"newRplcItemCd", title:"<spring:message code='par.lbl.newRplcItemCd' />", width:120 }
                ,{field:"lastCmptItemCd", title:"<spring:message code='par.lbl.lastCmptItemCd' />", width:120 }
                ,{field:"stockUnitCd", title:"<spring:message code='par.lbl.unitNm' />", attributes:{"class":"ac"}, template:'#= changeUnitCd(stockUnitCd)#', width:80}
                ,{field:"bpTp", title:"<spring:message code='par.lbl.itemMasterBpTp' />", width:100
                    ,template:'#if(bpTpMap[bpTp] !== undefined ){# #= bpTpMap[bpTp]# #}#'
                }//bpTp
                ,{field:"bpCd", title:"<spring:message code='par.lbl.bpCd' />", width:100}//bpCd
                ,{field:"bpNm", title:"<spring:message code='par.lbl.bpNm' />", width:140 }//bpNm
                ,{field:"brandCd", title:"<spring:message code='par.lbl.brand' />", template:'#= changeBrandCd(brandCd)#', width:80 }
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd' />", template:'#= changeItemDstinCd(itemDstinCd)#', width:80 }
                ,{field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />",width:60 }
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
                returnVal = itemDstinCdObj[val];
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
            if(val != null && val != ""){
                returnVal = brandCdObj[val];
            }
            return returnVal;
        };
        //changeYnCd
        changeYnCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = useYnObj[val];
            }
            return returnVal;
        };
        //changeUnitCd Func
        changeUnitCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = stockUnitObj[val];
            }
            return returnVal;
        };

    });


</script>
<!-- //script -->

