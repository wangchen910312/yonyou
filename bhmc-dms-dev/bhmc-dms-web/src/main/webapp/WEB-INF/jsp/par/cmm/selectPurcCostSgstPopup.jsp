<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 추천오더 팝업 -->
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
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td>
                            <input id="sItemCd" class="form_input" style="width:150px">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                        <td>
                            <input id="sItemNm" class="form_input" style="width:150px"/>
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></span></th>
                        <td>
                            <input id="sBpCd" class="hidden">
                            <input id="sBpNm" readonly class="form_input form_readonly" style="width:150px">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.abcInd" /><!-- ABC CLASS --></th>
                        <td>
                            <input id="sAbcInd" data-type="combo">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.carLine" /><!-- 차종 --></th>
                        <td>
                            <input id="sCarlineCd" data-type="combo"/>
                        </td>
                        <th/>
                        <td/>
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
         var options             = parent.purcCostSgstPopupWindow.options.content.data,
             toDt                = "${toDt}",
             sevenDtBf           = "${sevenDtBf}",
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

        /*$("#sStdDtFr").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });*/

        /*$("#sStdDtTo").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });*/



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
        //$("#sStdDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        //$("#sStdDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        //$("#sStdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        //$("#sStdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));



        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0803-162701"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cmm/selectPurcCostSgsts.do' />"
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
                            //params["sStdDtFr"]           = $("#sStdDtFr").data("kendoExtMaskedDatePicker").value();
                            //params["sStdDtTo"]           = $("#sStdDtTo").data("kendoExtMaskedDatePicker").value();
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
                        id:"purcRqst"
                        , fields:{
                              dlrCd         :{ type:"string" }
                            , pltCd         :{ type:"string" }
                            , bpCd          :{ type:"string" }
                            , bpNm          :{ type:"string" }
                            , itemCd        :{ type:"string" }
                            , itemNm        :{ type:"string" }
                            , stdDt         :{ type:"date"   }
                            , purcSgstQty   :{ type:"number" }
                            , unitCd        :{ type:"string" }
                            , sftyStockQty  :{ type:"number" }
                            , psntStockQty  :{ type:"number" }
                            , grScheQty     :{ type:"number" }
                            , giScheQty     :{ type:"number" }
                            , avlbStockQty  :{ type:"number" } //가용수량
                            , resvStockQty  :{ type:"number" } //예류수량
                            , stockQty      :{ type:"number" } //재고수량
                            , borrowQty     :{ type:"number" } //차입수량
                            , rentQty       :{ type:"number" } //차출수량
                            , minPurcQty    :{ type:"number" }
                            , trsfQty       :{ type:"number" }
                            , purcLeadHm    :{ type:"string" }
                            , purcPrc       :{ type:"number" }
                            , grStrgeCd     :{ type:"string" }
                            , purcOrdRegYn  :{ type:"string" }
                            , targYn        :{ type:"string" }
                            , abcInd        :{ type:"string" }
                            , carlineCd     :{ type:"string" }
                            , regDt         :{ type:"date"   }
                            , regUsrId      :{ type:"string" }
                            , parSpecCd     :{ type:"string" }
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
                ,{field:"pltCd"
                     ,title:"<spring:message code='par.lbl.pltCd' />"
                     ,width:105
                     ,hidden:true}  //센터 코드
                ,{field:"bpCd"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:105
                     ,hidden:true}  //거래처 코드
                ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.bpCd' />"
                     ,width:100}  //공급업체
                 ,{field:"regDt"
                     ,title:"<spring:message code='par.lbl.regDt' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "class:":"ac"}
                     ,width:90 }                //등록일
                ,{field:"itemCd"
                     ,title:"<spring:message code='par.lbl.itemCd' />"
                     ,width:120 }                //부품번호
                ,{field:"itemNm"
                     ,title:"<spring:message code='par.lbl.itemNm' />"
                     ,width:180 }                //부품명
                ,{field:"unitCd"
                     ,title:"<spring:message code='par.lbl.purcUnitCd' />"
                     ,width:80}                //구매단위
                ,{field:"purcSgstQty"
                     ,title:"<spring:message code='par.lbl.purcRecommQty' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:n0}"
                     ,width:90}                //추천수량
                ,{field:"stdDt"
                     ,title:"<spring:message code='par.lbl.stdDt' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "class:":"ac"}
                     ,width:90 }                //기준일
                ,{field:"sftyStockQty"
                     ,title:"<spring:message code='par.lbl.sftyStockQty' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:n0}"
                     ,width:90}                //안전재고수량
                ,{field:"psntStockQty"
                     ,title:"<spring:message code='par.lbl.psntStockQty' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:n0}"
                     ,width:90}                //현재고수량
                ,{field:"grScheQty"
                     ,title:"<spring:message code='par.lbl.grScheQty' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:n0}"
                     ,width:90}                //입고예정수량
                ,{field:"giScheQty"
                     ,title:"<spring:message code='par.lbl.giScheQty' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:n0}"
                     ,width:90}                //출고예정수량
                ,{field:"minPurcQty"
                     ,title:"<spring:message code='par.lbl.minPurcQty' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:n0}"
                     ,width:90}                //최소구매수량
                ,{field:"trsfQty"
                     ,title:"<spring:message code='par.lbl.trsfQty' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:n0}"
                     ,width:90}                //운송중수량
                 ,{field:"purcLeadHm"
                     ,title:"<spring:message code='par.lbl.purcLeadHm' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:n0}"
                     ,width:80
                     ,hidden:true}                //구매리드타임
                ,{field:"purcPrc"
                     ,title:"<spring:message code='par.lbl.purcPrc' />"
                     ,attributes:{ "class:":"ar"}
                     ,format:"{0:n2}"
                     ,width:80
                     ,hidden:true}                //구매단가
                ,{field:"grStrgeCd"
                     ,title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,width:140
                     ,hidden:true}  //입고창고
                ,{field:"purcOrdRegYn"
                     ,title:"<spring:message code='par.lbl.purcOrdRegYn' />"
                     ,width:80
                     ,hidden:true}                //구매오더등록여부
                ,{field:"targYn"
                     ,title:"<spring:message code='par.lbl.targYn' />"
                     ,attributes:{ "class:":"ac"}
                     ,width:80
                     ,hidden:true}                //대상여부
                ,{field:"regUsrId"
                     ,title:"<spring:message code='par.lbl.regUsrId' />"
                     ,width:80
                     ,hidden:true}                //등록자
                ,{field:"abcInd"
                     ,title:"<spring:message code='par.lbl.abcInd' />"
                     ,width:120
                     ,hidden:true}                //ABC CLASS
                ,{field:"carlineCd"
                     ,title:"<spring:message code='par.lbl.carLine' />"
                     ,template:'#= changeCarlineCd(carlineCd)#'
                     ,width:80
                     ,hidden:true}                //차종
                 ,{field:"stockQty"   //재고수량
                     ,title:"<spring:message code='par.lbl.strgeStockQty' />"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true}
                 ,{field:"avlbStockQty"   //가용수량
                     ,title:"<spring:message code='par.lbl.avlbStockQty' />"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true}
                 ,{field:"resvStockQty"   //예류수량
                     ,title:"<spring:message code='par.lbl.realResvStockQty' />"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0
                     ,hidden:true}
                 ,{title:"<spring:message code='par.lbl.purcOrcRentQty' />" ,field:"rentQty" ,width:60 ,attributes:{ "style":"text-align:right"} ,format:"{0:n0}",hidden:true}//대여수량
                 ,{title:"<spring:message code='par.lbl.borrowQty' />" ,field:"borrowQty" ,width:60 ,attributes:{ "style":"text-align:right"} ,format:"{0:n0}",hidden:true}//차입수량
                 ,{title:"<spring:message code='par.lbl.parSpecCd' />" ,field:"parSpecCd" ,width:60 ,hidden:true}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

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
                returnVal = carlineCdObj[val];
            }
            return returnVal;
        };

        /*function fnChkDateValue(e){

            var  elmt  = e.sender.element[0],
                 id    = elmt.id,
                 toYY,
                 toMM,
                 toDD,
                 frYY,
                 frMM,
                 frDD;

            if(this.value() == null){
                if(id === 'sStdDtFr'){
                    var minDate = new Date(sevenDtBf);
                        frYY = minDate.getFullYear();
                        frMM = minDate.getMonth();
                        frDD = minDate.getDate();
                        $("#sStdDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                        $("#sStdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sStdDtTo'){
                    var maxDate = new Date(toDt);
                        toYY = maxDate.getFullYear();
                        toMM = maxDate.getMonth();
                        toDD = maxDate.getDate();

                        $("#sStdDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                        $("#sStdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }else{
                if(id === 'sStdDtFr'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sStdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sStdDtTo'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sStdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }
        }*/

       // $("#grid").data("kendoExtGrid").dataSource.read();
    });

 </script>

