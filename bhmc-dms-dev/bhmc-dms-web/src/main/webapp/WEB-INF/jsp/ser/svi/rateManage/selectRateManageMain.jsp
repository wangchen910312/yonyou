<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<!-- 임률관리 마스터 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">

            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <div class="btn_right">
					<dms:access viewId="VIEW-D-13103" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_s_min5" id="btnSearch" ><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12091" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_s_min5" id="btnSave" ><spring:message code="ser.btn.confirm" /></button>
                    </dms:access>
                </div>
            </div>
            <!-- 조회 조건 타이틀 종료 -->

            <!-- 조회 조건 시작 -->
            <div class="table_form" role="search" data-btnid="btnSearch" style="display:none">
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
                            <th scope="row"><spring:message code="ser.lbl.gubun" /></th><!--구분  -->
                            <td>
                                <input id="sDstinCd" type="text"  class="form_comboBox" value="H" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.lbrTp" /></th><!--수리유형  -->
                            <td>
                                <input id="sRpirTp" type="text"  class="form_comboBox" />
                            </td>

                            <th scope="row"><spring:message code="ser.lbl.brand" /></th><!--브랜드  -->
                            <td>
                                <input id="sBrandCd" type="text" value="" class="form_comboBox" />
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 조회 조건 종료 -->

        <input id="dlrCd" type="hidden" value="${dlrCd}" />

            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="grid" class="resizable_grid"></div>
            </div>
            <!-- 그리드 종료 -->

        </section>
    </div>
</div>
<script type="text/javascript">

var isTablet="${isTablet}";
var selectable="";

if(isTablet=="true"){
    selectable = "row"
}else{
    selectable = "multiple"
}

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

//브랜드 구분
brandCdGrid = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != ""){
        if(brandCdMap[val] != undefined)
            returnVal = brandCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 수리유형
rpirTpGrid = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != ""){
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
        ,index:0
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
            var grid = $("#grid").data("kendoExtGrid");

            if(!saveDataValidation()) return

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                dms.notification.info("<spring:message code='global.info.required.change'/>"); //
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/rateManage/multiRateManages.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#resizableContainer"));
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
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


    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000130"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/svi/rateManage/selectRateManages.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sRteDocNo"] = $("#sRteDocNo").val();
                        params["sDstinCd"] = $("#sDstinCd").val();
                        params["sBrandCd"] = $("#sBrandCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", validation:{required:true}}
                        ,dstinCd:{type:"string", editable:false}
                        ,rteDocNo:{type:"string", editable:false}
                        ,rpirTp:{type:"string", validation:{required:true}}
                        ,gnlRteRate:{type:"number", validation:{required:true}}
                        ,wartRteRate:{type:"number", validation:{required:true}}
                        ,incRteRate:{type:"number", validation:{required:true}}
                        ,intRteRate:{type:"number", validation:{required:true}}
                        ,rwrkRteRate:{type:"number", validation:{required:true}}
                        ,applyStartDt:{type:"date", validation:{required:true},editable:false} //CRS 75 索赔单价有效期问题调整方案 有效开始日期 设为不可编辑，贾明 2020-4-15
                        ,applyEndDt:{type:"date", validation:{required:true},editable:false}   //CRS 75 索赔单价有效期问题调整方案 有效结束日期 设为不可编辑，贾明 2020-4-15
                        ,useYn:{type:"string", validation:{required:true}}
                        ,brandCd:{type:"string"}
                    }
                }
            }
        }
        ,selectable:selectable
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:onEditRteDocNo
        ,sortable:false
        ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, attributes:{"class":"ac"},hidden:true}
            ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:80, attributes:{"class":"ac"},hidden:true}//딜러코드
            ,{field:"rteDocNo", title:"<spring:message code='ser.lbl.rateCd' />", width:120, attributes:{"class":"ac"},hidden:true}//임률코드
            ,{field:"rpirTp", title:"<spring:message code='ser.lbl.lbrTp' />", width:80, attributes:{"class":"ac"}
                ,template:"#=rpirTpGrid(rpirTp)#"
                ,editor:function(container, options) {
                    $('<input required id="rpirTp" name="rpirTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:rpirTpList
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                        ,change:wartRateValue
                    });
                    $('<span class="k-invalid-msg" data-for="rpirTp"></span>').appendTo(container);
                }
            }//정비유형
            ,{field:"wartRteRate", title:"<spring:message code='ser.lbl.wartRteRate' />", width:80
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required id="wartRteRate" name="wartRteRate" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:0                // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="wartRteRate"></span>').appendTo(container);
                 }
            }//보증금액
            ,{field:"incRteRate", title:"<spring:message code='ser.lbl.insurance' />", width:80
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="incRteRate" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:0                // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="incRteRate"></span>').appendTo(container);
                 }
            }//보험금액
            ,{field:"gnlRteRate", title:"<spring:message code='ser.lbl.gnlRteRate' />", width:80
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="gnlRteRate" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:0                // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="gnlRteRate"></span>').appendTo(container);
                 }
            }//일반금액
            ,{field:"intRteRate", title:"<spring:message code='ser.lbl.intRteRate' />", width:80
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="intRteRate" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:0                // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="intRteRate"></span>').appendTo(container);
                 }
            }//내부금액
            ,{field:"rwrkRteRate", title:"<spring:message code='ser.lbl.rwrkRteRate' />", width:80
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="rwrkRteRate" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:0                // 소숫점
                       ,min:0
                       ,value:0
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="rwrkRteRate"></span>').appendTo(container);
                 }
            }//리워크금액
            ,{field:"brandCd", title:"<spring:message code='ser.lbl.brand' />", attributes:{"class":"ac"}, width:70
                ,template:"#=brandCdGrid(brandCd)#"
                ,editor:function(container, options) {
                    $('<input required name="brandCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:brandCdList
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                    });
                    $('<span class="k-invalid-msg" data-for="brandCd"></span>').appendTo(container);
                }
                ,hidden:true
            }//브랜드
            ,{field:"applyStartDt", title:"<spring:message code='ser.lbl.rateValidStartDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                   $('<input id="applyStartDt" required name="applyStartDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtMaskedDatePicker({
                      format:"<dms:configValue code='dateFormat' />"
                     ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                   });
                   $('<span class="k-invalid-msg" data-for="applyStartDt"></span>').appendTo(container);
               }
            }//적용시작일자
            ,{field:"applyEndDt", title:"<spring:message code='ser.lbl.rateValidEndDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                   $('<input id="applyEndDt" required name="applyEndDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                  .kendoExtMaskedDatePicker({
                      format:"<dms:configValue code='dateFormat' />"
                     ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                  });
                   $('<span class="k-invalid-msg" data-for="applyEndDt"></span>').appendTo(container);
               }
            }//적용종료일자
            ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#=useYnGrid(useYn)#"
                ,editor:function(container, options) {
                    $('<input data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                        ,dataSource:useYnList
                        ,index:1
                    });
                }
                ,hidden:true
            }
        ]

    });

 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제

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
