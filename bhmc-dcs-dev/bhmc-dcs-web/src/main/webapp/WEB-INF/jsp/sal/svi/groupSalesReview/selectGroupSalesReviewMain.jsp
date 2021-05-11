<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script src="<c:url value='/resources/js/bxslider/jquery.bxslider.min.js' />"></script>

<div id="resizableContainer">
    <!-- 법인 - 집단판매 심사 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.grpSalesReview" /></h1> <!-- 법인 - 집단판매 심사 -->
            <div class="left_area">
                <span class="txt_label bg_green">${usrId} : Lv${usrEvalGrade}</span>
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-I-12404" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12403" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnAllEval" class="btn_m"><spring:message code='sal.btn.allEval' /><!-- 일괄심사 --></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12402" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12401" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnExcel"><spring:message code="global.btn.excelExport" /></button> <!-- 엑셀다운로드 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per"  role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <%-- <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col> --%>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.officeNm' /></th><!-- 사무소 -->
                        <td>
                            <!-- Q21012900013	data-type="multicombo" 集团审批界面，项目类型和办事处多选功能 data-type="multicombo"  type="text"  form_comboBox jiaMing 2021-2-24 -->
                            <input id="sOffCd" type="text" data-type="multicombo"  class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.applNumber" /></th> <!-- 신청번호 -->
                        <td>
                            <input name="sApplyNo" id="sApplyNo" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.dlrCd" /></th><!-- 딜러코드  -->
                        <td>
                            <input name="sDlrCd" id="sDlrCd" type="text" class="form_input"">
                        </td>
                    </tr>
                    <tr>

                        <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                        <td>
                            <input name="sCustNm" id="sCustNm" type="text" value="" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.item" /></th> <!-- 항목 -->
                        <td>
                            <!-- Q21012900013	data-type="multicombo" 集团审批界面，项目类型和办事处多选功能 data-type="multicombo"  type="text"  form_comboBox jiaMing 2021-2-24 -->
                            <input name="sAtcDstinCd" id="sAtcDstinCd" type="text" data-type="multicombo" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.evalYn" /></th> <!-- 심사여부 -->
                        <td>
                            <input name="sEvalRsltYn" id="sEvalRsltYn" type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.fincReqDt" /></th> <!-- 신청일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sApplyDtS" id="sApplyDtS" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sApplyDtE" id="sApplyDtE" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.evalDt" /></th> <!-- 심사일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sLastStartUpdt" id="sLastStartUpdt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sLastEndUpdt" id="sLastEndUpdt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.evalStatus" /></th> <!-- 심사상태 -->
                        <td>
                            <input name="sApproveCd" id="sApproveCd" type="text" class="form_comboBox">
                        </td>

                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 끝 -->
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>

    <!-- 일괄심사팝업 시작 -->
       <section id="evalPopupWindow" class="pop_wrap">
            <div class="header_area">
                <div class="btn_right" >
                    <button class="btn_s" id="btnAllEvalSave"><spring:message code="global.btn.fix" /></button> <!-- 확정 -->
                </div>
            </div>
            <div class="table_form form_width_100per">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:20%;">
                        <col style="width:10%;">
                        <col >
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.evalRslt" /></th> <!-- 심사결과 -->
                            <td>
                                <ul class="tabmenu">
                                    <li id="popupEvalRsltY" class="on"><button type="button"><spring:message code="sal.lbl.approvals" /></button></li> <!-- 일괄심사승인 탭-->
                                    <li id="popupEvalRsltN" ><button type="button"><spring:message code="sal.btn.reject" /></button></li>        <!-- 일괄심사불승인 탭 -->
                                    <input type="hidden" id="popupEvalRsltYn" name="popupEvalRsltYn" value="Y"/>
                                </ul>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.evalRemark" /></th> <!-- 심사평가 -->
                            <td colspan="3">
                                <textarea id="popupRemark" name="popupRemark" rows="7" cols="" class="form_textarea" required data-name="<spring:message code="global.lbl.cont" />" ></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    <!-- 일괄심사팝업 종료 -->

    <!-- 집단판매 승인 상세 정보 페이지 -->
        <c:import url="/WEB-INF/jsp/sal/svi/groupSalesReview/selectGroupSalesReviewDetail.jsp" />
    <!-- 집단판매 승인 상세 정보 페이지 -->
    </section>
</div>
<!-- #스크립트 영역# -->
<script type="text/javascript">

var sysDate = "${sysDate}";
var fifteenDayBf = "${fifteenDayBf}";
var detailPopOpenYn = "N";
var evalPopOpenYn = "N";
var usrEvalGrade = "${usrEvalGrade}";
var loginUsrId = "${usrId}";
var wrkDstinCd = "${wrkDstinCd}";

/************* 상태 SELECT BOX  *******************/
var evalYnList = [];
<c:forEach var="obj" items="${evalYnInfo}">
    evalYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var evalYnMap = dms.data.arrayToMap(evalYnList, function(obj){return obj.cmmCd;});
/************* 상태 SELECT BOX  *******************/


/************* 상태 SELECT BOX  *******************/
var approveCdList = [];
<c:forEach var="obj" items="${approveCdInfo}">
if("${obj.cmmCd}" != 'A'){
    approveCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
</c:forEach>
var approveCdArr = dms.data.arrayToMap(approveCdList, function(obj){return obj.cmmCd;});
/************* 상태 SELECT BOX  *******************/

/************* 항목 SELECT BOX  *******************/
var atcDstinCdList = [];
<c:forEach var="obj" items="${atcDstinCdInfo}">
atcDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var atcDstinArr = dms.data.arrayToMap(atcDstinCdList, function(obj){return obj.cmmCd;});
/************* 항목 SELECT BOX  *******************/

/************* 딜러지역 SELECT BOX  *******************/
var distCdList = [];
<c:forEach var="obj" items="${distCdInfo}">
if("${obj.cmmCd}" != 'AA'){
    distCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
}
</c:forEach>
var distCdArr = dms.data.arrayToMap(distCdList, function(obj){return obj.cmmCd;});
/************* 딜러지역 SELECT BOX  *******************/


/************* 심사여부 SELECT BOX  ********************/
var evalRsltYnList = [];
<c:forEach var="obj" items="${evalYnInfo}">
evalRsltYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var evalRsltYnArr = dms.data.arrayToMap(evalRsltYnList, function(obj){return obj.cmmCd;});
/************* 심사여부 SELECT BOX  *******************/

/************* 사업부 SELECT BOX  *******************/
/* var sdptDs = [];
<c:forEach var="obj" items="${sdptList}">
    sdptDs.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
</c:forEach> */
/************* 사업부 SELECT BOX  *******************/

//사무소
var officeList = [];
<c:forEach var="obj" items="${officeList}">
    officeList.push({"distOfficeCd":"${obj.distOfficeCd}", "distOfficeNm":"${obj.distOfficeNm}"});
</c:forEach>

// 차종
var carLineCdDSList = [];
var carLineCdObj = {};
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdDSList.push({carlineNm:"${obj.carlineCdNm}", carlineCd:"${obj.carlineCd}"});
    carLineCdObj["${obj.carlineCd}"] = "${obj.carlineCdNm}";
</c:forEach>

// 그리드 모델 콤보 DataSource
var modelCdDSList = [];
var modelCdObj = {};

// 그리드 OCN 콤보 DataSource
var ocnCdDSList = [];
var ocnCdObj = {};

// 그리드 외장색 콤보 DataSource
var extColorCdDSList = [];
var extColorCdObj = {};

// 그리드 내장색 콤보 DataSource
var intColorCdDSList = [];
var intColorCdObj = {};


$(document).ready(function () {

    //사업부
    /* $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"sdptNm"
       ,dataValueField:"sdptCd"
       ,dataSource:sdptDs
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOffCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.sdptCd == ""){
               $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOffCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
               ,data:JSON.stringify({"sSdptCd":dataItem.sdptCd})
               ,async:false
           });
           $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    }); */

    // 사무소
    //$("#sOffCd").kendoExtDropDownList({
    //    dataTextField:"distOfficeNm"
    //   ,dataValueField:"distOfficeCd"
    //   ,dataSource:officeList
       /* ,select:function(e){
           var dataItem = this.dataItem(e.item);

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerSung.do' />"
               ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":dataItem.distOfficeCd})
               ,async:false
           });
       } */
      // ,optionLabel:" "   // 전체
    //});
    
    //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 start
    $("#sOffCd").kendoExtMultiSelectDropDownList({
         dataTextField :"distOfficeNm"
        ,dataValueField:"distOfficeCd"
        ,dataSource:officeList
        ,index:0
        ,dataBound:function(){
            var current = this.value();
            this._savedOld = current.slice(0);
        }
        /*,select:function(e){
            var selectRoTp = e.dataItem.cmmCd;
            if(dms.string.isEmpty(selectRoTp)){
                $("#sOffCd").data("kendoExtMultiSelectDropDownList").refresh();
                $("#sOffCd").data("kendoExtMultiSelectDropDownList").value([]);
            }
        } */
    });
   //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 start

    //$("#sOffCd").data("kendoExtDropDownList").enable(false);


    /* //성
    $("#sSungCd").kendoExtDropDownList({
        dataTextField:"saleDlrSungNm"
        ,dataValueField:"saleDlrSungCd"
        ,optionLabel:" "    // 전체
        ,select:function(e){
            var dataItem = this.dataItem(e.item);

            $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sCityCd").data("kendoExtDropDownList").enable(true);

            if(dataItem.sungCd == ""){
                $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sCityCd").data("kendoExtDropDownList").enable(false);
                return false;
            }

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/cmm/selectDealerCity.do' />"
                ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":$("#sOffCd").data("kendoExtDropDownList").value(),"sSaleDlrSungCd":dataItem.saleDlrSungCd})
                ,async:false
            });
            $("#sCityCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
    $("#sSungCd").data("kendoExtDropDownList").enable(false);


    //시
    $("#sCityCd").kendoExtDropDownList({
        dataTextField:"saleDlrCityNm"
        ,dataValueField:"saleDlrCityCd"
        ,optionLabel:" "   // 전체
    });

    $("#sCityCd").data("kendoExtDropDownList").enable(false);
 */
    $("#evalRsltYn").val("Y");


    /******************************************************************************************************************************************/

    /*
     * max 500으로 지정. 여백이 있는경우는 줄여야함
     */

     $("#imageViewWindow").kendoWindow({
         animation:false
         ,draggable:true
         ,modal:true
         ,resizable:true
         ,visible:false
         ,title:"预览"
         ,width:"792px"
     }).data("kendoWindow");


     $("#fileViewWindow").kendoWindow({
         animation:false
         ,draggable:false
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"添加文件"
         ,width:"700px"
         ,height:"250px"
     }).data("kendoWindow");


     $("#detailViewWindow").kendoWindow({
         animation:false
         ,draggable:true
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"<spring:message code="sal.title.grpSalesReview" />"                        //상세보기
         ,width:"950px"
         ,height:"580px"
         ,open:function(e){
             detailPopOpenYn = "Y";
         }
         ,close:function(e){
             detailPopOpenYn = "N";
         }
     }).data("kendoWindow");




     $("#evalPopupWindow").kendoWindow({
         animation:false
         ,draggable:false
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"<spring:message code='sal.btn.allEval' />"                             //일괄심사
         ,width:"650px"
         ,height:"200px"
         ,open:function(e){
             evalPopOpenYn  = "Y";
         }
         ,close:function(e){
             evalPopOpenYn  = "N";
         }
     }).data("kendoWindow");

    /**
    * 상태 콤보박스
    */
    $("#sApproveCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:approveCdList
       ,optionLabel:" "  // 전체
    });

     /**
      * 항목 콤보박스
      */
      /**
      Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 start
      $("#sAtcDstinCd").kendoExtDropDownList({
          dataTextField:"cmmCdNm"
         ,dataValueField:"cmmCd"
         ,dataSource:atcDstinCdList
         ,optionLabel:" "  // 전체
      });
     **/
     $("#sAtcDstinCd").kendoExtMultiSelectDropDownList({
         dataTextField :"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:atcDstinCdList
        ,index:0
        ,dataBound:function(){
            var current = this.value();
            this._savedOld = current.slice(0);
        }
        
    });
     //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 end

      /**
       * 심사여부 콤보박스
       */
       $("#sEvalRsltYn").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:evalRsltYnList
          ,optionLabel:" "  // 전체
          ,value:"02"
       });

    /**
     * 시작 신청일자 (From)
     */
     $("#sApplyDtS").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:fifteenDayBf
     });
     /**
     * 종료 신청일자 (From)
     */
     $("#sApplyDtE").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:sysDate
     });

     /**
      * 시작 심사일자 (From)
      */
      $("#sLastStartUpdt").kendoExtMaskedDatePicker({
          format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
      });
     /**
      * 종료 심사일자 (From)
      */
      $("#sLastEndUpdt").kendoExtMaskedDatePicker({
          format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
      });

      /**
       * 배정 희망일자
       */

       $("#carAllocHopeDt").kendoExtMaskedDatePicker({
           format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
      });

     // 심사결과:승인
      $("#evalRsltY").click(function(){

          $(this).siblings("li").removeClass("on");
          $(this).addClass("on");
          $("#evalRsltYn").val("Y");
      });
     // 심사결과:불승인
      $("#evalRsltN").click(function(){

          $(this).siblings("li").removeClass("on");
          $(this).addClass("on");
          $("#evalRsltYn").val("N");
      });

      // 일괄심사결과:승인
      $("#popupEvalRsltY").click(function(){

          $(this).siblings("li").removeClass("on");
          $(this).addClass("on");
          $("#popupEvalRsltYn").val("Y");
      });
     // 일괄 심사결과:불승인
      $("#popupEvalRsltN").click(function(){

          $(this).siblings("li").removeClass("on");
          $(this).addClass("on");
          $("#popupEvalRsltYn").val("N");
      });


    /**
     * 딜러지역 콤보박스
     */
     $("#distCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:distCdList
        ,enable:false
     });

    /**
     * 항목 콤보박스
     */
     $("#atcDstinCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:atcDstinCdList
        ,enable:false
     });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            fnReSet();
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

   //버튼 - 엑셀다운로드
    $("#btnExcel").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"groupSalesReviewService"
               // ,"templateFile":"GroupSalesReview_Tpl.xlsx"
                ,"templateFile":"GroupSalesApplication_Tpl.xlsx"
                ,"fileName":"groupSales.xlsx"
                //,"sOffCd":$("#sOffCd").data("kendoExtDropDownList").value()
                //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 start
                ,"sOffCdList":$("#sOffCd").data("kendoExtMultiSelectDropDownList").value()
                //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 end
                ,"sApplyNo":$("#sApplyNo").val()
                //,"sDistCd":$("#sOffCd").data("kendoExtDropDownList").value()
                //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 start
                ,"sDistCdList":$("#sOffCd").data("kendoExtMultiSelectDropDownList").value()
                //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 end
                ,"sDlrCd":$("#sDlrCd").val()
                ,"sCustNm":$("#sCustNm").val()
                ,"sApproveCd":$("#sApproveCd").data("kendoExtDropDownList").value()
                //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 start
                //,"sAtcDstinCd":$("#sAtcDstinCd").data("kendoExtDropDownList").value()
                ,"sAtcDstinCdList":$("#sAtcDstinCd").data("kendoExtMultiSelectDropDownList").value()
                //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 end
                ,"sApplyDtS":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sApplyDtS").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sApplyDtE":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sApplyDtE").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sLastStartUpdt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sLastStartUpdt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sLastEndUpdt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sLastEndUpdt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sUsrEvalGrade":usrEvalGrade
                ,"sEvalRsltYn":$("#sEvalRsltYn").data("kendoExtDropDownList").value()
                ,"sWrkDstinCd":wrkDstinCd
                ,"sLoginUsrId":loginUsrId
                ,"sListType":"LIST"
            });
        }
    });

    //버튼 - 초기화
    $("#btnReset").kendoButton({
        click:function(e) {

            $("#remark").val("");
            $("#evalRsltYn").val("");
            $("#evalRsltY").click();

        }
    });

    //버튼 - 출력
    $("#btnPrint").kendoButton({
        click:function(e) {
            var sDlrCd = $("#dlrCd").val();
            var sUsrId = $("#usrId").val();
            var sReqSeq = $("#reqSeq").val();

            var printParam =  "&sDlrCd="+sDlrCd+"&sUsrId="+sUsrId+"&sReqSeq="+sReqSeq;
            var printReportUrl = "<c:url value='/ReportServer?reportlet=sale/screenRelation/selectGroupOrdEvalRpt.cpt'/>"+printParam;
            var newWindow=open(printReportUrl,"",'top=0,left=0,width=925,height=1200,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
        }
    });

    //버튼 - 일괄심사
    $("#btnAllEval").kendoButton({
        click:function(e) {
            //심사그리드

            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            var rows = grid.select();

            var selectedCnt = 0;
            $(".grid-checkbox-item").each( function(index , obj){
                var dataItem = grid.dataSource._data;
                if( $(obj).hasClass("k-state-selected")){
                    var evalYn = dataItem[index].evalYn;
                    //미심사 대상만 담음.
                    if(evalYn == "02"){
                        selectedCnt++;
                    }
                }
            });

            if( 1 >= selectedCnt ){
                return dms.notification.warning("<spring:message code='sal.info.evlAllMsg' />");
            }

          //일괄심사 팝업 오픈
            var win = $("#evalPopupWindow").data("kendoWindow");
            win.center();
            win.open();
        }
    });

    //버튼 - 일괄심사 확정
    $("#btnAllEvalSave").kendoButton({
        click:function(e) {

            /* dms.window.confirm({
                message:"<spring:message code='global.btn.save' var='save' /><spring:message code='global.info.cnfrmMsg' arguments='${save}' />"
                ,title :"<spring:message code='global.btn.save' />"
                ,callback:function(result){
                    if(result){
                        $("#btnSave").click();
                    }else{
                        return false;
                    }
                }
            }); */

            $("#btnSave").click();
        }
    });

    // 상세정보
    $("#btnViewDetail").kendoButton({
        click:function(e){


            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if(selectedItem != null){

                var rows = grid.select();
                var selectedCnt = 0;
                $(".grid-checkbox-item").each( function(index , obj){
                    var dataItem = grid.dataSource._data;
                    if( $(obj).hasClass("k-state-selected")){
                        var evalYn = dataItem[index].evalYn;
                        //미심사 대상만 담음.
                        if(evalYn == "02"){
                            selectedCnt++;
                        }
                    }
                });

                if(selectedCnt > 1 ){
                    dms.notification.warning(//{0}을 {1}건만 선택하십시오.
                            "<spring:message code='global.lbl.applNumber' var='applNumber' />"+
                            //"<spring:message code='global.lbl.dtlInfo' var='arguMsg' />"+
                            "<spring:message code='global.info.isSelectChk' arguments='${applNumber},1'/>"
                            );
                    return;
                }

                if ( dms.string.isNotEmpty(selectedItem) ){
                    viewDetail(selectedItem);

                } else {
                    // {상세정보}을(를) 확인하여 주세요.
                    dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                    return;
                }
            }
        }
        , enable:false
    });

    // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select());
        if ( dms.string.isNotEmpty(selectedItem) ){

             viewDetail(selectedItem);

        } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
        }
     });

    // 상세조회 후 팝업오픈
    viewDetail = function (selectedVal){

        if( dms.string.isNotEmpty(selectedVal) ){

          //팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
            var win = $("#detailViewWindow").data("kendoWindow");
            win.center();
            win.open();
            detailSet(selectedVal);
        } else {
            // {상세정보}을(를) 확인하여 주세요.
            dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
            return;
        }
    };


    //상세조회
    detailSet = function(dataItem){

        fnReSet();
        var params = {
                "sDlrCd":dataItem.dlrCd
                ,"sUsrId":dataItem.usrId
                ,"sReqSeq":dataItem.reqSeq
                ,"sWrkDstinCd":wrkDstinCd
                //,"sReqNo":dataItem.reqNo
                };

        $.ajax({
            url:"<c:url value='/sal/svi/groupSalesReview/selectGroupSlaesReviewDtl.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error){
                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
            },
            success:function(detailData, textStatus){

                if( detailData != null ){

                    if( dataItem.reqNo == usrEvalGrade){

                        $("#evalRsltYn").addClass("disabled");
                        $("#evalRsltY").prop("disabled","disabled");
                        $("#evalRsltN").prop("disabled","disabled");

                        $("#remark").addClass("disabled");
                        $("#remark").prop("disabled","disabled");

                        //$("#btnSave").data("kendoButton").enable(true);
                        $("#btnSave").data("kendoButton").enable(false);
                    }else{

                        if(dataItem.evalYn != '01'){
                            $("#evalRsltYn").removeClass("disabled");
                            $("#evalRsltY").prop("disabled","");
                            $("#evalRsltN").prop("disabled","");

                            $("#remark").removeClass("disabled");
                            $("#remark").prop("disabled","");

                            $("#btnSave").data("kendoButton").enable(true);
                        }else{
                            $("#evalRsltYn").addClass("disabled");
                            $("#evalRsltY").prop("disabled","disabled");
                            $("#evalRsltN").prop("disabled","disabled");

                            $("#remark").addClass("disabled");
                            $("#remark").prop("disabled","disabled");

                            //$("#btnSave").data("kendoButton").enable(true);
                            $("#btnSave").data("kendoButton").enable(false);
                        }
                    }
                    $("#reqQty").text(dataItem.reqQty);
                    $("#remark").val("");

                    if(detailData.approveCd == "C"){ //승인
                        $("#evalRsltY").attr("class", "on");
                        $("#evalRsltN").attr("class", "");
                        $("#evalRsltYn").val("Y");
                        $("input[name='evalRslt']:radio:input[value=Y]").prop("checked", true);
                    }else if(detailData.approveCd == "D"){
                        $("#evalRsltY").attr("class", "");
                        $("#evalRsltN").attr("class", "on");
                        $("input[name='evalRslt']:radio:input[value=N]").prop("checked", true);
                    }else{
                        $("#evalRsltY").attr("class", "");
                        $("#evalRsltN").attr("class", "");
                    }

                    $('#grid2').data('kendoExtGrid').dataSource.data([]);
                    $('#grid3').data('kendoExtGrid').dataSource.data([]);

                    detailInfo(detailData);
                }
            }
        });
    };



    fnReSet= function (){

        $("#groupSaleForm").get(0).reset();
        $("#atcDstinCd").data('kendoExtDropDownList').value("");

        var grid = $('#grid').data('kendoExtGrid');
        //grid.clearSelection();
        $('#grid2').data('kendoExtGrid').dataSource.data([]);
        $('#grid3').data('kendoExtGrid').dataSource.data([]);
    };


 /******************************* 버튼 영역 end **************************************************************/

    // 집단판매 메인 그리드 1번
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0207-171600"
        ,dataSource:{
            transport:{
                 read:{
                     url:"<c:url value='/sal/svi/groupSalesReview/selectGroupSalesReview.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;


                         //params["sDiviCd"] = $("#sDiviCd").data("kendoExtDropDownList").value();        // 사업부
                         //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 start
                         //params["sOffCd"] = $("#sOffCd").data("kendoExtDropDownList").value();          // 사무소
                         var sOffCdList = $("#sOffCd").data("kendoExtMultiSelectDropDownList").value();
                         if(dms.string.isEmpty(sOffCdList[0])){
                        	 sOffCdList.splice(0,1);
                         }
                         params["sOffCdList"]     = sOffCdList;
                         //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 end
                         //params["sSungCd"] = $("#sSungCd").data("kendoExtDropDownList").value();        // 성
                        // params["sCityCd"] = $("#sCityCd").data("kendoExtDropDownList").value();        // 도시
                         params["sApplyNo"] = $("#sApplyNo").val();                                  // 신청번호
                       //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 start
                         //params["sDistCd"] = $("#sOffCd").data("kendoExtDropDownList").value();         // 딜러지역
                         params["sDistCdList"]     = sOffCdList;
                         //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 end
                         params["sDlrCd"] = $("#sDlrCd").val();                                      // 딜러코드
                         params["sCustNm"] = $("#sCustNm").val();                                    // 고객명
                         params["sApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();  // 상태
                         //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 start
                         //params["sAtcDstinCd"] = $("#sAtcDstinCd").data("kendoExtDropDownList").value();// 항목
                          var sAtcDstinCdList = $("#sAtcDstinCd").data("kendoExtMultiSelectDropDownList").value();
                         if(dms.string.isEmpty(sAtcDstinCdList[0])){
                        	 sAtcDstinCdList.splice(0,1);
                         }
                         params["sAtcDstinCdList"]     = sAtcDstinCdList;
                         //Q21012900013	集团审批界面，项目类型和办事处多选功能  JiaMing 2021-2-24 end
                         params["sApplyDtS"] = $("#sApplyDtS").data("kendoExtMaskedDatePicker").value();// 신청일자
                         params["sApplyDtE"] = $("#sApplyDtE").data("kendoExtMaskedDatePicker").value();
                         // 상신일자(최종 데이터 변경일자)
                         params["sLastStartUpdt"] = $("#sLastStartUpdt").data("kendoExtMaskedDatePicker").value();
                         params["sLastEndUpdt"] = $("#sLastEndUpdt").data("kendoExtMaskedDatePicker").value();

                         //로그인 USER 심사등급
                         params["sUsrEvalGrade"] = usrEvalGrade;
                         params["sEvalRsltYn"] = $("#sEvalRsltYn").data("kendoExtDropDownList").value();
                         params["sWrkDstinCd"] = wrkDstinCd;

                         //wrkDstinCd

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                  model:{
                      id:"rnum",
                      fields:{
                           dlrCd:{type:"string"}             //딜러코드
                          ,usrId:{type:"string"}            //등록자
                          ,reqSeq:{type:"number"}           //신청일련번호
                          ,officeNm:{type:"string"}           //딜러지역
                          ,dlrNm:{type:"string"}            //딜러이름
                          ,applyNo:{type:"string"}          //신청번호
                          ,atcDstinCd:{type:"string"}       //항목
                          ,custNm:{type:"string"}           //고객명
                          ,reqQty:{type:"number"}           //수량
                          ,assignQty:{type:"number"}        //배정수량
                          ,applyDt:{type:"date"}            //신청일자
                          ,evalDt:{type:"date"}             //심사일자
                          ,approveCd:{type:"string"}        //상태
                          ,evalRsltYn:{type:"string"}       //심사여부
                          ,realAmt:{type:"number"}          //지도가격
                          ,contractDocSeq:{type:"string"}   //계약문서일렬번호
                          ,crnDocSeq:{type:"string"}        //사업자등록증일련번호
                          ,etcDocSeq:{type:"string"}        //기타문서일련번호
                          ,addFileSeq:{type:"string"}       //추가자료일련번호
                          ,telNo:{type:"string"}            //전화번호
                          ,dlrNm:{type:"string"}            //딜러명
                          ,officeNm:{type:"string"}         //사무소명
                          ,evalYn:{type:"string"}
                          ,reqNo:{type:"number"}           //심ㅅㅏ일련번호
                      }
                 }
             }
        }
        ,height:460
        ,editable :false
        ,autoBind:false
        ,selectable:"rows"
        ,pageable:true
        ,navigatable:true
        ,dataBound:function (e){

            var rows = e.sender.tbody.children();
            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);
                 if(dataItem.evalYn == "02"){
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled");
                }else{
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled","disabled");
                }
            });
        }
        ,change:function(e){

            if(this.select().length != 0){
                var selectedVal = this.dataItem(this.select());
                if( selectedVal != null ){
                    var applyNo = selectedVal.applyNo;
                    if ( dms.string.isNotEmpty(applyNo) ) {
                        $("#btnViewDetail").data("kendoButton").enable(true);
                    }
                }
            };
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        //,multiSelectWithCheckbox:true
        ,columns:[
            {title:"", width:40
                ,attributes:{"class":"ac"} , _field:"_checkAll"
                ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' />"
                ,headerTemplate:"<input type='checkbox' class='checkAll' />"
            }
            ,{field:"applyNo", title:"<spring:message code='global.lbl.applNumber' />", width:70, attributes:{"class":"ac"}}  // 신청번호
            ,{field:"sdptNm", title:"<spring:message code='global.lbl.division' />", width:80, attributes:{"class":"ac"},hidden:true}     // 사업부
            ,{field:"officeNm", title:"<spring:message code='sal.lbl.officeNm' />",width:80                                   // 사무소
                ,attributes:{"class":"ac"}
            }
            ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />",width:90, attributes:{"class":"ac"}}           // 딜러코드
            ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />",width:200, attributes:{"class":"al"}}          // 딜러이름
            ,{field:"atcDstinCd", title:"<spring:message code='global.lbl.item' />", width:80                                  // 항목
                ,template:"# if(atcDstinArr[atcDstinCd] != null) { # #= atcDstinArr[atcDstinCd].cmmCdNm# # }#"
                ,attributes:{"class":"ac"}
            }
            ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:200, attributes:{"class":"al"}}        // 고객명
            ,{field:"reqQty", title:"<spring:message code='global.lbl.qty' />",width:50,attributes:{"class":"ar"}}              // 수량
            ,{field:"applyDt", title:"<spring:message code='global.lbl.fincReqDt' />",width:80,format:"{0:<dms:configValue code='dateFormat' />}",attributes:{"class":"ac"}}  // 신청일자
            ,{field:"evalDt", title:"<spring:message code='global.lbl.evalDt' />",width:60, attributes:{"class":"ac"}           // 심사일자
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"approveCd", title:"<spring:message code='crm.lbl.evalStatus' />",width:55, attributes:{"class":"ac"}       // 심사상태
                ,template:"# if(approveCdArr[approveCd] != null) { # #= approveCdArr[approveCd].cmmCdNm# # }#"
            }
            ,{field:"evalYn", title:"<spring:message code='sal.lbl.evalYn' />",width:60, attributes:{"class":"ac"}              // 심사여부
                ,template:"# if(evalYnMap[evalYn] != null) { # #= evalYnMap[evalYn].cmmCdNm# # }#"
            }
            ,{field:"usrId", hidden:true}           // 등록자
            ,{field:"reqSeq", hidden:true}          // 일련번호
            ,{field:"reqNo", hidden:true}           // 심사일련번호
            ,{field:"evalGradeCd",width:60, hidden:true}           //
        ]
    });



//############################################################################
//체크박스 세팅
//############################################################################

    //체크박스 세팅
    gridCheckBoxSet = function(uid , checked){
        var grid = $("#grid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var rows = grid.tbody.find("tr[data-uid=" + uid + "]");

        if(checked){
            $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
            $(".grid-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");
        }else{
            $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", false);
            $(".grid-checkbox-item[data-uid=" + uid + "]").removeClass("k-state-selected");
        }

        //receiveCancelYn();
    };

      //그리드 헤더CheckBox 클릭이벤트
    $(".checkAll").on("click" , function(e){

        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");
        var uid = $(this).attr("data-uid");
        var chkRows = grid.tbody.find("tr[data-uid=" + uid + "]");

        if(checked){
            rows.each(function(index, row) {
                var dataItem = grid.dataSource._data;
                if( dataItem[index].evalYn == "02"){
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", true);
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
                }
            });
        }else{
            grid.clearSelection();
            rows.each(function(index, row) {
            var dataItem = grid.dataSource._data;
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                //2018-11-12 update by weiyingjie 批量审批的时候，跳一行勾选的话，查询出来的所有数据都被审批了 start
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").removeClass("k-state-selected");
                //2018-11-12 update by weiyingjie 批量审批的时候，跳一行勾选的话，查询出来的所有数据都被审批了 end
            });
        }
    });

      //그리드 선택 이벤트
    $("#grid").on("click", "tr.k-state-selected", function (e) {

          var grid = $("#grid").data("kendoExtGrid");
          var selectedVal = grid.dataItem(grid.select());
          var chkBoolean = true;
          if(selectedVal != null){
              var uid = selectedVal.uid;
              if( selectedVal.evalYn == "02"){
                  chkBoolean = $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked") ? false : true;
                  gridCheckBoxSet(uid , chkBoolean);
              }
          }
      });

      //체크박스 선택이벤트
      $("#grid").on("click", ".grid-checkbox-item", function(e){
          var checked = $(this).is(":checked");

          var grid = $("#grid").data("kendoExtGrid");

          var chkBoolean = true;
          var uid = $(this).attr("data-uid");
          var rows = grid.tbody.find("tr");
          rows.each( function(index , obj){
              var dataItem = grid.dataSource._data;
              if( uid  == dataItem[index].uid){
                  $(grid.tbody.find("tr[data-uid=" + dataItem[index].uid  + "]")).toggleClass("k-state-selected");
              }else{
                  $(grid.tbody.find("tr[data-uid=" + dataItem[index].uid + "]")).removeClass("k-state-selected");
              }
          });

          gridCheckBoxSet($(this).attr("data-uid") , checked);

      });

}); //document.ready End

</script>