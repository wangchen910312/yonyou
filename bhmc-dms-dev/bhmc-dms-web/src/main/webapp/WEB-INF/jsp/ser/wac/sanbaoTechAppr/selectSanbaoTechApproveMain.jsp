<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%@taglib prefix="enhance" uri="http://pukkaone.github.com/jsp" %>
<!-- 신청현황 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
            <div class="header_area">
                <%-- <h1 class="title_basic"><spring:message code="ser.title.sanboTecApr" /></h1>  --%><!-- 삼보기술처리 -->
                <div class="btn_right">
                    <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </div>
            </div>
            <div class="table_form form_width_70per">
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
                            <th scope="row"><spring:message code="ser.lbl.carRegDt" /></th> <!-- 등록일자 -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sFromDt" name="sFromDt" class="form_datepicker ac" />
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sToDt" name="sToDt" class="form_datepicker ac" />
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.vinNo" /></th> <!-- 차대번호 -->
                            <td>
                                <input type="text" id="sVinNo" maxlength="17" name="sVinNo" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.statNm" /></th> <!-- 상태 -->
                            <td>
                                <input type="text" id="sStatCd" name="sStatCd" class="form_comboBox" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt10">
                <div id="grid" class="resizable_grid"></div>
            </div>
        </section>
        <!-- //신청현황 -->
        <div class="header_area">
            <%-- <h1 class="title_basic"><spring:message code="ser.title.sanboTecApr" /></h1> <!-- 삼보기술처리 --> --%>
            <div class="btn_right">
                <button type="button" class="btn_s btn_approve btn_s_min5" id="btnAccept" disabled><spring:message code="ser.btn.btnAccept" /></button>
                <button type="button" class="btn_s btn_keepRepair btn_s_min5" id="btnKeepRepair" disabled><spring:message code="ser.btn.keepRepair" /></button> <!-- 유지보수 -->
                <button type="button" class="btn_s btn_return btn_s_min5" id="btnReturn" disabled><spring:message code="ser.btn.return" /></button> <!-- 반송 -->
                <button type="button" class="btn_s btn_approval btn_s_min5" id="btnApproval" disabled><spring:message code="global.btn.approval" /></button> <!-- 승인 -->
               <%--  <button type="button" class="btn_s btn_cancel btn_s_min5" id="btnCancel" disabled><spring:message code="global.btn.cancel" /></button>  --%><!-- 취소 -->
            </div>
        </div>

        <div class="clfix">
            <form id="sanbaoTecAprForm">
            <!-- 차종정보 -->
            <section class="left_areaStyle">
                <div class="header_area pt0">
                    <h2 class="title_basic"><spring:message code="ser.lbl.carLineInfo" /></h2> <!-- 차량정보 -->
                </div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:20%;">
                            <col style="width:30%;">
                            <col style="width:20%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.vinNo" /></th> <!-- 차대번호 -->
                                <td>
                                    <input type="text" id="vinNo" name="vinNo" readonly="readonly" class="form_input form_readonly" data-json-obj="true" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.enginNo" /></th> <!-- 엔진번호 -->
                                <td>
                                    <input type="text" id="enginNo" name="enginNo" readonly class="form_input form_readonly"  />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.runDist" /></th> <!-- 주행거리 -->
                                <td>
                                    <input type="text" id="runDistVal" name="runDistVal" readonly class="form_numeric form_readonly ar" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.wartDt" /></th> <!-- 보증시작일 -->
                                <td class="readonly_area">
                                    <input type="text" id="wartStartDt" name="wartStartDt" readonly class="form_datetimepicker ac"  />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.custNm" /></th><!-- 고객명 -->
                                <td>
                                    <input type="text" id="carOwnNm" name="carOwnNm" readonly class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.creDt" /></th><!-- 생산일자 -->
                                <td class="readonly_area">
                                    <input type="text" id="creDt" name="creDt" readonly class="form_datetimepicker ac"  />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.wrtrNm" /></th> <!-- 작성자 -->
                                <td>
                                    <input type="text" id="wrtrNm" name="wrtrNm" readonly class="form_input form_readonly" />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.telNo" /></th> <!-- 전화번호 -->
                                <td>
                                    <input type="text" id="telNo" name="telNo" readonly class="form_input form_readonly"  />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.hqApproveNm" /></th><!-- 판정인 -->
                                <td>
                                    <input type="text" id="judgNm" name="judgNm" readonly class="form_input form_readonly"  />
                                </td>
                                <th scope="row"><spring:message code="ser.lbl.judgDt" /></th> <%-- 판정일자 --%>
                                <td class="readonly_area">
                                    <input type="text" id="judgDt" name="judgDt" readonly class="form_datetimepicker ac" />
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><label><spring:message code="ser.lbl.diffCd" /></label></th> <!-- 난제고장 -->
                                <td>
                                    <input type="text" id="pblmErrCd" name="pblmErrCd" readonly class="form_comboBox form_readonly" />
                                </td>
                                <th scope="row"><label><spring:message code="ser.lbl.samBoCd" /></label></th> <!-- 삼보긴급 -->
                                <td>
                                    <input type="text" id="emgcAlrtCd" name="emgcAlrtCd" readonly class="form_comboBox form_readonly" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 파일업로드관련 include page -->
                <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfo.jsp"></jsp:include>
                <!-- 파일업로드관련 include page -->
            </section>
            <!-- //차종정보 -->

            <!-- 의견 -->
            <section class="right_areaStyle">
                <div class="header_area pt0">
                    <h2 class="title_basic"><spring:message code="ser.title.cont" /></h2> <!-- 의견사항 -->
                </div>
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:22%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.emgcReasonCont" /></th> <!-- 긴급정황설명 -->
                                <td>
                                    <textarea rows="4" id="emgcReasonCont" name="emgcReasonCont" cols="" readonly class="form_textarea form_readonly" style="height:80px"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.dlrProcOpnCnt" /></th> <!-- 딜러처리 의견 및 방안 -->
                                <td>
                                    <textarea rows="4" cols="" id="dlrProcOpnCont" name="dlrProcOpnCont" readonly class="form_textarea form_readonly" style="height:82px"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.bmpProcCont" /></span></th> <!-- BMP 처리의견 -->
                                <td>
                                    <textarea rows="4" cols="" id="bmpProcCont" name="bmpProcCont" maxLength="600" class="form_textarea" style="height:82px" data-json-obj="true"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_form mt5">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:100%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>
                                    <label class="label_check ml15"><input type="radio" disabled name="opnTp" id="opnTp_R" value="R" class="form_check">
                                        <span id="opnTpTx_R" name="opnTpTx" ><spring:message code="ser.lbl.errCont" /></span>
                                    </label> <!-- 오류설명 -->
                                    <label class="label_check"><input type="radio" disabled name="opnTp" id="opnTp_S" value="S" class="form_check">
                                        <span id="opnTpTx_S" name="opnTpTx"><spring:message code="ser.lbl.keepRepair" /></span>
                                    </label> <!-- 유지보수 -->
                                    <label class="label_check"><input type="radio" disabled name="opnTp" id="opnTp_A" value="A" class="form_check">
                                        <span id="opnTpTx_A" name="opnTpTx"><spring:message code="ser.lbl.proSolved" /></span>
                                    </label> <!-- 문제해결 -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //의견 -->
            <input type="hidden" id="approveNo" name="approveNo"   />
            <input type="hidden" id="judgId" name="judgId"  />
            <input type="hidden" id="docNo" name="docNo" data-json-obj="true" />
            <input type="hidden" id="statCd" name="statCd" data-json-obj="true" />
            <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true" />
          </form>
        </div>
    </div>
</div>
<!-- script -->
<script type="text/javascript">
/** 상태 **/
var statList = [];
<c:forEach var="obj" items="${stateDs}">
if("${obj.cmmCd}" != "O"){
    statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
</c:forEach>
var statMap = dms.data.arrayToMap(statList, function(obj){return obj.cmmCd;});

/** 난제고장 **/
var pblmErrList = [];
<c:forEach var="obj" items="${pblmErrDs}">
    pblmErrList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

/** 긴급경계 **/
var emgcAlrtList = [];
<c:forEach var="obj" items="${emgcAlrtDs}">
     emgcAlrtList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>


//그리드 선택 Row
var gridRow = 0;
var selectedYn = false;

$(document).ready(function() {

    /********************** 초기 데이터  설정 ***************************/
    /**조회조건 시작일자 **/
    $("#sFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

   /**조회조건 종료일자**/
    $("#sToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    /** 상태코드  콤보박스 **/
    $("#sStatCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:statList
        ,optionLabel:" "  // 선택
        ,index:0
    });

    /** 난제고장  콤보박스 **/
    $("#pblmErrCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:pblmErrList
        ,optionLabel:" "  // 선택
        ,enable:false
        ,index:0
    });

    /** 긴급경계  콤보박스 **/
    $("#emgcAlrtCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:emgcAlrtList
        ,optionLabel:" "  // 선택
        ,enable:false
        ,index:0
    });


    /**판정일자**/
    $("#judgDt").kendoExtMaskedDatePicker({

       format:"{0:<dms:configValue code='dateFormat' />}"
    });

    /**보증시작일**/
    $("#wartStartDt").kendoExtMaskedDatePicker({

       format:"{0:<dms:configValue code='dateFormat' />}"
    });

    /**생산일자**/
    $("#creDt").kendoExtMaskedDatePicker({
       format:"{0:<dms:configValue code='dateFormat' />}"
    });


   /**주행거리**/
    $("#runDistVal").kendoExtNumericTextBox({
       min:0
      ,format:"n0" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표

    });

    setStatCd = function(value){

        var valueCd = "";
        if(value == null)
            return valueCd;
        else valueCd = statMap[value].cmmCdNm;

        return valueCd;
    };

/********************** 버튼 설정 ***************************/
    /** 조회 **/
   $("#btnSearch").kendoButton({

       click:function(e){

           $("#grid").data("kendoExtGrid").dataSource.data([]);
           $("#grid").data("kendoExtGrid").dataSource.read();

       }
   });
    /** 접수 **/
   $("#btnAccept").kendoButton({

       click:function(e){
           requestSaveData("W");
       }
   });
    /** 유지보수 **/
   $("#btnKeepRepair").kendoButton({

       click:function(e){
           requestSaveData("S");
       }
   });

   /** 반송 **/
   $("#btnReturn").kendoButton({

       click:function(e){
           requestSaveData("R");
       }
   });

   /** 승인 **/
   $("#btnApproval").kendoButton({

       click:function(e){
           requestSaveData("A");
       }
   });

   /** 취소 **/
   /* $("#btnCancel").kendoButton({

       click:function(e){
           requestSaveData("Q");
       }
   });
 */

   /** 버튼 세팅 **/
   setButtonEnable = function (sFlag){

       switch(sFlag){

           case "A":/** 완료 **/
               $("#btnSearch").data("kendoButton").enable(true);       /** 조회 **/
               $("#btnAccept").data("kendoButton").enable(false);      /** 접수 **/
               $("#btnKeepRepair").data("kendoButton").enable(false);  /** 유지보수 **/
               $("#btnReturn").data("kendoButton").enable(false);      /** 반송 **/
               $("#btnApproval").data("kendoButton").enable(false);    /** 승인 **/
               //$("#btnCancel").data("kendoButton").enable(true);      /** 취소 **/
                     break;
           case "W":/** 접수 **/
               $("#btnSearch").data("kendoButton").enable(true);       /** 조회 **/
               $("#btnAccept").data("kendoButton").enable(false);      /** 접수 **/
               $("#btnKeepRepair").data("kendoButton").enable(true);  /** 유지보수 **/
               $("#btnReturn").data("kendoButton").enable(true);      /** 반송 **/
               $("#btnApproval").data("kendoButton").enable(true);    /** 승인 **/
               //$("#btnCancel").data("kendoButton").enable(true);      /** 취소 **/
                     break;
           case "Q":/** 제출 **/
               $("#btnSearch").data("kendoButton").enable(true);       /** 조회 **/
               $("#btnAccept").data("kendoButton").enable(true);      /** 접수 **/
               $("#btnKeepRepair").data("kendoButton").enable(false);   /** 유지보수 **/
               $("#btnReturn").data("kendoButton").enable(false);       /** 반송 **/
               $("#btnApproval").data("kendoButton").enable(false);     /** 승인 **/
               //$("#btnCancel").data("kendoButton").enable(false);    /** 취소 **/
                     break;
           case "R":/**반송 **/
               $("#btnSearch").data("kendoButton").enable(true);       /** 조회 **/
               $("#btnAccept").data("kendoButton").enable(false);      /** 접수 **/
               $("#btnKeepRepair").data("kendoButton").enable(false);  /** 유지보수 **/
               $("#btnReturn").data("kendoButton").enable(false);      /** 반송 **/
               $("#btnApproval").data("kendoButton").enable(false);    /** 승인 **/
               //$("#btnCancel").data("kendoButton").enable(true);      /** 취소 **/
                     break;
           case "S":/**유지보수 **/
               $("#btnSearch").data("kendoButton").enable(true);       /** 조회 **/
               $("#btnAccept").data("kendoButton").enable(false);      /** 접수 **/
               $("#btnKeepRepair").data("kendoButton").enable(false);  /** 유지보수 **/
               $("#btnReturn").data("kendoButton").enable(true);       /** 반송 **/
               $("#btnApproval").data("kendoButton").enable(true);     /** 승인 **/
               //$("#btnCancel").data("kendoButton").enable(true);     /** 취소 **/
                     break;
           default :
               $("#btnSearch").data("kendoButton").enable(true);       /** 조회 **/
               $("#btnAccept").data("kendoButton").enable(false);      /** 접수 **/
               $("#btnKeepRepair").data("kendoButton").enable(false);  /** 유지보수 **/
               $("#btnReturn").data("kendoButton").enable(false);      /** 반송 **/
               $("#btnApproval").data("kendoButton").enable(false);    /** 승인 **/
               //$("#btnCancel").data("kendoButton").enable(false);    /** 취소 **/

                    break;
       }
   };
   setFileButton("N");

/********************** 버튼 설정 ***************************/

/********************** 초기 데이터  설정 ***************************/

   /** 저장 데이터  **/
   function requestSaveData(statCd){

       /* validation Check*/
        if(!saveDataValidation(statCd)){
           return;
        }

        $("#statCd").val(statCd);


        var fileGrid = $("#fileGrid").data("kendoExtGrid");

        var formSaveData = $("#sanbaoTecAprForm").serializeObject($("#sanbaoTecAprForm").serializeArrayInSelector("[data-json-obj='true']"));
        formSaveData.runDistVal = $("#runDistVal").data("kendoExtNumericTextBox").value();
        formSaveData.creDt = $("#creDt").data("kendoExtMaskedDatePicker").value();
        formSaveData.wartStartDt = $("#wartStartDt").data("kendoExtMaskedDatePicker").value();
        formSaveData.opnTp = (statCd == "Q") ? "":statCd;



        //var validator = $("#kendoSanbaoReqForm").kendoExtValidator().data("kendoSanbaoReqForm");

            $.ajax({
                url:"<c:url value='/ser/wac/sanbaoTechAppr/updateSanbaoTechApprove.do' />"
               ,data:JSON.stringify(formSaveData)
               ,type:'POST'
               ,dataType:'json'
               ,contentType:'application/json'
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function(result , textStatus){

                   selectedYn = dms.string.isEmpty($("#sStatCd").val());
                   if(selectedYn){
                       gridRow = $("#grid").data("kendoExtGrid").select().index();
                       $("#grid").data("kendoExtGrid").dataSource.data([]);
                       $("#grid").data("kendoExtGrid").dataSource.read();
                   }


                   $("#approveNo").val(result);

                   fileGrid.dataSource.data([]);
                   fileGrid.dataSource.read();

                   setButtonEnable($("#statCd").val());
                   setOpnTpSet($("#statCd").val());

                  // dms.notification.success("<spring:message code='global.info.success' />");
               }
               ,beforeSend:function(xhr){
                   dms.loading.show($("#resizableContainer"));
               }
               ,complete:function(xhr,status){
                   dms.loading.hide($("#resizableContainer"));
               }
            });
   }

   /** data Validation Check**/
   function saveDataValidation(statCd){


       var msgText;
       var result = true;
       if( dms.string.isEmpty(  $("#vinNo").val() ) ) {
           msgText = "<spring:message code='ser.lbl.vinNo' var='global_lbl_vinNo' />"+
                     "<spring:message code='global.info.required.field' arguments='${global_lbl_vinNo}' />";
                     result =  false;

       }else if( dms.string.isEmpty($("#bmpProcCont").val()) && (statCd == "A") ){
           <enhance:out escapeXml="false">
           msgText = "<spring:message code='ser.lbl.bmpProcCont' var='bmpProcCont' />"+
                     "<spring:message code='global.info.required.field' arguments='${bmpProcCont}' />";
                     $("#bmpProcCont").focus();
                     result =  false;
           </enhance:out>
       }
       if(!result) dms.notification.warning(msgText);

       return result;


   };

   /** 결과값 Set **/
   getResultDataSet = function(result){


       $("#docNo").val(dms.string.strNvl(result.docNo));
       $("#approveNo").val(dms.string.strNvl(result.approveNo));
       $("#bmpProcCont").val(dms.string.strNvl(result.bmpProcCont));
       $("#carOwnerId").val(dms.string.strNvl(result.carOwnerId));
       $("#carOwnerNm").val(dms.string.strNvl(result.carOwnerNm));
       $("#dlrProcOpnCont").val(dms.string.strNvl(result.dlrProcOpnCont));
       $("#emgcReasonCont").val(dms.string.strNvl(result.emgcReasonCont));
       $("#enginNo").val(dms.string.strNvl(result.enginNo));
       $("#fileKeyNm").val(dms.string.strNvl(result.fileKeyNm));
       $("#statCd").val(dms.string.strNvl(result.statCd));
       $("#vinNo").val(dms.string.strNvl(result.vinNo));
       $("#dlrCd").val(dms.string.strNvl(result.dlrCd));


        if(dms.string.isNotEmpty(result.pblmErrCd)  ){
           $("#pblmErrCd").data("kendoExtDropDownList").value(dms.string.strNvl(result.pblmErrCd));
       }else {
           $("#pblmErrCd").data("kendoExtDropDownList").value("");
       }

       if(dms.string.isNotEmpty(result.emgcAlrtCd)  ){
           $("#emgcAlrtCd").data("kendoExtDropDownList").value(dms.string.strNvl(result.emgcAlrtCd));
       }else{
           $("#emgcAlrtCd").data("kendoExtDropDownList").value("");
       }



       $("#runDistVal").data("kendoExtNumericTextBox").value( Number(dms.string.defaultString(result.runDistVal,"0")) );
       $("#wartStartDt").data("kendoExtMaskedDatePicker").value( dms.string.strNvl(result.wartStartDt) );
       $("#creDt").data("kendoExtMaskedDatePicker").value( dms.string.strNvl(result.creDt) );
       $("#judgDt").data("kendoExtMaskedDatePicker").value( dms.string.strNvl(result.judgDt) );
       $("#judgId").val(dms.string.strNvl(result.judgId));
       $("#judgNm").val(dms.string.strNvl(result.judgNm));
       $("#telNo").val(dms.string.strNvl(result.telNo));

       setOpnTpSet(result.opnTp);


   };

   // 내용checkBox 설정
   setOpnTpSet = function(opnTp){

       $("input[name='opnTp']").each(function(){
           if(!this.checked){
               $("input[name='opnTp']").prop("checked", false);
               $("span[name='opnTpTx']").removeClass("txt_label bg_blue");
           }
       });

       if(dms.string.strNvl(opnTp) != "" && dms.string.strNvl(opnTp) != "Q"){
           eval($("#opnTp_"+opnTp)).prop("checked", true);
           eval($("#opnTpTx_"+opnTp)).addClass("txt_label bg_blue");
       }

   };

    /** 그리드 **/
    $("#grid").kendoExtGrid({
        gridId:"G-SER-0803-165601"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/wac/sanbaoTechAppr/selectSanbaoTechApproveMains.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sFromDt"] = $("#sFromDt").data("kendoExtMaskedDatePicker").value();
                         params["sToDt"] = $("#sToDt").data("kendoExtMaskedDatePicker").value();
                         params["sVinNo"] = $("#sVinNo").val();
                         params["sStatCd"] = $("#sStatCd").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number" }
                       ,vin:{type:"string" }
                       ,statCd:{type:"string"}
                       ,dlrSignReqDt:{type:"date" }
                       ,judgDt:{type:"date"}
                       ,judgNm:{type:"number"}
                       ,delayDay:{type:"number"}
                    }

                 }//model
           }//schema
        }//dataSource
        ,autoBind:true
        ,editable:false
        ,sortable:false
        ,height:150
        ,resizable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
            if(selectedYn ){
                e.sender.select(e.sender.tbody.find("tr")[gridRow]);
            }
        }
        ,change:function (e){

            var selectedVal = this.dataItem(this.select());

            var params = {};
            params["sDlrCd"] = selectedVal.dlrCd;
            params["sVinNo"] = selectedVal.vinNo;
            params["sDocNo"] = selectedVal.docNo;


            $.ajax({
                url:"<c:url value='/ser/wac/sanbaoTechAppr/selectSanbaoTechApproveByKey.do' />"
               ,data:JSON.stringify(params)
               ,type:"POST"
               ,dataType:"json"
               ,contentType:"application/json"
               ,error:function(jqXHR,status,error) {

                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
               }
               ,success:function (result){


                   getResultDataSet(result);
                   $("#fileGrid").data("kendoExtGrid").dataSource.read();

                   setButtonEnable($("#statCd").val());
                  // dms.notification.success("<spring:message code='global.info.searchSuccess' />");

                }

            }) ;

        }
        ,columns:[
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"docNo", title:"<spring:message code='ser.lbl.docNo' />", width:70, attributes :{"class":"al"}}
                   ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:100, attributes :{"class":"al"}}
                   ,{field:"statCd", title:"<spring:message code='ser.lbl.statNm' />", width:50
                       ,attributes :{"class":"al"}
                       ,template:"#=setStatCd(statCd)#"
                       ,editor:function(container, options){
                           $('<input required data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,dataValueField:"cmmCd"
                               ,dataSource:statList
                           });
                           $('<span class="k-invalid-msg" data-for="statCd"></span>').appendTo(container);
                          }


                   }
                   ,{field:"dlrSignReqDt", title:"<spring:message code='ser.lbl.fincReqDt' />", width:80
                       ,attributes :{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                   }
                   ,{field:"judgDt", title:"<spring:message code='ser.lbl.judgDt' />", width:80
                       ,attributes :{"class":"ac"}
                       ,format:"{0:<dms:configValue code='dateFormat' />}"
                   }
                   ,{field:"judgNm", title:"<spring:message code='ser.lbl.hqApproveNm' />", width:100, attributes :{"class":"ar"}}
                   ,{field:"delayDay", title:"<spring:message code='ser.lbl.delayDay' />", width:50, attributes :{"class":"ar"}}
                 ]

    });


});
</script>
<!-- //script -->

