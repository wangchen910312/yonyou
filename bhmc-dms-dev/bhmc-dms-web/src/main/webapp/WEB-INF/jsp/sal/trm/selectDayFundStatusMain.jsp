<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 일 자금현황-->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.lbl.dailyFoundCondition' /></h1><!--자금현황 -->
        <div class="btn_right">


             <dms:access viewId="VIEW-D-10973" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_excel" type="button" id="btnExcel"><spring:message code="global.btn.excelExport" /></button>   <!-- 엑셀다운로드 -->
            </dms:access>



            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.searchMonth' /></th><!-- 조회월 -->
                    <td>
                        <input id="sYyMm" onblur="bf_gridClean();" class="form_datepicker" style="width:60%"/>
                        <input name="sDd" id="sDd" type="text" class="form_input" style="width:16%;" readonly>

                    </td>
                    <%--
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th><!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" type="text" readonly class="form_input form_readonly">
                        <!-- <input id="sDlrCd" type="text" class="form_input"> -->
                    </td>
                     --%>
                    <th scope="row"></th>
                    <td><input id="sDlrCd" type="hidden"></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <ul id="dateBtn" class="dateBtn_area"></ul>

    <div class="header_area mt5">
        <div class="txt_total child_borderNone">
            <span class="span_txt"><spring:message code='sal.lbl.wdrwSumDay' /> :</span><!-- 출금계(일) -->
            <input type="text" id="whPrcTot" class="form_numeric ar" readonly="readonly" style="width:120px;">
        </div>
    </div>

    <div>
        <div id="grid" class="resizable_grid"></div>
    </div>
</section>
</div>

<!-- script -->
<script  type="text/javascript">
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";

var dlrCd = "${dlrCd}";
var toDay = "${toDay}";         // 현재일자
var toMonth = "${toMonth}";
var paramDate;
var params = {};

$(document).ready(function () {

    $("#sDlrCd").val(dlrCd);
    //조회 년월
    $("#sYyMm").kendoExtMaskedDatePicker({
        value:toDay.substring(0, 8)
       ,start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,change:function(e) {
           $("#grid").data('kendoExtGrid').dataSource.data([]);
           $("#sDd").val('');
           btnSearch();
       }
    });


    //엑셀버튼
    $("#btnExcel").kendoButton({

        click:function(e){

            if( $("#sYyMm").data('kendoExtMaskedDatePicker').value() == null ){
                //적용일을 모두 입력해 주세요
                dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                return false;
            }

       var gridData = $("#grid").data("kendoExtGrid").dataSource.data();

       if(gridData.length != 0 ){

           dms.ajax.excelExport({
               "beanName"         :"dayFundStatusService"
               ,"templateFile"    :"DayFundStatus_Tpl.xlsx"
               ,"fileName"        :"<spring:message code='sal.lbl.dailyFoundCondition' />.xlsx"
               ,"sDlrCd"          : dlrCd
               ,"sYyMmDd"          : paramDate
           });

       }else{
           dms.notification.warning("<spring:message code='sal.info.dayFundStatus.excelWarning' />");
       }

        }
    });


    //출금계
    $("#whPrcTot").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    btnSearch();

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            if( $("#sYyMm").data('kendoExtMaskedDatePicker').value() == null ){
                //적용일을 모두 입력해 주세요
                dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                return false;
            }
            //btnSearch();  // 날짜 조회.

            params = {};
            params["sDlrCd"]  = dlrCd;
            params["sYyMmDd"] = paramDate;

            $("#grid").data('kendoExtGrid').dataSource.data([]);

            $("#grid").data('kendoExtGrid').dataSource.page(1);



        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0225-151201"
        ,dataSource:{
             requestEnd:function(e) {
                 if(e.response != null && e.response.errorMsg != null){
                     // TOBE 에러 메시지를 띄워줘야 하지만, EAI 개발중으로 에러메시지 안띄워줌. (추후 주석만 풀면됨.)
                     //dms.notification.error(e.response.errorMsg);
                 }
             },
             transport:{
                read:{
                    url:"<c:url value='/sal/trm/dayFundStatus/selectDayFundStatusSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"DALO_MODEL_CD"
                    ,fields:{
                         carlineCd:{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,modelCd:{type:"string"}
                        ,modelNm:{type:"string"}
                        ,ocnCd:{type:"string"}
                        ,ocnNm:{type:"string"}
                        ,extColorCd:{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorCd:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,DALO_MODEL_CD:{type:"string"}
                        ,DALO_OCN_CD  :{type:"string"}
                        ,DALO_EXC_CD  :{type:"string"}
                        ,DALO_ALLO_QTY:{type:"number"}
                        ,DALO_MSRP    :{type:"number"}
                        ,DALO_BEF_DC  :{type:"number"}
                        ,DALO_DC_RATE :{type:"number"}
                        ,DALO_DC_AMT  :{type:"number"}
                        ,DALO_ALLO_AMT:{type:"number"}
                        ,DALO_2PRY_AMT:{type:"number"}
                        ,DALO_3PRY_AMT:{type:"number"}
                    }
                }
                ,parse:function(d) {

                    if(d.data != null){
                        d.data.sort(function(a,b){
                            if(a.DALO_ORD_NO === b.DALO_ORD_NO){
                                return 0;
                            }
                            return (a.DALO_ORD_NO < b.DALO_ORD_NO)? 1:-1;
                        });
                        return d;
                    }else{
                        return d;
                    }
                }
            }
            ,aggregate:[
                        { field:"DALO_ALLO_QTY", aggregate:"sum" }
                       ,{ field:"DALO_MSRP", aggregate:"sum" }
                       ,{ field:"DALO_BEF_DC", aggregate:"sum" }
                       ,{ field:"DALO_DC_AMT", aggregate:"sum" }
                       ,{ field:"DALO_ADJT_AMT", aggregate:"sum" }
                       ,{ field:"DALO_CHAH_AMT", aggregate:"sum" }
                       ,{ field:"DALO_2PRY_AMT", aggregate:"sum" }
                       ,{ field:"DALO_3PRY_AMT", aggregate:"sum" }
                       ,{ field:"DALO_ALLO_AMT", aggregate:"sum" }
                       ,{ field:"DALO_FINAL_AMT", aggregate:"sum" }
                    ]

        }
        ,dataBound:function(e) {
            var rows = e.sender.tbody.children();

            var whPrcTot = 0;
            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);

                if(dataItem.DALO_ALLO_AMT != null){
                    whPrcTot += Number(dataItem.DALO_ALLO_AMT);
                }
            });
            $("#whPrcTot").data("kendoExtNumericTextBox").value(whPrcTot);

        }

        ,reorderable:false                 //컬럼순서변경가능여부
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:false               //Tooltip 적용, default:false
        //,height:400
        ,pageable  :false
        ,editable  :false
        ,selectable:"row"
        ,autoBind:false
        ,filterable:false
        ,sortable: false
        ,columns:[
                   {field:"DALO_ORD_NO", title:"<spring:message code='sal.lbl.ordNo' />", attributes:{"class":"al"}, width:100}     //오더번호
                   ,{field:"ordTpCd", title:"<spring:message code='sal.lbl.ordCd' />", attributes:{"class":"ac"}, width:100}     //오더코드
                   ,{field:"ordTpNm", title:"<spring:message code='sal.lbl.ordNm' />", attributes:{"class":"al"}, width:100}     //오더명칭
                   ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />", attributes:{"class":"ac"}, width:100}     //차종코드
                   ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", attributes:{"class":"al"}, width:100}     //차종명칭
                   ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", attributes:{"class":"al"}, width:160}     //차관
                   ,{field:"ocnCd",   title:"<spring:message code='global.lbl.ocn' />", attributes:{"class":"ac"}, width:100}       //ocn
                   ,{field:"ocnNm",   title:"<spring:message code='global.lbl.ocnNm' />", attributes:{"class":"al"}, width:160}        //ocn명칭
                   ,{field:"extColorCd",   title:"<spring:message code='global.lbl.extColorCd' />", attributes:{"class":"ac"}, width:100}  //외장색코드
                   ,{field:"extColorNm",   title:"<spring:message code='global.lbl.extColorNm' />", attributes:{"class":"al"}, width:100}  //외장색명칭
                   ,{field:"intColorCd",   title:"<spring:message code='global.lbl.intColorCd' />", attributes:{"class":"ac"}, width:100}  //내장색코드
                   ,{field:"DALO_ALLO_QTY",     title:"<spring:message code='global.lbl.assignmentUnit' />",     width:80,   attributes:{"class":"ar"}, format:"{0:n0}",footerTemplate:"#=kendo.toString(sum,'n0')#",footerAttributes:{style:"text-align:right;"}} //배정수량
                   ,{field:"DALO_MSRP",     title:"<spring:message code='global.lbl.mdpr' />",     width:120,   attributes:{"class":"ar"}, format:"{0:n2}",footerTemplate:"#=kendo.toString(sum,'n2')#",footerAttributes:{style:"text-align:right;"}} //시장지도가격
                   /* ,{field:"DALO_ALLO_AMT",     title:"<spring:message code='global.lbl.adjp' />",     width:120,   attributes:{"class":"ar"}, format:"{0:n2}",footerTemplate:"#=kendo.toString(sum,'n2')#",footerAttributes:{style:"text-align:right;"}} //공제금액 */
                   ,{field:"DALO_DC_RATE",  title:"<spring:message code='sal.lbl.dcRate' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}         //DC율
                   ,{field:"DALO_DC_AMT",     title:"<spring:message code='sal.lbl.bDcAmt' />",     width:120,   attributes:{"class":"ar"}, format:"{0:n2}",footerTemplate:"#=kendo.toString(sum,'n2')#",footerAttributes:{style:"text-align:right;"}} //할인금액
                   ,{title:"<spring:message code='global.lbl.deductionAmt' />", headerAttributes:{"class":"hasBob"}
                   ,columns:[
                              {field:"DALO_CHAH_AMT",     title:"<spring:message code='sal.lbl.cash' />",     width:120,   attributes:{"class":"ar"}, format:"{0:n2}",footerTemplate:"#=kendo.toString(sum,'n2')#",footerAttributes:{style:"text-align:right;"}} //현금
                             ,{field:"DALO_3PRY_AMT",     title:"<spring:message code='sal.lbl.prt3Amt' />",     width:120,   attributes:{"class":"ar"}, format:"{0:n2}",footerTemplate:"#=kendo.toString(sum,'n2')#",footerAttributes:{style:"text-align:right;"}} //삼방자금
                             ,{field:"DALO_2PRY_AMT",     title:"<spring:message code='sal.lbl.prt2Amt' />",     width:120,   attributes:{"class":"ar"}, format:"{0:n2}",footerTemplate:"#=kendo.toString(sum,'n2')#",footerAttributes:{style:"text-align:right;"}} //이방자금
                             ,{field:"DALO_ALLO_AMT",     title:"<spring:message code='global.lbl.total' />",     width:120,   attributes:{"class":"ar"}, format:"{0:n2}",footerTemplate:"#=kendo.toString(sum,'n2')#",footerAttributes:{style:"text-align:right;"}} //합계
                             ]
                   }
                   ,{field:"DALO_ADJT_AMT",     title:"<spring:message code='sal.lbl.alDcAmt' />",     width:80,   attributes:{"class":"ar"}, format:"{0:n2}",footerTemplate:"#=kendo.toString(sum,'n2')#",footerAttributes:{style:"text-align:right;"}} //조정가액
                   ,{field:"DALO_FINAL_AMT",     title:"<spring:message code='sal.lbl.finalDcAmt' />",     width:120,   attributes:{"class":"ar"}, format:"{0:n2}",footerTemplate:"#=kendo.toString(sum,'n2')#",footerAttributes:{style:"text-align:right;"}} //최종공제금액
                   ,{field:"vinNo", title:"<spring:message code='sal.lbl.vinNo' />", attributes:{"class":"al"}, width:100}     //오더명칭
                   ,{field:"vinmBkwb", title:"<spring:message code='sal.lbl.vinmBkwb' />", attributes:{"class":"al"}, width:100}     //오더명칭
                   ]
    });

});
// end ready()

// 일자 내역 조회
function btnSearch(){

    if($("#sYyMm").data("kendoExtMaskedDatePicker").value() == null){return;}
    if(dms.string.strNvl($("#sDlrCd").val()) == ""){return;}

    var yyMm = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "yyyyMM");

    var param = {
            "yyMm":yyMm
           ,"yy":yyMm.substring(0,4)
           ,"mm":yyMm.substring(4,6)
           ,"dlrCd":$("#sDlrCd").val()
         };

    var responseJson = dms.ajax.getJson({
         url:"<c:url value='/sal/trm/dayFundStatus/selectDayFundStatusDaySearch.do' />"
        ,data:JSON.stringify(param)
        ,async:false
    });

    var lastDay = responseJson.total;
    var dsList  = responseJson.data;        // list

    var dateObj = {};
    $.each(dsList, function(index, data){
        dateObj[Number(data.dd)] = data;
    });

    var vHtml = "";

    for (var i=1; i<=lastDay; i++) {
        // 현재일자 보다 버튼이 클경우.  disabled 처리
        if(yyMm > toMonth ){
            vHtml += '<li><button type="button" disabled class="btn_date disabled">'+i+'</button></li>';
        // 현재일자 보다 작은경우.
        }else if( yyMm == toMonth&& Number( toDay.substring(8,10) ) < i ){
            vHtml += '<li><button type="button" disabled class="btn_date disabled">'+i+'</button></li>';
        // 현재일자같은 경우.
        }else if( yyMm == toMonth&& Number( toDay.substring(8,10) ) == i ){
            // 현재일자 무조건 분홍색 버튼 처리.(요청)
            //vHtml += '<li><button type="button" class="btn_date active" onclick="bf_gridSearch(\''+$("#sDlrCd").val()+'\', \''+toMonth+i+'\')">'+i+'</button></li>';
            vHtml += '<li><button type="button" class="btn_date" onclick="bf_gridSearch(\''+$("#sDlrCd").val()+'\', \''+yyMm+i+'\')">'+i+'</button></li>';

        }else{
             // 현재일자 보다 이전일자 button 처리
            if(isNoEmptyObj(dateObj)){
                if(dateObj[i] != null && i == dateObj[i].dd ){
                    vHtml += '<li><button type="button" class="btn_date" onclick="bf_gridSearch(\''+dateObj[i].dlrCd+'\', \''+dateObj[i].yyMmDd+'\')">'+i+'</button></li>';
                }else{
                    vHtml += '<li><button type="button" class="btn_date" onclick="bf_gridSearch(\''+$("#sDlrCd").val()+'\', \''+yyMm+i+'\')">'+i+'</button></li>';
                }
            }else{
                vHtml += '<li><button type="button" class="btn_date" onclick="bf_gridSearch(\''+$("#sDlrCd").val()+'\', \''+yyMm+i+'\')">'+i+'</button></li>';
            }
        }
    }

    $("#dateBtn").html(vHtml);

    //월 변경시 셋팅 요청.
    if(yyMm < toMonth){
        paramDate = yyMm+lastDay;
        $("#sDd").val(lastDay);
    }else if(yyMm == toMonth){
        paramDate = toDay.replace(/-/gi,'');
        $("#sDd").val(toDay.substring(8, 10));
    }else{
        paramDate = null;
        $("#sDd").val("");
    }

}

// grid clean
bf_gridClean = function(){
    $("#grid").data('kendoExtGrid').dataSource.data([]);
}

// obj확인
function isNoEmptyObj(obj){
    var f = false;
    $.each(obj, function(idx, val){
        f = true;
    });
    return f;
}

// botton Click
function bf_gridSearch(dlrCd, yyMmDd){

    paramDate = "";
    var sDay = yyMmDd.substring(6, yyMmDd.length);

    if(sDay.length == 1){
        sDay = "0"+sDay;
        paramDate = yyMmDd.substring(0,6)+sDay;
    }else{
        paramDate = yyMmDd;
    }

    params = {};
    params["sDlrCd"]  = dlrCd;
    params["sYyMmDd"] = paramDate;

    $("#grid").data('kendoExtGrid').dataSource.data([]);
    $("#grid").data('kendoExtGrid').dataSource.page(1);

    $("#sDd").val(yyMmDd.substring(6,8));
}

</script>