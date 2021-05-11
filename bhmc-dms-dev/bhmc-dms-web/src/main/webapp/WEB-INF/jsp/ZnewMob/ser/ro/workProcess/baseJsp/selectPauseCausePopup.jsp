<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<section id="content">
    <!-- content_list -->
    <section id="content_list">
        <div class="content_title conttitlePrev">
            <h2 id="content_list_title"><spring:message code='ser.btn.lbrStop' /></h2>   <!-- 작업중지 목록-->
        </div>


        <div class="formarea">
            <input type="hidden" id="saId1" name="saId1" />
            <input type="hidden" id="saNm1" name="saNm1" />

            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.lbrCd' /></th>      <!-- 공임코드-->
                        <td>
                            <div class="f_text"><input type="text" id="lbrCd" name="lbrCd" disabled></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.rpirNm' /></th>      <!-- 정비명칭-->
                        <td>
                            <div class="f_text"><input type="text" id="rpirNm" name="rpirNm" disabled></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" class="required"><spring:message code='ser.lbl.pauseCau' /></th>     <!-- 일시정지원인-->
                        <td>
                            <div class="f_text">
                                <input type="text" id="pauseCauCd" />
                                <input type="hidden" id="roDocNo" name="roDocNo"/>
                                <input type="hidden" id="lineNo" name="lineNo"/>
                                <input type="hidden" id="rpirCd" name="rpirCd"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.pauseRemark' /></th>      <!-- 중지비고-->
                        <td>
                            <div class="f_text"><input type="text" id="pauseRemark" name="pauseRemark"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.expcDlvDt' /></th>        <!-- 예정인도시간-->
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="date" id="operEndDt" style="width:180px" class=""  disabled/>
                                <!-- <input type="search" id="operEndDt" style="width:180px" class=""  disabled/>
                                <span id="operEndDtSpan" class="date" onclick="calpicker('operEndDt');">날짜선택</span> -->
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"></th>        <!-- 예정인도시간-->
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="time" id="operEndDtTime" name="operEndDtTime" style="width:180px" class="" disabled>
                                <%-- <input type="search" id="operEndDtTime" name="operEndDtTime" style="width:180px" class="" disabled>
                                <span id="operEndDtTimeSpan" class="time" onclick="timepicker2('operEndDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span> --%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='ser.lbl.preCompDt' /></th>        <!-- 예정완료시간-->
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="date" id="expEndDt" style="width:180px" class=""  />
                                <!-- <input type="search" id="expEndDt" style="width:180px" class=""  />
                                <span class="date" onclick="calpicker('expEndDt');">날짜선택</span> -->
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"></th>        <!-- 예정완료시간-->
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="time" id="expEndDtTime" name="expEndDtTime" style="width:180px" class="" >
                                <%-- <input type="search" id="expEndDtTime" name="expEndDtTime" style="width:180px" class="" >
                                <span class="time" onclick="timepicker2('expEndDtTime')"><spring:message code='global.lbl.timeSelect' /><!-- 시간선택 --></span> --%>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 버튼 2개  -->
        <div class="con_btnarea btncount2">
            <div><span id="lbrClose" class="btnd1t2" ><spring:message code="global.btn.close" /><!-- 닫기 --></span></div>
            <div><span id="btnConfirm" class="btnd1"><spring:message code='global.btn.confirm' /><!-- 확인 --></span></div>

        </div>
        <!-- //버튼  -->
    </section>
</section>

<div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>
<!-- script -->

 <script type="text/javascript">

 var dateFormat =  '<dms:configValue code="dateFormat" />';
 var dlrCd  = "${dlrCd}";    // 딜러코드
 var toDate;

 /** 법인구분 **/
 var dstinCdList = [];
 var dstinNormalCdList = [];
 var dstinWrtCdList = [];
 var dstinGoodWillCdList = [];
  <c:forEach var="obj" items="${distTpList}">
      <c:if test="${obj.remark1 eq '02'}" >
          dstinWrtCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      </c:if>
      <c:if test="${obj.remark2 eq '01'}" >
          dstinNormalCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      </c:if>
      <c:if test="${obj.remark3 eq '03'}" >
          dstinGoodWillCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      </c:if>
       dstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:forEach>

  var distCdMap = dms.data.arrayToMap(dstinCdList, function(obj){return obj.cmmCd});


 //중지원인 Array
 var pauseStatList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
 <c:forEach var="obj" items="${pauseStatList}">
 pauseStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>

 //공통코드:정비유형(수리유형)
 var lbrTpCdList = [];
 <c:forEach var="obj" items="${lbrTpCdList}">
 lbrTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 </c:forEach>
 var lbrTpCdArr = dms.data.arrayToMap(lbrTpCdList, function(obj){return obj.cmmCd;});

 // 정비유형(수리유형)
 lbrTpCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         if(lbrTpCdArr[val] != undefined)
             returnVal = lbrTpCdArr[val].cmmCdNm;
     }
     return returnVal;
 };

//구분
 dstinCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         if(distCdMap[val] != undefined)
             returnVal = distCdMap[val].cmmCdNm;
     }
     return returnVal;
 };

//공통코드:LTS MODEL 코드
 var ltsModelCdList =[];
 <c:forEach var="obj" items="${ltsModelList}">
  ltsModelCdList.push({
      cmmCdNm:"${obj.ltsModelNm}"
      , cmmCd:"${obj.ltsModelCd}"});
 </c:forEach>
 var ltsMap = dms.data.arrayToMap(ltsModelCdList, function(obj){return obj.cmmCd;});

//LTS MODEL NM
 setLtsModel = function(value){
     var resultVal = "";
     if( dms.string.strNvl(value) != ""){
         if(ltsMap[value] != undefined)
             resultVal = ltsMap[value].cmmCdNm
     }
     return resultVal;
 };

//날짜format
 fnSearchText = function() {
     var operEndDt = $("#operEndDt");
     var operEndDtTime = $("#operEndDtTime");
 }

 var selectedItem;


 $(document).ready(function() {

     $("#operEndDtSpan").attr("onclick","").unbind("click");
     $("#operEndDtTimeSpan").attr("onclick","").unbind("click");

     var parentJsonData = parent.pauseCustPopupWindow.options.content.data;

     var options = parent.pauseCustPopupWindow.options.content.data;
     $("#roDocNo").val(options.roDocNo);
     $("#lineNo").val(options.lineNo);
     $("#rpirCd").val(options.rpirCd);

     $("#lbrCd").val(options.rpirCd);
     $("#rpirNm").val(options.rpirNm);


     $("#operEndDt").val(chgDate2Str(options.expcDlDt));
     $("#operEndDtTime").val(chgDate2TimeStr(options.expcDlDt));

     var expcDlDt = options.expcDlDt;
     var allocEndDt = options.allocEndDt;

   //중지원인 데이터 입력
     $("#pauseCauCd").kendoExtDropDownList({
         dataSource:pauseStatList
         ,dataValueField:"cmmCd"
         ,dataTextField:"cmmCdNm"
         ,index:0
     });


   //List 닫기 버튼 이벤트
     $("#lbrClose").bind("click", function()
     {
         parent.mob.loading.hide();
         parent.$("#formarea").show();
         if ($("#content_list").css("display") == "block") { parent.pauseCustPopupWindow.close(); }

     });
     //이전 버튼 이벤트
     $("#docu_prev").bind("click", function()
     {
         parent.mob.loading.hide();
         parent.$("#formarea").show();
         if ($("#content_list").css("display") == "block") { parent.pauseCustPopupWindow.close(); }
     });
     //최종 확인 버튼 이벤트
      $("#btnConfirm").kendoButton({
         click:function(e){
             var pauseCauCd = $("#pauseCauCd").data("kendoExtDropDownList").value();

             if(dms.string.strNvl(pauseCauCd) == ""){
                 mob.notification.info("<spring:message code='ser.lbl.pauseCau' var='pauseCau' /><spring:message code='global.info.required.field' arguments='${pauseCau}' />");
                 return false;
             }
             var item= parent.getSelectedItem();
             var workProcessData = [];

             var param = {
                     dlrCd : $("#dlrCd").val()
                     ,roDocNo : $("#roDocNo").val()
                     ,roGrpNo : $("#roGrpNo").val()
                     ,pauseRemark : $("#pauseRemark").val()
                     ,pauseCauCd : $("#pauseCauCd").val()
                     ,rpirCd : $("#rpirCd").val()
                     ,lineNo : item.lineNo
                     ,operEndDt : chgDateTimeStamphhMM($("#expEndDt").val() +" "+ $("#expEndDtTime").val())
             };

             workProcessData.push(param);

             $.ajax({
                 url:"<c:url value='/ser/ro/workPause/insertWorkPauses.do' />",
                 data:JSON.stringify(workProcessData),
                 type:'POST',
                 dataType:'json',
                 contentType:'application/json',
                 error:function(jqXHR,status,error) {
                     dms.notification.error(jqXHR.responseJSON.errors);
                 },
                 success:function(jqXHR, textStatus) {
                     options.callbackFunc($("#operEndDt").val(),param);
                     parent.pauseCustPopupWindow.close();
                 }

             });
         }
     });

 });
 </script>