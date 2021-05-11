<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
    <div id="customerUpdateReqForm" name="customerUpdateReqForm" >  <!-- customerUpdateReqForm End -->
        <!-- 탭메뉴 -->
            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
            <div class="btn_right">
                <button id="btnCustUpdate" class="btn_m btn_save"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </div>
            </div> <!-- 조회 조건 타이틀 종료 -->
            <div class="table_form form_width_50per"  id="personalDiv">  <!--  personalDiv - 시작 -->
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:18%;">
                        <col style="width:32%;">
                        <col style="width:18%;">
                        <col style="width:32%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.custNm" /><!-- 고객명 --></th>
                            <td>
                                <input type="text" id="custNm" name="custNm" class="form_input" style="width:100%" maxlength="30" data-json-obj="true">
                                <input type="hidden" id="custNo" name="custNo" data-json-obj="true" />
                                <input type="hidden" id="custCd" name="custCd" data-json-obj="true" />
                                <input type="hidden" id="custCdC" name="custCdC" data-json-obj="true" />
                                <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true" />
                                <input type="hidden" id="oldCustNm" name="oldCustNm"  value="" data-json-obj="true" />
                                <input type="hidden" id="docId" name="docId" data-json-obj="true" />
                                <input type="hidden" id="custTp" name="custTp" data-json-obj="true" />
                                <input type="hidden" id="prefCommMthCd" name="prefCommMthCd" data-json-obj="true" />
                                <input type="hidden" id="prefCommNo" name="prefCommNo" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.hpNo" /><!-- 휴대전화 --></th>
                            <td >
                                <input type="text" id="hpNo" name="hpNo" class="form_input numberic getCustDupByKey" style="width:100%" maxlength="20" data-json-obj="true" maxlength="14" />
                                <input type="hidden" id="oldHpNo" name="oldHpNo"  value="" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th> <!-- 신분증유형 -->
                            <td>
                                <input id="mathDocTp" name="mathDocTp" class="form_comboBox"  data-json-obj="true" />
                                <input type="hidden" id="oldMathDocTp" name="oldMathDocTp"  value="" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 신분증번호 -->
                            <td>
                                <input id="ssnCrnNo" name="ssnCrnNo" type="text" value="" class="form_input numberandalpha getCustMathDocDupByKey"  pattern="[0-9A-Z]" maxlength="30" data-json-obj="true" />
                                <input type="hidden" id="oldSsnCrnNo" name="oldSsnCrnNo"  value="" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.cont" /></span></th><!-- 내용 -->
                            <td colspan="3">
                                <textarea id="cont" name="cont" rows="3" cols="30" class="form_textarea" style="width:100%;" data-json-obj="true" maxlength="1000" ></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>  <!--  personalDiv - 끝 -->

            <div class="table_form form_width_50per"  id="corporateDiv">  <!--  corporateDiv - 시작 -->
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:18%;">
                        <col style="width:32%;">
                        <col style="width:18%;">
                        <col style="width:32%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.corporation" /><!-- 고객명 --></th>
                            <td>
                                <input type="text" id="custNmC" name="custNmC" class="form_input" style="width:100%" maxlength="30" data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.officeTelNo" /><!-- 대표전화 --></th>
                            <td >
                                <input id="officeTelNoC" name="officeTelNoC" type="text" value="" class="form_input numberic getCustDupByKey"  maxlength="20" data-type="tel" pattern="\d" data-json-obj="true" />
                                <input id="officeTelNo" name="officeTelNo" type="hidden" value="" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.mathDocTp" /></th> <!-- 증거유형 -->
                            <td>
                                <input id="mathDocTpC" name="mathDocTpC" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th> <!-- 증거번호 -->
                            <td>
                                <input id="ssnCrnNoC" name="ssnCrnNoC" type="text" value="" class="form_input numberandalpha getCustMathDocDupByKey"  maxlength="30" pattern="[0-9A-Z]" data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="global.lbl.cont" /></span></th><!-- 내용 -->
                            <td colspan="3">
                                <textarea id="contC" name="contC" rows="3" cols="30" class="form_textarea" style="width:100%;" data-json-obj="true" maxlength="1000" ></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>  <!--  corporateDiv - 끝 -->
            <!-- 첨부파일 시작 -->
<!-- *************************************************************************
**************************파일업로드2********************************************
***************************************************************************-->
                  <section class="group">
                      <div class="header_area">
                          <h2 class="title_basic"><spring:message code="global.lbl.document" /></h2>
                          <div class="btn_right">
                              <%-- <button class="btn_xs" id="btnSearchFile" ><spring:message code="global.btn.search" /><!-- 파일조회 --></button>
                              <button class="btn_xs" id="btnSaveFile" ><spring:message code="global.btn.save" /><!-- 파일저장 --></button> --%>
                              <button class="btn_xs" id="fileDelete"><spring:message code="global.btn.fileDelete" /><!-- 파일삭제 --></button>
                              <span class="btn_xs" id="fileSelect"><spring:message code="global.lbl.FindFile" /><!-- 파일찾기 --></span>
                          </div>
                      </div>
                      <div class="table_grid">
                        <div id="fileGrid"></div>
                      </div>
                  </section>
<!-- *************************************************************************
**************************파일업로드2********************************************
***************************************************************************-->
            <!-- 첨부파일 끝 -->
    </div> <!-- customerUpdateReqForm End -->
    </section>

 <script type="text/javascript">

 var mathDocTpList = [];
 var mathDocTpMap = [];

 var mathDocTpListC = [];
 var mathDocTpMapC = [];

 <c:forEach var="obj" items="${mathDocTpList}">
    <c:if test="${obj.remark1 == 'P'}">
    mathDocTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    mathDocTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>

    <c:if test="${obj.remark1 == 'C'}">
    mathDocTpListC.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
    mathDocTpMapC["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
 </c:forEach>


$(document).ready(function() {

    // 숫자
    $(".numberic").kendoMaskedTextBox({
        mask:"000000000000000000"
        , promptChar:" "
    });

// 숫자와 알파벳
    $(".numberandalpha").kendoMaskedTextBox({
        mask:"AAAAAAAAAAAAAAAAAAAA"
        , promptChar:" "
    });

    // 고객명, 휴대전화 입력 후 고객 체크 (자동)
    $(".getCustDupByKey").focusout(function(){
        var idValue = $(this).context.id;
        getCustDupByKey(idValue);
    });

    // 증거유형 + 증거번호 후 고객 체크 (자동)
    $(".getCustMathDocDupByKey").focusout(function(){
        var idValue = $(this).context.id;
        getCustMathDocDupByKey(idValue);
    });

    // 신분증유형            mathDocTp       (CRM024)
    $("#mathDocTp").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , optionLabel:" "
       , dataSource:mathDocTpList
       , index:0
    });

    // 신분증유형            mathDocTpC       (CRM024)
    $("#mathDocTpC").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       //, optionLabel:" "
       , dataSource:mathDocTpListC
       , index:0
    });

    // 저장/수정 유일정보  kjlee
    $("#btnCustUpdate").kendoButton({
        click:function(e) {

            var custTpVal = $("#custTp").val();

            var custNm = $("#custNm").val();
            var custNmC = $("#custNmC").val();
            var custNo = $("#custNo").val();
            var hpNo = $("#hpNo").val();
            var custCd = $("#custCd").val();
            var mathDocTp = $("#mathDocTp").data("kendoExtDropDownList").value();
            var mathDocTpC = $("#mathDocTpC").data("kendoExtDropDownList").value();
            var ssnCrnNo = $("#ssnCrnNo").val();
            var custCdC = $("#custCdC").val();
            var ssnCrnNoC = $("#ssnCrnNoC").val();
            var officeTelNo = $("#officeTelNo").val();
            var officeTelNoC = $("#officeTelNoC").val();
            var oldCustNm = $("#oldCustNm").val();
            var oldHpNo = $("#oldHpNo").val();
            var oldMathDocTp = $("#oldMathDocTp").val();
            var oldSsnCrnNo = $("#oldSsnCrnNo").val();

/*          console.log("custNm        :" + custNm      );
            console.log("custNmC       :" + custNmC     );
            console.log("custNo        :" + custNo      );
            console.log("hpNo          :" + hpNo        );
            console.log("mathDocTp     :" + mathDocTp   );
            console.log("mathDocTpC    :" + mathDocTpC  );
            console.log("ssnCrnNo      :" + ssnCrnNo    );
            console.log("ssnCrnNoC     :" + ssnCrnNoC   );
            console.log("officeTelNo   :" + officeTelNo );
            console.log("oldCustNm     :" + oldCustNm   );
            console.log("oldHpNo       :" + oldHpNo     );
            console.log("oldMathDocTp  :" + oldMathDocTp);
            console.log("oldSsnCrnNo   :" + oldSsnCrnNo ); */

            if (custTpVal == "01") {
                if( dms.string.isEmpty(custNm) ){
                    dms.notification.warning("<spring:message code='global.lbl.custNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
                if( dms.string.isEmpty(hpNo) ){
                    dms.notification.warning("<spring:message code='global.lbl.hpNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
                if ( custNm == oldCustNm && hpNo == oldHpNo && mathDocTp == oldMathDocTp && ssnCrnNo == oldSsnCrnNo ) {
                    dms.notification.warning("<spring:message code='global.lbl.update' var='returnMsg' /><spring:message code='global.info.valNoMsg' arguments='${returnMsg}' />");
                    return false;
                }
                if( dms.string.isEmpty($("#cont").val()) ){
                    dms.notification.warning("<spring:message code='global.lbl.cont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            } else {
                if ( custNmC == oldCustNm && officeTelNo == oldHpNo && mathDocTpC == oldMathDocTp && ssnCrnNoC == oldSsnCrnNo ) {
                    dms.notification.warning("<spring:message code='global.lbl.update' var='returnMsg' /><spring:message code='global.info.valNoMsg' arguments='${returnMsg}' />");
                    return false;
                }
                if( dms.string.isEmpty($("#contC").val()) ){
                    dms.notification.warning("<spring:message code='global.lbl.cont' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                }
            }

            // 서류 정보 필수 확인
            if( dms.string.isEmpty($("#docId").val()) ){
                dms.notification.warning("<spring:message code='global.lbl.document' var='arguMsg' /><spring:message code='global.info.required.field' arguments='${arguMsg}' />");
                return false;
            }

            // form 데이터
            var param =
                $("#customerUpdateReqForm").serializeObject(
                    $("#customerUpdateReqForm").serializeArrayInSelector("[data-json-obj='true']")
                );

            //법인인 경우 ID 재 정의
            if (custTpVal == "02") {
                param["custNm"] = custNmC;
                param["custCd"] = $("#custCdC").val();
                param["officeTelNo"] = officeTelNoC;
                param["mathDocTp"] = mathDocTpC;
                param["ssnCrnNo"] = ssnCrnNoC;
                param["cont"] = $("#contC").val();
            }

            console.log("-btnCustSave Param-----------------");
            console.log(param);

            $.ajax({
                url:"<c:url value='/crm/cif/customerInfo/insertCustomerInfoReq.do' />"
                ,data:JSON.stringify(param)
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    console.log(jqXHR);
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                },
                success:function(result){
                    console.log("Cust. Info. Update success!!!!");
                    console.log(result);
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    options.callbackFunc("SUCCESS");
                    parent.custInfoUpdate.close();
                }
            }).done(function(result) {
                console.log("btnCustSave Done!!!!");
            });
        }
    });

    /* *************************************************************************
     **************************파일업로드3********************************************
     ***************************************************************************/
    //========파일삭제
    $("#fileDelete").click(function(){
        var grid = $("#fileGrid").data("kendoExtGrid");
        var rows = grid.select();

        if (rows.length < 1) {
            //목록을 선택하여 주십시오.
            dms.notification.info("<spring:message code='global.info.required.select'/>");
            return;
        }

        var deleteList = [];
        rows.each(function(index, row) {
            var dataItem = grid.dataItem(row);
            deleteList.push({"fileDocNo":dataItem.fileDocNo, "fileNo":dataItem.fileNo});
        });

        $.ajax({
            url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
            ,data:JSON.stringify(deleteList)
            ,type:'POST'
            ,dataType:'json'
            ,contentType:'application/json'
            ,error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            }
            ,success:function(jqXHR, textStatus) {

                grid.dataSource._destroyed = [];
                grid.dataSource.read();

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");
            }
        });
    });

    $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#fileGrid").data("kendoExtGrid");
        var dataItem = grid.dataItem(grid.select());

        if(dms.string.isNotEmpty(dataItem)){
            dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
        }
    });
    /* *************************************************************************
     **************************파일업로드3********************************************
     ***************************************************************************/

    /* *************************************************************************
     **************************파일업로드5********************************************
     ***************************************************************************/
     // 파일 그리드 시작 //
     $("#fileGrid").kendoExtGrid({
         dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                 },
                 parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};
                         params["sFileDocNo"] = $("#docId").val();

                         return kendo.stringify(params);

                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 model:{
                     fields:{
                         fileDocNo:{type:"string", editable:false}
                         ,fileNo:{type:"number", editable:false}
                         ,fileNm:{type:"string", editable:false}
                         ,fileSize:{type:"number", editable:false}
                     }
                 }
             }
         }
        ,autoBind:false
        ,editable:true
        ,height:141
        ,multiSelectWithCheckbox:true
        ,navigatable:false
        ,pageable:false
        ,sortable:false
        //,selectable:"row"
        ,columns:[
            {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />" }           // 파일명
           ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", attributes:{"class":"ar"}}       // 파일크기
           ,{title:""}

        ]
    });
    // 파일 그리드 종료 //
     /* *************************************************************************
     **************************파일업로드5********************************************
     ***************************************************************************/


     // 팝업 form 데이터 set
     var options = parent.custInfoUpdate.options.content.data;

     console.log(options);

     if(options != '' || options != 'undefined'){

         $("#custNm").val(options.custNm);
         $("#custNo").val(options.custNo);
         $("#custCd").val(options.custCd);
         $("#hpNo").val(options.hpNo);
         $("#mathDocTp").data("kendoExtDropDownList").value(options.mathDocTp);
         $("#ssnCrnNo").val(options.ssnCrnNo);
         $("#custNmC").val(options.custNmC);
         $("#officeTelNo").val(options.officeTelNo);
         $("#custCdC").val(options.custCdC);
         $("#officeTelNoC").val(options.officeTelNoC);
         $("#mathDocTpC").data("kendoExtDropDownList").value(options.mathDocTpC);
         $("#ssnCrnNoC").val(options.ssnCrnNoC);
         $("#custTp").val(options.custTp);
         $("#prefCommMthCd").val(options.prefCommMthCd);
         $("#prefCommNo").val(options.prefCommNo);

         $("#oldCustNm").val(options.custNm);
         $("#oldHpNo").val(options.hpNo);
         $("#oldMathDocTp").val(options.mathDocTp);
         $("#oldSsnCrnNo").val(options.ssnCrnNo);

         if (options.custTp == "01") {
             $("#personalDiv").show();
             $("#corporateDiv").hide();
         } else {

             $("#oldCustNm").val(options.custNmC);
             $("#oldHpNo").val(options.officeTelNoC);
             $("#oldMathDocTp").val(options.mathDocTpC);
             $("#oldSsnCrnNo").val(options.ssnCrnNoC);

             $("#personalDiv").hide();
             $("#corporateDiv").show();
         }

     }
});

/* *************************************************************************
 **************************파일업로드4********************************************
 ***************************************************************************/
 //================================
 var r = new Resumable({
     target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
     ,chunkSize:1 * 1024 * 1024
     ,simultaneousUploads:4
     ,testChunks:true
     ,throttleProgressCallbacks:1
     ,method:"octet"
 });
 r.assignBrowse($('#fileSelect')[0]);

 //파일추가 이벤트
 r.on('fileAdded', function(file) {

     $("#progressWindow").kendoWindow({
         width:"600px"
         ,height:"300px"
         ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
         ,animation:false
         ,draggable:false
         ,visible:false
         ,resizable:false
         ,modal:true
     }).data("kendoWindow").center().open();


     $('.resumable-progress, .resumable-list').show();
     $('.resumable-progress .progress-resume-link').hide();
     $('.resumable-progress .progress-pause-link').show();

     //파일목록 출력
     $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

     //업로드 시작
     r.upload();

 });
 r.on('pause', function() {
     $('.resumable-progress .progress-resume-link').show();
     $('.resumable-progress .progress-pause-link').hide();
 });
 r.on('uploadStart', function() {

     var _that = this;

     if (_that.opt["query"] == null) {
          _that.opt["query"] = {};
     }

     if (dms.string.isEmpty($("#docId").val())) {
         $.ajax({
             url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
             dataType:"json",
             type:"get",
             async:false,
             cache:false,
             success:function(id) {
                 _that.opt["query"]["resumableSessionId"] = id;
                 $("#docId").val(id);
             }
         });
     } else {
         _that.opt["query"]["resumableSessionId"] = $("#docId").val();
     }

//      if (_that.opt["query"] == null) {
//          _that.opt["query"] = {};
//      }

//      if (_that.opt["query"]["resumableSessionId"] == null) {
//          $.ajax({
//              url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
//              dataType:"json",
//              type:"get",
//              async:false,
//              cache:false,
//              success:function(id) {
//                  _that.opt["query"]["resumableSessionId"] = id;
//                  $("#docId").val(id);
//              }
//          });
//      }

     $('.resumable-progress .progress-resume-link').hide();
     $('.resumable-progress .progress-pause-link').show();
 });
 r.on('complete', function() {

     var _that = this;

     $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();

     console.log("resumableSessionId:" + _that.opt["query"]["resumableSessionId"]);

     $("#progressWindow").data("kendoWindow").close();
     r.files = [];
     $(".resumable-list").html("");
 });
 r.on('fileSuccess', function(file, message) {
     console.log("===============");
     console.log(message);

     var result = JSON.parse(message);
     if(result.status === "finished") {
         $("#fileGrid").data("kendoExtGrid").dataSource.insert({
             fileDocNo:result.fileDocNo
             ,fileNo:result.fileNo
             ,fileNm:result.fileNm
             ,fileSize:dms.string.formatFileSize(result.fileSize)
         });
         //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
     }


 });
 r.on('fileError', function(file, message) {
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
 });
 r.on('fileProgress', function(file) {
     var fileProgress = 0;

     if (file instanceof ResumableChunk) {
         fileProgress = file.fileObj.progress();
     } else {
         fileProgress = file.progress();
     }

     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
     $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
     $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
 });
 /* *************************************************************************
 **************************파일업로드4********************************************
 ***************************************************************************/

 function getCustDupByKey(idVal){

     var custTp = $("#custTp").val();

     var custNm = $("#custNm").val();
     var custNo = $("#custNo").val();
     var custCd = $("#custCd").val();
     var hpNo = $("#hpNo").val();
     var mathDocTp = $("#mathDocTp").data("kendoExtDropDownList").value();
     var ssnCrnNo = $("#ssnCrnNo").val();
     var officeTelNo = $("#officeTelNoC").val();
     var oldCustNm = $("#oldCustNm").val();
     var oldHpNo = $("#oldHpNo").val();
     var oldMathDocTp = $("#oldMathDocTp").val();
     var oldSsnCrnNo = $("#oldSsnCrnNo").val();
     var chkContinued = false;

     if (custTp == "02") {
         custNm = $("#custNmC").val();
         custCd = $("#custCdC").val();
         mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
         ssnCrnNo = $("#ssnCrnNoC").val();
         if (custNm.length >= 1 && officeTelNo.length > 1 ) {
             chkContinued = true;
         }
     } else {
         if (custNm.length >= 1 && hpNo.length > 1 ) {
             chkContinued = true;
         }
     }

     if (chkContinued){

         var param = {};
         param["sCustTp"]       = custTp;
         param["sCustCd"]       = custCd;
         param["sCustNm"]       = custNm;
         param["sHpNo"]         = hpNo;
         param["sOfficeTelNo"]         = officeTelNo;
         param["sMathDocTp"]         = mathDocTp;
         param["sSsnCrnNo"]         = ssnCrnNo;
         param["sOldCustNm"]         = oldCustNm;
         param["sOldHpNo"]         = oldHpNo;
         param["sOldMathDocTp"]         = oldMathDocTp;
         param["sOldSsnCrnNo"]         = oldSsnCrnNo;

         console.log(param);

         $.ajax({
             url:"<c:url value='/crm/cif/customerInfo/selectCustDupByKey.do' />"
             ,data:JSON.stringify(param)
             ,type:'POST'
             ,dataType:'json'
             ,contentType:'application/json'
             ,error:function(jqXHR,status,error){
                 console.log(jqXHR);
                 console.log(jqXHR.responseJSON);
                 //alert(jqXHR.responseJSON.errors[0].errorMessage);
                 //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
             },
             success:function(result){
                 console.log(result);

                 if (result.length == 0 ){
                     dms.notification.success("<spring:message code='global.info.ableToDo' />");
                 } else {
                     dms.notification.success("<spring:message code='global.info.already' />");
                 }
             }
         }).done(function(result) {
             console.log("done!!!!");
         });
     }
 }

 function getCustMathDocDupByKey(idVal){

     var custTp = $("#custTp").val();

     var custNm = $("#custNm").val();
     var custNo = $("#custNo").val();
     var custCd = $("#custCd").val();
     var hpNo = $("#hpNo").val();
     var mathDocTp = $("#mathDocTp").data("kendoExtDropDownList").value();
     var ssnCrnNo = $("#ssnCrnNo").val();
     var officeTelNo = $("#officeTelNoC").val();
     var oldCustNm = $("#oldCustNm").val();
     var oldHpNo = $("#oldHpNo").val();
     var oldMathDocTp = $("#oldMathDocTp").val();
     var oldSsnCrnNo = $("#oldSsnCrnNo").val();
     var chkContinued = false;


     if (custTp == "02") {
         custNm = $("#custNmC").val();
         custCd = $("#custCdC").val();
         mathDocTp = $("#mathDocTpC").data("kendoExtDropDownList").value();
         ssnCrnNo = $("#ssnCrnNoC").val();
     }

     if (mathDocTp.length >= 1 && ssnCrnNo.length > 1 ){

         var param = {};
         param["sCustTp"]       = custTp;
         param["sCustNm"]       = custNm;
         param["sCustCd"]       = custCd;
         param["sHpNo"]         = hpNo;
         param["sOfficeTelNo"]         = officeTelNo;
         param["sMathDocTp"]         = mathDocTp;
         param["sSsnCrnNo"]         = ssnCrnNo;
         param["sOldCustNm"]         = oldCustNm;
         param["sOldHpNo"]         = oldHpNo;
         param["sOldMathDocTp"]         = oldMathDocTp;
         param["sOldSsnCrnNo"]         = oldSsnCrnNo;

         console.log(param);

         $.ajax({
             url:"<c:url value='/crm/cif/customerInfo/selectCustMathDocDupByKey.do' />"
             ,data:JSON.stringify(param)
             ,type:'POST'
             ,dataType:'json'
             ,contentType:'application/json'
             ,error:function(jqXHR,status,error){
                 console.log(jqXHR);
                 console.log(jqXHR.responseJSON);
                 //alert(jqXHR.responseJSON.errors[0].errorMessage);
                 //dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
             },
             success:function(result){
                 console.log(result);

                 if (result.length == 0 ){
                     dms.notification.success("<spring:message code='global.info.ableToDo' />");
                 } else {
                     dms.notification.success("<spring:message code='global.info.already' />");
                 }
             }
         }).done(function(result) {
             console.log("done!!!!");
         });
     }
 }

 </script>

