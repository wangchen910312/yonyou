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
            <dms:access viewId="VIEW-D-12842" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSave" class="btn_m btn_search"><spring:message code='global.btn.save' /></button><!-- 저장 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10964" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
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
                    <th scope="row"><spring:message code='global.lbl.ordForcastYear' /></th><!-- 년도 -->
                    <td>
                        <input id="sYyMm" type="text" class="form_datepicker">
                    </td>
                    <td></td>
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
    <!-- 그리드 종료 -->
</section>
</div>

<script>
 var sysDate = "${toDay}";
 var subParam = {};

$(document).ready(function () {

    //검색조건 년월
    $("#sYyMm").kendoExtMaskedDatePicker({
        start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,value:sysDate
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
   });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            if($("#sYyMm").data('kendoExtMaskedDatePicker').value() == null ){
                //적용일을 모두 입력해 주세요
                dms.notification.info("<spring:message code='global.lbl.year' var='year' /><spring:message code='global.info.check.field' arguments='${year}' />");
                return false;
            }
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    $("#btnSave").kendoButton({ // 저장
        enable:true,
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/bto/buyPredictedQuantityMngmnt/updateBuyPredictedQuantityMngmnt.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
                        //$("#btnAllChange").data("kendoButton").enable(false);

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

    //그리드 1번
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0223-200000"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/bto/buyPredictedQuantityMngmnt/selectBuyPredictedQuantityMngmnt.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["sYyMm"] = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(),"yyyyMM");

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



            ,change:function(e){

                //그리드 데이터소스가 "itemchange","add","remove","sync" 인 경우
                if(e.action == "itemchange"){
                    var fieldName = e.field;
                    if(fieldName == "cntlSalQty"){
                        $.each(e.sender.data(), function(idx, item){
                            item.set("aftSalQty", item.cntlSalQty + item.monthGapSalQty);
                        });
                    }

                 if(fieldName == "forcSalQty"){
                        $.each(e.sender.data(), function(idx, item){
                            item.set("forcAftSalQty", item.forcSalQty - item.soldSalQty - item.contSalQty); //예상후속=예측수량-기판매-미출고계약
                            item.set("monthGapSalQty", item.contSalQty + item.forcAftSalQty - item.sumQty); //본월차이=미출고계약+예상후속-합계
                            item.set("aftSalQty", item.cntlSalQty + item.monthGapSalQty); //후속주문=조정수량+본월차이
                        });
                    }
                }

            }

             ,schema:{
                  model:{
                      id:"makeDt",
                      fields:{
                          makeDt:{type:"string", editable:false} //생성일
                          ,month3Qty:{type:"number", editable:false} //M-3
                          ,month2Qty:{type:"number", editable:false} //M-2
                          ,month1Qty:{type:"number", editable:false} //M-1
                          ,avrgQty:{type:"number", editable:false} //평균수량
                          ,stockQty:{type:"number", editable:false} //재고
                          ,transQty:{type:"number", editable:false} //운송
                          ,ordInitQty:{type:"number", editable:false} //오더분배
                          ,notyetOrdInitQty:{type:"number", editable:false} //오더미분배
                          ,sumQty:{type:"number", editable:false} //합계
                          ,forcSalQty:{type:"number", editable:true} //예측수량
                          ,soldSalQty:{type:"number", editable:false} //기판매
                          ,contSalQty:{type:"number", editable:false} //미출고계약
                          ,forcAftSalQty:{type:"number", editable:true} //예상후속
                          ,monthGapSalQty:{type:"number", editable:true} //본월차이
                          ,cntlSalQty:{type:"number", editable:true} //조정량
                          ,aftSalQty:{type:"number", editable:true} //후속주문
                      }
                 }
             }
        }

        ,edit:function(e){
            var eles = e.container.find("input");
            var fieldName;

            if(eles.length > 1){
                fieldName = eles[eles.length-1].getAttribute("name");
            }else{
                fieldName = eles.attr("name");
            }
            var input = e.container.find(".k-input");

            if(fieldName == "forcAftSalQty"){
                this.closeCell();
            }

            if(fieldName == "monthGapSalQty"){
                this.closeCell();
            }

            if(fieldName == "aftSalQty"){
                this.closeCell();
            }
        }

        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,height:115
        ,pageable:false
        ,sortable  :false
        ,filterable:false
        ,selectable:"row"
        ,autoBind:true
        ,columns:[
                  {field:"makeDt", hidden:true}

                 ,{title:"<spring:message code='sal.lbl.3monthSelling' />", headerAttributes:{"class":"hasBob"}
                     ,columns:[
                          {field:"month3Qty", title:"<spring:message code='sal.lbl.m3Label' />"
                              ,width:50
                              ,headerAttributes:{style:"text-align:center;"}
                              ,attributes:{"class":"ar"}
                          }  // M-3
                          ,{field:"month2Qty", title:"<spring:message code='sal.lbl.m2Label' />"
                              ,width:50
                              ,headerAttributes:{style:"text-align:center;"}
                              ,attributes:{"class":"ar"}
                          }  // M-2
                          ,{field:"month1Qty", title:"<spring:message code='sal.lbl.m1Label' />"
                              ,width:50
                              ,headerAttributes:{style:"text-align:center;"}
                              ,attributes:{"class":"ar"}
                          }  // M-1
                          ,{field:"avrgQty", title:"<spring:message code='sal.lbl.avgQty' />"
                              ,width:50
                              ,headerAttributes:{style:"text-align:center;"}
                              ,attributes:{"class":"ar"}
                          }  // 평균수량
                      ]
                   }

                 ,{title:"<spring:message code='sal.lbl.nowStock' />", headerAttributes:{"class":"hasBob"}
                    ,columns:[
                          {field:"stockQty", title:"<spring:message code='sal.lbl.stock' />"
                              ,width:50
                              ,headerAttributes:{style:"text-align:center;"}
                              ,attributes:{"class":"ar"}
                          }  // 재고
                          ,{field:"transQty", title:"<spring:message code='sal.lbl.trans' />"
                              ,width:50
                              ,headerAttributes:{style:"text-align:center;"}
                              ,attributes:{"class":"ar"}
                          }  // 운송
                          ,{field:"ordInitQty", title:"<spring:message code='sal.lbl.orderSet' />"
                              ,width:50
                              ,headerAttributes:{style:"text-align:center;"}
                              ,attributes:{"class":"ar"}
                          }  // 오더분배
                          ,{field:"notyetOrdInitQty", title:"<spring:message code='sal.lbl.orderSetNotYet' />"
                              ,width:50
                              ,headerAttributes:{style:"text-align:center;"}
                              ,attributes:{"class":"ar"}
                          }  // 미분배
                          ,{field:"sumQty", title:"<spring:message code='global.lbl.total' />"
                              ,width:50
                              ,headerAttributes:{style:"text-align:center;"}
                              ,attributes:{"class":"ar"}
                          }  // 합계
                    ]
                  }
                 ,{title:"<spring:message code='sal.lbl.thisMonthSelling' />", headerAttributes:{"class":"hasBob"}
                    ,columns:[
                           {field:"forcSalQty", title:"<spring:message code='sal.lbl.forecastQty' />"
                               ,width:50
                               ,headerAttributes:{style:"text-align:center;"}
                               ,attributes:{"class":"ar"}
                           }  // 예측수량
                           ,{field:"soldSalQty", title:"<spring:message code='sal.lbl.selledQty' />"
                               ,width:50
                               ,headerAttributes:{style:"text-align:center;"}
                               ,attributes:{"class":"ar"}
                           }  // 기판매
                           ,{field:"contSalQty", title:"<spring:message code='sal.lbl.noDlvContQty' />"
                               ,width:50
                               ,headerAttributes:{style:"text-align:center;"}
                               ,attributes:{"class":"ar"}
                           }  // 미출고계약
                           ,{field:"forcAftSalQty", title:"<spring:message code='sal.lbl.forcOrdQty' />"
                               ,width:50
                               ,headerAttributes:{style:"text-align:center;"}
                               ,attributes:{"class":"ar"}
                           }  // 예상후속
                           ,{field:"monthGapSalQty", title:"<spring:message code='global.lbl.thisMontGapQty' />"
                               ,width:50
                               ,headerAttributes:{style:"text-align:center;"}
                               ,attributes:{"class":"ar"}
                           }  // 본월차이
                           ,{field:"cntlSalQty", title:"<spring:message code='global.lbl.cntlQty' />"
                               ,width:50
                               ,headerAttributes:{style:"text-align:center;"}
                               ,attributes:{"class":"ar"}
                           }  // 조정량
                           ,{field:"aftSalQty", title:"<spring:message code='global.lbl.nextOrdQty' />"
                               ,width:50
                               ,headerAttributes:{style:"text-align:center;"}
                               ,attributes:{"class":"ar"}
                           }  // 후속주문
                     ]
                  }
        ]
    });
});
</script>