<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 임률관리 마스터 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"></h1><!-- 임률관리마스터 -->
        <div class="btn_right" style="display:none">
		<dms:access viewId="VIEW-I-12423" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
		</dms:access>
		<dms:access viewId="VIEW-I-12422" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_save" id="btnSave2"><spring:message code="global.btn.save" /></button>
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
                        <input id="sDstinCd" type="text" value="H"  class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.rpirTp" /></th><!--수리유형  -->
                    <td>
                        <input id="sRpirTp" type="text"  class="form_comboBox" />
                    </td>

                    <th scope="row"><spring:message code="ser.lbl.brand" /></th><!--브랜드  -->
                    <td>
                        <input id="sBrandCd" type="text" value="HD" class="form_comboBox" />

                    </td>

                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->
<input id="dlrCd" type="hidden" value="${dlrCd}" />
    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12978" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_add" id="btnAdd" ><spring:message code="global.btn.add" /></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12977" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_del" id="btnDel" ><spring:message code="global.btn.del" /></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12976" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_save" id="btnSave" ><spring:message code="global.btn.save" /></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12975" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s btn_cancel" id="btnCancel" ><spring:message code="global.btn.cancel" /></button>
            </dms:access>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<script type="text/javascript">

//RO유형 Array
var rpirTpList = [];
<c:forEach var="obj" items="${rpirTpDs}">
rpirTpList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//RO유형 Map
var rpirTpMap = dms.data.arrayToMap(rpirTpList, function(obj){ return obj.cmmCd; });

//브랜드 Array
var brandCdList = [];
<c:forEach var="obj" items="${brandDs}">
brandCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//브랜드 Map
var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){ return obj.cmmCd; });


//법인구분
var dstinList = [];
<c:forEach var="obj" items="${dstinDs}">
dstinList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//법인구분 Map
var dstinMap = dms.data.arrayToMap(dstinList, function(obj){ return obj.cmmCd; });



//사용여부
var useYnList = [];
<c:forEach var="obj" items="${useYnDs}">
useYnList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//사용여부 Map
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){ return obj.cmmCd; });

var wartRate=0;
var wartPaintRate=0;

//보증임률비율
var wartRateDsList = [];
<c:forEach var="obj" items="${rateDs}">
<c:if test='${obj.rpirTp eq "03" }'>
wartRate = "${obj.wartRteRate}";
</c:if>
<c:if test='${obj.rpirTp eq "04"} '>
wartPaintRate = "${obj.wartRteRate}";
</c:if>
wartRateDsList.push({
    "cmmCd":"${obj.rpirTp}"
    , "cmmCdNm":"${obj.wartRteRate}"
});
</c:forEach>

//보증임률비율 Map
var wartRateDsMap = dms.data.arrayToMap(wartRateDsList, function(obj){ return obj.cmmCd; });

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
            //setButtonEnable($("#sDstinCd").val());
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
                    ,'gnlRteRate':100
                    ,'wartRteRate':''
                    ,'incRteRate':100
                    ,'intRteRate':100
                    ,'rwrkRteRate':0
                    ,'applyStartDt':''
                    ,'applyEndDt':''
                    ,'brandCd':$("#sBrandCd").val()
                    ,'useYn':'Y'
             });
        }
     // ,enable:false
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
     //,enable:false
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            if(!saveDataValidation()) return

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                globalNotification.info("<spring:message code='global.info.required.change'/>"); //
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
    });


  //버튼설정
    setButtonEnable = function (sFlag){

        switch(sFlag){
            case "H" :
                $("#btnAdd").data("kendoButton").enable(true);
                $("#btnSave").data("kendoButton").enable(true);
                $("#btnDel").data("kendoButton").enable(true);
                $("#btnCancel").data("kendoButton").enable(true);
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
               msgText = "<spring:message code='ser.lbl.rpirTp' var='rpirTp' />"+
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
        dataSource:{
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
                        ,applyStartDt:{type:"date", validation:{required:true}}
                        ,applyEndDt:{type:"date", validation:{required:true}}
                        ,useYn:{type:"string", validation:{required:true}}
                        ,brandCd:{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,edit:onEditRteDocNo
        ,reorderable:false
        ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"},hidden:true}
            ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", sortable:false, width:80,attributes:{"class":"ac"},hidden:true}//딜러코드
            ,{field:"rteDocNo", title:"<spring:message code='ser.lbl.rateCd' />", sortable:false, width:120,attributes:{"class":"ac"},hidden:true}//임률코드
            ,{field:"rpirTp", title:"<spring:message code='ser.lbl.rpirTp' />", sortable:false, width:80, attributes:{"class":"ac"}
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
            }//RO유형
            ,{field:"gnlRteRate", title:"<spring:message code='ser.lbl.gnlRteRate' />", sortable:false, width:80
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="gnlRteRate" maxLength="6" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="gnlRteRate"></span>').appendTo(container);
                 }
            }//일반금액
            ,{field:"wartRteRate", title:"<spring:message code='ser.lbl.wartRteRate' />", sortable:false, width:80
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required id="wartRteRate" maxLength="6" name="wartRteRate" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="wartRteRate"></span>').appendTo(container);
                 }
            }//보증금액
            ,{field:"incRteRate", title:"<spring:message code='ser.lbl.incRteRate' />", sortable:false, width:80
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="incRteRate" maxLength="6" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:2                 // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="incRteRate"></span>').appendTo(container);
                 }
            }//보험금액
            ,{field:"intRteRate", title:"<spring:message code='ser.lbl.intRteRate' />", sortable:false, width:80
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="intRteRate" maxLength="6" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:1
                       ,value:0
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="intRteRate"></span>').appendTo(container);
                 }
            }//내부금액
            ,{field:"rwrkRteRate", title:"<spring:message code='ser.lbl.rwrkRteRate' />", sortable:false, width:80
                , attributes:{"class":"ar"}
                , editor:function(container, options){
                    $('<input required name="rwrkRteRate" maxLength="6" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtNumericTextBox({
                        format:"n0"                // n0:###,###, n2:###,###.##
                       ,decimals:2                // 소숫점
                       ,min:0
                       ,value:0
                       ,spinners:false
                    });
                    $('<span class="k-invalid-msg" data-for="rwrkRteRate"></span>').appendTo(container);
                 }
            }//리워크금액
            ,{field:"brandCd", title:"<spring:message code='ser.lbl.brand' />", attributes:{"class":"ac"}, sortable:false, width:70
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
            ,{field:"applyStartDt", title:"<spring:message code='ser.lbl.applyStartDt' />", sortable:false, width:100//적용시작일자
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
            }
            ,{field:"applyEndDt", title:"<spring:message code='ser.lbl.applyEndDt' />", sortable:false, width:100//적용종료일자
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
            }
            ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", sortable:false, width:80
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
    if(selectedVal != null){
        var lbrTp = (selectedVal.rpirTp == "04") ? selectedVal.rpirTp : "03";
        selectedVal.set("wartRteRate",setWartRateValue(lbrTp));
    }


};

// 브랜드 구분
brandCdGrid = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != ""  ){
        returnVal = brandCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 수리유형
rpirTpGrid = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != "" ){
        returnVal = rpirTpMap[val].cmmCdNm;
    }
    return returnVal;
};

useYnGrid = function(val){
    var returnVal = "";
    if( dms.string.strNvl(val) != ""){
        returnVal = useYnMap[val].cmmCdNm;
    }
    return returnVal;
};

</script>
