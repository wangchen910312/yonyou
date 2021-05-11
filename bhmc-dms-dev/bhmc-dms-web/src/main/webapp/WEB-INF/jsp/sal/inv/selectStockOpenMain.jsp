<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 공개재고관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.stockOpenMnt" /></h1> <!-- 공개재고관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10945" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnOpenCancel" class="btn_m"><spring:message code="sal.btn.openCancel" /></button>    <!-- 공개취소 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10944" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"></th>
                    <td colspan="5">
                        <label class="label_check"><input id="tOpenTp01" name="tOpenTp" type="radio" value="1" checked="checked" class="form_check"> <spring:message code='sal.lbl.dlrOpenTp' /><!-- 본딜러공개 --></label>
                        <label class="label_check"><input id="tOpenTp02" name="tOpenTp" type="radio" value="2" class="form_check"> <spring:message code='sal.lbl.dlrNonOpenTp' /><!-- 기타딜러에서 공개한 차 --> </label>
                        <input type="hidden" id="tOpenTp" value="1" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNum' /></th>         <!-- VIN NO -->
                    <td>
                        <input type="text" id="sVinNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>          <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>       <!-- 모델 -->
                    <td>
                        <input id="sFscCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.openUpDt' /></th>       <!-- 설정일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sUpdtStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sUpdtEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr id="trAddr" style="display:none;">
                    <th scope="row"><spring:message code="global.lbl.sung" /><!-- 성 --></th>
                    <td>
                        <input id="sSungCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.city" /><!-- 도시 --></th>
                    <td >
                        <input id="sCityCd" class="form_comboBox" />
                    </td>
                    <th class="bor_none"></th>
                    <td></td>
                    <th class="bor_none"></th>
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
<!-- //공개재고관리 -->

<!-- script -->
<script type="text/javascript">
<!--
//yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";

var toDay = "${toDay}";         // 현재일자
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var userId = "${userId}";

//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//성
var sungCdDs = [];
<c:forEach var="obj" items="${sungList}">
    sungCdDs.push({"saleDlrSungCd":"${obj.saleDlrSungCd}", "saleDlrSungNm":"${obj.saleDlrSungNm}"});
</c:forEach>


var popupWindow;

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            grid_search();
        }
    });

    $("#btnOpenCancel").kendoButton({ // 공개취소
        enable:true,
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length == 0){
                dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
                return false;
            }

            dms.window.confirm({
                message:"<spring:message code='sal.btn.openCancel' var='salBtnOpenCancel' /><spring:message code='global.info.cnfrmMsg' arguments='${salBtnOpenCancel},' />"     // 공개취소를 하시겠습니까?
                ,title :"<spring:message code='global.lbl.info' />"
                ,callback:function(result){
                    if(result){
                        var saveList = [];

                        rows.each(function(index, row) {
                           var dataItem = grid.dataItem(row);
                           saveList.push(dataItem);
                        });
                        var param = {"deleteList":saveList, "chked":"ALL"};

                        $.ajax({
                            url:"<c:url value='/sal/inv/stockOpen/cancelStockOpenDlr.do' />"
                            ,data:JSON.stringify(param)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error) {
                                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }else{
                                    dms.notification.error(error);
                                }
                            }
                            ,success:function(jqXHR, textStatus) {
                                grid.dataSource._destroyed = [];
                                grid.dataSource.page(1);

                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                        });

                    }else{
                        return false;
                    }
                }
            });

        }
    });

    // 본딜러공개
    $("#tOpenTp01").click(function(){
        $("#tOpenTp").val("1");
        $("#btnOpenCancel").show();

        $("#trAddr").hide();
        $("#sSungCd").data("kendoExtDropDownList").value("");
        $("#sCityCd").data("kendoExtDropDownList").value("");

        grid_search();
    });
    // 기타딜러에서 공개한 차
    $("#tOpenTp02").click(function(){
        $("#tOpenTp").val("2");
        $("#btnOpenCancel").hide();
        $("#trAddr").show();
        grid_search();
    });
    $("#tOpenTp").val("1");
    $("#tOpenTp01").prop("checked", true);

    /**
     * 차종 콤보박스
     */
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField :"carlineNm"
       ,dataValueField :"carlineCd"
       ,dataSource :carLineCdList
       ,optionLabel:" "
       ,select:function(e){
           $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sFscCd").data("kendoExtDropDownList").enable(true);

           var dataItem = this.dataItem(e.item);
           if(dataItem.carlineCd == ""){
               $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sFscCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/inv/stockMnt/selectFscList.do' />"
               ,data :JSON.stringify({"sCarlineCd":dataItem.carlineCd})
               ,async :false
           });
           $("#sFscCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    /**
     * 모델 콤보박스
     */
     $("#sFscCd").kendoExtDropDownList({
         dataTextField :"fscNm"
        ,dataValueField :"fscCd"
        ,optionLabel:" "
     });
     $("#sFscCd").data("kendoExtDropDownList").enable(false);

     // 설정일자 시작일
     $("#sUpdtStartDt").kendoExtMaskedDatePicker({
         format :"<dms:configValue code='dateFormat' />"
         ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });
     // 설정일자 종료일
     $("#sUpdtEndDt").kendoExtMaskedDatePicker({
         format :"<dms:configValue code='dateFormat' />"
         ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });
     
     //성
     $("#sSungCd").kendoExtDropDownList({
        dataTextField:"saleDlrSungNm"
       ,dataValueField:"saleDlrSungCd"
       ,optionLabel:" "
       ,dataSource:sungCdDs
       ,select :function(e){
           $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sCityCd").data("kendoExtDropDownList").enable(true);

           var dataItem = this.dataItem(e.item);
           if(dataItem.saleDlrSungCd == ""){
               $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sCityCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/inv/stockMnt/selectCity.do' />"
               ,data :JSON.stringify({"sSaleDlrSungCd":dataItem.saleDlrSungCd})
               ,async :false
           });

           if(responseJson == null || responseJson.data == null){
               responseJson.data = [];
           }
           $("#sCityCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    //도시
    $("#sCityCd").kendoExtDropDownList({
        dataTextField:"saleDlrCityNm"
       ,dataValueField:"saleDlrCityCd"
       ,optionLabel:" "
    });
    $("#sCityCd").data("kendoExtDropDownList").enable(false);

    // 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-1123-180101"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/inv/stockOpen/selectStockOpenSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sOpenTp"] = $("#tOpenTp").val();
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        params["sFscCd"] = $("#sFscCd").data("kendoExtDropDownList").value();
                        params["sUpdtStartDt"] = $("#sUpdtStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sUpdtEndDt"] = $("#sUpdtEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sSungCd"] = $("#sSungCd").data("kendoExtDropDownList").value();
                        params["sCityCd"] = $("#sCityCd").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"carId",
                    fields:{
                        carId:{type:"string"}   // 차량ID
                        ,vinNo:{type:"string"}  // 차대번호
                        ,dlrOpen:{type:"string"}
                        ,dlrCds:{type:"string"}
                        ,dlrNms:{type:"string"}
                        ,dlrCd:{type:"string"}
                        ,dlrNm:{type:"string"}
                        ,sungCd:{type:"string"}
                        ,sungNm:{type:"string"}
                        ,cityCd:{type:"string"}
                        ,cityNm:{type:"string"}
                        ,carlineCd :{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,modelCd:{type:"string"}
                        ,modelNm:{type:"string"}
                        ,ocnCd:{type:"string"}
                        ,ocnNm:{type:"string"}
                        ,extColorCd:{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorCd:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,ordTp:{type:"string"}
                        ,ordTpNm:{type:"string"}
                        ,saleEmpNo:{type:"string"}
                        ,saleEmpNm:{type:"string"}
                        ,saleEmpTel:{type:"string"}
                        ,saleEmpHp:{type:"string"}
                        ,updtUsrId:{type:"string"}
                        ,updtDt:{type:"date"}
                        ,updtDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.updtDtFormat = kendo.parseDate(elem.updtDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
        ,indvColumnVisible:false          //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:false          //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,height:450
        ,autoBind:false
        ,pageable :{
            refresh :true
            ,pageSize :100
            ,pageSizes :[ "100", "150", "200", "250"]
        }
        ,editable:false
        ,change:onChangeSelection
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);
                if($("#tOpenTp").val() == "2"){
                    $(".grid-checkbox-item", row).each(function(){
                        $(this).prop("disabled", true);
                    });
                }
            });
        }
        ,columns:[
           {
               field:"chk", title:"&nbsp;", width:40, sortable:false
              ,headerAttributes:{style:"text-align:center;"}
              ,attributes:{"class":"ac"}
              ,headerTemplate:"<input type='checkbox' class='checkAll' />"
              ,template:'<input type="checkbox" data-uid="#= uid #" class="grid-checkbox-item" id="chk"  />'
           }
          ,{field:"carId", hidden:true}
          ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />", width:150, attributes:{"class":"ac"}}       // vin no
          ,{
              field:"dlrOpen", title:"<spring:message code='sal.lbl.dlrOpen' />", width:150, attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var sp = dms.string.isNotEmpty(dataItem.dlrCds) ? "<spring:message code='sal.lbl.subCont' />" : "";
                    var spanObj = '<a href="#" onclick="bf_stockOpenDlrPopup(\''+dataItem.carId+'\');" >'+sp+'</a>';
                    return spanObj;
                }
          }    // 공개한 딜러
          ,{field:"dlrCds", title:"<spring:message code='sal.lbl.openDlrCd' />", width:150, attributes:{"class":"al"}, hidden:true}     // 공개딜러코드
          ,{field:"dlrNms", title:"<spring:message code='sal.lbl.openDlrNm' />", width:150, attributes:{"class":"al"}, hidden:true}     // 공개딜러명
          ,{field:"dlrCd", title:"<spring:message code='sal.lbl.openDlrCd' />", width:150, attributes:{"class":"al"}}     // 공개한 딜러코드
          ,{field:"dlrNm", title:"<spring:message code='sal.lbl.openDlrNm' />", width:150, attributes:{"class":"al"}}     // 공개한 딜러명
          ,{field:"sungCd", hidden:true }
          ,{field:"sungNm", title:"<spring:message code='global.lbl.sung' />", width:120, attributes:{"class":"al"}}    // 성
          ,{field:"cityCd", hidden:true }
          ,{field:"cityNm", title:"<spring:message code='sal.lbl.city' />", width:120, attributes:{"class":"al"}}    // 도시
          ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",    width:70, attributes:{"class":"ac"}}    // 차종
          ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",    width:80, attributes:{"class":"al"}}    // 차종
          ,{field:"modelCd",       title:"<spring:message code='global.lbl.model' />",        width:120, attributes:{"class":"ac"}, hidden:true}    // 모델
          ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",        width:140, attributes:{"class":"al"}}    // 모델
          ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocn' />",          width:90, attributes:{"class":"ac"}}    // OCN
          ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",        width:150, attributes:{"class":"al"}}   // OCN
          ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColor' />",     width:80, attributes:{"class":"ac"}}    // 외장색
          ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",   width:100, attributes:{"class":"al"}}   // 외장색명
          ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColor' />",     width:80, attributes:{"class":"ac"}}    // 내장색
          ,{field:"intColorNm",    title:"<spring:message code='global.lbl.intColorNm' />",   width:140, attributes:{"class":"al"}, hidden:true}    // 내장색명
          ,{field:"ordTp", hidden:true}    // 오더유형
          ,{field:"ordTpNm",       title:"<spring:message code='global.lbl.orderType' />",   width:120, attributes:{"class":"al"}}    // 오더유형
          ,{field:"saleEmpNo",     title:"<spring:message code='sal.lbl.salesAdvisor' />", hidden:true}    // 오더유형
          ,{field:"saleEmpNm",     title:"<spring:message code='global.lbl.relCustInfo' />", width:120, attributes:{"class":"al"}}    // 연계인
          ,{field:"saleEmpTel",    title:"<spring:message code='sal.lbl.saleEmpTel' />",   width:120, attributes:{"class":"al"}}    // 연계인전화
          ,{field:"saleEmpHp",     title:"<spring:message code='sal.lbl.saleEmpTel' />",   hidden:true}    // 연계인전화
          ,{field:"updtUsrId",     title:"<spring:message code='global.lbl.handler' />",   width:120, attributes:{"class":"al"}}    // 조작인
          ,{field:"updtDtFormat", title:"<spring:message code='sal.lbl.openUpDt' />", attributes:{"class":"ac tooltip-enabled"}, width:100
              , template:"#= dms.string.strNvl(kendo.toString(data.updtDt, '<dms:configValue code='dateFormat' />')) #"} //설정일자
        ]
   });
   resizeGrid();
   grid_search();
   if(parent != null && typeof(parent.lodinghide) != "undefined" ){
       parent.lodinghide();
   }
});

/**
 * 그리드 선택 이벤트 핸들러
 */
onChangeSelection = function(e){
    var that = this;
    var selectRows = this.select();
    $.each(selectRows, function(idx, row){
        if($("#tOpenTp").val() == "2"){
            that.clearSelection(row);
        }
    });
    
    var rows = e.sender.tbody.find("tr");
    rows.each(function(index, row) {
        if($(this).hasClass("k-state-selected")){
            $(this).find(".grid-checkbox-item").prop("checked", true);
        }else{
            $(this).find(".grid-checkbox-item").prop("checked", false);
        }
    });
}

$(document).on("click", ".checkAll", function(e){
    var grid = $("#grid").data("kendoExtGrid")
      , checked = $(this).is(":checked");
    
    if (checked) {
        grid.select(grid.tbody.find(">tr"));
    } else {
        grid.clearSelection();
    }
    
});

/**
* 그리드 목록의 체크박스 체크 여부에 따라 해당 목록을 선택하거나 선택/취소 한다.
*/
$(document).on("click", ".grid-checkbox-item", function(e){

    var grid = $("#grid").data("kendoExtGrid");
    var row = grid.tbody.find("tr[data-uid='" + $(this).attr("data-uid") + "']");

    if($(this).is(":checked")){
        grid.select(row);
    }else{
        $(e.currentTarget).closest("tr").removeClass("k-state-selected");
        $(row).removeClass("k-state-selected");
    }

});


// 공개한 딜러 조회 팝업
function bf_stockOpenDlrPopup(carID){
    popupWindow = dms.window.popup({
        windowId:"stockOpenDlrPopup"
        ,title:"<spring:message code='sal.lbl.dlrOpen' />"   // 공개한 딜러
        ,width:900
        ,height:500
        , modal:true
        ,content:{
            url:"<c:url value='/sal/inv/stockOpen/selectStockOpenDlrPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":true
                ,"sCarId":carID
                ,"callbackFunc":function(data){
                    popupWindow.close();
                }
            }
        }
    });

}

function grid_search(){
    var grid = $("#grid").data("kendoExtGrid");

    if($("#tOpenTp").val() != "2" ){
        grid.showColumn("chk");
        
        grid.showColumn("dlrOpen");
        //grid.showColumn("dlrCds");
        //grid.showColumn("dlrNms");
        grid.hideColumn("dlrCd");
        grid.hideColumn("dlrNm");
        grid.hideColumn("sungNm");
        grid.hideColumn("cityNm");
        grid.showColumn("updtUsrId");
        grid.dataSource._destroyed = [];
        grid.dataSource.page(1);
        //grid.setOptions({sortable: true});
    }else{
        grid.hideColumn("chk");
        
        grid.hideColumn("dlrOpen");
        //grid.hideColumn("dlrCds");
        //grid.hideColumn("dlrNms");
        grid.showColumn("dlrCd");
        grid.showColumn("dlrNm");
        grid.showColumn("sungNm");
        grid.showColumn("cityNm");
        grid.hideColumn("updtUsrId");
        grid.dataSource._destroyed = [];
        grid.dataSource.page(1);
        //grid.setOptions({sortable: false});
    }
}

//그리드 화면 맞춤
function resizeGrid(){
    var resizableGrid = $("div.resizable_grid");

    if(resizableGrid.length == 1){
        var resizableContainer = $("#resizableContainer");
        var offsetHeight = resizableContainer.data("offsetheight")||0;

        if(resizableContainer.length == 1){
            var grid = resizableGrid.data("kendoExtGrid");
            var windowHeight = $(window).innerHeight();
            var resizableContainerHeight = resizableContainer.height();
            var gridHeight = grid.element.height();
            var gridHeaderHeight = $("div.k-grid-header", grid.element).height();
            var gridPagerHeight = $("div.k-grid-pager", grid.element).length == 0? 0:$("div.k-grid-pager", grid.element).height();

            grid.element.height(windowHeight - resizableContainerHeight + gridHeight - 10 + offsetHeight);
            $("div.k-grid-content", grid.element).height(grid.element.height() - gridHeaderHeight - gridPagerHeight - 12 + offsetHeight);
        }
    }
}
//-->
</script>