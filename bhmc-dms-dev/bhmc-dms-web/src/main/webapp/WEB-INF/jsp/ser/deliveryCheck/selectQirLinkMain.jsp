<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 임률관리 마스터 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic">QIR-DMS Interface value check</h1>
        <div class="btn_right">
            <button class="btn_m btn_save" id="btnSave">传送测试</button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            <tbody>
                <tr>
                    <th scope="row">DLR_CD</th><!--DLR_CD  -->
                    <td>
                        <input id="dlrCd" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.dlrCd" /></th><!--DLR_CD  -->
                </tr>
                <tr>
                    <th scope="row">RO_DOC_NO</th><!--RO_DOC_NO  -->
                    <td>
                        <input id="roDocNo" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.roDocNo" /></th><!--RO_DOC_NO  -->
                </tr>
                <tr>
                    <th scope="row">RO_TP</th><!--RO_TP  -->
                    <td>
                        <input id="roTp" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.roTp" /></th><!--RO_TP  -->
                </tr>
                <tr>
                    <th scope="row">VIN_NO</th><!--VIN_NO  -->
                    <td>
                        <input id="vinNo" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.vinNo" /></th><!--VIN_NO  -->
                </tr>
                <tr>
                    <th scope="row">CAR_REG_NO</th><!--CAR_REG_NO  -->
                    <td>
                        <input id="carRegNo" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.carNo" /></th><!--CAR_REG_NO  -->
                </tr>
                <tr>
                    <th scope="row">ENGIN_NO</th><!--ENGIN_NO  -->
                    <td>
                        <input id="enginNo" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.engnNo" /></th><!--ENGIN_NO  -->
                </tr>
                <tr>
                    <th scope="row">RUN_DIST_VAL</th><!--RUN_DIST_VAL  -->
                    <td>
                        <input id="runDistVal" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.nowRunDist" /></th><!--RUN_DIST_VAL  -->
                </tr>
                <tr>
                    <th scope="row">RO_DT</th><!--RO_DT  -->
                    <td>
                        <input id="roDt" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.roDate" /></th><!--RO_DT  -->
                </tr>
                <tr>
                    <th scope="row">CAR_COLOR_CD</th><!--CAR_COLOR_CD  -->
                    <td>
                        <input id="carColorCd" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.color" /></th><!--CAR_COLOR_CD  -->
                </tr>
                <tr>
                    <th scope="row">CAU_CD1</th><!--CAU_CD1  -->
                    <td>
                        <input id="cauCd1" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.cauCd" /></th><!--CAU_CD1  -->
                </tr>
                <tr>
                    <th scope="row">CAU_NM1</th><!--CAU_NM1  -->
                    <td>
                        <input id="cauNm1" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.cauCont" /></th><!--CAU_NM1  -->
                </tr>
                <tr>
                    <th scope="row">PHEN_CD1</th><!--PHEN_CD1  -->
                    <td>
                        <input id="phenCd1" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.phenCd" /></th><!--PHEN_CD1  -->
                </tr>
                <tr>
                    <th scope="row">PHEN_NM1</th><!--PHEN_NM1  -->
                    <td>
                        <input id="phenNm1" type="text"  class="form_input" />
                    </td>
                    <th scope="row" colspan="3">--<spring:message code="ser.lbl.phenNm" /></th><!--PHEN_NM1  -->
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->
<input id="dlrCd" type="hidden" value="${dlrCd}" />

</section>

<script type="text/javascript">

//RO유형 Array
var rpirTpList = [];
<c:forEach var="obj" items="${rpirTpDs}">
rpirTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var rpirTpMap = dms.data.arrayToMap(rpirTpList, function(obj){ return obj.cmmCd; });

//브랜드 Array
var brandCdList = [];
<c:forEach var="obj" items="${brandDs}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//브랜드 Map
var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){ return obj.cmmCd; });


//법인구분
var dstinList = [];
<c:forEach var="obj" items="${dstinDs}">
dstinList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//법인구분 Map
var dstinMap = dms.data.arrayToMap(dstinList, function(obj){ return obj.cmmCd; });



//사용여부
var useYnList = [];
<c:forEach var="obj" items="${useYnDs}">
useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//사용여부 Map
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){ return obj.cmmCd; });


//보증임률비율
var wartRateDsList = [];
<c:forEach var="obj" items="${rateDs}">
wartRateDsList.push({
    "cmmCd":"${obj.rpirTp}"
    , "cmmCdNm":"${obj.wartRteRate}"
});
</c:forEach>

//보증임률비율 Map
var wartRateDsMap = dms.data.arrayToMap(wartRateDsList, function(obj){ return obj.cmmCd; });

// 브랜드 구분
brandCdGrid = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != ""  ){
        if(brandCdMap[val] != undefined)
        returnVal = brandCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 수리유형
rpirTpGrid = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != "" ){
        if(rpirTpMap[val] != undefined)
        returnVal = rpirTpMap[val].cmmCdNm;
    }
    return returnVal;
};

useYnGrid = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != ""){
        if(useYnMap[val] != undefined)
        returnVal = useYnMap[val].cmmCdNm;
    }
    return returnVal;
};
$(document).ready(function() {

    $("#dlrCd").val(window.opener.$("#dlrCd").val());
    $("#roDocNo").val(window.opener.$("#roDocNo").val());
    $("#roTp").val(window.opener.$("#roTp").val());
    $("#vinNo").val(window.opener.$("#vinNo").val());
    $("#carRegNo").val(window.opener.$("#carRegNo").val());
    $("#enginNo").val(window.opener.$("#enginNo").val());
    $("#runDistVal").val(window.opener.$("#runDistVal").val());
    $("#roDt").val(window.opener.$("#roDt").val());
    $("#carColorCd").val(window.opener.$("#carColorCd").val());
    $("#cauCd1").val(window.opener.$("#cauCd1").val());
    $("#cauNm1").val(window.opener.$("#cauNm1").val());
    $("#phenCd1").val(window.opener.$("#phenCd1").val());
    $("#phenNm1").val(window.opener.$("#phenNm1").val());


    //보증수리 임률
    setWartRateValue = function (value){
        var resultVal = "";

        if(dms.string.isNotEmpty(value)){
            if(wartRateDsMap[value] != undefined)
            resultVal = wartRateDsMap[value].cmmCdNm;
        }

        return resultVal;
      };

    //조회조건 - 수리유형
    $("#sRpirTp").kendoExtDropDownList({
         dataSource:rpirTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "
        ,index:0
    });

    //조회조건 - 법인구분
    $("#sDstinCd").kendoExtDropDownList({
         dataSource:dstinList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:1
    });

    //조회조건 - 브랜드
    $("#sBrandCd").kendoExtDropDownList({
         dataSource:brandCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.read();
            /** 버튼 설정**/
            setButtonEnable($("#sDstinCd").val());
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0,
                    {
                    'dlrCd':$("#dlrCd").val()
                    ,'rteDocNo':''
                    ,'dstinCd':$("#sDstinCd").val()
                    ,'rpirTp':''
                    ,'gnlRteRate':''
                    ,'wartRteRate':''
                    ,'incRteRate':''
                    ,'intRteRate':''
                    ,'applyStartDt':''
                    ,'applyEndDt':''
                    ,'brandCd':$("#sBrandCd").val()
                    ,'useYn':'Y'
             });
        }
      ,enable:false
    });



    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
     ,enable:false
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
      ,enable:false
    });


  //버튼설정
    setButtonEnable = function (sFlag){

        switch(sFlag){
            case "H" :
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnDel").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                      break;
            case "D" :
                $("#btnAdd").data("kendoButton").enable(true);
                $("#btnDel").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
                      break;
            default :
                $("#btnAdd").data("kendoButton").enable(false);
                $("#btnDel").data("kendoButton").enable(false);
                $("#btnCancel").data("kendoButton").enable(false);
                break;
        }
    };

    /** 저장 필수값 체크 **/
    saveDataValidation = function (e){

        var msgText;
        var result = true;
        var grid = $('#grid').data('kendoExtGrid').dataSource;
        $.each(grid._data , function(i , obj){
           if( dms.string.isEmpty(obj.rpirTp) ){
               msgText = "<spring:message code='ser.lbl.lbrTp' var='rpirTp' />"+
                         "<spring:message code='global.info.required.field' arguments='${rpirTp}' />";
               result =  false;
           } else if( dms.string.isEmpty(obj.gnlRteRate) ){
               msgText = "<spring:message code='ser.lbl.gnlRteRate' var='gnlRteRate' />"+
                         "<spring:message code='global.info.required.field' arguments='${gnlRteRate}' />";
               result =  false;
           } else if( dms.string.isEmpty(obj.wartRteRate) ){
               msgText = "<spring:message code='ser.lbl.wartRteRate' var='wartRteRate' />"+
                         "<spring:message code='global.info.required.field' arguments='${wartRteRate}' />";
               result =  false;
           } else if( dms.string.isEmpty(obj.incRteRate) ){
               msgText = "<spring:message code='ser.lbl.incRteRate' var='incRteRate' />"+
                         "<spring:message code='global.info.required.field' arguments='${incRteRate}' />";
               result =  false;
           } else if( dms.string.isEmpty(obj.intRteRate) ){
               msgText = "<spring:message code='ser.lbl.intRteRate' var='intRteRate' />"+
                         "<spring:message code='global.info.required.field' arguments='${intRteRate}' />";
               result =  false;
           } else if( dms.string.isEmpty(obj.rwrkRteRate) ){
               msgText = "<spring:message code='ser.lbl.rwrkRteRate' var='rwrkRteRate' />"+
                         "<spring:message code='global.info.required.field' arguments='${rwrkRteRate}' />";
               result =  false;
           } else if( dms.string.isEmpty(obj.applyStartDt) ){
               msgText = "<spring:message code='ser.lbl.applyStartDt' var='applyStartDt' />"+
                         "<spring:message code='global.info.required.field' arguments='${applyStartDt}' />";
               result =  false;
           } else if( dms.string.isEmpty(obj.applyEndDt) ){
               msgText = "<spring:message code='ser.lbl.applyEndDt' var='applyEndDt' />"+
                         "<spring:message code='global.info.required.field' arguments='${applyEndDt}' />";
               result =  false;
           } else if( dms.string.isEmpty(obj.brandCd) ){
               msgText = "<spring:message code='ser.lbl.brand' var='brand' />"+
                         "<spring:message code='global.info.required.field' arguments='${brand}' />";
               result =  false;
           } else if( dms.string.isEmpty(obj.useYn) ){
               msgText = "<spring:message code='ser.lbl.useYn' var='useYn' />"+
                         "<spring:message code='global.info.required.field' arguments='${useYn}' />";
               result =  false;
           }
        });


        if(!result) dms.notification.warning(msgText);
        return result;


    };

});

function onEditRteDocNo(e){
    var fieldName = e.container.find("input").attr("name");
    var rateFieldName = $(e.container.find("input")[1]).attr("name");

    if(rateFieldName == "wartRteRate"){
        this.closeCell();
    }
    if(!e.model.isNew()){
        if(fieldName=="rpirTp"){
            this.closeCell();
        }
    }
}

wartRateValue = function(e){
    var grid = $("#grid").data("kendoExtGrid");
    var gridData = grid.dataSource._data;

    var selectedVal = grid.dataItem(grid.select());
    selectedVal.set("wartRteRate",setWartRateValue(selectedVal.rpirTp));


};

</script>







