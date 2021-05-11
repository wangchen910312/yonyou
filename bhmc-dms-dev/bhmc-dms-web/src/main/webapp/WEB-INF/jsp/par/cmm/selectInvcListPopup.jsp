<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 송장리스트 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:20%;">
                    <col style="width:10%;">
                    <col style="width:20%;">
                    <col style="width:10%;">
                    <col style="width:30%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.invcTp" /><!-- 송장유형 --></th>
                        <td>
                            <input id="sInvcTp" class="form_comboBox" data-type="combo"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDocNo" /><!-- 송장번호 --></th>
                        <td>
                            <input id="sMobisInvcNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcDt" /><!-- INVOICE일자 --></th>
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
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sBpCd" name="sBpCd" class="form_input hidden" required data-name="<spring:message code="par.lbl.bpCd" />" />
                                <input type="text" id="sBpNm" class="form_input form_readonly" readonly/>
                                <input id="sBpNm" name="sBpTp" class="form_input hidden"  data-type="combo" required data-name="<spring:message code="par.lbl.custTp" />" />
                                <a id="searchCustCd"><!-- 검색 --></a>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.invcStatCd" /><!-- 송장상태 --></th>
                        <td class="readonly_area">
                            <input id="sInvcStatCd" class="form_comboBox form_readonly" readonly type="text" data-type="combo"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.regDt" /><!-- 등록일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegDtFr" data-type="maskDate" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegDtTo" data-type="maskDate" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="grid"></div>
        <!-- 그리드1 -->
        </div>
    </section>
    <!-- //송장리스트 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options             = parent.invcListPopupWindow.options.content.data,
             toDt                = "${toDt}",
             sevenDtBf           = "${sevenDtBf}",
             invcTpList          = [],
             invcTpObj           = {},
             invcStatList        = [],
             invcStatObj         = {},
             vatCdObj            = {},
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             rowNumber           = 0, //그리드 목록 번호
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD,
             pItemDstinCd        = options.itemDstinCd;

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

         <c:forEach var="obj" items="${vatCdList}" varStatus="status">
             vatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });


        /************************************************************
                    기능버튼 설정
        *************************************************************/


        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                if(rows !== null){
                    var data = [];

                    if(rows.length < 1){
                        dms.notification.warning("<spring:message code='global.info.unselected' />");
                        return false;
                    }
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                }
            }
        });


      //송장유형선택
        $("#sInvcTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:invcTpList
            ,index:0
        });

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

        $("#sRegDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sRegDtTo").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });



        /************************************************************
                    조회조건 설정
        *************************************************************/
        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        // 조회조건 설정
        $("#sBpCd").val(options.bpCd);
        $("#sBpNm").val(options.bpNm);
        $("#sInvcStatCd").data("kendoExtDropDownList").value(options.invcStatCd);
        $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));



        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0803-144501"
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
                            params["sInvcTp"]             = $("#sInvcTp").data("kendoExtDropDownList").value();
                            params["sInvcDtFr"]           = $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sInvcDtTo"]           = $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtFr"]            = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"]            = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sInvcStatCd"]         = $("#sInvcStatCd").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"]        = pItemDstinCd;


                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
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
                            , invcAmtCur     :{ type:"number"}
                            , purcIncTaxAmt  :{ type:"number"}
                            , invcTotalLine  :{ type:"number"}
                            , invcSumQt      :{ type:"number"}
                            , invcCseCnt     :{ type:"number"}
                            , invcTspCode    :{ type:"string"}
                            , arrvDt         :{ type:"date"  }
                            , confirmDt      :{ type:"date"  }
                            , remark         :{ type:"string"}
                            , ifYn           :{ type:"string"}
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,pageable:false
            ,height:280
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            //,multiSelectWithCheckbox:true
            , columns:[
                 {   //딜러코드
                     title:"<spring:message code='par.lbl.dlrCd' />"
                    ,field:"dlrCd"
                    ,width:80
                    ,hidden:true
                 }
               , {   //송장번호
                     title:"<spring:message code='par.lbl.invcDocNo' />"
                    ,field:"invcDocNo"
                    ,width:100
                    ,hidden:true
                 }
               , {   //인터페이스여부
                     title:"<spring:message code='par.lbl.ifYn' />"
                    ,field:"ifYn"
                    ,width:100
                    ,hidden:true
                 }
               , {
                     field:"mobisInvcNo"
                    ,title:"<spring:message code='par.lbl.invcDocNo' />"
                    ,width:160}//송장번호
               , {   //송장일자
                     title:"<spring:message code='par.lbl.invcDt' />"
                    ,field:"invcDt"
                    ,width:90
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "class":"ac"}
                 }
               , {   //송장상태
                     title:"<spring:message code='par.lbl.invcStatCd' />"
                    ,field:"invcStatCd"
                    ,width:80
                    ,attributes:{ "class":"ac"}
                    ,template:'#= changeInvcStat(invcStatCd)#'
                 }
               , {   //거래처 코드
                     title:"<spring:message code='par.lbl.bpCd' />"
                    ,field:"bpCd"
                    ,width:105
                    ,hidden:true
                 }
               , {   //공급업체
                     title:"<spring:message code='par.lbl.bpCd' />"
                    ,field:"bpNm"
                    ,width:120
                 }
                ,{
                     field:"trsfTp"
                    ,title:"<spring:message code='par.lbl.trsfTp' />"
                    ,attributes:{ "class":"ac"}
                    ,width:120
                   //,template:'#= changeTrsfTp(trsfTp)#'
                 }//운송유형
                 ,{field:"invcTspCode", title:"<spring:message code='par.lbl.logisticsCmpn' />" ,width:120}//물류회사
                 ,{field:"invcCseCnt", title:"<spring:message code='par.lbl.boxNo' />" ,attributes:{ "class":"ar"} ,width:120}//Box수량
                 ,{field:"invcTotalLine", title:"<spring:message code='par.lbl.parCnt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//부품건수
                 ,{field:"invcSumQt", title:"<spring:message code='par.lbl.itemQty' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//부품수량
                 ,{field:"invcAmtCur", title:"<spring:message code='par.lbl.purcAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액(세금제외)
                 ,{field:"purcIncTaxAmt", title:"<spring:message code='par.lbl.purcIncTaxAmt' />" ,width:120 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//구매금액
                 ,{field:"trsfAmt", title:"<spring:message code='par.lbl.trsfAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//운송비
                 ,{field:"incAmt", title:"<spring:message code='par.lbl.incAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//보험비
                 ,{field:"invcTotAmt", title:"<spring:message code='par.lbl.invcAmt' />" ,width:90 ,attributes:{ "class":"ar"} ,format:"{0:n2}" ,decimals:2}//송장금액
                 ,{field:"confirmDt", title:"<spring:message code='par.lbl.confirmDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"}}//확정일자
                 ,{field:"arrvDt", title:"<spring:message code='par.lbl.arrvDt' />" ,width:90 ,format:"{0:<dms:configValue code='dateTimeFormat' />}" ,attributes:{ "class":"ac"}, hidden:true}//도착일자
               , {   //송장유형
                     title:"<spring:message code='par.lbl.invcTp' />"
                    ,field:"invcTp"
                    ,template:'#= changeInvcTp(invcTp)#'
                    ,attributes:{ "class":"ac"}
                    ,width:120
                    ,hidden:true
                 }
               , {   //등록일
                     title:"<spring:message code='par.lbl.regDt' />"
                    ,field:"regDt"
                    ,width:90
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "class":"ac"}
                    ,hidden:true
                 }
               , {   //센터 코드
                     title:"<spring:message code='par.lbl.pltCd' />"
                    ,field:"pltCd"
                    ,width:105
                    ,hidden:true
                 }
               , {   //센터명
                     title:"<spring:message code='par.lbl.pltNm' />"
                    ,field:"pltNm"
                    ,width:120
                    ,hidden:true
                 }
               , {   //세금코드
                     title:"<spring:message code='par.lbl.vatCd' />"
                    ,field:"vatCd"
                    ,width:80
                    ,attributes:{ "class":"ac"}
                    ,template:'#= changeVatCd(vatCd)#'
                    ,editable:false
                    ,hidden:true
                 }
               , {   //세액
                     title:"<spring:message code='par.lbl.vatAmt' />"
                    ,field:"vatAmt"
                    ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,hidden:true
                 }
               , {   //금액
                     title:"<spring:message code='par.lbl.amt' />"
                    ,field:"invcTotAmt"
                    ,width:90
                    ,attributes:{ "class":"ar"}
                    ,format:"{0:n2}"
                    ,hidden:true
                 }
               , {   //비고
                     title:"<spring:message code='par.lbl.remark' />"
                    ,field:"remark"
                    ,width:140
                    ,hidden:true
                 }
           ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //  송장유형
        changeInvcTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = invcTpObj[val];
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
                }else if(id === 'sInvcDtFr'){
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
                }else if(id === 'sInvcDtFr'){
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

       // $("#grid").data("kendoExtGrid").dataSource.read();
    });

 </script>

