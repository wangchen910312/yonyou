<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />


<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.strOrdOcnBlocking' /></h1>
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12387" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
		</dms:access>
		<dms:access viewId="VIEW-I-12386" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSave" type="button" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>          <!-- 저장 -->
		</dms:access>
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:24%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>       <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th>       <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.dealer" /></th>   <!-- 딜러 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sDlrCd1" readonly class="form_input form_readonly" />
                                    <a href="javascript:bf_dealerSearchPopup(1);"><spring:message code='global.btn.search' /></a>    <!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sDlrNm1" readonly class="form_input" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.targetDlr" /></th>    <!-- 대상 딜러 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sDlrCd2" readonly class="form_input form_readonly" />
                                    <a href="javascript:bf_dealerSearchPopup(2);"><spring:message code='global.btn.search' /></a>    <!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sDlrNm2" readonly class="form_input" />
                            </div>
                        </div>
                    </td>
                    <td colspan="2">
                        <button type="button" id="btnCopy" class="btn_s"><spring:message code="global.btn.copy" /></button>    <!-- 복사 -->
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12385" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" id="btnAllCopy" class="btn_s"><spring:message code="sal.btn.allDlrCopy" /></button><!-- 전체 딜러 복사 -->
		</dms:access>
        </div>
    </div>
    <div class="table_grid">
        <div id="grid"></div>
    </div>

<span style="display:none">

    <!-- ocn을 조회조건에서 선택해서 조회 했을 경우. -->
    <input type="hidden" id="searchOcn" value="N" />

</span>
</section>

<script type="text/javascript">
//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>


var dealerSearchPopupWin;

var gridColumns = [];

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){

            if( $("#sCarlineCd").data("kendoExtDropDownList").value() == ""){
                // {차종}를(을) 선택해주세요.
                dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
                return false;
            }

            if( $("#sModelCd").data("kendoExtDropDownList").value() == ""){
                // {모델}를(을) 선택해주세요.
                dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
                return false;
            }

            if($("#sOcnCd").data("kendoExtDropDownList").value() != ""){
                $("#searchOcn").val('Y');
            }else{
                $("#searchOcn").val('N');
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){

            var saveData = $("#grid").data("kendoExtGrid").getCUDData("insertOcnList", "updateOcnList", "deleteOcnList");
            if ($("#grid").data("kendoExtGrid").cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            var param = $.extend( saveData, {"searchOcn":$("#searchOcn").val()} );

            $.ajax({
                url:"<c:url value='/sal/stm/strOrdOcnBlocking/multiStrOrdOcnBlockings.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(error);
                }
                ,success:function(jqXHR, textStatus) {
                    var grid = $("#grid").data("kendoExtGrid");
                    grid.dataSource._destroyed = [];
                    grid.dataSource.page(1);

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });


    // 딜러 복사
    $("#btnCopy").kendoButton({
        enable:true,
        click:function(e){

            if( $("#sDlrCd1").val() == "" ){
                // 딜러를(을) 선택해주세요.
                dms.notification.info("<spring:message code='global.lbl.dealer' var='globalLblDealer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblDealer}' />");
                return false;
            }

            if( $("#sDlrCd2").val() == "" ){
             // 전체딜러를(을) 선택해주세요.
                dms.notification.info("<spring:message code='sal.lbl.targetDlr' var='salLblTargetDlr' /><spring:message code='global.info.chkSelectItemMsg' arguments='${salLblTargetDlr}' />");
                return false;
            }

            var param = { "dlrCd":$("#sDlrCd1").val()
                        , "dlrCd2":$("#sDlrCd2").val()
                        };

            $.ajax({
                url:"<c:url value='/sal/stm/strOrdOcnBlocking/strOrdOcnBlockingDlrCopys.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(error);
                }
                ,success:function(jqXHR, textStatus) {
                    var grid = $("#grid").data("kendoExtGrid");
                    grid.dataSource._destroyed = [];
                    grid.dataSource.page(1);

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });

        }
    });

    // 전체딜러 복사
    $("#btnAllCopy").kendoButton({
        enable:true,
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){

                $.ajax({
                    url:"<c:url value='/sal/stm/strOrdOcnBlocking/strOrdOcnBlockingAllDlrCopys.do' />"
                    ,data:JSON.stringify(selectedItem)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(error);
                    }
                    ,success:function(jqXHR, textStatus) {
                        var grid = $("#grid").data("kendoExtGrid");
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });

            }else{

                // 딜러를 선택해주세요.
                dms.notification.warning("<spring:message code='global.lbl.dealer' var='globalLblDealer' /><spring:message code='global.info.check.field' arguments='${globalLblDealer}' />");
                return false;
            }
        }
    });

    /**
     * 차종 콤보박스
     */
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "
       ,select:function(e){
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sModelCd").data("kendoExtDropDownList").enable(true);

            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
            $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

            var dataItem = this.dataItem(e.item);
            if(dataItem.carlineCd == ""){
                $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sModelCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/stm/strOrdOcnBlocking/selectModel.do' />"
                ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
                ,async:false
            });
            $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    /**
     * 모델 콤보박스
     */
     $("#sModelCd").kendoExtDropDownList({
         dataTextField:"modelNm"
        ,dataValueField:"modelCd"
        ,optionLabel:" "
        ,select:function(e){
            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sOcnCd").data("kendoExtDropDownList").enable(true);

            var dataItem = this.dataItem(e.item);
            if(dataItem.modelCd == ""){
                $("#sOcnCd").data("kendoExtDropDownList").enable(false);
                return false;
            }
            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/stm/strOrdOcnBlocking/selectOcn.do' />"
                ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
                ,async:false
            });
            $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
     });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    /**
     * ocn 콤보박스
     */
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0726-093702"
        ,dataSource:{
            requestEnd:function(e) {

                var ocnList = e.response.columnList;
                var sColumn = [];
                sColumn = gridColumns.concat(sColumn);
                //sColumn = gridColumns;

                $.each(ocnList, function(idx, row){
                    var ocnColumn = {};
                    ocnColumn["field"] = row.ocnCd;
                    ocnColumn["title"] = row.ocnCd;
                    ocnColumn["width"] = 80;
                    ocnColumn["attributes"] = {"class":"ac"};
                    ocnColumn["template"] = '<input type="checkbox" class="checkbox" onclick="bf_checkStat(this, \'#=uid#\')" id="'+row.ocnCd+'" #= '+row.ocnCd+' == "Y" ? checked="checked":"" #  />';
                    sColumn.push(ocnColumn);
                });

                $("#grid").data("kendoExtGrid").setOptions({ columns:sColumn } );

           }
           ,transport:{
                read:{
                    url:"<c:url value='/sal/stm/strOrdOcnBlocking/selectStrOrdOcnBlockingSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();
                        params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();

                        params["sDlrCd"] = $("#sDlrCd1").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                //data:"dataSet",
                model:{
                    id:"carlineCd",
                    fields:{
                         dlrCd    :{type:"string"}   //딜러코드
                        ,dlrNm    :{type:"string"}   //딜러코드명
                        ,carlineCd:{type:"string"}   //차종코드
                        ,carlineNm:{type:"string"}   //차종명
                        ,modelCd  :{type:"string"}   //모델코드
                        ,modelNm  :{type:"string"}   //모델명
                    }
                }
            }
        }
       ,selectable:false
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:false               //Tooltip 적용, default:false
       ,pageable:{
           refresh:true
           ,pageSize:20
           ,pageSizes:[ "20", "40", "80", "100"]
       }
       ,filterable:false
       ,height:439
       ,editable   :false
       ,resizable  :true
       ,autoBind   :false
       ,selectable :"row"
       ,navigatable:true
       ,sortable:false
       ,change:onChangeSelection
       ,columns:[
            {
                field:"chk", title:"&nbsp;", width:40
                ,headerAttributes:{style:"text-align:center;"}
                ,attributes:{style:"text-align:center;"}
                ,template:'<input type="checkbox" data-uid="#= uid #" class="grid-checkbox-item" id="chk"  />'
            }
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", attributes:{"class":"ac"}, width:100}
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dealer' />", attributes:{"class":"al"}, width:100}
          ,{field:"carlineCd", title:"<spring:message code='global.lbl.carLine' />", hidden:true, attributes:{"class":"al"}, width:100}
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", attributes:{"class":"ac"}, width:150}
          ,{field:"modelCd", title:"<spring:message code='global.lbl.model' />", hidden:true, attributes:{"class":"al"}, width:100}
          ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", attributes:{"class":"al"}, width:220}
       ]
   });

    gridColumns = $("#grid").data("kendoExtGrid").columns;

});
/******************************************
 * ready () = End =
 ******************************************/

/**
 * 그리드 선택 이벤트 핸들러
 */
onChangeSelection = function(e){
    var rows = e.sender.tbody.find("tr");
    //var rows = $("#"+this.element[0].id).data("kendoGrid").tbody.find("tr");

    rows.each(function(index, row) {
        if($(this).hasClass("k-state-selected")){
            $(this).find(".grid-checkbox-item").prop("checked", true);
        }else{
            $(this).find(".grid-checkbox-item").prop("checked", false);
        }
    });
}

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


// OCN 체크/미체크
bf_checkStat = function(obj, uid){
    var grid = $("#grid").data("kendoExtGrid");
    var row = grid.dataSource.getByUid(uid);

    if(obj.checked){
        //row.set(obj.id, "Y");
        row[obj.id] = "Y";
    }else{
        //row.set(obj.id, "N");
        row[obj.id] = "N";
    }

    row["dirty"] = true;
}


//딜러조회
bf_dealerSearchPopup = function(id){
    dealerSearchPopupWin = dms.window.popup({
        windowId:"dealerSearchPopupWin"
        ,title:"<spring:message code='cmm.title.dlrSearch'/>"   // 딜러 조회
        , content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectDealerPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"closeAfterSelect":true
                    ,"callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sDlrCd"+id).val(data[0].dlrCd);
                            $("#sDlrNm"+id).val(data[0].dlrNm);
                        }
                    }
                }
        }
    });
}


</script>