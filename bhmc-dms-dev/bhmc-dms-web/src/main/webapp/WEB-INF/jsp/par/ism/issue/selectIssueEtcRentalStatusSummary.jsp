<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 차출출고현황조회 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11940" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-12583" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
            </dms:access>
			<dms:access viewId="VIEW-D-11939" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search btn_m_min" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
			</dms:access>
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
                        <th scope="row"><spring:message code="par.lbl.bpTp" /><!-- 업체 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input form_readonly" readonly>
                                <input type="text" id="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.issueEtcRentalNo" /><!-- 기타출고문서번호 --></th>
                        <td>
                            <input id="sEtcGiDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giDt" /><!-- 출고일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sGiDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sGiDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giStatCd" /><!-- 출고상태 --></th>
                        <td>
                            <input id="sStatCd" class="form_comboBox" data-type="combo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번(부품번호) --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giStrgeCd" /><!-- 출고창고 --></th>
                        <td>
                            <input id="sStrgeCd" class="form_comboBox" data-type="combo">
                        </td>
                        <th>
                        <td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="dataForm" class="mt10">
        <!-- 탭메뉴 전체 영역 -->
         <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li id="IERH" class="k-state-active"><spring:message code="par.title.giRentalSumList" /><!-- 차출출고집계 --></li>
                <li id="IERD"><spring:message code="par.title.giRentalSumListDetail" /><!-- 차출출고명세 --></li>
            </ul>
            <div>
                  <!-- 출고헤더정보  -->
                  <div class="table_grid">
                      <div id="grid" class="resizable_grid"></div>
                  </div>
                  <!-- 출고헤더정보  -->
              </div>
              <div>
                  <!-- 출고디테일정보  -->
                  <div class="table_grid">
                      <div id="gridDetail" class="resizable_grid"></div>
                  </div>
                  <!-- 출고디테일정보  -->
              </div>
          </div>
        </div>
    </section>
    <!-- //입고 -->
</div>
<!-- script -->
<script>

    var sessionBpCd     = "${bpCd}"
       ,sessionBpNm     = "${bpNm}"
       ,toDt            = "${toDt}"
       ,sevenDtBf       = "${sevenDtBf}"
       ,selectTabId     = "IERH"
       ,giStrgeTpList   = []
       ,giStrgeTpObj    = {}
       ,statCdList      = []
       ,statCdObj       = {}
       ,searchItemPopupWindow;


    //출고창고
    giStrgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        giStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        giStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    statCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${statCdList}" varStatus="status">
        statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        statCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    $(document).ready(function() {
        //출고상태선택
        $("#sStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:statCdList
            ,index:0
        });

        // 출고창고 선택
        $("#sStrgeCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:giStrgeTpList
            ,index:0
            ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        });

        //출고일자
        $("#sGiDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //출고일자
        $("#sGiDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);

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

                $("#grid").data("kendoExtGrid").dataSource.read();
                $("#gridDetail").data("kendoExtGrid").dataSource.read();
            }
        });

        //btnExcelExport
        $("#btnExcelExport").kendoButton({
            click:function(e){

                var beanName;
                var templateFile;
                var fileName;

                if(selectTabId == "IERH"){
                    beanName = "issueEtcService";
                    templateFile = "PartIssueEtcRentalHeader_Tpl.xlsx";
                    fileName = "PartIssueEtcRentalHeader.xlsx";
                } else {
                    beanName = "issueEtcService";
                    templateFile = "PartIssueEtcRentalDetail_Tpl.xlsx";
                    fileName = "PartIssueEtcRentalDetail.xlsx";
                }

                var sBpCdList =  $("#sBpCd").val().split('|');
                var sMvtTpList = ['47'];

                if(dms.string.isEmpty(sBpCdList[0])){
                    sBpCdList.splice(0,1);
                }

                if(sBpCdList.length === 0){
                    sBpCdList = [];
                }

                dms.ajax.excelExport({
                    "beanName":beanName
                    ,"templateFile":templateFile
                    ,"fileName":fileName
                    ,"sBpCdList":sBpCdList
                    ,"sEtcGiDocNo":$("#sEtcGiDocNo").val()
                    ,"sStatCd":$("#sStatCd").data("kendoExtDropDownList").value()
                    ,"sItemCd":$("#sItemCd").val()
                    ,"sItemNm":$("#sItemNm").val()
                    ,"sStrgeCd":$("#sStrgeCd").data("kendoExtDropDownList").value()
                    ,"sGiDtFr":$("#sGiDtFr").val()
                    ,"sGiDtTo":$("#sGiDtTo").val()
                    ,"sMvtTpList":sMvtTpList
                    ,"sReturnMvtTp":'36'
                    ,"sListType":selectTabId
                });
            }
        });

        //기타출고 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0906-150401"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectIssueEtcListByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sBpCdList =  $("#sBpCd").val().split('|'),
                                sMvtTpList = ['47'];

                            if(dms.string.isEmpty(sBpCdList[0])){

                                sBpCdList.splice(0,1);
                            }

                            if(sBpCdList.length === 0){
                                sBpCdList = [];
                            }


                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;
                            // 기타출고 검색조건 코드.
                            params["sBpCdList"]          = sBpCdList;
                            params["sEtcGiDocNo"]        = $("#sEtcGiDocNo").val();
                            params["sStatCd"]            = $("#sStatCd").data("kendoExtDropDownList").value();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sStrgeCd"]           = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sGiDtFr"]           = $("#sGiDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sGiDtTo"]           = $("#sGiDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sMvtTpList"]         = sMvtTpList;
                            params["sReturnMvtTp"]       = '36';

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
                        id:"etcGiDocNo"
                       ,fields:{
                              dlrCd         :{ type:"string", editable:false }
                            , statCd        :{ type:"string", editable:false }
                            , etcGiDocNo    :{ type:"string", editable:false } //출고번호
                            , giDt          :{ type:"date",   editable:false }
                            , itemQty       :{ type:"number", editable:false }
                            , itemCnt       :{ type:"number", editable:false }
                            , bpCd          :{ type:"string", editable:false }
                            , bpNm          :{ type:"string", editable:false }
                            , regUsrId      :{ type:"string", editable:false }
                            , regUsrNm      :{ type:"string", editable:false }
                            , dcRate        :{ type:"number", editable:false }
                            , giTaxAmt      :{ type:"number", editable:false }
                            , giTotAmt      :{ type:"number", editable:false }
                            , giTaxDdctAmt  :{ type:"number", editable:false }
                            , returnStat    :{ type:"string", editable:false }
                         }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.giDt = kendo.parseDate(elem.giDt, "<dms:configValue code='dateFormat' />");
                                elem.statCd = changeStatCd(elem.statCd);
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:
                    [
                        { field: "itemCnt", aggregate: "sum" }
                        ,{ field: "itemQty", aggregate: "sum" }
                        ,{ field: "dcRate", aggregate: "sum" }
                        ,{ field: "giTotAmt", aggregate: "sum" }
                        ,{ field: "giTaxDdctAmt", aggregate: "sum" }
                        ,{ field: "giTaxAmt", aggregate: "sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , editable   :false
            , height:403
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , columns:[
                 {field:"statCd" ,title:"<spring:message code='par.lbl.giStatCd' />" ,attributes:{ "class":"ac"} ,width:100}//입고상태
                ,{field:"returnStat" ,title:"<spring:message code='par.lbl.returnStat' />" ,attributes:{ "class":"ac"} ,width:100}//반환상태
                ,{field:"etcGiDocNo" ,title:"<spring:message code='par.lbl.issueEtcRentalNo' />" ,width:120}//출고문서번호
                ,{field:"giDt" ,title:"<spring:message code='par.lbl.giDt' />"
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,width:90
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (giDt !== null ){# #= kendo.toString(data.giDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//입고일자
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.giCount' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }//건수
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.giQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }//수량
                ,{field:"regUsrId" ,title:"<spring:message code='global.lbl.regUsrId' />" ,width:120,hidden:true}//등록자
                ,{field:"regUsrNm" ,title:"<spring:message code='global.lbl.regUsrId' />" ,width:120}//등록자
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.bpTp' />" ,width:140 }//업체
                ,{field:"dcRate" ,title:"<spring:message code='par.lbl.taxRate' />" ,width:90
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,template:function(dataItem){
                         return dataItem.dcRate + "%";
                     }
                }//세율
                ,{field:"giTotAmt" ,title:"<spring:message code='par.lbl.giIncTaxAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//출고금액(세금제외)
                ,{field:"giTaxDdctAmt" ,title:"<spring:message code='par.lbl.taxDdctAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//출고금액(세금포함)
                ,{field:"giTaxAmt" ,title:"<spring:message code='par.lbl.taxAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//출고금액(세금포함)
           ]
        });

        // 기타출고 명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0906-150402"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectIssueEtcRentalDetailListByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sBpCdList =  $("#sBpCd").val().split('|'),
                                sMvtTpList = ['47'];

                            if(dms.string.isEmpty(sBpCdList[0])){

                                sBpCdList.splice(0,1);
                            }

                            if(sBpCdList.length === 0){
                                sBpCdList = [];
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;
                            // 기타출고 검색조건 코드.
                            params["sBpCdList"]          = sBpCdList;
                            params["sEtcGiDocNo"]        = $("#sEtcGiDocNo").val();
                            params["sStatCd"]            = $("#sStatCd").data("kendoExtDropDownList").value();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sStrgeCd"]           = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            params["sGiDtFr"]            = $("#sGiDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sGiDtTo"]            = $("#sGiDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sMvtTpList"]         = sMvtTpList;
                            params["sReturnMvtTp"]       = '36';

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
                       id:"etcGiDocNo"
                      ,fields:{
                            dlrCd          :{ type:"string", editable:false }
                          , etcGiDocNo     :{ type:"string", editable:false } //출고번호
                          , etcGiDocLineNo :{ type:"string", editable:false } //출고라인번호
                          , itemCd         :{ type:"string", editable:false } //부번
                          , itemNm         :{ type:"string", editable:false } //품명
                          , qty            :{ type:"number", editable:false } //출고수량
                          , taxDdctPrc     :{ type:"number", editable:false } //출고단가(세금제외)
                          , prc            :{ type:"number", editable:false } //출고단가
                          , taxDdctAmt     :{ type:"number", editable:false } //출고금액(세금제외)
                          , amt            :{ type:"number", editable:false } //출고금액
                          , bpCd           :{ type:"string", editable:false } //업체
                          , bpNm           :{ type:"string", editable:false } //업체
                          , grDt           :{ type:"date",   editable:false } //출고일자
                          , returnQty      :{ type:"number", editable:false } //반환수량
                          , returnAmt      :{ type:"number", editable:false } //반환금액
                          , stockQty       :{ type:"number", editable:false } //재고수량
                          , avlbStockQty   :{ type:"number", editable:false } //가용수량
                          , resvStockQt    :{ type:"number", editable:false } //예류수량
                          , returnStat     :{ type:"string", editable:false } //반환상태
                          , returnDocNo    :{ type:"string", editable:false } //반환번호
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.grDt = kendo.parseDate(elem.grDt, "<dms:configValue code='dateFormat' />");
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:
                    [
                        { field: "qty", aggregate: "sum" }
                        ,{ field: "taxDdctPrc", aggregate: "sum" }
                        ,{ field: "prc", aggregate: "sum" }
                        ,{ field: "taxDdctAmt", aggregate: "sum" }
                        ,{ field: "amt", aggregate: "sum" }
                        ,{ field: "returnQty", aggregate: "sum" }
                        ,{ field: "returnAmt", aggregate: "sum" }
                        ,{ field: "stockQty", aggregate: "sum" }
                        ,{ field: "avlbStockQty", aggregate: "sum" }
                        ,{ field: "resvStockQty", aggregate: "sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , editable   :false
            , height:403
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , columns:[
                {field:"rnum" ,title:"<spring:message code='par.lbl.no'/>" ,width:50}//번호
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd'/>" ,width:120}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm'/>" ,width:200}//부품명
                ,{field:"qty" ,title:"<spring:message code='par.lbl.giQty' />" ,width:80
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }
                ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.taxDdctPrc' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고단가(세금제외)
                ,{field:"prc" ,title:"<spring:message code='par.lbl.giPrcTax' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고단가(포함)
                ,{field:"taxDdctAmt" ,title:"<spring:message code='par.lbl.taxDdctAmt' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액(세금제외)
                ,{field:"amt" ,title:"<spring:message code='par.lbl.giIncTaxAmt' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.spyrCd' />" ,width:180}//공급업체
                ,{field:"etcGiDocNo" ,title:"<spring:message code='par.lbl.issueEtcRentalNo' />" ,width:120}//출고문서번호
                ,{field:"returnDocNo" ,title:"<spring:message code='par.lbl.rentalReturnNo' />" ,width:120}//반환번호
                ,{field:"grDt" ,title:"<spring:message code='par.lbl.giDt' />"
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,width:100
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (grDt !== null ){# #= kendo.toString(data.grDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//입고일자
                ,{field:"returnQty" ,title:"<spring:message code='par.lbl.returnQty' />" ,width:80
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }
                ,{field:"returnAmt" ,title:"<spring:message code='par.lbl.returnAmt' />" ,width:100
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.stockQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }//재고수량
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }//가용수량
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.purcOrdResvQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }//예류수량
                ,{field:"returnStat" ,title:"<spring:message code='par.lbl.returnStat' />" ,width:80 ,attributes:{ "class":"ac"}}//반환상태
            ]
        });

    initPage();

    });

    //입고상태
    changeStatCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = statCdObj[val];
        }
        return returnVal;
    };




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
            if(id === 'sGiDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sGiDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sGiDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sGiDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sGiDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sGiDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }


     }



  //부품 팝업 열기 함수.
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            , title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            , content:{
                url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                , data:{
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

    function selectVenderMasterPopupWindow(){

        customerSearchPopupWin = dms.window.popup({
            windowId:"customerSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderCstSelect'/>"   // customer select
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectCustomerMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"selectable":"multiple"
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
                        }
                        $("#sBpNm").val(bpNm);
                        $("#sBpCd").val(bpCd);
                        customerSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function initPage(){
        var minDate             = new Date(sevenDtBf),
            maxDate             = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;


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


        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        $("#sGiDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sGiDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        $("#sGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        //$("#sItemCd").val("");                                     //부품명
        //$("#sItemNm").val("");                                     //부품명
        //$("#sPurcOrdNo").val("");                                  //구매오더번호
        //$("#sPurcOrdTp").data("kendoExtDropDownList").value('');      //오더유형
    }

    // 품목구분 그리드 콤보
    function setSumData(val){
        var returnData  = Math.round(val * 1000)/1000,
            returnCalData = Math.round(returnData * 100)/100,
            returnVal = kendo.toString(returnData,'n2');

        return returnVal;
    };



</script>
<!-- //script -->

