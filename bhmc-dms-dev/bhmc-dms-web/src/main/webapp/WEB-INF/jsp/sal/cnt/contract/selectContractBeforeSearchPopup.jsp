<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 예약판매 조회 팝업 -->
<section id="window" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
        </div>
    </div>

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th> <!-- 판매담당자 -->
                    <td>
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractDt' /></th>        <!-- 예약일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartContractDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndContractDt" class="form_datepicker" />
                            </div>
                        </div>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vCustNm" class="form_input" >
                                    <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                    <input id="sCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->
    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->


    <span style="display:none">
        <!-- 딜러코드 -->
        <input type="hidden" id="sDlrCd"  />
    </span>

</section>
<!-- //계약 차량조회(차량마스터) 팝업 -->

<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

//딜러코드 , 사용자
var userId = "${userId}";
var userNm = "${userNm}";
var dlrCd  = "${dlrCd}";

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매담당자 전체조회 권한
var saleAdminYn = "${saleAdminYn}";

//임시 작업
//if(userId == "admin2"){ saleAdminYn = "Y"; }

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var custTpList = [];
var custTpObj = {};
<c:forEach var="obj" items="${custTpDs}">
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {

    // 팝업 설정값
    var options = parent.beforepopupWindow.options.content.data;

    //판매담당자
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    //  시작일
    $("#sStartContractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:threeMonthDay
    });

    // 계약 종료일
    $("#sEndContractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });
    
    $("#sDlrCd").val(options.sDlrCd);
    if(saleEmpYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").value(options.sSaleEmpNo);
    }
    if(saleAdminYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(true);
    }else{
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(false);
    }
    
    
    $("#vCustNm").val(options.sCustNm);
    $("#sCustNm").val(options.sCustNm);
    $("#sCustNo").val(options.sCustNo);
    
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $('#grid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();
            if (rows.length >= 1){
                var data = [];
                //data.push(selectedItem);
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });
                options.callbackFunc(data);
            } else {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
            }
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0305-132735"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/acu/contBeforeMng/selectContBeforeMngSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        
                        params["sDlrCd"] = $("#sDlrCd").val();
                        // 판매사원
                        params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
                        // 고객명
                        params["sCustNm"] = $("#vCustNm").val();
                        //고객
                        params["sCustNo"] = $("#sCustNo").val();
                        //일자                        
                        params["sStartBeforeDt"] = $("#sStartContractDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndBeforeDt"] = $("#sEndContractDt").data("kendoExtMaskedDatePicker").value();
                        // 검색팝업 구분
                        params["sGb"] = "C";
                        
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"beforeNo"
                    ,fields:{
                        beforeNo:{type:"string"}                 //예약번호
                        ,beforeContractDt:{type:"date"}
                        ,custNm:{type:"string"}
                        ,custTp:{type:"string"}                  //고객유형
                        ,telNo1:{type:"string"}                  //이동전화
                        ,carlineCd:{type:"string"}               //차종코드
                        ,carlineNm:{type:"string"}               //차종명
                        ,fscCd:{type:"string"}                 //모델코드
                        ,fscNm:{type:"string"}                 //모델명
                        ,ocnCd:{type:"string"}                   //OCN코드
                        ,ocnNm:{type:"string"}                   //OCN명
                        ,extColorCd:{type:"string"}              //외장색상코드
                        ,extColorNm:{type:"string"}              //외장색
                        ,intColorCd:{type:"string"}              //내장색상코드
                        ,intColorNm:{type:"string"}              //내장색명
                        ,beforeAmt:{type:"number"}
                        ,implyYn:{type:"string"}
                        ,beforeStatCd:{type:"string"}
                        ,fincBank:{type:"string"}                //
                        ,saleEmpNo:{type:"string"}               //판매사원번호
                        ,saleEmpNm:{type:"string"}               //판매사원명
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:true
        ,selectable :"row"
        ,height  :374
        ,columns:[
                  {field:"beforeNo", title:"<spring:message code='sal.lbl.beforeNo' />", attributes:{"class":"al"}, width:100} //예약번호
                  ,{field:"beforeStatCd", title:"<spring:message code='sal.lbl.statNm' />", attributes:{"class":"al"}, hidden:true}   //상태
                  ,{field:"beforeContractDt", title:"<spring:message code='sal.lbl.orderDate' />", width:120, format:"{0:"+vDtyyyyMMdd+"}"}             //주문일자
                  ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"al"}, width:100}                       //고객명
                  ,{
                      field:"custTp", title:"<spring:message code='global.lbl.custTp' />", attributes:{"class":"al"}, width:100
                      ,template :"#= dms.string.strNvl(custTpObj[custTp]) #"
                  }      //사용성질
                  ,{field:"telNo1", title:"<spring:message code='global.lbl.hpNo' />", attributes:{"class":"ac"}, width:90}      //이동전화
                  ,{field:"carlineCd", title:"<spring:message code='global.lbl.intrCar' />", attributes:{"class":"ac"}, width:90, hidden:true}      //예약차량
                  ,{field:"carlineNm", title:"<spring:message code='global.lbl.intrCar' />", attributes:{"class":"ac"}, width:90, hidden:true }   //예약차량
                  ,{field:"modelCd", title:"<spring:message code='sal.lbl.intentionModel' />", hidden:true, attributes:{"class":"al"}}            //모델코드
                  ,{field:"modelNm", title:"<spring:message code='sal.lbl.intentionModel' />", attributes:{"class":"al"}, width:150}   //모델명
                  ,{field:"beforeAmt", title:"<spring:message code='global.lbl.contractAmt' />", attributes:{"class":"ar"}, width:150,format:"{0:n2}"}                  // 계약금
                  ,{
                      field:"implyYn", title:"<spring:message code='sal.lbl.finImplysYn' />", attributes:{"class":"ac"}, width:90
                     ,template:"#=dms.string.strNvl(ynObj[implyYn])#"
                     ,filterable:{
                         cell:{
                             showOperators:false
                             ,template: function (e) {
                                    e.element.kendoExtDropDownList({
                                        dataSource:ynList
                                        ,dataTextField:"cmmCdNm"
                                        ,dataValueField:"cmmCd"
                                        ,valuePrimitive:true
                                        ,optionLabel:" "
                                    });
                                }
                         }
                     }
                     
                  }   //완성여부
                  ,{field:"saleEmpNm", title:"<spring:message code='sal.lbl.saleEmp' />", attributes:{"class":"al"}, width:90 } //판매사원명
        ]
    });

    // 그리드 더블클릭.
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        $("#btnSelect").click();
    });

});


//고객명 event
$("#vCustNm").blur(function(e){
    cleanCustCheck();
});

// 고객명 enter event
$("#vCustNm").keyup(function(e){
    if (e.keyCode != 13) {
        cleanCustCheck();
    }
});

//고객명 변경시 고객정보 clean
function cleanCustCheck(){
    if(dms.string.strNvl($("#vCustNm").val()) != dms.string.strNvl($("#sCustNm").val()) ){
        $("#sCustNo").val('');
        $("#sCustNm").val('');
    }
}

//CRM 고객 조회
bf_searchCustomer = function(){

    var sMngScId = "";
    //if(saleAdminYn != "Y"){   //전체권한자는 고객전체 검색 가능.
        sMngScId = userId;
    //}
    
    var responseJson = {};
    if( dms.string.trim($("#vCustNm").val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sCustNm":$("#vCustNm").val(), "sMngScId":sMngScId})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        $("#sCustNo").val(responseJson.data[0].custNo);       // 고객코드
        $("#sCustNm").val(responseJson.data[0].custNm);       // 고객명
        $("#vCustNm").val(responseJson.data[0].custNm);      // 고객명
    }else{
        var obj = {};
        obj["sIdNm"] = $("#vCustNm").val();
        obj["sMngScId"] = sMngScId;
        
        parent.bf_pSearchCustomer(obj, function(data){
            $("#sCustNo").val(data[0].custNo);       // 고객코드
            $("#sCustNm").val(data[0].custNm);       // 고객명
            $("#vCustNm").val(data[0].custNm);       // 고객명
            
            $("#vCustNm").focus();
            
            //parent.beforepopupWindow.center();
            
        });
    }
}


</script>
<!-- //script -->