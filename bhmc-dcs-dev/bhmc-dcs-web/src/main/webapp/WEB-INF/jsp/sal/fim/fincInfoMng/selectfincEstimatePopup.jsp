<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 금융관리 팝업 -->
<section id="window" class="pop_wrap">
    <div class="table_form mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:11%;">
                <col style="width:10%;">
                <col style="width:10%;">
                <col style="width:16%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.fincItem' /></th>   <!-- 금융상품 -->
                    <td>
                        <input id="fincItemNm" type="text" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.fincRpayPridMn' /></th>   <!-- 상환개월 -->
                    <td>
                        <input id="fincRpayPrid" type="text" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.fincLoadRate' /></th>    <!-- 대출비율(%) -->
                    <td>
                        <input id="fincLoanRate" type="text" readonly class="form_input form_readonly">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.fincReqAmt' /></th>       <!-- 대출금액 -->
                    <td>
                        <input id="fincReqAmt" readonly class="form_numeric form_readonly ar">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>

    <span style="display:none">
        <!-- 금융번호 -->
        <input type="hidden" id="fincNo"  />
    </span>
</section>
<!-- // 금융관리 팝업 -->


<!-- script -->
<script>
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
var vDtyyyyMMdd = "${_dateFormat}";
var dlrCd     = "${dlrCd}";     // 딜러코드

$(document).ready(function() {

     // 팝업 설정값
    var options = parent.popupWindow.options.content.data;

     //대출금액
    $("#fincReqAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });

    $("#fincNo").val(options.fincNo);
    $("#fincItemNm").val(dms.string.strNvl(options.fincItemNm));
    $("#fincRpayPrid").val(dms.string.strNvl(options.fincRpayPrid));
    $("#fincLoanRate").val(dms.string.strNvl(options.fincLoanRate));
    $("#fincReqAmt").data("kendoExtNumericTextBox").value(Number(options.fincReqAmt));

    // 그리드
    $("#grid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/fim/fincInfoMng/selectFincInfoPopupSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sFincNo"] = $("#fincNo").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                model:{
                    id:"fincNo",
                    fields:{
                         dlrCd          :{type:"string", editable:false} // 딜러코드
                        ,fincNo         :{type:"string"}                 // 금융번호
                        ,fincRpayDt     :{type:"date"}                   // 상환일
                        ,fincRpaySeq    :{type:"number"}                 // 순번
                        ,fincRpayAmt    :{type:"number"}                 // 상환비용
                        ,fincRpayIntrAmt:{type:"number"}                 // 이자금액
                        ,fincRpayTotAmt :{type:"number"}                 // 총상환금액
                    }
                }
            }
            ,aggregate:[
                          { field:"fincRpayAmt", aggregate:"sum" }
                         ,{ field:"fincRpayIntrAmt", aggregate:"sum" }
                         ,{ field:"fincRpayTotAmt", aggregate:"sum" }
                      ]
        }
       ,multiSelectWithCheckbox:false
       ,pageable :false
       ,height   :175
       ,editable :false
       ,resizable:true
       ,autoBind :true
       ,selectable:"row"
       ,navigatable:true
       ,sortable:false
       ,filterable:false
       //,edit:onEditMainCd
       ,columns:[
          {field:"dlrCd", hidden:true}       // 딜러코드
          ,{field:"fincNo", hidden:true}   // 금융번호
          ,{
              field:"fincRpayDt", title:"<spring:message code='sal.lbl.fincRpayDt' />", width:120
              , format:"{0:"+vDtyyyyMMdd+"}"
              ,attributes:{"class":"ac"}
              ,headerAttributes:{style:"text-align:center;"}
              ,footerTemplate:"<spring:message code='global.lbl.total' />"    // 합계
              ,footerAttributes:{style:"text-align:right;"}
          }     // 상환일
          ,{
              field:"fincRpaySeq", title:"<spring:message code='global.lbl.noName' />", width:100
              ,attributes:{"class":"ac"}
              ,headerAttributes:{style:"text-align:center;"}
              ,footerAttributes:{style:"visibility:hidden;"}
          }   //순번
          ,{
              field:"fincRpayAmt", title:"<spring:message code='sal.lbl.fincRpayAmt' />", width:100
              , format:"{0:n2}"
              , headerAttributes:{style:"text-align:center;"}
              , attributes:{"class":"ar"}
              , footerTemplate:"#=kendo.toString(sum, 'n2')#"
              , footerAttributes:{style:"text-align:right;"}
          }  //상환비용
          ,{
              field:"fincRpayIntrAmt", title:"<spring:message code='sal.lbl.fincRpayIntrAmt' />", attributes:{"class":"ar"}, width:100
              , format:"{0:n2}"
              , headerAttributes:{style:"text-align:center;"}
              , attributes:{"class":"ar"}
              , footerTemplate:"#=kendo.toString(sum, 'n2')#"
              , footerAttributes:{style:"text-align:right;"}
          }  //이자금액
          ,{
              field:"fincRpayTotAmt", title:"<spring:message code='sal.lbl.fincRpayTotAmt' />", attributes:{"class":"ar"}, width:100
              , format:"{0:n2}"
              , headerAttributes:{style:"text-align:center;"}
              , attributes:{"class":"ar"}
              , footerTemplate:"#=kendo.toString(sum, 'n2')#"
              , footerAttributes:{style:"text-align:right;"}
          }  //총금액
       ]
   });




});
</script>
<!-- //script -->