<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div id="resizableContainer">
    <!-- 입고단참조팝업 -->
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
                    <col style="width:12%;">
                    <col style="width:17%;">
                    <col style="width:12%;">
                    <col style="width:30%;">
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span id="titleGrDocNo"><spring:message code="par.lbl.obtGrDocNo" /></span><!-- 조달입고문서번호 --></th>
                        <td>
                            <input type="text" id="sEtcGrDocNo" class="form_input" />
                        </td>
                        <th scope="row"><span id="titleGrDt"><spring:message code="par.lbl.grDt" /></span><!-- 입고일자 --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sRegDtFr" data-type="maskDate" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sRegDtTo" data-type="maskDate" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><span id="titleGrStat"><spring:message code="par.lbl.statNm" /></span><!-- 상태 --></th>
                        <td>
                            <input id="sStatCd" data-type="combo" class="form_comboBox" />
                            <input id="sBpTp" type="hidden"  class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
        <!-- 그리드1 -->
            <div id="grid" class="resizable_grid"></div>
        <!-- 그리드1 -->
        </div>
    <div class="hidden">
        <input type="hidden" id="sBpCd" />
        <input type="hidden" id="sBpNm" />
        <input id="sMvtTp" readonly data-type="combo" class="form_comboBox" />
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
         var options = parent.receiveEtcListPopupWindow.options.content.data,
             mvtTpList = [],
             mvtTpObj = {},
             statCdList = [],
             toDt = "${toDt}",
             sevenDtBf = "${sevenDtBf}",
             minDate = new Date(sevenDtBf),
             maxDate = new Date(toDt),
             urlInfo = "<c:url value='/par/pcm/receive/selectReceiveEtcs.do' />",
             returnPopupYn,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD,
             initDataYn,
             statCdObj = {};

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

        //기타입고유형선택
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
        if(!dms.string.isEmpty(options.bpReadOnly)){
            if(!options.bpReadOnly){
                $("#sBpNm").removeAttr("readonly");
                $("#sBpNm").removeClass("form_readonly");
            }
        }
        // 조회조건 설정
        $("#sEtcGrDocNo").val(options.etcGrDocNo);
        $("#sBpCd").val(options.bpCd);
        $("#sBpNm").val(options.bpNm);
        $("#sMvtTp").data("kendoExtDropDownList").value(options.mvtTp);
        $("#sMvtTp").data("kendoExtDropDownList").enable(false);

        if(!dms.string.isEmpty(options.bpTp)){
            $("#sBpTp").val(options.bpTp);
        }

        if(!dms.string.isEmpty(options.returnYn)){
            returnPopupYn =  options.returnYn;
        }else{
            returnPopupYn =  'N';
        }

        if(!dms.string.isEmpty(options.initDataYn)){
            initDataYn = options.initDataYn;
        }else{
            initDataYn = 'N';
        }

        if(returnPopupYn === 'Y'){
            urlInfo = "<c:url value='/par/pcm/receive/selectReceiveEtcForReturns.do' />";
        }

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-182907"
            ,dataSource:{
                transport:{
                    read:{
                        url: urlInfo//"<c:url value='/par/pcm/receive/selectReceiveEtcs.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json;"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sBpCd"] = $("#sBpCd").val();
                            params["sMvtTp"] = $("#sMvtTp").data("kendoExtDropDownList").value();
                            params["sEtcGrDocNo"] = $("#sEtcGrDocNo").val();
                            params["sRegDtFr"] = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                            params["sStatCd"] = $("#sStatCd").val();
                            params["sBpTp"] = $("#sBpTp").val();
                            params["sInitDataYn"] = initDataYn;

                            return kendo.stringify(params);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    data:"data"
                    ,total:"total"
                    ,model:{
                        id:"etcGiDocNo"
                        ,fields:{
                            dlrCd :{ type:"string" }
                            ,bpCd :{ type:"string" }
                            ,bpNm :{ type:"string" }
                            ,etcGrDocNo :{ type:"string" }
                            ,itemCnt :{ type:"number" }
                            ,mvtTp :{ type:"string" }
                            ,regDt :{ type:"date"   }
                            ,statCd :{ type:"string" }
                            ,remark :{ type:"string" }
                            ,updtDtStr :{ type:"string" }
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
                 {field:"dlrCd" ,title:"<spring:message code='par.lbl.dlrCd' />" ,width:105 ,hidden:true }//딜러 코드
                ,{field:"bpCd" ,title:"<spring:message code='par.lbl.bpCd' />" ,width:105 }//거래처 코드
                ,{field:"bpNm" ,title:"<spring:message code='par.lbl.bpNm' />" ,width:140 }//공급업체
                ,{field:"etcGrDocNo" ,title:"<spring:message code='par.lbl.grDocNo' />" ,width:130 }//입고문서번호
                ,{field:"statCd" ,title:"<spring:message code='par.lbl.statNm' />" ,width:100, template:'#= changeStatCd(statCd)#' }//문서상태
                ,{field:"itemCnt" ,title:"<spring:message code='par.lbl.itemCnt' />" ,attributes:{ "class":"ar"} ,width:80 }//품목수
                ,{field:"mvtTp" ,title:"<spring:message code='par.lbl.grTp' />",width:100, template:'#= changeMvtTp(mvtTp)#' }//기타입고유형
                ,{field:"regDt" ,title:"<spring:message code='par.lbl.grDt' />" ,format:"{0:<dms:configValue code='dateFormat' />}" ,attributes:{ "class":"ac"} ,width:90 }//등록일
                ,{field:"remark" ,title:"<spring:message code='par.lbl.remark' />" ,width:100 ,hidden:true }//비고
                ,{field:"updtDtStr" ,title:" " ,width:100 ,hidden:true }//수정일자
            ]
        });
        //기타입고유형
        changeMvtTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = mvtTpObj[val];
            }
            return returnVal;
        };

        //기타입고상태
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

            $("#titleGrDocNo").text("<spring:message code='par.lbl.obtGrDocNo' />");
            $("#titleGrDt").text("<spring:message code='par.lbl.obtGrDt' />");
        }else if(!dms.string.isEmpty(options.mvtTp) && options.mvtTp === '01'){
            $("#grid thead [data-field=statCd]").text("<spring:message code='par.lbl.grDocStat' />");

            $("#titleGrDocNo").text("<spring:message code='par.lbl.grDocNo' />");
            $("#titleGrStat").text("<spring:message code='par.lbl.grDocStat' />");
        }else if(!dms.string.isEmpty(options.mvtTp) && options.mvtTp === '35'){//차입입고
            $("#titleGrDocNo").text("<spring:message code='par.lbl.grDocNo' />");
            $("#titleGrStat").text("<spring:message code='par.lbl.grDocStat' />");
        }
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
</script>

