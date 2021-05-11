<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>
    <!-- 포인트 교환 집계 -->
<div id="resizableContainer">
    <c:set value="${policy}" var="membershipStan" /> <!-- C:고객, V:자동차 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.title.pointExchangeSituation" /><!-- 포인트 교환 집계--></h1>
            <div class="btn_left">
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-13105" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnExcelExport" name="btnExcelExport" class="btn_m btn_m_min" ><spring:message code="par.btn.excelDownload" /></button>
                </dms:access>
                <dms:access viewId="VIEW-D-13104" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                </dms:access>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:16%;">
                    <col style="width:8%;">
                    <col style="width:18%;">
                    <col style="width:8%;">
                    <col style="width:16%;">
                    <col style="width:8%;">
                    <col style="width:18%;">
                    <col>
                </colgroup>
                <tbody>
                    <c:choose>
                        <c:when test="${membershipStan eq 'V'}">
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객 명 --></th>
                        <td>
                            <input type="text" id="sContractCustNm" value="" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />"  />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.membershipNo" /><!-- 회원번호 --></th>
                        <td>
                            <input id="sMembershipNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.vinNo" /><!-- vin번호 --></th>
                        <td>
                            <input id="sVinNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.pointExchange" /><!-- 교환 번호 --></th>
                        <td>
                            <input id="sGoodsContractNo" class="form_input" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.accItemCd" /><!-- 용품 번호 --></th>
                        <td>
                            <input id="sGoodsCd" type="text" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.goodsName" /><!-- 용품 명칭 --></th>
                        <td>
                            <input type="text" id="sGoodsNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.carRegNo" /><!-- 차량 번호 --></th>
                        <td>
                            <input type="text" id="sCarRegNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.exchangeTime" /><!-- 교환 시간 --></th>
                        <td>
                           <div class="form_float">
                                <div class="date_left">
                                    <input id="sStartRegDt" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEndRegDt" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:when>
                    <c:when test="${membershipStan eq 'C'}">
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객 명 --></th>
                            <td>
                                <input type="text" id="sContractCustNm" value="" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />"  />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.membershipNo" /><!-- 회원번호 --></th>
                            <td>
                                <input id="sMembershipNo" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.pointExchange" /><!-- 교환 번호 --></th>
                            <td>
                                <input id="sGoodsContractNo" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="sal.lbl.accItemCd" /><!-- 용품 번호 --></th>
                            <td>
                                <input id="sGoodsCd" type="text" class="form_input" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="sal.lbl.goodsName" /><!-- 용품 명칭 --></th>
                            <td>
                                <input type="text" id="sGoodsNm" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.exchangeTime" /><!-- 교환 시간 --></th>
                            <td>
                               <div class="form_float">
                                    <div class="date_left">
                                        <input id="sStartRegDt" class="form_datepicker" data-type="maskDate"/>
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sEndRegDt" class="form_datepicker" data-type="maskDate"/>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:when>
                </c:choose>
                </tbody>
            </table>
        </div>

        <div id="dataForm" class="mt10">
        <!-- 탭메뉴 전체 영역 -->
         <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li id="H" class="k-state-active"><spring:message code="crm.lbl.pointExchangeSummary" /><!-- 포인트교환현황 --></li>
                <li id="D"><spring:message code="crm.lbl.pointExchangeDetail" /><!-- 포인트 교환상세 --></li>
            </ul>
            <div>
                  <!-- 포인트교환현황  -->
                  <div class="table_grid">
                      <div id="grid" class="resizable_grid"></div>
                  </div>
                  <!-- 포인트교환현황  -->
              </div>
              <div>
                  <!-- 포인트 교환상세  -->
                  <div class="table_grid">
                      <div id="gridDetail" class="resizable_grid" ></div>
                  </div>
                  <!-- 포인트 교환상세  -->
              </div>
          </div>
        </div>
    </section>
</div>
<!-- script -->
<script>

    /**
     * hyperlink in grid event of Customer Information
     */
     $(document).on("click", ".linkCust", function(e){

          var grid = $("#grid").data("kendoExtGrid"),
          row = $(e.target).closest("tr");
          var dataItem = grid.dataItem(row);

          window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.contractCustNo, "VIEW-D-10272"); // CUST NO
     });


     $(document).on("click", ".linkCust", function(e){

         var grid = $("#gridDetail").data("kendoExtGrid"),
         row = $(e.target).closest("tr");
         var dataItem = grid.dataItem(row);

         window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.contractCustNo, "VIEW-D-10272"); // CUST NO
    });

    $(document).ready(function() {
        stan = '<c:out value="${membershipStan}"/>';
        //flag = true 시 고객 기준 임, flag = false 시 차량 기준 임
        var flag;
        (stan == 'C')?flag = true:flag = false;

        setKendoDate = function( dtValue){
            return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
        };

        //포인트 교환 시간
        $("#sStartRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sStartDt}' />"
        });

        $("#sEndRegDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:"<c:out value='${sEndDt}' />"
        });

        selectTabId = "H";
        //tabstrip
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select: function(e) {
                selectTabId = e.item.id;
            }
        });

        //btnExcelExport
        $("#btnExcelExport").kendoButton({
            click:function(e){

                var beanName,templateFile,fileName,sVinNo,sCarRegNo;
                var type;       // H:Header / D:Detail
                if(crmJs.isDateValidPeriod($("#sStartRegDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndRegDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                }else{
                    $("#sEndRegDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndRegDt").focus();
                    return false;
                }


              //tab 구별
                if(selectTabId == "H"){
                        // C V 일때 download file 선택
                        if (stan == 'C') {
                            sVinNo = "";
                            sCarRegNo = "";

                            beanName = "accessoryItemSalesSupportService";
                            templateFile = "MembershipPointExchangeMasterC_Tpl.xlsx";
                            fileName = "MembershipPointExchangeMasterC.xlsx";
                        } else {
                            sVinNo = $("#sVinNo").val();
                            sCarRegNo = $("#sCarRegNo").val();

                            beanName = "accessoryItemSalesSupportService";
                            templateFile = "MembershipPointExchangeMasterV_Tpl.xlsx";
                            fileName = "MembershipPointExchangeMasterV.xlsx";
                        }

                        dms.ajax.excelExport({
                            "beanName":beanName
                            ,"templateFile":templateFile
                            ,"fileName":fileName
                            ,"type":'H'
                            ,"sContractCustNm":$("#sContractCustNm").val()
                            ,"sMembershipNo":$("#sMembershipNo").val()
                            ,"sGoodsContractNo":$("#sGoodsContractNo").val()
                            ,"sVinNo":sVinNo
                            ,"sCarRegNo":sCarRegNo
                            ,"sStartRegDt":setKendoDate($("#sStartRegDt").data("kendoExtMaskedDatePicker").value())
                            ,"sEndRegDt":setKendoDate($("#sEndRegDt").data("kendoExtMaskedDatePicker").value())
                            ,"sGoodsTp": '05'
                        });
                } else {
                        // C V 일때 download file 선택
                        if (stan == 'C') {
                            sVinNo = "";
                            sCarRegNo = "";
                            beanName = "accessoryItemSalesSupportService";
                            templateFile = "MembershipPointExchangeHistoryC_Tpl.xlsx";
                            fileName = "MembershipPointExchangeHistoryC.xlsx";
                        } else {
                            sVinNo = $("#sVinNo").val();
                            sCarRegNo = $("#sCarRegNo").val();

                            beanName = "accessoryItemSalesSupportService";
                            templateFile = "MembershipPointExchangeHistoryV_Tpl.xlsx";
                            fileName = "MembershipPointExchangeHistoryV.xlsx";
                        }

                        dms.ajax.excelExport({
                            "beanName":beanName
                            ,"templateFile":templateFile
                            ,"fileName":fileName
                            ,"type":'D'
                            ,"sContractCustNm":$("#sContractCustNm").val()
                            ,"sMembershipNo":$("#sMembershipNo").val()
                            ,"sGoodsContractNo":$("#sGoodsContractNo").val()
                            ,"sVinNo":sVinNo
                            ,"sCarRegNo":sCarRegNo
                            ,"sStartRegDt":setKendoDate($("#sStartRegDt").data("kendoExtMaskedDatePicker").value())
                            ,"sEndRegDt":setKendoDate($("#sEndRegDt").data("kendoExtMaskedDatePicker").value())
                            ,"sGoodsCd":$("#sGoodsCd").val()
                            ,"sGoodsNm":$("#sGoodsNm").val()
                            ,"sGoodsTp": '05'
                        });
                }
            }
            ,enable:false
        });

        //조회 바튼
        $("#btnSearch").kendoButton({
            click:function(e){
                if(crmJs.isDateValidPeriod($("#sStartRegDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndRegDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    $("#gridDetail").data("kendoExtGrid").dataSource.read();
                }else{
                    $("#sEndRegDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndRegDt").focus();
                }
            }
        });

        // 포인트 교환 마스터 그리드
        $("#grid").kendoExtGrid({
           gridId:"G-CRM-0519-134900"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipPointExchange/selectAccessoryItemSalesMaster.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            params["sContractCustNm"]    = $("#sContractCustNm").val();
                            params["sMembershipNo"]      = $("#sMembershipNo").val();
                            params["sVinNo"]             = $("#sVinNo").val();
                            params["sGoodsContractNo"]   = $("#sGoodsContractNo").val();

                            params["sCarRegNo"]          = $("#sCarRegNo").val();
                            params["sStartRegDt"]        = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndRegDt"]          = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();
                            params["sGoodsTp"]           = "05";
                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"membershipNo"
                       ,fields:{
                           rnum                   :{type:"number", editable:false}
                           ,membershipNo          :{type:"string", editable:false}
                           ,dlrCd                 :{type:"string", validation:{required:true}}
                           ,contractCustNm        :{type:"string", editable:false}
                           ,telNo                 :{type:"string", editable:false}
                           ,hpNo                 :{type:"string", editable:false}
                           ,vinNo                 :{type:"string", editable:false}
                           ,carRegNo              :{type:"string", editable:false}
                           ,goodsContractNo       :{type:"string", editable:false}
                           ,goodsCnt              :{type:"number", editable:false}
                           ,pointVal              :{type:"number", editable:false}
                           ,regUsrNm              :{type:"string", editable:false}
                           ,regDt                 :{type:"date"  , editable:false}
                         }
                    }
                }
                ,aggregate:[
                         { field: "goodsCnt", aggregate: "sum" }
                        ,{ field: "pointVal", aggregate: "sum" }
                    ]
            }
            , selectable:"row"
            , hidden:true
            , scrollable:true
            , autoBind:true
            , filterable:false
            , resizable:true
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , dataBound:function (e) {
                var dataItems = e.sender.dataSource.view();

                if ( dataItems.length > 0 ) {
                    $("#btnExcelExport").data("kendoButton").enable(true);
                } else {
                    $("#btnExcelExport").data("kendoButton").enable(false);
                };
            }
            , columns:[
                {field:"rnum" ,title:"<spring:message code='global.lbl.no' />",attributes:{ "class":"ac"},width:41,footerTemplate:"<spring:message code='global.lbl.total' />"}//번호
                ,{field:"membershipNo" ,title:"<spring:message code='global.lbl.membershipNo' />" ,attributes:{ "class":"ac"} ,width:130}//회원번호
                ,{field:"contractCustNm" ,title:"<spring:message code='global.lbl.custNm' />"
                    ,attributes:{ "class":"ac"}
                    ,width:120
                    ,template:function(dataItem){
                        var spanObj = "<a href='#' class='linkCust'>"+dataItem.contractCustNm+"</a>";
                        return spanObj;
                    }
                }  //고객 명
                ,{field:"hpNo" ,title:"<spring:message code='global.lbl.cellphone' />" ,attributes:{ "class":"ac"},width:100}   //이동전화
                ,{field:"vinNo" ,title:"<spring:message code='crm.lbl.vinNo' />" ,attributes:{ "class":"ac"} ,width:160, hidden: flag}//VIN
                ,{field:"carRegNo" ,title:"<spring:message code='crm.lbl.carRegNo' />" ,width:80, hidden: flag}//차량 번호
                ,{field:"goodsContractNo" ,title:"<spring:message code='crm.lbl.pointExchange02' />" ,width:130}//교환번호
                ,{field:"goodsCnt"
                    ,title:"<spring:message code='global.lbl.qty' />"
                    ,width:50
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n0}"
                    ,aggregates:["sum"]
                    ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"} //수량
                ,{field:"pointVal" ,title:"<spring:message code='crm.lbl.employPoint' />",width:80
                        ,attributes:{ "class":"ar"}
                        ,format:"{0:n0}"
                        ,aggregates:["sum"]
                        ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"}//포인트 사용
                ,{field:"regUsrNm" ,title:"<spring:message code='global.lbl.handler' />" ,attributes:{ "class":"al"} ,width:80 }//조작인
                ,{field:"regDt" ,title:"<spring:message code='crm.lbl.exchangeTime' />" ,width:100
                    ,attributes:{ "class":"ac"}
                    ,template:"#if (regDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }//교환시간

           ]
        });

        // 포인트 교환 명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-CRM-0519-134902"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipPointExchange/selectAccessoryItemSalesHistory.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            params["sGoodsCd"]           = $("#sGoodsCd").val();
                            params["sGoodsNm"]           = $("#sGoodsNm").val();
                            params["sContractCustNm"]    = $("#sContractCustNm").val();
                            params["sMembershipNo"]      = $("#sMembershipNo").val();
                            params["sGoodsContractNo"]   = $("#sGoodsContractNo").val();
                            params["sVinNo"]             = $("#sVinNo").val();
                            params["sCarRegNo"]          = $("#sCarRegNo").val();
                            params["sStartRegDt"]        = $("#sStartRegDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndRegDt"]          = $("#sEndRegDt").data("kendoExtMaskedDatePicker").value();
                            params["sGoodsTp"]           = "05";
                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    model:{
                       id:"membershipNo"
                      ,fields:{
                          rnum                   :{type:"number", editable:false}
                          ,membershipNo          :{type:"string", editable:false}
                          ,dlrCd                 :{type:"string", validation:{required:true}}
                          ,contractCustNm        :{type:"string", editable:false}
                          ,telNo                 :{type:"string", editable:false}
                          ,hpNo                  :{type:"string", editable:false}
                          ,vinNo                 :{type:"string", editable:false}
                          ,carRegNo              :{type:"string", editable:false}
                          ,goodsContractNo       :{type:"string", editable:false}
                          ,goodsCd               :{type:"string", editable:false}
                          ,goodsNm               :{type:"string", editable:false}
                          ,retlPrc               :{type:"number", editable:false}
                          ,goodsCnt              :{type:"number", editable:false}
                          ,pointVal              :{type:"number", editable:false}
                          ,regUsrNm              :{type:"string", editable:false}
                          ,regDt                 :{type:"date"  , editable:false}
                        }
                    }
                }
                ,aggregate:[
                         { field: "goodsCnt", aggregate: "sum" }
                        ,{ field: "pointVal", aggregate: "sum" }
                    ]
            }
            ,selectable:"row"
            ,scrollable :true
            ,autoBind:true
            ,filterable:false
            ,resizable:true
            ,appendEmptyColumn:true//empty column. default:false
            ,hidden:true
            ,columns:[
                 {field:"rnum" ,title:"<spring:message code='global.lbl.no' />" ,attributes:{ "class":"ac"},width:41,footerTemplate:"<spring:message code='global.lbl.total' />"}//번호
                 ,{field:"membershipNo" ,title:"<spring:message code='global.lbl.membershipNo' />" ,attributes:{ "class":"ac"} ,width:130}//회원번호
                 ,{field:"contractCustNm" ,title:"<spring:message code='global.lbl.custNm' />"
                     ,attributes:{ "class":"ac"}
                     ,width:120
                     ,template:function(dataItem){
                         var spanObj = "<a href='#' class='linkCust'>"+dataItem.contractCustNm+"</a>";
                         return spanObj;
                     }
                 }  //고객 명
                 ,{field:"hpNo" ,title:"<spring:message code='global.lbl.cellphone' />" ,attributes:{ "class":"ac"},width:100}   //이동전화
                 ,{field:"vinNo" ,title:"<spring:message code='crm.lbl.vinNo' />" ,attributes:{ "class":"ac"} ,width:160, hidden: flag}//VIN
                 ,{field:"carRegNo" ,title:"<spring:message code='crm.lbl.carRegNo' />" ,width:80, hidden: flag}//차량 번호
                 ,{field:"goodsContractNo" ,title:"<spring:message code='crm.lbl.pointExchange02' />" ,width:130}//교환번호
                 ,{field:"goodsCd", title:"<spring:message code='sal.lbl.accItemCd' />" ,width:120}//용품 번호
                 ,{field:"goodsNm", title:"<spring:message code='sal.lbl.goodsName' />" ,width:120}//용품 명칭
                 ,{field:"retlPrc" ,title:"<spring:message code='sal.lbl.goodsSalePrice' />"  ,width:90,attributes:{ "class":"ar"},format:"{0:n2}"}//용품 단가
                 ,{field:"goodsCnt" ,title:"<spring:message code='global.lbl.qty' />"
                     ,width:50
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"} //수량
                 ,{field:"pointVal" ,title:"<spring:message code='crm.lbl.employPoint' />" ,width:80,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,aggregates:["sum"]
                     ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"}//포인트 사용
                 ,{field:"regUsrNm" ,title:"<spring:message code='global.lbl.handler' />" ,attributes:{ "class":"al"} ,width:80 }//조작인
                 ,{field:"regDt" ,title:"<spring:message code='crm.lbl.exchangeTime' />" ,width:100
                     ,attributes:{ "class":"ac"}
                     ,template:"#if (regDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                 }//교환시간
            ]
        });
    });
    //document.ready function 완료

</script>

