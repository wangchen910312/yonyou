<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <!-- 판매리스트 팝업 -->
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
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:25%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.custTp" /><!-- 고객유형 --></th>
                        <td>
                            <input id="sCustTp" data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.custNm" /><!-- 고객 --></th>
                        <td>
                            <div class="form_search">
                                <input type="text" id="sCustNm" class="form_input" />
                                <input type="hidden" id="sCustCd" />
                            </div>
                        </td>
                        <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <input id="sOrdStatCd" type="text" data-type="multicombo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="par.lbl.parSaleOrdNo" /><!-- 판매오더번호 --></th>
                        <td>
                            <input id="sParSaleOrdNo" class="form_input" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.giDt" /><!-- 출고일 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sOrdDtFr" class="form_datepicker" data-type="maskDate" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sOrdDtTo" class="form_datepicker" data-type="maskDate" />
                                </div>
                            </div>
                        </td>
                        <th/>
                        <td/>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="resizable_grid"></div>
        <!-- 그리드1 -->
        </div>
    </section>
    <!-- //부품선택 팝업 -->
</div>
 <script type="text/javascript">

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options             = parent.partsSaleOrdListPopupWindow.options.content.data,
             toDt                ="${toDt}",
             sevenDtBf           ="${sevenDtBf}",
             custTpList          = [],
             custTpObj           = {},
             ordStatCdList       = [],
             ordStatCdObj        = {},
             saleTpList          = [],
             saleTpObj           = {},
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

         custTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
         custTpObj[' '] = "";
         <c:forEach var="obj" items="${custTpList}" varStatus="status">
             custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             custTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         ordStatCdList.push({"cmmCd":" ", "cmmCdNm":"选择取消", "useYn":""});
         <c:forEach var="obj" items="${ordStatCdList}" varStatus="status">
             if("${obj.useYn}" === 'Y'){
                 ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             }
             ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         saleTpList.push({"cmmCd":" ", "cmmCdNm":" ", "useYn":""});
         saleTpObj[' '] = "";
         <c:forEach var="obj" items="${saleTpList}" varStatus="status">
             saleTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
             saleTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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

        //오더상태선택
        $("#sOrdStatCd").kendoExtMultiSelectDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:ordStatCdList
            ,dataBound:function(){
                var current = this.value();
                this._savedOld = current.slice(0);
            }
            ,select:function(e){
                var selectOrdStatCd = e.dataItem.cmmCd;

                if(dms.string.isEmpty(selectOrdStatCd)){
                    $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").refresh();
                    $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value([]);
                }

            }
        });

        //판매유형
        $("#sSaleTp").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:saleTpList
            ,index:0
        });

        $("#sOrdDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sOrdDtTo").kendoExtMaskedDatePicker({
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
        $("#sCustCd").val(options.custCd);
        $("#sCustNm").val(options.custNm);
        //$("#sOrdDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        //$("#sOrdDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        //$("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        //$("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        $("#sCustTp").data("kendoExtDropDownList").value(options.custTp);
        //$("#sCustTp").data("kendoExtDropDownList").enable(false);


        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0819-154101"
           ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/ism/issue/selectPartsSaleOrdPops.do' />"
                        , dataType:"json"
                        , type:"POST"
                        , contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {},
                                sOrdStatCdLst = $("#sOrdStatCd").data("kendoExtMultiSelectDropDownList").value();

                            if(sOrdStatCdLst.length > 0){
                                for(var i = 0; i < sOrdStatCdLst.length; i = i + 1){
                                    if(sOrdStatCdLst[i] === '07'){
                                        sOrdStatCdLst.push('08');
                                    }
                                }
                            }
                            if(dms.string.isEmpty(sOrdStatCdLst[0])){

                                sOrdStatCdLst.splice(0,1);
                            }

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"]          = options.page;
                            params["firstIndex"]         = options.skip;
                            params["lastIndex"]          = options.skip + options.take;
                            params["sort"]               = options.sort;

                         // 부품판매 검색조건 코드.
                            params["sCustTp"]            = $("#sCustTp").data("kendoExtDropDownList").value();
                            params["sParSaleOrdNo"]      = $("#sParSaleOrdNo").val();
                            params["sOrdStatLst"]        = sOrdStatCdLst;
                            //params["sSaleTp"]            = $("#sSaleTp").data("kendoExtDropDownList").value();
                            params["sCustNm"]            = $("#sCustNm").val();
                            //params["sSaNm"]              = $("#sSaNm").val();
                            params["sOrdDtFr"]           = $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sOrdDtTo"]           = $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value();
                            //params["sDcRate"]            = $("#sDcRate").data("kendoExtNumericTextBox").value();

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
                        id:"itemCd"
                        , fields:{
                              dlrCd         :{ type:"string", editable:false }
                            , ordStatCd     :{ type:"string", editable:false }
                            , ordDt         :{ type:"date",   editable:false }
                            , saleTp        :{ type:"string", editable:false }
                            , custTp        :{ type:"string", editable:false }
                            , custCd        :{ type:"string", editable:false }
                            , custNm        :{ type:"string", editable:false }
                            , parSaleOrdNo  :{ type:"string", editable:false }
                            , salePrsnId    :{ type:"string", editable:false }
                            , salePrsnNm    :{ type:"string", editable:false }
                            , remark        :{ type:"string", editable:false }
                            , itemCnt       :{ type:"number", editable:false }
                            , itemQty       :{ type:"number", editable:false }
                            , itemAmt       :{ type:"number", editable:false }
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
                 {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                 ,{field:"ordStatCd"
                      ,title:"<spring:message code='par.lbl.statNm' />"
                      ,attributes:{ "class":"ac"}
                      ,width:70
                      ,template:function(dataItem){

                          var spanObj = "";

                          switch(dataItem.ordStatCd)
                          {
                              case "02":// 완료

                                  spanObj = "<span class='txt_label bg_blue'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "03":// 취소

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "04":// 정산

                                  spanObj = "<span class='txt_label bg_yellow'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "05":// 수납

                                  spanObj = "<span class='txt_label bg_orange'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              case "07":// 반품

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;
                              case "08":// 전체반품

                                  spanObj = "<span class='txt_label bg_red'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;

                              default: // 등록

                                  spanObj = "<span class='txt_label bg_gray'>"+ordStatCdObj[dataItem.ordStatCd]+"</span>";

                                  break;
                          }

                          return spanObj;
                      }
                 }                //상태
                 ,{field:"ordDt"
                      ,title:"<spring:message code='par.lbl.orderDt' />"
                      ,attributes:{ "class":"ar"}
                      ,format:"{0:<dms:configValue code='dateFormat' />}"
                      ,attributes:{ "class":"ac"}
                      ,width:90 }                //오더일
                 ,{field:"saleTp"
                      ,title:"<spring:message code='par.lbl.saleType' />"
                      ,template:'#= changeSaleTp(saleTp)#'
                      ,attributes:{ "class":"ac"}
                      ,width:80 }                //판매유형
                 ,{field:"custTp"
                      ,title:"<spring:message code='par.lbl.custTp' />"
                      ,template:'#= changeCustTp(custTp)#'
                      ,attributes:{ "class":"ac"}
                      ,width:80 }                //고객유형
                 ,{field:"custCd"
                      ,title:"<spring:message code='par.lbl.custNm' />"
                      ,width:105
                      ,hidden:true}  //고객 코드
                 ,{field:"custNm"
                      ,title:"<spring:message code='par.lbl.custNm' />"
                      ,width:140 }  //고객명
                 ,{field:"parSaleOrdNo"
                      ,title:"<spring:message code='par.lbl.parSaleOrdNo' />"
                      ,width:130 }                //부품판매오더번호
                 ,{field:"salePrsnId"
                      ,title:"<spring:message code='par.lbl.partsSalePrsn' />"
                      ,width:105
                      ,hidden:true}  //담당자 코드
                 ,{field:"salePrsnNm"
                      ,title:"<spring:message code='par.lbl.partsSalePrsn' />"
                      ,width:140 }  //담당자명
                 , {   //품목 수
                      title:"<spring:message code='par.lbl.itemCnt' />"
                     ,field:"itemCnt"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                    }
                 , {   //총수량
                      title:"<spring:message code='par.lbl.itemInnerOutTotQty' />"
                     ,field:"itemQty"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n0}"
                    }
                 , {   //총금액
                      title:"<spring:message code='par.lbl.itemInnerOutTotAmt' />"
                     ,field:"itemAmt"
                     ,width:60
                     ,attributes:{ "class":"ar"}
                     ,format:"{0:n2}"
                    }
                 ,{field:"remark"
                     ,title:"<spring:message code='par.lbl.remark' />"
                     ,width:220
                  }      //비고
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

       // 고객유형
        changeCustTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = custTpObj[val];
            }
            return returnVal;
        };

        //  판매유형
        changeSaleTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = saleTpObj[val];
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
                if(id === 'sOrdDtFr'){
                    var minDate = new Date(sevenDtBf);
                        frYY = minDate.getFullYear();
                        frMM = minDate.getMonth();
                        frDD = minDate.getDate();
                        $("#sOrdDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                        $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sOrdDtTo'){
                    var maxDate = new Date(toDt);
                        toYY = maxDate.getFullYear();
                        toMM = maxDate.getMonth();
                        toDD = maxDate.getDate();

                        $("#sOrdDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                        $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }else{
                if(id === 'sOrdDtFr'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sOrdDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sOrdDtTo'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sOrdDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }
        }

       // $("#grid").data("kendoExtGrid").dataSource.read();
    });

 </script>

