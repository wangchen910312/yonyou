<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.fundStatus' /></h1> <!-- 월자금현황(딜러) -->
        <div class="btn_right">

            <dms:access viewId="VIEW-D-10973" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_excel" type="button" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button>   <!-- 엑셀다운로드 -->
            </dms:access>

            <dms:access viewId="VIEW-D-10972" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col style="width:15%;">
                <col style="width:75%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.searchMonth' /></th> <!-- 조회월 -->
                    <td>
                        <input id="sYyMm"  class="form_datepicker" >
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
<!-- 조회 조건 종료 -->

    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>

    <div class="table_grid mt10">
        <div id="grid2" class="resizable_grid"></div>
    </div>
</section>
</div>

<!-- script -->
<script  type="text/javascript">
var toDay = "${toDay}";
var dlrCd  = "${dlrCd}";

$(document).ready(function () {

     //조회 년월
    $("#sYyMm").kendoExtMaskedDatePicker({
        value:toDay.substring(0, 8)
       ,start:"year"
       ,depth:"year"
       ,format:"yyyy-MM"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,change:function(e) {
           $("#grid").data('kendoExtGrid').dataSource.data([]);
           $("#grid2").data('kendoExtGrid').dataSource.data([]);
           $("#btnSearch").click();
       }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            if( $("#sYyMm").data('kendoExtMaskedDatePicker').value() == null ){
                //적용일을 모두 입력해 주세요
                //dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                return false;
            }
            $("#grid").data('kendoExtGrid').dataSource.read();
            $("#grid2").data('kendoExtGrid').dataSource.read();
        }
    });


    //버튼 - excel
    $("#btnExcel").kendoButton({
        click:function(e){
            if( $("#sYyMm").data('kendoExtMaskedDatePicker').value() == null ){
                //적용일을 모두 입력해 주세요
                dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                return false;
            }

            dms.ajax.excelExport({
                "beanName":"fundStatusService"
                ,"templateFile":"FundStatus_sal_Tpl.xlsx"
                ,"fileName":"status.xlsx"
                ,"sDlrCd":dlrCd
                ,"sYy":kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "yyyy")
                ,"sMm":kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "MM")
            });

        }
    });


    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0823-090101"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/trm/fundStatus/selectFundStatusSearch.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sYy"] = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "yyyy");
                        params["sMm"] = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "MM");

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"yyMmDd",
                    fields:{
                         dlrCd       :{type:"string", editable:false} //딜러코드
                        ,yy          :{type:"string"}                 //년도
                        ,mm          :{type:"string"}                 //월
                        ,yyMmDd      :{type:"string"}                 //일자

                        ,cashAmt     :{type:"number"}                 //현금
                        ,prt2Amt     :{type:"number"}                 //이방자금
                        ,prt3Amt     :{type:"number"}                 //삼방자금
                        ,prcChgAmt   :{type:"number"}                 //조정금
                        ,incnAmt     :{type:"number"}                 //인센티브

                        ,cashDpstAmt :{type:"number"}                 //입금합계 - 현금
                        ,prt2DpstAmt :{type:"number"}                 //입금합계 - 이방자금
                        ,prt3DpstAmt :{type:"number"}                 //입금합계 - 삼방자금
                        ,totDpstAmt  :{type:"number"}                 //입금합계 - 합계

                        ,wdrwCashAmt :{type:"number"}                 //출금합계 - 현금
                        ,wdrwPrt2Amt :{type:"number"}                 //출금합계 - 이방자금
                        ,wdrwPrt3Amt :{type:"number"}                 //출금합계 - 삼방자금
                        ,wdrwAmt     :{type:"number"}                 //출금합계 - 합계

                        ,cashBalAmt  :{type:"number"}                 //잔액 - 현금
                        ,prt2BalAmt  :{type:"number"}                 //잔액 - 이방자금
                        ,prt3BalAmt  :{type:"number"}                 //잔액 - 삼방자금
                        ,totBalAmt   :{type:"number"}                 //잔액 - 합계

                        ,bfPrcChgAmt   :{type:"number"}                 //이전달-조정금
                        ,bfIncnAmt     :{type:"number"}                 //이전달-인센티브

                        ,bfCashBalAmt  :{type:"number"}                 //이전달-잔액 - 현금
                        ,bfPrt2BalAmt  :{type:"number"}                 //이전달-잔액 - 이방자금
                        ,bfPrt3BalAmt  :{type:"number"}                 //이전달-잔액 - 삼방자금
                        ,bfTotBalAmt   :{type:"number"}                 //이전달-잔액 - 합계
                    }
                }
            }
        }
        ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:false               //Tooltip 적용, default:false
        ,height:115
        ,pageable:false
        ,editable  :false
        ,sortable  :false
        ,filterable:false
        ,selectable:"row"
        ,autoBind:true
        ,columns:[
             {field:"dlrCd", hidden:true}
            ,{field:"yy", hidden:true}
            ,{field:"mm", hidden:true}
            ,{title:"<spring:message code='sal.befMnthAmt' />", headerAttributes:{"class":"hasBob"}
            ,columns:[
                 {field:"bfCashBalAmt", title:"<spring:message code='sal.lbl.cash' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}        //현금
                ,{field:"bfPrt2BalAmt", title:"<spring:message code='sal.lbl.prt2Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}     //이방자금
                ,{field:"bfPrt3BalAmt", title:"<spring:message code='sal.lbl.prt3Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}     //삼방자금
                //,{field:"bfPrcChgAmt", title:"<spring:message code='sal.lbl.prcChgAmt' />", attributes:{"class":"ar"}, width:80, format:"{0:n2}"}      //조정금
                //,{field:"bfIncnAmt", title:"<spring:message code='sal.lbl.incnAmt' />", attributes:{"class":"ar"}, width:80, format:"{0:n2}"}        //인센티브
                ,{field:"bfTotBalAmt",  title:"<spring:message code='global.lbl.total' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //합계
             ]
            } //지난달
            ,{title:"<spring:message code='sal.lbl.dpstAmtTotMonth' />", headerAttributes:{"class":"hasBob"}
                ,columns:[
                     {field:"cashDpstAmt", title:"<spring:message code='sal.lbl.cash' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}       //현금
                    ,{field:"prt2DpstAmt", title:"<spring:message code='sal.lbl.prt2Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //이방자금
                    ,{field:"prt3DpstAmt", title:"<spring:message code='sal.lbl.prt3Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //삼방자금
                    ,{field:"prcChgAmt", title:"<spring:message code='sal.lbl.prcChgAmt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}      //조정금
                    ,{field:"incnAmt", title:"<spring:message code='sal.lbl.incnAmt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}        //인센티브
                    ,{field:"totDpstAmt",  title:"<spring:message code='global.lbl.total' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}   //합계
                 ]
             }      // 입금
            ,{title:"<spring:message code='sal.lbl.wdrwAmtTotMonth' />", headerAttributes:{"class":"hasBob"}
                ,columns:[
                     {field:"wdrwCashAmt", title:"<spring:message code='sal.lbl.cash' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}       //현금
                    ,{field:"wdrwPrt2Amt", title:"<spring:message code='sal.lbl.prt2Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //이방자금
                    ,{field:"wdrwPrt3Amt", title:"<spring:message code='sal.lbl.prt3Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //삼방자금
                    ,{field:"wdrwAmt", title:"<spring:message code='global.lbl.total' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}   //합계
                 ]
             }  //출금
            ,{title:"<spring:message code='sal.lbl.balAmt' />", headerAttributes:{"class":"hasBob"}
                ,columns:[
                     {field:"cashBalAmt", title:"<spring:message code='sal.lbl.cash' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}        //현금
                    ,{field:"prt2BalAmt", title:"<spring:message code='sal.lbl.prt2Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}     //이방자금
                    ,{field:"prt3BalAmt", title:"<spring:message code='sal.lbl.prt3Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}     //삼방자금
                    ,{field:"totBalAmt",  title:"<spring:message code='global.lbl.total' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //합계
                 ]
             } //당월잔여금(월)
        ]
    });


   //그리드 2번
   $("#grid2").kendoExtGrid({
       gridId:"G-SAL-0823-100102"
       ,dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/trm/fundStatus/selectFundStatusDaySearch.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation == "read") {

                       var params = {};
                       params["recordCountPerPage"] = options.pageSize;
                       params["pageIndex"] = options.page;
                       params["firstIndex"] = options.skip;
                       params["lastIndex"] = options.skip + options.take;
                       params["sort"] = options.sort;

                       params["sYy"] = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "yyyy");
                       params["sMm"] = kendo.toString($("#sYyMm").data("kendoExtMaskedDatePicker").value(), "MM");

                       return kendo.stringify(params);
                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"yyMmDd",
                   fields:{
                        dlrCd       :{type:"string", editable:false} //딜러코드
                       ,yy          :{type:"string"}                 //년도
                       ,mm          :{type:"string"}                 //월
                       ,dd          :{type:"string"}                 //일
                       ,yyMmDd      :{type:"string"}                 //일자

                       ,cashAmt     :{type:"number"}                 //현금
                       ,prt2Amt     :{type:"number"}                 //이방자금
                       ,prt3Amt     :{type:"number"}                 //삼방자금
                       ,prcChgAmt   :{type:"number"}                 //조정금
                       ,incnAmt     :{type:"number"}                 //인센티브

                       ,cashDpstAmt :{type:"number"}                 //입금합계 - 현금
                       ,prt2DpstAmt :{type:"number"}                 //입금합계 - 이방자금
                       ,prt3DpstAmt :{type:"number"}                 //입금합계 - 삼방자금
                       ,totDpstAmt  :{type:"number"}                 //입금합계 - 합계

                       ,wdrwCashAmt :{type:"number"}                 //출금합계 - 현금
                       ,wdrwPrt2Amt :{type:"number"}                 //출금합계 - 이방자금
                       ,wdrwPrt3Amt :{type:"number"}                 //출금합계 - 삼방자금
                       ,wdrwAmt     :{type:"number"}                 //출금합계 - 합계

                       ,cashBalAmt  :{type:"number"}                 //잔액 - 현금
                       ,prt2BalAmt  :{type:"number"}                 //잔액 - 이방자금
                       ,prt3BalAmt  :{type:"number"}                 //잔액 - 삼방자금
                       ,totBalAmt   :{type:"number"}                 //잔액 - 합계
                   }
               }
           }
       }
       ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
       ,enableTooltip:false               //Tooltip 적용, default:false
       ,height:465
       ,pageable:false
       ,editable  :false
       ,sortable  :false
       ,filterable:false
       ,selectable:"row"
       ,autoBind:true
       ,columns:[
            {field:"dlrCd", hidden:true}
           ,{field:"yy", hidden:true}
           ,{field:"mm", hidden:true}
           ,{field:"dd", title:"<spring:message code='global.lbl.day' />", width:35,  attributes:{"class":"ac"}}    // 날짜
           ,{title:"<spring:message code='sal.lbl.dpstAmtTotDay' />", headerAttributes:{"class":"hasBob"}
           ,columns:[
                    {field:"cashDpstAmt", title:"<spring:message code='sal.lbl.cash' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}       //현금
                   ,{field:"prt2DpstAmt", title:"<spring:message code='sal.lbl.prt2Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //이방자금
                   ,{field:"prt3DpstAmt", title:"<spring:message code='sal.lbl.prt3Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //삼방자금
                   ,{field:"prcChgAmt", title:"<spring:message code='sal.lbl.prcChgAmt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //조정금
                   ,{field:"incnAmt", title:"<spring:message code='sal.lbl.incnAmt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}        //인센티브
                   ,{field:"totDpstAmt",  title:"<spring:message code='global.lbl.total' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}   //합계
                ]
            }      // 입금합계(일)
           ,{title:"<spring:message code='sal.lbl.wdrwAmtTotDay' />", headerAttributes:{"class":"hasBob"}
               ,columns:[
                    {field:"wdrwCashAmt", title:"<spring:message code='sal.lbl.cash' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}       //현금
                   ,{field:"wdrwPrt2Amt", title:"<spring:message code='sal.lbl.prt2Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //이방자금
                   ,{field:"wdrwPrt3Amt", title:"<spring:message code='sal.lbl.prt3Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //삼방자금
                   ,{field:"wdrwAmt", title:"<spring:message code='global.lbl.total' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}       //합계
                ]
            }  //출금합계(일)
           ,{title:"<spring:message code='sal.lbl.balAmtDay' />", headerAttributes:{"class":"hasBob"}
               ,columns:[
                    {field:"cashBalAmt", title:"<spring:message code='sal.lbl.cash' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}        //현금
                   ,{field:"prt2BalAmt", title:"<spring:message code='sal.lbl.prt2Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}     //이방자금
                   ,{field:"prt3BalAmt", title:"<spring:message code='sal.lbl.prt3Amt' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}     //삼방자금
                   ,{field:"totBalAmt",  title:"<spring:message code='global.lbl.total' />", attributes:{"class":"ar"}, width:120, format:"{0:n2}"}    //합계
                ]
            }  //당일잔여금(일)
       ]
   });

   //버튼 - 엑셀다운로드
   $("#btnExcelExport").kendoButton({
       click:function(e) {

           var sYyMm = $("#sYyMm").val().replace(/-/gi, "");
           var sYy = sYyMm.substring(0,4);
           var sMm = sYyMm.substring(4);

           dms.ajax.excelExport({
               "beanName":"fundStatusService"
               ,"templateFile":"FundStatus_sal_Tpl.xlsx"
               ,"fileName":"FundStatusDownload.xlsx"
               ,"sYy":sYy
               ,"sMm":sMm
           });

       }
   });
});

</script> 
 