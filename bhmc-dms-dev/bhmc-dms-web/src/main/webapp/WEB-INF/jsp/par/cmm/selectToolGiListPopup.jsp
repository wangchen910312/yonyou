<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 공구판매리스트 팝업 -->
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
                <col style="width:15%;">
                <col style="width:35%;">
                <col style="width:15%;">
                <col style="width:35%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.repairPrsn" /><!-- 수리공 --></span></th>
                    <td>
                        <input id="sTechId" class="hidden" />
                        <input id="sTechNm" readonly class="form_input form_readonly" style="width:233px"/>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.toolGiDt" /><!-- 공구출고일 --></th>
                    <td>
                        <input id="sGiDtFr" style="width:110px;" />~
                        <input id="sGiDtTo" style="width:110px;" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.toolGiDocNo" /><!-- 공구출고문서번호 --></th>
                    <td>
                        <input id="sToolGiDocNo" class="form_input" style="width:233px"/>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.toolGiTp" /><!-- 공구출고유형 --></th>
                    <td>
                        <input id="sToolGiTp" data-type="combo" style="width:234px;" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
    <!-- 그리드1 -->
        <div id="grid" class="grid"></div>
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
        var options = parent.toolGiListPopupWindow.options.content.data,
            toDt = "${toDt}",
            sevenDtBf = "${sevenDtBf}",
            toolGiTpList = [],
            toolGiTpChkObj = {},
            minDate = new Date(sevenDtBf),
            maxDate = new Date(toDt),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

        //공구출고유형 : GI(工具借用:공구출고), RT(工具归还:공구반환), 65(工具报损:공구폐기)
        <c:forEach var="obj" items="${toolGiTpList}" varStatus="status">
            toolGiTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
            toolGiTpChkObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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

        $("#sToolGiTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:toolGiTpList
            ,index:0
        });

        $("#sGiDtFr").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,change:fnChkDateValue
        });

        $("#sGiDtTo").kendoExtMaskedDatePicker({
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
        $("#sTechId").val(options.techId);
        $("#sTechNm").val(options.techNm);
        $("#sToolGiTp").data("kendoExtDropDownList").value(options.toolGiTp);
        $("#sToolGiTp").data("kendoExtDropDownList").enable(false);
        $("#sGiDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
        $("#sGiDtTo").data("kendoExtMaskedDatePicker").value(toDt);

        $("#sGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


        /************************************************************
                    그리드 설정
        *************************************************************/
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-182804"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/par/stm/toolMaster/selectToolGis.do' />"
                        ,dataType:"json"
                        ,type:"POST"
                        ,contentType:"application/json;"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sTechId"] = $("#sTechId").val();
                            params["sToolGiDocNo"] = $("#sToolGiDocNo").val();
                            params["sToolGiTp"] = $("#sToolGiTp").data("kendoExtDropDownList").value();
                            params["sGiDtFr"] = $("#sGiDtFr").data("kendoExtMaskedDatePicker").value();
                            params["sGiDtTo"] = $("#sGiDtTo").data("kendoExtMaskedDatePicker").value();

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
                        id:"toolGiDocNo"
                        ,fields:{
                            dlrCd:{ type:"string" }
                            ,techId:{ type:"string" }
                            ,techNm:{ type:"string" }
                            ,toolGiDocNo:{ type:"string" }
                            ,toolGiTp:{ type:"string" }
                            ,giDt:{ type:"date" }
                            ,roDocNo:{ type:"string" }
                            ,returnDt:{ type:"date" }
                            ,remark:{ type:"string" }
                        }
                    }
                }
            }
            ,selectable:"row"
            ,editable:false
            ,autoBind:false
            ,filterable:false
            ,appendEmptyColumn:true //빈컬럼 적용. default:false
            ,height:280
            ,columns:[
                { field:"dlrCd", title:"<spring:message code='par.lbl.dlrCd' />", width:105, hidden:true }  //딜러 코드
                ,{ field:"techId", title:"<spring:message code='par.lbl.repairPrsn' />", width:105, hidden:true }  //거래처 코드
                ,{ field:"techNm", title:"<spring:message code='par.lbl.repairPrsn' />", width:140 }  //공급업체
                ,{ field:"toolGiDocNo", title:"<spring:message code='par.lbl.toolGiDocNo' />", width:120 } //공구출고번호
                ,{ field:"toolGiTp", title:"<spring:message code='par.lbl.toolGiTp' />", template:'#= changeToolGiTp(toolGiTp)#', width:100 } //출고유형
                ,{ field:"roDocNo", title:"<spring:message code='par.lbl.invRoDocNo' />", width:120 } //위탁서번호
                ,{ field:"giDt", title:"<spring:message code='par.lbl.toolGiDt' />", attributes:{ "style":"text-align:right"}, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{ "style":"text-align:center"}, width:90 } //출고일
                ,{ field:"returnDt", title:"<spring:message code='par.lbl.toolReturnDt' />", attributes:{ "style":"text-align:right"}, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{ "style":"text-align:center"}, width:90 } //반환일
                ,{ field:"remark", title:"<spring:message code='par.lbl.remark' />", width:100 } //비고
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }

        //  공구출고유형
        changeToolGiTp = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = toolGiTpChkObj[val];
            }
            return returnVal;
        };


        function fnChkDateValue(e){

            var  elmt = e.sender.element[0],
                 id = elmt.id,
                 toYY,
                 toMM,
                 toDD,
                 frYY,
                 frMM,
                 frDD;

            if(this.value() == null){
                if(id === 'sGiDtFr'){
                    var minDate = new Date(sevenDtBf);
                        frYY = minDate.getFullYear();
                        frMM = minDate.getMonth();
                        frDD = minDate.getDate();
                        $("#sGiDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                        $("#sGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sGiDtTo'){
                    var maxDate = new Date(toDt);
                        toYY = maxDate.getFullYear();
                        toMM = maxDate.getMonth();
                        toDD = maxDate.getDate();

                        $("#sGiDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                        $("#sGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }else{
                if(id === 'sGiDtFr'){
                    frYY = this.value().getFullYear();
                    frMM = this.value().getMonth();
                    frDD = this.value().getDate();
                    $("#sGiDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }else if(id === 'sGiDtTo'){
                    toYY = this.value().getFullYear();
                    toMM = this.value().getMonth();
                    toDD = this.value().getDate();
                    $("#sGiDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                }
            }
        }
    });
</script>