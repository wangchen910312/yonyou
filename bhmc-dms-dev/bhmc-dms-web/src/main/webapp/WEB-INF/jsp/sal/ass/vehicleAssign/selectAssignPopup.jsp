<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section id="windows" class="pop_wrap">
    <!-- 배정정보 -->
    <section class="group">
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_m" id="btnAssign" name="btnAssign"><spring:message code='global.btn.assign' /></button><!-- 배정 -->
                <button class="btn_m" id="btnClose" name="btnClose"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
            </div>
        </div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:20%;">
                    <col style="width:10%;">
                    <col style="width:25%;">
                    <col style="width:11%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                        <td class="readonly_area">
                            <input id="sCarlineCd" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                        <td class="readonly_area">
                            <input id="sModelCd" class="form_input" readonly>
                        </td>
                        <th scope="row">OCN</th>
                        <td class="readonly_area">
                            <input id="sOcnCd" class="form_input" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                        <td class="readonly_area">
                            <input id="sExtColorCd" type="text" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                        <td class="readonly_area">
                            <input id="sIntColorCd" type="text" class="form_input" readonly>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlReqDt' /></th><!-- 인도요청일 -->
                        <td class="readonly_area">
                            <input id="sDlReqDt" class="form_datepicker" readonly>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //배정정보 -->


    <!-- 차량조회 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic">차량조회</h1>
        </div>
        <div class="table_grid">
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //차량조회 -->
</section>
<!-- //배정관리-배정 팝업 -->



<script type="text/javascript">

/**
 * 팝업 옵션
 */
var options = parent.assignPopupWin.options.content.data;
//alert(parent.assignPopupWin.options.title);
//alert(parent.assignPopupWin.options);

var dlrCd = options.dlrCd;
var contractNo = options.contractNo;
var vinNo = options.vinNo;



//재고상태 Array
var stockTpList = [];
<c:forEach var="obj" items="${stockTpList}">
    stockTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
// 재고상태 Map
var stockTpMap = dms.data.arrayToMap(stockTpList, function(obj){ return obj.cmmCd; });


$(document).ready(function() {


    //조회조건 - 인도요칭일
    $("#sDlReqDt").kendoDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
    });

    $("#sCarlineCd").val(options.carlineNm);
    $("#sModelCd").val(options.modelNm);
    $("#sOcnCd").val(options.ocnNm);
    $("#sExtColorCd").val(options.extColorNm);
    $("#sIntColorCd").val(options.intColorNm);
    $("#sDlReqDt").data("kendoDatePicker").value(options.dlReqDt);

    var carlineCd = options.carlineCd;
    var modelCd = options.modelCd;
    var ocnCd = options.ocnCd;
    var extColorCd = options.extColorCd;
    var intColorCd = options.intColorCd;
    var dlReqDt = options.dlReqDt;



    /**************************** //검색 조건 **************************************/



    //버튼 - 닫기
    $("#btnClose").kendoButton({
        click:function(e){
            parent.assignPopupWin.close();
       }
    });



    //버튼 - 배정
    $("#btnAssign").kendoButton({
        click:function(e){
            // 배정 하시겠습니까?
            if (confirm("배정처리 하시겠습니까?") == false ){
                return false;
            }

            $.ajax({
                url:"<c:url value='/sal/ass/vehicleAssign/vehicleAssign.do' />",
                dataType:"json",
                type:"POST",
                contentType:"application/json",
                data:JSON.stringify(getSaveData()),
                async:false,
                error:function(jqXHR,status,error){
                    //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                },
                success:function(jqXHR, textStatus){
                    options.callbackFunc();
                    parent.assignPopupWin.close();
                }
            });
       }
    });




    /***************************** //버튼 이벤트  **********************************/


    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/ass/vehicleAssign/selectAssignPopupList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};


                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        //params["sDlReqDt"] = $("#sDlReqDt").val();            // 인도요청일
                        params["sCarlineCd"] = carlineCd;                       // 차종
                        params["sModelCd"] = modelCd;                           // 모델
                        params["sOcnCd"] = ocnCd;                               // OCN
                        params["sExtColorCd"] = extColorCd;                     // 외장색
                        params["sIntColorCd"] = intColorCd;                     // 내장색

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    fields:{
                        vinNo      :{type:"string"}
                        ,carlineNm :{type:"string"}
                        ,modelNm   :{type:"string"}
                        ,ocnNm     :{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,manufactYyMmDt:{type:"date"}
                        ,stockTp   :{type:"string"}
                        ,strgeNm   :{type:"string"}
                        ,locCd     :{type:"string"}
                    }
                }
            }
        }
        ,height:250
        ,editable:false
        ,columns:[
                {field:"vinNo", title:"VIN NO", width:150,attributes:{"class":"ac"}}  //VIN NO
                ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150,attributes:{"class":"ac"}}    //차종
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:250,attributes:{"class":"al"}}        //모델
                ,{field:"ocnNm", title:"OCN", width:200,attributes:{"class":"ac"}}    //OCN
                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:100,attributes:{"class":"ac"}}  //외장색
                ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:100,attributes:{"class":"ac"}}  //내장색
                ,{field:"manufactYyMmDt", title:"<spring:message code='global.lbl.creYm' />", width:100,attributes:{"class":"ac"}} //생산년월
                ,{field:"stockTp", title:"<spring:message code='global.lbl.stockStat' />", width:100,attributes:{"class":"ac"}     //재고상태
                  ,template:"# if(stockTpMap[stockTp] != null){# #= stockTpMap[stockTp].cmmCdNm# #}#"
                 }
                ,{field:"strgeNm", title:"<spring:message code='global.lbl.strge' />", width:100,attributes:{"class":"ac"}}        //창고
                ,{field:"locCd", title:"<spring:message code='global.lbl.location' />", width:100,attributes:{"class":"ac"}}       //위치
                ]

    });

});



function getSaveData(){
    var grid = $("#grid").data("kendoExtGrid");
    var selectIdx = grid.select().index();

    if(selectIdx ==  -1 ){
        dms.notification.warning("배정할 row를  선택해주세요.");
        return false;
    }

    var data = grid.dataSource.view();
    var selectVal = data[selectIdx];

    var saveData = {
            dlrCd:dlrCd,
            contractNo:contractNo,
            vinNo:selectVal.vinNo
        };

        return saveData;
}


</script>









