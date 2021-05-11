<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:17%;">
                <col style="width:24%;">
                <col style="width:17%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.empNo" /></th>
                    <td>
                        <input id="sEmpNo" name="sEmpNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="par.lbl.receiveNm" /></th>
                    <td>
                        <input id="sUsrNm" name="sUsrNm" class="form_input">
                    </td>
                    <th></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.returner" /><!-- returner --></th>
                    <td class="required_area">
                        <input id="sReturnerNm" class="form_input" disabled="disabled" />
                        <input type="hidden" id="sReturnerId" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="par.lbl.returnPartsQty" /><!-- returner --></th>
                    <td class="required_area">
                        <input id="sReturnPartsQty" class="form_numeric ar" />
                        <input type="hidden" id="endQty" />
                        <input type="hidden" id="endQtyTot" />
                        <input type="hidden" id="endQtyItemTot" />
                    </td>
                    <th></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="par.lbl.remark" /><!-- remark --></th>
                    <td colspan="3">
                        <textarea id="sRemark" name="sRemark" rows="2" cols="30" class="form_textarea" ></textarea>
                    </td>
                    <th></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>

</section>

<script type="text/javascript">

//techCdList
var tecCdList = [];
<c:forEach var="obj" items="${tecCdList}">
tecCdList.push({"tecId":"${obj.usrId}", "tecNm":"${obj.usrNm}"});
</c:forEach>
var tecCdMap = {};
$.each(tecCdList, function(idx, obj){
    tecCdMap[obj.tecId] = obj.tecNm;
});

    $(document).ready(function() {

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var popupWindow = parent.issueReturnPopupButtonWindow;
         var options = popupWindow.options.content.data;


        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            //$("#btnSelect").click();
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

                var endQty = $("#endQty").val();
                var endQtyItemTot = $("#endQtyItemTot").val();
                var endQtyTot = $("#endQtyTot").val();

                var returnPartsQty = $("#sReturnPartsQty").val();

                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                if(data.length > 0){
                    $("#sReturnerId").val(data[0].usrId);
                    $("#sReturnerNm").val(data[0].usrNm);
                }

                if($("#sReturnerId").val() === ""){
                    //returner is required.
                    dms.notification.info("<spring:message code='par.lbl.returner' var='returner' /><spring:message code='global.info.required.field' arguments='${returner}' />");
                    return;
                }

                if(kendo.parseFloat(returnPartsQty) <= 0){
                    //returnPartsQty count zero check message
                    dms.notification.info("<spring:message code='par.lbl.returnPartsQty' var='returnPartsQty' /><spring:message code='par.info.issueOutZeroMsg' arguments='${returnPartsQty}' />");
                    $("#sReturnPartsQty").focus();

                    return false;
                }

                if(kendo.parseFloat(returnPartsQty) > kendo.parseFloat(endQtyItemTot)){
                    //returnPartsQty count zero check message
                    dms.notification.info("<spring:message code='par.lbl.returnPartsQty' var='returnPartsQty' /><spring:message code='par.lbl.giQty' var='giQty' /><spring:message code='par.info.itemReqCntMsg' arguments='${returnPartsQty},${giQty}' />");

                    return false;
                }

                var retData = { flag:"Y", returnNm:$("#sReturnerId").val(), returnPartsQty:returnPartsQty * -1, remark:$("#sRemark").val()};

                if(data.length > 0){
                    retData = { flag:"Y", returnNm:data[0].usrId, returnPartsQty:returnPartsQty * -1, remark:$("#sRemark").val()};
                }

                console.log("return data 1 : ", retData);
                options.callbackFunc(retData);
                parent.issueReturnPopupButtonWindow.close();

            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        if (options.usrId) {
            $("#sUsrId").val(options.usrId);
        }

        if (options.usrNm) {
            $("#sUsrNm").val(options.usrNm);
        }

        //returnPartsQty
        $("#sReturnPartsQty").kendoExtNumericTextBox({
            format:"n2"
            ,decimals:2
            ,min:0
            ,spinners:false
            ,value:1
        });

        //반품시 반품인 기 수령인 설정.
        if(options.receiveId !== undefined || options.receiveId !== null){
            $("#sReturnerId").val(options.receiveId);
            $("#sReturnerNm").val(tecCdMap[options.receiveId]);
            $("#endQty").val(options.endQty);
            $("#endQtyItemTot").val(options.endQtyItemTot);
            $("#endQtyTot").val(options.endQtyTot);
        }


        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0628-142801"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/par/ism/issueReq/selectUsersByRoleRecipientes.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sEmpNo"] = $("#sEmpNo").val();
                            params["sUsrNm"] = $("#sUsrNm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:true
                ,schema:{
                    model:{
                        id:"usrNm"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,usrId:{type:"string", validation:{required:true}}
                            ,usrNm:{type:"string", validation:{required:true}}
                            ,empNo:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            ,dataBound:function (e) {
                var dataItems = e.sender.dataSource.view();

                for (var j=0; j < dataItems.length; j++) {
                    delete  dataItems[j]["usrPw"];
                }
            }
            ,multiSelectWithCheckbox:false
            ,selectable:options.selectable === "multiple"? "multiple, row":"row"
            ,editable:false
            ,autoBind:false
            ,height:288
            ,pageable:false
            ,sortable:false
            ,columns:[
                {field:"empNo", title:"<spring:message code='global.lbl.empNo' />", width:150}
                ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:150}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }else{
            $("#grid").data("kendoExtGrid").dataSource.data([]);
        }
    });
</script>
