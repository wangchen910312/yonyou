<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 부품판매오더현황 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><%-- <spring:message code="par.title.parSaleOrdNoList" /> --%><!-- 구매오더 정보 --></h1>
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
                        <th scope="row"><spring:message code="par.lbl.custTp" /><!-- 고객유형 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sCustTp" data-type="combo" class="form_comboBox">
                                </div>
                                <div class="date_right">
                                    <label class="label_check ml5"><input type="checkbox" id="sInstantCust" class="form_check" data-type="checkbox"/><spring:message code="par.lbl.instantCust" /></label>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.saleType" /><!-- 판매유형 --></th>
                        <td>
                            <input id="sSaleTp" type="text" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.parSaleOrdNo" /><!-- 판매오더번호 --></th>
                        <td>
                            <input id="sParSaleOrdNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <input id="sOrdStatCd" type="text" data-type="multicombo" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.custNm" /><!-- 고객 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sCustNm" class="form_input" />
                                <input type="text" id="sCustCd" class="form_input hidden" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giDt" /><!-- 출고일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sOrdDtFr" class="form_datepicker" data-type="maskDate">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sOrdDtTo" class="form_datepicker" data-type="maskDate">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.prsNm" /><!-- 담당자 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sSaId" class="form_input hidden" />
                                <input type="text" id="sSaNm" class="form_input"/>
                                <a id="searchSaId"><!-- 검색 --></a>
                            </div>
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
                  <li class="k-state-active"><spring:message code="par.title.partSaleSum" /><!-- 부품판매집계 --></li>
                  <li><spring:message code="par.title.partSaleSumListDetail" /><!-- 부품판매명세 --></li>
              </ul>
              <div>
                  <!-- 판매오더헤더정보  -->
                  <div class="table_grid">
                      <div id="grid" class="grid"></div>
                  </div>
                  <!-- 판매오더헤더정보  -->
              </div>
              <div>
                  <!-- 판매오더디테일정보  -->
                  <div class="table_grid">
                      <div id="gridDetail"></div>
                  </div>
                  <!-- 판매오더디테일정보  -->
              </div>
           </div>
        </div>
    </section>
    <!-- //부품판매오더 -->

<!-- script -->
<script>

        var toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            custTpList          = [],
            custTpObj           = {},
            ordStatCdList       = [],
            ordStatCdObj        = {},
            saleTpList          = [],
            saleTpObj           = {},
            itemDstinCdObj      = {},
            unitCdObj           = {},
            giStrgeTpObj        = {},
            locationObj         = {},
            locationListObj     = {},
            prcTpObj            = {},
            popupWindow,
            changeSaleTp,
            changeCustTp,
            changePrcTp,
            changeUnitCd,
            changeItemDstinCd,
            userSearchPopupWin;



        custTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        custTpObj[' '] = "";
        <c:forEach var="obj" items="${custTpList}" varStatus="status">
            custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            custTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        ordStatCdList.push({"cmmCd":" ", "cmmCdNm":"选择取消", "useYn":""});
        <c:forEach var="obj" items="${ordStatCdList}" varStatus="status">

            ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        saleTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        saleTpObj[' '] = "";
        <c:forEach var="obj" items="${saleTpList}" varStatus="status">
            saleTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            saleTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        itemDstinCdObj[' '] = "";
        <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
            itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        unitCdObj[' '] = "";
        <c:forEach var="obj" items="${unitCdList}" varStatus="status">
            unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        locationObj[' '] = "";
        custTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${custTpList}" varStatus="status">
            custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:forEach>

        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        giStrgeTpObj[' '] = "";
        <c:forEach var="obj" items="${storageList}" varStatus="status">
            giStrgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
        </c:forEach>

        function fn_linkPartsSale(pPartsSale){
                parent._addTabMenu('<spring:message code="par.menu.partMarPrcSale" />'
                        ,"<c:url value='/par/ism/issue/selectPartsSaleOrdMain.do?pParSalesOrdNo="+pPartsSale+"'/>");
        }

    $(document).ready(function() {

        //고객유형선택
        $("#sCustTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custTpList
            ,index:0
        });

        //오더상태선택
        $("#sOrdStatCd").kendoExtMultiSelectDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:ordStatCdList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,select:function(e){
                var selectOrdStatCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectOrdStatCd)){
                    $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
                }

            }
        });

        //판매유형
        $("#sSaleTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:saleTpList
            ,index:0
        });

        $("#sOrdDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sOrdDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#searchSaId").on('click', userSearchPopup);

        $("#searchCustCd").on('click', custSearchPopup);

        $("#sCustTp").on('change', fnChangeCustTp);

        $("#sInstantCust").on('change', fnChangeIntantCust);

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



        // 부품판매 헤더 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0826-152501"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectPartsSaleOrds.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sOrdStatCdLst = $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

                            if(dms.string.isEmpty(sOrdStatCdLst[0])){

                                sOrdStatCdLst.splice(0,1);
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 부품판매 검색조건 코드.
                            params["sCustTp"]            = $("#sCustTp").data("kendoExtDropDownList").value();
                            params["sParSaleOrdNo"]      = $("#sParSaleOrdNo").val();
                            params["sOrdStatLst"]        = sOrdStatCdLst;
                            params["sSaleTp"]            = $("#sSaleTp").data("kendoExtDropDownList").value();
                            params["sCustCd"]            = $("#sCustCd").val();
                            params["sCustNm"]            = $("#sCustNm").val();
                            params["sSaNm"]              = $("#sSaNm").val();
                            params["sOrdDtFr"]           = $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sOrdDtTo"]           = $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value();

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
                       id:"parSaleOrdNo"
                      ,fields:{
                            dlrCd         :{ type:"string"}
                          , ordStatCd     :{ type:"string"}
                          , ordDt         :{ type:"date"  }
                          , saleTp        :{ type:"string"}
                          , custTp        :{ type:"string"}
                          , custCd        :{ type:"string"}
                          , custNm        :{ type:"string"}
                          , parSaleOrdNo  :{ type:"string"}
                          , saId          :{ type:"string"}
                          , saNm          :{ type:"string"}
                          , remark        :{ type:"string"}
                          , dcBefTotAmt   :{ type:"number"}
                          , dcAmt         :{ type:"number"}
                          , totAmt        :{ type:"number"}
                          , dcRate        :{ type:"number"}
                        }
                    }
                }
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , editable   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , pageable:{
                refresh:false
               ,pageSize:100
               ,buttonCount:3
               ,input:false
             }
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                 ,{field:"ordStatCd"
                      ,title:"<spring:message code='par.lbl.statNm' />"
                      ,attributes:{ "style":"text-align:center"}
                      ,width:100
                      ,template:function(dataItem){

                          var spanObj = "";

                          switch(dataItem.ordStatCd)
                          {
                              case "02":// 완료

                                  spanObj = "<span class='txt_label bg_blue'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "03":// 취소

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "04":// 정산

                                  spanObj = "<span class='txt_label bg_yellow'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "05":// 수납

                                  spanObj = "<span class='txt_label bg_orange'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "07":// 반품

                                  spanObj = "<span class='txt_label bg_green'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              default: // 등록

                                  spanObj = "<span class='txt_label bg_gray'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;
                          }

                          return spanObj;
                      }
                 }                //상태
                 ,{field:"ordDt"
                      ,title:"<spring:message code='par.lbl.orderDt' />"
                      ,attributes:{ "style":"text-align:right"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "style":"text-align:center"}
                      ,width:90 }                //오더일
                 ,{field:"saleTp"
                      ,title:"<spring:message code='par.lbl.saleType' />"
                      ,template:'#= changeSaleTp(saleTp)#'
                      ,attributes:{ "style":"text-align:center"}
                      ,width:140 }                //판매유형
                 ,{field:"custTp"
                      ,title:"<spring:message code='par.lbl.custTp' />"
                      ,template:'#= changeCustTp(custTp)#'
                      ,attributes:{ "style":"text-align:center"}
                      ,width:140 }                //고객유형
                 ,{field:"custCd"
                      ,title:"<spring:message code='par.lbl.custNm' />"
                      ,width:105
                      ,hidden:true}  //고객 코드
                 ,{field:"custNm"
                      ,title:"<spring:message code='par.lbl.custNm' />"
                      ,width:140 }  //고객명
                 ,{field:"parSaleOrdNo"
                      ,title:"<spring:message code='par.lbl.parSaleOrdNo' />"
                      ,template:function(dataItem){
                          var spanObj = "";
                              spanObj = "<a class='k-link' onclick=\"fn_linkPartsSale('" + dataItem.parSaleOrdNo + "'); \">"+dataItem.parSaleOrdNo+"</a>";

                          return spanObj;
                     }
                      ,width:130 }                //부품판매오더번호
                 ,{field:"saId"
                      ,title:"<spring:message code='par.lbl.prsNm' />"
                      ,width:105
                      ,hidden:true}  //담당자 코드
                 ,{field:"saNm"
                      ,title:"<spring:message code='par.lbl.prsNm' />"
                      ,width:140 }  //담당자명
                 ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.remark' />"
                     ,width:220
                  }      //비고
            ]
        });

        // 구매 명세 그리드
        $("#gridDetail").kendoExtGrid({
            gridId:"G-PAR-0826-152502"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectPartsSaleOrdItemByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sOrdStatCdLst = $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

                            if(dms.string.isEmpty(sOrdStatCdLst[0])){

                                sOrdStatCdLst.splice(0,1);
                            }
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            // 부품판매 검색조건 코드.
                            params["sCustTp"]            = $("#sCustTp").data("kendoExtDropDownList").value();
                            params["sParSaleOrdNo"]      = $("#sParSaleOrdNo").val();
                            params["sOrdStatLst"]        = sOrdStatCdLst;
                            params["sSaleTp"]            = $("#sSaleTp").data("kendoExtDropDownList").value();
                            params["sCustCd"]            = $("#sCustCd").val();
                            params["sCustNm"]            = $("#sCustNm").val();
                            params["sSaNm"]              = $("#sSaNm").val();
                            params["sOrdDtFr"]           = $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sOrdDtTo"]           = $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value();

                            return kendo.stringify(params);
                        }
                    }
                }
                ,schema:{
                    data:function (result){
                        var dataLen  = result.data.length,
                            itemList = [];

                        return result.data;
                    }
                    ,total:"total"
                    ,model:{
                       id:"parSaleOrdNo"
                      ,fields:{
                        parSaleOrdNo      :{ type:"string" }
                      , parSaleOrdLineNo  :{ type:"number" }
                      , saleTp            :{ type:"string" }
                      , itemDstinCd       :{ type:"string" } //품목구분
                      , itemCd            :{ type:"string" }
                      , itemNm            :{ type:"string" }
                      , unitCd            :{ type:"string" }
                      , ordQty            :{ type:"number" }
                      , cancQty           :{ type:"number" }
                      , returnQty         :{ type:"number" }
                      , prcTp             :{ type:"string" }
                      , prc               :{ type:"number" }
                      , amt               :{ type:"number" }
                      , taxAmt            :{ type:"number" }
                      , taxDdctAmt        :{ type:"number" }
                      , dcRate            :{ type:"number" }
                      , avlbStockQty      :{ type:"number" }
                      , salePrsnId        :{ type:"string" }
                      , salePrsnNm        :{ type:"string" }
                      , giDt              :{ type:"date"   }
                      , giTime            :{ type:"string" }
                      , cancId            :{ type:"string" }
                      , cancNm            :{ type:"string" }
                      , cancDt            :{ type:"date"   }
                      , cancTime          :{ type:"string" }
                      , returnId          :{ type:"string" }
                      , returnNm          :{ type:"string" }
                      , returnDt          :{ type:"date"   }
                      , returnTime        :{ type:"string" }
                        }
                    }
                }
            }
            , selectable:"row"
            , scrollable :true
            , autoBind   :false
            , editable   :false
            , pageable:{
                refresh:false
               ,pageSize:100
               ,buttonCount:3
               ,input:false
             }
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , columns:[
                 {   //판매현황번호
                      title:"<spring:message code='par.lbl.parSaleOrdNo' />"
                     ,field:"parSaleOrdNo"
                     ,width:120
                  }
                , {   //Line
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"parSaleOrdLineNo"
                     ,width:30
                  }
                , {   //판매유형
                      title     :"<spring:message code='par.lbl.saleType'  />"
                     ,field     :"saleTp"
                     ,width     :80
                     ,template  :'#= changeSaleTp(saleTp)#'
                     ,attributes:{ "style":"text-align:left"}
                  }
                , {   //품목구분
                      title     :"<spring:message code='par.lbl.itemDstinCd'  />"
                     ,field     :"itemDstinCd"
                     ,width     :80
                     ,template  :'#= changeItemDstinCd(itemDstinCd)#'
                     ,attributes:{ "style":"text-align:left"}
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"itemCd"
                     ,width:140
                  }
                , {   //부품명
                      title:"<spring:message code='par.lbl.itemNm' />"
                     ,field:"itemNm"
                     ,width:200
                  }
                , {   //수량
                      title:"<spring:message code='par.lbl.giQty' />"
                     ,field:"ordQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                  }
                , {   //단위
                      title:"<spring:message code='par.lbl.unitNm' />"
                     ,field:"unitCd"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changeUnitCd(unitCd)#'
                     ,hidden:true
                  }
                , {   //단가유형
                      title:"<spring:message code='par.lbl.prcTp' />"
                     ,field:"prcTp"
                     ,width:80
                     ,attributes:{ "style":"text-align:center"}
                     ,template:'#= changePrcTp(prcTp)#'
                     ,hidden:true
                  }
                , {   //단가
                      title:"<spring:message code='par.lbl.salePrice' />"
                     ,field:"prc"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }
                , {   //D/C Rate
                      title:"<spring:message code='par.lbl.dcRate' />"
                     ,field:"dcRate"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }
                , {   //금액(세금제외)
                      title:"<spring:message code='par.lbl.amtTax' />"
                     ,field:"taxDdctAmt"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }
                , {   //금액
                      title:"<spring:message code='par.lbl.amt' />"
                     ,field:"amt"
                     ,width:120
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }
                , {   //세액
                      title:"<spring:message code='par.lbl.vatAmt' />"
                     ,field:"taxAmt"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,hidden:true
                  }
                , {   //가용수량
                      title:"<spring:message code='par.lbl.avlbStockQty' />"
                     ,field:"avlbStockQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                  }
                , {   //출고창고
                      title:"<spring:message code='par.lbl.giStrgeCd' />"
                     ,field:"giStrgeCd"
                     ,width:100
                     ,template:'#= changeStrgeCd(giStrgeCd)#'
                     ,sortable:false
                  }
                , {   //로케이션
                      title:"<spring:message code='par.lbl.locationCd' />"
                     ,field:"giLocCd"
                     ,width:140
                     ,sortable:false
                  }
                , {   //수령인
                      title:"<spring:message code='par.lbl.receiveId' />"
                     ,field:"receiveId"
                     ,width:80
                     ,hidden:true
                  }
                 ,{   title:"<spring:message code='par.lbl.receiveDt'/>"
                     ,field:"receiveDt"
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,width:80
                     ,hidden:true
                  }
                 ,{
                      title:"<spring:message code='par.lbl.receiveTime' />"
                     ,field:"receiveTime"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80
                     ,hidden:true
                  }
                , {   //취소수량
                      title:"<spring:message code='global.lbl.cancQty' />"
                     ,field:"cancQty"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                  }
                , {   //취소일자
                      title:"<spring:message code='global.lbl.cancDt' />"
                     ,field:"cancDt"
                     ,width:90
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                  }
                , {   //취소시간
                      title:"<spring:message code='par.lbl.cancTime' />"
                     ,field:"cancTime"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80
                  }
                , {   //취소인
                      title:"<spring:message code='par.lbl.cancer' />"
                     ,field:"cancId"
                     ,width:80
                     ,hidden:true
                  }
                , {   //취소인
                      title:"<spring:message code='par.lbl.cancer' />"
                     ,field:"cancNm"
                     ,width:80
                  }
                , {   //반품수량
                      title:"<spring:message code='par.lbl.returnPartsQty' />"
                     ,field:"returnQty"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                  }
                , {   //기반품수량
                      title:"<spring:message code='par.lbl.preReturnPartsQty' />"
                     ,field:"preReturnQty"
                     ,width:80
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                  }
                , {   //반품일
                      title:"<spring:message code='par.lbl.returnDt' />"
                     ,field:"returnDt"
                     ,width:90
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                  }
                , {   //반품시간
                      title:"<spring:message code='par.lbl.returnTime' />"
                     ,field:"returnTime"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80
                  }
                , {   //반품인
                      title:"<spring:message code='par.lbl.returner' />"
                     ,field:"returnId"
                     ,width:80
                     ,hidden:true
                  }
                , {   //반품인
                      title:"<spring:message code='par.lbl.returner' />"
                     ,field:"returnNm"
                     ,width:80
                  }
            ]
        });

        // 가격유형
        changePrcTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = prcTpObj[val];
            }
            return returnVal;
        };

         //  판매유형
         changeSaleTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = saleTpObj[val];
             }
             return returnVal;
         };

         // 고객유형
         changeCustTp = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = custTpObj[val];
             }
             return returnVal;
         };

          // 부품유형
         changeItemDstinCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = itemDstinCdObj[val];
             }
             return returnVal;
         };

         // 단위
         changeUnitCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = unitCdObj[val];
             }
             return returnVal;
         };


        // 창고
         changeStrgeCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = giStrgeTpObj[val];
             }
             return returnVal;
         };

         // 로케이션
         changeGiLocCd = function(giLocCd){
             var returnVal = "";
             if(giLocCd != null && giLocCd != ""){
                 returnVal = locationObj[giLocCd];
             }
             return returnVal;
         };

        initPage();
    });

    function fnChangeCustTp(e){
        $('#sCustCd').val('');
        $('#sCustNm').val('');
        fnInstantCustChk(false);
    }

    function fnChangeIntantCust(e){
        fnInstantCustChk($('#sInstantCust').prop("checked"));
    }

    function fnInstantCustChk(pCheck){
        if(pCheck === true){
            $('#sCustCd').val('guest');
            $('#sCustNm').val('');
            $("#sCustTp").data("kendoExtDropDownList").value('01');
        }else{
            $('#sInstantCust').prop("checked",false);
            $('#sCustCd').val('');
            $('#sCustNm').val('');
        }
    }

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

       frYY = minDate.getFullYear();
       frMM = minDate.getMonth();
       frDD = minDate.getDate();

       toYY = maxDate.getFullYear();
       toMM = maxDate.getMonth();
       toDD = maxDate.getDate();
       $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
       $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value(toDt);

       $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
       $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

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
          if(id === 'sOrdDtFr'){
              var minDate = new Date(sevenDtBf);
              frYY = minDate.getFullYear();
              frMM = minDate.getMonth();
              frDD = minDate.getDate();
              $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value('');
              $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sOrdDtTo'){
              var maxDate = new Date(toDt);
              toYY = maxDate.getFullYear();
              toMM = maxDate.getMonth();
              toDD = maxDate.getDate();

              $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value('');
              $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
      }else{
          if(id === 'sOrdDtFr'){
              frYY = this.value().getFullYear();
              frMM = this.value().getMonth();
              frDD = this.value().getDate();
              $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sOrdDtTo'){
              toYY = this.value().getFullYear();
              toMM = this.value().getMonth();
              toDD = this.value().getDate();
              $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
      }


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
                            $("#sSaId").val(data[0].usrId);
                            $("#sSaNm").val(data[0].usrNm);

                        }
                       // userSearchPopupWin.close();
                    }
                }
            }

        });
    }

    function custSearchPopup() {
        if(dms.string.isEmpty($("#sCustTp").data("kendoExtDropDownList").value())){
            //고객유형은 필수 입력 사항입니다.
            dms.notification.warning("<spring:message code='par.lbl.custTp' var='custTp' /><spring:message code='global.info.required.field' arguments='${custTp}'/>");
            return false;
        }

        if($("#sCustTp").data("kendoExtDropDownList").value() === '01'){
            selectCustSearchPopupWindow();
        }else if($("#sCustTp").data("kendoExtDropDownList").value() === '02'){
            selectVenderMasterPopupWindow();
        }
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
                    ,"callbackFunc":function(data){
                        $("#sCustCd").val(data[0].bpCd);
                        $("#sCustNm").val(data[0].bpNm);
                        venderSearchPopupWin.close();
                    }
                }
            }
        });
    }

    function selectCustSearchPopupWindow(){

        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='par.title.custSearch' />"   // 고객 조회
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {

                            $("#sCustCd").val(data[0].custNo);
                            $("#sCustNm").val(data[0].custNm);

                        }
                    }
                }
            }
        });
    }
</script>
<!-- //script -->

