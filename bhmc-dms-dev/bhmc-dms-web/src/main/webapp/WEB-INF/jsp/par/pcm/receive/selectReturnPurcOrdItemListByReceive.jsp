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
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
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
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcGrDocNo" /><!-- 입고문서번호 --></th>
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
                        <th scope="row"><spring:message code="global.lbl.regUsrId" /><!-- 신청자 --></th>
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
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="par.title.purcReturnSumList" /><!-- 구매반품집계 --></li>
                <li><spring:message code="par.title.purcReturnSumListDetail" /><!-- 구매반품명세 --></li>
            </ul>
            <div>
                <div class="table_grid">
                    <!-- 구매오더 그리드 -->
                    <div id="grid" class="grid"></div>
                </div>
            </div>
            <div>
                <div class="table_grid">
                    <!-- 구매오더 그리드 -->
                    <div id="gridDetail" class="grid"></div>
                </div>
            </div>
    </section>
</div>
    <!-- //구매오더 -->

<!-- script -->
<script>

    var popupWindow,
        sessionBpCd         = "${bpCd}",
        sessionBpNm         = "${bpNm}",
        toDt                = "${toDt}",
        sevenDtBf           = "${sevenDtBf}",
        rowNumber           = 0, //그리드 목록 번호
        popItemObj          = {},
        searchItemPopupWindow;

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

                $("#grid").data("kendoExtGrid").dataSource.read();
                $("#gridDetail").data("kendoExtGrid").dataSource.read();
            }
        });


        // 구매반품 집계 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-1215-142202"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/receive/selectReceiveEtcReturnSummaryListByCondition.do' />"
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
                            dlrCd               :{ type:"string" , validation:{required:true} }
                          , etcGrDocNo          :{ type:"string", editable:false }
                          , bpCd                :{ type:"string", editable:false }
                          , bpNm                :{ type:"string", editable:false }
                          , grDt                :{ type:"date", editable:false }
                          , itemQty             :{ type:"number", editable:false }
                          , itemCnt             :{ type:"number", editable:false }
                          , grTaxAmt            :{ type:"number", editable:false }
                          , grTotAmt            :{ type:"number", editable:false }
                          , grTaxDdctAmt        :{ type:"number", editable:false }
                          , returnQty           :{ type:"number", editable:false }
                          , returnTaxAmt        :{ type:"number", editable:false }
                          , returnTotAmt        :{ type:"number", editable:false }
                          , returnTaxDdctAmt    :{ type:"number", editable:false }
                          , returnDt            :{ type:"date", editable:false }
                          , regUsrId            :{ type:"string", editable:false }
                          , regUsrNm            :{ type:"string", editable:false }
                        }
                    }
                }
                ,aggregate:
                    [
                        { field: "itemCnt", aggregate: "sum" }
                        ,{ field: "itemQty", aggregate: "sum" }
                        ,{ field: "grTotAmt", aggregate: "sum" }
                        ,{ field: "grTaxDdctAmt", aggregate: "sum" }
                        ,{ field: "grTaxAmt", aggregate: "sum" }
                        ,{ field: "returnQty", aggregate: "sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , dataBinding :function(e){
                rowNumber = 0;
             }
            , editable:false
            , columns:[
                {field:"dlrCd", title:"<spring:message code='par.lbl.dlrCd' />" ,width:80 ,hidden:true}//딜러코드
                ,{field:"grDt", title:"<spring:message code='par.lbl.grTime' />" ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{"class":"ac"}
                    ,width:90
                }//입고일자
                ,{field:"etcGrDocNo" ,title:"<spring:message code='par.lbl.purcGrDocNo' />" ,width:120 }//입고번호
                ,{field:"bpCd" ,title:"<spring:message code='par.lbl.bpCd' />" ,width:105 ,hidden:true}//거래처 코드
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.supplyNo' />" ,width:140 }//공급업체
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.invcGrCnt' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//건수
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//수량
                ,{field:"regUsrId" ,title:"<spring:message code='global.lbl.regUsrId' />" ,width:120,hidden:true}//등록자
                ,{field:"regUsrNm" ,title:"<spring:message code='global.lbl.regUsrId' />" ,width:120}//등록자
                ,{field:"grTotAmt" ,title:"<spring:message code='par.lbl.grAmtTax' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액(세금제외)
                ,{field:"grTaxDdctAmt" ,title:"<spring:message code='par.lbl.taxDdctAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액(세금포함)
                ,{field:"grTaxAmt" ,title:"<spring:message code='par.lbl.taxAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액(세금포함)
                ,{field:"returnDt"
                 ,title:"<spring:message code='par.lbl.returnDt' />"
                 ,format:"{0:<dms:configValue code='dateFormat' />}"
                 ,attributes:{ "class":"ac"}
                 ,width:90 }                //입고반품일
                ,{field:"returnQty"
                 ,title:"<spring:message code='par.lbl.grReturnQty' />"
                 ,width:90
                 ,attributes:{ "class":"ar"}
                 ,format:"{0:n2}"
                 ,aggregates:["sum"]
                 ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//수량
            ]
        });

        // 구매 명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-1215-142201"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/receive/selectReceiveEtcReturnsByCondition.do' />"
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
                            dlrCd               :{ type:"string" , validation:{required:true} }
                          , etcGrDocNo          :{ type:"string", editable:false }
                          , etcGrDocLineNo      :{ type:"string", editable:false }
                          , bpCd                :{ type:"string", editable:false }
                          , bpNm                :{ type:"string", editable:false }
                          , itemCd              :{ type:"string", editable:false }
                          , itemNm              :{ type:"string", editable:false }
                          , qty                 :{ type:"number", editable:false }
                          , returnQty           :{ type:"number", editable:false }
                          , grDt                :{ type:"date", editable:false }
                          , returnDt            :{ type:"date", editable:false }
                          , remark              :{ type:"string", editable:false }
                          , prc                 :{ type:"number", editable:false }
                          , taxDdctPrc          :{ type:"number", editable:false }
                          , amt                 :{ type:"number", editable:false }
                          , taxDdctAmt          :{ type:"number", editable:false }
                          , regUsrId            :{ type:"string", editable:false }
                          , regUsrNm            :{ type:"string", editable:false }
                        }
                    }
                }
                ,aggregate:
                    [
                        { field: "qty", aggregate: "sum" }
                        ,{ field: "returnQty", aggregate: "sum" }
                        ,{ field: "prc", aggregate: "sum" }
                        ,{ field: "taxDdctPrc", aggregate: "sum" }
                        ,{ field: "amt", aggregate: "sum" }
                        ,{ field: "taxDdctAmt", aggregate: "sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , filterable:false
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
                ,{field:"grDt" ,title:"<spring:message code='par.lbl.grTime' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//입고일자
                ,{field:"etcGrDocNo" ,title:"<spring:message code='par.lbl.purcGrDocNo' />" ,width:120 }//입고번호
                ,{field:"etcGrDocLineNo" ,title:"<spring:message code='par.lbl.lineNm' />" ,attributes:{ "class":"ar"} ,width:70 ,sortable:false}//Line
                ,{field:"bpCd" ,title:"<spring:message code='par.lbl.bpCd' />" ,width:105 ,hidden:true}//거래처 코드
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.supplyNo' />" ,width:140 }//공급업체
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:140}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200 ,sortable:false}//부품명
                ,{field:"returnDt" ,title:"<spring:message code='par.lbl.returnDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//입고반품일
                ,{field:"qty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0 ,sortable:false
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//구매수량
                ,{field:"returnQty" ,title:"<spring:message code='par.lbl.grReturnQty' />" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}" ,decimal:0 ,sortable:false
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//반품수량
                ,{field:"remark" ,title:"<spring:message code='par.lbl.reasonCont' />" ,width:140}//사유
                ,{field:"prc" ,title:"<spring:message code='par.lbl.grItemPrice' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고단가
                ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.grItemPriceTax' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고단가(세금제외)
                ,{field:"amt" ,title:"<spring:message code='par.lbl.grAmtTax' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액
                ,{field:"taxDdctAmt" ,title:"<spring:message code='par.lbl.grAmt' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액(세금제외)
                ,{field:"regUsrId" ,title:"<spring:message code='global.lbl.regUsrId' />" ,width:120 ,hidden:true}//신청자
                ,{field:"regUsrNm" ,title:"<spring:message code='global.lbl.regUsrId' />" ,width:120}//신청자
            ]
        });

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
           // $("#sRegDtFr").data("kendoDatePicker").value(new Date(sevenDtBf));
           // $("#sRegDtTo").data("kendoDatePicker").value(new Date(toDt));

            frYY = minDate.getFullYear();
            frMM = minDate.getMonth();
            frDD = minDate.getDate();

            toYY = maxDate.getFullYear();
            toMM = maxDate.getMonth();
            toDD = maxDate.getDate();
            $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
            $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

            $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

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
                            //$("#sBpNm").val(data[0].bpNm);
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

           if(this.value() == null){
               if(id === 'sRegDtFr'){
                   var minDate = new Date(sevenDtBf);
                   frYY = minDate.getFullYear();
                   frMM = minDate.getMonth();
                   frDD = minDate.getDate();
                   $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                   $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sRegDtTo'){
                   var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   toDD = maxDate.getDate();

                   $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                   $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }else if(id === 'sReturnDtFr'){
                   var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   toDD = maxDate.getDate();

                   $("#sReturnDtFr").data("kendoExtMaskedDatePicker").value(toDt);
                   $("#sReturnDtTo").data("kendoExtMaskedDatePicker").min(new Date(toYY,toMM,toDD));
               }else if(id === 'sReturnDtTo'){
                   var maxDate = new Date(toDt);
                   toYY = maxDate.getFullYear();
                   toMM = maxDate.getMonth();
                   toDD = maxDate.getDate();

                   $("#sReturnDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                   $("#sReturnDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }else{
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


        }
        initPage();
    });
</script>
<!-- //script -->

