<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 용품반품현황 -->
<div id="resizableContainer" data-offsetheight="-24">
<section class="group">
    <div class="header_area">
        <div class="btn_left">
            <dms:access viewId="VIEW-D-10993" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
            </dms:access>
        </div>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10992" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
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
                <col>
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
                            <input type="text" id="sRegDtFr" name="sRegDtFr" class="form_datepicker" data-bind="value:sRegDtFr" />
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input type="text" id="sRegDtTo" name="sRegDtTo" class="form_datepicker" data-bind="value:sRegDtTo" />
                        </div>
                    </div>
                </td>
                <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 등록자 --></th>
                <td>
                     <div class="form_search">
                        <input type="text" id="sRegUsrNm" name="sRegUsrNm" class="form_input form_readonly" readonly data-bind="value:sRegUsrNm" />
                        <a id="btnSearchUser"><!-- 검색 --></a>
                    </div>
                </td>
            </tr>
            <tr>
                <th scope="row"><spring:message code="sal.lbl.goodsCd"/><!-- 용품코드 --></th>
                <td>
                    <div class="form_search">
                        <input type="text" id="sItemCd" name="sItemCd" class="form_input" data-bind="value:sItemCd" />
                        <a href="javascript:void(0);" id="btnSearchItemMaster"></a>
                    </div>
                </td>
                <th scope="row"><spring:message code="global.lbl.goodsNm"/><!-- 용품명 --></th>
                <td><input type="text" id="sItemNm" name="sItemNm" class="form_input" data-bind="value:sItemNm" /></td>
                <th scope="row"><spring:message code="sal.lbl.returnDt"/><!-- 반품일자 --></th>
                <td>
                    <div class="form_float">
                        <div class="date_left">
                            <input type="text" id="sReturnDtFr" name="sReturnDtFr" class="form_datepicker" data-bind="value:sReturnDtFr" />
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input type="text" id="sReturnDtTo" name="sReturnDtTo" class="form_datepicker" data-bind="value:sReturnDtTo" />
                        </div>
                    </div>
                </td>
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
                <li class="k-state-active"><spring:message code="sal.menu.accessoryItemInputReturnList"/><!-- 용품반품현황 --></li>
                <li><spring:message code="sal.menu.accessoryItemInputReturnDetail"/><!-- 용품반품명세 --></li>
            </ul>
            <div>
                <!-- 용품반품현황  -->
                <div class="table_grid">
                    <div id="grid" class="resizable_grid"></div>
                </div>
            </div>
            <div>
                <!-- 용품반품명세 -->
                <div class="table_grid">
                    <div id="gridDetail" class="resizable_grid"></div>
                </div>
            </div>
        </div>
    </div>
</section>
</div>

<script type="text/javascript">
var viewModel = new kendo.observable({
    "sBpCd":""          //공급업체코드
   ,"sBpNm":""          //공급업체명
   ,"sBpTp":"03"        //업체구분(기타)
   ,"sEtcGrDocNo":""    //입고문서번호
   ,"sRegDtFr":kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sRegDtFr}' />", "yyyy-MM-dd")  //입고일자 조회시작일
   ,"sRegDtTo":kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sRegDtTo}' />", "yyyy-MM-dd")  //입고일자 조회종료일
   ,"sReturnDtFr":null  //반품일자 조회시작일
   ,"sReturnDtTo":null  //반품일자 조회종료일
   ,"sItemCd":""        //용품코드
   ,"sItemNm":""        //용품명
   ,"sRegUsrId":""      //등록자ID
   ,"sRegUsrNm":""      //등록자명
});

kendo.bind($("#form"), viewModel);

var venderSearchPopupWin;

$(document).ready(function() {
    //버튼 - 초기화
    $("#btnInit").kendoButton({
        click:function(e){
            viewModel.set("sBpCd", "");         //공급업체코드
            viewModel.set("sBpNm", "");         //공급업체명
            viewModel.set("sBpTp", "03");       //공급상구분
            viewModel.set("sEtcGrDocNo","");    //입고문서번호
            viewModel.set("sRegDtFr",kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sRegDtFr}' />", "yyyy-MM-dd"));  //입고일자 조회시작일
            viewModel.set("sRegDtTo",kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sRegDtTo}' />", "yyyy-MM-dd"));  //입고일자 조회종료일
            viewModel.set("sReturnDtFr",null);  //반품일자 조회시작일
            viewModel.set("sReturnDtTo",null);  //반품일자 조회종료일
            viewModel.set("sItemCd","");        //용품코드
            viewModel.set("sItemNm","");        //용품명
            viewModel.set("sRegUsrId","");      //등록자ID
            viewModel.set("sRegUsrNm","");      //등록자명

            $("#grid").data("kendoExtGrid").dataSource.data([]);
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);
        }
    });

    //버튼 -조회
    $("#btnSearch").kendoButton({
        click:function(e){
            var regFromDt = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
            var regToDt = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(regFromDt, regToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sRegDtFr").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(regToDt, regFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sRegDtTo").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(regFromDt, regToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sRegDtTo").focus();
               return false;
            }

            var retFromDt = $("#sReturnDtFr").data("kendoExtMaskedDatePicker").value();
            var retToDt = $("#sReturnDtTo").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(retFromDt, retToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sReturnDtFr").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(retToDt, retFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sReturnDtTo").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(retFromDt, retToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sReturnDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sReturnDtTo").focus();
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
           , title:"<spring:message code='sal.title.venderInfo'/>"  //업체조회
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
           , title:"<spring:message code='sal.menu.accessoryItemMaster' /> <spring:message code='global.btn.search' />"   //용품마스터 조회
            ,content:{
                url:"<c:url value='/sal/acc/itemMaster/selectAccessoryItemMasterSearchPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":viewModel.sBpCd     //업체코드
                    ,"bpNm":viewModel.sBpNm     //업체명
                    ,"itemCd":viewModel.sItemCd //용품코드
                    ,"itemNm":viewModel.sItemNm //용품명
                    ,"callbackFunc":function(data){
                        viewModel.set("sItemCd", data[0].itemCd);
                        viewModel.set("sItemNm", data[0].itemNm);

//                         $("#grid").data("kendoExtGrid").dataSource.data([]);
//                         $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

                        $("#accessoryItemMasterSearchPopup").data("kendoWindow").close();
                    }
                }
            }
        });
    });

    //버튼 - 사용자조회 팝업
    $("#btnSearchUser").bind("click", function(){
        dms.window.popup({
            windowId:"userSearchPopupWin"
           , title:"<spring:message code='global.lbl.user' /> <spring:message code='global.btn.search' />" //사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                ,data:{
                    "autoBind":false
                    ,"closeAfterSelect":false
                    ,"callbackFunc":function(data){
                        viewModel.set("sRegUsrId", data[0].usrId);
                        viewModel.set("sRegUsrNm", data[0].usrNm);

//                         $("#grid").data("kendoExtGrid").dataSource.data([]);
//                         $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

                        $("#userSearchPopupWin").data("kendoWindow").close();
                    }
                }
            }
        });
    });

    //조회조건 - 입고일자 조회시작일
    $("#sRegDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,max:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sRegDtTo}' />", "yyyy-MM-dd")
    });

    //조회조건 - 입고일자 조회종료일
    $("#sRegDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,min:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sRegDtFr}' />", "yyyy-MM-dd")
    });

    //조회조건 - 반품일자 조회시작일
    $("#sReturnDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 반품일자 조회종료일
    $("#sReturnDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //탭설정
    $("#tabstrip").kendoExtTabStrip({
        animation:false
    });

    //용품반품현황 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-00207-181601"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/receive/selectReceiveEtcReturnSummaryListByCondition.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBpCd"] = viewModel.sBpCd;
                        params["sEtcGrDocTp"] = "SAL_ACC";
                        params["sEtcGrDocNo"] = $("#sEtcGrDocNo").val();
                        params["sRegDtFr"] = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                        params["sRegUsrId"] = viewModel.sRegUsrId;
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sReturnDtFr"] = $("#sReturnDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sReturnDtTo"] = $("#sReturnDtTo").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"etcGrDocNo"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,etcGrDocNo:{type:"string"}
                        ,bpCd:{type:"string"}
                        ,bpNm:{type:"string"}
                        ,grDt:{type:"date"}
                        ,itemQty:{type:"number"}
                        ,itemCnt:{type:"number"}
                        ,grTaxAmt:{type:"number"}
                        ,grTotAmt:{type:"number"}
                        ,grTaxDdctAmt:{type:"number"}
                        ,returnQty:{type:"number"}
                        ,returnTaxAmt:{type:"number"}
                        ,returnTotAmt:{type:"number"}
                        ,returnTaxDdctAmt:{type:"number"}
                        ,returnDt:{type:"date"}
                        ,regUsrId:{type:"string"}
                        ,regUsrNm:{type:"string"}
                     }
                }
            }
            ,aggregate:[
                {field:"itemQty", aggregate:"sum"}
                ,{field:"itemCnt", aggregate:"sum"}
                ,{field:"grTotAmt", aggregate:"sum"}
                ,{field:"grTaxDdctAmt", aggregate:"sum"}
                ,{field:"grTaxAmt", aggregate:"sum"}
            ]
        }
        ,selectable:"row"
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,filterable:false
        ,editable:false
        ,appendEmptyColumn:true
        ,columns:[
            {field:"grDt", title:"<spring:message code='sal.lbl.grDt' />", width:80, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}   //입고일
            ,{field:"etcGrDocNo", title:"<spring:message code='sal.lbl.etcGrDocNo' />", width:120}  //입고문서 -> 입고문서번호.
            ,{field:"bpNm", title:"<spring:message code='sal.lbl.bpNm' />", width:140}    //업체명
            ,{field:"itemCnt", title:"<spring:message code='sal.lbl.itemCnt' />", width:90, attributes:{"class":"ar"}, format:"{0:n0}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고용품수 -> 입고건수
            ,{field:"itemQty", title:"<spring:message code='sal.lbl.itemQty' />", width:90, attributes:{ "class":"ar"}, format:"{0:n2}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고수량
            ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:120} //등록자
            ,{field:"grTotAmt", title:"<spring:message code='sal.lbl.grTotIncTaxAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고금액(세금포함)
            ,{field:"grTaxDdctAmt", title:"<spring:message code='sal.lbl.grTotAmt' />", width:120, attributes:{ "class":"ar"}, format:"{0:n2}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고금액(세금제외)
            ,{field:"grTaxAmt", title:"<spring:message code='sal.lbl.vatAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}"
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //세액
            ,{field:"returnDt", title:"<spring:message code='sal.lbl.returnDt' />", width:80, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //반품일자
            ,{field:"returnQty", title:"<spring:message code='sal.lbl.returnQty' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}    //반품수량
        ]
    }).data("kendoExtGrid").refresh();

    //용품반품명세 그리드
    $("#gridDetail").kendoExtGrid({
        gridId:"G-SAL-00207-181602"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/par/pcm/receive/selectReceiveEtcReturnsByCondition.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBpCd"] = viewModel.sBpCd;
                        params["sEtcGrDocTp"] = "SAL_ACC";
                        params["sEtcGrDocNo"] = $("#sEtcGrDocNo").val();
                        params["sRegDtFr"] = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                        params["sRegUsrId"] = viewModel.sRegUsrId;
                        params["sItemCd"] = $("#sItemCd").val();
                        params["sItemNm"] = $("#sItemNm").val();
                        params["sReturnDtFr"] = $("#sReturnDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sReturnDtTo"] = $("#sReturnDtTo").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"invcDocLineNo"
                    ,fields:{
                         dlrCd:{type:"string"}
                        ,etcGrDocNo:{type:"string"}
                        ,etcGrDocLineNo:{type:"string"}
                        ,bpCd:{type:"string"}
                        ,bpNm:{type:"string"}
                        ,itemCd:{type:"string"}
                        ,itemNm:{type:"string"}
                        ,qty:{type:"number"}
                        ,returnQty:{type:"number"}
                        ,grDt:{type:"date"}
                        ,returnDt:{type:"date"}
                        ,remark:{type:"string"}
                        ,prc:{type:"number"}
                        ,taxDdctPrc:{type:"number"}
                        ,amt:{type:"number"}
                        ,taxDdctAmt:{type:"number"}
                        ,regUsrId:{type:"string"}
                        ,regUsrNm:{type:"string"}
                    }
                }
            }
            ,aggregate:[
                 {field:"qty", aggregate:"sum"}
                ,{field:"returnQty", aggregate:"sum"}
                ,{field:"prc", aggregate:"sum"}
                ,{field:"taxDdctPrc", aggregate:"sum"}
                ,{field:"amt", aggregate:"sum"}
                ,{field:"taxDdctAmt", aggregate:"sum"}
            ]
        }
        ,selectable:"row"
        ,scrollable:true
        ,sortable:false
        ,autoBind:false
        ,filterable:false
        ,appendEmptyColumn:true
        ,editable:false
        ,columns:[
             {field:"grDt", title:"<spring:message code='sal.lbl.grDt' />", width:80, attributes:{ "class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} //입고일
            ,{field:"etcGrDocNo", title:"<spring:message code='sal.lbl.etcGrDocNo' />", width:120}    //입고문서번호
            ,{field:"etcGrDocLineNo", title:"<spring:message code='sal.lbl.etcGrDocLineNo' />", width:120, attributes:{"class":"ar"}, sortable:false}   //입고문서라인번호
            ,{field:"bpNm", title:"<spring:message code='sal.lbl.bpNm' />", width:140}    //업체명
            ,{field:"itemCd", title:"<spring:message code='sal.lbl.goodsCd' />", width:140}  //용품코드
            ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm' />", width:200}   //용품명
            ,{field:"returnDt", title:"<spring:message code='sal.lbl.returnDt' />", width:90, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}  //반품일자
            ,{field:"qty", title:"<spring:message code='sal.lbl.itemQty' />", width:60, attributes:{"class":"ar"}, format:"{0:n0}", decimal:0
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고수량
            ,{field:"returnQty", title:"<spring:message code='sal.lbl.returnQty' />", width:60, attributes:{"class":"ar"}, format:"{0:n0}", decimal:0
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //반품수량
            ,{field:"remark", title:"<spring:message code='sal.lbl.returnCause' />", width:140}  //반품사유
            ,{field:"prc", title:"<spring:message code='sal.lbl.wrhsPrice' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고단가
            ,{field:"taxDdctPrc", title:"<spring:message code='sal.lbl.taxDdctPrc' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고단가(세금제외)
            ,{field:"amt", title:"<spring:message code='sal.lbl.grTotIncTaxAmt' />", width:120, attributes:{"class":"ar"}, format:"{0:n2}", decimals:2
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고금액(세금포함)
            ,{field:"taxDdctAmt", title:"<spring:message code='sal.lbl.grTotAmt' />", width:100, attributes:{ "class":"ar"}, format:"{0:n2}", decimals:2
                ,aggregates:["sum"]
                ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
            }   //입고금액(세금제외)
            ,{field:"regUsrNm", title:"<spring:message code='global.lbl.regUsrId' />", width:120} //등록자
        ]
    }).data("kendoExtGrid").refresh();
});
</script>



