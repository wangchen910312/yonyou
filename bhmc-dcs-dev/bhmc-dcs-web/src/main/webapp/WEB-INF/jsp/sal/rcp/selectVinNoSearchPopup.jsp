<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->

<%--
    JSP Name : selectVinNoSearchPopup.jsp
    Description : VIN 조회 팝업
    author chibeom.song
    since 2017. 3. 3.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 3. 3.     chibeom.song     최초 생성
--%>
<div id="resizableContainer">
<section id="windows" class="pop_wrap">
<input id="sDlrCd" name="sDlrCd" type="hidden" value="${dlrCd}" />
    <div class="header_area">
        <div class="btn_right">
            <button type="button" id="btnVerify" class="btn_m btnNew btn_s_min5"><spring:message code="ser.btn.verify" /></button>
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button class="btn_m btn_select" id="btnSelect"><spring:message code="global.btn.select" /></button><!-- 선택 -->
        </div>
    </div>
    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per">
        <table>
            <colgroup>
                <col style="width:8%;">
                <col style="width:25%;">
                <col style="width:2%;">
                <col style="width:65%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.carVinNo" /></th> <!-- VIN -->
                    <td class="required_area">
                        <input id="sVinNo" name="sVinNo" type="text" class="form_input" maxlength="17" style="text-transform:uppercase;">
                    </td>
                    <th scope="row"></span></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
</section>
</div>
<script type="text/javascript">

$(document).ready( function(){

    var options = parent.vinNoSearchPopupWindow.options.content.data;

    $("#sVinNo").val(options.sVinNo);

    // 그리드 더블 클릭 이벤트.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

    // 검증 버튼.
    $("#btnVerify").kendoButton({
        click:function(e){
            var vinNo = dms.string.strNvl($("#sVinNo").val());

            if(dms.string.isEmpty(vinNo)){
                dms.notification.info("<spring:message code='ser.lbl.vinNo' var='vinNo' /><spring:message code='global.info.emptyCheckParam' arguments='${vinNo}' />");
                return false;
            } else if(vinNo.length != 17){
                dms.notification.info("<spring:message code='ser.lnfo.chkVinNoLength' />");
                return false;
            }

            $.ajax({
                url:"<c:url value='/ser/cmm/vehOfCustInfo/selectDcsVehicleInfo.do' />"
                ,data:JSON.stringify({sVinNo:$("#sVinNo").val()})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR, status, error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
                ,success:function(result){
                    console.log(result);
                    if(dms.string.strNvl(result.data) != ""){
                        $("#messageId").html("<spring:message code='ser.lbl.vinVerify' />");
                        conformKendoWindow.content( $(".msgDiv").html());
                        conformKendoWindow.open();
                        $(".yes, .no").click(function(){
                            if($(this).hasClass("yes")){
                                $.ajax({
                                    url:"<c:url value='/ser/cmm/vehOfCustInfo/insertDcsVehicleInfo.do' />"
                                    ,data:JSON.stringify({sVinNo:$("#sVinNo").val()})
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR, status, error){
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,success:function(result){
                                        $("#btnSearch").click();
                                    }
                                });
                                conformKendoWindow.close();
                            }
                            conformKendoWindow.close();
                        }).end();
                    } else {
                        dms.notification.info("<spring:message code='ser.lbl.vinNo' var='vinNo' /><spring:message code='par.info.itemInsertNotMsg' arguments='${vinNo}' />");
                    }
                }
            });
        }
    });

    $("#btnSearch").kendoButton({
        click:function(e){

            var vinNo = dms.string.strNvl($("#sVinNo").val());

            if(dms.string.isEmpty(vinNo)){
                dms.notification.info("<spring:message code='ser.lbl.vinNo' var='vinNo' /><spring:message code='global.info.emptyCheckParam' arguments='${vinNo}' />");
                return;
            } else if(vinNo.length < 6){
                dms.notification.info("<spring:message code='sal.lnfo.chkVinNoLength' />");
                return;
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    $("#sVinNo").keypress(function(event){
        if(event.which == 13){
            $("#btnSearch").click();
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length == 0){
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            if(rows !== null) {
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                options.callbackFunc(data);
            }
        }
    });

    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0309-161004"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/rcp/selectVinNoSearchPopupSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] = $("#sVinNo").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    };
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         dlrCd:{type:"string", editable:false }
                        ,carId:{type:"string", editable:false }
                        ,vinNo:{type:"string", editable:false }
                        ,carlineNm:{type:"string", editable:false }
                        ,modelNm:{type:"string", editable:false }
                        ,ocnNm:{type:"string", editable:false }
                    }
                }
            }
        }
        ,dataBound:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var gridDataSource = grid.dataSource;
            if (gridDataSource._data.length == 1) {
                console.log(grid.tbody);
                selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(0);
                grid.select(selectRow);
                $("#btnSelect").click();
            }
        }
        ,height:550
        ,navigatable:false
        ,pageable:true
        ,selectable:"row"
        ,indvColumnVisible:true             //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false        //컬럼순서 변경 개인화 적용. default:true
        //,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,appendEmptyColumn:true             //빈컬럼 적용. default:false
        ,enableTooltip:true                 //Tooltip 적용, default:false
        ,sortable:false
        ,columns:[
             {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:80, attributes:{"class":"ac"}}          /* 딜러코드 */
            ,{field:"carId", title:"<spring:message code='sal.lbl.carId' />", width:150, attributes:{"class":"ac"}}             /* Car Id */
            ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:150, attributes:{"class":"ac"}}          /* VIN */
            ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:100, attributes:{"class":"ac"}}    /* 차종 */
            ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:200, attributes:{"class":"ac"}}        /* 차관 */
            ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:200, attributes:{"class":"ac"}}            /* OCN */
        ]
    });

});
</script>