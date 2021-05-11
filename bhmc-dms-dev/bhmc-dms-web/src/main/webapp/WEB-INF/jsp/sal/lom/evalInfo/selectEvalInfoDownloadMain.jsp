<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 평가정보 다운로드 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.lbl.evalInfoDownload" /></h1><!-- 평가정보 다운로드 -->
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button class="btn_m" id="btnExcel"><spring:message code="global.btn.excelDownload" /></button> <!-- 엑셀다운로드 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col style="width:13%;">
                <col style="width:7%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:14%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th> <!-- VIN -->
                    <td>
                        <div class="form_float">
                            <div class="form_left" style="width:65%">
                                <input id="sVinNo1" type="text" value="" maxlength="11" class="form_input">
                            </div>
                            <div class="form_right" style="width:35%">
                                <input id="sVinNo2" type="text" value="" maxlength="6" class="form_input">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th> <!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" type="text" value="" maxlength="5" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.trsfNo' /></th> <!-- 운송번호 -->
                    <td>
                        <input id="sTrsfNo" type="text" value="" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.realDlDts' /></th> <!-- 발차일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sPltGiDtS" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sPltGiDtE" class="form_datepicker">
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
</section>


<!-- script -->
<script>

    //현재일자
    var toDay = "${toDay}";
    // 해당월 1일
    //var oneDay = toDay.substring(0, 8) + "01";
    var oneDay = "${oneDay}";

    /************* 차량상태(입고확정상태) SELECT BOX  *******************/
    var carStatCdList = [];
    <c:forEach var="obj" items="${carStatCdInfo}">
    carStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var carStatCdArr = dms.data.arrayToMap(carStatCdList, function(obj){return obj.cmmCd});

    /************* 물류 서비스 평가 SELECT BOX  *******************/
    var dstbSerEvalList = [];
    <c:forEach var="obj" items="${dstbSerEvalInfo}">
    dstbSerEvalList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var dstbSerEvalArr = dms.data.arrayToMap(dstbSerEvalList, function(obj){return obj.cmmCd});

    /************* 기사만족도 SELECT BOX  *******************/
     var driverStsfList = [];
     <c:forEach var="obj" items="${driverStsfInfo}">
     driverStsfList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var driverStsfArr = dms.data.arrayToMap(driverStsfList, function(obj){return obj.cmmCd});

     /************* 차량 교부시간 SELECT BOX  *******************/
     var carIssueHmList = [];
     <c:forEach var="obj" items="${carIssueHmInfo}">
     carIssueHmList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var carIssueHmArr = dms.data.arrayToMap(carIssueHmList, function(obj){return obj.cmmCd});

     /************* 차량 교부질량 SELECT BOX  *******************/
     var carIssueMassList = [];
     <c:forEach var="obj" items="${carIssueMassInfo}">
     carIssueMassList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var carIssueMassArr = dms.data.arrayToMap(carIssueMassList, function(obj){return obj.cmmCd});
     /************* 주문유형 SELECT BOX  *******************/


    $(document).ready(function() {

        // 발차일자 시작일
        $("#sPltGiDtS").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
             ,value:oneDay
        });

        // 발차일자 종료일
        $("#sPltGiDtE").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:toDay
        });

        // 시작일은 종료일보다 클수가 없다.
        //$("#sSrchFrDt").on('change', fnChkSearchDate);
        //$("#sSrchToDt").on('change', fnChkSearchDate);


        //버튼 - 조회
         $("#btnSearch").kendoButton({
            click:function(e){
                 if( !($("#sPltGiDtS").val() == '' && $("#sPltGiDtE").val() == '') ){
                    if($("#sPltGiDtS").val() == '' || $("#sPltGiDtE").val() == ''){
                        //발차일자를 입력해 주세요
                        dms.notification.warning("<spring:message code='global.lbl.registration' var='reg' /><spring:message code='global.info.cnfrmMsg' arguments='${reg},' />");
                        return false;
                    }
                }

                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

         //버튼 - 엑셀다운로드
         $("#btnExcel").kendoButton({
             click:function(e) {
/*
                 dms.ajax.excelExport({
                     "beanName":"groupSalesReviewService"
                     ,"templateFile":"GroupSalesReview_Tpl.xlsx"
                     ,"fileName":"groupSalesReview.xlsx"
                     ,"sApplyNo":$("#sApplyNo").val()
                     ,"sDistCd":$("#sDistCd").data("kendoExtDropDownList").value()
                     ,"sDlrCd":$("#sDlrCd").val()
                     ,"sCustNm":$("#sCustNm").val()
                     ,"sApproveCd":$("#sApproveCd").data("kendoExtDropDownList").value()
                     ,"sEvalRsltYn":$("#sEvalRsltYn").data("kendoExtDropDownList").value()
                     ,"sAtcDstinCd":$("#sAtcDstinCd").data("kendoExtDropDownList").value()
                     ,"sApplyDtS":$("#sApplyDtS").data("kendoExtMaskedDatePicker").value()
                     ,"sApplyDtE":$("#sApplyDtE").data("kendoExtMaskedDatePicker").value()
                     ,"sEvalDtS":$("#sEvalDtS").data("kendoExtMaskedDatePicker").value()
                     ,"sEvalDtE":$("#sEvalDtE").data("kendoExtMaskedDatePicker").value()
                 });
*/
             }
         });

        //그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/sal/lom/evalInfoDownload/selectEvalInfoDownload.do'/>"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            /*Paging Param Start~!*/
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;
                            /*Paging Param End~!*/

                            /*Screen Param Start~!*/
                            params["sDlrCd"] = $("#sDlrCd").val();          //딜러코드
                            params["sVinNo"] = $("#sVinNo1").val() + $("#sVinNo2").val();        //VIN_NO1
                            params["sTpCmpCd"] = $("#sTpCmpCd").val();      //물류회사코드
                            params["sPltGiDtS"] = $("#sPltGiDtS").data("kendoExtMaskedDatePicker").value();   //발차일자FROM
                            params["sPltGiDtE"] = $("#sPltGiDtE").data("kendoExtMaskedDatePicker").value();   //발차일자TO
                            /*Screen Param End~!*/

                            return kendo.stringify(params);
                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,requestEnd:function(e) {
                    if (e.type == "read") {
                        //조회가 완료 되였습니다.
                        dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                    }
                }
                ,schema:{
                    model:{
                        id:"vinNo"
                        ,fields:{
                            dlrCd           :{type:"string"}
                            ,dstbCmpNm      :{type:"string"}
                            ,trsfCarNo      :{type:"string"}
                            ,vinNo          :{type:"string"}
                            ,carStatCd      :{type:"string"}
                            ,grDt           :{type:"date"}
                            ,pltGiDt        :{type:"date"}
                            ,dlrEvalDt      :{type:"date"}
                            ,dstbSerEvalVal :{type:"string"}
                            ,driverStsfVal  :{type:"string"}
                            ,carIssueHmVal  :{type:"string"}
                            ,carIssueMassVal:{type:"string"}
                            ,otherCont      :{type:"string"}
                        }
                    }
                }
            }
            ,height:450
            ,editable:false
            ,autoBind:false
            ,columns:[
                       {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />"
                           , width:70
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 딜러코드
                       ,{_field:"_field", title:"<spring:message code='sal.lbl.trsfNo' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 운송번호
                       ,{field:"dstbCmpNm", title:"<spring:message code='global.lbl.logisticsCmpn' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 물류회사
                       ,{field:"trsfCarNo", title:"<spring:message code='global.lbl.tpCarNo' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // TP차번호
                       ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // Vin No
                       ,{field:"carStatCd", title:"<spring:message code='global.lbl.vinSts' />"
                           , width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,template:"#if(carStatCd != null){# #= carStatCdArr[carStatCd].cmmCdNm # #}#"
                       }  // 차량상태
                       ,{field:"grDt", title:"<spring:message code='sal.lbl.grDt' />"
                           ,width:60
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 입고일자
                       ,{field:"pltGiDt", title:"<spring:message code='global.lbl.realDlDts' />"
                           ,width:60
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 발차일자
                       ,{field:"dlrEvalDt", title:"<spring:message code='global.lbl.evalScheDt' />"
                           ,width:60
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 평가일자
                       ,{field:"dstbSerEvalVal", title:"<spring:message code='sal.lbl.dstbSerEval' />"
                           ,width:55
                           ,template:"#=dstbSerEvalArr[dstbSerEvalVal].cmmCdNm#"
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 물류 서비스 평가
                       ,{field:"driverStsfVal", title:"<spring:message code='sal.lbl.driverStsf' />"
                           ,width:55
                           ,template:"#if(driverStsfVal != null){driverStsfArr[driverStsfVal].cmmCdNm}else{''}#"
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 기사 만족도
                       ,{field:"carIssueHmVal", title:"<spring:message code='sal.lbl.carIssueHm' />"
                           ,width:55
                           ,template:"#=carIssueHmArr[carIssueHmVal].cmmCdNm#"
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 차량 교부시간
                       ,{field:"carIssueMassVal", title:"<spring:message code='sal.lbl.carIssueMass' />"
                           ,width:55
                           ,template:"#=carIssueMassArr[carIssueMassVal].cmmCdNm#"
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 차량 교부질량
                       ,{field:"otherCont", title:"<spring:message code='sal.lbl.otherCont' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 기타신고 및 의견


                   ]
        });



    });
</script>