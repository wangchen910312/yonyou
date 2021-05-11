<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 기출고 렌탈 팝업 -->
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
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:24%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.dlrNm" /><!-- 딜러명 --></th>
                        <td>
                            <input id="sBpCd" class="hidden" style="width:100%">
                            <input id="sBpNm" readonly class="form_input form_readonly" style="width:100%"/>
                        </td>
                        <th/>
                        <td/>
                        <th/>
                        <td/>
                    </tr>
                    <tr>

                        <th scope="row"><spring:message code="par.lbl.giDt" /><!-- 출고일 --></th>
                        <td colspan="3">
                            <input id="sRegDtFr" style="width:110px;">~
                            <input id="sRegDtTo" style="width:110px;" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                        <td>
                            <input id="sItemCd" class="form_input" />
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
         var options             = parent.issueEtcFundListPopupWindow.options.content.data,
             toDt                ="${toDt}",
             sevenDtBf           ="${sevenDtBf}",
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;


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
        $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0803-144901"
           ,dataSource:{
                transport:{
                    read:{
                          url:"<c:url value='/par/ism/issue/selectIssueEtcFunds.do' />"
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
                        id:"etcGiDocNo"
                        , fields:{
                              dlrCdRcv      :{ type:"string" }
                            , bpCd          :{ type:"string" }
                            , bpNm          :{ type:"string" }
                            , etcGiDocNo    :{ type:"string" }
                            , itemCd        :{ type:"string" }
                            , itemNm        :{ type:"string" }
                            , qty           :{ type:"number" }
                            , prc           :{ type:"number" }
                            , amt           :{ type:"number" }
                            , issDt         :{ type:"string" }
                            , remark        :{ type:"string" }
                            , grStrgeCd     :{ type:"string" }
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
                 {field:"dlrCdRcv"
                     ,title:"<spring:message code='par.lbl.dlrCd' />"
                     ,width:105
                     ,hidden:true}  //딜러 코드
                ,{field:"issDt"
                     ,title:"<spring:message code='par.lbl.giDt' />"
                     ,attributes:{ "style":"text-align:center"}
                     ,width:90 }                //출고일자
                ,{field:"etcGiDocNo"
                     ,title:"<spring:message code='par.lbl.etcGiDocNo' />"
                     ,width:120} //기타출고현황번호
                ,{field:"bpCd"
                     ,title:"<spring:message code='par.lbl.dlrCd' />"
                     ,width:105}  //딜러 코드
                ,{field:"bpNm"
                     ,title:"<spring:message code='par.lbl.dlrNm' />"
                     ,width:140}  //딜러명
                ,{field:"itemCd"
                     ,title:"<spring:message code='par.lbl.itemCd' />"
                     ,width:120} //부품번호
                ,{field:"itemNm"
                     ,title:"<spring:message code='par.lbl.itemNm' />"
                     ,width:140
                     ,hidden:true} //부품명
                ,{field:"qty"
                     ,title:"<spring:message code='par.lbl.qty' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n0}"
                     ,width:80} //수량
                ,{field:"prc"
                     ,title:"<spring:message code='par.lbl.prc' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,width:80
                     ,hidden:true} //단가
                ,{field:"amt"
                     ,title:"<spring:message code='par.lbl.amt' />"
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                     ,width:80
                     ,hidden:true} //금액
                ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.remark' />"
                     ,width:100
                     ,hidden:true}              //비고
                ,{field:"grStrgeCd"
                     ,title:"<spring:message code='par.lbl.grStrgeCd' />"
                     ,width:100
                     ,hidden:true}              //입고창고
            ]
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

