<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 용품입고현황 -->
<section class="group">
    <div class="header_area">
        <div class="btn_left">
            <dms:access viewId="VIEW-D-10986" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
            </dms:access>
        </div>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12719" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_excel" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button><!-- 엑셀Export -->
            </dms:access>
            <dms:access viewId="VIEW-D-10985" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>

    <form id="form">
    <div class="table_form" role="search" data-btnid="btnSearch" id="searchForm">
        <table>
            <colgroup>
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
            <tr>
                <th scope="row"><spring:message code="sal.lbl.bpNm" /><!-- 업체명 --></th>
                <td>
                    <div class="form_search">
                        <input type="text" id="sBpNm" name="sBpNm" class="form_input form_readonly" readonly data-bind="value:sBpNm" />
                        <a href="javascript:void(0);" id="btnSearchVenderMaster"></a>
                    </div>
                </td>
                <th scope="row"><spring:message code="sal.lbl.etcGrDocNo" /><!-- 입고문서번호 --></th>
                <td><input type="text" id="sEtcGrDocNo" name="sEtcGrDocNo" class="form_input" data-bind="value:sEtcGrDocNo" /></td>
                <th scope="row"><spring:message code="sal.lbl.invcGrDt" /><!-- 입고일자 --></th>
                <td>
                    <div class="form_float">
                        <div class="date_left">
                            <input type="text" id="sInvcGrDtFr" name="sInvcGrDtFr" class="form_datepicker" data-bind="value:sInvcGrDtFr" />
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input type="text" id="sInvcGrDtTo" name="sInvcGrDtTo" class="form_datepicker" data-bind="value:sInvcGrDtTo" />
                        </div>
                    </div>
                </td>
                <th scope="row"><spring:message code="sal.lbl.grStrgeCd" /><!-- 입고창고 --></th>
                <td><input type="text" id="sGrStrgeCd" name="sGrStrgeCd" class="form_comboBox" data-bind="value:sGrStrgeCd" /></td>
            </tr>
            <tr>
                <th scope="row"><spring:message code="sal.lbl.goodsCd" /><!-- 용품코드 --></th>
                <td>
                    <div class="form_search">
                        <input type="text" id="sItemCd" name="sItemCd" class="form_input" data-bind="value:sItemCd" />
                        <a href="javascript:void(0);" id="btnSearchItemMaster"></a>
                    </div>
                </td>
                <th scope="row"><spring:message code="global.lbl.goodsNm" /><!-- 용품명 --></th>
                <td><input type="text" id="sItemNm" name="sItemNm" class="form_input" data-bind="value:sItemNm" /></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
</form>

<div id="dataForm" class="mt10">
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="H" class="k-state-active"><spring:message code="sal.menu.accessoryItemInputList" /><!-- 용품입고현황 --></li>
            <li id="D" ><spring:message code="sal.menu.accessoryItemInputDetail" /><!-- 용품입고명세 --></li>
        </ul>
        <div>
            <!-- 용품입고현황  -->
            <div class="table_grid">
                <div id="grid"></div>
            </div>
        </div>
        <div>
            <!-- 용품입고명세  -->
            <div class="table_grid">
                <div id="gridDetail"></div>
            </div>
        </div>
    </div>
</div>
</section>

<script type="text/javascript">
var viewModel = new kendo.observable({
    "sBpCd":""              //공급업체코드
   ,"sBpNm":""              //공급업체명
   ,"sBpTp":"03"            //업체구분(기타)
   ,"sEtcGrDocNo":""        //입고문서번호
   ,"sEtcGrDocTp":"SAL_ACC" //입고문서업무구분
   ,"sInvcGrDtFr":kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sInvcGrDtFr}' />", "yyyy-MM-dd")  //입고일자 조회시작일
   ,"sInvcGrDtTo":kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sInvcGrDtTo}' />", "yyyy-MM-dd")  //입고일자 조회종료일
   ,"sGrStrgeCd":""         //입고창고
   ,"sItemCd":""            //용품코드
   ,"sItemNm":""            //용품명
});

//업체유형 목록
var bpTpList = [];
<c:forEach var="obj" items="${bpTpList}">
bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//업체유형 Map
var bpTpMap = dms.data.arrayToMap(bpTpList, function(obj){ return obj.cmmCd; });

//용품창고 목록
var storageList = [];
<c:forEach var="obj" items="${storageList}">
storageList.push({"strgeCd":"${obj.strgeCd}", "strgeNm":"${obj.strgeNm}"});
</c:forEach>
//용품창고 Map
var storageMap = dms.data.arrayToMap(storageList, function(obj){ return obj.strgeCd; });

kendo.bind($("#form"), viewModel);

var venderSearchPopupWin;
$(document).ready(function() {
    //버튼 - 초기화
    $("#btnInit").kendoButton({
        click:function(e){
            viewModel.set("sBpCd", "");             //공급업체코드
            viewModel.set("sBpNm", "");             //공급업체명
            viewModel.set("sBpTp", "03");           //공급상구분
            viewModel.set("sEtcGrDocNo","");        //입고문서번호
            viewModel.set("sEtcGrDocTp","SAL_ACC"); //입고문서업무구분
            viewModel.set("sInvcGrDtFr",kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sInvcGrDtFr}' />", "yyyy-MM-dd"));  //입고일자 조회시작일
            viewModel.set("sInvcGrDtTo",kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sInvcGrDtTo}' />", "yyyy-MM-dd"));  //입고일자 조회종료일
            viewModel.set("sGrStrgeCd","");         //입고창고
            viewModel.set("sItemCd","");            //용품코드
            viewModel.set("sItemNm","");            //용품명

            $("#grid").data("kendoExtGrid").dataSource.data([]);
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
        }
    });

    //버튼 - 엑셀Export
    $("#btnExcelExport").kendoButton({
        click:function(e){
            var fromDt = $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sInvcGrDtFr").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sInvcGrDtTo").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sInvcGrDtTo").focus();
               return false;
            }
            
            var templateFile;
            var fileName;

            var selectedTab = $("#tabstrip").data("kendoExtTabStrip").select();

            if(selectedTab[0].id == "H"){
                templateFile = "AccessoryItemInputHeader_Tpl.xlsx";
                fileName = "AccessoryItemInputHeader.xlsx";
            } else {
                templateFile = "AccessoryItemInputDetail_Tpl.xlsx";
                fileName = "AccessoryItemInputDetail.xlsx";
            }

            dms.ajax.excelExport({
                "beanName":"accessoryItemInputService"
                ,"templateFile":templateFile
                ,"fileName":fileName
                ,"sStatCd":"02"                                                     //입고문서 입고상태 입고확정(02)
                ,"sBpTp":viewModel.sBpTp                                            //업체구분
                ,"sBpCd":viewModel.sBpCd                                            //업체코드
                ,"sEtcGrDocNo":$("#sEtcGrDocNo").val()                              //입고문서구분
                ,"sEtcGrDocTp":viewModel.sEtcGrDocTp                                //입고문서유형
                ,"sItemCd":$("#sItemCd").val()                                      //품목코드
                ,"sItemNm":$("#sItemNm").val()                                      //품목명
                ,"sGrStrgeCd":$("#sGrStrgeCd").data("kendoExtDropDownList").value()    //입고창고코드
                ,"sInvcGrDtFr":$("#sInvcGrDtFr").val()                              //입고일자 조회시작일
                ,"sInvcGrDtTo":$("#sInvcGrDtTo").val()                              //입고일자 조회종료일
                ,"sListType":selectedTab[0].id                                      //
            });
        }
    });


    //버튼 -조회
    $("#btnSearch").kendoButton({
        click:function(e){
            var fromDt = $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sInvcGrDtFr").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sInvcGrDtTo").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sInvcGrDtTo").focus();
               return false;
            }
            
            $("#grid").data("kendoExtGrid").dataSource.page(1);
            $("#gridDetail").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //버튼 - 공급업체조회 팝업

    $("#btnSearchVenderMaster").bind("click", function(){
        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
           , title:"<spring:message code='sal.title.venderInfo' />"
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":viewModel.bpCd  //업체코드
                    ,"bpNm":viewModel.bpNm  //업체명
                    ,"bpTp":viewModel.bpTp  //기타
                    ,"callbackFunc":function(data){
                        viewModel.set("sBpCd", data[0].bpCd);
                        viewModel.set("sBpNm", data[0].bpNm);
                        viewModel.set("sBpTp", data[0].bpTp);

                        $("#grid").data("kendoExtGrid").dataSource.data([]);
                        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    });

    //버튼 - 용품마스터조회 팝업
    $("#btnSearchItemMaster").bind("click", function(){
        dms.window.popup({
            windowId:"accessoryItemMasterSearchPopup"
           , title:"<spring:message code='sal.menu.accessoryItemMaster' /> <spring:message code='global.btn.search' />" //용품마스터 조회
            ,content:{
                url:"<c:url value='/sal/acc/itemMaster/selectAccessoryItemMasterSearchPopup.do'/>"
                ,data:{
                     "autoBind":true
                    ,"bpCd":viewModel.sBpCd     //업체코드
                    ,"bpNm":viewModel.sBpNm     //업체명
                    ,"itemCd":viewModel.sItemCd //용품코드
                    ,"itemNm":viewModel.sItemNm //용품명
                    ,"callbackFunc":function(data){
                        viewModel.set("sItemCd", data[0].itemCd);
                        viewModel.set("sItemNm", data[0].itemNm);

                        $("#grid").data("kendoExtGrid").dataSource.data([]);
                        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

                        $("#accessoryItemMasterSearchPopup").data("kendoWindow").close();
                    }
                }
            }
        });
    });

    //조회조건 - 용품창고
    $("#sGrStrgeCd").kendoExtDropDownList({
         dataTextField:"strgeNm"
        ,dataValueField:"strgeCd"
        ,dataSource:storageList
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 생성일자 조회시작일
    $("#sInvcGrDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,max:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sInvcGrDtTo}' />", "yyyy-MM-dd")
    });

    //조회조건 - 생성일자 조회종료일
    $("#sInvcGrDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,min:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sInvcGrDtFr}' />", "yyyy-MM-dd")
    });

    //탭설정
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    //용품입고현황 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-00207-152401"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputDocs.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sStatCd"] = "02";                                                           //입고문서 입고상태 입고확정(02)
                        params["sBpTp"] = viewModel.sBpTp;                                                  //업체구분
                        params["sBpCd"] = viewModel.sBpCd;                                                  //업체코드
                        params["sEtcGrDocNo"]= $("#sEtcGrDocNo").val();                                     //입고문서구분
                        params["sEtcGrDocTp"]= viewModel.sEtcGrDocTp;                                       //입고문서유형
                        params["sItemCd"] = $("#sItemCd").val();                                            //품목코드
                        params["sItemNm"] = $("#sItemNm").val();                                            //품목명
                        params["sGrStrgeCd"] = $("#sGrStrgeCd").data("kendoExtDropDownList").value();          //입고창고코드
                        params["sInvcGrDtFr"] = $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value(); //입고일자 조회시작일
                        params["sInvcGrDtTo"] = $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value(); //입고일자 조회종료일

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"invcDocNo"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,invcDocNo:{type:"string"}
                        ,invcGrDt:{type:"date"}
                        ,itemQty:{type:"number"}
                        ,itemCnt:{type:"number"}
                        ,bpCd:{type:"string"}
                        ,bpNm:{type:"string"}
                        ,bpTp:{type:"string"}
                        ,regUsrId:{type:"string"}
                        ,regUsrNm:{type:"string"}
                        ,dcRate:{type:"number"}
                        ,vatAmt:{type:"number"}
                        ,grTotAmt:{type:"number"}
                        ,grTotIncTaxAmt:{type:"number"}
                     }
                }
            }
            ,aggregate:[
                {field:"itemQty", aggregate:"sum"}
                ,{field:"itemCnt", aggregate:"sum"}
                ,{field:"vatAmt", aggregate:"sum"}
                ,{field:"grTotAmt", aggregate:"sum"}
                ,{field:"grTotIncTaxAmt", aggregate:"sum"}
            ]
        }
        ,selectable:"row"
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,height:403
        ,filterable:false
        ,editable:false
        ,appendEmptyColumn:true
        ,columns:[
            {field:"bpTp", title:"<spring:message code='sal.lbl.bpTp' />", attributes:{"class":"ac"}, width:140
                ,template:"# if(bpTpMap[bpTp] != null) { # #= bpTpMap[bpTp].cmmCdNm# # }#"
            }   //업체유형
            ,{field:"invcDocNo", title:"<spring:message code='sal.lbl.etcGrDocNo' />", width:140}   //입고문서번호
            ,{field:"invcGrDt", title:"<spring:message code='sal.lbl.invcGrDt' />", format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}, width:90 } //입고일자
            ,{field:"itemQty", title:"<spring:message code='sal.lbl.itemQty' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고수량
            ,{field:"itemCnt", title:"<spring:message code='sal.lbl.itemCnt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}", decimal:0
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고건수
            ,{field:"grTotIncTaxAmt", title:"<spring:message code='sal.lbl.grTotIncTaxAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}", decimal:0
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고금액(세금포함)
            ,{field:"grTotAmt", title:"<spring:message code='sal.lbl.grTotAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고금액(세금제외)
            ,{field:"vatAmt", title:"<spring:message code='sal.lbl.vatAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //세액
            ,{field:"dcRate", title:"<spring:message code='sal.lbl.taxRate' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"} //세율
            ,{field:"regUsrNm", title:"<spring:message code='sal.lbl.wrhsCnfmNm' />", width:120}   //입고확인자
            ,{field:"bpNm", title:"<spring:message code='sal.lbl.bpNm' />", width:140 }   //업체명
        ]
    }).data("kendoExtGrid").refresh();

    //용품입고명세 그리드
    $("#gridDetail").kendoExtGrid({
        gridId:"G-SAL-00207-152402"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputItems.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sStatCd"] = "02";                                                             //입고문서 입고상태 입고확정(02)
                        params["sBpTp"] = viewModel.sBpTp;                                                    //업체구분
                        params["sBpCd"] = viewModel.sBpCd;                                                    //업체코드
                        params["sEtcGrDocNo"]= $("#sEtcGrDocNo").val();                                       //입고문서구분
                        params["sEtcGrDocTp"]= viewModel.sEtcGrDocTp;                                         //입고문서유형
                        params["sItemCd"] = $("#sItemCd").val();                                              //품목코드
                        params["sItemNm"] = $("#sItemNm").val();                                              //품목명
                        params["sGrStrgeCd"] = $("#sGrStrgeCd").data("kendoExtDropDownList").value();            //입고창고코드
                        params["sInvcGrDtFr"] = $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value();   //입고일자 조회시작일
                        params["sInvcGrDtTo"] = $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value();   //입고일자 조회종료일

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
                    }
                }
            }
            ,aggregate:[
                {field:"grQty",  aggregate:"sum"}
                ,{field:"taxDdctPrc",  aggregate:"sum"}
                ,{field:"invcPrc",  aggregate:"sum"}
                ,{field:"grTaxDdctAmt",  aggregate:"sum"}
                ,{field:"grTotAmt",  aggregate:"sum"}
                ,{field:"stockQty",  aggregate:"sum"}
                ,{field:"avlbStockQty",  aggregate:"sum"}
                ,{field:"resvStockQty",  aggregate:"sum"}
            ]
        }
        ,selectable:"row"
        ,scrollable:true
        ,autoBind:false
        ,height:403
        ,sortable:false
        ,filterable:false
        ,appendEmptyColumn:true
        ,editable:false
        ,columns:[
            {field:"itemCd", title:"<spring:message code='sal.lbl.goodsCd' />", width:120}   //용품코드
            ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm' />", width:200}   //용품명
            ,{field:"invcUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:60, attributes:{"class":"ac"}} //단위
            ,{field:"grQty", title:"<spring:message code='sal.lbl.itemQty' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고수량
            ,{field:"taxDdctPrc", title:"<spring:message code='sal.lbl.taxDdctPrc' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고단가(세금제외)
            ,{field:"invcPrc", title:"<spring:message code='sal.lbl.invcPrc' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고단가(세금포함)
            ,{field:"grTaxDdctAmt", title:"<spring:message code='sal.lbl.grTotAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고금액(세금제외)
            ,{field:"grTotAmt", title:"<spring:message code='sal.lbl.grTotIncTaxAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고금액(세금포함)
            ,{field:"bpNm", title:"<spring:message code='sal.lbl.bpNm' />", width:180}    //업체명
            ,{field:"invcDocNo", title:"<spring:message code='sal.lbl.etcGrDocNo' />", width:140}   //입고문서번호
            ,{field:"invcGrDt", title:"<spring:message code='sal.lbl.invcGrDt' />",format:"{0:<dms:configValue code='dateFormat' />}", attributes:{ "class":"ac"}, width:100} //입고일자
            ,{field:"stockQty", title:"<spring:message code='sal.lbl.stockCnt' />", width:120, attributes:{"class":"ar"}, format:"{0:n0}", decimals:2
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //재고수량
        ]
    }).data("kendoExtGrid").refresh();
});
</script>



