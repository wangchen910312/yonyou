<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- purcCostDisableMain -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="par.title.purcCostSelect" /><!-- purcCostSelect --></h1> --%>
        <div class="btn_left">
		<dms:access viewId="VIEW-D-11865" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
		</dms:access>
        </div>
        <div class="btn_right">
		<dms:access viewId="VIEW-D-11864" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_m_min btn_search" id="btnSearch" type="button"><spring:message code="par.btn.search" /></button><!--btnSearch  -->
		</dms:access>
        </div>
    </div>

    <div class="table_form form_width_20per" role="search" data-btnid="btnSearch" id="searchForm">
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
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.strge" /><!-- 창고 --></th>
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" data-type="combo"/>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.supplyTp" /><!-- 공급업체유형 --></th>
                        <td>
                            <input id="sBpTp" class="form_comboBox" data-type="combo" />
                        </td>
                    <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- itemCd --></th>
                    <td>
                        <div class="form_search">
                            <input id="sItemCd" class="form_input" />
                            <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                    <td>
                        <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.locCd" /><!-- 로케이션 --></th>
                    <td>
                        <input id="sLocCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                    <td>
                         <input id="sItemDstinCd" data-type="combo" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='par.lbl.carlineNm' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" data-type="combo" />
                    </td>
                    <th scope="row"><spring:message code='par.lbl.modelNm' /></th><!-- 차종 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox" data-type="combo" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt5">
        <div id="targetOnGrid" class="resizable_grid"></div>
    </div>

</section>
<!-- //적정재고조회 -->
</div>
<!-- script -->
<script>
//unitCdDs
var unitCdDs        = [],
    unitCdMap       = {},
    carlineCdList   = [],
    carlineCdObj    = {},
    itemDstinCdList = [],
    itemDstinCdObj  = {},
    bpTpList        = [],
    bpTpObj         = {},
    modelCdList     = [],
    modelCdObj      = {},
    strgeTpList     = [],
    strgeTpObj      = {},
    searchItemPopupWindow;

<c:forEach var="obj" items="${unitCdDs}">
unitCdDs.push({
    "unitCd":"${obj.unitCd}"
    ,"unitNm":"${obj.unitNm}"
});
</c:forEach>
$.each(unitCdDs, function(idx, obj){
    unitCdMap[obj.unitCd] = obj.unitNm;
});

//창고
strgeTpObj[' '] = "";
strgeTpList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${storageList}" varStatus="status">
    strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

itemDstinCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${itemDstinList}" varStatus="status">
    if("${obj.useYn}" !== 'N'){
        itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

bpTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
<c:forEach var="obj" items="${bpTpList}" varStatus="status">
    if("01" === "${obj.remark2}"){
        bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }

    bpTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//차종조회
<c:forEach var="obj" items="${carLineCdInfo}">
    carlineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

//item search popup Func
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
                    if(data.length > 0)
                    {
                        $("#sItemCd").val(data[0].itemCd);
                    }
                }
            }
        }
    });
}
//selectPurcCostSgstes Func
function selectPurcCostSgstes(){
    $("#targetOnGrid").data("kendoExtGrid").dataSource.read();
}

    $(document).ready(function() {
        //btnSearch
        $("#btnSearch").kendoButton({
            enable:true
            ,click:function(e){
                //selectPurcCostSgstes Func call
                selectPurcCostSgstes();
            }
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click: function(e){
                initPage();
            }
        });
        //sItemCd
        $("#sItemCd").focus();
        //품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:itemDstinCdList
            ,index:0
        });
        $("#sItemDstinCd").data("kendoExtDropDownList").value("02");//Default(부품)
        //거래처유형선택
        $("#sBpTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bpTpList
        });
        //창고선택
        $("#sStrgeCd").kendoExtDropDownList({
             dataTextField: "cmmCdNm"
            ,dataValueField: "cmmCd"
            ,dataSource:strgeTpList
            ,index:0
        });
        //차종
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
            ,dataValueField:"carlineCd"
            ,dataSource:carlineCdList
            ,optionLabel:" "
            , filter:"contains"
            ,filtering:function(e){
               var filter = e.filter;
            }
            ,select:onSelectSearchCarlineCd
        });
        //차종
        $("#sModelCd").kendoExtDropDownList({
            dataTextField:"modelNm"
            ,dataValueField:"modelCd"
            ,filter:"contains"
            ,optionLabel:" "
        });

        $("#sModelCd").data("kendoExtDropDownList").enable(false);

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        //targetOnGrid
        $("#targetOnGrid").kendoExtGrid({
            gridId:"G-PAR-0808-155101"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcCost/selectPurcCostSgstes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sStrgeCd"] = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sBpTp"] = $("#sBpTp").data("kendoExtDropDownList").value();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sLocCd"] = $("#sLocCd").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sCarLineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,serverPaging:true
                ,schema:{
                    data:function (result){
                        if(result.total === 0){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }

                        return result.data;
                    }
                   ,model:{
                        id:"itemCd"
                        ,fields:{
                            rnum:{ type:"number" , validation:{required:true} }
                            ,dlrCd:{ type:"string" , validation:{required:true} }
                            ,pltCd:{ type:"string" }
                            ,itemCd:{ type:"string" , validation:{required:true} }
                            ,itemNm:{ type:"string" , validation:{required:true} }
                            ,bpCd:{ type:"string" }
                            ,bpNm:{ type:"string" }
                            ,bpTp:{ type:"string" }
                            ,grStrgeCd:{ type:"string" }
                            ,itemDstinCd:{ type:"string" }
                            ,carlineCd :{ type:"string" }
                            ,stdDt:{ type:"date" }
                            ,purcSgstQty:{ type:"number" }
                            ,unitCd:{ type:"string" }
                            ,sftyStockQty:{ type:"number" }
                            ,psntStockQty:{ type:"number" }
                            ,grScheQty:{ type:"number" }
                            ,giScheQty:{ type:"number" }
                            ,minPurcQty:{ type:"number" }
                            ,trsfQty:{ type:"number" }
                            ,orgSftyStockQty:{ type:"number" }
                            ,mm3AvgDmndQty:{ type:"number" }
                            ,mm6AvgDmndQty:{ type:"number" }
                            ,mm12AvgDmndQty:{ type:"number" }
                            ,stdrdStockApplyRate:{ type:"number" }
                            ,purcOrdRegYn:{ type:"string" }
                            ,targYn:{ type:"string" }
                            ,regUsrId:{ type:"string" }
                            ,regDt:{ type:"string" }
                            ,updtUsrId:{ type:"string" }
                            ,updtDt:{ type:"string" }
                        }
                    }
                }
            }
            ,editable:false
            ,selectable:"row"
            ,filterable:false
            ,appendEmptyColumn:true//empty column. default:false
            ,autoBind:false
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
            ,columns :
                [{ field:"rnum", title:"<spring:message code='par.lbl.line'/>", width:50 }//rnum
                ,{field:"bpTp" ,title:"<spring:message code='par.lbl.supplyTp' />", width:100
                    ,template:'#= changeBpTp(bpTp)#'
                }//공급처유형
                ,{field:"itemCd", title:"<spring:message code = 'par.lbl.itemCd'/>", width:120 }//itemCd
                ,{field:"itemNm", title:"<spring:message code = 'par.lbl.itemNm'/>", width:200 }//itemNm
                ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd'  />" ,width:80
                   ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                }//품목구분
                ,{field:"carlineCd" ,title:"<spring:message code='par.lbl.carLine' />",width:100
                   ,template:'#= changeCarlineCd(carlineCd)#'
                }//차종명칭
                ,{field:"abcInd", title:"<spring:message code='par.lbl.abcInd' />",width:60}
                ,{field:"totDmndQty", title:"<spring:message code = 'par.lbl.sixMonthBefTotDmndQty'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }//totDmndQty
                ,{field:"wgtAddTotDmndQty", title:"<spring:message code = 'par.lbl.wgtAddTotDmndQty'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:120 }//wgtAddTotDmndQty
                ,{field:"mm3AvgDmndQty", title:"<spring:message code = 'par.lbl.mm3DmndQty'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }//sftyStockQty
                ,{field:"mm6AvgDmndQty", title:"<spring:message code = 'par.lbl.mm6DmndQty'/>", attributes:{"class":"ar"}, format:"{0:n2}", width:100 }//mm3AvgDmndQty
                ,{field:"sftyStockQty", title:"<spring:message code = 'par.lbl.saftyStockQty'/>", attributes:{"class":"ar"}, format:"{0:n0}", width:100 }//mm6AvgDmndQty
            ]
        });

        // 창고
        changeStrgeCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = strgeTpObj[val];
            }
            return returnVal;
        };

        //공급처유형
        changeBpTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = bpTpObj[val];
            }
            return returnVal;
        };

       //부품유형
        changeItemDstinCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = itemDstinCdObj[val];
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
    });

    /** [조회조건 영역] ComboBox Select() **/
    // 차종에 따른 모델검색
    function onSelectSearchCarlineCd(e){
        var dataItem = this.dataItem(e.item),
            responseJson;

        $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sModelCd").data("kendoExtDropDownList").enable(true);

        if(dataItem.carlineCd == ""){
            $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sModelCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        responseJson = dms.ajax.getJson({
            url:"<c:url value='/sal/cnt/contractRe/selectModel.do' />"
            ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
            ,async:false
        });

        $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    }

    function initPage(){

        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]: dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]: dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#targetOnGrid").data("kendoExtGrid").dataSource.data([]);
    }

   //부품 팝업 열기 함수.
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            , content:{
                url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                , data: {
                    "type":""
                    , "autoBind":false
                     , "callbackFunc":function(data){
                        $("#sItemCd").val(data[0].itemCd);
                        $("#sItemNm").val(data[0].itemNm);

                        searchItemPopupWindow.close();
                    }
               }
            }
        });
    }
</script>
<!-- //script -->