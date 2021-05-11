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
                <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
            </div>
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
            </div>
        </div>

        <div class="table_form form_width_70per" role="search" data-btnid="btnSearch" id="searchForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col style="width:10%;">
                    <col style="width:18%;">
                    <col style="width:10%;">
                    <col style="width:14%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invcTp" /><!-- 송장유형 --></th>
                        <td>
                            <input id="sInvcTp" class="form_comboBox" data-type="combo" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="sMobisInvcNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDt" /><!-- 송장일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sInvcDtFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sInvcDtTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcStatCd" /><!-- 송장상태 --></th>
                        <td>
                            <input id="sInvcStatCd" class="form_comboBox" type="text" data-type="combo"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpTp" /><!-- 거래처코드 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sBpCd" name="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <input type="text" id="sBpNm" class="form_input form_readonly" readonly/>
                                <input id="sBpNm" name="sBpTp" class="form_input hidden"  data-type="combo" required data-name="<spring:message code="par.lbl.custTp" />" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.confirmDt" /><!--확정일자  --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sConfirmDtFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sConfirmDtTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
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

        dlPdcCdList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
        <c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
            dlPdcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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

        <c:forEach var="obj" items="${purcOrdTpList}" varStatus="status">
            purcOrdTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

        <c:forEach var="obj" items="${dlPdcCdList}" varStatus="status">
            dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
        </c:forEach>

    $(document).ready(function() {


        //송장상태선택
        $("#sInvcStatCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcStatList
            ,index:0
        });


        $("#sInvcDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sInvcDtTo").kendoExtMaskedDatePicker({
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
        $("#sInvcTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcTpList
            ,index:0
        });


        $("#searchCustCd").on('click', selectVenderMasterPopupWindow);
        $("#searchItemCd").on('click', selectPartsMasterPopupWindow);

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
         // 배송PDC
         changeDlPdcCd = function(val){
             var returnVal = "";
             if(val != null && val != ""){
                 returnVal = dlPdcCdObj[val];
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
            gridId:"G-PAR-0519-190901"
            ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/invc/selectInvcItems.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};


                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;


                            // 송장 검색조건 코드.
                            params["sBpCd"]               = $("#sBpCd").val();
                            params["sMobisInvcNo"]        = $("#sMobisInvcNo").val();
                            params["sInvcDtFr"]           = $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sInvcDtTo"]           = $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sConfirmDtFr"]        = $("#sConfirmDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sConfirmDtTo"]        = $("#sConfirmDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sInvcStatCd"]         = $("#sInvcStatCd").data("kendoExtDropDownList").value();
                            params["sInvcTp"]             = $("#sInvcTp").data("kendoExtDropDownList").value();
                            params["sItemCd"]             = $("#sItemCd").val();
                            params["sItemNm"]             = $("#sItemNm").val();

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
                            , invcDocNo      :{ type:"string"}
                            , invcTp         :{ type:"string"}
                            , invcStatCd     :{ type:"string"}
                            , regDt          :{ type:"date"  }
                            , invcDt         :{ type:"date"  }
                            , pltCd          :{ type:"string"}
                            , pltNm          :{ type:"string"}
                            , bpCd           :{ type:"string"}
                            , bpNm           :{ type:"string"}
                            , mobisInvcNo    :{ type:"string"}
                            , vatCd          :{ type:"string"}
                            , purcOrdStatCd  :{ type:"string"}
                            , purcOrdNo      :{ type:"string"}
                            , vatAmt         :{ type:"number"}
                            , invcTotAmt     :{ type:"number"}
                            , itemCnt        :{ type:"number"}
                            , itemQty        :{ type:"number"}
                            , arrvDt         :{ type:"date"  }
                            , confirmDt      :{ type:"date"  }
                            , remark         :{ type:"string"}
                            , ifYn           :{ type:"string"}
                        }
                    }
                }
            }
            , selectable :"row"
            , change:function(e){
                var selectedItem = this.dataItem(this.select());

                if( selectedItem != null && selectedItem != 'undefined'){


                    $.ajax({
                        url:"<c:url value='/par/pcm/invc/selectInvcItemByKey.do' />",
                        data:JSON.stringify({ sInvcDocNo:selectedItem.invcDocNo}),
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
                {field:"invcTp" ,title:"<spring:message code='par.lbl.invcTp' />" ,attributes:{ "class":"ac"} ,width:120
                    ,template:'#= changeInvcTp(invcTp)#'
                }//송장유형
                ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.invcDocNo' />" ,width:140}//송장번호
                ,{field:"invcDt" ,title:"<spring:message code='par.lbl.invcDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//송장일자
                ,{field:"invcStatCd", title:"<spring:message code='par.lbl.invcStatCd' />" ,width:80 ,attributes:{ "class":"ac"}
                    ,template:'#= changeInvcStat(invcStatCd)#'
                }//송장상태
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.bpTp' />" ,width:120}//공급업체
                ,{field:"trsfTp" ,title:"<spring:message code='par.lbl.trsfTp' />" ,attributes:{ "class":"ac"} ,width:120
                     //,template:'#= changeTrsfTp(trsfTp)#'
                }//운송유형
                ,{field:"inrTspCode" ,title:"<spring:message code='par.lbl.logisticsCmpn' />" ,width:120}//물류회사
                ,{field:"inrInvCseCnt" ,title:"<spring:message code='par.lbl.boxNo' />" ,width:120}//Box수량
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.parCnt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//부품건수
                ,{field:"itemQty" ,title:"<spring:message code='par.lbl.itemQty' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//부품수량
                ,{field:"purcIncTaxAmt" ,title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액
                ,{field:"purcAmt" ,title:"<spring:message code='par.lbl.purcAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액(세금제외)
                ,{field:"vatAmt" ,title:"<spring:message code='par.lbl.vatAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//세액
                ,{field:"invcTotAmt" ,title:"<spring:message code='par.lbl.invcAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//송장금액
                ,{field:"confirmDt" ,title:"<spring:message code='par.lbl.confirmDt' />" ,width:80 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//확정일자
                ,{field:"arrvDt" ,title:"<spring:message code='par.lbl.arrvDt' />" ,width:80 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//도착일자
            ]
        });

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

        // 송장 그리드
        $("#gridCnfmInvc").kendoExtGrid({
            gridId:"G-PAR-0519-190701"
           ,dataSource:{
                  schema:{
                      data :"data"
                     ,total:"total"
                     ,model:{
                        id:"invcDocNo"
                       ,fields:{
                               dlrCd               :{ type:"string"}
                             , invcDocNo           :{ type:"string"}
                             , invcDocLineNo       :{ type:"number"}
                             , mobisInvcNo         :{ type:"string"}
                             , mobisInvcLineNo     :{ type:"number"}
                             , purcOrdNo           :{ type:"string"}
                             , purcOrdLineNo       :{ type:"string"}
                             , purcOrdLineDetlNo   :{ type:"string"}
                             , itemCd              :{ type:"string"}
                             , itemNm              :{ type:"string"}
                             , invcTotAmt          :{ type:"number"}
                             , invcPrc             :{ type:"number"}
                             , invcQty             :{ type:"number"}
                             , invcUnitCd          :{ type:"string"}
                             , invcAmt             :{ type:"number"}
                             , vatAmt              :{ type:"number"}
                             , dlPdcCd             :{ type:"string"}
                             , boxNo               :{ type:"string"}
                             , invcGrDt            :{ type:"date"}
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
                 {field:"purcOrdTp" ,title:"<spring:message code='par.lbl.purcOrdTp' />" ,attributes:{ "class":"ac"} ,width:120
                     ,template:'#= changePurcOrdTp(purcOrdTp)#'
                 }//오더유형
                ,{field:"purcReqDt" ,title:"<spring:message code='par.lbl.ordReqDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:90}//처리일자
                ,{field:"mobisInvcNo" ,title:"<spring:message code='par.lbl.invcDocNo' />" ,width:100}//모비스송장번호
                ,{field:"purcOrdNo" ,title:"<spring:message code='par.lbl.purcOrdNo' />" ,width:100 ,hidden:true}//구매오더번호
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.bpTp' />" ,width:140}//공급업체
                ,{field:"itemCd" ,title:"<spring:message code='par.lbl.itemCd' />" ,width:100}//부품번호
                ,{field:"itemNm" ,title:"<spring:message code='par.lbl.itemNm' />" ,width:200}//부품명
                ,{field:"invcPrc" ,title:"<spring:message code='par.lbl.purcBasePrc' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매단가
                ,{field:"taxDdctPrc" ,title:"<spring:message code='par.lbl.purcPriceTax' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매단가(세금제외)
                ,{field:"invcQty" ,title:"<spring:message code='par.lbl.sendQty' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2} //발송수량
                ,{field:"invcAmt" ,title:"<spring:message code='par.lbl.purcAmt' />" ,width:100 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액(세금제외)
                ,{field:"invcTotAmt" ,title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액
                ,{field:"dlPdcCd" ,title:"<spring:message code='par.lbl.dlPdcCd' />" ,attributes:{ "class":"ac"} ,width:140
                    ,template:'#= changeDlPdcCd(dlPdcCd)#'
                }//배송 PDC
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

     // 배송PDC
        changeDlPdcCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = dlPdcCdObj[val];
            }
            return returnVal;
        };



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

            $("#sBpCd").val(sessionBpCd);  //공급업체 기본셋팅
            $("#sBpNm").val(sessionBpNm);

            $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value(new Date(sevenDtBf));
            $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value(new Date(toDt));

            $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


            //$("#sInvcTp").data("kendoExtDropDownList").enable(false);
            //$("#sInvcStatCd").data("kendoExtDropDownList").enable(false);
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
               if(id === 'sInvcDtFr'){
                   var minDate = new Date(sevenDtBf);
                       frYY = minDate.getFullYear();
                       frMM = minDate.getMonth();
                       frDD = minDate.getDate();
                       $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                       $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sInvcDtTo'){
                   var maxDate = new Date(toDt);
                       toYY = maxDate.getFullYear();
                       toMM = maxDate.getMonth();
                       toDD = maxDate.getDate();

                       $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                       $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }else{
                   $("#" + id).data("kendoExtMaskedDatePicker").value(toDt);
               }
           }else{
               if(id === 'sInvcDtFr'){
                   frYY = this.value().getFullYear();
                   frMM = this.value().getMonth();
                   frDD = this.value().getDate();
                   $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
               }else if(id === 'sInvcDtTo'){
                   toYY = this.value().getFullYear();
                   toMM = this.value().getMonth();
                   toDD = this.value().getDate();
                   $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               }
           }
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
                            $("#bpCd").val(data[0].bpCd);
                            $("#bpNm").val(data[0].bpNm);
                            $("#sBpCd").val(data[0].bpCd);  //공급업체 기본셋팅
                            $("#sBpNm").val(data[0].bpNm);
                            $("#sBpTp").val(data[0].bpTp);
                            $("#gridRegInvc").data("kendoExtGrid").dataSource.data([]);
                            $("#gridCnfmInvc").data("kendoExtGrid").dataSource.data([]);

                            venderSearchPopupWin.close();
                        }
                    }
                }
            });
        }
        initPage();
    });
</script>
<!-- //script -->

