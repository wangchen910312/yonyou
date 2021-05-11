<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 반품단참조팝업 -->
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
                    <col style="width:25%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col style="width:10%;">
                    <col style="width:22%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span id="titleBpCd"><spring:message code="par.lbl.bpCd" /></span><!-- 거래처코드 --></th>
                        <td>
                            <input type="hidden" id="sBpCd" />
                            <input id="sBpNm" readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.returnTp" /><!-- 반품수불유형 --></th>
                        <td>
                            <input id="sMvtTp" readonly data-type="combo" class="form_comboBox" />
                        </td>
                        <th scope="row"><span id="titleGrDocNo"><spring:message code="par.lbl.returnDocNo" /></span><!-- 반품문서번호 --></th>
                        <td>
                            <input type="text" id="sEtcGrDocNo" class="form_input" />
                        </td>
                    </tr>
                    <tr>

                        <th scope="row"><span id="titleGrDt"><spring:message code="par.lbl.receiveReturnDt" /></span><!-- 반품일자 --></th>
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
                        <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 상태 --></th>
                        <td>
                            <input id="sStatCd" data-type="combo" class="form_comboBox" />
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
         var options             = parent.receiveReturnEtcListPopupWindow.options.content.data,
             toDt                ="${toDt}",
             sevenDtBf           ="${sevenDtBf}",
             mvtTpList           = [],
             mvtTpObj            = {},
             statCdList          = [],
             statCdObj           = {},
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

         <c:forEach var="obj" items="${mvtTpList}">
         mvtTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:forEach>
         <c:forEach var="obj" items="${statCdList}">
         statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         statCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
         </c:forEach>

         $.each(mvtTpList, function(idx, obj){
             mvtTpObj[obj.cmmCd] = obj.cmmCdNm;
         });

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

                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    options.callbackFunc(data);
                }
            }
        });

        //수불유형선택
        $("#sMvtTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:mvtTpList
            ,index:0
        });

        //기타입고상태선택
        $("#sStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,dataSource:statCdList
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

        if(!dms.string.isEmpty(options.bpReadOnly)){
            if(!options.bpReadOnly){
                $("#sBpNm").removeAttr("readonly");
                $("#sBpNm").removeClass("form_readonly");
            }
        }
        // 조회조건 설정
        $("#sBpCd").val(options.bpCd);
        $("#sBpNm").val(options.bpNm);
        $("#sMvtTp").data("kendoExtDropDownList").value(options.mvtTp);
        $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        $("#sStatCd").data("kendoExtDropDownList").value(options.statCd);

        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        $("#sMvtTp").data("kendoExtDropDownList").enable(false);

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-182908"
           ,dataSource:{
                transport:{
                    read:{
                          url:"<c:url value='/par/pcm/receive/selectReceiveEtcForReturns.do' />"
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
                            params["sEtcGrDocNo"]        = $("#sEtcGrDocNo").val();
                            params["sRegDtFr"]           = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"]           = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sStatCd"]            = $("#sStatCd").val();

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
                              dlrCd         :{ type:"string" }
                            , bpCd          :{ type:"string" }
                            , bpNm          :{ type:"string" }
                            , etcGrDocNo    :{ type:"string" }
                            , itemCnt       :{ type:"number" }
                            , mvtTp         :{ type:"string" }
                            , regDt         :{ type:"date"   }
                            , statCd        :{ type:"string" }
                            , remark        :{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:"multiple"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true
            ,height:280
            ,columns:[
                 {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />" ,width:105 ,hidden:true}//딜러 코드
                ,{field:"bpCd" ,title:"<spring:message code='par.lbl.bpCd' />" ,width:105}//거래처 코드
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.bpNm' />" ,width:140}//공급업체
                ,{field:"etcGrDocNo" ,title:"<spring:message code='par.lbl.returnDocNo' />" ,width:130}//반품문서번호
                ,{field:"statCd" ,title:"<spring:message code='par.lbl.statNm' />" ,width:100
                     ,template:'#= changeStatCd(statCd)#'
                }//문서상태
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.itemCnt' />" ,attributes:{ "class":"ar"} ,width:80}//품목수
                ,{field:"mvtTp" ,title:"<spring:message code='par.lbl.returnTp' />",width:100
                     ,template:'#= changeMvtTp(mvtTp)#'
                }//기타입고유형
                ,{field:"regDt" ,title:"<spring:message code='par.lbl.receiveReturnDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:90 }//반품등록일
                ,{field:"remark" ,title:"<spring:message code='par.lbl.remark' />" ,width:100 ,hidden:true}//비고
            ]
        });
        //  기타입고유형
        changeMvtTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = mvtTpObj[val];
            }
            return returnVal;
        };

        //  기타입고상태
        changeStatCd = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = statCdObj[val];
            }
            return returnVal;
        };

        if(!dms.string.isEmpty(options.mvtTp) && options.mvtTp === '63'){//조달입고 시
            $("#grid thead [data-field=bpCd]").text("<spring:message code='global.lbl.dlrCd' />");
            $("#grid thead [data-field=bpNm]").text("<spring:message code='par.lbl.dealer' />");
            $("#grid thead [data-field=etcGrDocNo]").text("<spring:message code='par.lbl.obtGrDocNo' />");
            $("#grid thead [data-field=regDt]").text("<spring:message code='par.lbl.obtGrDt' />");

            $("#titleBpCd").text("<spring:message code='global.lbl.dlrCd' />");
            $("#titleGrDocNo").text("<spring:message code='par.lbl.obtGrDocNo' />");
            $("#titleGrDt").text("<spring:message code='par.lbl.obtGrDt' />");
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
    });

 </script>

