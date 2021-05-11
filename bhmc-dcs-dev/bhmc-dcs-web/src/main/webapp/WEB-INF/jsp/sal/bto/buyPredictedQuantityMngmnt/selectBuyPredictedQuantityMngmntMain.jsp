<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 주문 예측수량 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.menu.ordForeCntMgmt' /></h1><!-- 주문 예측수량 관리 -->
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:13%;">
                <col style="width:10%;">
                <col style="width:20%;">
                <col style="width:24%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.year' /></th><!-- 년도 -->
                    <td>
                        <input id="sYear" type="text" class="form_datepicker">
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.dlrCd' /></th><!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" type="text" class="form_input readonly" readonly>
                    </td>

                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>

    <div class="table_grid mt10">
        <div id="subGrid" class="resizable_grid"></div>
    </div>

    <!-- 그리드 종료 -->
</section>
</div>



<!-- script -->
<script>
 var sysDate = "${toDay}";
 var strDlrCd = "${dlrCd}";
 var subParam = {};

$(document).ready(function () {

    $("#sDlrCd").val(strDlrCd);

    //조회조건 - 적용시작일
    var sStartDtPicker = $("#sYear").kendoExtMaskedDatePicker({
        value:sysDate
        ,start:"decade"
        ,depth:"decade"
        ,format:"yyyy"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    }).data("kendoExtMaskedDatePicker");


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            if($("#sYear").data('kendoExtMaskedDatePicker').value() == null ){
                //적용일을 모두 입력해 주세요
                dms.notification.info("<spring:message code='global.lbl.year' var='year' /><spring:message code='global.info.check.field' arguments='${year}' />");
                return false;
            }
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/bto/buyPredictedQuantityMngmnt/selectBuyPredictedQuantityMngmnt.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sYear"] = kendo.toString($("#sYear").data("kendoExtMaskedDatePicker").value(),"yyyy");
                        params["sDlrCd"] = $("#sDlrCd").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                    //dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"dlrCd"
                    ,fields:{
                         yy                    :{type:"string", hidden:true}
                        ,dlrCd                 :{type:"string", editable:false}
                        ,dlrNm                 :{type:"string", editable:false}
                        ,predictionUnit01      :{type:"number", editable:false}
                        ,completeQuantity01    :{type:"number", editable:false}
                        ,predictionUnit02      :{type:"number", editable:false}
                        ,completeQuantity02    :{type:"number", editable:false}
                        ,predictionUnit03      :{type:"number", editable:false}
                        ,completeQuantity03    :{type:"number", editable:false}
                        ,predictionUnit04      :{type:"number", editable:false}
                        ,completeQuantity04    :{type:"number", editable:false}
                        ,predictionUnit05      :{type:"number", editable:false}
                        ,completeQuantity05    :{type:"number", editable:false}
                        ,predictionUnit06      :{type:"number", editable:false}
                        ,completeQuantity06    :{type:"number", editable:false}
                        ,predictionUnit07      :{type:"number", editable:false}
                        ,completeQuantity07    :{type:"number", editable:false}
                        ,predictionUnit08      :{type:"number", editable:false}
                        ,completeQuantity08    :{type:"number", editable:false}
                        ,predictionUnit09      :{type:"number", editable:false}
                        ,completeQuantity09    :{type:"number", editable:false}
                        ,predictionUnit10      :{type:"number", editable:false}
                        ,completeQuantity10    :{type:"number", editable:false}
                        ,predictionUnit11      :{type:"number", editable:false}
                        ,completeQuantity11    :{type:"number", editable:false}
                        ,predictionUnit12      :{type:"number", editable:false}
                        ,completeQuantity12    :{type:"number", editable:false}
                    }
                }
            }
        }
        ,height:107
        ,autoBind:false
        ,pageable:false
        ,filterable:false
        ,editable:false
        ,columns:[
             {field:"yy",  hidden:false} //조회년도
            ,{field:"dlrNm",     title:"<spring:message code='global.lbl.dealer' />"
                ,width:160, attributes:{"class":"al"}
             } //딜러코드
            ,{title:"1<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                 columns:[{field:"predictionUnit01" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                              , width:70, attributes:{"class":"ar"}
                              , template:"<a href=\"javascript:subGridView(\'#=yy#\', \'01\');\">#=predictionUnit01#</a>"
                          } //예측
                          ,{field:"completeQuantity01"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                              , width:70, attributes:{"class":"ar"}
                              , template:"<a href=\"javascript:subGridView(\'#=yy#\', \'01\');\">#=completeQuantity01#</a>"
                          } //완성
                         ]
             }
            ,{title:"2<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit02" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', \'02\');\">#=predictionUnit02#</a>"
                          } //예측
                         ,{field:"completeQuantity02"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', \'02\');\">#=completeQuantity02#</a>"
                          } //완성
                        ]
             }
            ,{title:"3<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit03" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '03');\">#=predictionUnit03#</a>"
                         } //예측
                         ,{field:"completeQuantity03"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '03');\">#=completeQuantity03#</a>"
                         } //완성
                        ]
             }
            ,{title:"4<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit04" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '04');\">#=predictionUnit04#</a>"
                         } //예측
                         ,{field:"completeQuantity04"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '04');\">#=completeQuantity04#</a>"
                         } //완성
                        ]
             }
            ,{title:"5<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit05" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '05');\">#=predictionUnit05#</a>"
                         } //예측
                         ,{field:"completeQuantity05"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '05');\">#=completeQuantity05#</a>"
                         } //완성
                        ]
             }
            ,{title:"6<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit06" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '06');\">#=predictionUnit06#</a>"
                         } //예측
                         ,{field:"completeQuantity06"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '06');\">#=completeQuantity06#</a>"
                         } //완성
                        ]
             }
            ,{title:"7<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit07" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '07');\">#=predictionUnit07#</a>"
                         } //예측
                         ,{field:"completeQuantity07"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '07');\">#=completeQuantity07#</a>"
                         } //완성
                        ]
             }
            ,{title:"8<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit08" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '08');\">#=predictionUnit08#</a>"
                         } //예측
                         ,{field:"completeQuantity08"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '08');\">#=completeQuantity08#</a>"
                         } //완성
                        ]
             }
            ,{title:"9<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit09" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '09');\">#=predictionUnit09#</a>"
                         } //예측
                         ,{field:"completeQuantity09"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '09');\">#=completeQuantity09#</a>"
                         } //완성
                        ]
             }
            ,{title:"10<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit10" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '10');\">#=predictionUnit10#</a>"
                         } //예측
                         ,{field:"completeQuantity10"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '10');\">#=completeQuantity10#</a>"
                         } //완성
                        ]
             }
            ,{title:"11<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit11" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '11');\">#=predictionUnit11#</a>"
                         } //예측
                         ,{field:"completeQuantity11"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '11');\">#=completeQuantity11#</a>"
                         } //완성
                        ]
             }
            ,{title:"12<spring:message code = 'mobile.lbl.month'/>", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" }, //
                columns:[{field:"predictionUnit12" ,title:"<spring:message code = 'sal.lbl.prediction'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '12');\">#=predictionUnit12#</a>"
                         } //예측
                         ,{field:"completeQuantity12"   ,title:"<spring:message code = 'sal.lbl.complete'/>"
                             , width:70, attributes:{"class":"ar"}
                             , template:"<a href=\"javascript:subGridView(\'#=yy#\', '12');\">#=completeQuantity12#</a>"
                         } //완성
                        ]
             }
        ]
    });

    // 상세 그리드
    $("#subGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/bto/buyPredictedQuantityMngmnt/selectBuyPredictedQuantityMngmntDetail.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        return kendo.stringify(subParam);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch:false
            ,schema:{
                model:{
                    id:"rownum",
                    fields:{
                         dlrCd:{type:"string", editable:false} // 딜러코드
                        ,carlineCd:{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,modelCd:{type:"string"}
                        ,modelNm:{type:"string"}
                        ,ocnCd:{type:"string"}
                        ,ocnNm:{type:"string"}
                        ,extColorCd:{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorCd:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,monthCont:{type:"number"}       // 당월 판매수량
                        ,monthContB1:{type:"number"}     // 전원 판매수량
                        ,monthContB2:{type:"number"}     // 2달전 판매수량
                        ,monthContB3:{type:"number"}     // 3달전 판매수량
                        ,averageCont:{type:"number"}     // 전3개월 평균 판매수량
                        ,noAssign:{type:"number"}        // 미배정 주문수량
                        ,assign:{type:"number"}          // 주문수량
                        ,stockCnt:{type:"number"}        // 재고수량
                        ,posiStockCnt:{type:"number"}    // 판매가능재고수량
                    }
                }
            }
            ,aggregate:[
                        { field:"monthCont", aggregate:"sum" }
                       ,{ field:"monthContB1", aggregate:"sum" }
                       ,{ field:"monthContB2", aggregate:"sum" }
                       ,{ field:"monthContB3", aggregate:"sum" }
                       ,{ field:"averageCont", aggregate:"sum" }

                       ,{ field:"noAssign", aggregate:"sum" }
                       ,{ field:"assign", aggregate:"sum" }

                       ,{ field:"stockCnt", aggregate:"sum" }
                       ,{ field:"posiStockCnt", aggregate:"sum" }
                    ]
        }
       ,multiSelectWithCheckbox:false
       ,appendEmptyColumn:false           //빈컬럼 적용
       ,height:380
       ,editable:false
       ,pageable:false
       ,resizable:true
       ,autoBind:false
       ,selectable:"row"
       ,navigatable:true
       ,columns:[
          {field:"dlrCd",     title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}       // 딜러코드
          ,{field:"carlineCd", title:"carlineCd", hidden:true}        //차종코드
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:130, attributes:{"class":"al"}}       //차종명
          ,{field:"modelCd", title:"modelCd", hidden:true}            //모델코드
          ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:130, attributes:{"class":"al"}}           //모델명
          ,{field:"ocnCd", title:"ocnCd", hidden:true}                //OCN코드
          ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:130, attributes:{"class":"al"}}               //OCN명
          ,{field:"extColorCd", title:"extColorCd", hidden:true}     //외장색상코드
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:110, attributes:{"class":"al"}}     //외장색
          ,{field:"intColorCd", title:"intColorCd", hidden:true}     //내장색상코드
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:110, attributes:{"class":"al"}
             ,footerTemplate:"<spring:message code='global.lbl.total' />"    // 합계
             ,footerAttributes:{style:"text-align:right;"}
          }     //내장색
          ,{title:"<spring:message code='sal.lbl.sale' />", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" },    //판매
              columns:[{field:"monthCont", title:"<spring:message code='sal.lbl.monthContCnt' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}", footerTemplate:"#=kendo.toString(sum, 'n0')#", footerAttributes:{style:"text-align:right;"}}    //당월 판매수량
                      ,{field:"monthContB1", title:"<spring:message code='sal.lbl.monthContB1' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}", footerTemplate:"#=kendo.toString(sum, 'n0')#", footerAttributes:{style:"text-align:right;"}}   //1달전 판매수량
                      ,{field:"monthContB2", title:"<spring:message code='sal.lbl.monthContB2' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}", footerTemplate:"#=kendo.toString(sum, 'n0')#", footerAttributes:{style:"text-align:right;"}}   //2달전 판매수량
                      ,{field:"monthContB3", title:"<spring:message code='sal.lbl.monthContB3' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}", footerTemplate:"#=kendo.toString(sum, 'n0')#", footerAttributes:{style:"text-align:right;"}}   //3달전 판매수량
                      ,{field:"averageCont", title:"<spring:message code='sal.lbl.averageCont' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}", footerTemplate:"#=kendo.toString(sum, 'n0')#", footerAttributes:{style:"text-align:right;"}}   //전3개월 평균 판매수량
                      ]
          }
          ,{title:"<spring:message code='global.lbl.order' />", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" },                             //주문
              columns:[{field:"noAssign", title:"<spring:message code='sal.lbl.noAssignCnt' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}", footerTemplate:"#=kendo.toString(sum, 'n0')#", footerAttributes:{style:"text-align:right;"}}       //미배정 주문수량
                      ,{field:"assign", title:"<spring:message code='global.lbl.orderQty' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}", footerTemplate:"#=kendo.toString(sum, 'n0')#", footerAttributes:{style:"text-align:right;"}}         //주문수량
                      ]
          }
          ,{title:"<spring:message code='global.lbl.stock' />", attributes:{"class":"ac"}, headerAttributes:{ "class":"hasBob" },                                 //재고
              columns:[{field:"stockCnt", title:"<spring:message code='sal.lbl.stockCnt' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}", footerTemplate:"#=kendo.toString(sum, 'n0')#", footerAttributes:{style:"text-align:right;"}}             //재고수량
                      ,{field:"posiStockCnt", title:"<spring:message code='sal.lbl.posiStockCnt' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}", footerTemplate:"#=kendo.toString(sum, 'n0')#", footerAttributes:{style:"text-align:right;"}}     //판매가능재고수량
                      ]
          }
       ]
    });
});

// sub Grid 조회
function subGridView(yy, mm){
    subParam = {};
    subParam["sDlrCd"] = $("#sDlrCd").val();
    subParam["sYyMm"] = yy + "-" + mm;
    $('#subGrid').data('kendoExtGrid').dataSource.read();
}

</script>
<!-- //script -->
