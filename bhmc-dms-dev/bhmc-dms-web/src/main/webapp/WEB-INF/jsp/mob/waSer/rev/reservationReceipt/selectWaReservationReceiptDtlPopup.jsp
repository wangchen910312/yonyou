<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<%--
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.common.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/kendo/kendo.default.min.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/common.css"/>">
 --%>
 <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/tablet.css"/>">

<script type="text/javascript" src="<c:url value="/resources/js/mob/mobCommon.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>


<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

        <!-- RO 상세조회 팝업 -->
    <section id="window" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <button class="btn_m" id="btnConfirm"><spring:message code="ser.btn.confirm" /><!-- 확인 --></button>
            </div>
        </div>
        <div class="table_form">
            <input type="hidden" id="resvDocNo" name="resvDocNo"/>
            <input type="hidden" id="vinNo" name="vinNo"/>
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21%;">
                    <col style="width:13%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody>
                    <tr>


                        <th scope="row"><spring:message code="ser.lbl.roDocNo" /> <!-- RO번호 --></th>
                        <td>
                            <input id="roDocNo" type="text"  readonly class="form_input form_readonly"/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.carNo" /><!-- 차량번호 --></th>
                        <td>
                            <input id="carRegNo" name="carRegNo" type="text"  readonly class="form_input form_readonly"/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.custNm" /><!-- 고객명 --></th>
                        <td>
                            <input type="hidden" id="driverId" name="driverId" />
                            <input id="driverNm" name="driverNm" type="text"  readonly class="form_input form_readonly"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.carlineNm" /><!-- 차종명 --></th>
                        <td>
                            <input id="carlineNm" name="carlineNm" type="text"  readonly class="form_input form_readonly"/>
                            <input type="hidden" id="carlineCd" name="carlineCd" class="form_input"/>
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.accuDrivDis" /> <!-- 누적주행거리 --></th>
                        <td>
                            <input id="carRunDistVal" name="carRunDistVal" type="text"  readonly class="form_input form_readonly" />
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.wcEndDt" /><!-- 보증만료일자 --></th>
                        <td>
                            <input id="grteEndDt" name="grteEndDt" type="text"  readonly class="form_input form_readonly"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
         <!-- 탭메뉴 전체 영역 -->
        <div id="tabstrip" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li class="k-state-active"><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                <li><spring:message code="ser.lbl.lbrNm" /><!-- 정비항목 --></li>
                <li><spring:message code="ser.lbl.part" /><!-- 부품 --></li>
                <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 고객요청사항 & 고장설명 -->
            <c:import url="/WEB-INF/jsp/mob/waSer/cmm/tabInfo/selectTabInfo.jsp" />
            <!-- //고객요청사항 & 고장설명 -->

            <!-- 정비항목 -->
            <c:import url="/WEB-INF/jsp/mob/waSer/cmm/tabInfo/selectLbrList.jsp" />
            <!-- //정비항목 -->

            <!-- 부품 -->
            <c:import url="/WEB-INF/jsp/mob/waSer/cmm/tabInfo/selectPartList.jsp" />
            <!-- //부품 -->

            <!-- 기타 -->
            <c:import url="/WEB-INF/jsp/mob/waSer/cmm/tabInfo/selectEtcIssue.jsp" />
            <!-- //기타 -->
        </div>


        <div class="table_form mt10">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:21%;">
                    <col style="width:13%;">
                    <col style="width:21%;">
                    <col style="width:12%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.saAppoint" /><!-- SA지정 --></th>
                        <td>
                            <input type="text" id="saNm" name="saNm" readonly class="form_input form_readonly">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.tecAppoint" /><!-- 테크니션 지정 --></th>
                        <td>
                            <input type="text" id="tecNm" name="tecNm" readonly class="form_input form_readonly">
                        </td>
                        <th scope="row"><spring:message code="ser.lbl.hopeResvDt" /><!-- 희망예약시간 --></th>
                        <td>
                            <input type="text" id="hopeResvDt" name="hopeResvDt" readonly class="form_input form_readonly">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="ser.lbl.resvRemark" /><!-- 예약서비스비고 --></th>
                        <td colspan="5">
                            <input type="text" id="resvRemark" name="resvRemark" readonly class="form_input form_readonly">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </section>

<script>
var preFixId = "RE";

$(document).ready(function() {


    var options = parent.detailPop.options.content.data;
    $("#resvDocNo").val(options.resvDocNo);
    console.log("options.vinNo="+options.vinNo);
    $("#vinNo").val(options.vinNo);

    $("#roDocNo").val(options.resvDocNo);
    $("#driverNm").val(options.driverNm);
    $("#carRegNo").val(options.carRegNo);
    $("#roStatCdNm").val(options.roStatCdNm);
    $("#roDt").val(options.roDt);
    $("#roTpNm").val(options.roTpNm);


    $("#btnConfirm").click(function(){
        parent.detailPop.close();
    });

    $("#tabstrip, #tabstrip2").kendoExtTabStrip({
        animation:false
    });


    trobleDescInfo($("#resvDocNo").val(), "RE");
    lbrInfo($("#resvDocNo").val(), "RE");
    partInfo($("#resvDocNo").val(), "RE");
    etcIssueSet($("#resvDocNo").val(), "RE");



    detailSet = function(data, slide){
        $.ajax({
            url:"<c:url value='/ser/rev/reservationReceipt/selectReservationReceiptByKey.do' />"
            ,data:JSON.stringify({sResvDocNo:data.resvDocNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(dms.string.strNvl(result.resvDocNo) == ""){
                    dms.notification.info("<spring:message code='ser.lbl.resv' var='returnMsg' /><spring:message code='ser.info.noInfoData' arguments='${returnMsg}' />");
                } else {
                    //getCustInfo(result);                                // 고객정보(selectCustCarInfoMain.jsp)
                    resvInfoSet(result);
                    //partInfo(result.resvDocNo, "${preFixId}");          // 부품(selectPartList.jsp)
                    //lbrInfo(result.resvDocNo, "${preFixId}");           // 공임(selectLbrList.jsp)
                    //trobleDescInfo(result.resvDocNo, "${preFixId}");    // 고객요구사항및 고장설명(selectTabInfo.jsp)
                    //etcIssueSet(result.resvDocNo, "${preFixId}");       // 기타사항(selectEtcIssue.jsp)
                    //changeExpcAmt();                                    // 금액 계산(selectLbrList.jsp)
                }
            }
        });
    };

    if(dms.string.strNvl($("#resvDocNo").val()) != ""){
        var data = {"resvDocNo":$("#resvDocNo").val()}
        detailSet(data, false);
    }


    // 예약정보 셋팅
    resvInfoSet = function(result){

        /*
        $("#parAmt").val(0);
        $("#lbrAmt").val(0);
        $("#totAmt").val(0);
        $("#resvDocNo").val(result.resvDocNo);
        $("#docNo").val(result.resvDocNo);
        $("#saId").val(result.saId);
        */
        $("#saNm").val(result.saNm);
        //$("#tecId").val(result.tecId);
        $("#tecNm").val(result.tecNm);

        //$("#bayNo").val(result.bayNo);
        //$("#resvTp").data("kendoExtDropDownList").value(result.resvTp);
        //$("#hopeResvDt").data("kendoExtMaskedDateTimePicker").value(result.hopeResvDt);
        $("#hopeResvDt").val(result.hopeResvDt);
        //$("#serResvStartDt").data("kendoExtMaskedDateTimePicker").value(result.serResvStartDt);
        $("#resvRemark").val(result.resvRemark);
        /*
        $("#cauCd1").val(result.cauCd1);
        $("#cauNm1").val(result.cauNm1);
        $("#phenCd1").val(result.phenCd1);
        $("#phenNm1").val(result.phenNm1);

        $("#cauCd2").val(result.cauCd2);
        $("#cauNm2").val(result.cauNm2);
        $("#phenCd2").val(result.phenCd2);
        $("#phenNm2").val(result.phenNm2);
        */

    }



    getCustInfo = function(data){
        $.ajax({
            url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfCustInfoByKey.do' />"
            ,data:JSON.stringify({sVinNo:data.vinNo})
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            }
            ,success:function(result, textStatus){
                if(result != null){
                    custInfoSet(result.data[0]);
                    /*
                    if(dms.string.strNvl($("#carOwnerId").val()) != "") {
                        dealerMemberInfo(result.data[0]);
                        blueMemberInfo(result.data[0]);
                    }

                    custInfoUseControll(false);
                    */
                }
            }
        });
    };

    if(dms.string.strNvl($("#vinNo").val()) != ""){
        var data = {"vinNo":$("#vinNo").val()};
        console.log("#######3 = "+data.vinNo);
        //getCustInfo(data);
        getCustInfo(data);

    }

  //차량정보, 고객정보 셋팅
  custInfoSet = function(data){

      //$("#carId").val(dms.string.strNvl(data.carId));
      //$("#vinNo").val(dms.string.strNvl(data.vinNo));
      //$("#carNo").val(dms.string.strNvl(data.carNo));
      $("#carRegNo").val(dms.string.strNvl(data.carRegNo));
      //$("#enginNo").val(dms.string.strNvl(data.enginNo));
      //$("#modelNm").val(dms.string.strNvl(data.modelNm));
      //$("#ordDlrCd").val(dms.string.strNvl("${dlrCd}"));
      //$("#extColorNm").val(dms.string.strNvl(data.extColorNm));

      //$("#carlineCd").val(dms.string.strNvl(data.carlineCd));
      //$("#carlineNm").val(dms.string.strNvl(data.carlineNm));
      $("#grteEndDt").val(kendo.toString(kendo.parseDate(data.grteEndDt), "yyyy-MM-dd"));
      /*
      $("#kanbanGrteEndDt").val(kendo.toString(kendo.parseDate(data.grteEndDt), "yyyy-MM-dd"));
      $("#carBrandCd").val(dms.string.strNvl(data.carBrandCd));
      $("#carBrandNm").val(dms.string.strNvl(getBrandCdMap(data.carBrandCd)));
      $("#grteEndRemainDay").val(dms.string.strNvl(data.grteEndRemainDay));

      $("#carOwnerId").val(dms.string.strNvl(data.carOwnerId));
      $("#carOwnerNm").val(dms.string.strNvl(data.carOwnerNm));
      $("#carOwnerHpNo").data("kendoMaskedTextBox").value(data.carOwnerHpNo);
      $("#carOwnerTelNo").val(dms.string.strNvl(data.carOwnerTelNo));
      $("#carOwnerZipCd").val(dms.string.strNvl(data.carOwnerZipCd));
      $("#carOwnerMailNm").val(dms.string.strNvl(data.carOwnerMailNm));
      $("#carOwnerAddr").val(dms.string.strNvl(data.carOwnerAddr));
      $("#carOwnerSsnCrnNo").val(dms.string.strNvl(data.carOwnerSsnCrnNo));
      $("#carOwnerMathDocTp").val(dms.string.strNvl(getMathDocTpMap(data.carOwnerMathDocTp)));
      $("#carOwnerPrefContactMthCd").val(dms.string.strNvl(getPrefContactMthCdMap(data.carOwnerPrefContactMthCd)));
      $("#carOwnerPrefContactTimeCd").val(dms.string.strNvl(getPrefContactTimeCdMap(data.carOwerPrefContactTimeCd)));
      $("#carOwnerBirthDt").val(dms.string.strNvl(data.carOwnerBirthDt));
      $("#carOwnerBirthRemainDay").val(dms.string.strNvl(data.carOwnerBirthRemainDay));
      */

      $("#driverId").val(dms.string.strNvl(data.driverId));
      $("#driverNm").val(dms.string.strNvl(data.driverNm));
      /*
      $("#driverHpNo").val(dms.string.strNvl(data.driverHpNo));
      $("#driverTelNo").val(dms.string.strNvl(data.driverTelNo));
      $("#driverMailNm").val(dms.string.strNvl(data.driverMailNm));
      $("#driverSsnCrnNo").val(dms.string.strNvl(data.driverSsnCrnNo));
      $("#driverMathDocTp").val(dms.string.strNvl(getMathDocTpMap(data.driverMathDocTp)));
      $("#driverPrefContactMth").val(dms.string.strNvl(getPrefContactMthCdMap(data.driverPrefContactMthCd)));
      $("#driverPrefContactTime").val(dms.string.strNvl(getPrefContactTimeCdMap(data.driverPrefContactTimeCd)));
      $("#driverBirthDt").val(dms.string.strNvl(data.driverBirthDt));
      $("#driverBirthRemainDay").val(dms.string.strNvl(data.driverBirthRemainDay));
      $("#sexCd").val(dms.string.strNvl(sexCdGrid(data.sexCd)));
      $("#custTp").val(dms.string.strNvl(data.custTp));
      $("#carDstinCd").val(dms.string.strNvl(data.carDstinCd));
      $("#signOffDt").val(kendo.toString( kendo.parseDate(data.signOffDt), "yyyy-MM-dd" ));
      $("#custSaleDt").data("kendoExtMaskedDatePicker").value(data.custSaleDt);
      $("#carOwnerSeq").val(dms.string.strNvl(data.carOwnerSeq));
      $("#driverSeq").val(dms.string.strNvl(data.driverSeq));
      $("#ltsModelCd").val(dms.string.strNvl(data.ltsModelCd));
      $("#incEndDt").val(kendo.toString(kendo.parseDate(data.incEndDt), "yyyy-MM-dd"));
      $("#kanbanIncEndDt").val(kendo.toString(kendo.parseDate(data.incEndDt), "yyyy-MM-dd"));
      $("#incEndRemainDay").val(dms.string.strNvl(data.incEndRemainDay));

      if(dms.string.strNvl(data.custSaleDt) != "" && dms.string.strNvl(data.signOffDt) != ""){
          $("#serCampaignGrid").data("kendoExtGrid").dataSource.data([]);
          $("#serCampaignGrid").data("kendoExtGrid").dataSource.read();
          $("#allCampaignGrid").data("kendoExtGrid").dataSource.data([]);
          $("#allCampaignGrid").data("kendoExtGrid").dataSource.read();
      }
      */

      //var carRunDistVal = $("#carRunDistVal").data("kendoExtNumericTextBox");
      //carRunDistVal.value(data.carRunDistVal);
      $("#carRunDistVal").val(data.carRunDistVal);
      /*
      sanbaoDetailSet();

      // TODO:[김경목] 버튼 컨트롤 수정 필요
      if(preFixId != "CA") {
          btnControll("U");
      }
      */

  };



    /*
    //그리드 설정
    $("#workAssignGrid").kendoExtGrid({
        gridId :"G-SER-0519-173759"
        ,dataSource :{
             transport :{
                read :{
                    url :"<c:url value='/ser/ro/workAssign/selectWorkAssigns.do' />"
                }
                ,parameterMap :function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["sRoDocNo"] = $("#roDocNo").val();
                        console.log("a"+kendo.stringify(params))
                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema :{
                model :{
                    id :"lineNo"
                    ,fields :{
                        dlrCd :{type :"string", editable :false}
                        ,roDocNo :{type :"string", editable :false}
                        ,lineNo :{type :"string"}
                        ,bayNo :{type :"string"}
                        ,bayNm :{type :"string"}
                        ,rpirCd :{type :"string", editable :false}
                        ,rpirNm :{type :"string", editable :false}
                        ,rpirDstinCd :{type :"string", editable :false}
                        ,wrkStatCd :{type :"string"}
                        ,qtTestCd :{type :"string", editable:true }
                        ,realTecId :{type :"string"}
                        ,realTecNm :{type :"string"}
                        ,wkgrpNo :{type :"string"}
                        ,wkgrpNm :{type :"string"}
                        ,wrkStartDt :{type :"date"}
                        ,allocStartDt :{type :"date"}
                        ,allocEndDt :{type :"date"}
                        ,wrkEndDt :{type :"date", validation :{required :true}}
                        ,planHm :{type :"number", editable :false}
                        ,shtCnt :{type :"number", editable :false}
                        ,paintCnt :{type :"number", editable :false}
                        ,diffVal :{type :"number", editable :false}
                        ,lbrCnt :{type :"number", editable :false}
                    }
                }
            }
        }
        ,change :function(e){
        }
        ,height :150
        ,dataBound:function(e) {
            var dataItem = e.sender.dataSource._data;
            console.log("girdRow1=="+kendo.stringify(dataItem));
            var tecNms = [];
            var bays = [];
            var wkgrps = [];
            var sAllocHms = [];
            var vwrkStartDts = [];
            var vwrkEndDts = [];
            $.each(dataItem,function(i,v){
                if($.inArray(v.realTecNm,tecNms)==-1){
                    tecNms.push(v.realTecNm)
                }
                if($.inArray(v.bayNo,bays)==-1){
                    bays.push(v.bayNo)
                }
                if($.inArray(v.wkgrpNm,wkgrps)==-1){
                    wkgrps.push(v.wkgrpNm)
                }
                if($.inArray(v.allocHm,sAllocHms)==-1){
                    sAllocHms.push(v.allocHm)
                }
                if($.inArray(kendo.toString(v.wrkStartDt,"<dms:configValue code='dateFormat' /> HH:mm"),vwrkStartDts)==-1){
                    vwrkStartDts.push(kendo.toString(v.wrkStartDt,"<dms:configValue code='dateFormat' /> HH:mm"))
                }
                if($.inArray(kendo.toString(v.wrkEndDt,"<dms:configValue code='dateFormat' /> HH:mm"),vwrkEndDts)==-1){
                    vwrkEndDts.push(kendo.toString(v.wrkEndDt,"<dms:configValue code='dateFormat' /> HH:mm"))
                }
            });
            $("#vTecNm").val(tecNms);
            $("#bayNo").val(bays);
            $("#vWkgrpNo").val(wkgrps);
            $("#sAllocHm").val(sAllocHms);
            $("#vwrkStartDt").val(vwrkStartDts);
            $("#vwrkEndDt").val(vwrkEndDts);
        }
        ,autoBind :false
        ,pageable :false
        ,sortable :false
        ,editable :false
        ,indvColumnRows :10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default :10
        ,multiSelectWithCheckbox :false     //멀티선택 적용. default :false
        ,appendEmptyColumn :true           //빈컬럼 적용. default :false
        ,enableTooltip :false               //Tooltip 적용, default :false
        ,filterable :false                 // 필터링 기능 사용안함
        ,multiSelectWithCheckbox :false
        ,indvColumnVisible :false           //컬럼 보이기/감추기 개인화 적용. default :true
        ,indvColumnReorderable :false       //컬럼순서 변경 개인화 적용. default :true

        ,columns :[
            {field :"rpirCd", title :"<spring:message code='ser.lbl.lbrCd' />", width :100//정비코드
                ,attributes :{"class" :"ac"}
            }
            ,{field :"rpirNm", title :"<spring:message code='ser.lbl.lbrNm' />", width :250//정비항목
                ,attributes :{"class" :"ac"}
            }
            ,{field :"allocStatCd", title :"<spring:message code='ser.lbl.assignStat' />", width :80, attributes :{"class" :"ac"}}
            ,{field :"allocStartDt", title :"<spring:message code='ser.lbl.assignStartDt' />", width :130//예정시작시간
                ,attributes :{"class":"ac"}
                ,format :"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field :"allocEndDt", title :"<spring:message code='ser.lbl.assignEndDt' />", width :130//예정완료시간
                ,attributes :{"class":"ac"}
                ,format :"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }
            ,{field :"wrkStartDt", title :"<spring:message code='ser.lbl.preStartDt' />", width :130//예정시작시간
                ,attributes :{"class":"ac"}
                ,format :"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,editor :function (container, options){
                   $('<input id="wrkEndDt" required name="wrkEndDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtMaskedDatePicker({
                       format:"<dms:configValue code='dateFormat' /> HH:mm"
                     ,dateValidMessage :"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg }' />"
                   });
                   $('<span class="k-invalid-msg" data-for="wrkEndDt"></span>').appendTo(container);
               }
            }
            ,{field :"wrkEndDt", title :"<spring:message code='ser.lbl.preCompDt' />", width :130//예정완료시간
                ,attributes :{"class":"ac"}
                ,format :"{0:<dms:configValue code='dateFormat' /> HH:mm}"
                ,editor :function (container, options){
                   $('<input id="wrkEndDt" required name="wrkEndDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtMaskedDatePicker({
                       format:"<dms:configValue code='dateFormat' /> HH:mm"
                     ,dateValidMessage :"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                   });
                   $('<span class="k-invalid-msg" data-for="wrkEndDt"></span>').appendTo(container);
               }
            }//수리시간
            ,{field :"realTecId", hidden :true}//테크니션
            ,{field :"realTecNm", title :"<spring:message code='ser.lbl.tecNm' />", width :80, attributes :{"class" :"ac"}
                ,editor :function(container, options) {
                    $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanPopup();"></a></div>')
                    .appendTo(container)
                }
            }//테크니션
            ,{field :"wkgrpNo", hidden :true}//테크니션
            ,{field :"wkgrpNm", title :"<spring:message code='ser.lbl.wkgrpNo' />", width :80, attributes :{"class" :"ac"}
                 ,editor :function(container, options) {
                    $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:techmanTabPopup();"></a></div>')
                    .appendTo(container)
                }
            }//소조
            ,{field :"bayNo", hidden :true}//bayNo
            ,{field :"bayNm", title :"<spring:message code='ser.lbl.bayNo' />", width :80, attributes :{"class" :"ac"}
            }//bayNm
            ,{field :"planHm", title :"<spring:message code='ser.lbl.rpirDt' />", width :80, attributes :{"class" :"ac"}}
            ,{field :"allocHm", title :"<spring:message code='ser.lbl.dstbHm' />", width :80, attributes :{"class" :"ac"}}
            ,{field :"lbrCnt", title :"<spring:message code='ser.lbl.rpipHmDegree'/>", width :60, attributes :{"class" :"ac"}}
            ,{field :"diffVal", title :"<spring:message code='ser.lbl.difcDegree'/>", width :60, attributes :{"class" :"ac"}}
            ,{field :"paintColorCd", title :"<spring:message code='ser.lbl.paintColor' />", width :60, attributes :{"class" :"ac"}}
            ,{field :"shtCnt", title :"<spring:message code='ser.lbl.sheetMetalQty'/>", width :60, attributes :{"class" :"ac"}}
            ,{field :"paintCnt", title :"<spring:message code='ser.lbl.paintQlt'/>", width :60, attributes :{"class" :"ac"}}
        ]

    });

    $("#workAssignGrid").data("kendoExtGrid").dataSource.read();

    */

});
</script>
