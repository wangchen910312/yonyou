<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 기타입고 팝업 -->
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
                    <col style="width:15%;">
                    <col style="width:35%;">
                    <col style="width:15%;">
                    <col style="width:35%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.bpCd" /><!-- 거래처코드 --></span></th>
                        <td>
                            <input id="sBpCd" class="hidden" style="width:100%">
                            <input id="sBpNm" readonly class="form_input form_readonly" style="width:100%">
                            <input id="sMvtTp" class="hidden" readonly type="text" data-type="combo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.regDt" /><!-- 등록일 --></th>
                        <td>
                            <input id="sRegDtFr" style="width:110px;">~
                            <input id="sRegDtTo" style="width:110px;" />
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
         var options             = parent.receiveEtcPopupWindow.options.content.data,
             mvtTp               = options.mvtTp,
             toDt                = "${toDt}",
             sevenDtBf           = "${sevenDtBf}",
             unitCdObj           = {},
             strgeTpObj          = {},
             locationListObj     = {},
             locationObj         = {},
             mvtTpList           = [],
             mvtTpObj            = {},
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

         locationObj[' '] = "";

         <c:forEach var="obj" items="${mvtTpList}" varStatus="status">
             if(mvtTp === "${obj.cmmCd}"){
                 mvtTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
                 mvtTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
             }
         </c:forEach>

         unitCdObj[' '] = "";
         <c:forEach var="obj" items="${unitCdList}" varStatus="status">
             unitCdObj["${obj.unitExtCd}"] = "${obj.unitExtCd}";
         </c:forEach>

         strgeTpObj[' '] = "";
         <c:forEach var="obj" items="${storageList}" varStatus="status">
             strgeTpObj["${obj.strgeCd}"] = "${obj.strgeNm}";
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

                    /*if(rows.length > 1){
                        dms.notification.warning("<spring:message code='global.info.selectOneRowMsg' />");
                        return false;
                    }*/
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                }
            }
        });

        //기타출고유형선택
        $("#sMvtTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:mvtTpList
            ,index:0
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
        $("#sMvtTp").data("kendoExtDropDownList").value(options.mvtTp);

        $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0803-163001"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/cmm/selectReceiveEtcPopupByCondition.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                            params["sBpCd"]              = $("#sBpCd").val();
                            params["sMvtTp"]             = $("#sMvtTp").data("kendoExtDropDownList").value();
                            //params["sEtcGiDocNo"]        = $("#sEtcGiDocNo").val();
                            params["sRegDtFr"]           = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"]           = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();

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
                        id:"giDocNo"
                        , fields:{
                              dlrCd         :{ type:"string" }
                            , bpCd          :{ type:"string" }
                            , bpNm          :{ type:"string" }
                            , etcGrDocNo    :{ type:"string" }
                            , etcGrDocLineNo:{ type:"number" }
                            , itemCd        :{ type:"string" }
                            , itemNm        :{ type:"string" }
                            , unitCd        :{ type:"string" }
                            , strgeCd       :{ type:"string" }
                            , locCd         :{ type:"string" }
                            , borrowQty     :{ type:"number" }
                            , returnQty     :{ type:"number" }
                            , remainQty     :{ type:"number" }
                            , prc           :{ type:"number" }
                            , amt           :{ type:"number" }
                            , retailPrc     :{ type:"number" }
                            , movingAvgPrc  :{ type:"number" }
                            , mvtTp         :{ type:"string" }
                            , regDt         :{ type:"date"   }
                            , avlbStockQty  :{ type:"number" }
                            , remark        :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:"multiple"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,height:280
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
                ,{field:"etcGrDocNo"
                     ,title:"<spring:message code='par.lbl.etcGrDocNo' />"
                     ,width:120} //기타출고현황번호
                ,{field:"etcGrDocLineNo"
                     ,title:"<spring:message code='par.lbl.lineNm' />"
                     ,width:35}   //Line
                ,{field:"itemCd"
                     ,title:"<spring:message code='par.lbl.itemCd' />"
                     ,width:100} //부품번호
                ,{field:"itemNm"
                     ,title:"<spring:message code='par.lbl.itemNm' />"
                     ,width:180} //부품명
                ,{field:"strgeCd"
                     ,title:"<spring:message code='par.lbl.giStrgeCd' />"
                     ,width:100
                     ,template:'#= changeStrgeCd(strgeCd)#'
                     ,sortable:false} //출고창고
                ,{field:"locCd"
                     ,title:"<spring:message code='par.lbl.locationCd' />"
                     ,width:140
                     //,template:'#= changeGiLocCd(locCd)#'
                     ,sortable:false
                     ,hidden:true} //로케이션
                ,{field:"unitCd"
                     ,title:"<spring:message code='par.lbl.unitNm' />"
                     ,width:80
                     ,template:'#= changeUnitCd(unitCd)#'
                     ,attributes:{ "style":"text-align:center"}
                     ,sortable:false
                     ,hidden:true} //단위
                ,{field:"borrowQty"
                     ,title:"<spring:message code='par.lbl.borrowQty' />"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"}                //차입수량
                ,{field:"returnQty"
                     ,title:"<spring:message code='par.lbl.returnQty' />"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"}                //반환수량
                ,{field:"remainQty"
                     ,title:"<spring:message code='par.lbl.qty' />"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"}                //남은수량
                ,{field:"movingAvgPrc"
                     ,title:"<spring:message code='par.lbl.movingAvgPrc' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"}                //이동평균단가
                ,{field:"retailPrc"
                     ,title:"<spring:message code='par.lbl.salePriceCost01' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"}                //소매가
               ,{field:"prc"
                     ,title:"<spring:message code='par.lbl.prc' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"}                //단가
                ,{field:"amt"
                     ,title:"<spring:message code='par.lbl.amt' />"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"}                //금액
                ,{field:"mvtTp"
                     ,title:"<spring:message code='par.lbl.otherGiTp' />"
                     ,template:'#= changeMvtTp(mvtTp)#'
                     ,width:100 }                //기타출고유형
                ,{field:"regDt"
                     ,title:"<spring:message code='par.lbl.regDt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90 }                //등록일
                ,{field:"avlbStockQty"
                     ,title:"<spring:message code='par.lbl.avlbStockQty' />"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,hidden:true}
                ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.remark' />"
                     ,width:100
                     ,hidden:true}              //비고
            ]
        });
        //  기타출고유형
        changeMvtTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = mvtTpObj[val];
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

        // 단위
        changeUnitCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = unitCdObj[val];
            }
            return returnVal;
        };

        // 로케이션
        /*changeGiLocCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = locationObj[val];
            }
            return returnVal;
        };*/

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
                }
            }
        }

       // $("#grid").data("kendoExtGrid").dataSource.read();
    });

 </script>

