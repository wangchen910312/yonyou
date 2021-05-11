<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!--  견적리스트 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSearch" class="btn_m btn_Search"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="par.btn.select" /><!-- 선택 --></button>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:17%;">
                    <col style="width:10%;">
                    <col style="width:17%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.custNm" /><!-- 고객 --></th>
                        <td>
                            <input id="sCustNo" class="hidden" />
                            <input id="sCustNm" class="form_input" />
                            <input id="sCustTp" data-type="combo" class="hidden"/>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.estimateDocNo" /><!-- 견적번호 --></th>
                        <td>
                            <input id="sEstimateDocNo" class="form_input"  />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.estimateDt" /><!-- 견적일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sEstimateDtFr" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sEstimateDtTo" style="width:110px;" />
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
    <!-- //부품선택 팝업 -->

 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options             = parent.estimateListPopupWindow.options.content.data,
             toDt                ="${toDt}",
             sevenDtBf           ="${sevenDtBf}",
             custTpList          = [],
             custTpObj           = {},
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

         custTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
         <c:forEach var="obj" items="${custTpList}" varStatus="status">
             custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             custTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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

      //고객유형선택
        $("#sCustTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:custTpList
            ,index:0
        });

        $("#sEstimateDtFr").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sEstimateDtTo").kendoExtMaskedDatePicker({
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
        $("#sCustNo").val(options.custNo);
        $("#sCustNm").val(options.custNm);
        $("#sCustTp").val(options.custTp);
        $("#sEstimateDocNo").val(options.estimateDocNo);
        //$("#sEstimateDtFr").data("kendoExtMaskedDatePicker").value();
        //$("#sEstimateDtTo").data("kendoExtMaskedDatePicker").value();

        //$("#sEstimateDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        //$("#sEstimateDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0816-155501"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectEstimatesByCondition.do' />"
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

                            params["sCustNo"]            = $("#sCustNo").val();
                            params["sCustNm"]            = $("#sCustNm").val();
                            params["sEstimateDocNo"]     = $("#sEstimateDocNo").val();
                            params["sEstimateDtFr"]      = $("#sEstimateDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sEstimateDtTo"]      = $("#sEstimateDtTo").data("kendoExtMaskedDatePicker").value();

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
                        id:"estimateDocNo"
                        , fields:{
                              dlrCd         :{ type:"string" }
                            , custTp        :{ type:"string" }
                            , custNo        :{ type:"string" }
                            , custNm        :{ type:"string" }
                            , saId          :{ type:"string" }
                            , saNm          :{ type:"string" }
                            , estimateDocNo :{ type:"string" }
                            , estimateDt    :{ type:"date" }
                            , estimateDt    :{ type:"date" }
                            , regDt         :{ type:"date" }
                            , dcRate        :{ type:"number" }
                            , totAmt        :{ type:"number" }
                            , dcBefTotAmt   :{ type:"number" }
                        }
                    }
                }
            }
            ,selectable:"row"
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
                ,{field:"custTp"
                     ,title:"<spring:message code='par.lbl.custTp' />"
                     ,template:'#= changeCustTp(custTp)#'
                     ,width:100 }                //오더유형
                ,{field:"custNo"
                     ,title:"<spring:message code='par.lbl.custNm' />"
                     ,width:105
                     ,hidden:true}  //고객 코드
                ,{field:"custNm"
                     ,title:"<spring:message code='par.lbl.custNm' />"
                     ,width:140 }  //고객
                ,{field:"estimateDocNo"
                     ,title:"<spring:message code='par.lbl.estimateDocNo' />"
                     ,width:150 }                //견적번호
                ,{field:"estimateDt"
                     ,title:"<spring:message code='par.lbl.estimateDt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90 }                //견적일
                ,{field:"regDt"
                     ,title:"<spring:message code='par.lbl.regDt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:<dms:configValue code='dateFormat' />}"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90
                     ,hidden:true}                //등록일
                 ,{field:"dcRate"
                     ,title:"<spring:message code='par.lbl.dcRate' />"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,decimal:0}
                 ,{field:"totAmt"
                     ,title:"<spring:message code='par.lbl.totAmt' />"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"}
                 ,{field:"dcBefTotAmt"
                     ,title:"<spring:message code='par.lbl.totAmtBefDc' />"
                     ,width:60
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //  고객유형
        changeCustTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = custTpObj[val];
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
                if(id === 'sEstimateDtFr'){
                    var minDate = new Date(sevenDtBf);
                        frYY = minDate.getFullYear();
                        frMM = minDate.getMonth();
                        frDD = minDate.getDate();
                        //$("#sEstimateDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                        //$("#sEstimateDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sEstimateDtTo'){
                    var maxDate = new Date(toDt);
                        toYY = maxDate.getFullYear();
                        toMM = maxDate.getMonth();
                        toDD = maxDate.getDate();

                        //$("#sEstimateDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                        //$("#sEstimateDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }else{
                if(id === 'sEstimateDtFr'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sEstimateDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sEstimateDtTo'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sEstimateDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }
        }

       // $("#grid").data("kendoExtGrid").dataSource.read();
    });

 </script>

