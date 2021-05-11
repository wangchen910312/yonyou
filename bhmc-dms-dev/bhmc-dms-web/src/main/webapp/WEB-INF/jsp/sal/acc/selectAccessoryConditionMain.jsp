<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 용품판매현황 -->
<div id="resizableContainer">
<section class="group">
	<div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.accessoryCondition' /></h1> <!-- 용품현황 -->
		<div class="btn_right">
            <dms:access viewId="VIEW-D-12793" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>        <!-- 조회 -->
            </dms:access>
		</div>
	</div>
	<div class="table_form" role="search" data-btnid="btnSearch">
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
					<th scope="row"><spring:message code='sal.lbl.goodsTp' /></th>     <!-- 경품업무유형 -->
					<td>
                        <input id="sGoodsTp" type="text" class="form_comboBox" />
                    </td>
					<th scope="row"><spring:message code='sal.lbl.goodsContractNo' /></th>     <!-- 경품오더번호 -->
					<td>
                        <input id="sGoodsContractNo" type="text" class="form_input" />
                    </td>
					<th scope="row"><spring:message code='sal.lbl.orderDate' /></th>       <!-- 오더일자 -->
					<td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartGoodsContractDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndGoodsContractDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
				</tr>
				<tr>
					<th scope="row"><spring:message code='global.lbl.customer' /></th>     <!-- 고객 -->
					<td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vsContractCustNm" class="form_input onKey_up onKey_bulr" />
                                    <a href="javascript:bf_searchCustomer('search', 'vsContractCustNm');"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                    <input id="sContractCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
					<th scope="row"><spring:message code='global.lbl.contractNo' /></th> <!-- 계약번호 -->
                    <td>
                        <input id="sSaleContractNo" class="form_input" />
                    </td>
					<th scope="row"><spring:message code='sal.lbl.expcGiEndDt' /></th> <!-- 예정출고일자 -->
					<td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartExpcGiEndDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndExpcGiEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
				</tr>
			</tbody>
		</table>
	</div>

    <!-- 용품판매현황 그리드 시작 -->
    <div class="table_grid">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>
    <!-- 용품판매현황 그리드 종료 -->
</section>
</div>

<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
//yyyy-MM-dd
var vDtyyyyMMdd = "${_dateFormat}";
//HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var vCustNo = "";               // 검색 조회 고객

// 경품업무유형:SAL158
var sGoodsTpList = [];
var goodsTpObj = {};
<c:forEach var="obj" items="${goodsTpDS}">
    sGoodsTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    goodsTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


var popupWindow;

/******************************************
 * ready ()
 ****************************************/
$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            var gFromDt = $("#sStartGoodsContractDt").data("kendoExtMaskedDatePicker").value();
            var gToDt = $("#sEndGoodsContractDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(gFromDt, gToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sStartGoodsContractDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(gToDt, gFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sEndGoodsContractDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(gFromDt, gToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sEndGoodsContractDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sEndGoodsContractDt").focus();
               return false;
            }

            var sFromDt = $("#sStartExpcGiEndDt").data("kendoExtMaskedDatePicker").value();
            var sToDt = $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").value();
            if(salesJs.validate.isFromDateValid(sFromDt, sToDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sStartExpcGiEndDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(sToDt, sFromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sEndExpcGiEndDt").focus();
               return false;
            }
            if(!salesJs.validate.isDateValidPeriod(sFromDt, sToDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sEndExpcGiEndDt").focus();
               return false;
            }
            
            $('#mainGrid').data('kendoExtGrid').dataSource.read();
        }
    });


    //경품업무유형
    $("#sGoodsTp").kendoExtDropDownList({
       dataTextField :"cmmCdNm"
      ,dataValueField:"cmmCd"
      ,dataSource:sGoodsTpList
      ,optionLabel:" "
    });

    // 오더일자 시작일
    $("#sStartGoodsContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    // 오더일자 종료일
    $("#sEndGoodsContractDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:lastDay
    });

    // 예정출고일자 시작일
    $("#sStartExpcGiEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 예정출고일자 종료일
    $("#sEndExpcGiEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 그리드
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0920-180107"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/acc/accessoryCondition/selectAccessoryConditionSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 딜러코드
                        params["sDlrCd"] = dlrCd;
                        // 경품업무유형
                        params["sGoodsTp"] = $("#sGoodsTp").data("kendoExtDropDownList").value();
                        // 경품오더번호
                        params["sGoodsContractNo"] = $("#sGoodsContractNo").val();
                        // 오더일자
                        params["sStartGoodsContractDt"] = $("#sStartGoodsContractDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndGoodsContractDt"]   = $("#sEndGoodsContractDt").data("kendoExtMaskedDatePicker").value();
                        // 고객
                        params["sContractCustNo"] = $("#sContractCustNo").val();
                        //예정출고일자
                        params["sStartExpcGiEndDt"] = $("#sStartExpcGiEndDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndExpcGiEndDt"]   = $("#sEndExpcGiEndDt").data("kendoExtMaskedDatePicker").value();
                        // 계약번호
                        params["sSaleContractNo"] = $("#sSaleContractNo").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                model:{
                    id:"goodsContractNo",
                    fields:{
                         dlrCd          :{type:"string", editable:false} // 딜러코드
                        ,goodsContractNo:{type:"string", editable:false} // 용품계약번호
                        ,goodsTp        :{type:"string"}                 // 업무유형
                        ,contractCustNm :{type:"string"}                 // 고객명
                        ,goodsNm        :{type:"string"}                 // 경품명칭
                        ,goodsCnt       :{type:"number"}                 // 수량
                        ,realDlDt       :{type:"date"}                   // 실제인도일
                        ,goodsAmt       :{type:"number"}                 // 용품금액
                        ,prenSumAmt     :{type:"number"}                 // 할인금액
                        ,custPayAmt     :{type:"number"}                 // 고객납부금액
                        ,eqipPrsnNm     :{type:"string"}                 // 설치담당자
                        ,saleContractNo :{type:"string"}                 // 계약번호
                        ,vinNo          :{type:"string"}                 // vinNo
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:false
       ,appendEmptyColumn:true           //빈컬럼 적용
       ,height:435
       ,editable:false
       ,resizable:true
       ,autoBind:true
       ,selectable:"row"
       ,navigatable:true
       ,columns:[
          {field:"dlrCd",     title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}       // 딜러코드
          ,{field:"goodsContractNo", title:"<spring:message code='sal.lbl.goodsContractNo' />", attributes:{"class":"ac"}, width:140
              ,template:function(dataItem){
                  var spanObj = "<a href='#' class='linkGoodsNo'>"+dataItem.goodsContractNo+"</a>";
                  return spanObj;
              }
          }  //경품오더번호
          ,{field:"goodsTpNm", title:"<spring:message code='sal.lbl.goodsTp' />", attributes:{"class":"ac"}, width:90}  //경품업무유형
          ,{field:"contractCustNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"al"}, width:130}  //고객명
          ,{field:"goodsNm", title:"<spring:message code='sal.lbl.goodsNm' />", attributes:{"class":"al"}, width:250}  //경품명칭
          ,{field:"goodsCnt", title:"<spring:message code='global.lbl.qty' />", attributes:{"class":"ar"}, width:80, format:"{0:n0}"}  //수량
          ,{field:"realDlDt", title:"<spring:message code='sal.lbl.realDlsDt' />", attributes:{"class":"ar"}, width:80, format:"{0:"+vDtyyyyMMdd+"}"}  //완료일자
          ,{field:"goodsAmt", title:"<spring:message code='sal.lbl.goodsAmt' />", attributes:{"class":"ar"}, width:100, format:"{0:n2}"}  //용품금액
          ,{field:"prenSumAmt", title:"<spring:message code='global.lbl.dcAmt' />", attributes:{"class":"ar"}, width:100, format:"{0:n2}"}  //할인금액
          ,{field:"custPayAmt", title:"<spring:message code='sal.lbl.custPayAmt' />", attributes:{"class":"ar"}, width:100, format:"{0:n2}"}  //고객납부금액
          ,{field:"eqipPrsnNm", title:"<spring:message code='sal.lbl.eqipPrsnId' />", attributes:{"class":"al"}, width:130}  //설치책임자
          ,{field:"saleContractNo", title:"<spring:message code='global.lbl.contractNo' />", attributes:{"class":"ac"}, width:120} // 계약번호
          ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", attributes:{"class":"ac"}, width:150} // VIN_NO
       ]
   });

   $(document).on("click", ".linkGoodsNo", function(e){
       var thisName = $(this).data("name");
       var grid = $("#mainGrid").data("kendoExtGrid"),
       row = $(e.target).closest("tr");
       // k-state-selected remove all
       grid.tbody.find('>tr').each(function(){
          $(this).removeClass("k-state-selected");
       });
       // k-state-selected add
       row.addClass("k-state-selected");
       var dataItem = grid.dataItem(row);
       // tab window open
       window.parent._createOrReloadTabMenu("<spring:message code='sal.menu.accessorySale' />", "<c:url value='/sal/acc/accessoryMng/selectAccessoryMngMain.do' />?accessoryMngNo="+dataItem.goodsContractNo, "VIEW-D-10481");
   });


});
/******************************************
 * ready () = End =
 ******************************************/

//고객명 enter
$(".onKey_bulr").blur(function(e){
    var cId = dms.string.strNvl($(this).context.id);
    if(cId != ""){
        cleanCustCheck(cId);
    }
});

// 고객명 enter
$(".onKey_up").keyup(function(e){
    var cId = dms.string.strNvl($(this).context.id);
    if(cId == ""){
        return ;
    }

    if (e.keyCode == 13) {
        if($(this).val() != "") {
            bf_searchCustomer(cId);
        }
    }else{
        cleanCustCheck(cId);
    }
});

//고객명 변경시 고객정보 clean
function cleanCustCheck(cId){
    if(cId == "vsContractCustNm"){
        if(dms.string.strNvl($("#"+cId).val()) != dms.string.strNvl($("#sContractCustNm").val()) ){
            $("#sContractCustNo").val('');
            $("#sContractCustNm").val('');
        }
    }
}


//CRM 고객 데이터 조회
bf_searchCustomer = function(sIdNm){

    popupWindow = dms.window.popup({
        windowId:"customerSearchPopup"
        , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , modal:true
        //, draggable:false
        , content:{
            url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data:{
                "autoBind":true
                , "custNm":$("#"+sIdNm).val()
                , "closeYn":"Y"
                , "type":null
                , "callbackFunc":function(data){
                    if(data.length >= 1) {
                        $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                        $("#sContractCustNm").val(data[0].custNm);       // 고객명
                        $("#vsContractCustNm").val(data[0].custNm);       // 고객명
                    }
                    //popupWindow.close();
                }
            }
        }
    });
}

//-->
</script>