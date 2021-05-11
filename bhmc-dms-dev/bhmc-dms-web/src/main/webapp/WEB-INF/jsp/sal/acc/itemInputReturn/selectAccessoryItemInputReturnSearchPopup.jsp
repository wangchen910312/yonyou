<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="pop_wrap">
<div id="resizableContainer">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /><!-- 선택 --></button>
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.grDts" /><!-- 입고일자 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sRegDtFr" name="sRegDtFr" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sRegDtTo" name="sRegDtTo" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="par.lbl.grDocNo" /><!-- 입고문서번호 --></th>
                    <td>
                        <input type="text" id="sEtcGrDocNo" name="sEtcGrDocNo" class="form_input" />
                        <input type="hidden" id="sBpNm" />  <!-- 거래처명 -->
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>

    <span style="display:none;">
        <!-- 문서상태 -->
        <input type="text" id="sStatCd" name="sStatCd" class="form_comboBox" />
    </span>
</div>
</section>

<script type="text/javascript">
//입고유형
var mvtTpList = [];
<c:forEach var="obj" items="${mvtTpList}">
mvtTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//입고유형 Map
var mvtTpMap = dms.data.arrayToMap(mvtTpList, function(obj){ return obj.cmmCd; });

//문서상태
var statCdList = [];
<c:forEach var="obj" items="${statCdList}">
statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//문서상태 Map
var statCdMap = dms.data.arrayToMap(statCdList, function(obj){ return obj.cmmCd; });

//조회조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
    //if(dms.string.isEmpty($(this).val())){return;}
    if(dms.string.isEmpty(e.data.from.val())){return;}
    if(dms.string.isEmpty(e.data.to.val())){return;}

    var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
    var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
    if(startDt > endDt){
        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
        $(this).focus();
    }
}

$(document).ready(function() {
    //팝업옵션
    var popupWindow = parent.$("#accessoryItemInputReturnSearchPopup").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    //버튼 - 선택
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length > 0){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                popupOptions.callbackFunc(data);
            }
        }
    });

    //조회조건 - 문서상태
    $("#sStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:statCdList
        ,optionLabel:" "
        ,value:"02"
    });
    $("#sStatCd").data("kendoExtDropDownList").enable(false);


    //조회조건 - 생성일자 조회시작일
    $("#sRegDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,value:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sRegDtFr}' />", "yyyy-MM-dd")
        ,max:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sRegDtTo}' />", "yyyy-MM-dd")
    });

    //조회조건 - 생성일자 조회종료일
    $("#sRegDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,value:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sRegDtTo}' />", "yyyy-MM-dd")
        ,min:kendo.parseDate("<fmt:formatDate pattern='yyyy-MM-dd' value='${sRegDtFr}' />", "yyyy-MM-dd")
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#sRegDtFr").on('change', {from:$("#sRegDtFr"), to:$("#sRegDtTo")}, fnChkSearchDate);
    $("#sRegDtTo").on('change', {from:$("#sRegDtFr"), to:$("#sRegDtTo")}, fnChkSearchDate);

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

    //조회조건 설정
    $("#sBpCd").val(popupOptions.bpCd);
    $("#sBpNm").val(popupOptions.bpNm);

    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0206-054501"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/itemInput/selectAccessoryItemInputDocs.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBpCd"] = $("#sBpCd").val();
                        params["sEtcGrDocNo"] = $("#sEtcGrDocNo").val();
                        params["sRegDtFr"] = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                        params["sRegDtTo"] = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                        params["sStatCd"] = $("#sStatCd").data("kendoExtDropDownList").value();
                        params["sEtcGrDocTp"] = popupOptions.etcGrDocTp

                        return kendo.stringify(params);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:true
            ,schema:{
                model:{
                    id:"etcGiDocNo"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,bpCd:{type:"string"}
                        ,bpNm:{type:"string"}
                        ,invcDocNo:{type:"string"}
                        ,itemCnt:{type:"number"}
                        ,invcTp:{type:"string"}
                        ,regDt:{type:"date"}
                        ,invcStatCd:{type:"string"}
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
            {field:"bpCd", title:"<spring:message code='sal.lbl.bpCd' />", width:105}   //공급업체코드 -> 업체코드
            ,{field:"bpNm", title:"<spring:message code='global.lbl.bpNm' />", width:140}   //공급업체명
            ,{field:"invcDocNo", title:"<spring:message code='sal.lbl.etcGrDocNo' />", width:130} //입고문서번호
            ,{field:"invcStatCd", title:"<spring:message code='global.lbl.docStatCd' />", width:100, hidden:true
                ,template:"# if(statCdMap[invcStatCd] != null) { # #= statCdMap[invcStatCd].cmmCdNm# # }#"
            }//문서상태
            ,{field:"itemCnt", title:"<spring:message code='sal.lbl.itemsCnt' />", attributes:{ "class":"ar"}, width:80}   // 입고건수
            ,{field:"itemQty", title:"<spring:message code='sal.lbl.itemQty' />", attributes:{ "class":"ar"}, width:80}   // 입고수량
            ,{field:"invcTp", title:"<spring:message code='sal.lbl.invcTp' />", width:100   //입고유형
                ,template:"# if(mvtTpMap[invcTp] != null) { # #= mvtTpMap[invcTp].cmmCdNm# # }#"
            }
            ,{field:"regDt", title:"<spring:message code='sal.lbl.grDts' />", format:"{0:<dms:configValue code='dateFormat' />}", attributes:{ "class":"ac"}, width:90 }   //입고일자
        ]
    });
});
 </script>

