<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<!-- 출입고조회 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
            <dms:access viewId="VIEW-D-11850" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </dms:access>
            </div>
            <div class="btn_right">
                <button type="button" id="btnDownloadList" name="btnDownloadList" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
            <dms:access viewId="VIEW-D-11849" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
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
                        <th scope="row"><spring:message code="par.lbl.grDocNo" /><!-- 입고문서 --></th>
                        <td>
                            <input id="sGrDocNo" class="form_input"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giDocNo" /><!-- 출고문서 --></th>
                        <td>
                            <input id="sGiDocNo" class="form_input"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemDstinCd" /><!-- 품목구분 --></th>
                        <td>
                             <input id="sItemDstinCd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grGiTp" /><!-- 입출고유형 --></th>
                        <td>
                            <input id="sMvtTp" data-type="multicombo" class="form_comboBox" />
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
                            <input type="text" id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.grGiDt" /><!-- 입출고일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sGiDtFr" class="form_datepicker"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sGiDtTo" class="form_datepicker"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.strge" /><!-- 창고 --></th>
                        <td>
                            <input id="sStrgeCd" class="form_comboBox" data-type="combo"/>
                        </td>
                    </tr>
                    <tr class="hidden">
                        <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 공급업체 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sBpNm" class="form_input"/>
                                <input type="text" id="sBpCd" class="form_input hidden" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_form form_width_100per mt10" id="summaryForm">
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
                        <th scope="row"><spring:message code="par.lbl.docNoCnt" /><!-- 문서수 --></th>
                        <td class="readonly_area">
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="docNoCnt" data-type="number" class="form_numeric ar" readonly />
                                    <span class="txt_from">/</span>
                                </div>
                                <div class="date_right">
                                    <input id="docNoCnt02" data-type="number" class="form_numeric ar" readonly />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCnt" /><!-- 부품수 --></th>
                        <td class="readonly_area">
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="itemCnt" data-type="number" class="form_numeric ar"  readonly />
                                    <span class="txt_from">/</span>
                                </div>
                                <div class="date_right">
                                    <input id="itemCnt02" data-type="number" class="form_numeric ar"  readonly />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code='par.lbl.itemQty' /></th><!-- 부품수량 -->
                        <td class="readonly_area">
                            <div class="date_left">
                                <input id="itemQty" data-type="number" class="form_numeric ar"  readonly />
                                <span class="txt_from">/</span>
                            </div>
                            <div class="date_right">
                                <input id="itemQty02" data-type="number" class="form_numeric ar"  readonly />
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.totAmtBefDc" /><!--금액합계 --></th>
                        <td class="readonly_area">
                            <div class="date_left">
                                <input id="itemAmt" data-type="number" class="form_numeric ar"  readonly />
                                <span class="txt_from">/</span>
                            </div>
                            <div class="date_right">
                                <input id="itemAmt02" data-type="number" class="form_numeric ar"  readonly />
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- // tab start-->
        <div id="tabstrip" class="tab_area mt10">
            <ul>
                <li id ="tabGrInfo"  class="k-state-active"><spring:message code="par.lbl.receive" /><!-- 입고 --></li>
                <li id ="tabGiInfo" ><spring:message code="par.lbl.issue" /><!-- 출고 --></li>
            </ul>

            <div>
                <div  class="table_grid">
                    <!-- 입고 그리드 -->
                    <div id="tabGrGrid" class="resizable_grid"></div>
                </div>
            </div>
            <div>
                <div  class="table_grid">
                    <!-- 출고 그리드 -->
                    <div id="tabGiGrid" class="resizable_grid"></div>
                </div>
            </div>
        </div>
    </section>
    <!-- //구매오더 -->
</div>
<!-- script -->
<script>
     var abcIndList      = []
        ,carlineCdList   = []
        ,itemDstinList   = []
        ,itemDstinCdObj  = {}
        ,mvtTpChkObj     = {"R":'', "I":'', "T":''}
        ,toDt            = "${toDt}"
        ,sevenDtBf       = "${sevenDtBf}"
        ,mvtTpList       = []
        ,unitObj         = {}
        ,strgeTpList     = []
        ,strgeTpObj      = {}
        ,selectTabId     = 'tabGrInfo'
        ,searchItemPopupWindow;

    //입출고 유형(수불유형)
    mvtTpList.push({"cmmCd":" ", "cmmCdNm":"<spring:message code='par.lbl.checkClearAll' />"});//전체해제
    <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
        if(mvtTpChkObj.hasOwnProperty("${obj.remark1}")){
            if("${obj.cmmCd}" !== "38"&&"${obj.cmmCd}" !== "23"){//내부수령분배 제외, 재고이동 예류 제외
                mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
            }
        }
    </c:forEach>

    //단위
    <c:forEach var="obj" items="${unitCdList}" varStatus="status">
        unitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
    </c:forEach>

    //창고
    strgeTpObj[' '] = "";
    strgeTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${storageList}" varStatus="status">
        strgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    //품목구분선택
    itemDstinList.push({"cmmCd":" ", "cmmCdNm":" "});
    <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
        if("${obj.useYn}" !== 'N'){
            itemDstinList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        }
        itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    $(document).ready(function() {
        //출고일
        $("#sGiDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sGiDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#docNoCnt").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });
        $("#docNoCnt02").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });

        $("#itemCnt").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });
        $("#itemCnt02").kendoExtNumericTextBox({
            format:"n0"
            ,spinners:false
        });

        $("#itemAmt").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        $("#itemAmt02").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        $("#itemQty").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });

        $("#itemQty02").kendoExtNumericTextBox({
            format:"n2"
            ,spinners:false
        });
        //조회조건-입출고구분
        $("#sMvtTp").kendoExtMultiSelectDropDownList({
            dataSource:mvtTpList
            ,dataTextField :"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,selectedAllText:"All"
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,select:function(e){
                var selectMvtTpCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectMvtTpCd)){
                    $("#sMvtTp").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sMvtTp").data("kendoExtMultiSelectDropDownList").value([]);
                }
            }
        });
        //조회조건-품목구분선택
        $("#sItemDstinCd").kendoExtDropDownList({
            dataSource:itemDstinList
            ,dataTextField :"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,index:0
        });
        //창고선택
        $("#sStrgeCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:strgeTpList
            ,index:0
        });
        //tab
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select:function(e) {
                selectTabId = e.item.id;
            }
        });

        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);

        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#tabGrGrid").data("kendoExtGrid").dataSource.page(1);
                $("#tabGiGrid").data("kendoExtGrid").dataSource.page(1);
            }
        });

        // 출입고조회 다운로드 버튼
        $("#btnDownloadList").kendoButton({
            click:function(e){

                var grid,
                    tmplFileNm,
                    fileNm,
                    jobType,
                    rows,
                    excelObj = {},
                    sMvtTpLst = $("#sMvtTp").data("kendoExtMultiSelectDropDownList").value();

                if(dms.string.isEmpty(sMvtTpLst[0])){
                    sMvtTpLst.splice(0,1);
                }

                //입고인경우
                if(selectTabId === 'tabGrInfo'){
                    grid       = $("#tabGrGrid").data("kendoExtGrid");
                    tmplFileNm = "GrStatusListDownload_Tpl.xlsx";
                    fileNm     = "GrStatusListDownload.xlsx";
                    jobType    = "grStatusListDownload";

                    excelObj = {
                            "beanName"     :"mvtDocService"
                           ,"templateFile" :tmplFileNm
                           ,"fileName"     :fileNm
                           ,"jobType"      :jobType
                           ,"sGrDocNo"     :$("#sGrDocNo").val()
                           ,"sMvtTpLst"    :sMvtTpLst
                           ,"sItemCd"      :$("#sItemCd").val()
                           ,"sItemNm"      :$("#sItemNm").val()
                           ,"sItemDstinCd" :$("#sItemDstinCd").data("kendoExtDropDownList").value()
                           ,"sStrgeCd"     :$("#sStrgeCd").data("kendoExtDropDownList").value()
                           ,"sGrDtFr"      :$("#sGiDtFr").val()
                           ,"sGrDtTo"      :$("#sGiDtTo").val()
                       };
                }else{
                    grid       = $("#tabGiGrid").data("kendoExtGrid");
                    tmplFileNm = "GiStatusListDownload_Tpl.xlsx";
                    fileNm     = "GiStatusListDownload.xlsx";
                    jobType    = "giStatusListDownload";

                    excelObj = {
                            "beanName"     :"mvtDocService"
                           ,"templateFile" :tmplFileNm
                           ,"fileName"     :fileNm
                           ,"jobType"      :jobType
                           ,"sGiDocNo"     :$("#sGiDocNo").val()
                           ,"sMvtTpLst"    :sMvtTpLst
                           ,"sItemCd"      :$("#sItemCd").val()
                           ,"sItemNm"      :$("#sItemNm").val()
                           ,"sItemDstinCd" :$("#sItemDstinCd").data("kendoExtDropDownList").value()
                           ,"sStrgeCd"     :$("#sStrgeCd").data("kendoExtDropDownList").value()
                           ,"sGiDtFr"      :$("#sGiDtFr").val()
                           ,"sGiDtTo"      :$("#sGiDtTo").val()
                       };
                }

                rows     = grid.tbody.find("tr");

                if(rows.length === 0 || dms.string.isEmpty(rows)){
                    dms.notification.warning("<spring:message code='global.info.unselected' />");
                    return false;
                }

                dms.ajax.excelExport(excelObj);
            }
        });

        // 입고 헤더 그리드
        $("#tabGrGrid").kendoExtGrid({
            gridId:"G-PAR-0808-162011"
            ,height:450
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/mvtDoc/selectGrList.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if(operation === "read"){

                            var params = {};

                            var sMvtTpLst = $("#sMvtTp").data("kendoExtMultiSelectDropDownList").value();
                            if(dms.string.isEmpty(sMvtTpLst[0])){
                                sMvtTpLst.splice(0,1);
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sGrDocNo"] = $("#sGrDocNo").val();
                            params["sMvtTpLst"] = sMvtTpLst;
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sGrDtFr"] = $("#sGiDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sGrDtTo"] = $("#sGiDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sStrgeCd"] = $("#sStrgeCd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    total:"total"
                    ,model:{
                        id:"mvtDocNo"
                        ,fields:{
                            dlrCd:{ type:"string", editable:false }
                            ,mvtTp:{ type:"string", editable:false }        //수불유형
                            ,mvtTpNm:{ type:"string", editable:false }      //수불유형명
                            ,mvtDocYyMm:{ type:"string", editable:false }   //수불년월
                            ,mvtDocNo:{ type:"string", editable:false }     //수불번호
                            ,mvtDocLineNo:{ type:"string", editable:false } //수불라인번호
                            ,bpCd:{ type:"string", editable:false }         //업체코드
                            ,bpNm:{ type:"string", editable:false }         //업체명
                            ,bizAreaCd:{ type:"string", editable:false }    //사업장코드
                            ,itemCd:{ type:"string", editable:false }       //부번
                            ,itemNm:{ type:"string", editable:false }       //품명
                            ,grDocNo:{ type:"string", editable:false }      //입고번호
                            ,grDocLineNo:{ type:"string", editable:false }  //입고라인번호
                            ,grDt:{ type:"date",   editable:false }         //입고일자(구매일자)
                            ,itemUnitCd:{ type:"string", editable:false }   //단위
                            ,currCd:{ type:"string", editable:false }       //화폐단위
                            ,itemQty:{ type:"number", editable:false }      //출고수량(구매수량)
                            ,strgeCd:{ type:"string", editable:false }      //창고
                            ,strgeNm:{ type:"string", editable:false }      //창고명
                            ,locCd:{ type:"string", editable:false }        //로케이션번호
                            ,purcPrc:{ type:"number", editable:false }      //단가
                            ,purcTaxDdctPrc:{ type:"number", editable:false }      //단가(세금제외)
                            ,purcAmt:{ type:"number", editable:false }      //금액
                            ,purcTaxDdctAmt:{ type:"number", editable:false }      //금액(세금제외)
                            ,mvtPurcAmt:{ type:"number", editable:false }   //수불구매금액
                            ,mvtPurcTaxDdctAmt:{ type:"number", editable:false }   //수불구매금액(세금제외)
                            ,movingAvgPrc:{ type:"number", editable:false } //이평가금액
                            ,movingAvgTaxDdctPrc:{ type:"number", editable:false } //이평가금액
                            ,movingAvgAmt:{ type:"number", editable:false } //이평가금액
                            ,movingAvgTaxDdctAmt:{ type:"number", editable:false } //이평가금액(세금제외)
                            ,stockQty:{ type:"number", editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,borrowQty:{ type:"number", editable:false }
                            ,rentQty:{ type:"number", editable:false }
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.grDt = kendo.parseDate(elem.grDt, "<dms:configValue code='dateFormat' />");
                                elem.strgeNm = changeStrgeCd(elem.strgeCd);
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:[
                    { field:"itemQty", aggregate:"sum" }
                    ,{ field:"mvtPurcAmt", aggregate:"sum" }
                    ,{ field:"mvtPurcTaxDdctAmt", aggregate:"sum" }
                    ,{ field:"movingAvgPrc", aggregate:"sum" }
                    ,{ field:"movingAvgTaxDdctPrc", aggregate:"sum" }
                    ,{ field:"purcAmt", aggregate:"sum" }
                    ,{ field:"purcTaxDdctAmt", aggregate:"sum" }
                ]
            }
            ,selectable:"row"
            ,scrollable:true
            ,sortable:false
            ,autoBind:false
            ,appendEmptyColumn:true
            ,indvColumnRows:5
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                if(rows.length > 0){
                    var sMvtTpLst = $("#sMvtTp").data("kendoExtMultiSelectDropDownList").value();

                    if(dms.string.isEmpty(sMvtTpLst[0])){
                        sMvtTpLst.splice(0,1);
                    }

                    var data={
                        "sGrDocNo":$("#sGrDocNo").val()
                        ,"sGiDocNo":""
                        ,"sMvtTpLst":sMvtTpLst
                        ,"sItemCd":$("#sItemCd").val()
                        ,"sItemNm":$("#sItemNm").val()
                        ,"sItemDstinCd":$("#sItemDstinCd").data("kendoExtDropDownList").value()
                        ,"sStrgeCd":$("#sStrgeCd").data("kendoExtDropDownList").value()
                        ,"sGrDtFr":$("#sGiDtFr").data("kendoExtMaskedDatePicker").value()
                        ,"sGrDtTo":$("#sGiDtTo").data("kendoExtMaskedDatePicker").value()
                        ,"sGiDtFr":null
                        ,"sGiDtTo":null
                        ,"sMvtGrGiTp" : "R" //수불 입출고 구분코드 : 입고
                    };

                    $.ajax({
                        url:"<c:url value='/par/pmm/mvtDoc/selectGrGiSummary.do' />"
                        ,data:kendo.stringify(data)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,async:false
                        ,success:function(result) {
                            $("#docNoCnt").data("kendoExtNumericTextBox").value(result.data[0].docNoCnt);
                            $("#itemCnt").data("kendoExtNumericTextBox").value(result.data[0].itemCnt);
                            $("#itemQty").data("kendoExtNumericTextBox").value(result.data[0].itemQty);
                            $("#itemAmt").data("kendoExtNumericTextBox").value(result.data[0].mvtItemAmt);

                        }
                        ,error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }
                    });
                }else{
                    $("#docNoCnt").data("kendoExtNumericTextBox").value(0);
                    $("#itemCnt").data("kendoExtNumericTextBox").value(0);
                    $("#itemQty").data("kendoExtNumericTextBox").value(0);
                    $("#itemAmt").data("kendoExtNumericTextBox").value(0);
                }

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            ,columns:[
                {field:"grDocNo" ,title:"<spring:message code='par.lbl.grDocNo' />" ,width:140}//입고번호
                ,{field:"strgeNm" ,title:"<spring:message code='par.lbl.grStrgeCd' />" ,width:120}//입고창고
                ,{field:"mvtTpNm" ,title:"<spring:message code='par.lbl.mvtTp' />" ,width:140}//수불유형명
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.itemBpNm' />" ,width:140}//공급업체
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:140}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200}//부품명
                ,{field:"grDt" ,title:"<spring:message code='par.lbl.grDt' />"
                    ,width:90
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (grDt !== null ){# #= kendo.toString(data.grDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//입고일자
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.qty' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:80
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//수량
                ,{field:"purcPrc" ,title:"<spring:message code='par.lbl.receive' /><spring:message code='par.lbl.salePrice' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120}//단가
                ,{field:"purcTaxDdctPrc" ,title:"<spring:message code='par.lbl.receive' /><spring:message code='par.lbl.salePrice' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:140}//단가
                ,{field:"mvtPurcAmt" ,title:"<spring:message code='par.lbl.receive' /><spring:message code='par.lbl.amt' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//금액
                ,{field:"mvtPurcTaxDdctAmt" ,title:"<spring:message code='par.lbl.receive' /><spring:message code='par.lbl.amt' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:140
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//금액(세금별도)
                ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.stockCost' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//입고이동평균단가
                ,{field:"movingAvgTaxDdctPrc" ,title:"<spring:message code='par.lbl.stockCost' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//입고이동평균단가(세금제외)
                ,{field:"purcAmt" ,title:"<spring:message code='global.lbl.cstAmt' /><spring:message code='par.lbl.amt' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//원가금액
                ,{field:"purcTaxDdctAmt" ,title:"<spring:message code='global.lbl.cstAmt' /><spring:message code='par.lbl.amt' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:140
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//원가금액(세금별도)
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.realAvlbStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//차출수량
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />",attributes:{"class":"ar"}  ,format:"{0:n2}" ,decimal:2 ,width:80}//차입수량
            ]
        });
        //출고 그리드
        $("#tabGiGrid").kendoExtGrid({
            gridId:"G-PAR-0808-162002"
            ,height:450
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/pmm/mvtDoc/selectGiList.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            var sMvtTpLst = $("#sMvtTp").data("kendoExtMultiSelectDropDownList").value();
                            if(dms.string.isEmpty(sMvtTpLst[0])){
                                sMvtTpLst.splice(0,1);
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sGiDocNo"] = $("#sGiDocNo").val();
                            params["sMvtTpLst"] = sMvtTpLst;
                            params["sItemCd"] = $("#sItemCd").val();
                            params["sItemNm"] = $("#sItemNm").val();
                            params["sItemDstinCd"] = $("#sItemDstinCd").data("kendoExtDropDownList").value();
                            params["sGiDtFr"] = $("#sGiDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sGiDtTo"] = $("#sGiDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sStrgeCd"] = $("#sStrgeCd").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    total:"total"
                    ,model:{
                        id:"mvtDocNo"
                        ,fields:{
                            dlrCd:{ type:"string", editable:false }
                            ,mvtTp:{ type:"string", editable:false }            //수불유형
                            ,mvtTpNm:{ type:"string", editable:false }          //수불유형명
                            ,mvtDocYyMm:{ type:"string", editable:false }       //수불년월
                            ,mvtDocNo:{ type:"string", editable:false }         //수불번호
                            ,mvtDocLineNo:{ type:"string", editable:false }     //수불라인번호
                            ,bpCd:{ type:"string", editable:false }             //업체코드
                            ,bpNm:{ type:"string", editable:false }             //업체명
                            ,bizAreaCd:{ type:"string", editable:false }        //사업장코드
                            ,itemCd:{ type:"string", editable:false }           //부품코드
                            ,itemNm:{ type:"string", editable:false }           //부품명
                            ,giDocNo:{ type:"string", editable:false }          //출고번호
                            ,giDocLineNo:{ type:"string", editable:false }      //출고라인번호
                            ,giDt:{ type:"date",   editable:false }             //출고일자(판매일자)
                            ,itemUnitCd:{ type:"string", editable:false }       //단위
                            ,currCd:{ type:"string", editable:false }           //화폐단위
                            ,itemQty:{ type:"number", editable:false }          //출고수량(구매수량)
                            ,strgeCd:{ type:"string", editable:false }          //창고
                            ,strgeNm:{ type:"string", editable:false }          //창고명
                            ,locCd:{ type:"string", editable:false }            //로케이션번호
                            ,salePrc:{ type:"number", editable:false }          //단가
                            ,saleTaxDdctPrc:{ type:"number", editable:false }          //단가(세금제외)
                            ,saleAmt:{ type:"number", editable:false }          //금액
                            ,saleTaxDdctAmt:{ type:"number", editable:false }          //금액(세금제외)
                            ,movingAvgPrc:{ type:"number", editable:false }          //이평가금액
                            ,movingAvgTaxDdctPrc:{ type:"number", editable:false }          //이평가금액
                            ,movingAvgAmt:{ type:"number", editable:false }          //이평가금액
                            ,movingAvgTaxDdctAmt:{ type:"number", editable:false }          //이평가금액(세금제외)
                            ,stockQty:{ type:"number", editable:false }
                            ,avlbStockQty:{ type:"number", editable:false }
                            ,resvStockQty:{ type:"number", editable:false }
                            ,borrowQty:{ type:"number", editable:false }
                            ,rentQty:{ type:"number", editable:false }
                        }
                    }
                    ,parse:function(d) {
                        if(d.data){
                            $.each(d.data, function(idx, elem) {
                                elem.giDt = kendo.parseDate(elem.giDt, "<dms:configValue code='dateFormat' />");
                                elem.strgeNm = changeStrgeCd(elem.strgeCd);
                            });
                        }

                        return d;
                    }
                }
                ,aggregate:[
                    { field:"itemQty", aggregate:"sum" }
                    ,{ field:"saleAmt", aggregate:"sum" }
                    ,{ field:"saleTaxDdctAmt", aggregate:"sum" }
                    ,{ field:"movingAvgPrc", aggregate:"sum" }
                    ,{ field:"movingAvgTaxDdctPrc", aggregate:"sum" }
                    ,{ field:"movingAvgAmt", aggregate:"sum" }
                    ,{ field:"movingAvgTaxDdctAmt", aggregate:"sum" }
                ]
            }
            ,selectable:"row"
            ,scrollable:true
            ,sortable:false
            ,autoBind:false
            ,appendEmptyColumn:true
            ,indvColumnRows:5
            ,dataBound:function(e){
                var rows = e.sender.tbody.children();

                if(rows.length > 0){

                    var sMvtTpLst = $("#sMvtTp").data("kendoExtMultiSelectDropDownList").value();

                    if(dms.string.isEmpty(sMvtTpLst[0])){
                        sMvtTpLst.splice(0,1);
                    }

                    var data = {
                        "sGrDocNo":""
                        ,"sGiDocNo":$("#sGiDocNo").val()
                        ,"sMvtTpLst":sMvtTpLst
                        ,"sItemCd":$("#sItemCd").val()
                        ,"sItemNm":$("#sItemNm").val()
                        ,"sItemDstinCd":$("#sItemDstinCd").data("kendoExtDropDownList").value()
                        ,"sStrgeCd":$("#sStrgeCd").data("kendoExtDropDownList").value()
                        ,"sGrDtFr":null
                        ,"sGrDtTo":null
                        ,"sGiDtFr":$("#sGiDtFr").data("kendoExtMaskedDatePicker").value()
                        ,"sGiDtTo":$("#sGiDtTo").data("kendoExtMaskedDatePicker").value()
                        ,"sMvtGrGiTp" : "I" //출고
                    };

                    $.ajax({
                       url:"<c:url value='/par/pmm/mvtDoc/selectGrGiSummary.do' />"
                       ,data:kendo.stringify(data)
                       ,type:'POST'
                       ,dataType:'json'
                       ,contentType:'application/json'
                       ,async:false
                       ,success:function(result) {
                           $("#docNoCnt02").data("kendoExtNumericTextBox").value(result.data[0].docNoCnt);
                           $("#itemCnt02").data("kendoExtNumericTextBox").value(result.data[0].itemCnt);
                           $("#itemQty02").data("kendoExtNumericTextBox").value(result.data[0].itemQty);
                           $("#itemAmt02").data("kendoExtNumericTextBox").value(result.data[0].itemAmt);
                       }
                       ,error:function(jqXHR,status,error) {
                           dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                       }
                    });
                }else{
                    $("#docNoCnt02").data("kendoExtNumericTextBox").value(0);
                    $("#itemCnt02").data("kendoExtNumericTextBox").value(0);
                    $("#itemQty02").data("kendoExtNumericTextBox").value(0);
                    $("#itemAmt02").data("kendoExtNumericTextBox").value(0);
                }

                $.each(rows, function(idx, row){
                    var row = $(rows[idx]);
                    var dataItem = e.sender.dataItem(row);

                    if(dataItem != null && dataItem != 'undefined'){
                        e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                    }
                });
            }
            ,columns:[
                {field:"giDocNo" ,title:"<spring:message code='par.lbl.giDocNo' />" ,width:140}//출고번호
                ,{field:"strgeNm" ,title:"<spring:message code='par.lbl.giStrgeCd' />",width:120}//출고창고
                ,{field:"mvtTpNm" ,title:"<spring:message code='par.lbl.mvtTpGi' />" ,width:140}//출입고유형
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.issueCstNm' />" ,width:140}//공급업체
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:140}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200}//부품명
                ,{field:"giDt" ,title:"<spring:message code='par.lbl.giDt' />"
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,width:90
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (giDt !== null ){# #= kendo.toString(data.giDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//출고일자
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.qty' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:80
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//수량
                ,{field:"salePrc" ,title:"<spring:message code='sal.lbl.retlQty' /><spring:message code='par.lbl.salePrice' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120}//단가
                ,{field:"saleTaxDdctPrc" ,title:"<spring:message code='sal.lbl.retlQty' /><spring:message code='par.lbl.salePrice' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:140}//단가
                ,{field:"saleAmt" ,title:"<spring:message code='sal.lbl.retlQty' /><spring:message code='par.lbl.amt' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//금액
                ,{field:"saleTaxDdctAmt" ,title:"<spring:message code='sal.lbl.retlQty' /><spring:message code='par.lbl.amt' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:140
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//금액
                ,{field:"movingAvgPrc" ,title:"<spring:message code='par.lbl.stockCost' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//출고이동평균단가
                ,{field:"movingAvgTaxDdctPrc" ,title:"<spring:message code='par.lbl.stockCost' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//출고이동평균단가(세금제외)
                ,{field:"movingAvgAmt" ,title:"<spring:message code='global.lbl.cstAmt' /><spring:message code='par.giMoveAmt' />" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:120
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//출고이동평균금액
                ,{field:"movingAvgTaxDdctAmt" ,title:"<spring:message code='global.lbl.cstAmt' /><spring:message code='par.giMoveAmt' />(<spring:message code='par.lbl.taxSprt' />)" ,attributes :{"class":"ar"} ,format:"{0:n2}" ,width:140
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(Math.round(sum * 100)/100,'n2')#</div>"
                }//출고이동평균금액(세금제외)
                ,{field:"stockQty" ,title:"<spring:message code='par.lbl.docStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}
                ,{field:"avlbStockQty" ,title:"<spring:message code='par.lbl.realAvlbStockQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,width:80}
                ,{field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//예류수량
                ,{field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//차출수량
                ,{field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />",attributes:{"class":"ar"}  ,format:"{0:n2}" ,decimal:2 ,width:80}//차입수량
            ]
        });

        // 품목단위
        changeItemUnit = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = unitObj[val];
            }
            return returnVal;
        };

        // 창고
        changeStrgeCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = strgeTpObj[val];
            }
            return returnVal;
        };


    initPage();

    });

    function fnChkDateValue(e){
        var elmt = e.sender.element[0],
        id = elmt.id,
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

        if(this.value() == null){
            if(id === 'sGrDtFr'){

            }else if(id === 'sGrDtTo'){

            }else if(id === 'sGiDtFr'){
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
            if(id === 'sGrDtFr'){

            }else if(id === 'sGrDtTo'){

            }else if(id === 'sGiDtFr'){
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
    //부품팝업 함수.
    function selectPartsMasterPopupWindow(){

        searchItemPopupWindow = dms.window.popup({
            windowId:"ItemMasterPopup"
            ,title:"<spring:message code='par.title.partSearch' />"//부품조회
            ,width:840
            ,height:400
            ,content:{
                url:"<c:url value='/par/cmm/selectSearchItemPopup.do'/>"
                ,data:{
                    "type":""
                    ,"itemCd":$("#sItemCd").val()
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
    //거래처조회 팝업 함수
    var venderSearchPopupWin;
    function selectVenderMasterPopupWindow(){

        venderSearchPopupWin = dms.window.popup({
            windowId:"venderSearchPopupWin"
            ,title:"<spring:message code = 'par.title.venderSelect'/>"//거래처조회
            ,content:{
                url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"bpCd":''
                    ,"bpNm":''
                    ,"callbackFunc":function(data){
                        $("#sBpCd").val(data[0].bpCd);
                        $("#sBpNm").val(data[0].bpNm);

                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    }
    //초기화 함수.
    function initPage(){
        var minDate = new Date(sevenDtBf),
        maxDate = new Date(toDt),
        toYY,
        toMM,
        toDD,
        frYY,
        frMM,
        frDD;

        $("#tabGrGrid").data("kendoExtGrid").dataSource.data([]);
        $("#tabGiGrid").data("kendoExtGrid").dataSource.data([]);

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

        $("#sItemCd").val("");
        $("#sItemNm").val("");
        $("#sGrDocNo").val("");
        $("#sGiDocNo").val("");
        $("#sItemDstinCd").data("kendoExtDropDownList").value('');
        $("#sStrgeCd").data("kendoExtDropDownList").value('');
        $("#sMvtTp").data("kendoExtMultiSelectDropDownList").value([]);

        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#summaryForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();
    }
</script>
<!-- //script -->

