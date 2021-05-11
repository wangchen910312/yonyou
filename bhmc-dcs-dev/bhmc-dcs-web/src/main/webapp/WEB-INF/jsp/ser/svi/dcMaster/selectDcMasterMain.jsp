<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 할인관리마스터 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.dcMng" /></h1><!-- 할인관리마스터 -->
        <div class="btn_right">
            <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.dcCd" /></th><!--할인코드  -->
                    <td>
                        <input id="sDcCd" type="text" class="form_input">
                        <input id="model" type="hidden" value="INSERT">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.dcNm" /></th><!--할인명  -->
                    <td>
                        <input id="sDcNm" type="text" value="" class="form_input">
                    </td>

                    <th scope="row"><spring:message code="ser.lbl.dcTp" /></th><!--할인방식  -->
                    <td>
                        <input id="sDcTp" class="form_comboBox">
                    </td>

                </tr>
            </tbody>
        </table>
    </div>
</section>
    <!-- 조회 조건 종료 -->


    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
    <form id = "form">
    <div class="clfix">
        <!-- 할인코드 기본정보 -->
        <section class="left_areaStyle">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.title.dcInfo" /> </h2><!--할인코드 기본정보  -->
            </div>
            <!-- 기본정보 시작 -->
            <div class="table_form" style="height:110px">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:20%;">
                        <col style="width:30%;">
                        <col style="width:20%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.dcCd" /></th><!--할인코드  -->
                            <td>
                                <input id="dcCd" name="dcCd"  class="form_input form_readonly" style="width:100%">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.useYn" /></th><!--사용여부  -->
                            <td >
                                <input id="dcUseYn" name="dcUseYn" style="width:100%" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.dcNm" /></th><!--할인명  -->
                            <td colspan="3" class="required_area">
                                <input id="dcNm" name="dcNm" type="text" class="form_input" style="width:100%">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.dcBet" /></th><!--할인기간  -->
                            <td colspan="3">
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="dcApplyStartDt" name="dcApplyStartDt" class="form_datepicker" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="dcApplyEndDt" name="dcApplyEndDt" class="form_datepicker" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 기본정보 종료 -->
        </section>
        <!-- 할인코드 세부금액 -->
        <section class="right_areaStyle">
            <div class="header_area">
                <h2 class="title_basic"><spring:message code="ser.title.dcAmtInfo" /></h2><!--할인코드 세부금액  -->
            </div>
            <!-- 할인코드 세부금액 시작 -->
            <div class="table_form form_width_100per" >
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:24%;">
                        <col style="width:26%;">
                        <col style="width:20%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.dcTp" /></th><!--할인적용방식  -->
                            <td colspan="3" class="required_area">
                                <input id="dcTp" name="dcTp" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.lbrDcRate" />(%)</th><!--공임할인  -->
                            <td>
                                <input id="lbrDcRate" name="lbrDcRate" class="form_numeric ar">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.lbrDcAmt" /></th><!--공임할인금액  -->
                            <td>
                                <input id="lbrDcAmt" name="lbrDcAmt" class="form_numeric ar">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.parDcRate" />(%)</th><!--부품할인  -->
                            <td>
                                <input id="parDcRate" name="parDcRate" class="form_numeric ar">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.parDcAmt" /></th><!-- 부품할인금액 -->
                            <td>
                                <input id="parDcAmt" name="parDcAmt" class="form_numeric ar">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.subDcRate" />(%)</th><!--외주할인  -->
                            <td>
                                <input id="subDcRate" name="subDcRate" type="text" class="form_numeric ar">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.subDcAmt" /></th><!-- 외주할인금액 -->
                            <td>
                                <input id="subDcAmt" name="subDcAmt" class="form_numeric ar">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.totDcRate" />(%)</th><!-- 총할인 -->
                            <td>
                                <input id="totDcRate" name="totDcRate" class="form_numeric ar form_readonly">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.totDcAmt" /></th><!--총할인금액  -->
                            <td>
                                <input id="totDcAmt" name="totDcAmt" class="form_numeric ar form_readonly">
                                <input id="dlrCd" name="dlrCd" type="hidden"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 할인코드 세부금액 종료 -->
        </section>
        <!-- //할인코드 세부금액 -->
    </div>
    </form>

<script type="text/javascript">


//RO유형 Array
var dcTpList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${dcTpList}">
dcTpList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//RO유형 Map
var dcTpMap = dms.data.arrayToMap(dcTpList, function(obj){ return obj.cmmCd; });

//사용여부 Array
var useYnList = [];
<c:forEach var="obj" items="${useYnList}">
useYnList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>

//사용여부 Map
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){ return obj.cmmCd; });

var gridSelectedRow = 0;
var selectedYn = false;


$(document).ready(function() {

    $("#dcTp").kendoExtDropDownList({
         dataSource:dcTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    $("#dcUseYn").kendoExtDropDownList({
         dataSource:useYnList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:1
    });

    $("#sDcTp").kendoExtDropDownList({
        dataSource:dcTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });


    $("#dcApplyStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#dcApplyEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    $("#lbrDcRate").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,change:calTotRate
    });

    $("#lbrDcAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,change:calTotAmt
    });

    $("#parDcRate").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,change:calTotRate
    });

    $("#parDcAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,change:calTotAmt
    });

    $("#subDcRate").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,change:calTotRate
    });

    $("#subDcAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,min:0.00
      ,spinners:false
      ,change:calTotAmt
    });

    $("#totDcRate").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,spinners:false
    });

    $("#totDcAmt").kendoExtNumericTextBox({
       format:"n2"                // n0:###,###, n2:###,###.##
      ,decimals:2                // 소숫점
      ,spinners:false
    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
       click:function(e){

           if($("#dcNm").val() == "" || $("#dcNm").val() == null){
                dms.notification.info("<spring:message code='ser.lbl.dcNm' var='dcNm' /><spring:message code='global.info.required.field' arguments='${dcNm},' />");
                return;
            }
           if($("#dcTp").val() == "" || $("#dcTp").val() == null){
                dms.notification.info("<spring:message code='ser.lbl.dcTp' var='dcTp' /><spring:message code='global.info.required.field' arguments='${dcTp},' />");
                return;
            }
           var json = $("form").serializeObject();

           json.dcApplyStartDt= $("#dcApplyStartDt").data("kendoExtMaskedDatePicker").value();
           json.dcApplyEndDt= $("#dcApplyEndDt").data("kendoExtMaskedDatePicker").value();
           var url = "";
           if($("#model").val()=="INSERT"){
               url = "<c:url value='/ser/svi/dcMaster/insertDcMaster.do' />";
           }else{
               url = "<c:url value='/ser/svi/dcMaster/updateDcMaster.do' />";
           }
           $.ajax({
               url:url
               ,dataType:"json"
               ,type:"POST"
               ,contentType:"application/json"
               ,data:JSON.stringify(json)
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors);
               }
               ,success:function(data) {
                   dms.notification.success("<spring:message code='global.info.success'/>");
                   selectedYn = true;
                   gridSelectedRow = $("#grid").data("kendoExtGrid").select().index();
                   $("#grid").data("kendoExtGrid").dataSource.read();
                   if($("#model").val()=="INSERT"){
                       $("#btnReset").click();
                   }
               }
           });
       }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e){
            var json = $("form").serializeObject();
            $.ajax({
                url:"<c:url value='/ser/svi/pDIChkAtc/deletePDIChkAtc.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
                ,data:JSON.stringify(json)
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    $("#btnReset").click();
                }
            });
        }
    });

    $("#btnReset").kendoButton({
        click:function(e){
            $("#dcCd").val("");
            $("#dcTp").data("kendoExtDropDownList").value("");
            $("#dcNm").val("");
            $("#lbrDcRate").val("");
            $("#lbrDcAmt").val("");
            $("#parDcRate").val("");
            $("#parDcAmt").val("");
            $("#subDcRate").val("");
            $("#subDcAmt").val("");
            $("#totDcRate").val("");
            $("#totDcAmt").val("");
            $("#dcApplyStartDt").data("kendoExtMaskedDatePicker").value("");
            $("#dcApplyEndDt").data("kendoExtMaskedDatePicker").value("");
            $("#dcScoreVal").val("");
            $("#model").val("INSERT");
        }
    })

    //그리드 설정
    $("#grid").kendoExtGrid({
         dataSource:{
            transport:{
               read:{
                   url:"<c:url value='/ser/svi/dcMaster/selectDcMasters.do' />"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {

                       var params = {};

                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       params["sDcCd"] = $("#sDcCd").val();
                       params["sDcNm"] = $("#sDcNm").val();
                       params["sDcTp"] = $("#sDcTp").val();

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
                       dlrCd:{type:"string"}
                       ,dcCd:{type:"string"}
                       ,dcTp:{type:"string"}
                       ,dcNm:{type:"string"}
                       ,lbrDcRate:{type:"number"}
                       ,lbrDcAmt:{type:"number"}
                       ,parDcRate:{type:"number"}
                       ,parDcAmt:{type:"number"}
                       ,subDcRate:{type:"number"}
                       ,subDcAmt:{type:"number"}
                       ,totDcRate:{type:"number"}
                       ,totDcAmt:{type:"number"}
                       ,dcApplyStartDt:{type:"date"}
                       ,dcApplyEndDt:{type:"date"}
                       ,dcScoreVal:{type:"string"}
                       ,dcUseYn:{type:"string"}
                   }
               }
           }
        }
        ,height:334
        ,editable:false
        ,selectable:"row"
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridSelectedRow]);
            }
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
            $("#dlrCd").val(dataItem.dlrCd);
            $("#dcCd").val(dataItem.dcCd);
            $("#dcTp").data("kendoExtDropDownList").value(dataItem.dcTp);
            $("#dcNm").val(dataItem.dcNm);
            $("#lbrDcRate").data("kendoExtNumericTextBox").value(dataItem.lbrDcRate);
            $("#lbrDcAmt").data("kendoExtNumericTextBox").value(dataItem.lbrDcAmt);
            $("#parDcRate").data("kendoExtNumericTextBox").value(dataItem.parDcRate);
            $("#parDcAmt").data("kendoExtNumericTextBox").value(dataItem.parDcAmt);
            $("#subDcRate").data("kendoExtNumericTextBox").value(dataItem.subDcRate);
            $("#subDcAmt").data("kendoExtNumericTextBox").value(dataItem.subDcAmt);
            $("#totDcRate").data("kendoExtNumericTextBox").value(dataItem.totDcRate);
            $("#totDcAmt").data("kendoExtNumericTextBox").value(dataItem.totDcAmt);
            $("#dcApplyStartDt").data("kendoExtMaskedDatePicker").value(dataItem.dcApplyStartDt);
            $("#dcApplyEndDt").data("kendoExtMaskedDatePicker").value(dataItem.dcApplyEndDt);
            $("#dcScoreVal").val(dataItem.dcScoreVal);
            $("#dcUseYn").data("kendoExtDropDownList").value(dataItem.dcUseYn);
            $("#model").val("UPDATE");

        }
        ,columns:[
            {field:"dcCd", title:"<spring:message code='ser.lbl.dcCd' />", width:100//할인코드
                ,attributes:{"class":"ac"}
            }
            ,{field:"dcNm", title:"<spring:message code='ser.lbl.dcNm' />", width:100//할인명
                ,attributes:{"class":"ac"}
            }
            ,{field:"dcTp", title:"<spring:message code='ser.lbl.dcTp' />", width:80, attributes:{"class":"ac"}
                 ,template:"#=dcTpCdGrid(dcTp)#"
            }//할인적용방식
            ,{field:"dcUseYn", title:"<spring:message code='ser.lbl.useYn' />", width:80, attributes:{"class":"ac"} ,template:"#=useYnGrid(dcUseYn)#"}//사용여부
            ,{field:"dcApplyStartDt", title:"<spring:message code='ser.lbl.dcBet' />(FROM)", width:100,format:"{0:<dms:configValue code='dateFormat' />}"//할인기간
                ,attributes:{"class":"ac"}
            }
            ,{field:"dcApplyEndDt", title:"<spring:message code='ser.lbl.dcBet' />(TO)", attributes:{"class":"ac"}, width:100,format:"{0:<dms:configValue code='dateFormat' />}"}//할인기간
        ]

    });

});

// DC 구분
dcTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = dcTpMap[val].cmmCdNm;
    }
    return returnVal;
}
// 사용여부
useYnGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = useYnMap[val].cmmCdNm;
    }
    return returnVal;
}

// 금액 합계 계산
calTotAmt = function(){

  var lbrDcAmt = Number(dms.string.defaultString($("#lbrDcAmt").data("kendoExtNumericTextBox").value(), "0" ) );
  var parDcAmt = Number(dms.string.defaultString($("#parDcAmt").data("kendoExtNumericTextBox").value(), "0" ) );
  var subDcAmt = Number(dms.string.defaultString($("#subDcAmt").data("kendoExtNumericTextBox").value(), "0" ) );

 $("#totDcAmt").data("kendoExtNumericTextBox").value(lbrDcAmt + parDcAmt + subDcAmt);
};

// 비율 합계 계산
calTotRate = function(){

  var lbrDcRate = Number(dms.string.defaultString($("#lbrDcRate").data("kendoExtNumericTextBox").value(), "0" ) );
  var parDcRate = Number(dms.string.defaultString($("#parDcRate").data("kendoExtNumericTextBox").value(), "0" ) );
  var subDcRate = Number(dms.string.defaultString($("#subDcRate").data("kendoExtNumericTextBox").value(), "0" ) );

 $("#totDcRate").data("kendoExtNumericTextBox").value(lbrDcRate + parDcRate + subDcRate);
};
</script>







