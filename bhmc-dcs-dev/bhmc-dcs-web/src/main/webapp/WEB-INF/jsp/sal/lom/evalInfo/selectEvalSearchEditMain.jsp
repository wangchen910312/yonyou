<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 평가정보 조회 및 수정 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.lbl.evalSrchUpd" /></h1><!-- 평가정보 조회 및 수정 -->
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12381" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12380" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
        </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.grDts' /></span></th> <!-- 입고일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sGrDtS" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sGrDtE" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.vinSts' /></span></th> <!-- 차량상태 -->
                    <td>
                        <input id="sCarStatCd" type="text" value="" maxlength="5" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' />　</th><!-- 딜러코드 -->
                    <td>
                        <input type="text" class="form_input" id="sDlrCd" maxlength="5" style="width:50%;">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th> <!-- VIN -->
                    <td>
                        <input type="text" class="form_input" id="sVinNo" maxlength="17">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->
    <div class="header_area">
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12382" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s" type="button" id="btnExcelExport"><spring:message code="global.btn.excelExport" /></button><!-- 엑셀업로드 -->
            </dms:access>
        </div>
   </div>
    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

</div>
<!-- script -->
<script>

    //현재일자
    var toDay = "${toDay}";
    // 해당월 1일
    //var oneDay = toDay.substring(0, 8) + "01";
    var oneDay = "${oneDay}";

    /************* 차량상태(입고확정상태) SELECT BOX  *******************/
    var carStatSearchList = [];
    var carStatCdList = [];
    <c:forEach var="obj" items="${carStatCdInfo}">
      <c:if test="${obj.cmmCd eq '60' or obj.cmmCd eq '70'}">
         carStatSearchList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      </c:if>
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

    save = function(cnfrmInfo) {
         var saveData;
         var saveFlag = true;

         var arrSave = [];

         var grid = $("#grid").data("kendoExtGrid");
         var rows = grid.select();


         rows.each(function(index, row) {
             var dataItem = grid.dataItem(row);

             arrSave.push(dataItem);

         });


         if( saveFlag ){


/*              if( !confirm("<spring:message code='global.lbl.update' var='update' /><spring:message code='global.info.cnfrmMsg' arguments='${update},' />")){ // 수정 하시겠습니까?
                 return;
             } */

             dms.window.confirm({
                 message:"<spring:message code='cmm.info.updtYn' />"
                 ,title :"<spring:message code='global.btn.fix' />"
                 ,width:300
                 ,callback:function(result){
                     if(result){
                         var saveData = { "updateList":arrSave
                                         ,"popupVO":cnfrmInfo};
                         $.ajax({
                             url:"<c:url value='/sal/lom/evalSearchEdit/updateEvalSearchEdit.do' />",
                             data:JSON.stringify(saveData),
                             type:'POST',
                             dataType:'json',
                             contentType:'application/json',
                             error:function(jqXHR,status,error){
                                 dms.notification.error(jqXHR.responseJSON.errors);
                             },
                             success:function(jqXHR, textStatus){
                                 grid.dataSource._destroyed = [];
                                 grid.dataSource.page(1);

                                 //정상적으로 반영 되었습니다.
                                 dms.notification.success("<spring:message code='global.info.success'/>");
                             }
                         });
                     }
                 }
             });
         }
     }

  // 집단판매 차량적용 팝업
     var popupWindow;
     function selectConfirmWearingPopupWindow(strVinNo){

         popupWindow = dms.window.popup({
             windowId:"confirmWearingPopup"
             ,title:""   //
             ,width :500
             ,height:215
             ,resizable:false
             ,content:{
                 url:"<c:url value='/sal/lom/evalSearchEdit/selectEvalSearchEditPopupMain.do'/>"
                 ,data:{
                     "type":"custom1"
                     ,"autoBind":false
                     ,"strVinNo":strVinNo                  //
                     ,"callbackFunc":function(data){
                         if (data.msg == "save"){
                             save(data.result);
                         }

                     }
                 }
             }

         });
     }

     function fnChkVehiclePopup(){
         var grid = $('#grid').data('kendoExtGrid');
         var rows = grid.select();
         var item = grid.dataItem(rows[0]);

         if(rows.length >= 0){
             selectConfirmWearingPopupWindow(item.vinNo);
         }else{
             dms.notification.info("<spring:message code='global.lbl.update' var='update' /><spring:message code='global.info.notExistData' arguments='${update},' />"); // 수정할 데이터가 존재하지 않습니다.
             return false;
         }
     }

    $(document).ready(function() {

        $("#sDlrCd").bind("keyup", function() {
            $(this).val($(this).val().toUpperCase());
        });

        $("#sCarStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:carStatSearchList
           ,index:0            // 소매 기본
           //,optionLabel:" "  // 선택
        });

        // 발차일자 시작일
        $("#sGrDtS").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
             ,value:oneDay
        });

        // 발차일자 종료일
        $("#sGrDtE").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:toDay
        });

        // 시작일은 종료일보다 클수가 없다.
        //$("#sSrchFrDt").on('change', fnChkSearchDate);
        //$("#sSrchToDt").on('change', fnChkSearchDate);



        /*********************************  버튼  **************************/
        //버튼 - 엑셀저장
        $("#btnExcelExport").kendoButton({
            click:function(e) {

                dms.ajax.excelExport({
                    "beanName":"evalSearchEditService"
                    ,"templateFile":"EvalSearchEdit_Tpl.xlsx"
                    ,"fileName":"evalSearchEdit.xlsx"
                    ,"sVinNo":$("#sVinNo").val()
                    ,"sCarStatCd":$("#sCarStatCd").val()
                    ,"sGrDtS":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sGrDtS").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                    ,"sGrDtE":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sGrDtE").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                });

            }
        });



        //버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                 if( !($("#sGrDtS").val() == '' && $("#sGrDtE").val() == '') ){
                    if($("#sGrDtS").val() == '' || $("#sGrDtE").val() == ''){
                        //발차일자를 입력해 주세요
                        dms.notification.warning("<spring:message code='global.lbl.registration' var='reg' /><spring:message code='global.info.cnfrmMsg' arguments='${reg},' />");
                        return false;
                    }
                }

                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //버튼 - 입고확정
        $("#btnViewDetail").kendoButton({
             click:function(e) {
                 fnChkVehiclePopup();
             }
        });


        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-SAL-0721-114101"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/sal/lom/evalSearchEdit/selectEvalSearchEdit.do'/>"
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
                            params["sVinNo"] = $("#sVinNo").val();        //VIN_NO1
                            params["sCarStatCd"] = $("#sCarStatCd").data("kendoExtDropDownList").value();      //차량상태
                            params["sGrDtS"] = $("#sGrDtS").data("kendoExtMaskedDatePicker").value();   //발차일자FROM
                            params["sGrDtE"] = $("#sGrDtE").data("kendoExtMaskedDatePicker").value();   //발차일자TO
                            params["sDlrCd"] = $("#sDlrCd").val();      //딜러코드
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
                        //dms.notification.info("<spring:message code='global.info.searchSuccess' />");
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
                            ,preAlrtNtceCont:{type:"string"}
                        }
                    }
                }
            }
            ,change:function(e) {
                /*
                if(e.sender.dataItem(e.sender.select()) != null){

                    var rows = this.select()
                      , isEnable = true;

                    $.each(rows, function(idx, row){
                        var dataItem = e.sender.dataItem(row);
                        if(dms.string.strNvl(dataItem.carStatCd) === "70"){
                            isEnable = false;
                        }
                    });

                    $("#btnViewDetail").data("kendoButton").enable(isEnable);
                }
                */
            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,editable:false
            ,autoBind:true
            ,filterable:false                 // 필터링 기능 사용안함
            ,sortable:false
            ,selectable:"row"
            ,pageable :{
                refresh :true
                ,pageSize :50
                ,pageSizes :[ "50", "100", "150", "200"]
            }
            ,columns:[
                       {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />"
                           , width:60
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 딜러코드
                       ,{field:"dstbCmpNm", title:"<spring:message code='global.lbl.logisticsCmpn' />"
                           ,width:60
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 물류회사
                       ,{field:"trsfCarNo", title:"<spring:message code='global.lbl.tpCarNo' />"
                           ,width:60
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // TP차번호
                       ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNo' />"
                           ,width:100
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // Vin No
                       ,{field:"carStatCd", title:"<spring:message code='global.lbl.vinSts' />"
                           , width:60
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
                           ,attributes:{ "class":"ac"}
                           //,template:"#if(dstbSerEvalArr[dstbSerEvalVal] != null){# #= dstbSerEvalArr[dstbSerEvalVal].cmmCdNm# #}#"
                           //,headerAttributes:{style:"text-align:center;"}
                       }  // 물류 서비스 평가
                       ,{field:"driverStsfVal", title:"<spring:message code='sal.lbl.driverStsf' />"
                           ,width:55
                           ,attributes:{ "class":"ac"}
                           //,template:"#if(driverStsfArr[driverStsfVal] != null){# #= driverStsfArr[driverStsfVal].cmmCdNm# #}#"
                           //,headerAttributes:{style:"text-align:center;"}
                       }  // 기사 만족도
                       ,{field:"carIssueHmVal", title:"<spring:message code='sal.lbl.carIssueHm' />"
                           ,width:55
                           ,template:"#if(carIssueHmArr[carIssueHmVal] != null){# #= carIssueHmArr[carIssueHmVal].cmmCdNm# #}#"
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 차량 교부시간
                       ,{field:"carIssueMassVal", title:"<spring:message code='sal.lbl.carIssueMass' />"
                           ,width:55
                           ,template:"#if(carIssueMassArr[carIssueMassVal] != null){# #= carIssueMassArr[carIssueMassVal].cmmCdNm# #}#"
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 차량 교부질량
                       ,{field:"otherCont", title:"<spring:message code='sal.lbl.otherCont' />"
                           ,width:120
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 기타신고 및 의견
                       ,{field:"preAlrtNtceCont", title:"<spring:message code='sal.lbl.preAlrtNtceCont' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "class":"td_total"}
                       }  // 조기경보통지내용


                   ]
        });

        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            fnChkVehiclePopup();
        });



    });
</script>