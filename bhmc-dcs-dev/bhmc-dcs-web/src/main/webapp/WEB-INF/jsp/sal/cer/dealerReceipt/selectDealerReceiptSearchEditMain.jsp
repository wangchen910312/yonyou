<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 딜러 영수증 등록 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.dealerReceiptSearchEdit" /></h1><!-- 딜러 영수증 조회 및 수정 -->
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col style="width:20%;">
                <col style="width:7%;">
                <col style="width:12%;">
                <col style="width:8%;">
                <col style="width:13%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.applNumber' /></th> <!-- 신청번호 -->
                    <td>
                        <input id="sReqNo" type="text" value="" maxlength="12" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.vinNo' /></th> <!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" value="" maxlength="17" class="form_input">
                    </td>
                    <td></td><td></td><td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.uploadDt' /></th> <!-- 업로드 일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sUploadDtS" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sUploadDtE" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.updtYn' /></th> <!-- 변경여부 -->
                    <td>
                        <input id="sUpdtYn" type="text"   class="form_combo">
                    </td>
                    <td></td><td></td><td></td>
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


    $(document).ready(function() {

        //변경여부
        $("#sUpdtYn").kendoExtDropDownList({
            dataTextField :"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:[{cmmCdNm:"Y", cmmCd:"Y"}, {cmmCdNm:"N", cmmCd:"N"}]
           ,optionLabel:" "   // 전체
        });


        // 업로드 시작일
        $("#sUploadDtS").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
             ,value:oneDay
        });

        // 업로드 종료일
        $("#sUploadDtE").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:toDay
        });


        //버튼 - 조회
         $("#btnSearch").kendoButton({
            click:function(e){
                 if( !($("#sUploadDtS").val() == '' && $("#sUploadDtE").val() == '') ){
                    if($("#sUploadDtS").val() == '' || $("#sUploadDtE").val() == ''){
                        //업로드 일자를 입력해 주세요
                        dms.notification.warning("<spring:message code='sal.lbl.uploadDt' var='uploadDt' /><spring:message code='global.info.emptyCheckParam' arguments='${uploadDt},' />");
                        $("#sUploadDtS").focus();
                        return false;
                    }
                }

                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

         //버튼 - 저장
         $("#btnSave").kendoButton({
             click:function(e) {
                 if($("#ddlnDt").val() == '' ){
                     //마감 일자를 입력해 주세요
                     dms.notification.warning("<spring:message code='global.lbl.ddlnDt' var='ddlnDt' /><spring:message code='global.info.emptyCheckParam' arguments='${ddlnDt},' />");
                     return;
                 }

                 var arrSave = [];

                 var grid = $("#grid").data("kendoExtGrid");
                 var rows = grid.select();


                 rows.each(function(index, row) {
                     var dataItem = grid.dataItem(row);

                     arrSave.push(dataItem);
                 });

                 if( rows.length < 1){
                     dms.notification.warning("<spring:message code='global.lbl.save' var='save' /><spring:message code='global.info.notExistData' arguments='${save},' />");
                     return;
                 }
                 if( !confirm("<spring:message code='global.lbl.save' var='save' /><spring:message code='global.info.cnfrmMsg' arguments='${save},' />")){ // 저장 하시겠습니까?
                     return;
                 }

                 var saveData = { "updateList":arrSave };

                 $.ajax({
                     url:"<c:url value='/sal/cer/dealerReceiptSearchEdit/updateDealerReceiptSearchEdit.do' />",
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

                         //저장이 완료되었습니다.
                         dms.notification.success("<spring:message code='global.lbl.save' var='save' /><spring:message code='global.info.successMsg' arguments='${save},' />");

                     }
                 });
             }
         });

        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-SAL-0721-113304"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/sal/cer/dealerReceiptSearchEdit/selectDealerReceiptSearchEdit.do'/>"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            /*Paging Param Start~!*/
                            //params["recordCountPerPage"] = options.pageSize;
                            //params["pageIndex"] = options.page;
                            //params["firstIndex"] = options.skip;
                            //params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;
                            /*Paging Param End~!*/

                            /*Screen Param Start~!*/
                            params["sReqNo"] = $("#sVinNo").val();          //VIN_NO
                            params["sVinNo"] = $("#sVinNo").val();          //VIN_NO
                            params["sUploadDtS"] = $("#sUploadDtS").data("kendoExtMaskedDatePicker").value();   //업로드일자FROM
                            params["sUploadDtE"] = $("#sUploadDtE").data("kendoExtMaskedDatePicker").value();   //업로드일자TO
                            params["sUpdtYn"] = $("#sUpdtYn").data('kendoExtDropDownList').value()  //변경여부

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
                        id:"dlrCd"
                        ,fields:{
                            dstinCd     :{type:"string"}
                            ,yy         :{type:"string"}
                            ,mm         :{type:"string"}
                            ,assgnDt    :{type:"date", format:"{0:<dms:configValue code='dateFormat' />}"}
                            ,approveDt  :{type:"date", format:"{0:<dms:configValue code='dateFormat' />}"}
                            ,dlrCd      :{type:"string", editable:false}
                            ,ordTp      :{type:"string"}
                            ,modelCd    :{type:"string"}
                            ,modelNm    :{type:"string"}
                            ,ordQty     :{type:"number"}
                            ,carlineCd  :{type:"string"}
                            ,guideAmt   :{type:"number"}
                            ,dcRate     :{type:"number"}
                            ,invcAmt    :{type:"number"}
                            ,vinNo      :{type:"string", editable:false}
                            ,extColorCd :{type:"string"}
                            ,intColorCd :{type:"string"}
                            ,officeNm   :{type:"string"}
                            ,reqNo      :{type:"string", editable:false}
                            ,rsltCont   :{type:"string"}
                            ,uploadDt   :{type:"date", format:"{0:<dms:configValue code='dateFormat' />}", editable:false}
                            ,ddlnDt     :{type:"date", format:"{0:<dms:configValue code='dateFormat' />}"}
                            ,updtYn     :{type:"string", editable:false}
                            ,custNm     :{type:"string"}
                            ,remark     :{type:"string"}
                            ,stockYn    :{type:"string"}
                            ,stockVinNo :{type:"string"}
                            ,incvDt     :{type:"date", format:"{0:<dms:configValue code='dateFormat' />}"}
                            ,incvYn     :{type:"string"}
                            ,drivingYn  :{type:"string"}
                            ,docYn      :{type:"string"}
                            ,incbYn     :{type:"string"}
                            ,remark2    :{type:"string"}
                        }
                    }
                }
            }
            ,height:450
            ,pageable:false
            ,editable:false
            ,autoBind:false
            ,selectable:"row"
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,columns:[
                       {field:"dstinCd", title:"<spring:message code='ser.lbl.gubun' />"
                           , width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           //,template:"#if(dstinCd != null){# #= dstinCdArr[dstinCd].cmmCdNm # #}#"
                       }  // 구분
                       ,{field:"yy", title:"<spring:message code='global.lbl.year' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 년도
                       ,{field:"mm", title:"<spring:message code='global.lbl.monday' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 월
                       ,{field:"assgnDt", title:"<spring:message code='sal.lbl.assgnDt' />"
                           ,width:60
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 지정일자
                       ,{field:"approveDt", title:"<spring:message code='global.lbl.approveDt' />"
                           ,width:60
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 승인일자
                       ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />"
                           , width:70
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 딜러코드
                       ,{field:"ordTp", title:"<spring:message code='global.lbl.ordTp' />"
                           , width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           //,template:"#if(ordTp != null){# #= ordTpArr[ordTp].cmmCdNm # #}#"
                       }  // 오더유형
                       ,{field:"modelCd", title:"<spring:message code='global.lbl.model' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 모델
                       ,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 모델명
                       ,{field:"ordQty", title:"<spring:message code='global.lbl.ordpCount' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:right"}
                       }  // 오더수량
                       ,{field:"carlineCd", title:"<spring:message code='global.lbl.carLine' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 차종코드
                       ,{field:"guideAmt", title:"<spring:message code='sal.lbl.guideAmt' />"
                           , width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:right"}
                       }  // 지도가격
                       ,{field:"dcRate", title:"<spring:message code='global.lbl.dcRate' />"
                           , width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:right"}
                       }  // 할인률
                       ,{field:"invcAmt", title:"<spring:message code='sal.lbl.invcAmt' />"
                           , width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:right"}
                       }  // 인보이스 금액
                       ,{field:"vinNo", title:"<spring:message code='global.lbl.vinNum' />"
                           ,width:100
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // VIN NO
                       ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColor' />"
                           ,width:60
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 외장색
                       ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColor' />"
                           ,width:60
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 내장색
                       ,{field:"officeNm", title:"<spring:message code='crm.lbl.officeNm' />"
                           ,width:55
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 사무소
                       ,{field:"reqNo", title:"<spring:message code='global.lbl.applNumber' />"
                           ,width:100
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 신청번호
                       ,{field:"rsltCont", title:"<spring:message code='sal.lbl.rsltCont' />"
                           ,width:100
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 자료 감사결과
                       ,{field:"uploadDt", title:"<spring:message code='sal.lbl.uploadDt' />"
                           ,width:100
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 업로드일자
                       ,{field:"ddlnDt", title:"<spring:message code='global.lbl.ddlnDt' />"
                           ,width:100
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 마감일자
                       ,{field:"updtYn", title:"<spring:message code='sal.lbl.updtYn' />"
                           ,width:55
                           ,template:"#=updtYnArr[updtYn].cmmCdNm#"
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 수정여부
                       ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />"
                           ,width:100
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 고객명
                       ,{field:"remark", title:"<spring:message code='global.lbl.remark' />"
                           ,width:100
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 비고
                       ,{field:"stockYn", title:"<spring:message code='sal.lbl.stockYn' />"
                           ,width:100
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 재고여부
                       ,{field:"stockVinNo", title:"<spring:message code='sal.lbl.stockVinNo' />"
                           ,width:100
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 재고 VIN
                       ,{field:"incvDt", title:"<spring:message code='sal.lbl.invoiceDt' />"
                           ,width:100
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 영수증 일자
                       ,{field:"incvYn", title:"<spring:message code='sal.lbl.incvYn' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 인보이스 여부
                       ,{field:"drivingYn", title:"<spring:message code='sal.lbl.drivingYn' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 운전면허증 여부
                       ,{field:"docYn", title:"<spring:message code='sal.lbl.docYn' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 문서 여부
                       ,{field:"incbYn", title:"<spring:message code='sal.lbl.incbYn' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                           ,attributes:{ "style":"text-align:center"}
                       }  // 재직 여부
                       ,{field:"remark2", title:"<spring:message code='global.lbl.remark' />"
                           ,width:80
                           ,headerAttributes:{style:"text-align:center;"}
                       }  // 비고
                   ]
        });



    });
</script>