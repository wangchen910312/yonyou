<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 재고실사리스트 팝업 -->
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
                    <col style="width:11%;">
                    <col style="width:20%;">
                    <col style="width:11%;">
                    <col style="width:30%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
                        <td>
                            <input id="sStockDdDocNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.stockDdStatCd" /><!-- 재고실사상태 --></th>
                        <td>
                            <input id="sDocStatCd" class="form_comboBox" data-type="combo">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.strge" /><!-- 창고 --></th>
                        <td>
                            <input id="sStrgeCd" name="sStrgeCd" class="form_comboBox" data-type="combo">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 재고실사 담당자 --></th>
                        <td>
                            <input id="sPrsnId" type="text" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.regDt" /><!-- 등록일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegDtFr" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegDtTo" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.stockLockYn" /><!-- 재고통제여부 --></th>
                        <td>
                            <input id="sStockLockYn" class="form_comboBox" data-type="combo">
                        </td>
                        <th scope="row"><spring:message code="par.lbl.approveReqDt" /><!-- 승인요청일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sApproveReqDtFr" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sApproveReqDtTo" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"></th>
                        <td></td>
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
         var options             = parent.investigationListPopupWindow.options.content.data,
             toDt                ="${toDt}",
             sevenDtBf           ="${sevenDtBf}",
             storageList         = [],
             storageObj          = {},
             docStatList         = [],
             docStatObj          = {},
             stockLockYnList     = [],
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

         storageObj[' '] = "";
         <c:forEach var="obj" items="${storageList}" varStatus="status">
             storageList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
             storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
         </c:forEach>

         stockLockYnList.push({cmmCd:"", cmmCdNm:" "});
         stockLockYnList.push({cmmCd:"Y", cmmCdNm:"Yes"});
         stockLockYnList.push({cmmCd:"N", cmmCdNm:"No"});

         docStatList.push({cmmCd:"", cmmCdNm:" "});
         <c:forEach var="obj" items="${docStatList}" varStatus="status">
             docStatList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
             docStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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

                    if(rows.length > 1){
                        dms.notification.warning("<spring:message code='global.info.selectOneRowMsg' />");
                        return false;
                    }
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                }
            }
        });

       //창고선택
        $("#sStrgeCd").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:storageList
            ,index:0
        });

        $("#sDocStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:docStatList
           ,index:0
        });

        $("#sStockLockYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:stockLockYnList
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

        $("#sApproveReqDtFr").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sApproveReqDtTo").kendoExtMaskedDatePicker({
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
        $("#sStockDdDocNo").val(options.stockDdDocNo);

        if(!dms.string.isEmpty(options.docStatCd)){
            $("#sDocStatCd").data("kendoExtDropDownList").value(options.docStatCd);
            $("#sDocStatCd").data("kendoExtDropDownList").enable(false);
        }


        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/investigation/selectInvestigationsPop.do' />"
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

                            params["sStockDdDocNo"]      = $("#sStockDdDocNo").val();
                            params["sPrsnId"]            = $("#sPrsnId").val();
                            params["sStrgeCd"]           = $("#sStrgeCd").data("kendoExtDropDownList").value();
                            //params["sPurcRegDtFr"]       = $("#sPurcRegDtFr").data("kendoExtMaskedDatePicker").value();
                            //params["sPurcRegDtTo"]       = $("#sPurcRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sApproveReqDtFr"]    = $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sApproveReqDtTo"]    = $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtFr"]           = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"]           = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sDocStatCd"]         = $("#sDocStatCd").data("kendoExtDropDownList").value();
                            params["sStockLockYn"]       = $("#sStockLockYn").data("kendoExtDropDownList").value();

                            console.log('kendo.stringify(params):',kendo.stringify(params));
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
                        id:"stockDdDocNo"
                        , fields:{
                              dlrCd         :{ type:"string" }
                            , stockDdDocNo  :{ type:"string" }
                            , docStatCd     :{ type:"string" }
                            , pltCd         :{ type:"string" }
                            , strgeCd       :{ type:"string" }
                            , prsnId        :{ type:"string" }
                            , approveReqDt  :{ type:"date" }
                            , endDt         :{ type:"date" }
                            , cancDt        :{ type:"date" }
                            , regDt         :{ type:"date" }
                            , stockLockYn   :{ type:"string" }
                            , signOpnCont   :{ type:"string" }
                            , remark        :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,height:260
            ,columns:[
                 {field:"dlrCd"
                     ,title:"<spring:message code='par.lbl.dlrCd' />"
                     ,width:105
                     ,hidden:true}  //딜러 코드
                ,{field     :"strgeCd"
                     ,title     :"<spring:message code='par.lbl.strgeCd' />"
                     ,width     :100
                     ,template  :'#= changeStrgeCd(strgeCd)#'}  //창고
                ,{field:"stockDdDocNo"
                     ,title:"<spring:message code='par.lbl.stockDdDoc' />"
                     ,width:100 }                //재고실사문서번호
                ,{field:"docStatCd"
                     ,title:"<spring:message code='par.lbl.stockDdStatCd' />"
                     ,template:'#= changeDocStatObj(docStatCd)#'
                     ,width:100 }                //문서상태
                ,{field:"prsnId"
                     ,title:"<spring:message code='par.lbl.investigationPrsId' />"
                     ,width:100 }                //재고실사담당자
                ,{field:"stockLockYn"
                     ,title:"<spring:message code='par.lbl.stockLockYn' />"
                     ,width:80 }                //재고통제여부
                ,{field:"regDt"
                     ,title:"<spring:message code='par.lbl.regDt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90 }                //등록일
                ,{field:"approveReqDt"
                     ,title:"<spring:message code='par.lbl.approveReqDt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90 }                //요청승인일자
                ,{field:"endDt"
                     ,title:"<spring:message code='par.lbl.endDt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90 }                //완료일자
                ,{field:"cancDt"
                     ,title:"<spring:message code='par.lbl.rejectDt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90 }                //반려일자
                ,{field:"signOpnCont"
                     ,title:"<spring:message code='par.lbl.signOpnCont' />"
                     ,width:100 }                //결제의견
                ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.remark' />"
                     ,width:100 }                //비고
                ,{title:""}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //  창고
        changeStrgeCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = storageObj[val];
            }
            return returnVal;
        };

        // 문서상태
        changeDocStatObj = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = docStatObj[val];
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

            console.log("val:" + this.value());
            console.log('id:',id);
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
                }else if(id === 'sApproveReqDtFr'){
                    var maxDate = new Date(toDt);
                        frYY = minDate.getFullYear();
                        frMM = minDate.getMonth();
                        frDD = minDate.getDate();

                        $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").value(toDt);
                        $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sApproveReqDtTo'){
                    var maxDate = new Date(toDt);
                        toYY = maxDate.getFullYear();
                        toMM = maxDate.getMonth();
                        toDD = maxDate.getDate();

                        $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                        $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
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
                }else if(id === 'sApproveReqDtFr'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sApproveReqDtTo'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }
        }

       // $("#grid").data("kendoExtGrid").dataSource.read();
    });

 </script>

