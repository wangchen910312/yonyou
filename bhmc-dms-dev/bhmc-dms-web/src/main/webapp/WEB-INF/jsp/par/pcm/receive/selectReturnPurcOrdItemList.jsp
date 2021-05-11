<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 반품리스트 -->
<div id="resizableContainer">

    <section class="group">
        <div class="header_area">
            <!-- <h1 class="title_basic"></h1> -->
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11668" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-12569" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
            </dms:access>
			<dms:access viewId="VIEW-D-11667" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
			</dms:access>
            </div>
        </div>

        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:18%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.receiveReturnNo" /><!-- 반품문서번호 --></th>
                        <td>
                            <input id="sEtcGrDocNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.spyrCd" /><!-- 거래처코드 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input form_readonly" readonly/>
                                <input type="text" id="sBpCd" class="form_input hidden"/>
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.returnDt" /><!-- 반품일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sReturnDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sReturnDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giReturner" /><!-- 신청자 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sRegUsrNm" class="form_input form_readonly" readonly/>
                                <input type="text" id="sRegUsrId" class="form_input hidden"/>
                                <a id="searchRegUsrId"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 품목번호 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input" value="${itemCd}">
                                <a id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grTime" /><!-- 입고일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grDocNo" /><!-- 입고문서번호 --></th>
                        <td>
                            <input id="sRefDocNo" class="form_input">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li id="H" class="k-state-active"><spring:message code="par.title.purcReturnSumList" /><!-- 구매반품집계 --></li>
                <li id="D"><spring:message code="par.title.purcReturnSumListDetail" /><!-- 구매반품명세 --></li>
            </ul>
            <div>
                <div class="table_grid">
                    <!-- 구매오더 그리드 -->
                    <div id="grid" class="resizable_grid"></div>
                </div>
            </div>
            <div>
                <div class="table_grid">
                    <!-- 구매오더 그리드 -->
                    <div id="gridDetail" class="resizable_grid"></div>
                </div>
            </div>
    </section>
<!-- //구매오더 -->
</div><!-- resizableContainer -->
<!-- script -->
<script>
    var popupWindow,
        sessionBpCd         = "${bpCd}",
        sessionBpNm         = "${bpNm}",
        toDt                = "${toDt}",
        sevenDtBf           = "${sevenDtBf}",
        selectTabId        = "H",
        rowNumber           = 0, //그리드 목록 번호
        popItemObj          = {},
        searchItemPopupWindow;

        function initPage(){
            var minDate = new Date(sevenDtBf),
                maxDate = new Date(toDt),
                toYY,
                toMM,
                toDD,
                frYY,
                frMM,
                frDD;
            //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
            //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
                return false;
            }

            // 품목 정보 Reset
            //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
            partsJs.validate.groupObjAllDataInit();

            $("#grid").data("kendoExtGrid").dataSource.data([]);
            $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

            popItemObj = {};

            $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅
            $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅

            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();

        }

        var venderSearchPopupWin;
        function selectVenderMasterPopupWindow(){

            venderSearchPopupWin = dms.window.popup({
                windowId:"venderSearchPopupWin"
                ,title:"<spring:message code = 'par.title.venderSelect'/>"   // 거래처 조회
                ,content:{
                    url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                    ,data:{
                        "type":"custom1"
                        ,"autoBind":false
                        ,"bpCd":''
                        ,"bpNm":''
                        ,"bpTp":'03'
                        ,"selectable":'multiple'
                        ,"callbackFunc":function(data){
                            if(data.length > 0){
                                var bpNm,
                                    bpCd;
                                for(var i = 0,dlen = data.length; i < dlen; i = i + 1){
                                    if(i === 0){
                                        bpNm = data[i].bpNm;
                                        bpCd = data[i].bpCd;
                                    }else{
                                        bpNm = bpNm + ',' + data[i].bpNm;
                                        bpCd = bpCd + '|' + data[i].bpCd;
                                    }
                                }
                                $("#sBpNm").val(bpNm);
                                $("#sBpCd").val(bpCd);
                            }

                            venderSearchPopupWin.close();
                        }
                    }
                }
            });
        }

        function userSearchPopup() {
            userSearchPopupWin = dms.window.popup({
                windowId:"userSearchPopupWin"
                ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
                ,content:{
                    url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                    , data:{
                        "autoBind":false
                        ,"usrNm":""
                        ,"closeAfterSelect": true
                        ,"callbackFunc":function(data){
                            if(data.length > 0){
                                $("#sRegUsrId").val(data[0].usrId);
                                $("#sRegUsrNm").val(data[0].usrNm);
                            }
                        }
                    }
                }

            });
        }

        // 부품 팝업 열기 함수.
        function selectPartsMasterPopupWindow(){

            searchItemPopupWindow = dms.window.popup({
                windowId:"partsMasterPopup"
                ,title:"<spring:message code='par.title.itemInfo' />"   // 품목정보
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
                                $("#sItemNm").val(data[0].itemNm);

                            }
                            searchItemPopupWindow.close();
                        }
                    }
                }
            });
        }

        function fnChkDateValue(e){
           var  elmt  = e.sender.element[0],
                id    = elmt.id,
                toYY,
                toMM,
                toDD,
                frYY,
                frMM,
                frDD;

           if(id === 'sRegDtFr'){
               frYY = this.value().getFullYear();
               frMM = this.value().getMonth();
               frDD = this.value().getDate();
               $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
           }else if(id === 'sRegDtTo'){
               toYY = this.value().getFullYear();
               toMM = this.value().getMonth();
               toDD = this.value().getDate();
               $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
           }else if(id === 'sReturnDtFr'){
               frYY = this.value().getFullYear();
               frMM = this.value().getMonth();
               frDD = this.value().getDate();
               $("#sReturnDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
           }else if(id === 'sReturnDtTo'){
               toYY = this.value().getFullYear();
               toMM = this.value().getMonth();
               toDD = this.value().getDate();
               $("#sReturnDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
           }
        }

     // 품목구분 그리드 콤보
     function setSumData(val){
         var returnData  = Math.round(val * 1000)/1000,
             returnCalData = Math.round(returnData * 100)/100,
             returnVal = kendo.toString(returnData,'n2');

         return returnVal;
     };

    $(document).ready(function() {

        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sReturnDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sReturnDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });


        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchRegUsrId").on('click', userSearchPopup);
        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);


        //tabstrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select: function(e) {
                selectTabId = e.item.id;
            }
        });

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                /*
                if(dms.string.isEmpty($("#sBpCd").val())){
                    //거래처정보는 필수 입력 사항입니다.
                    dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.required.field' arguments='${bpCd}'/>");
                    return false;
                }
                */

                $("#grid").data("kendoExtGrid").dataSource.page(1);
                $("#gridDetail").data("kendoExtGrid").dataSource.page(1);
            }
        });

        //btnExcelExport
        $("#btnExcelExport").kendoButton({
            click:function(e){

                var beanName;
                var templateFile;
                var fileName;

                if(selectTabId == "H"){
                    beanName = "receiveEtcService";
                    templateFile = "PartReturnPurcOrdStatusHeader_Tpl.xlsx";
                    fileName = "PartReturnPurchaseOrderHeader.xlsx";
                } else {
                    beanName = "receiveEtcService";
                    templateFile = "PartReturnPurcOrdStatusDetail_Tpl.xlsx";
                    fileName = "PartReturnPurchaseOrderDetail.xlsx";
                }

                var sBpCdList =  $("#sBpCd").val().split('|');

                dms.ajax.excelExport({
                    "beanName":beanName
                    ,"templateFile":templateFile
                    ,"fileName":fileName
                    ,"sBpCdList":sBpCdList
                    ,"sEtcGrDocNo":$("#sEtcGrDocNo").val()
                    ,"sRegUsrId":$("#sRegUsrId").val()
                    ,"sItemCd":$("#sItemCd").val()
                    ,"sItemNm":$("#sItemNm").val()
                    ,"sRegDtFr":$("#sRegDtFr").val()
                    ,"sRegDtTo":$("#sRegDtTo").val()
                    ,"sReturnDtFr":$("#sReturnDtFr").val()
                    ,"sReturnDtTo":$("#sReturnDtTo").val()
                    ,"sRefDocNo":$("#sRefDocNo").val()
                    ,"sListType":selectTabId
                });
            }
        });

        // 구매반품 집계 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0212-172202"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/receive/selectPurcReceiveReturnSummaryListByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {


                            //var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoMultiSelect").value();
                            var params = {},
                                sBpCdList =  $("#sBpCd").val().split('|');

                            if(sBpCdList.length === 1){
                                if(dms.string.isEmpty(sBpCdList[0])){
                                    sBpCdList = [];
                                }
                            }else if(sBpCdList.length === 0){
                                sBpCdList = [];
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 구매오더 검색조건 코드.
                            params["sBpCdList"]          = sBpCdList;
                            params["sEtcGrDocNo"]        = $("#sEtcGrDocNo").val();
                            params["sRegUsrId"]          = $("#sRegUsrId").val();
                            params["sRegDtFr"]           = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"]           = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sReturnDtFr"]        = $("#sReturnDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sReturnDtTo"]        = $("#sReturnDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sRefDocNo"]          = $("#sRefDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        if(result.total === 0){
                            dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }

                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                       id:"etcGrDocNo"
                      ,fields:{
                            dlrCd                  :{ type:"string" , validation:{required:true} }
                          , etcGrDocNo             :{ type:"string", editable:false }
                          , refDocNo               :{ type:"string", editable:false }
                          , bpCd                   :{ type:"string", editable:false }
                          , bpNm                   :{ type:"string", editable:false }
                          , grDt                   :{ type:"date", editable:false }
                          , itemQty                :{ type:"number", editable:false }
                          , itemCnt                :{ type:"number", editable:false }
                          , grTaxAmt               :{ type:"number", editable:false }
                          , grTotAmt               :{ type:"number", editable:false }
                          , grTaxDdctAmt           :{ type:"number", editable:false }
                          , returnItemCnt          :{ type:"number", editable:false }
                          , returnQty              :{ type:"number", editable:false }
                          , returnTaxAmt           :{ type:"number", editable:false }
                          , returnTotAmt           :{ type:"number", editable:false }
                          , returnTaxDdctAmt       :{ type:"number", editable:false }
                          , returnMovingAvgTotAmt  :{ type:"number", editable:false }
                          , preReturnQty           :{ type:"number", editable:false }
                          , preReturnAmt           :{ type:"number", editable:false }
                          , preReturnMovingAvgAmt  :{ type:"number", editable:false }
                          , returnDt               :{ type:"date", editable:false }
                          , regUsrId               :{ type:"string", editable:false }
                          , regUsrNm               :{ type:"string", editable:false }
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.returnDt = kendo.parseDate(elem.returnDt, "<dms:configValue code='dateFormat' />");
                                elem.grDt = kendo.parseDate(elem.grDt, "<dms:configValue code='dateFormat' />");
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:
                    [
                         { field: "returnItemCnt", aggregate: "sum" }
                        ,{ field: "returnQty", aggregate: "sum" }
                        ,{ field: "returnTotAmt", aggregate: "sum" }
                        ,{ field: "returnTaxDdctAmt", aggregate: "sum" }
                        ,{ field: "returnTaxAmt", aggregate: "sum" }
                        ,{ field: "returnMovingAvgTotAmt", aggregate: "sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , dataBinding :function(e){
                rowNumber = 0;
             }
            , editable:false
            , columns:[
                {field:"dlrCd", title:"<spring:message code='par.lbl.dlrCd' />" ,width:80 ,hidden:true}//딜러코드
                ,{field:"returnDt"
                    ,title:"<spring:message code='par.lbl.returnDt' />"
                    ,width:90
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (returnDt !== null ){# #= kendo.toString(data.returnDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }                //입고반품일
                ,{field:"etcGrDocNo" ,title:"<spring:message code='par.lbl.returnDocNo' />" ,width:120 }//반품번호
                ,{field:"bpCd" ,title:"<spring:message code='par.lbl.bpCd' />" ,width:105 ,hidden:true}//거래처 코드
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.sBpNm' />" ,width:140 }//공급업체
                ,{field:"regUsrId" ,title:"<spring:message code='global.lbl.regUsrId' />" ,width:120,hidden:true}//등록자
                ,{field:"regUsrNm" ,title:"<spring:message code='par.lbl.giReturner' />" ,width:120}//반품자
                 ,{field:"returnItemCnt" ,title:"<spring:message code='par.lbl.returnCnt' />" ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                 }//건수
                 ,{field:"returnQty" ,title:"<spring:message code='par.lbl.grReturnQty' />" ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                 }//수량
                 ,{field:"returnTotAmt" ,title:"<spring:message code='par.lbl.returnAmtTax' />" ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                 }//입고반품금액(세금제외)
                 ,{field:"returnTaxDdctAmt" ,title:"<spring:message code='par.lbl.taxDdctAmt' />" ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                     ,hidden:true
                 }//입고반품금액(세금포함)
                 ,{field:"returnTaxAmt" ,title:"<spring:message code='par.lbl.taxAmt' />" ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                     ,hidden:true
                 }//입고반품 세금  20200514 updateby tjx 取值问题,退货成本金额修改为returnMovingAvgTotAmt,修改前为returnTotAmt
                 ,{field:"returnMovingAvgTotAmt" ,title:"<spring:message code='par.lbl.returnMovingAvgAmt' />" ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                 }//입고반품이평가금액
                 ,{field:"preReturnQty" ,title:"<spring:message code='par.lbl.preRtQty' />" ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                 }//기반품수량
                ,{field:"refDocNo" ,title:"<spring:message code='par.lbl.grDocNo' />" ,width:120 }//입고번호
                ,{field:"grDt", title:"<spring:message code='par.lbl.grTime' />" ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,width:90
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (grDt !== null ){# #= kendo.toString(data.grDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//입고일자
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.invcGrCnt' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                }//건수
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                }//수량
                ,{field:"grTotAmt" ,title:"<spring:message code='par.lbl.grAmtTax' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                }//입고금액(세금제외)
                ,{field:"grTaxDdctAmt" ,title:"<spring:message code='par.lbl.taxDdctAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,hidden:true
                }//입고금액(세금포함)
                ,{field:"grTaxAmt" ,title:"<spring:message code='par.lbl.taxAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,hidden:true
                }//입고금액 세금
            ]
        });

        // 구매 명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0212-172201"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/receive/selectPurcReceiveReturnsByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {


                            //var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoMultiSelect").value();
                            var params = {},
                                sBpCdList =  $("#sBpCd").val().split('|');

                            if(sBpCdList.length === 1){
                                if(dms.string.isEmpty(sBpCdList[0])){
                                    sBpCdList = [];
                                }
                            }else if(sBpCdList.length === 0){
                                sBpCdList = [];
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 구매오더 검색조건 코드.
                            params["sBpCdList"]          = sBpCdList;
                            params["sEtcGrDocNo"]        = $("#sEtcGrDocNo").val();
                            params["sRegUsrId"]          = $("#sRegUsrId").val();
                            params["sRegDtFr"]           = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"]           = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sReturnDtFr"]        = $("#sReturnDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sReturnDtTo"]        = $("#sReturnDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sRefDocNo"]          = $("#sRefDocNo").val();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                       id:"etcGrDocNo"
                      ,fields:{
                            dlrCd                   :{ type:"string" , validation:{required:true} }
                          , etcGrDocNo              :{ type:"string", editable:false }
                          , etcGrDocLineNo          :{ type:"string", editable:false }
                          , refDocNo                :{ type:"string", editable:false }
                          , refDocLineNo            :{ type:"string", editable:false }
                          , bpCd                    :{ type:"string", editable:false }
                          , bpNm                    :{ type:"string", editable:false }
                          , itemCd                  :{ type:"string", editable:false }
                          , itemNm                  :{ type:"string", editable:false }
                          , qty                     :{ type:"number", editable:false }
                          , returnQty               :{ type:"number", editable:false }
                          , preReturnQty            :{ type:"number", editable:false }
                          , preReturnAmt            :{ type:"number", editable:false }
                          , preReturnMovingAvgAmt   :{ type:"number", editable:false }
                          , grDt                    :{ type:"date", editable:false }
                          , returnDt                :{ type:"date", editable:false }
                          , remark                  :{ type:"string", editable:false }
                          , prc                     :{ type:"number", editable:false }
                          , taxDdctPrc              :{ type:"number", editable:false }
                          , amt                     :{ type:"number", editable:false }
                          , returnMovingAvgAmt      :{ type:"number", editable:false }
                          , taxDdctAmt              :{ type:"number", editable:false }
                          , regUsrId                :{ type:"string", editable:false }
                          , regUsrNm                :{ type:"string", editable:false }
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.returnDt = kendo.parseDate(elem.returnDt, "<dms:configValue code='dateFormat' />");
                                elem.grDt = kendo.parseDate(elem.grDt, "<dms:configValue code='dateFormat' />");
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:
                    [
                         { field: "returnQty",  aggregate: "sum" }
                        ,{ field: "taxDdctPrc", aggregate: "sum" }
                        ,{ field: "returnAmt",  aggregate: "sum" }
                        ,{ field: "returnTaxDdctAmt", aggregate: "sum" }
                        ,{ field: "returnMovingAvgAmt", aggregate: "sum" }
                        ,{ field: "amt", aggregate: "sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , sortable:false
            , autoBind   :false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , dataBinding :function(e){
                rowNumber = 0;
             }
            , editable:false
            , columns:[
                {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />" ,width:80 ,hidden:true}//딜러코드
                ,{field:"rnum" ,title:"<spring:message code='par.lbl.lineNm' />" ,width:40 ,attributes:{ "class":"ac"}
                    ,template:"#= ++rowNumber #"
                    ,hidden:true
                }//라인번호
                ,{field:"returnDt"
                    ,title:"<spring:message code='par.lbl.returnDt' />"
                    ,width:90
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (returnDt !== null ){# #= kendo.toString(data.returnDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }                //입고반품일
                ,{field:"etcGrDocNo" ,title:"<spring:message code='par.lbl.returnDocNo' />" ,width:120 }//반품번호
                ,{field:"etcGrDocLineNo" ,title:"<spring:message code='par.lbl.lineNm' />" ,attributes:{ "class":"ar"} ,width:70 ,sortable:false}//Line
                ,{field:"bpCd" ,title:"<spring:message code='par.lbl.bpCd' />" ,width:105 ,hidden:true}//거래처 코드
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.sBpNm' />" ,width:140 }//공급업체
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:140}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200 ,sortable:false}//부품명
                ,{field:"returnQty" ,title:"<spring:message code='par.lbl.grReturnQty' />" ,width:60 ,attributes:{ "class":"ar"}
                 ,format:"{0:n2}" ,decimal:2 ,sortable:false
                 ,aggregates:["sum"]
                 ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }//반품수량
                ,{field:"preReturnQty" ,title:"<spring:message code='par.lbl.preRtQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                }//기반품수량
                ,{field:"prc" ,title:"<spring:message code='par.lbl.returnPrc' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                }//입고단가
                ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.returnTaxDdctPrc' />" ,width:100
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                    ,hidden:true
                }//입고단가(세금제외)
                ,{field:"returnAmt" ,title:"<spring:message code='par.lbl.returnAmtTax' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액
                ,{field:"returnTaxDdctAmt" ,title:"<spring:message code='par.lbl.taxDdctAmt' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                    ,hidden:true
                }//입고금액(세금제외)
//                 ,{field:"returnAmt" ,title:"<spring:message code='par.lbl.returnMovingAvgAmt' />" ,width:120
//                     ,attributes:{ "class":"ar"}
//                     ,format:"{0:n2}"
//                     ,decimals:2
//                     ,aggregates:["sum"]
//                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
//                 }
                //20210112 update by tjx 退回成本额取值调整 
                ,{field:"returnMovingAvgAmt" ,title:"<spring:message code='par.lbl.returnMovingAvgAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//이평가반품입고금액
                ,{field:"grDt", title:"<spring:message code='par.lbl.grTime' />" ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,width:90
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (grDt !== null ){# #= kendo.toString(data.grDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//입고일자
                ,{field:"refDocNo" ,title:"<spring:message code='par.lbl.grDocNo' />" ,width:120 }//입고번호
                ,{field:"qty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2 ,sortable:false
                }//구매수량
                ,{field:"amt" ,title:"<spring:message code='par.lbl.grAmtTax' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액
                ,{field:"taxDdctAmt" ,title:"<spring:message code='par.lbl.grAmt' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                 ,hidden:true}//입고금액(세금제외)
                ,{field:"regUsrId" ,title:"<spring:message code='par.lbl.giReturner' />" ,width:120 ,hidden:true}//신청자
                ,{field:"regUsrNm" ,title:"<spring:message code='par.lbl.giReturner' />" ,width:120}//신청자
            ]
        });

        initPage();
    });
</script>
<!-- //script -->

