<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<%--
    JSP Name:selectTargetDcptFlowMain.jsp
    Description : 소매 명세 레포트
    since 2016.10.25.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2016.10.25.                            최초 생성
--%>
<!-- 소매 명세 레포트 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.retailItemReport' /></h1> <!-- 소매 명세 레포트 -->
        <div class="btn_right">
            <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:19%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td>
                        <label for="sRadioN" class="label_check">
                            <input type="radio" id="sRadioN" name="sRadio" value="N" checked class="form_check" onClick="javascript:changedRadio(false);"/>
                            <spring:message code='sal.lbl.viewLastHistList' />
                        </label> <!-- 최종정보 -->
                        <label for="sRadioY" class="label_check">
                            <input type="radio" id="sRadioY" name="sRadio" value="Y" class="form_check" onClick="javascript:changedRadio(true);"/>
                            <spring:message code='sal.lbl.viewHistList' />
                        </label> <!-- 이력명세 -->
                        <input id="sRadioTp" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code='global.btn.searchCondition' /></th>       <!-- 조회조건 -->
                    <td>
                        <input id="sCondition" type="text" class="form_comboBox"  />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.date' /></th>       <!-- 조회일자 -->
                    <td>
                         <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" class="form_datepicker"/>
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.controlTp' /></th>       <!-- 조작유형 -->
                    <td>
                        <input id="sControlTp" type="text" class="form_comboBox"  />
                    </td>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>      <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>      <!-- 차관 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox" />
                        <input id="hiddenFscCode" type="hidden" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th> <!-- VIN -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ordTp' /></th>        <!-- 오더유형 -->
                    <td>
                        <input id="sOrdTp" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vContractCustNm" class="form_input" >
                                    <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                    <input id="sContractCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th> <!-- 판매담당자 -->
                    <td>
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="btn_right">
            <button id="btnExcelExport" type="button" class="btn_s" ><spring:message code="global.btn.excelExport" /></button>   <!-- 엑셀다운로드 -->
        </div>
    </div>


    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>
<section id="callHistoryWindow" class="pop_wrap">
    <!-- <section class="group">
        <div class="header_area">
            <div class="btn_right">
                <button id="btnPrint" type="button" class="btn_m"><spring:message code='sal.btn.print' /></button>
            </div>
        </div>
   </section> -->

   <section class="group">
        <div class="header_area">
        </div>
        <div class="table_grid">
            <div id="subGrid"></div>
        </div>
    </section>
</section>
</div>
<!-- 소매 명세 레포트 -->
<!-- #스크립트 영역# -->
<script type="text/javascript">
var toDay = "${toDay}";       //오늘
var beforeOneWeek = "${beforeOneWeek}";//일주일전
var oneDay = "${oneDay}";       //해당월 1일
var lastDay = "${lastDay}";     //해당월 마지막일자
var dlrCd  = "${dlrCd}";
var userId = "${userId}";
var userNm = "${userNm}";

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매인전체 조회권한 여부
var saleAdminYn = "${saleAdminYn}";

//update by lyy 查询下载增加承兑汇票信息 2018-12-19 start
//是否
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
  ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
//update by lyy 查询下载增加承兑汇票信息 2018-12-19 end

/**
 * 차종 콤보
 */
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

var ordTpList = [];
var ordTpListNc = [];
var ordTpObj = {};
<c:forEach var="obj" items="${ordTpDS}">
    ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ordTpListNc.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
    ordTpObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
</c:forEach>
var ordTpMap = dms.data.arrayToMap(ordTpListNc, function(obj){ return obj.cmmCd; });

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>
var saleEmpDSListMap = dms.data.arrayToMap(selectSaleEmpDSList, function(obj){ return obj.cmmCd; });

//조작상태 SAL187
var optList = [];
<c:forEach var="obj" items="${kmoptDS}">
    optList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>
var optMap = dms.data.arrayToMap(optList, function(obj){ return obj.cmmCd; });

//조회조건 SAL215
var srchKndList = [];
<c:forEach var="obj" items="${srchKndDs}">
  srchKndList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>
var srchKndMap = dms.data.arrayToMap(srchKndList, function(obj){ return obj.cmmCd; });

//조작유형 SAL214
var srchTpList = [];
<c:forEach var="obj" items="${srchTpDs}">
// 20201215 战略终端相关功能页面入口隐藏 from bhit update by sunzq3 start 
  //srchTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
	<c:if test="${obj.cmmCd eq 'R'}" >
  	srchTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
    </c:if>
// 20201215 战略终端相关功能页面入口隐藏 from bhit update by sunzq3 end 
</c:forEach>
var srchTpMap = dms.data.arrayToMap(srchTpList, function(obj){ return obj.cmmCd; });

var subParam = {};

$(document).ready(function() {

    $("#sRadioTp").val("L");

 // 본문 팝업 설정
    $("#callHistoryWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.lbl.historyView' />"      //재고실사
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#hiddenFscCode").val("");

           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
               ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
               ,async:false
           });
           $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    //판매담당자
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    if(saleEmpYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").value(userId);
    }else{
        $("#sSaleEmpNo").data("kendoExtDropDownList").value("");
    }
    if(saleAdminYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(true);
    }else{
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(false);
    }

    //모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"fscNm"
        ,dataValueField:"fscCd"
        ,optionLabel:" "   // 전체
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // 주문유형
    $("#sOrdTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ordTpList
       ,optionLabel:" "
    });

    // 주문유형 SAL215
    $("#sCondition").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:srchKndList
       ,optionLabel:" "
       ,value:"S"
    });

    // 조작유형 SAL214
    $("#sControlTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:srchTpList
       ,optionLabel:" "
    });

    //조회조건 - 일자(기간)- START
    $("#sStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    //조회조건 - 일자(기간)- END
    $("#sEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:lastDay
    });

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            var fromDt = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
                dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
                $("#sStartDt").focus();
                return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
                dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
                $("#sEndDt").focus();
                return false;
            }
            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
                dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
                $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sEndDt").focus();
                return false;
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 엑셀
    $("#btnExcelExport").kendoButton({
        click:function(e){
            var sModelCd = "";
            var sFscCd = "";
            if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                sModelCd = $("#hiddenFscCode").val();
            }else{
                sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
            }

            dms.ajax.excelExport({
                "beanName":"retailItemReportService"
                ,"templateFile":"RetailItemReport_Tpl.xlsx"
                ,"fileName":"DownloadExcel.xlsx"
                ,"sVinNo":$("#sVinNo").val()
                ,"sCarlineCd":$("#sCarlineCd").data("kendoExtDropDownList").value()
                ,"sFscCd":sFscCd
                ,"sModelCd":sModelCd
                ,"sOrdTp":$("#sOrdTp").data("kendoExtDropDownList").value()
                ,"sCondition":$("#sCondition").data("kendoExtDropDownList").value()
                ,"sStartDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sStartDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sEndDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sEndDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sContractCustNo":$("#sContractCustNo").val()
                ,"sContractCustNm":$("#vContractCustNm").val()
                ,"sRadioTp":$("#sRadioTp").val()
                ,"sControlTp":$("#sControlTp").data("kendoExtDropDownList").value()
                ,"sSaleEmpNo":$("#sSaleEmpNo").data("kendoExtDropDownList").value()
            });
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0328-131900"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/dlv/retailItemReport/selectRetailItemReport.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        var sModelCd = "";
                        var sFscCd = "";

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"]        = $("#sVinNo").val();                                          // VIN
                        params["sCarlineCd"]    = $("#sCarlineCd").data("kendoExtDropDownList").value();          // 차종

                        if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                            sModelCd = $("#hiddenFscCode").val();
                        }else{
                            sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                        }

                        params["sFscCd"]   = sFscCd;    // fsc코드
                        params["sModelCd"]   = sModelCd;    // 모델

                        params["sOrdTp"]        = $("#sOrdTp").data("kendoExtDropDownList").value();              // 오더유형
                        params["sCondition"]    = $("#sCondition").data("kendoExtDropDownList").value();          // 조회조건
                        params["sStartDt"]      = $("#sStartDt").data("kendoExtMaskedDatePicker").value();     // 조회조건 - 시작일
                        params["sEndDt"]        = $("#sEndDt").data("kendoExtMaskedDatePicker").value();       // 조회조건 - 종료일
                        params["sContractCustNo"] = $("#sContractCustNo").val();                               // 고객번호
                        params["sContractCustNm"] = $("#vContractCustNm").val();                               // 고객명

                        params["sRadioTp"] = $("#sRadioTp").val();  //이력명세혹은최종정보구분
                        params["sControlTp"] = $("#sControlTp").data("kendoExtDropDownList").value();  //진실여부

                        // 판매사원
                        params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();

                        //console.log("mainParam:::::"+kendo.stringify(params));
                        return kendo.stringify(params);

                    }else if (operation != "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         vinNo          :{type:"string"}
                        ,rnum           :{type:"number"}
                        ,carlineCd      :{type:"string"}
                        ,carlineNm      :{type:"string"}
                        ,modelNm        :{type:"string"}
                        ,ocnCd          :{type:"string"}
                        ,ocnNm          :{type:"string"}
                        ,intColorCd     :{type:"string"}
                        ,extColorCd     :{type:"string"}
                        ,extColorNm     :{type:"string"}
                        ,manufactYyMmDt :{type:"string"}
                        ,custSaleDt     :{type:"string"}
                        ,pltGiDt        :{type:"string"}
                        ,custNm         :{type:"string"}
                        ,prncQty        :{type:"number"}
                        ,workDate       :{type:"date"}
                        ,retailDt       :{type:"string"}
                        ,saleEmpNm      :{type:"string"}
                         //,vinmBkcm       :{type:"number", editable:false}
                        ,vinmBkwb       :{type:"string", editable:false}
                        ,vinmRepayYn    :{type:"string", editable:false}
                        ,bankNm         :{type:"string", editable:false}
                    }
                }
            }
            ,aggregate:[
                        { field:"prncQty", aggregate:"sum" } //수량표시
             ]
        }
        ,editable:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        //,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,autoBind:true
        ,sortable:false
        ,columns:[
                {field:"workDate"   ,title:"<spring:message code = 'global.lbl.operDt'/>"  ,width:150 ,attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateTimeFormat' />}"}   //조작일자
               ,{field:"kmopt" ,title:"<spring:message code='sal.lbl.gubunNm' />",       width:120 ,attributes:{"class":"al"}
                ,filterable:{
                   cell:{
                       showOperators:false
                       ,template: function (e) {
                              e.element.kendoExtDropDownList({
                                  dataSource:optList
                                  ,dataTextField:"cmmCdNm"
                                  ,dataValueField:"cmmCd"
                                  ,valuePrimitive:true
                                  ,optionLabel:" "
                              });
                          }
                   }
               }
               ,template:"# if(optMap[kmopt] != null){# #= optMap[kmopt].cmmCdNm# #}#"}  // 조작구분
               ,{field:"vinNo",title:"<spring:message code = 'global.lbl.vinNo'/>"              ,width:150  ,attributes:{"class":"al"}}  //VIN
               ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:80, attributes:{"class":"ac"}} //차종code
               ,{field:"carlineNm"     ,title:"<spring:message code = 'global.lbl.carLine'/>"   ,width:80  ,attributes:{"class":"al"}}  //차종
               ,{field:"modelNm"       ,title:"<spring:message code = 'global.lbl.model'/>"     ,width:140  ,attributes:{"class":"al"}}  //차관
               ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",        width:80, attributes:{"class":"ac"}}  //OCNcode
               ,{field:"ocnNm"         ,title:"<spring:message code = 'global.lbl.ocn'/>"       ,width:140  ,attributes:{"class":"al"}}   //OCN
               ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80, attributes:{"class":"ac"}}  //외장색code
               ,{field:"extColorNm"    ,title:"<spring:message code = 'global.lbl.extColor'/>"  ,width:80  ,attributes:{"class":"al"}} //외장색
               ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColorCd' />",     width:80, attributes:{"class":"ac"}}  //내장색code
               ,{field:"prncQty" ,title:"<spring:message code='sal.lbl.dealPrefValSal' />" ,width:80 ,attributes:{"class":"ar"} ,footerTemplate:"#=kendo.toString(sum, 'n0')#" ,footerAttributes:{style:"text-align:right;"}}//수량표시
               ,{field:"custNm"        ,title:"<spring:message code = 'global.lbl.custNm'/>"    ,width:80  ,attributes:{"class":"al"}}
               ,{field:"ordTp" ,title:"<spring:message code='global.lbl.ordTp' />",       width:120 ,attributes:{"class":"al"}
               ,filterable:{
                  cell:{
                      showOperators:false
                      ,template: function (e) {
                             e.element.kendoExtDropDownList({
                                 dataSource:ordTpListNc
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,valuePrimitive:true
                                 ,optionLabel:" "
                             });
                         }
                  }
              }
              ,template:"# if(ordTpMap[ordTp] != null){# #= ordTpMap[ordTp].cmmCdNm# #}#"}  //오더유형
              ,{field:"controlTp"    ,title:"<spring:message code = 'sal.lbl.controlTp'/>"  ,width:80  ,attributes:{"class":"al"}, template:"# if(srchTpMap[controlTp] != null){# #= srchTpMap[controlTp].cmmCdNm# #}#"} //조작유형
              ,{field:"saleEmpNm"        ,title:"<spring:message code = 'sal.lbl.salesAdvisor'/>"    ,width:140  ,attributes:{"class":"al"}} //판매고문
              ,{field:"retailDt", title:"<spring:message code = 'sal.lbl.firstDt'/>" ,width:100 ,headerAttributes:{style:"text-align:center;"} ,attributes:{"class":"ac"}}
              ,{field:"bankNm",     title:"<spring:message code='sal.lbl.bank' />", width:120, attributes:{"class":"al"}}       //银行
              //update by lyy 查询下载增加承兑汇票信息 2018-12-19 start
              ,{field:"vinmBkwb",     title:"<spring:message code='sal.lbl.vinmBkwb' />", width:120, attributes:{"class":"al"}}       //汇票号
              
              ,{field:"vinmRepayYn"
                  ,title:"<spring:message code='sal.lbl.vinmRepayYn' />"
                  ,width:90
                  ,attributes:{"class":"al"}
                  ,filterable:{
                      cell:{
                          showOperators:false
                          ,template: function (e) {
                                 e.element.kendoExtDropDownList({
                                     dataSource:ynList
                                     ,dataTextField:"cmmCdNm"
                                     ,dataValueField:"cmmCd"
                                     ,valuePrimitive:true
                                     ,optionLabel:" "
                                 });
                             }
                      }
                  }

                  ,template:"#=dms.string.strNvl(ynObj[vinmRepayYn])#"
               }
              //update by lyy 查询下载增加承兑汇票信息 2018-12-19 end
              ]
    });


    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#grid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());
        fn_gridDBclick(selectedItem);
        viewHistoryPopup();
    });

    fn_gridDBclick = function(selectedItem){
        if( selectedItem != null && selectedItem != 'undefined'){
            subParam["sVinNo"] = selectedItem.vinNo;
            subParam["sControlTp"] = $("#sControlTp").data("kendoExtDropDownList").value();  //진실여부

            $('#subGrid').data('kendoExtGrid').dataSource.page(1);
        }
    }

    $("#subGrid").kendoExtGrid({
        gridId:"G-SAL-1221-155234"
        ,dataSource:{
         transport:{
             read:{
                 //url:"<c:url value='/sal/dlv/cancelHistory/selectReleaseCancelHistory.do' />"
                 url:"<c:url value='/sal/dlv/retailItemReport/selectRetailItemDetailReport.do' />"
             }
            ,parameterMap:function(options, operation) {
                 if (operation == "read") {

                     //console.log("subParam:::::"+kendo.stringify(subParam));

                     return kendo.stringify(subParam);
                 }else if (operation !== "read" && options.models) {
                     return kendo.stringify(options.models);
                 }
             }
         }
         ,error:function(e){

         }
         ,schema:{
             data:"data"
            ,model:{
                 id:"cancelHistory"
                ,fields:{
                     ronum:{type:"string", editable:false}         //No
                    ,kmopt:{type:"string", editable:false}        //조작
                    ,optDt:{type:"string", editable:false}        //조작일자
                    ,kmvin:{type:"string", editable:false}        //VIN_NO
                    ,carlineNm:{type:"string", editable:false}    //차종
                    ,modelNm:{type:"string", editable:false}      //차관
                    ,custnm:{type:"string", editable:false}       //고객명
                    //,kmuser:{type:"string", editable:false}       //조작인
                    ,kmcncd:{type:"string", editable:false}       //취소사유
                 }
             }
         }
       }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();

            var qty = 0;

            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);

                if(dataItem.ordpVapr != null){
                    qty += Number(dataItem.ordpVapr);
                }
            });
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:false          //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,autoBind:false
       ,scrollable:true
       ,editable:false
       ,height:480
       ,pageable:false
       ,columns:[
             {field:"workDate"   ,title:"<spring:message code = 'global.lbl.operDt'/>"  ,width:120 ,attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateTimeFormat' />}"}   //조작일자
            ,{field:"kmopt"    ,title:"<spring:message code = 'sal.lbl.gubunNm'/>"        ,width:100  ,attributes:{"class":"al"}, template:"# if(optMap[kmopt] != null){# #= optMap[kmopt].cmmCdNm# #}#"} //조작구분
            ,{field:"vinNo",title:"<spring:message code = 'global.lbl.vinNo'/>"              ,width:150  ,attributes:{"class":"al"}}  //VIN
            ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:80, attributes:{"class":"ac"}} //차종code
            ,{field:"carlineNm"     ,title:"<spring:message code = 'global.lbl.carLine'/>"   ,width:80  ,attributes:{"class":"al"}}  //차종
            ,{field:"modelNm"       ,title:"<spring:message code = 'global.lbl.model'/>"     ,width:140  ,attributes:{"class":"al"}}  //차관
            ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",        width:80, attributes:{"class":"ac"}}  //OCNcode
            ,{field:"ocnNm"         ,title:"<spring:message code = 'global.lbl.ocn'/>"       ,width:140  ,attributes:{"class":"al"}}   //OCN
            ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80, attributes:{"class":"ac"}}  //외장색code
            ,{field:"extColorNm"    ,title:"<spring:message code = 'global.lbl.extColor'/>"  ,width:80  ,attributes:{"class":"al"}} //외장색
            ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColorCd' />",     width:80, attributes:{"class":"ac"}}  //내장색code
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />" ,width:100 ,headerAttributes:{style:"text-align:center;"} ,attributes:{"class":"al"}}
        ]
    });

    // 고객명에서 ObKeyDown
    $(".onKey_down").keydown(function(e){
        if (e.keyCode == 13) {
            if($(this).val() != "") {
                $(".custSearch").click();
            }
        }
    });

    // 고객조회
    //var custSearch = function() {
     $(".custSearch").click(function(){

         var custNm = $("#sContractCustNm").val();

         popupWindow = dms.window.popup({
             windowId:"customerSearchPopupMain"
             , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
             , content:{
                 url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                 , data:{
                     "autoBind":true
                     , "closeYn":"Y"
                     , "custNm":custNm
                     , "type"  :null
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                 $("#sContractCustNo").val(data[0].custNo);
                                 $("#sContractCustNm").val(data[0].custNm);
                             }
                         }
                     }
                 }
             }
         })
     });

     $("#sCondition").data("kendoExtDropDownList").enable(false);

});

//상세내용 팝업 호출
function viewHistoryPopup(){
    var win = $("#callHistoryWindow").data("kendoWindow").center().open();
}

//CRM 고객 조회
bf_searchCustomer = function(){

    var responseJson = {};
    if( dms.string.trim($("#vContractCustNm").val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sCustNm":$("#vContractCustNm").val()})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        $("#sContractCustNo").val(responseJson.data[0].custNo);       // 고객코드
        $("#sContractCustNm").val(responseJson.data[0].custNm);       // 고객명
        $("#vContractCustNm").val(responseJson.data[0].custNm);      // 고객명
    }else{
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , modal:true
            //, draggable:false
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "closeYn":"Y"
                    , "custNm":$("#vContractCustNm").val()
                    , "type":null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#sContractCustNm").val(data[0].custNm);       // 고객명
                            $("#vContractCustNm").val(data[0].custNm);       // 고객명
                        }
                        //popupWindow.close();
                    }
                }
            }
        });
    }
}

//고객명 event
$("#vContractCustNm").blur(function(e){
    cleanCustCheck();
});

//고객명 변경시 고객정보 clean
function cleanCustCheck(){
    if(dms.string.strNvl($("#vContractCustNm").val()) != dms.string.strNvl($("#sContractCustNm").val()) ){
        $("#sContractCustNo").val('');
        $("#sContractCustNm").val('');
    }
}

//radio 버튼 처리
function changedRadio(flg){
   if(flg){
       $("#sRadioY").prop("checked", true);
       $("#sCondition").data("kendoExtDropDownList").value("");
       $("#sCondition").data("kendoExtDropDownList").enable(true);
       $("#sRadioTp").val("H");

       //$("#grid").data("kendoExtGrid").dataSource.page(1);
   }else{
       $("#sRadioN").prop("checked", true);
       $("#sCondition").data("kendoExtDropDownList").value("S");
       $("#sCondition").data("kendoExtDropDownList").enable(false);
       $("#sRadioTp").val("L");


       //$("#grid").data("kendoExtGrid").dataSource.page(1);
   }
}
</script>
<!-- #스크립트 영역# -->
