<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 이전 구매등록 팝업 -->
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
                    <col style="width:25%;">
                    <col style="width:10%;">
                    <col style="width:20%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></span></th>
                        <td>
                            <input id="sBpCd" readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpNm" /><!-- 거래처코드 --></span></th>
                        <td>
                            <input id="sBpNm" readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcReqTp" /><!-- 구매요청유형 --></th>
                        <td>
                            <input id="sPurcReqTp" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td>
                            <input id="sItemCd" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input id="sItemNm" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC CLASS --></th>
                        <td>
                            <input id="sAbcInd" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.purcReqDt" /><!-- 구매요청일 --></th>
                        <td>
                            <div class="form_float">
                            <div class="date_left">
                                <input id="sPurcReqStartDt" name="sPurcReqStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPurcReqEndDt" name="sPurcReqEndDt" class="form_datepicker" />
                            </div>
                        </div>
                        </td>
                        <th scope="row"></th>
                        <td>
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
    <!-- //부품선택 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options             = parent.purcReqPopupWindow.options.content.data,
             toDt                = "${toDt}",
             sevenDtBf           = "${sevenDtBf}",
             purcReqTpList       = [],
             purcReqTpObj        = {},
             abcIndList          = [],
             abcIndObj           = {},
             carlineCdList       = [],
             carlineCdObj        = {},
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD,
             pItemDstinCd        = options.itemDstinCd,
             pBpTp               = options.bpTp;

         <c:forEach var="obj" items="${purcReqTpList}" varStatus="status">
             purcReqTpList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
             purcReqTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         <c:forEach var="obj" items="${abcIndList}" varStatus="status">
             abcIndList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
             abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
             carlineCdList.push({itemCd:"${obj.carlineCd}", itemNm:"${obj.carlineNm}"});
             carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
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


        $("#sPurcReqTp").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:purcReqTpList
           ,optionLabel : "全部"
           ,index:0
       });

        $("#sAbcInd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:abcIndList
           ,optionLabel:" "
           ,index:0
       });

        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:carlineCdList
           ,optionLabel:" "
           ,index:0
       });

        $("#sPurcReqStartDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sPurcReqEndDt").kendoExtMaskedDatePicker({
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
        $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").value(toDt);

        $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));



        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0803-162802"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cmm/selectPurcReqsPop.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            //공급처가 BMP인 경우만 거래처정보를 검색조건으로 넘김(공급처가 BMP인 경우 BMP부품만 가져오기 위함.)
                            //로컬업체인 경우 공급처없는 경우도 있고 관계없음.
                            if(pBpTp === '01'){
                                params["sBpCd"]              = $("#sBpCd").val();
                            }
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            params["sPurcReqTp"]         = $("#sPurcReqTp").data("kendoExtDropDownList").value();
                            params["sPurcReqStartDt"]    = $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sPurcReqEndDt"]      = $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sAbcInd"]            = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]         = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            params["sItemDstinCd"]       = pItemDstinCd;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    , total:"total"
                    , model:{
                        id:"purcReqNo"
                        , fields:{
                              dlrCd         :{ type:"string" }
                            , bpCd          :{ type:"string" }
                            , bpNm          :{ type:"string" }
                            , purcReqTp     :{ type:"string" }
                            , purcReqNo     :{ type:"string" }
                            , purcReqLineNo :{ type:"number" }
                            , itemCd        :{ type:"string" }
                            , itemNm        :{ type:"string" }
                            , purcReqQty    :{ type:"number" }
                            , purcPrc       :{ type:"number" }
                            , purcAmt       :{ type:"number" }
                            , purcReqUnitCd :{ type:"string" }
                            , abcInd        :{ type:"string" }
                            , purcLeadHm    :{ type:"string" }
                            , carlineCd     :{ type:"string" }
                            , grStrgeCd     :{ type:"string" }
                            , purcReqDt     :{ type:"date"   }
                            , regUsrId      :{ type:"string" }
                            , regDt         :{ type:"date" }
                            , avlbStockQty  :{ type:"number" } //가용수량
                            , resvStockQty  :{ type:"number" } //예류수량
                            , stockQty      :{ type:"number" } //재고수량
                            , borrowQty     :{ type:"number" } //차입수량
                            , rentQty       :{ type:"number" } //차출수량
                            , parSpecCd     :{ type:"string" }
                            , sucCd         :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:"multiple"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,pageable:false
            ,height:280
            ,multiSelectWithCheckbox:true
            ,columns:[
                 {field:"dlrCd"
                     ,title:"<spring:message code='par.lbl.dlrCd' />"
                     ,width:105
                     ,hidden:true}  //딜러 코드
                ,{field:"bpCd"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:105
                     ,hidden:true}  //거래처 코드
                ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:140
                     ,hidden:true}  //공급업체
                ,{field:"grStrgeCd"
                     ,title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,width:140
                     ,hidden:true}  //입고창고
                ,{field:"purcReqTp"
                     ,title:"<spring:message code='par.lbl.purcReqTp' />"
                     ,template:'#= changePurcReqTp(purcReqTp)#'
                     ,width:100 }                //결품유형
                 ,{field:"regDt"
                     ,title:"<spring:message code='par.lbl.regDt' />"
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:100 }                //등록일
                ,{field:"itemCd"
                     ,title:"<spring:message code='par.lbl.itemCd' />"
                     ,width:120 }                //부품번호
                ,{field:"itemNm"
                     ,title:"<spring:message code='par.lbl.itemNm' />"
                     ,width:180 }                //부품명
                 ,{field:"purcReqQty"
                     ,title:"<spring:message code='par.lbl.qty' />"
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,width:90}                //구매요청수량
                 ,{field:"regUsrId"
                     ,title:"<spring:message code='par.lbl.regUsrId' />"
                     ,width:80 }                //등록자
                 ,{field:"purcReqNo"
                     ,title:"<spring:message code='par.lbl.regDocNo' />"
                     ,width:110}                //구매요청번호
                ,{field:"purcReqLineNo"
                     ,title:"<spring:message code='par.lbl.lineNm' />"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:40}                //구매요청라인번호
                ,{field:"abcInd"
                     ,title:"<spring:message code='par.lbl.abcInd' />"
                     ,width:60 }                //ABC CLASS
                ,{field:"carlineCd"
                     ,title:"<spring:message code='par.lbl.carLine' />"
                     ,template:'#= changeCarlineCd(carlineCd)#'
                     ,width:60 }                //차종
                 ,{field:"purcLeadHm"
                     ,title:"<spring:message code='par.lbl.purcLeadHm' />"
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,width:80
                     ,hidden:true}                //구매리드타임
                 ,{field:"purcReqUnitCd"
                     ,title:"<spring:message code='par.lbl.unitNm' />"
                     ,width:50
                     ,hidden:true}                //단위
                ,{field:"purcReqDt"
                     ,title:"<spring:message code='par.lbl.periodDeliveryReqDt' />"
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80
                     ,hidden:true}                //납기요청일
                ,{field:"purcPrc"
                     ,title:"<spring:message code='par.lbl.purcPrc' />"
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,width:80}                //구매단가
                ,{field:"purcAmt"
                     ,title:"<spring:message code='par.lbl.purcIncTaxAmt' />"
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                     ,width:80}                //구매금액
                ,{field:"stockQty"   //재고수량
                     ,title:"<spring:message code='par.lbl.strgeStockQty' />"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true}
                ,{field:"avlbStockQty"   //가용수량
                     ,title:"<spring:message code='par.lbl.avlbStockQty' />"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true}
                ,{field:"resvStockQty"   //예류수량
                     ,title:"<spring:message code='par.lbl.realResvStockQty' />"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true}
                ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}",hidden:true}//대여수량
                ,{title:"<spring:message code='par.lbl.borrowQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "class":"ar"} ,format:"{0:n0}",hidden:true}//차입수량
                ,{title:"<spring:message code='par.lbl.parSpecCd' />" ,field:"parSpecCd" ,width:60 ,hidden:true}
                ,{title:"<spring:message code='par.lbl.sucCd' />" ,field:"sucCd" ,width:60 ,hidden:true}
                ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.remark' />"
                     ,width:150}                //단위
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //  결품유형
        changePurcReqTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = purcReqTpObj[val];
            }
            return returnVal;
        };

        //  ABC CLASS
        changeAbcInd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = abcIndObj[val];
            }
            return returnVal;
        };

        // 차형
        changeCarlineCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(carlineCdObj[val] !== undefined){
                    returnVal = carlineCdObj[val];
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
                if(id === 'sPurcReqStartDt'){
                    var minDate = new Date(sevenDtBf);
                        frYY = minDate.getFullYear();
                        frMM = minDate.getMonth();
                        frDD = minDate.getDate();
                        $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                        $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sPurcReqEndDt'){
                    var maxDate = new Date(toDt);
                        toYY = maxDate.getFullYear();
                        toMM = maxDate.getMonth();
                        toDD = maxDate.getDate();

                        $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").value(toDt);
                        $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }else{
                if(id === 'sPurcReqStartDt'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sPurcReqEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sPurcReqEndDt'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sPurcReqStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }
        }

       // $("#grid").data("kendoExtGrid").dataSource.read();
    });

 </script>

