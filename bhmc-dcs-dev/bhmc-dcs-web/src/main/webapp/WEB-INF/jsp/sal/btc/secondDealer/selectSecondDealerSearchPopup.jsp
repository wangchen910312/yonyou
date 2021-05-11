<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:13%;">
                <col style="width:20%;">
                <col style="width:13%;">
                <col style="width:20%;">
                <col style="width:16%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.lv2DlrCd" /></th>     <!-- 2급딜러코드 -->
                    <td>
                        <input id="sLv2DlrCd" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.lv2DlrNm" /></th>     <!-- 2급딜러명 -->
                    <td>
                        <input id="sLv2DlrNm" class="form_input"/>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.lv2DlrGrpCd" /></th>  <!-- 2급딜러그룹코드 -->
                    <td>
                        <input id="sDlrGrpCd" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">
$(document).ready(function() {

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var options = parent.popupWindow.options.content.data;
     var autoBind = options.autoBind? options.autoBind:false;


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
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows !== null) {
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                options.callbackFunc(data);

                if (options["closeAfterSelect"] == true) {
                    parent.dealerSearchPopupWin.close();
                }
            }
        }
    });

    /************************************************************
                조회조건 설정
    *************************************************************/
    if (options.lv2DlrCd) {
        $("#sLv2DlrCd").val(options.lv2DlrCd);
        autoBind = true;
    }

    if (options.lv2DlrNm) {
        $("#sLv2DlrNm").val(options.lv2DlrNm);
        autoBind = true;
    }

    if (options.dlrGrpCd) {
        $("#sDlrGrpCd").val(options.dlrGrpCd);
        autoBind = true;
    }

    /************************************************************
                그리드 설정
    *************************************************************/
    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/btc/secondDealer/selectSecondDealerSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sLv2DlrCd"] = $("#sLv2DlrCd").val();
                        params["sLv2DlrNm"] = $("#sLv2DlrNm").val();
                        params["sDlrGrpCd"] = $("#sDlrGrpCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:false
            //,pageSize:0
            ,schema:{
                model:{
                    id:"lv2DlrCd"
                    ,fields:{
                        rnum:{type:"number"}
                        ,lv2DlrCd:{ type:"string" }
                        ,lv2DlrNm:{ type:"string" }
                   }
                }
            }
        }
        ,multiSelectWithCheckbox:options.selectable === "multiple"? true:false
        ,selectable:options.selectable === "multiple"? "multiple,row":"row"
        ,editable:false
        ,autoBind:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,height:255
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                    ,attributes:{"class":"ac"}
            }
            ,{field:"lv2DlrCd", title:"<spring:message code='sal.lbl.lv2DlrOrg' />", width:80
                ,attributes:{"class":"ac"}      //2급딜러
            }
            ,{field:"lv2DlrNm", title:"<spring:message code='global.lbl.lv2DlrNm' />", width:250} //2급딜러명
            ,{field:"dlrGrpCd", title:"<spring:message code='global.lbl.dlrGrpCd' />", width:120
                ,attributes:{"class":"ac"}
            }
            ,{field:"ownRgstNm", title:"<spring:message code='global.lbl.ownRgstNm' />", width:120}
            ,{field:"telNo", title:"<spring:message code='global.lbl.telNo' />", width:100}
            ,{field:"faxNo", title:"<spring:message code='global.lbl.faxNo' />", width:100}
            ,{field:"callCenTelNo", title:"<spring:message code='global.lbl.callCenTelNo' />", width:120}
            ,{field:"emgcCenTelNo", title:"<spring:message code='global.lbl.emgcCenTelNo' />", width:120}
            ,{field:"serCenTelNo", title:"<spring:message code='global.lbl.serDlrTelNo' />", width:140}   // 서비스센터 전화
            ,{field:"salCenTelNo", title:"<spring:message code='global.lbl.salDlrTelNo' />", width:140}   // 영업센터 전화
        ]

    });

    if(autoBind){
        $("#grid").data("kendoExtGrid").dataSource.page(1);
    }
});
</script>









