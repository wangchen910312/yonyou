<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="table_form form_width_100per mt10">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:80%;">
                <col >
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.accountBalance" /></th> <!-- 계정잔액 -->
                    <td class="readonly_area">
                        <input id="preAmt" type="text" class="form_numeric ar" readonly>
                    </td>

                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">

//팝업 옵션
var options = parent.orderAmtPopup.options.content.data;

$(document).ready(function() {

    // 선수금 잔액
    $("#preAmt").kendoExtNumericTextBox({
        format:"n2"
       ,decimals:2
       ,value:0.00
       ,spinners:false
    });


    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{}
                ,parameterMap:function(options, operation) {}
            }
            ,navigatable:false
            ,serverPaging:false
            ,pageSize:0
            ,schema:{
                model:{
                    id:"carlineCd"
                    ,fields:{
                        carlineCd:{type:"number", editable:false, hidden:true}
                        ,modelCd:{type:"string", editable:false, hidden:true}
                        ,ocnCd:{type:"string", editable:false, hidden:true}
                        ,extColorCd:{type:"string", editable:false, hidden:true}
                        ,intColorCd:{type:"string", editable:false, hidden:true}
                        ,carlineNm:{type:"number", editable:false}
                        ,modelNm:{type:"string", editable:false}
                        ,ocnNm:{type:"string", editable:false}
                        ,extColorNm:{type:"string", editable:false}
                        ,intColorNm:{type:"string", editable:false}
                        ,ordQty:{type:"number", editable:false}
                        ,whPrc:{type:"number", editable:false}
                        ,msPrc:{type:"number", editable:false}
                    }
                }
            }
            ,aggregate:[
                            { field:"ordQty", aggregate:"sum" }
                           ,{ field:"whPrc", aggregate:"sum" }
                           ,{ field:"msPrc", aggregate:"sum" }
                        ]
        }
        ,editable:false
        ,autoBind:false
        ,pageable:false
        ,height:280
        ,columns:[
           {   field:"carlineCd", hidden:true }  // 차종
          ,{   field:"modelCd", hidden:true }  // 모델
          ,{   field:"ocnCd", hidden:true }  // OCN
          ,{   field:"extColorCd", hidden:true }  // 외장색
          ,{   field:"intColorCd", hidden:true }  // 내장색
          ,{
               title:"<spring:message code='global.lbl.carLine' />"
              ,field:"carlineNm", width:35
              ,headerAttributes:{style:"text-align:center;"}
              ,footerAttributes:{style:"visibility:hidden;"}
           }  // 차종
          ,{
               title:"<spring:message code='global.lbl.model' />"
              ,field:"modelNm", width:90
              ,headerAttributes:{style:"text-align:center;"}
              ,footerAttributes:{style:"visibility:hidden;"}
           }  // 모델
          ,{
               title:"<spring:message code='global.lbl.ocn' />"
              ,field:"ocnNm", width:85
              ,headerAttributes:{style:"text-align:center;"}
              ,footerAttributes:{style:"visibility:hidden;"}
           }  // OCN
          ,{
               title:"<spring:message code='global.lbl.extColor' />"
              ,field:"extColorNm", width:40
              ,headerAttributes:{style:"text-align:center;"}
              ,footerAttributes:{style:"visibility:hidden;"}
           }  // 외장색
          ,{
               title:"<spring:message code='global.lbl.intColor' />"
              ,field:"intColorNm", width:50
              ,headerAttributes:{style:"text-align:center;"}
              ,footerTemplate:"<spring:message code='global.lbl.total' />"   //주문금액 합계
              ,footerAttributes:{style:"text-align:right;"}
           }  // 내장색
          ,{
               title:"<spring:message code='global.lbl.orderQty' />"
              ,field:"ordQty", width:25
              ,headerAttributes:{style:"text-align:center;"}
              ,attributes:{ "style":"text-align:right"}
              ,format:"{0:n0}"
              ,footerTemplate:"#=kendo.toString(sum, 'n0')#"
              ,footerAttributes:{style:"text-align:right;"}
           }  // 주문수량
           ,{
               title:"<spring:message code='sal.lbl.whPrc' />"
              ,field:"whPrc", width:40
              ,headerAttributes:{style:"text-align:center;"}
              ,attributes:{ "style":"text-align:right"}
              ,format:"{0:n2}"
              ,footerTemplate:"#=kendo.toString(sum, 'n2')#"
              ,footerAttributes:{style:"text-align:right;"}
           }  // 공제가격
          ,{
               title:"<spring:message code='global.lbl.recRetailPrc' />"
              ,field:"msPrc", width:40
              ,headerAttributes:{style:"text-align:center;"}
              ,attributes:{ "style":"text-align:right"}
              ,format:"{0:n2}"
              ,footerTemplate:"#=kendo.toString(sum, 'n2')#"
              ,footerAttributes:{style:"text-align:right;"}
           }  // 권장소매가
        ]
    });


    if (options.arrSelectVeh) {
        var modelCd = "";
        var ocnCd = "";
        var whPrc;
        var msPrc;

        for(var i = 0; i < options.arrSelectVeh.length; i++){


            if(modelCd == "" || ( modelCd != options.arrSelectVeh[i].modelCd
                                 || ocnCd != options.arrSelectVeh[i].ocnCd)){

                modelCd = options.arrSelectVeh[i].modelCd;
                ocnCd = options.arrSelectVeh[i].ocnCd;

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrderAmtPopup.do'/>"
                    ,data:JSON.stringify({"modelCd":modelCd
                                           ,"ocnCd":ocnCd})
                    ,async:false
                });

                whPrc = responseJson.data[0].whPrc;
                msPrc = responseJson.data[0].msPrc;
            }

            $('#grid').data('kendoExtGrid').dataSource.insert(0,
                    {carlineCd:options.arrSelectVeh[i].carlineCd
                    ,modelCd:options.arrSelectVeh[i].modelCd
                    ,ocnCd:options.arrSelectVeh[i].ocnCd
                    ,extColorCd:options.arrSelectVeh[i].extColorCd
                    ,intColorCd:options.arrSelectVeh[i].intColorCd
                    ,carlineNm:options.arrSelectVeh[i].carlineNm
                    ,modelNm:options.arrSelectVeh[i].modelNm
                    ,ocnNm:options.arrSelectVeh[i].ocnNm
                    ,extColorNm:options.arrSelectVeh[i].extColorNm
                    ,intColorNm:options.arrSelectVeh[i].intColorNm
                    ,ordQty:1
                    ,whPrc:whPrc
                    ,msPrc:msPrc
                    });
        }

        //$("#ordQty").val(options.arrSelectVeh.length);
    }

    // 선수금 잔액 조회
    $.ajax({
        url:"<c:url value='/sal/orm/btoCreateOrder/selectBtoCreateOrderPreAmtSearch.do' />"
        //,data:JSON.stringify(param)
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,error:function(jqXHR, status, error) {
            //dms.notification.error(jqXHR.responseJSON.errors);
        }
        ,success:function(jqXHR, textStatus) {
            $("#preAmt").data("kendoExtNumericTextBox").value(jqXHR.data[0].totBalAmt);
        }
    });

});
</script>









