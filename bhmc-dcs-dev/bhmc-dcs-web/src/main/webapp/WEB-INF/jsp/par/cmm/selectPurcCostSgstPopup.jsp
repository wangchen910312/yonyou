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
             rowNumber           = 0, //그리드 목록 번호
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

         abcIndList.push({itemCd:"", itemNm:"ALL"});
         <c:forEach var="obj" items="${abcIndList}" varStatus="status">
             abcIndList.push({itemCd:"${obj.cmmCd}", itemNm:"${obj.cmmCdNm}"});
             abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>


         carlineCdList.push({itemCd:"", itemNm:"ALL"});
         <c:forEach var="obj" items="${carlineCdList}" varStatus="status">
             carlineCdList.push({itemCd:"${obj.carlineCd}", itemNm:"${obj.carlineNm}"});
             carlineCdObj["${obj.carlineCd}"] = "${obj.carlineNm}";
         </c:forEach>


        console.log('options:',options,toDt,sevenDtBf);

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
           ,index:0
       });

        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"itemNm"
           ,dataValueField:"itemCd"
           ,dataSource:carlineCdList
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
            dataSource:{
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

                            params["sBpCd"]              = $("#sBpCd").val();
                            params["sItemCd"]            = $("#sItemCd").val();
                            params["sItemNm"]            = $("#sItemNm").val();
                            //params["sStdDtFr"]           = $("#sStdDtFr").data("kendoExtMaskedDatePicker").value();
                            //params["sStdDtTo"]           = $("#sStdDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sAbcInd"]            = $("#sAbcInd").data("kendoExtDropDownList").value();
                            params["sCarlineCd"]         = $("#sCarlineCd").data("kendoExtDropDownList").value();

                            console.log('kendo.stringify(params):',kendo.stringify(params));
                            //console.log('dt:',$("#sStdDtFr").data("kendoExtMaskedDatePicker").value());
                            //console.log('dt2:',new Date($("#sStdDtFr").data("kendoExtMaskedDatePicker").value()));
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
                        }
                    }
                }
            }
            ,selectable:"multiple"
            ,editable:false
            ,autoBind:false
            , dataBinding :function(e){
                rowNumber = 0;
             }
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
                     ,width:140}  //공급업체
                ,{field:"rnum"
                     ,title:"<spring:message code='par.lbl.lineNm' />"
                     ,attributes:{ "style":"text-align:center"}
                     ,template  :"#= ++rowNumber #"
                     ,width:40}                //라인번호
                 ,{field:"regDt"
                     ,title:"<spring:message code='par.lbl.regDt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80 }                //등록일
                ,{field:"itemCd"
                     ,title:"<spring:message code='par.lbl.itemCd' />"
                     ,width:120 }                //부품번호
                ,{field:"itemNm"
                     ,title:"<spring:message code='par.lbl.itemNm' />"
                     ,width:180 }                //부품명
                ,{field:"unitCd"
                     ,title:"<spring:message code='par.lbl.purcUnitCd' />"
                     ,width:50}                //단위
                ,{field:"purcSgstQty"
                     ,title:"<spring:message code='par.lbl.purcRecommQty' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:90}                //추천수량
                ,{field:"stdDt"
                     ,title:"<spring:message code='par.lbl.stdDt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80 }                //기준일
                ,{field:"sftyStockQty"
                     ,title:"<spring:message code='par.lbl.sftyStockQty' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:90}                //안전재고수량
                ,{field:"psntStockQty"
                     ,title:"<spring:message code='par.lbl.psntStockQty' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:90}                //현재고수량
                ,{field:"grScheQty"
                     ,title:"<spring:message code='par.lbl.grScheQty' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:90}                //입고예정수량
                ,{field:"giScheQty"
                     ,title:"<spring:message code='par.lbl.giScheQty' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:90}                //출고예정수량
                ,{field:"minPurcQty"
                     ,title:"<spring:message code='par.lbl.minPurcQty' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:90}                //최소구매수량
                ,{field:"trsfQty"
                     ,title:"<spring:message code='par.lbl.trsfQty' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:90}                //운송중수량
                 ,{field:"purcLeadHm"
                     ,title:"<spring:message code='par.lbl.purcLeadHm' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:80
                     ,hidden:true}                //구매리드타임
                ,{field:"purcPrc"
                     ,title:"<spring:message code='par.lbl.purcPrc' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
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
                     ,attributes:{ "style":"text-align:center"}
                     ,width:80
                     ,hidden:true}                //대상여부
                ,{field:"regUsrId"
                     ,title:"<spring:message code='par.lbl.regUsrId' />"
                     ,width:80
                     ,hidden:true}                //등록자
                ,{field:"abcInd"
                     ,title:"<spring:message code='par.lbl.abcInd' />"
                     ,template:'#= changeAbcInd(abcInd)#'
                     ,width:120
                     ,hidden:true}                //ABC CLASS
                ,{field:"carlineCd"
                     ,title:"<spring:message code='par.lbl.carLine' />"
                     ,template:'#= changeCarlineCd(carlineCd)#'
                     ,width:80
                     ,hidden:true}                //차종
                ,{title:""}
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

            console.log("val:" + this.value());
            console.log('id:',id);
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

