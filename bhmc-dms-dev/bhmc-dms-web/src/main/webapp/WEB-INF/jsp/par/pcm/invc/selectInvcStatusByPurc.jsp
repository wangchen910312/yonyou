<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

    <!-- 송장조회 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.invcRegStatus" /></h1> --%>
            <div class="btn_left">
			<dms:access viewId="VIEW-D-11664" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
			</dms:access>
            </div>
            <div class="btn_right">
			<dms:access viewId="VIEW-D-11663" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
			</dms:access>
            </div>
        </div>

        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" id="searchForm">
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
                        <th scope="row"><spring:message code="par.lbl.purcOrdTp" /><!-- 오더유형 --></th>
                        <td>
                            <input id="sPurcOrdTp" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                        <td>
                            <input id="sBmpOrdNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.dealer" /><spring:message code="par.lbl.sendDt" /><!-- 딜러전송일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sSendDtFr" class="form_datepicker" data-type="maskDate"/>
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sSendDtTo" class="form_datepicker" data-type="maskDate"/>
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.ordRegId" /><!-- 오더신청자 --></th>
                        <td>
                             <div class="form_search">
                                <input type="text" id="sRegUsrNm" class="form_input form_readonly" readonly/>
                                <input type="text" id="sRegUsrId" class="form_input hidden"/>
                                <a id="searchRegUsrId"><!-- 검색 --></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.sBpTp" /><!-- 거래처유형 --></th>
                        <td>
                            <input type="text" id="sBpTp" class="form_comboBox" data-type="combo" readonly/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcOrdStatCd" /><!-- 구매오더상태 --></th>
                        <td>
                            <input id="sPurcOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
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
        <div class="table_grid mt10">
            <!-- 송장등록 그리드 -->
            <div id="gridRegInvc" class="grid"></div>
        </div>
    </section>
    <!-- //송장등록정보 -->

    <!-- 송장확정정보 -->
    <section class="group">
        <div class="table_grid mt10">
            <div id="gridCnfmInvc" class="resizable_grid"></div>
        </div>
    </section>
</div>
    <!-- //송장정보 -->

<!-- script -->
<script>

        var sessionBpCd         = "${bpCd}",
            sessionBpNm         = "${bpNm}",
            sessionBpTp         = "${bpTp}",
            toDt                = "${toDt}",
            sevenDtBf           = "${sevenDtBf}",
            invcTpList          = [],
            purcOrdTpList       = [],
            purcOrdTpObj        = {},
            invcTpObj           = {},
            invcStatList        = [],
            invcStatObj         = {},
            invcUnitList        = [],
            invcUnitObj         = {},
            prcTpList           = [],
            prcTpObj            = {},
            grStrgeTpList       = [],
            dlPdcCdList         = [],
            dlPdcCdObj          = {},
            vatCdList           = [],
            vatCdObj            = {},
            trsfTpObj           = {},
            checkdIds           = {},
            dlPdcCdObj          = {},
            bpTpList            = [],
            purcOrdStatList     = [],
            purcOrdStatObj      = {},
            pdcObj              = {},
            changeDlPdcCd,
            searchItemPopupWindow,
            transObj;

        prcTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${prcTpList}" varStatus="status">
            prcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        invcTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${invcTpList}" varStatus="status">
            invcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            invcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        invcStatList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${invcStatList}" varStatus="status">
            invcStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            invcStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
            dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${invcUnit}" varStatus="status">
            invcUnitList.push({cmmCd:"${obj.unitExtCd}", cmmCdNm:"${obj.unitExtCd}"});
            invcUnitObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
        </c:forEach>

        <c:forEach var="obj" items="${storageList}" varStatus="status">
            grStrgeTpList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        </c:forEach>

        vatCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${vatCdList}" varStatus="status">
            vatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            vatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${trsfTpList}" varStatus="status">
            trsfTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        purcOrdTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
            purcOrdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
            dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        //purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        purcOrdStatList.push({"cmmCd":" ", "cmmCdNm":"选择取消"});
        <c:forEach var="obj" items="${purcOrdStatList}" varStatus="status">
            purcOrdStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            purcOrdStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        bpTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${bpTpList}" varStatus="status">
            if("01" === "${obj.remark2}"){
                bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            }
        </c:forEach>

    $(document).ready(function() {


        //송장상태선택
        /*
        $("#sPurcOrdStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcStatList
            ,index:0
        });*/


        $("#sSendDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sSendDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sConfirmDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sConfirmDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        //송장유형선택
        $("#sPurcOrdTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcTpList
            ,index:0
        });

      //거래처구분
        $("#sBpTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:bpTpList
            ,index:0
        });

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


        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);
        $("#searchRegUserId").on('click', userSearchPopup);

        // 조회 버튼
        $("#btnSearch").kendoButton({
            click:function(e){

                $("#gridRegInvc").data("kendoExtGrid").dataSource.read();
            }
        });
        // 초기화 버튼
        $("#btnInit").kendoButton({
            click:function(e){
                initPage();
            }
        });
        // 가격유형
        changePrcTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = prcTpObj[val];
            }
            return returnVal;
        };
         //단위
         changeInvcUnit = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = invcUnitObj[val];
             }
             return returnVal;
         };
         // 송장상태
         changeInvcStat = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = invcStatObj[val];
             }
             return returnVal;
         };

         // 세금코드
         changeVatCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = vatCdObj[val];
             }
             return returnVal;
         };
        // 송장등록 그리드
        $("#gridRegInvc").kendoExtGrid({
            gridId:"G-PAR-0926-180101"
            ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/purcOrd/selectPurcOrdStatusListByCondition.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sPurcOrdStatCdLst = $("#sPurcOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

                            if(dms.string.isEmpty(sPurcOrdStatCdLst[0])){

                                sPurcOrdStatCdLst.splice(0,1);
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;


                            // 송장 검색조건 코드.
                            params["sBpTp"]               = $("#sBpTp").data("kendoExtDropDownList").value();
                            params["sBmpOrdNo"]           = $("#sBmpOrdNo").val();
                            params["sSendDtFr"]           = $("#sSendDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sSendDtTo"]           = $("#sSendDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sPurcOrdStatLst"]     = sPurcOrdStatCdLst;
                            params["sPurcOrdTp"]          = $("#sPurcOrdTp").data("kendoExtDropDownList").value();
                            params["sItemCd"]             = $("#sItemCd").val();
                            params["sItemNm"]             = $("#sItemNm").val();
                            params["sDelYn"]              = 'Y'; //삭제된 구매오더 제외.

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
                       id:"invcDocNo"
                      ,fields:{
                              dlrCd          :{ type:"string"}
                            , bmpOrdNo       :{ type:"string"}
                            , purcOrdTp      :{ type:"string"}
                            , purcItemStatCd :{ type:"string"}
                            , sendDt         :{ type:"date"  }
                            , bpCd           :{ type:"string"}
                            , bpNm           :{ type:"string"}
                            , itemCd         :{ type:"string"}
                            , itemNm         :{ type:"string"}
                            , purcPrc        :{ type:"number"} //단가
                            , taxDdctPrc     :{ type:"number"} //단가
                            , bmpChkQty      :{ type:"number"}
                            , purcAmt        :{ type:"number"} //금액
                            , taxDdctAmt     :{ type:"number"} //금액
                            , purcOrdNo      :{ type:"string"}
                            , dlDistCd       :{ type:"string"}
                            , avlbStockQty   :{ type:"number", editable:false }
                            , borrowQty      :{ type:"number", editable:false }
                            , rentQty        :{ type:"number", editable:false }
                            , stockQty       :{ type:"number", editable:false }
                            , resvStockQty   :{ type:"number", editable:false }
                        }
                    }
                }
            }
            , selectable :"row"
            , change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){


                    $.ajax({
                        url:"<c:url value='/par/pcm/invc/selectInvcItemByPurcKey.do' />",
                        data:JSON.stringify({ sPurcOrdNo:selectedItem.purcOrdNo}),
                        type:"POST",
                        dataType:"json",
                        contentType:"application/json",
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }

                    }).done(function(result) {

                        var dataLen      = result.data.length,
                            gridData     = $("#gridCnfmInvc").data("kendoExtGrid"),
                            rows;

                            gridData.dataSource.data(result.data);

                    });
                }
             }
            , scrollable :true
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , height     :250
            , editable:false
            , columns:[
                {field:"purcOrdTp" ,title:"<spring:message code='par.lbl.purcOrdTp' />" ,attributes:{ "class":"ac"} ,width:140
                    ,template:'#= changePurcOrdTp(purcOrdTp)#'
                }//구매유형
                ,{//구매신청일자
                    field     :"sendDt"
                   ,title     :"<spring:message code='par.lbl.ordReqDt' />"
                   ,attributes:{"class":"ac"}
                   ,format    :"{0:<dms:configValue code='dateFormat' />}"
                   ,width     :90
                }
                ,{//bmp오더번호
                    field:"bmpOrdNo"
                   ,title:"<spring:message code='par.lbl.bmpOrdNo' />"
                   ,width:120
                }
                ,{//거래처 코드
                    field     :"bpCd"
                   ,title     :"<spring:message code='par.lbl.spyrCd' />"
                   ,width     :105
                   ,hidden    :true
                }
               ,{//공급업체
                   field      :"bpNm"
                  ,title      :"<spring:message code='par.lbl.spyrCd' />"
                  ,width      :140
                }
               ,{
                   title:"<spring:message code='par.lbl.itemCd'/>"//부품번호
                  ,field:"itemCd"
                  ,width:140
                }
               ,{
                   title:"<spring:message code='par.lbl.itemNm'/>"//부품명
                  ,field:"itemNm"
                  ,width:220
                 }
               ,{title:"<spring:message code='par.lbl.purcOrcPrice' />",field:"purcPrc" ,width:120 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}
               ,{title:"<spring:message code='par.lbl.purcPriceTax' />" ,field:"taxDdctPrc" ,width:120 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}
               ,{title:"<spring:message code='par.lbl.sendQty' />" ,field:"bmpChkQty" ,width:130 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}
               ,{title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,field:"purcAmt" ,width:130 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}
               ,{title:"<spring:message code='par.lbl.purcAmt' />" ,field:"taxDdctAmt" ,width:120 ,attributes:{ "style":"text-align:right"} ,format:"{0:n2}"}
               ,{field:"dlDistCd", title:"<spring:message code='par.lbl.dlPdcCd' />" ,width:80 ,attributes:{ "class":"ac"}
                    ,template:'#= changeDlPdcCd(dlDistCd)#'
                }//송장상태
               ,{title:"<spring:message code='par.lbl.strgeStockQty' />" ,field:"stockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//재고수량
               ,{title:"<spring:message code='par.lbl.avlbStockQty' />" ,field:"avlbStockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//가용수량
               ,{title:"<spring:message code='par.lbl.purcOrdResvQty' />" ,field:"resvStockQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//예약수량
               ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//대여수량
               ,{title:"<spring:message code='par.lbl.borrowQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimal:2}//차입수량
            ]
        });

       //오더유형
        changePurcOrdTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = purcOrdTpObj[val];
            }
            return returnVal;
        };

       //오더유형
        changeDlDistCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = purcOrdTpObj[val];
            }
            return returnVal;
        };

        //  송장유형
        changeInvcTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = invcTpObj[val];
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

       // 배송PDC
        changeDlPdcCd = function(val){
            var returnVal = "";
            if(!dms.string.isEmpty(val)){
                returnVal = dlPdcCdObj[val];
            }
            return returnVal;
        };

        // 송장 그리드
        $("#gridCnfmInvc").kendoExtGrid({
            gridId:"G-PAR-0926-180001"
           ,dataSource:{
                  schema:{
                      data :"data"
                     ,total:"total"
                     ,model:{
                        id:"invcDocNo"
                       ,fields:{
                               dlrCd            :{ type:"string"}
                             , invcTp           :{ type:"string"}
                             , mobisInvcNo      :{ type:"string"}
                             , trsfTp           :{ type:"string"}
                             , invcTspCode      :{ type:"string"}
                             , invcStatCd       :{ type:"string"}
                             , bpNm             :{ type:"string"}
                             , itemCnt          :{ type:"number"}
                             , itemQty          :{ type:"number"}
                             , purcAmt          :{ type:"number"}
                             , purcIncTaxAmt    :{ type:"number"}
                             , vatAmt           :{ type:"number"}
                             , trsfAmt          :{ type:"number"}
                             , incAmt           :{ type:"number"}
                             , invcTotAmt       :{ type:"number"}
                             , invcCseCnt       :{ type:"string"}
                             , invcDt           :{ type:"date"}
                             , arrvDt           :{ type:"date"}
                             , confirmDt        :{ type:"date"}
                         }
                     }
                 }
              }
             ,selectable :"multiple"
             ,scrollable :true
             ,autoBind   :false
             ,filterable:false
             ,appendEmptyColumn:true           //빈컬럼 적용. default:false
             ,height     :250
             ,pageable   :false
             ,sortable   :false
             ,editable   :false
             ,columns:[
                 {field:"invcTp" ,title:"<spring:message code='par.lbl.invcTp' />" ,attributes:{ "class":"ac"} ,width:120
                    ,template:'#= changeInvcTp(invcTp)#'
                 }//송장유형
                ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.mobisInvcNo' />" ,width:140}//모비스송장번호
                ,{field:"invcDt" ,title:"<spring:message code='par.lbl.invcDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:140}//송장일자
                ,{field:"invcStatCd", title:"<spring:message code='par.lbl.invcStatCd' />" ,width:80 ,attributes:{ "class":"ac"}
                    ,template:'#= changeInvcStat(invcStatCd)#'
                 }//송장상태
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.bpTp' />" ,width:140}//공급업체
                ,{field:"trsfTp" ,title:"<spring:message code='par.lbl.trsfTp' />" ,attributes:{ "class":"ac"} ,width:120
                    ,template:'#= changeTrsfTp(trsfTp)#'
                 }//운송유형
                ,{field:"invcTspCode" ,title:"<spring:message code='par.lbl.logisticsCmpn' />" ,width:140}//운송업치
                ,{field:"invcCseCnt" ,title:"<spring:message code='par.lbl.boxNo' />" ,attributes:{ "class":"ar"}  ,width:120}//Box수량
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.parCnt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//부품건수
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.itemQty' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//부품수량
                ,{field:"purcAmt" ,title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액(세금제외)
                ,{field:"purcIncTaxAmt" ,title:"<spring:message code='par.lbl.purcAmt' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액
                ,{field:"vatAmt" ,title:"<spring:message code='par.lbl.vatAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//세액
                ,{field:"trsfAmt" ,title:"<spring:message code='par.lbl.trsfAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//세액
                ,{field:"incAmt" ,title:"<spring:message code='par.lbl.incAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//세액
                ,{field:"invcTotAmt" ,title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액
                ,{field:"arrvDt" ,title:"<spring:message code='par.lbl.arrvDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:140}//도착일자
                ,{field:"confirmDt" ,title:"<spring:message code='par.lbl.confirmDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:140}//확정일자
            ]
        });

        //  오더유형
        changePurcOrdTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = purcOrdTpObj[val];
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

        if(this.value() !== null){
            if(id === 'sSendDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sSendDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sSendDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sSendDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
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

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        $("#gridRegInvc").data("kendoExtGrid").dataSource.data([]);
        $("#gridCnfmInvc").data("kendoExtGrid").dataSource.data([]);

        //천충 요청에 의해 날짜 디폴트값 제거. 신규 요청딜러에서 보이지 않기 때문. 수정일자 : 2018-01-26
        /* $("#sSendDtFr").data("kendoExtMaskedDatePicker").value(new Date(sevenDtBf));
        $("#sSendDtTo").data("kendoExtMaskedDatePicker").value(new Date(toDt)); */

        $("#sSendDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sSendDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        $("#sBpTp").data("kendoExtDropDownList").value('01');

        //$("#sPurcOrdTp").data("kendoExtDropDownList").enable(false);
        //$("#sPurcOrdStatCd").data("kendoExtDropDownList").enable(false);
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
                    ,"callbackFunc":function(data){
                        $("#sBpTp").data("kendoExtDropDownList").value(data[0].bpTp);
                        $("#gridRegInvc").data("kendoExtGrid").dataSource.data([]);
                        $("#gridCnfmInvc").data("kendoExtGrid").dataSource.data([]);

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
</script>
<!-- //script -->

