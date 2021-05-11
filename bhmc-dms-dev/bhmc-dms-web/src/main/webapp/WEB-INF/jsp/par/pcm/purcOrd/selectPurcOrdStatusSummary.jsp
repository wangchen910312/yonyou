<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">
    <!-- 구매현황조회 -->
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11583" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-12560" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11582" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnPrint" class="btn_m btn_print btn_m_min hidden"><spring:message code="par.btn.print" /></button><!--btnPrint  -->
            </dms:access>
            <dms:access viewId="VIEW-D-11581" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <div class="form_search">
                                <input id="sPurcOrdNo" class="form_input" />
                                <a id="searchPurcOrdNo"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <input id="sPurcOrdTp" data-type="combo" class="form_comboBox" />
                            <input type="text" id="sBpNm" class="form_input form_readonly hidden" readonly>
                            <input type="text" id="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.sendDt" /><!-- 오더전송일자 --></th>
                        <td>
                             <div class="form_float">
                                <div class="date_left">
                                    <input id="sArrvDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sArrvDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordReqDt" /><!-- 구매신청일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sPurcRegDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sPurcRegDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordRegId" /><!-- 오더등록인 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sRegUsrNm" class="form_input" />
                                <a id="searchRegUserId"><!-- 검색 --></a>
                            </div>
                        </td>
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
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="dataForm" class="mt10">
        <!-- 탭메뉴 전체 영역 -->
         <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li id="H" class="k-state-active"><spring:message code="par.title.purcOrdSumList" /><!-- 부품구매집계 --></li>
                <li id="D"><spring:message code="par.title.purcOrdSumListDetail" /><!-- 부품구매명세 --></li>
            </ul>
            <div>
                  <!-- 구매오더헤더정보  -->
                  <div class="table_grid">
                      <div id="grid" class="resizable_grid"></div>
                  </div>
                  <!-- 구매오더헤더정보  -->
              </div>
              <div>
                  <!-- 구매오더디테일정보  -->
                  <div class="table_grid">
                      <div id="gridDetail" class="resizable_grid"></div>
                  </div>
                  <!-- 구매오더디테일정보  -->
              </div>
          </div>
        </div>
    </section>
    <!-- //구매오더 -->
</div>
<!-- script -->
<script>

    var purcOrdTpList   = []
       ,purcOrdTpObj    = {}
       ,purcOrdStatList = []
       ,purcOrdStatObj  = {}
       ,sessionBpCd     = "${bpCd}"
       ,sessionBpNm     = "${bpNm}"
       ,toDt            = "${toDt}"
       ,sevenDtBf       = "${sevenDtBf}"
       ,selectTabId     = "H"
       ,purcUnitList    = []
       ,purcUnitObj     = {}
       ,grStrgeTpList   = []
       ,grStrgeTpObj    = {}
       ,trsfTpList      = []
       ,trsfTpObj       = {}
       ,purcPgssCdObj   = {}
       ,searchItemPopupWindow
       ,userSearchPopupWin
       ,purcOrdListPopupWindow;

    //오더유형 선택
    purcOrdTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
        purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //구매오더상태 선택
    purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":"选择取消"});
    <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
        //if(Number("${obj.cmmCd}") >= 3 ){
            if("${obj.useYn}" !=='N' ){
                purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
            purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        //}
    </c:forEach>

    //구매단위
    <c:forEach var="obj" items="${purcUnit}" varStatus="status">
        purcUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
        purcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
    </c:forEach>

    //입고창고
    grStrgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        grStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    trsfTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${trsfTpList}" varStatus="status">
        trsfTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

  //구매오더진행상태 선택
    purcPgssCdObj[' '] = "";
    <c:forEach var="obj" items="${purcPgssCdList}" varStatus="status">
        purcPgssCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    function fn_linkPurcOrd(pPurcOrdStatCd, pPurcOrd, pBpCd, pBpNm){
        if(pPurcOrdStatCd === "01" || pPurcOrdStatCd ==="05"){ //구매오더상태 : 신규등록,취소 시 구매신청페이지 이동.
            parent._createOrReloadTabMenu('<spring:message code="par.menu.partOrderSave" />'
                    ,"<c:url value='/par/pcm/purcOrd/selectPurcOrdMain.do?pPurcOrdNo="+pPurcOrd+"&pBpCd="+pBpCd+"&pBpNm="+pBpNm+"'/>", "VIEW-D-10177");
        }else{
            parent._createOrReloadTabMenu('<spring:message code="par.menu.partOrderDetail" />'
                    ,"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusList.do?pPurcOrdNo="+pPurcOrd+"&pBpCd="+pBpCd+"&pBpNm="+pBpNm+"'/>", "VIEW-D-10201");
        }
    }

    //gridHeight - if grid has footer
    function gridHeaderHeight(){
        var grid = $("#grid").data("kendoExtGrid");
        var contentHeight = grid.content.height();
        var footerHeight = grid.wrapper.find(".k-grid-footer").height();
        grid.content.height(contentHeight - (footerHeight + 1));
    }

    function gridDetailHeight(){
        var grid = $("#gridDetail").data("kendoExtGrid");
        var contentHeight = grid.content.height();
        var footerHeight = grid.wrapper.find(".k-grid-footer").height();
        grid.content.height(contentHeight - (footerHeight + 1));
    }

    $(document).ready(function() {
        //오더유형선택
        $("#sPurcOrdTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdTpList
            ,index:0
        });

        //구매오더상태선택
        $("#sPurcOrdStatCd").kendoExtMultiSelectDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:purcOrdStatList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,select:function(e){
                var selectPurcOrdStatCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectPurcOrdStatCd)){
                    $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
                }

            }
        });

        //오더일자(구매등록일)
        $("#purcRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //오더일자(구매등록일)
        $("#sPurcRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sPurcRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //오더전송일자
        $("#sArrvDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sArrvDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });


        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchRegUserId").on('click', userSearchPopup);
        $("#searchPurcOrdNo").on('click', selectPurcOrdListPopupWindow);

        //tabstrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select: function(e) {
                selectTabId = e.item.id;
            }
        });

        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        //btnExcelExport
        $("#btnExcelExport").kendoButton({
            click:function(e){

                var beanName;
                var templateFile;
                var fileName;

                if(selectTabId == "H"){
                    beanName = "purcOrdService";
                    templateFile = "PartPurcOrdStatusHeader_Tpl.xlsx";
                    fileName = "PartPurchaseOrderHeader.xlsx";
                } else {
                    beanName = "purcOrdService";
                    templateFile = "PartPurcOrdStatusDetail_Tpl.xlsx";
                    fileName = "PartPurchaseOrderDetail.xlsx";
                }

                var sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();
                var sBpCdList =  $("#sBpCd").val().split('|');

                if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                    sPurcOrdStatCdLst.splice(0,1);
                }

                if(sPurcOrdStatCdLst.length === 0){
                    for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                        sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                    }
                }

                dms.ajax.excelExport({
                    "beanName":beanName
                    ,"templateFile":templateFile
                    ,"fileName":fileName
                    ,"sBpCdList":sBpCdList
                    ,"sPurcOrdNo":$("#sPurcOrdNo").val()
                    ,"sPurcOrdTp":$("#sPurcOrdTp").data("kendoExtDropDownList").value()
                    ,"sItemCd":$("#sItemCd").val()
                    ,"sItemNm":$("#sItemNm").val()
                    ,"sRegUsrNm":$("#sRegUsrNm").val()
                    ,"sPurcRegDtFr":$("#sPurcRegDtFr").val()
                    ,"sPurcRegDtTo":$("#sPurcRegDtTo").val()
                    ,"sArrvDtFr":$("#sArrvDtFr").val()
                    ,"sArrvDtTo":$("#sArrvDtTo").val()
                    ,"sConfirmFr":''
                    ,"sConfirmTo":''
                    ,"sPurcOrdStatLst":sPurcOrdStatCdLst
                    ,"sListType":selectTabId
                });
            }
        });

        //btnPrint
        $("#btnPrint").kendoButton({
            click:function(e){

                var sBpCd,
                sPurcOrdNo,
                sPurcOrdTp,
                sPurcRegDtFr,
                sPurcRegDtTo,
                sPurcOrdStatCd,
                sRegUsrNm,
                sItemCd,
                sItemNm;

                //1.공급상코드
                sBpCd = $("#sBpCd").val();
                //2.구매오더번호
                sPurcOrdNo = $("#sPurcOrdNo").val();
                //3.오더유형
                sPurcOrdTp = $("#sPurcOrdTp").val();
                //4.구매신청일자 시작
                sPurcRegDtFr = $("#sPurcRegDtFr").val();
                //5.구매신청일자 종료
                sPurcRegDtTo = $("#sPurcRegDtTo").val();
                //4.구매전송일자 시작
                sArrvDtFr = $("#sArrvDtFr").val();
                //5.구매전송일자 종료
                sArrvDtTo = $("#sArrvDtTo").val();
                //6.구매오더상태
                sPurcOrdStatCd = $("#sPurcOrdStatCd").val();
                //7.오더신청자
                sRegUsrNm = $("#sRegUsrNm").val();
                //8.부품번호
                sItemCd = $("#sItemCd").val();
                //9.부품명
                sItemNm = $("#sItemNm").val();

                var urlInfo = "<c:url value='/ReportServer?reportlet=par/selectPurcOrdSummaryMain.cpt'/>&sDlrCd=${sDlrCd}&sLangCd=${sLangCd}&sPltCd=${sPltCd}";
                    urlInfo +="&sDateFormat=${sDateFormat}";
                    urlInfo +="&sBpCd="+sBpCd;
                    urlInfo +="&sPurcOrdNo="+sPurcOrdNo;
                    urlInfo +="&sPurcOrdTp="+sPurcOrdTp;
                    urlInfo +="&sPurcRegDtFr="+sPurcRegDtFr;
                    urlInfo +="&sPurcRegDtTo="+sPurcRegDtTo;
                    urlInfo +="&sArrvDtFr="+sArrvDtFr;
                    urlInfo +="&sArrvDtTo="+sArrvDtTo;
                    urlInfo +="&sPurcOrdStatCd="+sPurcOrdStatCd;
                    urlInfo +="&sRegUsrNm="+sRegUsrNm;
                    urlInfo +="&sItemCd="+sItemCd;
                    urlInfo +="&sItemNm="+sItemNm;

                parent._createOrReloadTabMenu("<spring:message code='par.lbl.purcOrdSummaryPrintDoc' />", urlInfo,"VIEW-I-10709", true);
            }
        });
        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
                $("#gridDetail").data("kendoExtGrid").dataSource.read();
            }
        });

        // 구매 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0801-132199"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrds.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value(),
                                sBpCdList =  $("#sBpCd").val().split('|');

                            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                                sPurcOrdStatCdLst.splice(0,1);
                            }

                            if(sPurcOrdStatCdLst.length === 0){
                                for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                                    sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                                }
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 구매오더 검색조건 코드.
                            params["sBpCdList"]          = sBpCdList;
                            params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                            params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sRegUsrNm"]          = $("#sRegUsrNm").val();
                            params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sArrvDtFr"]          = $("#sArrvDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sArrvDtTo"]          = $("#sArrvDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcOrdStatLst"]    = sPurcOrdStatCdLst;

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
                        id:"purcOrdNo"
                       ,fields:{
                              dlrCd         :{ type:"string", editable:false }
                            , bmpOrdNo      :{ type:"string", editable:false }
                            , bpCd          :{ type:"string", editable:false }
                            , bpNm          :{ type:"string", editable:false }
                            , purcOrdNo     :{ type:"string", editable:false }
                            , mobisInvcNo   :{ type:"string", editable:false } //송장번호
                            , purcOrdTp     :{ type:"string", editable:false }
                            , trsfTp        :{ type:"string", editable:false }
                            , purcOrdStatCd :{ type:"string", editable:false }
                            , regUsrId      :{ type:"string", editable:false }
                            , regUsrNm      :{ type:"string", editable:false }
                            , remark        :{ type:"string", editable:false }
                            , purcRegDt     :{ type:"date",   editable:false }
                            , arrvDate      :{ type:"date",   editable:false }
                            , confirmDt     :{ type:"date",   editable:false }
                            , itemCnt       :{ type:"number", editable:false }
                            , totPurcQty    :{ type:"number", editable:false }
                            , totPurcAmt    :{ type:"number", editable:false }
                            , totTaxDdctAmt :{ type:"number", editable:false }
                         }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.purcRegDt = kendo.parseDate(elem.purcRegDt, "<dms:configValue code='dateFormat' />");
                                elem.arrvDate = kendo.parseDate(elem.arrvDate, "<dms:configValue code='dateFormat' />");
                                elem.purcOrdTp = changePurcOrdTp(elem.purcOrdTp);
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:[
                    { field:"itemCnt", aggregate:"sum" }
                    ,{ field:"totPurcQty", aggregate:"sum" }
                    ,{ field:"totPurcAmt", aggregate:"sum" }
                    ,{ field:"totTaxDdctAmt", aggregate:"sum" }
                ]
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,pageable:{
                refresh:false
               ,pageSizes:[50, 100, 300, 500]
               ,buttonCount:1
               ,input:false
             }
            , columns:[
                {field:"purcOrdNo" ,title:"<spring:message code='par.lbl.purcOrdNo' />" ,width:120
                     ,template:function(dataItem){
                          var spanObj = "";

                              spanObj = "<a class='k-link' onclick=\"fn_linkPurcOrd('" + dataItem.purcOrdStatCd + "','" + dataItem.purcOrdNo + "','" + dataItem.bpCd + "','" + dataItem.bpNm + "'); \">"+dataItem.purcOrdNo+"</a>";

                          return spanObj;
                     }
                }   //구매오더번호
                ,{field:"bmpOrdNo" ,title:"<spring:message code='par.lbl.bmpOrdNo' />" ,attributes:{ "class":"al"} ,width:120} //bmp오더번호
                ,{field:"purcOrdTp" ,title:"<spring:message code='par.lbl.purcOrdTp' />" ,attributes:{ "class":"al"} ,width:180} //오더유형
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.supplyNo' />" ,width:180 }  //공급업체
                ,{field:"regUsrNm" ,title:"<spring:message code='par.lbl.ordRegId' />" ,width:140}   //오더신청자
                ,{field:"purcOrdStatCd" ,title:"<spring:message code='par.lbl.purcOrdStatCd' />" ,attributes:{ "class":"ac"} ,width:100
                    ,template:function(dataItem){

                        var spanObj = "";

                        switch(dataItem.purcOrdStatCd)
                        {
                            case "02":// 전송
                                spanObj = "<span class='txt_label bg_blue'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                break;
                            case "03":// 확정
                                spanObj = "<span class='txt_label bg_orange'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                break;
                            case "04":// 완료
                                spanObj = "<span class='txt_label bg_purple'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                break;
                            case "05":// 취소
                                spanObj = "<span class='txt_label bg_red'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                break;
                            default: // 등록
                                spanObj = "<span class='txt_label bg_gray'>"+purcOrdStatObj[dataItem.purcOrdStatCd]+"</span>";
                                break;
                         }
                         return spanObj;
                     }
                 }//구매오더상태
                ,{field:"totPurcQty" ,title:"<spring:message code='par.lbl.purcQty' />" ,width:100
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//수량
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.purcItemCnt' />" ,width:100
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//건수
                ,{field:"totTaxDdctAmt" ,title:"<spring:message code='par.lbl.purcAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//구매총금액
                ,{field:"totPurcAmt" ,title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,width:120
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//구매총금액
                ,{field:"purcRegDt" ,title:"<spring:message code='par.lbl.ordReqDt' />",width:100
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (purcRegDt !== null ){# #= kendo.toString(data.purcRegDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//구매신청일
                ,{field:"arrvDate" ,title:"<spring:message code='par.lbl.sendDt' />",width:100
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (arrvDate !== null ){# #= kendo.toString(data.arrvDate, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//구매신청일
                ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.invcDocNo' />" ,width:150, hidden:true}//송장번호
           ]
        });
        //grid height reset.
        gridHeaderHeight();

        // 구매 명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0801-132282"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusByConditionForPurcOrdSummary.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value(),
                                sBpCdList =  $("#sBpCd").val().split('|');

                            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                                sPurcOrdStatCdLst.splice(0,1);
                            }

                            if(sPurcOrdStatCdLst.length === 0){
                                for(var i = 0; i < purcOrdStatList.length; i = i + 1){
                                    sPurcOrdStatCdLst.push(purcOrdStatList[i].cmmCd);
                                }
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 구매오더 검색조건 코드.
                            params["sBpCdList"]          = sBpCdList;
                            params["sPurcOrdNo"]         = $("#sPurcOrdNo").val();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sRegUsrNm"]          = $("#sRegUsrNm").val();
                            params["sPurcOrdTp"]         = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                            params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sArrvDtFr"]          = $("#sArrvDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sArrvDtTo"]          = $("#sArrvDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcOrdStatLst"]    = sPurcOrdStatCdLst;
                            params["sDelYn"]             = 'Y'; //삭제된 구매오더 제외.

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
                       id:"purcOrdNo"
                      ,fields:{
                            dlrCd          :{ type:"string", editable:false }
                          , purcOrdNo      :{ type:"string", editable:false } //오더번호
                          , bmpOrdNo       :{ type:"string", editable:false } //bmp오더번호
                          , purcOrdLineNo  :{ type:"string", editable:false } //구매오더라인번호
                          , itemCd         :{ type:"string", editable:false } //부번
                          , confirmParNo   :{ type:"string", editable:false } //부번
                          , itemNm         :{ type:"string", editable:false } //품명
                          , confirmParNm   :{ type:"string", editable:false } //품명
                          , purcRegDt      :{ type:"date",   editable:false } //오더일자(구매일자)
                          , purcOrdTp      :{ type:"string", editable:false } //오더유형
                          , bpCd           :{ type:"string", editable:false } //업체
                          , bpNm           :{ type:"string", editable:false } //업체
                          , purcItemStatCd :{ type:"string", editable:false } //상태
                          , purcUnitCd     :{ type:"string", editable:false } //단위
                          , purcQty        :{ type:"number", editable:false } //오더수량(구매수량)
                          , bmpChkQty      :{ type:"number", editable:false } //확정수량
                          , boQty          :{ type:"number", editable:false } //B/O수량
                          , odrAlcQt       :{ type:"number", editable:false } //할당수량
                          , odrOpicQt      :{ type:"number", editable:false } //픽킹중수량
                          , odrOpacQt      :{ type:"number", editable:false } //팩킹중수량
                          , odrPakdQt      :{ type:"number", editable:false } //팩킹완료수량
                          , odrInvQt       :{ type:"number", editable:false } //인보이스수량
                          , grQty          :{ type:"number", editable:false } //기입고수량(입고수량)
                          , cancQty        :{ type:"number", editable:false } //취소수량
                          , grStrgeCd      :{ type:"string", editable:false } //창고
                          , purcPrc        :{ type:"number", editable:false } //단가
                          , taxDdctPrc     :{ type:"number", editable:false } //단가
                          , purcAmt        :{ type:"number", editable:false } //금액
                          , taxDdctAmt     :{ type:"number", editable:false } //금액
                          , regUsrId       :{ type:"string", editable:false } //등록인
                          , purcReqRegUsrId:{ type:"string", editable:false } //신청인(구매요청자)
                          , avlbStockQty   :{ type:"number", editable:false }
                          , borrowQty      :{ type:"number", editable:false }
                          , rentQty        :{ type:"number", editable:false }
                          , stockQty       :{ type:"number", editable:false }
                          , resvStockQty   :{ type:"number", editable:false }
                          , purcPgssCd     :{ type:"string", editable:false }
                          , confirmQty     :{ type:"string", editable:false }
                          , calcConfirmQty :{ type:"number", editable:false }
                          , calcPurcAmt    :{ type:"number", editable:false }
                          , calcTaxDdctAmt :{ type:"number", editable:false }
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.purcRegDt = kendo.parseDate(elem.purcRegDt, "<dms:configValue code='dateFormat' />");
                                elem.purcOrdTp = changePurcOrdTp(elem.purcOrdTp);
                                elem.purcPgssCd = changePurcPgssCd(elem.purcPgssCd);
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:[
                     { field:"calcConfirmQty", aggregate:"sum" }
                    ,{ field:"purcPrc", aggregate:"sum" }
                    ,{ field:"calcPurcAmt", aggregate:"sum" }
                    ,{ field:"taxDdctPrc", aggregate:"sum" }
                    ,{ field:"calcTaxDdctAmt", aggregate:"sum" }
                ]
            }
            ,selectable:"row"
            ,scrollable :true
            ,autoBind:false
            ,appendEmptyColumn:true//empty column. default:false
            ,pageable:{
                refresh:false
               ,pageSizes:[50, 100, 300, 500]
               ,buttonCount:1
               ,input:false
             }
            ,columns:[
                 {field:"purcOrdNo" ,title:"<spring:message code='par.lbl.purcOrdNo' />" ,width:120}//구매오더번호
                 ,{field:"bmpOrdNo" ,title:"<spring:message code='par.lbl.bmpOrdNo' />" ,width:120}//bmp오더번호
                 ,{field:"purcOrdTp" ,title:"<spring:message code='par.lbl.purcOrdTp' />" ,attributes:{"class":"al"} ,width:150}//오더유형
                 ,{field:"bpNm" ,title:"<spring:message code='par.lbl.spyrCd' />" ,width:180}//공급업체
                 ,{field:"itemCd", title:"<spring:message code='par.lbl.itemCd'/>" ,width:140}//부품번호
                 ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm'/>" ,width:200}//부품명
                 ,{field:"calcConfirmQty" ,title:"<spring:message code='par.lbl.purcQty' />" ,width:100
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                 }  //purcQty -> confirmQty 로 바뀜. 2017-07-05
                 ,{field:"taxDdctPrc", title:"<spring:message code='par.lbl.purcPriceTax' />" ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                 }//단가
                 ,{field:"purcPrc", title:"<spring:message code='par.lbl.purcBasePrc' />" ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                 }//단가
                 ,{field:"calcTaxDdctAmt", title:"<spring:message code='par.lbl.purcAmt' />" ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                 }//금액
                 ,{field:"calcPurcAmt", title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,width:120
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                 }//금액
                 ,{field:"purcRegDt" ,title:"<spring:message code='par.lbl.ordReqDt' />",width:100
                     ,attributes:{"class":"ac tooltip-disabled"}
                     ,template:"#if (purcRegDt !== null ){# #= kendo.toString(data.purcRegDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                 }//구매신청일
                 ,{title:"<spring:message code='par.lbl.strgeStockQty' />" ,field:"stockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//재고수량
                 ,{title:"<spring:message code='par.lbl.avlbStockQty' />" ,field:"avlbStockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//가용수량
                 ,{title:"<spring:message code='par.lbl.purcOrdResvQty' />" ,field:"resvStockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//예약수량
                 ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//대여수량
                 ,{title:"<spring:message code='par.lbl.borrowQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//차입수량
                 ,{field:"purcPgssCd" ,title:"<spring:message code='par.lbl.purcItemStatCd' />" ,attributes :{"class":"ar"} ,width:70}//상태
            ]
        });

        //grid height reset.
        gridDetailHeight();

    initPage();

    });

    //오더유형
    changePurcOrdTp = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = purcOrdTpObj[val];
        }
        return returnVal;
    };

    // 구매상태
    changePurcOrdStat = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = purcOrdStatObj[val];
        }
        return returnVal;
    };

    // 운송유형
    changeTrsfTp = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = trsfTpObj[val];
        }
        return returnVal;
    };

 // 구매상태
    changePurcPgssCd = function(val){
        var returnVal = "";
        if(!dms.string.isEmpty(val)){
            if(!dms.string.isEmpty(purcPgssCdObj[val])){
                returnVal = purcPgssCdObj[val];
            }
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
            if(id === 'sPurcRegDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value('');
                $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sPurcRegDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value('');
                $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sArrvDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sArrvDtFr").data("kendoExtMaskedDatePicker").value('');
                $("#sArrvDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sArrvDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sArrvDtTo").data("kendoExtMaskedDatePicker").value('');
                $("#sArrvDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sPurcRegDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sPurcRegDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sArrvDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sArrvDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sArrvDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sArrvDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
    }


    //부품 팝업 열기 함수.
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            ,title:"<spring:message code='par.title.partSearch' />"   // 부품 조회
            ,content:{
                url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                ,data:{
                    "type":""
                    ,"autoBind":false
                    ,"callbackFunc":function(data){
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
                    ,"bpCd":''
                    ,"bpNm":''
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
                        }
                        $("#sBpNm").val(bpNm);
                        $("#sBpCd").val(bpCd);

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
                            $("#sRegUsrNm").val(data[0].usrNm);
                        }
                    }
                }
            }
        });
    }
    // 구매리스트 팝업 열기 함수.
    function selectPurcOrdListPopupWindow(){

        if(dms.string.isEmpty($("#sBpCd").val())){
            // 딜러를 선택하십시오
            dms.notification.warning("<spring:message code='par.lbl.bpCd' var='bpCd' /><spring:message code='global.info.confirmMsgParam' arguments='${bpCd}'/>");
            saveList = [];
            return false;
        }

        purcOrdListPopupWindow = dms.window.popup({
            windowId:"purcOrdListPopup"
            ,title:"<spring:message code='par.title.purcOrdInfo' />"   // 구매오더정보
            ,content:{
                url:"<c:url value='/par/cmm/selectPurcOrdListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":$("#sBpCd").val()
                    ,"bpNm":$("#sBpNm").val()
                    ,"selectable":"single"
                    ,"callbackFunc":function(data){
                        if(data.length === 1){
                            $("#sPurcOrdNo").val(data[0].purcOrdNo);
                        }
                        purcOrdListPopupWindow.close();
                    }
                }
            }
        });
    }

    function initPage(){
        var minDate = new Date(sevenDtBf),
            maxDate = new Date(toDt),
            pPurcOrdNo = "${pPurcOrdNo}",
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#grid").data("kendoExtGrid").dataSource.data([]);
        $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

        $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
        $("#sBpNm").val(sessionBpNm);  //공급업체 기본셋팅

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        //$("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        //$("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        //$("#sArrvDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        //$("#sArrvDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        //$("#sArrvDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        //$("#sArrvDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
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

