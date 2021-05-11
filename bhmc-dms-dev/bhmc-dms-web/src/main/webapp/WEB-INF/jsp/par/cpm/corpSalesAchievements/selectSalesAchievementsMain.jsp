<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- content -->
<section id="content">
    <!-- 실적관리 -->
    <section class="group">
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="par.title.corpSalesAchievement" /></h1> --%>
            <div class="btn_right">
                <button id="btnSearch" class="btn_m btn_search"><spring:message code="par.btn.search" /><!-- btnSearch --></button>
                <button class="btn_m btn_reset" id="btnInit" type="button"><spring:message code="par.btn.init" /></button><!--btnInit  -->
                <button class="btn_m btn_save" id="btnSave" type="button"><spring:message code="par.btn.save" /></button><!--btnSave  -->
            </div>
        </div>

        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.dlrCd" /></span></th>
                        <td>
                            <input id="sDlrCd" type="text" value="" class="form_input form_required" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.saleType" /></th>
                        <td>
                            <input id="sSaleTp" value="" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.year" /></th>
                        <td>
                            <input id="sYear" value="" class="form_comboBox" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div class="grid"></div>
        </div>
    </section>
    <!-- // 업무관리(계획실적) -->

</section>
<!-- //content -->

<!-- script -->
<script>
//saleTypeCdList
var saleTypeCdList = [];
<c:forEach var="obj" items="${saleTypeCdList}">
saleTypeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//page init Func
function pageInit(){
    $("#sDlrCd").val("");
    $("#sSaleTp").data("kendoExtDropDownList").select(0);
    $("#sYear").data("kendoExtDropDownList").select(0);
}
//salePlan excel file upload Popup Func
var salePlanExcelUploadPopupWin;
function selectSalePlanExcelUploadPopupWindow(){

    salePlanExcelUploadPopupWin = dms.window.popup({
        windowId:"salePlanExcelUploadPopupWin"
        ,title:""   //salePlanExcelUpload
        ,width:850
        ,height:380
        ,content:{
            url:"<c:url value='/par/cmm/selectSalePlanExcelUploadPopup.do'/>"
            ,data:{
                "autoClose":true
                ,"callbackFunc":function(data){
/*                     if(data.length > 0){

                        for(var i=0; i<data.length; i++){
                            var bCheck = false;
                            var grid = $('#storageMoveGrid').data('kendoExtGrid');
                            var checkRows = grid.tbody.find("tr");
                            checkRows.each(function(index, checkRow) {
                                var dataItem = grid.dataItem(checkRow);
                                if(dataItem.itemCd == data[i].itemCd){
                                    bCheck = true;
                                }
                            });

                            if(!bCheck){
                                if(data[i].avlbStockQty > 0){
                                    var total = $("#grid").data("kendoExtGrid").dataSource.total()+1;
                                    BinLocationItemVO = {
                                        rnum:total + 1
                                        ,dlrCd:null
                                        ,etcGiDocNo:$("#sEtcGiDocNo").val()
                                        ,etcGiDocLineNo:total + 1
                                        ,cancYn:"N"
                                        ,itemCd:data[i].itemCd
                                        ,itemNm:data[i].itemNm
                                        ,unitCd:data[i].unitCd
                                        ,strgeStockQty:data[i].baseAvlbStockQty
                                        ,strgeMoveStockQty:data[i].avlbStockQty
                                        ,giStrgeCd:$("#sOutStrgeCd").val()
                                        ,giLocCd:""
                                        ,grStrgeCd:""
                                        ,grLocCd:""
                                        ,grReasonCd:null
                                        ,mvtDocYyMm:""
                                        ,mvtDocNo:""
                                        ,mvtDocLineNo:0
                                    }
                                    $("#grid").data("kendoExtGrid").dataSource.add(BinLocationItemVO).set("dirty", true);
                                }
                            }
                        }
                    } */
                }
            }
        }
    });
}

    $(document).ready(function() {

        //btnSearch
        $("#btnSearch").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });
        //btnExcelUpload
        /*
        $("#btnExcelUpload").kendoButton({
            click:function(e){
                //selectSalePlanExcelUploadPopupWindow Func call
                selectSalePlanExcelUploadPopupWindow();
            }
        });
        */
        //btnInit
        $("#btnInit").kendoButton({
            click:function(e){
                //pageInit Func call
                pageInit();
            }
        });
        //btnSave
        $("#btnSave").kendoButton({
            click:function(e){
                // ready message
                dms.notification.success("<spring:message code='global.info.ready'/>");
            }
        });

        //sDlrCd
        var sDlrCd = $("#sDlrCd").kendoMaskedTextBox({
            mask:"AAAAA"
            ,promptChar:" "
        });
        sDlrCd.bind("keyup", function(){
            var that = $(this).data("kendoMaskedTextBox");
            this.value = that.raw().toUpperCase();
        });
        //sPreAmtTp
        $("#sSaleTp").kendoExtDropDownList({
            dataSource:saleTypeCdList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });
        //sYear TODO:[InBoShim] year datalist setting.
        $("#sYear").kendoExtDropDownList({
            dataSource:[{cmmCd:2015, cmmCdNm:2015},{cmmCd:2016,  cmmCdNm:2016},{cmmCd:2017,  cmmCdNm:2017}]
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,optionLabel:" "
            ,autoBind:true
            ,index:0
        });

        $(".grid").kendoGrid({
            height:500,
            columns:[{
                field:"",
                title:"",
                width:100
            },{
                title:"<spring:message code='par.lbl.saleYearNow'/>",//M 年
                headerAttributes:{ "class":"hasBob" },
                columns:
                    [
                        //{field:"year", title:"<spring:message code='par.lbl.year'/>", width:50 }// 년
                        //,{field:"saleType", title:"<spring:message code='par.lbl.saleType'/>", width:60 }// 판매유형
                        {field:"salePlanAmtYearNow", title:"<spring:message code='par.lbl.salePlanAmt'/>", width:100 }// 목표금액:目标金额
                        ,{field:"saleItemQtyYearNow", title:"<spring:message code='par.lbl.saleItemQty'/>", width:60 }// 건수:件數
                        ,{field:"saleQtyYearNow", title:"<spring:message code='par.lbl.saleQty'/>", width:100} // 수량:数量
                        ,{field:"saleAmtYearNow", title:"<spring:message code='par.lbl.saleAmt'/>",width:100} // 금액:金额
                        ,{field:"salePercentYearNow", title:"<spring:message code='par.lbl.salePercent'/>", width:40}
                    ]
            },{
                title:"<spring:message code='par.lbl.saleYearMinusOne'/>",//M-1 年
                headerAttributes:{ "class":"hasBob" },
                columns:
                    [
                        //{field:"year", title:"<spring:message code='par.lbl.year'/>", width:50 }// 년
                        //,{field:"saleType", title:"<spring:message code='par.lbl.saleType'/>", width:60 }// 판매유형
                        {field:"salePlanAmtYearMinusOne", title:"<spring:message code='par.lbl.salePlanAmt'/>", width:100 }// 목표금액:目标金额
                        ,{field:"saleItemQtyYearMinusOne", title:"<spring:message code='par.lbl.saleItemQty'/>", width:60 }// 건수:件數
                        ,{field:"saleQtyYearMinusOne", title:"<spring:message code='par.lbl.saleQty'/>", width:100} // 수량:数量
                        ,{field:"saleAmtYearMinusOne", title:"<spring:message code='par.lbl.saleAmt'/>",width:100} // 금액:金额
                        ,{field:"salePercentYearMinusOne", title:"<spring:message code='par.lbl.salePercent'/>", width:40}
                    ]
            }]
        });
    });
</script>
<!-- //script -->