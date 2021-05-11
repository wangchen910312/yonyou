<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약품의현황 -->
<section class="group">
	<div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.contractProgressSts" /></h1><!-- 계약품의현황 -->
		<div class="btn_right">
			<button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button><!-- 조회 -->
		</div>
	</div>
	<div class="table_form">
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
					<th scope="row"><spring:message code='global.lbl.contractNo' /></th> <!-- 계약번호 -->
					<td>
                        <input id="sContractNo" type="text" class="form_input">
                    </td>
					<th scope="row"><spring:message code='global.lbl.customer' /></th><!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="sContractCustNo" type="text" class="form_input">
                                    <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNm" type="text" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
					<th scope="row"><spring:message code='global.lbl.contractDate' /></th><!-- 계약일 -->
					<td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartContractDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndContractDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
				</tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.corpCarDstin' /></th>         <!-- 자사차여부 -->
                    <td>
                        <input id="sCorpCarDstinCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractStat' /></th>      <!-- 계약상태 -->
                    <td>
                        <input id="sContractStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
                </tr>
                <tr class="corpCar_01" style="display:none">
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox">
                    </td>
                    <th scope="row">OCN</th>
                    <td>
                        <input id="sOcnCd" class="form_comboBox">
                    </td>
                </tr>
                <tr class="corpCar_01" style="display:none">
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="sExtColorCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td class="bor_none">
                        <input id="sIntColorCd" class="form_comboBox">
                    </td>
                    <th scope="row" class="bor_none"></th>
                    <td></td>
                </tr>
                <tr class="corpCar_02" style="display:none">
                    <th scope="row"><spring:message code='global.lbl.brand' /></th>         <!-- 브랜드 -->
                    <td>
                        <input id="sCarBrandCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNm' /></th>    <!-- 차량명 -->
                    <td>
                        <input id="sCarNm" type="text" class="form_input" />
                    </td>
                    <th scope="row"></th>
                    <td ></td>
                </tr>
			</tbody>
		</table>
	</div>

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>
<!-- // 계약품의현황 -->

<script type="text/javascript">
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";
var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후

var dlrCd  = "${dlrCd}";
var vCustNo = "";               // 검색 조회 고객

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

//계약상태
var contractStatCdList = [];
var contractStatObj = {};
<c:forEach var="obj" items="${contractStatCdDS}">
    contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    contractStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//자사차여부:SAL118
var corpCarDstinCdList = [];
var corpCarDstinObj = {};
<c:forEach var="obj" items="${corpCarDstinCdDS}">
    corpCarDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    corpCarDstinObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//브랜드 COM019
var carBrandList = [];
var carBrandObj = {};
<c:forEach var="obj" items="${carBrandDS}">
    carBrandList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    carBrandObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


$(document).ready(function() {
    $("#btnSearch").kendoButton({  // 조회
        click:function(e){
            var corp = $("#sCorpCarDstinCd").data("kendoExtDropDownList").value();
            var grid = $('#grid').data('kendoExtGrid');

            // 01:자사 , 02:타사
            var corpDS = [ {corp:"01", value:"carlineNm"}
                            , {corp:"01", value:"modelNm"}
                            , {corp:"01", value:"ocnNm"}
                            , {corp:"01", value:"extColorNm"}
                            , {corp:"01", value:"intColorNm"}
                            , {corp:"02", value:"carBrandCd"}
                            , {corp:"02", value:"carNm"}
                         ];

            if(corp != ""){
                $.each(corpDS, function(index, row){
                    if(corp == row.corp){
                        grid.showColumn(row.value);
                    }else{
                        grid.hideColumn(row.value);
                    }
                });
            }else{
                $.each(corpDS, function(index, row){
                    grid.showColumn(row.value);
                });
            }
            grid.dataSource.page(1);
        }
    });

    //조회조건 - 계약일(기간)- START
    $("#sStartContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${oneDay}"
    });

    //조회조건 - 계약일(기간)- END
    $("#sEndContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${toDay}"
    });

    // 검색조건:계약일자의 시작일-종료일 날짜 비교
    fnChkSearchDate = function(e){
        //if(dms.string.isEmpty($(this).val())){return;}
        if(dms.string.isEmpty(e.data.from.val())){return;}
        if(dms.string.isEmpty(e.data.to.val())){return;}

        var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
        var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
        if(startDt > endDt){
            dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
            $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
            $(this).focus();
        }
    }

    //검색조건:고객
    fnCheckCustValue = function(){
        if($("#sContractCustNo").val() != vCustNo){
            $("#sContractCustNm").val("");
        }
    }

    $("#sStartContractDt").on('change', {from:$("#sStartContractDt"), to:$("#sEndContractDt")}, fnChkSearchDate);
    $("#sEndContractDt").on('change', {from:$("#sStartContractDt"), to:$("#sEndContractDt")}, fnChkSearchDate);
    $("#sContractCustNo").on('change', fnCheckCustValue);

    // 계약상태
    $("#sContractStatCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:contractStatCdList
       ,optionLabel:" "
    });

    // 자사차여부
    $("#sCorpCarDstinCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:corpCarDstinCdList
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           if(dataItem.cmmCd == "01"){
               $(".corpCar_02").hide();
               $(".corpCar_01").show();
           }else if(dataItem.cmmCd == "02"){
               $(".corpCar_01").hide();
               $(".corpCar_02").show();
           }else{
               $(".corpCar_01").hide();
               $(".corpCar_02").hide();
           }

           $("#sCarlineCd").data("kendoExtDropDownList").value('');
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sModelCd").data("kendoExtDropDownList").enable(false);
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);
           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
           $("#sCarBrandCd").data("kendoExtDropDownList").value('');
           $("#sCarNm").val('');
       }
       ,optionLabel:" "
    });


    // 차량
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,select:function(e){
           $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
           //$("#sModelCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           var dataItem = this.dataItem(e.item);
           if(dataItem.carlineCd == ""){
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/uco/usedCarProgressSts/selectModel.do' />"
               ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
               ,async:false
           });

           if(responseJson.data != null){
               $("#sModelCd").data("kendoExtDropDownList").enable(true);
               $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           }else{
               $("#sModelCd").data("kendoExtDropDownList").enable(false);
           }
       }
       ,optionLabel:" "
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,select:function(e){
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           //$("#sOcnCd").data("kendoExtDropDownList").enable(true);

           $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

           $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

           var dataItem = this.dataItem(e.item);
           if(dataItem.modelCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/uco/usedCarProgressSts/selectOcn.do' />"
               ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
               ,async:false
           });

           if(responseJson.data != null){
               $("#sOcnCd").data("kendoExtDropDownList").enable(true);
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           }else{
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
           }
       }
       ,optionLabel:" "
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);

    // ocn
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "
        ,select:function(e){
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            //$("#sExtColorCd").data("kendoExtDropDownList").enable(true);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/uco/usedCarProgressSts/selectExtColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });
            if(responseJson.data != null){
                $("#sExtColorCd").data("kendoExtDropDownList").enable(true);
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }else{
                $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
            }
        }
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    //외장색
    $("#sExtColorCd").kendoExtDropDownList({
         dataTextField: "extColorNm"
        ,dataValueField:"extColorCd"
        ,optionLabel:" "
        ,select:function(e){
            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            //$("#sIntColorCd").data("kendoExtDropDownList").enable(true);

            if(this.dataItem(e.item).ocnCd == ""){
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/uco/usedCarProgressSts/selectIntColor.do' />"
                ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                ,async:false
            });

            if(responseJson.data != null){
                $("#sIntColorCd").data("kendoExtDropDownList").enable(true);
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }else{
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
            }
        }
    });
    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

    //내장색
    $("#sIntColorCd").kendoExtDropDownList({
         dataTextField: "intColorNm"
        ,dataValueField:"intColorCd"
        ,optionLabel:" "
    });
    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

    //브랜드
    $("#sCarBrandCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carBrandList
        ,optionLabel:" "
    });

    // 메인 그리드
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/uco/usedCarProgressSts/selectUsedCarProgressStsSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 계약번호
                        params["sContractNo"] = $("#sContractNo").val();
                        // 고객
                        params["sContractCustNo"] = $("#sContractCustNo").val();
                        // 계약일자
                        params["sStartContractDt"] = $("#sStartContractDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndContractDt"]   = $("#sEndContractDt").data("kendoExtMaskedDatePicker").value();
                        // 계약상태
                        params["sContractStatCd"] = $("#sContractStatCd").data("kendoExtDropDownList").value();
                        // 자사차여부
                        var sCorpCarDstinCd = $("#sCorpCarDstinCd").data("kendoExtDropDownList").value();
                        params["sCorpCarDstinCd"] = sCorpCarDstinCd;
                        if(sCorpCarDstinCd == "01"){
                            // 차종
                            params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                            // 모델
                            params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();
                            // ocn
                            params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();
                            // 외장색
                            params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                            // 내장색
                            params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();
                        }else if(sCorpCarDstinCd == "02"){
                            // 브랜드
                            params["sCarBrandCd"] = $("#sCarBrandCd").data("kendoExtDropDownList").value();
                            // 모델명
                            params["sCarNm"] = $("#sCarNm").val();
                        }

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                model:{
                    id:"contractNo",
                    fields:{
                         dlrCd       :{type:"string", editable:false} //딜러코드
                        ,contractNo  :{type:"string"}                 //계약번호
                        ,contractDt    :{type:"date"}                 //계약일
                        ,contractStatCd:{type:"string"}               //계약상태
                        ,contractCustNo:{type:"string"}               //고객번호
                        ,custNm        :{type:"string"}               //고객명
                        ,saleEmpNo     :{type:"string"}               //판매사원번호
                        ,corpCarDstinCd:{type:"string"}               //자사차여부
                        ,carlineNm :{type:"string"}                   //차종명
                        ,modelNm   :{type:"string"}                   //모델명
                        ,ocnNm     :{type:"string"}                   //OCN명
                        ,extColorNm:{type:"string"}                   //외장색
                        ,intColorNm:{type:"string"}                   //내장색명
                        ,carBrandCd:{type:"string"}                   //브랜드
                        ,carNm     :{type:"string"}                   //차량명
                        ,realPayAmt:{type:"number"}                   //판매금액
                        ,vinNo     :{type:"string"}                   //차대번호
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:false
       //,pageable:false
       ,height:382
       ,editable   :false
       ,resizable:true
       ,autoBind:false
       ,selectable:"row"
       ,navigatable:true
       ,sortable:false
       //,edit:onEditMainCd
       ,columns:[
          {field:"dlrCd", hidden:true}       // 딜러코드
          ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", width:150}                 //계약번호
          ,{field:"contractDt", title:"<spring:message code='global.lbl.contractDt' />", attributes:{"class":"ac"}, width:90, format:"{0:"+vDtyyyyMMdd+"}"}                   //계약일
          ,{field:"contractStatCd", title:"<spring:message code='global.lbl.contractStat' />", attributes:{"class":"ac"}, width:90, template:"#=contractStatObj[contractStatCd]#" }    //계약상태
          ,{field:"contractCustNo", title:"<spring:message code='global.lbl.contractCustNo' />", width:150}               //고객번호
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"ac"}, width:100}    //고객명
          ,{field:"saleEmpNo", title:"<spring:message code='global.lbl.saleEmpNo' />", width:100}    //판매사원번호
          ,{field:"corpCarDstinCd", title:"<spring:message code='sal.lbl.corpCarDstin' />", attributes:{"class":"ac"}, width:100, template:"#= dms.string.strNvl(corpCarDstinObj[corpCarDstinCd]) #"}  // 자사차여부
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:150}                          //차종명
          ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:220}                             //모델명
          ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:200}                                 //OCN명
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:180}                       //외장색
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:180}                       //내장색명
          ,{field:"carBrandCd", title:"<spring:message code='global.lbl.brand' />", attributes:{"class":"ac"}, width:100, template:"#= dms.string.strNvl(carBrandObj[carBrandCd]) #"}  // 브랜드
          ,{field:"carNm", title:"<spring:message code='global.lbl.carNm' />", attributes:{"class":"al"}, width:100}  // 차량명
          ,{field:"realPayAmt", title:"<spring:message code='global.lbl.salAmt' />", attributes:{"class":"ar"}, width:90,format:"{0:n2}"}                  // 판매금액
          ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", attributes:{"class":"ac"}, width:150}       // VIN NO

       ]
   });

});

//CRM 고객 데이터 조회
bf_searchCustomer = function(){

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":false
                , "type"  :null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                        $("#sContractCustNm").val(data[0].custNm);       // 고객명
                        vCustNo = data[0].custNo;
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

//-->
</script>