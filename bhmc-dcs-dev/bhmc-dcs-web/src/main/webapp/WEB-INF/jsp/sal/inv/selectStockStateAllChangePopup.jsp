<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 일괄변경 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSave" class="btn_m"><spring:message code='global.btn.save' /></button>  <!-- 저장 -->
        </div>
    </div>

    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:30%;">
                <col style="width:70%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.stockCd' /></th>       <!-- 재고유형 -->
                    <td>
                        <input type="text" id="sStockTp" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.cmpCarYn' /></th>      <!-- 회사차여부 -->
                    <td>
                        <input type="text" id="sCmpCarYn" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.cmpCarDstinCd' /></th>      <!-- 회사차구분 -->
                    <td>
                        <input type="text" id="sCmpCarDstinCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.strge' /></th>     <!-- 창고 -->
                    <td>
                        <input type="text" id="sStrgeCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.location' /></th>      <!-- 위치 -->
                    <td>
                        <input type="text" id="sLocCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</section>
<!-- //일괄변경 팝업 -->

<script>

//재고유형 SAL074
var stockDSList = [];
var stockTpObj = {};
<c:forEach var="obj" items="${stockTpDS}">
  stockDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  stockTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//회사차 여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//회사차구분 SAL053
var cmpCarDstinCdDSList = [];
var cmpCarDstinCdObj = {};
<c:forEach var="obj" items="${cmpCarDstinCdDS}">
  cmpCarDstinCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  cmpCarDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
  storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
  strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

//위치
var locDSList = [];
var locCdObj = {};

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

    // 재고유형
    $("#sStockTp").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stockDSList
       ,optionLabel:" "           //선택
    });

    // 회사차여부
    $("#sCmpCarYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ynList
       ,optionLabel:" "           //선택
    });

    // 회사차구분
    $("#sCmpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:cmpCarDstinCdDSList
       ,optionLabel:" "           //선택
    });

    // 창고
    $("#sStrgeCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:storageDSList
       ,optionLabel:" "           //선택
       ,select:function (e){
           var dataItem = this.dataItem(e.item);
           $("#sLocCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sLocCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.cmmCd == ""){
               $("#sLocCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sLocCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/inv/stockState/selectLocation.do' />"
               ,data:JSON.stringify( dataItem.cmmCd )
               ,async:false
           });
           $("#sLocCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    // 위치
    $("#sLocCd").kendoExtDropDownList({
        dataTextField :"locNm"
       ,dataValueField:"locCd"
       ,optionLabel:" "           //선택
    });
    $("#sLocCd").data("kendoExtDropDownList").enable(false);

    // 저장
    $("#btnSave").kendoButton({
        click:function(e){
            var data = {};

            data.stockTp =  $("#sStockTp").data("kendoExtDropDownList").value();
            data.cmpCarYn =  $("#sCmpCarYn").data("kendoExtDropDownList").value();
            data.cmpCarDstinCd =  $("#sCmpCarDstinCd").data("kendoExtDropDownList").value();
            data.strgeCd =  $("#sStrgeCd").data("kendoExtDropDownList").value();
            data.locCd =  $("#sLocCd").data("kendoExtDropDownList").value();
            data.locNm =  $("#sLocCd").data("kendoExtDropDownList").text();

            data.state = "01";
            options.callbackFunc(data);
        }
    });


});
</script>