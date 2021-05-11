<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 딜러간차량교환관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <!-- [* 테스트시:admin 계정으로 DMS로직 처리후 admin2계정으로 DCS로직 처리 가능.] -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.lbl.dlrTodlrExchMgmt" /></h1><!-- 딜러간차량교환관리 -->
        <div class="btn_right">
            <button class="btn_m" id="btnViewDetail" ><spring:message code='global.btn.update' /><!-- 수정 --></button>
            <button class="btn_m" id="btnConfirm"><spring:message code="sal.btn.evalConfirm" /></button><!-- 심사확정 -->
            <button class="btn_m" id="btnRequest"><spring:message code="sal.btn.evalRequest" /></button><!-- 심사신청 -->
            <button class="btn_m btn_new" id="btnReset"><spring:message code="global.btn.new" /></button><!-- 신규 -->
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button class="btn_m btn_delete" id="btnDelete"><spring:message code="global.btn.del" /></button><!-- 삭제 -->
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
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:40%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.saleDlrDist' /></th><!-- 심사지역 -->
                    <td>
                        <input id="sSaleDlrDistCd" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th><!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.regDt' /></th><!-- 등록일 -->
                    <td>
                        <input id="sStartReqDt" data-type="maskDate" class="form_datepicker" style="width:40%">
                        ~
                        <input id="sEndReqDt" data-type="maskDate" class="form_datepicker" style="width:40%">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.statNm' /></th><!-- 상태 -->
                    <td>
                        <input id="sReqStatCd" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.evalRslt' /></th><!-- 심사결과 -->
                    <td>
                        <input id="sEvalRsltYn" type="text" class="form_comboBox" style="width:40%;">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area"></div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->


<section id="vehicleDlrExcWindow" class="pop_wrap">
    <!-- 교환정보 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.lbl.exchangeInfo' /></h2><!-- 교환정보 -->
        <div class="btn_right">
            <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.saleDlrDist" /></th><!-- 심사지역 -->
                    <td >
                        <input id="saleDlrDistCd" name="saleDlrDistCd" type="text"  class="form_input form_disabled" disabled >
                        <input id="exchNo" type="hidden" >
                        <input id="reqStatCd" type="hidden" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.dealer" /></th><!-- 딜러 -->
                    <td >
                        <input id="dlrNm" name="dlrNm" type="text"  class="form_input form_disabled" disabled >
                        <input id="dlrCd" name="dlrCd" type="hidden"  >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.exchangeDealer" /></th><!-- 교환딜러 -->
                    <td >
                        <input id="obtDlrCd" name="obtDlrCd" type="text"  class="form_comboBox" >
                        <input id="obtDlrNm" name=""obtDlrNm"" type="hidden" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.requestUsr" /></th><!-- 신청자 -->
                    <td>
                        <input id="reqUsrNm" name="reqUsrNm" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.telNumer" /></th><!-- 연락처 -->
                    <td>
                        <input id="telNo" class="form_input"  />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.regDt" /></th><!-- 등록일 -->
                    <td>
                        <input id="reqDt" data-type="maskDate" class="form_datepicker form_disabled" disabled >
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- //교환정보 -->



    <!-- 교환차량정보 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.lbl.exchangeCarInfo' /></h2><!-- 교환차량정보 -->
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="carlineCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                    <td>
                        <input id="modelCd" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.ocn" /></th>   <!-- OCN -->
                    <td>
                        <input id="ocnCd" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.extColor' /></th><!-- 외장색 -->
                    <td>
                        <input id="extColorCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.intColor' /></th><!-- 내장색 -->
                    <td>
                        <input id="intColorCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row">
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN NO -->
                    <td>
                        <input id="vinNo" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.enginNo' /></th><!-- 엔진번호 -->
                    <td>
                        <input id="enginSerialNo" type="text" class="form_input">
                    </td>
                    <th scope="row">
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- //신청차량정보 -->



    <!-- 심사정보 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code='sal.lbl.evalInfo' /></h2><!-- 심사정보 -->
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.evalRslt' /></th><!-- 심사결과 -->
                    <td>
                        <input id="evalRsltYn" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.screeningPrsnnl' /></th><!-- 심사담당자 -->
                    <td>
                        <input id="pevalNm" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.telNumber' /></th><!-- 연락처 -->
                    <td>
                        <input id="telNo1" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.evalDt" /></th>   <!-- 심사일자 -->
                    <td>
                        <input id="evalDt" type="text" class="form_datepicker">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.evalRemark' /></th><!-- 심사평가 -->
                    <td colspan="5">
                        <input id="remark" type="text" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- //신청정보 -->
</section>

</section>
</div>



<!-- script -->
<script>
var oneDay = "${oneDay}";   // 해당월 1일
var lastDay = "${lastDay}"; // 해당월 마지막일자
var toDay = "${toDay}";     // 오늘 일자
var dlrCd = "${dlrCd}";     // 딜러
var usrId = "${usrId}";     // 신청인코드
var usrNm = "${usrNm}";     // 신청인명
var loginUser = "${loginUser}";




$("#dlrCd").val(dlrCd);
$("#reqUsrNm").val(usrNm);


//차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//요청상태 Array
var reqStatCd = [];
<c:forEach var="obj" items="${reqStatCdList}">
    reqStatCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//요청상태 Map
var reqStatCdMap = dms.data.arrayToMap(reqStatCd, function(obj){ return obj.cmmCd; });


//심사결과  Array
var evalRsltYn = [];
<c:forEach var="obj" items="${evalRsltYnList}">
    evalRsltYn.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//심사결과 Map
var evalRsltYnMap = dms.data.arrayToMap(evalRsltYn, function(obj){ return obj.cmmCd; });



//차종
$("#carlineCd").kendoExtDropDownList({
    dataTextField:"carlineNm"
   ,dataValueField:"carlineCd"
   ,dataSource:carLineCdList
   ,optionLabel:" "   // 전체
   ,select:function(e){
       var dataItem = this.dataItem(e.item);
       $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
       $("#modelCd").data("kendoExtDropDownList").enable(true);

       $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
       $("#ocnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

       $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
       $("#extColorCd").data("kendoExtDropDownList").enable(false);

       $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
       $("#intColorCd").data("kendoExtDropDownList").enable(false);

       if(dataItem.carlineCd == ""){
           $("#modelCd").data("kendoExtDropDownList").setDataSource([]);
           $("#modelCd").data("kendoExtDropDownList").enable(false);
           return false;
       }

       var responseJson = dms.ajax.getJson({
           url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
           ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
           ,async:false
       });
       $("#modelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
   }
});

// 모델
$("#modelCd").kendoExtDropDownList({
    dataTextField:"modelNm"
   ,dataValueField:"modelCd"
   ,optionLabel:" "   // 전체
   ,select:function(e){
       var dataItem = this.dataItem(e.item);
       $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
       $("#ocnCd").data("kendoExtDropDownList").enable(true);

       $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
       $("#extColorCd").data("kendoExtDropDownList").enable(false);

       $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
       $("#intColorCd").data("kendoExtDropDownList").enable(false);

       if(dataItem.modelCd == ""){
           $("#ocnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#ocnCd").data("kendoExtDropDownList").enable(false);
           return false;
       }
       var responseJson = dms.ajax.getJson({
           url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
           ,data:JSON.stringify({"carlineCd":$("#carlineCd").val(), "modelCd":dataItem.modelCd})
           ,async:false
       });
       $("#ocnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
   }
});
$("#modelCd").data("kendoExtDropDownList").enable(false);

// ocn
$("#ocnCd").kendoExtDropDownList({
     dataTextField: "ocnNm"
    ,dataValueField:"ocnCd"
    ,optionLabel:" "   // 전체
    ,select:function(e){
        $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
        $("#extColorCd").data("kendoExtDropDownList").enable(true);

        $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
        $("#intColorCd").data("kendoExtDropDownList").enable(false);

        if(this.dataItem(e.item).ocnCd == ""){
            $("#extColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#extColorCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
            ,data:JSON.stringify({"modelCd":$("#modelCd").data("kendoExtDropDownList").value() })
            ,async:false
        });
        $("#extColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    }
});
$("#ocnCd").data("kendoExtDropDownList").enable(false);

//외장색
$("#extColorCd").kendoExtDropDownList({
     dataTextField: "extColorNm"
    ,dataValueField:"extColorCd"
    ,optionLabel:" "   // 전체
    ,select:function(e){
        if(this.dataItem(e.item).extColorCd == ""){
            $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#intColorCd").data("kendoExtDropDownList").enable(false);
            return false;
        }

        $("#intColorCd").data("kendoExtDropDownList").setDataSource([]);
        $("#intColorCd").data("kendoExtDropDownList").enable(true);

        var responseJson = dms.ajax.getJson({
            url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
            ,data:JSON.stringify({"modelCd":$("#modelCd").data("kendoExtDropDownList").value() })
            ,async:false
        });
        $("#intColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
    }
});
$("#extColorCd").data("kendoExtDropDownList").enable(false);

//내장색
$("#intColorCd").kendoExtDropDownList({
     dataTextField: "intColorNm"
    ,dataValueField:"intColorCd"
    ,optionLabel:" "   // 전체
});
$("#intColorCd").data("kendoExtDropDownList").enable(false);



/****************************** 신청차량정보 ***************************************/

$(document).ready(function() {

    $("#vehicleDlrExcWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.lbl.detailSearch' />"      // 상세정보
        ,width:"750px"
        ,height:"400px"
    }).data("kendoWindow");



    //조회조건 - 심사지역
    $("#sSaleDlrDistCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:"",
        optionLabel:" "
    });

    //조회조건 - 딜러
    $("#sDlrCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:"",
        optionLabel:" "
    });


    //조회조건 - 등록일(기간)- START
    $("#sStartReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    //조회조건 - 등록일(기간)- END
    $("#sEndReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:lastDay
    });

    // 조회조건 - 시작일, 종료일
    $("#sStartReqDt").on('change', {from:$("#sStartReqDt"), to:$("#sEndReqDt")}, fnChkSearchDate);
    $("#sEndReqDt").on('change',   {from:$("#sEndReqDt"), to:$("#sEndReqDt")}, fnChkSearchDate);



    //조회조건 - 상태
    $("#sReqStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:reqStatCd,
        optionLabel:" "
    });


    //조회조건 - 심사결과
    $("#sEvalRsltYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:evalRsltYn,
        optionLabel:" "
    });

    /*************************** 검색 조건 영역 END **************************************************/

    //교환정보 - 교환딜러
    $("#obtDlrCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:"",
        optionLabel:" "
    });


    //교환정보  - 신청일
    $("#reqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });


    //심사정보 - 심사일자
    $("#evalDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });



    //심사정보 - 심사결과
    $("#evalRsltYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:evalRsltYn,
        optionLabel:" "
    });




    /*************************** 상세정보 영역 END **************************************************/
    // 상세정보
    $("#btnViewDetail").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                viewDetail(selectedItem);

            } else {

                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }

        }
        , enable:false
    })


    //심사확정
    $("#btnConfirm").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();

            if(selectIdx ==  -1 ){
                //심사확정할  데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='sal.btn.evalConfirm' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }



            $.ajax({
                url:"<c:url value='/sal/exc/dlrExc/saveVehicleDlrExc.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(getSaveData("confirm")),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    grid.dataSource.read();

                    //심사신청이 완료되었습니다.
                    dms.notification.success("<spring:message code='sal.btn.evalConfirm' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");

                }
            });

        }

    });



    //심사신청
    $("#btnRequest").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();

            if(selectIdx ==  -1 ){
                //심사신청할  데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='sal.btn.evalRequest' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }



            $.ajax({
                url:"<c:url value='/sal/exc/dlrExc/saveVehicleDlrExc.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(getSaveData("request")),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    grid.dataSource.read();

                    //신청이 완료되었습니다.
                    dms.notification.success("<spring:message code='sal.btn.evalRequest' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");

                }
            });

        }

    });



    //초기화
    $("#btnReset").kendoButton({
        click:function(e){
            // 팝업오픈;
            viewPopup();

            $("#btnSave").data("kendoButton").enable(true);

            var grid = $("#grid").data("kendoExtGrid");
            grid.clearSelection();

            $("#dlrCd").val(dlrCd);
            $("#reqStatCd").val("");
            $("#exchNo").val("");
            $("#reqUsrNm").val(usrNm);
            $("#saleDlrDistCd").val("");
            $("#telNo").val("");
            $("#obtDlrCd").data("kendoExtDropDownList").value("");
            $("#carlineCd").data("kendoExtDropDownList").value("");
            $("#modelCd").data("kendoExtDropDownList").value("");
            $("#ocnCd").data("kendoExtDropDownList").value("");
            $("#extColorCd").data("kendoExtDropDownList").value("");
            $("#intColorCd").data("kendoExtDropDownList").value("");
            $("#vinNo").val("");
            $("#enginSerialNo").val("");

            $("#evalRsltYn").data("kendoExtDropDownList").value("");
            $("#pevalNm").val("");
            $("#telNo1").val("");
            $("#evalDt").data("kendoExtMaskedDatePicker").value(toDay);
            $("#remark").val("");


        }

    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            $('#grid').data('kendoExtGrid').dataSource.page(1);
            $("#btnViewDetail").data("kendoButton").enable(false);

        }
    });




    // 저장/수정
    $("#btnSave").kendoButton({
        click:function(e) {


            //telNo 필수입력
            if ( dms.string.isEmpty($("#telNo").val())){
                dms.notification.warning("<spring:message code='global.lbl.carLine' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#telNo").focus();
                return false;
            }

            //차종 필수입력
            if ( dms.string.isEmpty($("#carlineCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.carLine' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#carlineCd").focus();
                return false;
            }


            $.ajax({
                url:"<c:url value='/sal/exc/dlrExc/saveVehicleDlrExc.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(getSaveData("")),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                    $("#vehicleDlrExcWindow").data("kendoWindow").close();
                }
            });

        }
    });


    // 삭제
    $("#btnDelete").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();

            if(selectIdx ==  -1 ){
              //삭제할 데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }

            // 삭제하시겠습니까?
            if (confirm("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmMsg' arguments='${del},' />") == false ){    //삭제하시겠습니까?
                return false;
            }else{

                var data = {};
                data["exchNo"] = $("#exchNo").val();                                              // VIN NO

                $.ajax({
                    url:"<c:url value='/sal/exc/dlrExc/deleteVehicleDlrExc.do' />",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    data:JSON.stringify(data),
                    error:function(jqXHR,status,error){
                        console.log(jqXHR);
                    },
                    success:function(data){
                        dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.successMsg' arguments='${del},' />");
                        //삭제가 완료되었습니다.
                        grid.dataSource.read();
                    }
                });

            }

        }
    });

    /*******************  //버튼   *******************************************/





    //$("#sSaleDlrDistCd").data("kendoExtDropDownList").value("");
    $("#sDlrCd").data("kendoExtDropDownList").value(dlrCd);

    alert("loginUser::::"+loginUser);

    if(loginUser == 'DMS'){
        $("#btnConfirm").data("kendoButton").enable(false);
        $("#btnRequest").data("kendoButton").enable(true);

        $("#sSaleDlrDistCd").data("kendoExtDropDownList").enable(false);
        $("#sDlrCd").data("kendoExtDropDownList").enable(false);
        $("#obtDlrCd").data("kendoExtDropDownList").enable(true);

        $("#evalRsltYn").data("kendoExtDropDownList").enable(false);
        $("#pevalNm").prop("disabled","disabled").addClass("form_disabled");
        $("#evalDt").data("kendoExtMaskedDatePicker").enable(false);
        $("#telNo1").prop("disabled","disabled").addClass("form_disabled");
        $("#vinNo").prop("disabled","").removeClass("form_disabled");
        $("#enginSerialNo").prop("disabled","").removeClass("form_disabled");
        $("#remark").prop("disabled","disabled").addClass("form_disabled");

    }else {
        $("#btnConfirm").data("kendoButton").enable(true);
        $("#btnSearch").data("kendoButton").enable(true);
        $("#btnRequest").data("kendoButton").enable(false);
        $("#btnDelete").data("kendoButton").enable(false);
        $("#btnReset").data("kendoButton").enable(false);
        $("#btnSave").data("kendoButton").enable(true);

        $("#sSaleDlrDistCd").data("kendoExtDropDownList").enable(true);
        $("#sDlrCd").data("kendoExtDropDownList").enable(true);
        $("#obtDlrCd").data("kendoExtDropDownList").enable(false);

        $("#telNo").prop("disabled","disabled").addClass("form_disabled");
        $("#carlineCd").data("kendoExtDropDownList").enable(false);
        $("#evalRsltYn").prop("disabled","").removeClass("form_disabled");
        $("#pevalNm").prop("disabled","").removeClass("form_disabled");
        $("#evalDt").prop("disabled","").removeClass("form_disabled");
        $("#telNo1").prop("disabled","").removeClass("form_disabled");
        $("#vinNo").prop("disabled","disabled").addClass("form_disabled");
        $("#enginSerialNo").prop("disabled","disabled").addClass("form_disabled");
        $("#remark").prop("disabled","").removeClass("form_disabled");
    }



    /*************************** DMS / DCS 별 화면 구성. **************************************************/





    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113334"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/exc/dlrExc/selectVehicleDlrExc.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sStartReqDt"]= $("#sStartReqDt").data("kendoExtMaskedDatePicker").value();    // 등록일 - 시작일
                        params["sEndReqDt"]  = $("#sEndReqDt").data("kendoExtMaskedDatePicker").value();      // 등록일 - 종료일
                        params["sSaleDlrDistCd"] = $("#sSaleDlrDistCd").val();                       // 심사지역
                        params["sDlrCd"]     = $("#sDlrCd").val();                                   // 딜러코드
                        params["sReqStatCd"] = $("#sReqStatCd").val();                               // 상태
                        params["sEvalRsltYn"]= $("#sEvalRsltYn").val();                              // 심사결과
                        params["sVinNo"]= $("#sVinNo").val();                                        // VIN NO

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {

                    if(loginUser == 'DMS'){
                        $("#btnConfirm").data("kendoButton").enable(false);
                        $("#btnRequest").data("kendoButton").enable(true);
                        $("#btnReset").data("kendoButton").enable(true);
                        $("#btnSave").data("kendoButton").enable(true);
                        $("#btnDelete").data("kendoButton").enable(true);
                    }

                    $("#telNo").val("");
                    $("#exchNo").val("");
                    $("#carlineCd").data("kendoExtDropDownList").value("");
                    $("#modelCd").data("kendoExtDropDownList").value("");
                    $("#ocnCd").data("kendoExtDropDownList").value("");
                    $("#extColorCd").data("kendoExtDropDownList").value("");
                    $("#intColorCd").data("kendoExtDropDownList").value("");
                    $("#vinNo").val("");
                    $("#enginSerialNo").val("");
                    $("#obtDlrCd").data("kendoExtDropDownList").value("");

                    $("#evalRsltYn").data("kendoExtDropDownList").value("");
                    $("#pevalNm").val("");
                    $("#evalDt").data("kendoExtMaskedDatePicker").value(toDay);
                    $("#telNo1").val("");
                    $("#remark").val("");
                }
            }
            ,schema:{
                model:{
                    id:"exchNo"
                    ,fields:{
                        exchNo    :{type:"string"}
                        ,dlrCd    :{type:"string"}
                        ,dlrNm    :{type:"string"}
                        ,carlineNm:{type:"string"}
                        ,modelNm  :{type:"string"}
                        ,ocnNm    :{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,obtDlrCd :{type:"string"}
                        ,obtDlrNm :{type:"string"}
                        ,reqDt    :{type:"date"}
                        ,evalDt   :{type:"date"}
                        ,reqStatCd:{type:"string"}
                        ,evarRsltYn:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        //,autoBind:false
        //,height  :460
        ,change:function(e) {

            if(this.select().length != 0){
                var selectedItem = this.dataItem(this.select());
                var exchNo = selectedItem.exchNo;

                if ( dms.string.isNotEmpty(exchNo) ) {
                    $("#btnViewDetail").data("kendoButton").enable(true);
                }


                if(loginUser == 'DMS'){
                    if(selectedItem.reqStatCd == 'A' || selectedItem.reqStatCd == 'B'){
                        $("#btnDelete").data("kendoButton").enable(true);
                        if(selectedItem.reqStatCd == 'A'){
                            $("#btnRequest").data("kendoButton").enable(true);
                        }else{
                            $("#btnRequest").data("kendoButton").enable(false);
                        }

                    }else {
                        $("#btnDelete").data("kendoButton").enable(false);
                        $("#btnRequest").data("kendoButton").enable(false);
                    }

                    $("#btnConfirm").data("kendoButton").enable(false);
                    $("#btnReset").data("kendoButton").enable(true);
                    $("#btnSave").data("kendoButton").enable(true);
                }else {
                    if(selectedItem.reqStatCd == 'C' || selectedItem.reqStatCd == 'D'){
                        $("#btnConfirm").data("kendoButton").enable(false);
                    }else {
                        $("#btnConfirm").data("kendoButton").enable(true);
                    }
                }

            };

        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[ {field:"exchNo"       ,title:"<spring:message code = 'sal.lbl.exchNo'/>"       ,width:100 ,attributes:{"class":"ac"}}          //교환번호
                    ,{field:"dlrCd"        ,title:"<spring:message code = 'global.lbl.dlrCd'/>"     ,width:80  ,attributes:{"class":"ac"}}          //딜러코드
                    ,{field:"dlrNm"        ,title:"<spring:message code = 'sal.lbl.dlrNm'/>"        ,width:130 ,attributes:{"class":"al"}}          //딜러이름
                    ,{field:"carlineNm"    ,title:"<spring:message code = 'global.lbl.carLine'/>"   ,width:100 ,attributes:{"class":"al"}}          //차종
                    ,{field:"modelNm"      ,title:"<spring:message code = 'global.lbl.model'/>"     ,width:130 ,attributes:{"class":"al"}}          //모델
                    ,{field:"ocnNm"        ,title:"<spring:message code = 'global.lbl.ocn'/>"       ,width:130 ,attributes:{"class":"al"}}          //OCN
                    ,{field:"extColorNm"   ,title:"<spring:message code = 'global.lbl.extColor'/>"  ,width:120 ,attributes:{"class":"al"}}          //외장색
                    ,{field:"intColorNm"   ,title:"<spring:message code = 'global.lbl.extColor'/>"  ,width:120 ,attributes:{"class":"al"}}          //내장색
                    ,{field:"obtDlrCd"     ,title:"<spring:message code = 'sal.lbl.obtDealerCd'/>"  ,width:80  ,attributes:{"class":"al"}}          //조달딜러코드
                    ,{field:"obtDlrNm"     ,title:"<spring:message code = 'sal.lbl.obtDealerNm'/>"  ,width:120 ,attributes:{"class":"al"}}          //조달딜러명
                    ,{field:"reqDt"        ,title:"<spring:message code = 'global.lbl.fincReqDt'/>" ,width:100 ,attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}   //신청일자
                    ,{field:"evalDt"       ,title:"<spring:message code = 'global.lbl.evalDt'/>"    ,width:100 ,attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"}   //심사일자
                    ,{field:"reqStatCd"    ,title:"<spring:message code = 'global.lbl.statNm'/>"    ,width:100 ,attributes:{"class":"al"}           //상태
                        ,template:"# if(reqStatCdMap[reqStatCd] != null) { # #= reqStatCdMap[reqStatCd].cmmCdNm# # }#"
                     }
                    ,{field:"evalRsltYn"   ,title:"<spring:message code = 'global.lbl.evalRslt'/>"  ,width:100  ,attributes:{"class":"al"}          //심사여부
                        ,template:"# if(evalRsltYnMap[evalRsltYn] != null) { # #= evalRsltYnMap[evalRsltYn].cmmCdNm# # }#"
                     }
                   ]
    });



    /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/
     // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
     $("#grid").on("dblclick", "tr.k-state-selected", function (e) {

         var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select())
         ;



         if ( dms.string.isNotEmpty(selectedItem) ){

             viewDetail(selectedItem);

         } else {

             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }



     });


     // 상세조회 후 팝업오픈
     function viewDetail(selectedVal){

         if( dms.string.isNotEmpty(selectedVal) ){
             // 팝업오픈;
             viewPopup();

           //신청정보 세팅
             $("#dlrCd").val(selectedVal.dlrCd);
             $("#dlrNm").val(selectedVal.dlrNm);
             $("#obtDlrCd").data("kendoExtDropDownList").value(selectedVal.obtDlrNm);
             $("#telNo").val(selectedVal.telNo);
             $("#exchNo").val(selectedVal.exchNo);
             $("#reqStatCd").val(selectedVal.reqStatCd);


             //신청차량정보 세팅
             if(selectedVal.carlineCd != null &&  selectedVal.carlineCd != ""){
                 $("#carlineCd").data("kendoExtDropDownList").value(selectedVal.carlineCd); // 차종
             }

             if(selectedVal.modelCd != null &&  selectedVal.modelCd != ""){
                 var modelCd = $("#modelCd").data("kendoExtDropDownList");
                 modelCd.setDataSource([{modelNm:selectedVal.modelNm, modelCd:selectedVal.modelCd}]);
                 modelCd.enable(true);
                 modelCd.value(selectedVal.modelCd); // 모델
             }else {
                 $("#modelCd").data("kendoExtDropDownList").value("");
             }

             if(selectedVal.ocnCd != null &&  selectedVal.ocnCd != ""){
                 var ocnCd = $("#ocnCd").data("kendoExtDropDownList");
                 ocnCd.setDataSource([{ocnNm:selectedVal.ocnNm, ocnCd:selectedVal.ocnCd}]);
                 ocnCd.enable(true);
                 ocnCd.value(selectedVal.ocnCd); // OCN
             }else {
                 $("#ocnCd").data("kendoExtDropDownList").value("");
             }

             if(selectedVal.extColorCd != null &&  selectedVal.extColorCd != ""){
                 var extColorCd = $("#extColorCd").data("kendoExtDropDownList");
                 extColorCd.setDataSource([{extColorNm:selectedVal.extColorNm, extColorCd:selectedVal.extColorCd}]);
                 extColorCd.enable(true);
                 extColorCd.value(selectedVal.extColorCd); // 외장색
             }else {
                 $("#extColorCd").data("kendoExtDropDownList").value("");
             }

             if(selectedVal.intColorCd != null &&  selectedVal.intColorCd != ""){
                 var intColorCd = $("#intColorCd").data("kendoExtDropDownList");
                 intColorCd.setDataSource([{intColorNm:selectedVal.intColorNm, intColorCd:selectedVal.intColorCd}]);
                 intColorCd.enable(true);
                 intColorCd.value(selectedVal.intColorCd); // 내장색
             }else {
                 $("#intColorCd").data("kendoExtDropDownList").value("");
             }


             //모델,ocn,외장색,내장색 다시 disabled 해준다.
             if(selectedVal.modelCd != null &&  selectedVal.modelCd != ""){ modelCd.enable(false); }
             if(selectedVal.ocnCd != null &&  selectedVal.ocnCd != ""){ocnCd.enable(false);}
             if(selectedVal.extColorCd != null &&  selectedVal.extColorCd != ""){extColorCd.enable(false);}
             if(selectedVal.intColorCd != null &&  selectedVal.intColorCd != ""){intColorCd.enable(false);}
             $("#enginSerialNo").val(selectedVal.enginSerialNo);
             $("#vinNo").val(selectedVal.vinNo);

             //심사정보 세팅
             $("#evalRsltYn").data("kendoExtDropDownList").value(selectedVal.evalRsltYn);
             $("#pevalNm").val(selectedVal.pevalNm);
             $("#evalDt").data("kendoExtMaskedDatePicker").value(selectedVal.evalDt);
             $("#obtDlrCd").data("kendoExtDropDownList").value(selectedVal.obtDlrCd);
             $("#telNo1").val(selectedVal.telNo1);
             $("#remark").val(selectedVal.remark);

             //$("#btnSave").hide();

         } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }


     }


     /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/


});







//조회조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
  if(dms.string.isEmpty(e.data.from.val())){return;}
  if(dms.string.isEmpty(e.data.to.val())){return;}

  var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
  var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
  if(startDt > endDt){
      dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
      $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
      $(this).focus();
  }
}



function getSaveData(gubun){
    var evalRsltYn = $("#evalRsltYn").data("kendoExtDropDownList").value();
    var exchNo = $("#exchNo").val();
    var gb = "";


    if(gubun == "request"){
        gb = 'R';
    }else if(gubun == 'confirm'){
        gb = 'C';
    }

    var saveData = {
            dlrCd     : $("#dlrCd").val(),
            reqUsrId  : usrId,
            reqUsrNm  : usrNm,
            saleDlrDistCd:'A07AA',
            saleDlrDistNm:'test',
            telNo     : $("#telNo").val(),
            carlineCd : $("#carlineCd").data("kendoExtDropDownList").value(),
            modelCd   : $("#modelCd").data("kendoExtDropDownList").value(),
            ocnCd     : $("#ocnCd").data("kendoExtDropDownList").value(),
            extColorCd: $("#extColorCd").data("kendoExtDropDownList").value(),
            intColorCd: $("#intColorCd").data("kendoExtDropDownList").value(),
            evalRsltYn: $("#evalRsltYn").data("kendoExtDropDownList").value(),
            pevalNm   : $("#pevalNm").val(),
            evalDt    : $("#evalDt").data("kendoExtMaskedDatePicker").value(),
            //obtDlrCd  : $("#obtDlrCd").data("kendoExtDropDownList").value(),
            obtDlrCd  : 'D2516', //테스트데이터
            telNo1    : $("#telNo1").val(),
            vinNo     : $("#vinNo").val(),
            remark    : $("#remark").val(),
            exchNo    : exchNo,
            gb        : gb,
            evalRsltYn: evalRsltYn,
            enginSerialNo:$("#enginSerialNo").val()
        }

    return saveData;
}




//팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
function viewPopup(){
    var win = $("#vehicleDlrExcWindow").data("kendoWindow");
    win.center();
    win.open();
}

</script>
<!-- //script -->