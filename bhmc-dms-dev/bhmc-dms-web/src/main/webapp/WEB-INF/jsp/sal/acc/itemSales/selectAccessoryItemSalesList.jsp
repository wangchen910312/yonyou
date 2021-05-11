<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 용품판매현황 -->
<section class="group">
    <div class="header_area">
        <div class="btn_left">
            <dms:access viewId="VIEW-D-12808" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
            </dms:access>
        </div>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12809" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_excel" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button><!-- 엑셀Export -->
            </dms:access>
            <dms:access viewId="VIEW-D-12793" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>

    <form id="form">
    <div class="table_form" role="search" data-btnid="btnSearch" id="searchForm">
        <table>
            <colgroup>
                <col style="width:10%;">
                <col style="width:18%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row"><spring:message code='global.lbl.goodsContractNo' /><!-- 용품계약번호 --></th>
                <td>
                    <input type="text" id="sGoodsContractNo" name="sGoodsContractNo" class="form_input" data-bind="value:sGoodsContractNo"/>
                </td>
                <th scope="row"><spring:message code='sal.lbl.goodsGubun' /><!-- 용품업무유형 --></th>
                <td>
                    <input type="text" id="sGoodsTp" name="sGoodsTp" class="form_comboBox" data-bind="value:sGrStrgeCd" />
                </td>
                <th scope="row"><spring:message code='sal.lbl.goodsStat'/><!-- 용품상태 --></th>
                <td>
                    <input type="text" id="sContractStatCd" name="sContractStatCd" class="form_comboBox" data-bind="value:sContractStatCd" />
                </td>
                <th scope="row"><spring:message code='sal.lbl.custTelNm' /><!-- 고객전화 --></th>
                <td>
                    <input type="text" id="sTelNo" name="sTelNo" class="form_input" data-bind="value:sTelNo" />
                </td>
            </tr>
            <tr>
                <th scope="row"><spring:message code="sal.lbl.saleDt" /><!-- 판매일자 --></th>
                <td>
                    <div class="form_float">
                        <div class="date_left">
                            <input type="text" id="sStartRegDt" name="sStartRegDt" class="form_datepicker" data-bind="value:sStartRegDt" />
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input type="text" id="sEndRegDt" name="sEndRegDt" class="form_datepicker" data-bind="value:sEndRegDt" />
                        </div>
                    </div>
                </td>
                <th scope="row"><spring:message code='global.lbl.carRegNo' /><!-- 차량번호 --></th>
                <td>
                    <input type="text" id="sCarRegNo" name="sCarRegNo" class="form_input" data-bind="value:sCarRegNo" />
                </td>
                <th scope="row"><spring:message code='par.lbl.vinNo' /><!-- 차량식별번호 --></th>
                <td>
                    <input type="text" id="sVinNo" name="sVinNo" class="form_input" data-bind="value:sVinNo" />
                </td>
                <th scope="row"><spring:message code='par.lbl.custNm'/><!-- 고객명 --></th>
                <td>
                    <input type="text" id="sContractCustNm" name="sContractCustNm" class="form_input" data-bind="value:sContractCustNm" />
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</form>

<div id="dataForm" class="mt10">
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="H" class="k-state-active"><spring:message code="sal.menu.accessoryCondition" /><!-- 용품판매현황 --></li>
            <li id="D"><spring:message code="sal.menu.accessoryItemSaleDetail" /><!-- 용품판매명세 --></li>
        </ul>
        <div>
            <!-- 용품판매현황  -->
            <div class="table_grid">
                <div id="grid"></div>
            </div>
        </div>
        <div>
            <!-- 용품판매명세  -->
            <div class="table_grid">
                <div id="gridDetail"></div>
            </div>
        </div>
    </div>
</div>
</section>

<script type="text/javascript">
var viewModel = new kendo.observable({
    "sGoodsContractNo":""
    ,"sGoodsTp":""
    ,"sContractStatCd":""
    ,"sContractCustNm":""
    ,"sTelNo":""
    ,"sVinNo":""
    ,"sCarRegNo":""
    ,"sStartRegDt":kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sStartRegDt}' />", "yyyy-MM-dd")
    ,"sEndRegDt":kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sEndRegDt}' />", "yyyy-MM-dd")
});

//용품업무유형
var goodsTpList = [];
<c:forEach var="obj" items="${goodsTpList}">
goodsTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var goodsTpMap = dms.data.arrayToMap(goodsTpList, function(obj){ return obj.cmmCd; });

//용품상태 SAL185
var contractStatCdList = [];
<c:forEach var="obj" items="${contractStatCdList}">
contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var contractStatCdMap = dms.data.arrayToMap(contractStatCdList, function(obj){ return obj.cmmCd; });

//업체유형 목록
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//업체유형 Map
var bpTpMap = dms.data.arrayToMap(bpTpList, function(obj){ return obj.cmmCd; });

//고객유형 목록
var custTpList = [];
<c:forEach var="obj" items="${custTpList}">
custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//업체유형 Map
var custTpMap = dms.data.arrayToMap(custTpList, function(obj){ return obj.cmmCd; });

//용품창고 목록
var storageList = [];
<c:forEach var="obj" items="${storageList}">
storageList.push({"strgeCd":"${obj.strgeCd}", "strgeNm":"${obj.strgeNm}"});
</c:forEach>
//용품창고 Map
var storageMap = dms.data.arrayToMap(storageList, function(obj){ return obj.strgeCd; });

//용품품목상태 목록
var itemStatCdList = [];
<c:forEach var="obj" items="${itemStatCdList}">
itemStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//용품품목상태 Map
var itemStatCdMap = dms.data.arrayToMap(itemStatCdList, function(obj){ return obj.cmmCd; });

//부품유형 목록
var itemDstinCdList = [];
<c:forEach var="obj" items="${itemDstinCdList}">
itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//부품유형 Map
var itemDstinCdMap = dms.data.arrayToMap(itemDstinCdList, function(obj){ return obj.cmmCd; });

kendo.bind($("#form"), viewModel);

$(document).ready(function() {
    //버튼 - 초기화
    $("#btnInit").kendoButton({
        click:function(e){
            viewModel.set("sGoodsContractNo", "");
            viewModel.set("sGoodsTp", "");
            viewModel.set("sContractStatCd", "");
            viewModel.set("sContractCustNm", "");
            viewModel.set("sTelNo", "");
            viewModel.set("sVinNo", "");
            viewModel.set("sCarRegNo", "");
            viewModel.set("sStartRegDt",kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sStartRegDt}' />", "yyyy-MM-dd"));
            viewModel.set("sEndRegDt",kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sEndRegDt}' />", "yyyy-MM-dd"));

            $("#grid").data("kendoExtGrid").dataSource.data([]);
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
        }
    });

    //버튼 - 엑셀Export
    $("#btnExcelExport").kendoButton({
        click:function(e){
            var templateFile;
            var fileName;

            var selectedTab = $("#tabstrip").data("kendoExtTabStrip").select();

            if(selectedTab[0].id == "H"){
                templateFile = "AccessoryItemSalesHeader_Tpl.xlsx";
                fileName = "AccessoryItemSalesHeader.xlsx";
            } else {
                templateFile = "AccessoryItemSalesDetail_Tpl.xlsx";
                fileName = "AccessoryItemSalesDetail.xlsx";
            }

            dms.ajax.excelExport({
                "beanName":"accessoryItemSalesService"
                ,"templateFile":templateFile
                ,"fileName":fileName
                ,"sGoodsContractNo":$("#sGoodsContractNo").val()                           //용품계약번호
                ,"sGoodsTp":$("#sGoodsTp").data("kendoExtDropDownList").value()               //용품유형
                ,"sContractStatCd":$("#sContractStatCd").data("kendoExtDropDownList").value() //용품주문상태
                ,"sContractCustNm":$("#sContractCustNm").val()                             //고객명
                ,"sTelNo":$("#sTelNo").val()                                               //고객전화
                ,"sStartRegDt":$("#sStartRegDt").val()                                     //판매일자 조회시작일
                ,"sEndRegDt":$("#sEndRegDt").val()                                         //판매일자 조회종료일
                ,"sVinNo":$("#sVinNo").val()                                               //차량식별번호
                ,"sCarRegNo":$("#sCarRegNo").val()                                         //차량등록번호
                ,"sListType":selectedTab[0].id
            });
        }
    });

    //버튼 -조회
    $("#btnSearch").kendoButton({
        click:function(e){
            var fromDt = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sStartRegDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sEndRegDt").focus();
               return false;
            }

            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sEndRegDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sEndRegDt").focus();
               return false;
            }

            $("#grid").data("kendoExtGrid").dataSource.page(1);
            $("#gridDetail").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //조회조건 - 용품업무유형
    $("#sGoodsTp").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:goodsTpList
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 용품상태
    $("#sContractStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:contractStatCdList
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 판매일자 조회시작일
    $("#sStartRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,max:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sEndRegDt}' />", "yyyy-MM-dd")
    });

    //조회조건 - 판매일자 조회종료일
    $("#sEndRegDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,min:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sStartRegDt}' />", "yyyy-MM-dd")
    });

    //탭설정
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    //용품판매현황 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-00220-152401"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSales.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sGoodsContractNo"] = $("#sGoodsContractNo").val();
                        params["sGoodsTp"] = $("#sGoodsTp").data("kendoExtDropDownList").value();
                        params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();
                        params["sContractCustNm"] = $("#sContractCustNm").val();
                        params["sTelNo"] = $("#sTelNo").val();
                        params["sStartRegDt"] = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndRegDt"] = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sCarRegNo"] = $("#sCarRegNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"invcDocNo"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,goodsContractNo:{type:"string"}
                        ,realDlDt:{type:"date"}
                        ,regDt:{type:"date"}
                     }
                }
            }
            ,aggregate:[
                {field:"goodsQty", aggregate:"sum"}
                ,{field:"goodsCnt", aggregate:"sum"}
                ,{field:"custPayAmt", aggregate:"sum"}
            ]
        }
        ,selectable:"row"
        ,scrollable:true
        ,autoBind:false
        ,height:403
        ,filterable:false
        ,editable:false
        ,appendEmptyColumn:true
        ,columns:[
            {field:"regDt", title:"<spring:message code='sal.lbl.saleDt' />", format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}, width:80 } //판매일자
            ,{field:"goodsContractNo", title:"<spring:message code='global.lbl.goodsContractNo' />", width:140}   //용품계약번호
            ,{field:"goodsTp", title:"<spring:message code='sal.lbl.goodsGubun' />", attributes:{"class":"ac"}, width:100
                ,template:"# if(goodsTpMap[goodsTp] != null) { # #= goodsTpMap[goodsTp].cmmCdNm# # }#"
            }   //용품유형
            ,{field:"regUsrNm", title:"<spring:message code='par.lbl.qestId' />", width:120 , sortable:false}         //조작인
            ,{field:"contractStatCd", title:"<spring:message code='sal.lbl.goodsStat'/>", width:100
                ,template:"# if(contractStatCdMap[contractStatCd] != null) { # #= contractStatCdMap[contractStatCd].cmmCdNm# # }#"
            }    //용품주문상태
            ,{field:"goodsQty", title:"<spring:message code='sal.lbl.goodsSaleCnt' />", width:90, attributes:{"class":"ar"}, format:"{0:n0}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"
            }   //판매건수
            ,{field:"goodsCnt", title:"<spring:message code='sal.lbl.goodsSaleQty' />", width:90, attributes:{"class":"ar"}, format:"{0:n0}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"
            }   //판매수량
            ,{field:"custPayAmt", title:"<spring:message code='global.lbl.salAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //판매금액
            ,{field:"contractCustNm", title:"<spring:message code='par.lbl.custNm' />", width:120}          //고객명
            ,{field:"telNo", title:"<spring:message code='sal.lbl.custTelNm' />", width:120}                //고객전화
            ,{field:"carRegNo", title:"<spring:message code='global.lbl.carRegNo' />", width:120}           //차량번호
            ,{field:"vinNo", title:"<spring:message code='par.lbl.vinNo' />", width:120}                    //차량식별번호
            ,{field:"contractCustTp", title:"<spring:message code='global.lbl.custTp' />", width:100
                ,template:"# if(custTpMap[contractCustTp] != null) { # #= custTpMap[contractCustTp].cmmCdNm# # }#"
            }         //일반/회사
        ]
    }).data("kendoExtGrid").refresh();

    //용품판매명세 그리드
    $("#gridDetail").kendoExtGrid({
        gridId:"G-SAL-00220-152402"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSalesItems.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sGoodsContractNo"] = $("#sGoodsContractNo").val();
                        params["sGoodsTp"] = $("#sGoodsTp").data("kendoExtDropDownList").value();
                        params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();
                        params["sContractCustNm"] = $("#sContractCustNm").val();
                        params["sTelNo"] = $("#sTelNo").val();
                        params["sStartRegDt"] = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndRegDt"] = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sCarRegNo"] = $("#sCarRegNo").val();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mobisInvcNo"
                    ,fields:{
                         dlrCd:{type:"string"}
                        ,invcDocNo:{type:"string"}      //입고번호
                        ,invcDocLineNo:{type:"string"}  //입고라인번호
                        ,itemCd :{type:"string"}        //용품코드
                        ,itemNm :{type:"string"}        //용품명
                        ,invcUnitCd:{type:"string"}     //단위
                        ,grQty:{type:"number"}          //입고수량
                        ,taxDdctPrc:{type:"number"}     //입고단가(세금제외)
                        ,invcPrc:{type:"number"}        //입고단가(세금포함)
                        ,grTaxDdctAmt:{type:"number"}   //입고금액(세금제외)
                        ,grTotAmt:{type:"number"}       //입고금액(세금포함)
                        ,bpCd:{type:"string"}           //업체코드
                        ,bpNm:{type:"string"}           //업체명
                        ,invcGrDt:{type:"date"}         //입고일자
                        ,stockQty:{type:"number"}       //재고수량
                        ,realDlDt:{type:"date"}         //완성일자
                        ,regDt:{type:"date"}           //판매일자
                    }
                }
            }
            ,aggregate:[
                 {field:"goodsCnt",  aggregate:"sum"}
                ,{field:"totAmt",  aggregate:"sum"}
                ,{field:"eqipCostAmt",  aggregate:"sum"}
            ]
        }
        ,selectable:"row"
        ,scrollable:true
        ,autoBind:false
        ,height:403
        ,filterable:false
        ,appendEmptyColumn:true
        ,editable:false
        ,columns:[
            {field:"regDt", title:"<spring:message code='sal.lbl.saleDt' />", format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}, width:80}
            ,{field:"goodsContractNo", title:"<spring:message code='global.lbl.goodsContractNo' />", width:130}   //용품계약번호
            ,{field:"itemDstinCd", title:"<spring:message code='par.lbl.itemDstinCd'  />", width:80
                ,attributes:{ "style":"text-align:left"}
                ,template:"# if(itemDstinCdMap[itemDstinCd] != null) { # #= itemDstinCdMap[itemDstinCd].cmmCdNm# # }#"
            }//품목구분
            ,{field:"goodsCd", title:"<spring:message code='par.lbl.itemCd' />", width:140}//부품번호
            ,{field:"goodsNm", title:"<spring:message code='par.lbl.itemNm' />", width:200}//부품명
            ,{field:"goodsUnitCd", title:"<spring:message code='par.lbl.unitNm' />", width:80,attributes:{ "style":"text-align:center"}}//단위
            ,{field:"goodsCnt", title:"<spring:message code='par.lbl.partsSaleQty' />", width:60,attributes:{ "style":"text-align:right"}, format:"{0:n0}"
               ,aggregates:["sum"]
               ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"
            }//수량
            ,{field:"retlPrc", title:"<spring:message code='par.lbl.partsSalePrc' />", width:100, attributes:{ "style":"text-align:right"}, format:"{0:n2}"}//단가
            ,{field:"totAmt", title:"<spring:message code='par.lbl.partsSaleAmt' />", width:100 ,attributes:{ "style":"text-align:right"}, format:"{0:n2}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"
            }//금액
            ,{field:"dcRate", title:"<spring:message code='par.lbl.cstDcRate' />", width:60, attributes:{ "style":"text-align:right"}, format:"{0:n0}"
                ,template:function(dataItem){
                    return dataItem.dcRate + "%";
                }
            }//D/C Rate
            ,{field:"dcAmt", title:"<spring:message code='par.lbl.cstDcAmt' />", width:90, attributes:{ "style":"text-align:right"}, format:"{0:n2}"}//할인금액
            ,{field:"eqipCostAmt" ,title:"<spring:message code='sal.lbl.eqipCost' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"
            }//설치비용
            ,{field:"giStrgeCd", title:"<spring:message code='par.lbl.giStrgeCd' />", width:100
                //,template:"# if(storageMap[giStrgeCd] != null) { # #= storageMap[giStrgeCd].cmmCdNm# # }#"
                ,sortable:false
            }  //출고창고
            ,{field:"statCd", title:"<spring:message code='par.lbl.docStatCd' />"
                ,attributes:{ "style":"text-align:center"}
                ,width:90,sortable:false
                ,template:"# if(itemStatCdMap[statCd] != null) { # #= itemStatCdMap[statCd].cmmCdNm# # }#"
            }//부품판매상태
        ]
    }).data("kendoExtGrid").refresh();
});
</script>



