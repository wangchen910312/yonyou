<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- 창고간이동현황 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11876" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset btn_m_min" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11875" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11874" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnSearch" name="btnSearch" class="btn_m btn_search btn_m_min"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                        <th scope="row"><spring:message code="par.lbl.grDt" /><!-- 입고일자 --></th>
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
                        <th scope="row"><spring:message code="par.lbl.strgeMoveDocNo" /><!-- 기타입고문서번호 --></th>
                        <td>
                            <input id="sEtcGiDocNo" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.grStrgeCd" /><!-- 입고창고 --></th>
                        <td>
                            <input id="sGrStrgeCd" class="form_comboBox" data-type="combo">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giStrgeCd" /><!-- 출고창고 --></th>
                        <td>
                            <input id="sGiStrgeCd" class="form_comboBox" data-type="combo">
                        </td>
                        <th/>
                        <td colspan="3"/>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="dataForm" >
        <!-- 탭메뉴 전체 영역 -->
         <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="par.title.strgeMovePartsList" /><!-- 부품이동현황 --></li>
                <li><spring:message code="par.title.strgeMovePartsListDetail" /><!-- 부품이동명세 --></li>
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

    var sessionBpCd = "${bpCd}"
       ,sessionBpNm = "${bpNm}"
       ,toDt = "${toDt}"
       ,sevenDtBf = "${sevenDtBf}"
       ,strgeTpList = []
       ,strgeTpObj = {}
       ,statCdObj = {}
       ,locCdObj = {}
       ,searchItemPopupWindow;

    //입고창고
    strgeTpObj[' '] = "";
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>
    //giLocCdList
    <c:forEach var="obj" items="${giTwoLocCdList}">
    if(locCdObj.hasOwnProperty("${obj.strgeCd}")){
        locCdObj["${obj.strgeCd}"].push({locCd:"${obj.locCd}", locNm:"${obj.locNm}"});
    }else{
        locCdObj["${obj.strgeCd}"] = [];
    }
    </c:forEach>

    <c:forEach var="obj" items="${statCdList}" varStatus="status">
        statCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    statCdObj["03"] = "取消";

    //get tab info and type and grid info
    function getSelectedGridObj(){
        var tabStrip = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");
        var tabIndex = tabStrip.select().index();

        var gridObj = {
            "tabIndex":tabIndex
        };

        return gridObj;
    }

    $(document).ready(function() {
        //입고창고 선택
        $("#sGrStrgeCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:strgeTpList
            ,index:0
            ,optionLabel:" "
        });

        //출고창고 선택
        $("#sGiStrgeCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:strgeTpList
            ,index:0
            ,optionLabel:" "
        });

        //입고일자
        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //입고일자
        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //부품조회 팝업.
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
                $("#grid").data("kendoExtGrid").dataSource.read();
                $("#gridDetail").data("kendoExtGrid").dataSource.read();
            }
        });
        //btnExcelExport
        $("#btnExcelExport").kendoButton({
            enable:true
            ,click:function(e){
                var gridObj = getSelectedGridObj(),
                tabIndex = gridObj.tabIndex,
                stockMovStorageHeaderFlag = false,
                beanName = "stockMovStorageHeaderService",
                templateFile = "StockMovStroageStatusHeaderTarget_Tpl.xlsx",
                fileName = "StockMovStroageStatusHeaderDownload_Tpl.xlsx";

                if(tabIndex == 1 ){
                    beanName = "stockMovStorageHeaderService";
                    stockMovStorageHeaderFlag = true;
                    templateFile = "StockMovStroageStatusDetailTarget_Tpl.xlsx";
                    fileName = "StockMovStroageStatusDetailDownload_Tpl.xlsx";
                }

                //excel export all
                dms.ajax.excelExport({
                    "beanName":beanName
                    ,"templateFile":templateFile
                    ,"fileName":fileName
                    ,"sItemCd":$("#sItemCd").val()
                    ,"sItemNm":$("#sItemNm").val()
                    ,"sRegDtFr":$("#sRegDtFr").val()
                    ,"sRegDtTo":$("#sRegDtTo").val()
                    ,"sEtcGiDocNo":$("#sEtcGiDocNo").val()
                    ,"sGrStrgeCd":$("#sGrStrgeCd").val()
                    ,"sGiStrgeCd":$("#sGiStrgeCd").val()
                    ,"sMvtTp":"21"//수불유형:재고이동
                    ,"sStockMovStorageHeaderFlag":stockMovStorageHeaderFlag
                });
            }
        });
        //부품이동집계 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-1219-111601"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stockMovement/selectStockMovStorageListSummaryByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;
                            //기타입고 검색조건 코드.
                            params["sEtcGiDocNo"] = $("#sEtcGiDocNo").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sGrStrgeCd"] = $("#sGrStrgeCd").data("kendoExtDropDownList").value();
                            params["sGiStrgeCd"] = $("#sGiStrgeCd").data("kendoExtDropDownList").value();
                            params["sRegDtFr"] = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sMvtTp"] = "21";//수불유형:재고이동

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
                            dlrCd:{ type:"string", editable:false }
                            ,statCd:{ type:"string", editable:false }
                            ,etcGiDocNo:{ type:"string", editable:false }//기타입고번호(입고번호)
                            ,grDt:{ type:"date", editable:false }
                            ,itemQty:{ type:"number", editable:false }
                            ,itemCnt:{ type:"number", editable:false }
                            ,itemTotAmt:{ type:"number", editable:false }
                            ,regUsrId:{ type:"string", editable:false }
                            ,regUsrNm:{ type:"string", editable:false }
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
                        { field: "itemQty", aggregate: "sum" }
                        ,{ field: "itemCnt", aggregate: "sum" }
                        ,{ field: "itemTotAmt", aggregate: "sum" }
                    ]
            }
            ,selectable:"row"
            ,scrollable:true
            ,autoBind:false
            ,sortable:false
            ,height:403
            ,appendEmptyColumn:true
            ,columns:[
                {field:"statCd" ,title:"<spring:message code='par.lbl.stockMovStatCd' />" ,attributes:{ "class":"ac"} ,width:100
                    ,template:function(dataItem){

                        var spanObj = "";
                        switch(dataItem.statCd){
                            case "01":// 등록
                                spanObj = "<span class='txt_label bg_gray'>"+statCdObj[dataItem.statCd]+"</span>";
                                break;
                            case "02":// 확정
                                spanObj = "<span class='txt_label bg_blue'>"+statCdObj[dataItem.statCd]+"</span>";
                                break;
                            case "03":// 취소
                                spanObj = "<span class='txt_label bg_red'>"+statCdObj[dataItem.statCd]+"</span>";
                                break;
                            default: // 등록
                                spanObj = "<span class='txt_label bg_yellow'>"+statCdObj[dataItem.statCd]+"</span>";
                                break;
                        }
                        return spanObj;
                    }
                }//입고상태
                ,{field:"etcGiDocNo" ,title:"<spring:message code='par.lbl.stockMovDocNo' />" ,width:130}//입고문서번호
                ,{field:"grDt" ,title:"<spring:message code='par.lbl.stockMovDt' />"
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,width:90
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (grDt !== null ){# #= kendo.toString(data.grDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//출고일자
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.stockMovCnt' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }//건수
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.stockMovQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n0')#</div>"
                }//수량
                ,{field:"itemTotAmt" ,title:"<spring:message code='par.lbl.totTurnover' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#= setSumData(sum)#</div>"
                }//총금액
                ,{field:"regUsrId" ,title:"<spring:message code='global.lbl.regUsrId' />" ,width:120,hidden:true}//등록자
                ,{field:"regUsrNm" ,title:"<spring:message code='par.lbl.stockMovWorker' />" ,width:120}//등록자명
            ]
        });
        //창고이동명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-1219-112201"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/stockMovement/selectStockMovStorageDetailSummaryListByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;
                            // 기타입고 검색조건 코드.
                            params["sEtcGiDocNo"] = $("#sEtcGiDocNo").val();
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sGrStrgeCd"] = $("#sGrStrgeCd").data("kendoExtDropDownList").value();
                            params["sGiStrgeCd"] = $("#sGiStrgeCd").data("kendoExtDropDownList").value();
                            params["sRegDtFr"] = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sMvtTp"] = "21";//재고이동

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        if(result.total === 0){
                            //dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                        }

                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                        id:"etcGiDocNo"
                        ,fields:{
                            dlrCd:{ type:"string", editable:false }
                            ,etcGiDocNo:{ type:"string", editable:false }//입고번호
                            ,etcGiDocLineNo:{ type:"string", editable:false }//입고라인번호
                            ,grDt:{ type:"date",   editable:false }//입고일자
                            ,itemCd:{ type:"string", editable:false }//부번
                            ,itemNm:{ type:"string", editable:false }//품명
                            ,strgeMoveStockQty:{ type:"number", editable:false }//입고수량
                            ,grStrgeNm:{ type:"string", editable:false }//품명
                            ,giStrgeNm:{ type:"string", editable:false }//품명
                            ,grLocNm:{ type:"string", editable:false }//품명
                            ,giLocNm:{ type:"string", editable:false }//품명
                            ,giStatCd:{ type:"string", editable:false }//품명
                            ,grReasonCd:{ type:"string", editable:false }//품명
                            ,grStockQty:{ type:"number", editable:false }//재고수량
                            ,grAvlbStockQty:{ type:"number", editable:false }//가용수량
                            ,grResvStockQty:{ type:"number", editable:false }//예류수량
                            ,giStockQty:{ type:"number", editable:false }//재고수량
                            ,giAvlbStockQty:{ type:"number", editable:false }//가용수량
                            ,giResvStockQty:{ type:"number", editable:false }//예류수량
                            ,giBorrowQty:{ type:"number", editable:false }//차입수량
                            ,giRentQty:{ type:"number", editable:false }//차출수량
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
                        { field: "giStockQty", aggregate: "sum" }
                        ,{ field: "giAvlbStockQty", aggregate: "sum" }
                        ,{ field: "giResvStockQty", aggregate: "sum" }
                        ,{ field: "giBorrowQty", aggregate: "sum" }
                        ,{ field: "giRentQty", aggregate: "sum" }
                    ]
            }
            ,selectable:"row"
            ,scrollable:true
            ,autoBind:false
            ,sortable:false
            ,height:403
            ,appendEmptyColumn:true
            ,columns:[
                {field:"rnum" ,title:"<spring:message code='par.lbl.no'/>" ,width:50}//번호
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd'/>" ,width:120}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm'/>" ,width:200}//부품명
                ,{field:"strgeMoveStockQty" ,title:"<spring:message code='par.lbl.stockMovQty' />" ,attributes :{"class":"ar"} ,format:"{0:n0}" ,width:80}
                ,{field:"etcGiDocNo" ,title:"<spring:message code='par.lbl.strgeMoveDocNo' />" ,width:130}//입고문서번호
                ,{field:"grDt" ,title:"<spring:message code='par.lbl.stockMovDt' />"
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,width:100
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (grDt !== null ){# #= kendo.toString(data.grDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//출고일자
                ,{field:"grReasonCd", title:"<spring:message code='par.lbl.strgeMoveReason' />", width:200}//grReasonCd
                ,{field:"giStrgeNm", title:"<spring:message code='par.lbl.orgStrgeCd' />", width:120}//giStrgeCd
                ,{field:"giLocNm", title:"<spring:message code='par.lbl.orgLocCd' />", width:100}//giLocCd
                ,{field:"grStrgeNm", title:"<spring:message code='par.lbl.newStrgeCd' />", width:120}//grStrgeCd
                ,{field:"grLocNm", title:"<spring:message code='par.lbl.newLocCd' />", width:80,hidden:true}//grLocCd
                ,{field:"giStockQty" ,title:"<spring:message code='par.lbl.stockQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//재고수량
                ,{field:"giAvlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//가용수량
                ,{field:"giResvStockQty" ,title:"<spring:message code='par.lbl.purcOrdResvQty' />" ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//예류수량
                ,{field:"giRentQty" ,title:"<spring:message code='par.lbl.transferQty' />",width:80
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//대출(차출)수량
                ,{field:"giBorrowQty" ,title:"<spring:message code='par.lbl.loanQty' />",width:80
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//차입수량
                //,{field:"grStockQty" ,title:"<spring:message code='par.lbl.stockQty' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n0}" }//이동재고수량
                //,{field:"grAvlbStockQty" ,title:"<spring:message code='par.lbl.avlbStockQty' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n0}" }//이동가용수량
                //,{field:"grResvStockQty" ,title:"<spring:message code='par.lbl.purcOrdResvQty' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n0}" }//이동예류수량
            ]
        });

        //입고상태
        changeStatCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = statCdObj[val];
            }
            return returnVal;
        };

    initPage();

    });

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
            }
        }
     }

    //부품 팝업 열기 함수.
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            ,title:"<spring:message code='par.title.partSearch' />"//부품 조회
            ,width:850
            ,height:400
            ,content:{
                url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                ,data:{
                    "type":""
                    ,"autoBind":false
                    ,"callbackFunc":function(data){
                        if(!dms.string.isEmpty(data) && data.length > 0){
                            $("#sItemCd").val(data[0].itemCd);
                            $("#sItemNm").val(data[0].itemNm);
                            searchItemPopupWindow.close();
                        }else{
                             // 선택값이 없습니다.
                             dms.notification.warning("<spring:message code='global.info.unselected' />");
                        }
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

        $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

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

