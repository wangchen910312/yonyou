<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">
    <!-- 입고현황조회 -->
    <section class="group">
        <div class="header_area">
            <!-- <h1 class="title_basic"></h1> -->
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11666" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-12562" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
            </dms:access>
			<dms:access viewId="VIEW-D-11665" hasPermission="${dms:getPermissionMask('READ')}">
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
                        <th scope="row"><spring:message code="par.lbl.supplyTp" /><!-- 공급업체유형 --></th>
                        <td>
                            <input id="sBpTp" class="form_comboBox" data-type="combo" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcGrDocNo" /><!-- 입고문서번호 --></th>
                        <td>
                            <input id="sInvcDocNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grDt" /><!-- 입고일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sInvcGrDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sInvcGrDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부번(부품번호) --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sItemCd" class="form_input">
                                <a href="javascript:;" id="searchItemCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row" class="hidden"><spring:message code="par.lbl.grTp" /><!-- 입고유형 --></th>
                        <td class="hidden">
                            <input id="sInvcTp" class="form_comboBox" data-type="combo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.sBpNm" /><!-- 업체명칭 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grStrgeCd" /><!-- 입고창고 --></th>
                        <td>
                            <input id="sGrStrgeCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 품목명 --></th>
                        <td>
                            <input type="text" id="sItemNm" class="form_input" value="${itemNm}">
                            <input id="sGrLocCd" class="form_comboBox hidden" />
                        </td>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="dataForm" class="mt10">
        <!-- 탭메뉴 전체 영역 -->
         <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li id="H" class="k-state-active"><spring:message code="par.title.grSumList" /><!-- 부품구매집계 --></li>
                <li id="D" ><spring:message code="par.title.grSumListDetail" /><!-- 부품구매명세 --></li>
            </ul>
            <div>
                  <!-- 입고헤더정보  -->
                  <div class="table_grid">
                      <div id="grid" class="resizable_grid"></div>
                  </div>
                  <!-- 입고헤더정보  -->
              </div>
              <div>
                  <!-- 입고디테일정보  -->
                  <div class="table_grid">
                      <div id="gridDetail" class="resizable_grid"></div>
                  </div>
                  <!-- 입고디테일정보  -->
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
       ,selectTabId     = "H"
       ,grStrgeTpList   = []
       ,grStrgeTpObj    = {}
       ,invcTpList      = []
       ,bpTpList        = []
       ,bpTpObj         = {}
       ,invcTpObj       = {}
       ,giLocCdObj      = []
       ,invcStatObj     = {}
       ,searchItemPopupWindow;

    //입고창고
    grStrgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>
    //giLocCdList
    <c:forEach var="obj" items="${giTwoLocCdList}">
    if(giLocCdObj.hasOwnProperty("${obj.strgeCd}")){
        giLocCdObj["${obj.strgeCd}"].push({locCd:"${obj.locCd}", locNm:"${obj.locNm}"});
    }else{
        giLocCdObj["${obj.strgeCd}"] = [];
        giLocCdObj["${obj.strgeCd}"].push({locCd:"${obj.locCd}", locNm:"${obj.locNm}"});
    }
    </c:forEach>

    invcTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${invcTpList}" varStatus="status">
        invcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        invcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    invcStatObj[' '] = "";
    <c:forEach var="obj" items="${invcStatList}" varStatus="status">
        invcStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
        invcStatObj["04"] = "取消";

    bpTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${bpTpList}" varStatus="status">
        if("01" === "${obj.remark2}"){
            bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            bpTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        }
    </c:forEach>

    $(document).ready(function() {
        //송장유형선택
        $("#sInvcTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcTpList
            ,index:0
        });

        //거래처유형선택
        $("#sBpTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bpTpList
            ,change: function() {
                var value = this.value();
                $("#sBpNm").val('');  //공급업체 기본셋팅
            }
        });

        // 입고창고 선택
        $("#sGrStrgeCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:grStrgeTpList
            ,index:0
            ,optionLabel:"<spring:message code='global.lbl.check' />"  // 선택
        });
        //sGrStrgeCd onchange event
        $("#sGrStrgeCd").on("change", function (){
            $("#sGrLocCd").data("kendoExtDropDownList").setDataSource(giLocCdObj[$(this).data("kendoExtDropDownList").value()]);
        });
        //sGrLocCd
        $("#sGrLocCd").kendoExtDropDownList({
            dataTextField:"locCd"
            ,dataValueField:"locCd"
            ,autoBind:false
            ,optionLabel:" "
            ,index:0
        });

        //송장입고일자
        $("#sInvcGrDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //송장입고일자
        $("#sInvcGrDtTo").kendoExtMaskedDatePicker({
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

                var beanName
                    ,templateFile
                    ,fileName
                    ,bpTp;

                if(dms.string.isEmpty($("#sBpTp").data("kendoExtDropDownList").value())) {
                    bpTp = "";
                } else {
                    bpTp = $("#sBpTp").data("kendoExtDropDownList").value();
                }

                if(selectTabId == "H"){
                    beanName = "invcService"
                    templateFile = "PartReceiveConfirmHeader_Tpl.xlsx";
                    fileName = "PartReceiveConfirmHeader.xlsx";
                } else {
                    beanName = "invcService"
                    templateFile = "PartReceiveConfirmDetail_Tpl.xlsx";
                    fileName = "PartReceiveConfirmDetail.xlsx";
                }

                dms.ajax.excelExport({
                    "beanName":beanName
                    ,"templateFile":templateFile
                    ,"fileName":fileName
                    ,"sInvcDocNo":$("#sInvcDocNo").val()
                    ,"sInvcTp":$("#sInvcTp").data("kendoExtDropDownList").value()
                    ,"sBpTp":bpTp
                    ,"sBpNm":$("#sBpNm").val()
                    ,"sItemCd":$("#sItemCd").val()
                    ,"sItemNm":$("#sItemNm").val()
                    ,"sGrStrgeCd":$("#sGrStrgeCd").data("kendoExtDropDownList").value()
                    ,"sGrLocCd":$("#sGrLocCd").val()
                    ,"sInvcGrDtFr":$("#sInvcGrDtFr").val()
                    ,"sInvcGrDtTo":$("#sInvcGrDtTo").val()
                    ,"sListType":selectTabId
                });
            }
        });

        // 구매 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0805-112801"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/receive/selectReceivesByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;
                            // 구매오더 검색조건 코드.
                            params["sInvcDocNo"]        = $("#sInvcDocNo").val();
                            params["sInvcTp"]           = $("#sInvcTp").data("kendoExtDropDownList").value();
                            params["sBpTp"]             = $("#sBpTp").data("kendoExtDropDownList").value();
                            params["sBpNm"]             = $("#sBpNm").val();
                            params["sItemCd"]           = $("#sItemCd").val();
                            params["sItemNm"]           = $("#sItemNm").val();
                            params["sGrStrgeCd"]        = $("#sGrStrgeCd").data("kendoExtDropDownList").value();
                            params["sGrLocCd"]          = $("#sGrLocCd").val();
                            params["sInvcGrDtFr"]       = $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sInvcGrDtTo"]       = $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value();

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
                        id:"mobisInvcNo"
                       ,fields:{
                              dlrCd         :{ type:"string", editable:false }
                            , invcTp        :{ type:"string", editable:false }
                            , invcDocNo     :{ type:"string", editable:false } //입고번호
                            , mobisInvcNo   :{ type:"string", editable:false } //송장번호
                            , invcStatCd    :{ type:"string", editable:false } //송장상태
                            , invcGrDt      :{ type:"date",   editable:false }
                            , itemQty       :{ type:"number", editable:false }
                            , itemCnt       :{ type:"number", editable:false }
                            , bpCd          :{ type:"string", editable:false }
                            , bpNm          :{ type:"string", editable:false }
                            , bpTp          :{ type:"string", editable:false }
                            , regUsrId      :{ type:"string", editable:false }
                            , regUsrNm      :{ type:"string", editable:false }
                            , dcRate        :{ type:"number", editable:false }
                            , vatAmt        :{ type:"number", editable:false }
                            , grTotAmt      :{ type:"number", editable:false }
                            , grTotIncTaxAmt:{ type:"number", editable:false }
                         }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.invcGrDt = kendo.parseDate(elem.invcGrDt, "<dms:configValue code='dateFormat' />");
                                elem.invcStatCd = changeInvcStatCd(elem.invcStatCd);
                                elem.bpTp = changeBpTp(elem.bpTp);
                                elem.invcTp = changeInvcTp(elem.invcTp);
                            });
                        }
                        return d;
                    }
                }
                ,aggregate:
                    [
                        { field: "itemQty", aggregate: "sum" }
                        ,{ field: "itemCnt", aggregate: "sum" }
                        ,{ field: "vatAmt", aggregate: "sum" }
                        ,{ field: "grTotAmt", aggregate: "sum" }
                        ,{ field: "grTotIncTaxAmt", aggregate: "sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , height:403
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , columns:[
                {field:"bpTp" ,title:"<spring:message code='par.lbl.supplyTp' />" ,attributes:{ "class":"ac"} ,width:140}//공급처유형
                ,{field:"invcStatCd" ,title:"<spring:message code='par.lbl.grDocStat' />" ,attributes:{ "class":"ac"} ,width:80}//입고상태
                ,{field:"invcTp" ,title:"<spring:message code='par.lbl.grGubun' />" ,attributes:{ "class":"ac"} ,width:140, hidden:true}//입고방식
                ,{field:"invcDocNo" ,title:"<spring:message code='par.lbl.purcGrDocNo' />" ,width:140}//입고문서번호
                ,{field:"invcGrDt" ,title:"<spring:message code='par.lbl.grDt' />"
                    ,width:90
                    ,template:"#if (invcGrDt !== null ){# #= kendo.toString(data.invcGrDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//입고일
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//수량
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.invcGrCnt' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }//건수
                ,{field:"grTotIncTaxAmt" ,title:"<spring:message code='par.lbl.grAmtAddTax' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액(세금포함)
                ,{field:"grTotAmt" ,title:"<spring:message code='par.lbl.grAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액(세금불포함)
                ,{field:"vatAmt" ,title:"<spring:message code='par.lbl.taxAmt' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//세액
                ,{field:"dcRate" ,title:"<spring:message code='par.lbl.taxRate' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}"}//세율
                ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.mobisInvcDocNo' />" ,width:180}//BMP송장번호
                ,{field:"regUsrId" ,title:"<spring:message code='par.lbl.ordRegNm' />" ,width:120,hidden:true}//오더인
                ,{field:"regUsrNm" ,title:"<spring:message code='par.lbl.ordRegNm' />" ,width:120}//오더인
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.sBpNm' />" ,width:140 }//업체

           ]
        });

        // 구매 명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0805-112802"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/receive/selectReceiveCnfmListByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;
                            // 구매오더 검색조건 코드.
                            params["sInvcDocNo"]        = $("#sInvcDocNo").val();
                            params["sInvcTp"]           = $("#sInvcTp").data("kendoExtDropDownList").value();
                            params["sBpTp"]             = $("#sBpTp").data("kendoExtDropDownList").value();
                            params["sBpNm"]             = $("#sBpNm").val();
                            params["sItemCd"]           = $("#sItemCd").val();
                            params["sItemNm"]           = $("#sItemNm").val();
                            params["sGrStrgeCd"]        = $("#sGrStrgeCd").data("kendoExtDropDownList").value();
                            params["sGrLocCd"]          = $("#sGrLocCd").val();
                            params["sInvcGrDtFr"]       = $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sInvcGrDtTo"]       = $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    total:"total"
                    ,model:{
                       id:"mobisInvcNo"
                      ,fields:{
                            dlrCd          :{ type:"string", editable:false }
                          , purcOrdNo      :{ type:"string", editable:false } //오더번호
                          , purcOrdLineNo  :{ type:"string", editable:false } //구매오더라인번호
                          , mobisInvcNo    :{ type:"string", editable:false } //송장번호
                          , mobisInvcLineNo:{ type:"string", editable:false } //송장라인번호
                          , invcDocNo      :{ type:"string", editable:false } //입고번호
                          , invcDocLineNo  :{ type:"string", editable:false } //입고라인번호
                          , itemCd         :{ type:"string", editable:false } //부번
                          , itemNm         :{ type:"string", editable:false } //품명
                          , invcUnitCd     :{ type:"string", editable:false } //단위
                          , grQty          :{ type:"number", editable:false } //입고수량
                          , taxDdctPrc     :{ type:"number", editable:false } //입고단가(세금제외)
                          , invcPrc        :{ type:"number", editable:false } //입고단가
                          , grTotAmt       :{ type:"number", editable:false } //입고금액(세금제외)
                          , grTaxDdctAmt   :{ type:"number", editable:false } //입고금액
                          , bpCd           :{ type:"string", editable:false } //업체
                          , bpNm           :{ type:"string", editable:false } //업체
                          , invcGrDt       :{ type:"date",   editable:false } //입고일자
                          , arrvDt         :{ type:"date",   editable:false } //도착예정일자
                          , stockQty       :{ type:"number", editable:false } //재고수량
                          , avlbStockQty   :{ type:"number", editable:false } //가용수량
                          , resvStockQt    :{ type:"number", editable:false } //예류수량
                          , borrowQty      :{ type:"number", editable:false }
                          , rentQty        :{ type:"number", editable:false }
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.invcGrDt = kendo.parseDate(elem.invcGrDt, "<dms:configValue code='dateFormat' />");
                            });
                        }
                        return d;
                    }
                }
                ,aggregate:
                    [
                        { field: "grQty", aggregate: "sum" }
                        ,{ field: "taxDdctPrc", aggregate: "sum" }
                        ,{ field: "invcPrc", aggregate: "sum" }
                        ,{ field: "grTaxDdctAmt", aggregate: "sum" }
                        ,{ field: "grTotAmt", aggregate: "sum" }
                        ,{ field: "stockQty", aggregate: "sum" }
                        ,{ field: "avlbStockQty", aggregate: "sum" }
                        ,{ field: "resvStockQty", aggregate: "sum" }
                        ,{ field: "rentQty", aggregate: "sum" }
                        ,{ field: "borrowQty", aggregate: "sum" }
                    ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , height:403
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , columns:[
                {field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd'/>" ,width:120}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm'/>" ,width:200}//부품명
                ,{field:"invcUnitCd" ,title:"<spring:message code='par.lbl.unitNm'/>" ,width:60}//부품명
                ,{field:"grQty" ,title:"<spring:message code='par.lbl.grQty' />" ,width:80
                    ,attributes :{"class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }
                ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.grPrc' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고단가(세금제외)
                ,{field:"invcPrc" ,title:"<spring:message code='par.lbl.grPrcTax' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고단가(포함)
                ,{field:"grTaxDdctAmt" ,title:"<spring:message code='par.lbl.grAmt' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액(세금제외)
                ,{field:"grTotAmt" ,title:"<spring:message code='par.lbl.grAmtAddTax' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//입고금액
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.spyrCd' />" ,width:140}//공급업체
                ,{field:"invcDocNo" ,title:"<spring:message code='par.lbl.purcGrDocNo' />" ,width:140}//입고문서번호
                ,{field:"invcGrDt" ,title:"<spring:message code='par.lbl.grDt' />"
                    ,width:90
                    ,template:"#if (invcGrDt !== null ){# #= kendo.toString(data.invcGrDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//입고일

                ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.mobisInvcDocNo' />" ,width:180}//송장번호
                ,{field:"purcOrdNo" ,title:"<spring:message code='par.lbl.orderNo' />" ,width:100}//구매오더번호
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.stockInOutQty' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//재고수량
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//가용수량
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.resvQty' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//예류수량
                ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                 }//대여수량
                ,{title:"<spring:message code='par.lbl.borrowQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                 }//차입수량
            ]
        });

    initPage();

    });

    //입고상태
    changeInvcStatCd = function(val){
        var returnVal = "";
        if(!dms.string.isEmpty(val)){
            if(!dms.string.isEmpty(invcStatObj[val])){
                returnVal = invcStatObj[val];
            }
        }
        return returnVal;
    };

    //입고유형
    changeInvcTp = function(val){
        var returnVal = "";
        if(!dms.string.isEmpty(val)){
            if(!dms.string.isEmpty(invcTpObj[val])){
                returnVal = invcTpObj[val];
            }
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
                    ,"bpCd":""
                    ,"bpNm":$("#sBpNm").val()
                    ,"bpTp":$("#sBpTp").data("kendoExtDropDownList").value()
                    ,"selectable":"single"
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
                        $("#sBpTp").data("kendoExtDropDownList").value(data[0].bpTp);

                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function initPage(){
        var pPurcOrdNo = "${pPurcOrdNo}";

        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#sBpNm").val("");
        $("#sBpTp").data("kendoExtDropDownList").value("01");

        $("#sGrStrgeCd").data("kendoExtDropDownList").select(0);
        $("#sGrLocCd").data("kendoExtDropDownList").setDataSource([]);
        $("#sInvcDocNo").val("");

        $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value("");
        $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value("");

        $("#sItemCd").val("");
        $("#sItemNm").val("");

        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

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
            if(id === 'sInvcGrDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvcGrDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sInvcGrDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sInvcGrDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
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

