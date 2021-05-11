<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약 용품조회 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
        </div>
    </div>

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per">
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
                    <th scope="row"><spring:message code='global.lbl.strge' /></th>          <!-- 창고 -->
                    <td>
                        <input id="sStrgeCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                    <td>
                        <input id="sCarlineNm" type="text" readonly class="form_input form_readonly"  />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.goodsCd' /></th><!-- 용품코드 -->
                    <td>
                        <input id="sItemCd" type="text" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.goodsNm' /></th><!-- 용품명 -->
                    <td>
                        <input id="sItemNm" type="text" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->
    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->


    <span style="display:none">
        <!-- 딜러코드 -->
        <input type="hidden" id="sDlrCd"  />
        <input type="hidden" id="sCarlineCd"  />
    </span>

</section>
<!-- //계약 차량조회(차량마스터) 팝업 -->

<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

//구매단가유형:PAR131
var prcTpList = [];
var prcTpObj = {};
<c:forEach var="obj" items="${prcTpDS}">
    prcTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    prcTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    $("#sDlrCd").val(options.sDlrCd);
    $("#sCarlineCd").val(options.sCarlineCd);
    $("#sCarlineNm").val(options.sCarlineNm);

    // 창고
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:" "           //선택
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $('#grid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                //data.push(selectedItem);
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                options.callbackFunc(data);
            } else {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cnt/contractRe/selectItemSalePrcPopupByCondition.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]  = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"]  = options.skip + options.take;
                        params["sort"]       = options.sort;

                        params["sDlrCd"]      = $("#sDlrCd").val();
                        params["sCarlineCd"]  = $("#sCarlineCd").val();
                        params["sItemCd"]     = $("#sItemCd").val();
                        params["sItemNm"]     = $("#sItemNm").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                   // dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"itemCd"
                    ,fields:{
                         dlrCd           :{type:"string"}
                        ,itemCd          :{type:"string"}     //품목코드
                        ,itemNm          :{type:"string"}     //품목명
                        ,stockUnitCd     :{type:"string"}     //재고단위
                        ,prcTp           :{type:"string"}     //구매단가유형
                        ,salePrcAmt      :{type:"number"}     //판매단가
                        ,carlineCd       :{type:"string"}     //
                        ,carlineNm       :{type:"string"}     //
                        ,purcLeadHm      :{type:"string"}     //구매리드타임
                        ,grStrgeCd       :{type:"string"}     //입고창고
                        ,giStrgeCd       :{type:"string"}     //출고창고
                        ,avlbStockQty    :{type:"number"}     //가용재고
                    }
                }
            }
        }
        ,editable:false
        ,sortable:false
        ,autoBind:true
        ,selectable:"row"
        ,height  :236
        ,columns:[
             {field:"dlrCd", hidden:true}
            ,{field:"itemCd",      title:"<spring:message code='sal.lbl.goodsCd' />",   width:100, attributes:{"class":"ac"}} // 용품코드
            ,{field:"itemNm", title:"<spring:message code='global.lbl.goodsNm' />", width:150, attributes:{"class":"al"}}          // 용품명
            ,{field:"stockUnitCd", title:"<spring:message code='sal.lbl.unit' />", width:70, attributes:{"class":"ac"}}        // 단위
            ,{
                field:"prcTp", title:"<spring:message code='par.lbl.purcPrcTp' />", width:100, attributes:{"class":"ar"}
                , template:"#=dms.string.strNvl(prcTpObj[prcTp])#"
            }          // 구매단가유형
            ,{field:"salePrcAmt",  title:"<spring:message code='par.lbl.salePrcAmt' />",   width:100,  attributes:{"class":"ar"}, format:"{0:n2}"}     // 판매단가
            ,{field:"carlineCd",    hidden:true}    // 차종
            ,{field:"carlineNm",    title:"<spring:message code='global.lbl.carlineNm' />",     width:150,  attributes:{"class":"al"}}    // 차종명
            ,{field:"purcLeadHm",      hidden:true}     // 구매리드타임
            ,{
                field:"grStrgeCd", title:"<spring:message code='par.lbl.grStrgeCd' />",   width:100,  attributes:{"class":"al"}
                , template:"#=dms.string.strNvl(strgeCdObj[grStrgeCd])#"
            }    // 입고창고
            ,{
                field:"giStrgeCd", title:"<spring:message code='par.lbl.giStrgeCd' />",   width:100,  attributes:{"class":"al"}
                , template:"#=dms.string.strNvl(strgeCdObj[giStrgeCd])#"
            }    // 출고창고
            ,{field:"avlbStockQty",  title:"<spring:message code='global.lbl.avlbStockQty' />",   width:100,  attributes:{"class":"ar"}, format:"{0:n0}"}     // 가용재고
        ]
    });

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

});
</script>
<!-- //script -->