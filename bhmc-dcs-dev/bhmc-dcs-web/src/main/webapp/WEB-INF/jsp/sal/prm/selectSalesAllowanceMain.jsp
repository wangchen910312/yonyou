<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- Sales Allowance -->
<section class="group">
	<div class="header_area">
        <h1 class="title_basic">促销明细</h1> <!--  Sales Allowance -->
		<div class="btn_right">
			<button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>  <!-- 조회 -->
		</div>
	</div>
	<div class="table_form">
		<table>
			<caption></caption>
			<colgroup>
				<col style="width:10%;">
				<col style="width:15%;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><spring:message code='sal.lbl.dldt' /></th>   <!-- 고객인도 년월 -->
					<td>
                        <input id="sDlDt" class="form_datepicker">
                    </td>
                    <td></td>
				</tr>
			</tbody>
		</table>
	</div>

    <div class="table_grid mt10">
        <div id="mainGrid"></div>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.title.contractDetail' /></h2>  <!-- 계약상세 정보 -->
    </div>
    <div class="table_grid">
        <div id="subGrid"></div>
    </div>
</section>
<!-- //Sales Allowance -->

<script>
var vDtyyyyMMdd = "${_dateFormat}";

//현재일자
var toDay = "${toDay}";
var oneDay = "${oneDay}";

// 서브 Grid 조회 param
var subParam = {};

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            $('#mainGrid').data('kendoExtGrid').dataSource.read();

            $("#subGrid").data('kendoExtGrid').dataSource.data([]);
        }
    });

    //연식
    $("#sDlDt").kendoExtMaskedDatePicker({
         value:toDay.substring(0, 8)
        ,start:"year"
        ,depth:"year"
        ,format:"yyyy-MM"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 프로모션 정보
    $("#mainGrid").kendoExtGrid({
        gridId:"G-SAL-0721-115003"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/prm/salesAllowance/selectSalesAllowanceSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlDt"] = kendo.toString($("#sDlDt").data("kendoExtMaskedDatePicker").value(),"yyyyMM");
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"promotionCd",
                    fields:{
                        promotionCd   :{type:"string"}
                        ,promotionNm  :{type:"string"}
                        ,imsBudnRate  :{type:"number"}
                        ,cntCount     :{type:"number"}
                        ,contractAmt  :{type:"number"}
                        ,imsAmt       :{type:"number"}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,autoBind   :true
       ,editable:false
       ,height:173
       ,selectable :"row"
       //,sortable:false
       ,change:function(e) {
           if(!e.sender.dataItem(e.sender.select()).isNew()){
               var selectedItem = this.dataItem(this.select());

               subParam = {
                       "sDlDt":selectedItem.shYyMm
                      ,"sPromotionCd":selectedItem.promotionCd
               };
               $('#subGrid').data('kendoExtGrid').dataSource.read();
           }
       }
       ,columns:[
            {field:"promotionCd", title:"<spring:message code='global.lbl.promotion' />", width:120}         // 프로모션
          , { field:"promotionNm", title:"<spring:message code='global.lbl.promotionNm' />", width:200, attributes:{"class":"al"} }   // 프로모션명
          , {      // 제조사부담률
              field:"imsBudnRate", title:"<spring:message code='sal.lbl.imsBudnRate' />", width:100, attributes:{"class":"ar"}
              ,format:"{0:p2}"
            }
          , {      // 계약대수
              field:"cntCount", title:"<spring:message code='sal.lbl.cntCount' />", width:100, attributes:{"class":"ar"}
              ,format:"{0:n0}"
            }
          , {      // 판매금액
              field:"carTotAmt", title:"<spring:message code='global.lbl.salAmt' />", width:100, attributes:{"class":"ar"}
              ,format:"{0:n2}"
            }
          , {      // 할인금액
              field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100, attributes:{"class":"ar"}
              ,format:"{0:n2}"
            }
          , {      // 청구금액
              field:"imsAmt", title:"<spring:message code='sal.lbl.imsAmt' />", width:100, attributes:{"class":"ar"}
              ,format:"{0:n2}"
            }
       ]
   });

   // 계약상세 정보
   $("#subGrid").kendoExtGrid({
       gridId:"G-SAL-0721-115004"
       ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/prm/salesAllowance/selectSalesAllowanceSub.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        subParam["recordCountPerPage"] = options.pageSize;
                        subParam["pageIndex"] = options.page;
                        subParam["firstIndex"] = options.skip;
                        subParam["lastIndex"] = options.skip + options.take;
                        subParam["sort"] = options.sort;

                        return kendo.stringify(subParam);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"promotionCd",
                    fields:{
                         rnum         :{type:"number"}
                        ,promotionCd  :{type:"string"}
                        ,promotionNm  :{type:"string"}
                        ,contractNo   :{type:"string"}
                        ,custCd       :{type:"string"}
                        ,custNm       :{type:"string"}
                        ,saleEmpNo    :{type:"string"}
                        ,carlineNm    :{type:"string"}
                        ,contractDt   :{type:"date"}
                        ,realDlDt     :{type:"date"}
                        ,contractAmt  :{type:"number"}
                        ,dcAmt        :{type:"number"}
                        ,imsAmt       :{type:"number"}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,autoBind:false
       ,editable:false
       ,height:219
       ,selectable :"row"
       ,columns:[
            { field:"rnum", title:"NO", width:40, attributes:{"class":"ac"} }
          , { field:"promotionCd", title:"<spring:message code='global.lbl.promotion' />", width:120}         // 프로모션
          , { field:"promotionNm", title:"<spring:message code='global.lbl.promotionNm' />", width:160, attributes:{"class":"al"} }   // 프로모션명
          , { field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", width:100, attributes:{"class":"ac"} }   // 계약번호
          //, { field:"custCd", hidden:true }   // 고객번호
          , { field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100, attributes:{"class":"al"} }   // 고객명
          , { field:"saleEmpNo", title:"<spring:message code='sale.lbl.saleEmpNo' />", width:100, attributes:{"class":"al"} }   // 영업사원
          , { field:"carlineNm", title:"<spring:message code='global.lbl.carNm' />", width:120, attributes:{"class":"al"} }   // 차량
          , { field:"contractDt", title:"<spring:message code='global.lbl.contractDt' />", width:120, attributes:{"class":"al"}, format:"{0:"+vDtyyyyMMdd+"}" }   // 계약일자
          , { field:"realDlDt", title:"<spring:message code='sal.lbl.realDlDt' />", width:120, attributes:{"class":"al"}, format:"{0:"+vDtyyyyMMdd+"}" }   // 실제 고객인도일자
          , {      // 판매금액
              field:"carTotAmt", title:"<spring:message code='global.lbl.salAmt' />", width:100, attributes:{"class":"ar"}
              ,format:"{0:n2}"
            }
          , {      // 할인금액
              field:"dcAmt", title:"<spring:message code='global.lbl.dcAmt' />", width:100, attributes:{"class":"ar"}
              ,format:"{0:n2}"
            }
          , {      // 청구금액
              field:"imsAmt", title:"<spring:message code='sal.lbl.imsAmt' />", width:100, attributes:{"class":"ar"}
              ,format:"{0:n2}"
            }
       ]
   });


});
</script>
