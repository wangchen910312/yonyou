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
                <h1 class="title_basic"><spring:message code="ser.title.sanboApr" /></h1> <!-- 삼보승인 -->
                <div class="btn_right">
				<dms:access viewId="VIEW-I-12468" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
				</dms:access>
                </div>
            </div>
            <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                <div id="grid" class="grid"></div>
            </div>
        </section>
        <!-- //신청현황 -->

        <section class="group">
            <div class="header_area">
                 <div class="btn_right">
                <dms:access viewId="VIEW-I-12467" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_approve btn_s_min5" id="btnAccept" disabled><spring:message code="ser.btn.btnAccept" /></button>
                </dms:access>
                <dms:access viewId="VIEW-I-12466" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_return btn_s_min5" id="btnDeny"><spring:message code="ser.btn.return" /></button> <!-- 반송 -->
                </dms:access>
                <dms:access viewId="VIEW-I-12465" hasPermission="${dms:getPermissionMask('READ')}">
                    <button type="button" class="btn_s btn_approval btn_s_min5" id="btnAppr"><spring:message code="global.btn.approval" /></button> <!-- 승인 -->
                </dms:access>
                    <%-- <button type="button" class="btn_s btn_cancel btn_s_min5" id="btnCancel" ><spring:message code="global.btn.cancel" /></button> --%> <!-- 취소 -->
                </div>
            </div>
        </section>
        <div class="clfix" id="kendoSanbaoAprForm">
            <form id="sanbaoAprForm">
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
                            <col style="width:30%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.vinNo" /></th> <!-- 차대번호 -->
                                <td>
                                    <input type="text" id="vinNo" name="vinNo" readonly class="form_input form_readonly" data-json-obj="true" />
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
                                <th scope="row"><spring:message code="ser.lbl.custNm" /></th> <!-- 고객명 -->
                                <td>
                                    <input type="text" id="carOwnerNm" name="carOwnerNm" readonly class="form_input form_readonly" />
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
                        </tbody>
                    </table>
                </div>

                <!-- 탭메뉴 전체 영역 -->
                <div id="tabstrip" class="tab_area">
                    <!-- 탭메뉴 -->
                    <ul>
                        <li class="k-state-active"><spring:message code="ser.lbl.item" /></li>
                        <li><spring:message code="ser.lbl.file" /></li>
                    </ul>
                    <div>
                        <div class="table_grid">
                            <div id="gridPart" class="grid"></div>
                        </div>
                    </div>
                    <div>
                    <!-- 파일업로드관련 include page -->
                        <div class="btn_right_absolute">
                            <span class="btn_file" id="btnFileAdd"><spring:message code="ser.btn.fileUpload" /></span> <!-- 파일찾기 -->
                        </div>
                        <jsp:include page="/WEB-INF/jsp/ser/cmm/file/selectFileInfoNoBtn.jsp"></jsp:include>
                    <!-- 파일업로드관련 include page -->
                    </div>

                </div>
                <!-- //탭메뉴 전체 영역 -->
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
                                    <textarea rows="3" id="emgcReasonCont" name="emgcReasonCont" cols="" readonly class="form_textarea form_readonly"  style="height:73px" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.dlrProcOpnCnt" /></th> <!-- 딜러처리 의견 및 방안 -->
                                <td>
                                    <textarea rows="3" cols="" id="dlrProcOpnCont" name="dlrProcOpnCont" readonly class="form_textarea form_readonly"  style="height:74px"  ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.bmpProcCont" /></span></th> <!-- BMP 처리의견 -->
                                <td>
                                    <textarea rows="3" cols="" id="bmpProcCont" name="bmpProcCont" maxLength="600" class="form_textarea" style="height:76px" data-json-obj="true"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_form form_width_100per mt10">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:22%;">
                            <col style="width:28%;">
                            <col style="width:22%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="ser.lbl.wrtrDt" /></th> <!-- 작성일자 -->
                                <td>
                                    <input type="text" id="wrtrDt" name="wrtrDt" readonly class="form_datepicker form_readonly ac"  />
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.itemChkDt" /></span></th> <!-- 물류확인일 -->
                                <td>
                                    <input type="text" id="itemChkDt" name="itemChkDt" class="form_datepicker ac" data-json-obj="true" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>
            <!-- //의견 -->

            <input type="hidden" id="judgId" name="judgId" />
            <input type="hidden" id="docNo" name="docNo" data-json-obj="true" />
            <input type="hidden" id="dlrCd" name="dlrCd" data-json-obj="true" />
            <input type="hidden" id="statCd" name="statCd" data-json-obj="true" />
            <input type="hidden" id="approveNo" name="approveNo" data-json-obj="true" />
          </form>
        </div>
    </div>
</div>
<!-- script -->
<script type="text/javascript">

var statList = [];
<c:forEach var="obj" items="${stateDs}">
 if( "${obj.cmmCd}" != "O" ){
        statList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
 }
</c:forEach>

//그리드 선택 Row
var gridRow = 0;
var selectedYn = false;

var statMap = dms.data.arrayToMap(statList, function(obj){return obj.cmmCd;});

    $(document).ready(function() {

        var validator = $("#kendoSanbaoAprForm").kendoExtValidator().data("kendoSanbaoAprForm");
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

        /**작성일자**/
        $("#wrtrDt").kendoExtMaskedDatePicker({

           format:"{0:<dms:configValue code='dateFormat' />}"
          ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /**품목확인일자**/
        $("#itemChkDt").kendoExtMaskedDatePicker({

           format:"{0:<dms:configValue code='dateFormat' />}"
          ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
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


       // Data 전송
        requestSaveData = function(statCd){

           if( statCd != "S" && !setDataValidation(statCd)){
               return;
           }

           $("#statCd").val(statCd);

           var gridPart = $("#gridPart").data("kendoExtGrid");
           var fileGrid = $("#fileGrid").data("kendoExtGrid");

           var formSaveData = $("#sanbaoAprForm").serializeObject( $("#sanbaoAprForm").serializeArrayInSelector("[data-json-obj='true']") );
           formSaveData.itemChkDt = $("#itemChkDt").data("kendoExtMaskedDatePicker").value();



           $.ajax({
               url:"<c:url value='/ser/wac/sanbaoAppr/updateSanbaoApprove.do' />"
              ,data:JSON.stringify(formSaveData)
              ,type:'POST'
              ,dataType:'json'
              ,contentType:'application/json'
              ,error:function(jqXHR,status,error) {
                  dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
              }
              ,success:function(result , textStatus){

                  selectedYn =  (dms.string.isEmpty($("#sStatCd").val())  ) ? true:false;
                  if(selectedYn){
                      gridRow = $("#grid").data("kendoExtGrid").select().index();
                  }
                  $("#grid").data("kendoExtGrid").dataSource.data([]);
                  $("#grid").data("kendoExtGrid").dataSource.read();

                  $("#approveNo").val(result);

                  fileGrid.dataSource.data([]);
                  gridPart.dataSource.data([]);
                  fileGrid.dataSource.read();
                  gridPart.dataSource.read();

                  setButtonEnable($("#statCd").val());

                  dms.notification.success("<spring:message code='global.info.success' />");
              }
              ,beforeSend:function(xhr){
                  dms.loading.show($("#resizableContainer"));
              }
              ,complete:function(xhr,status){
                  dms.loading.hide($("#resizableContainer"));
              }
           });

        };

        setDataValidation = function(statCd){

            var msgText;
            var result = true;


            if( dms.string.isEmpty( $("#bmpProcCont").val() )   ){
                <enhance:out escapeXml="false">

                msgText = "<spring:message code='ser.lbl.bmpProcCont' var='bmpProcCont' />"+
                          "<spring:message code='global.info.required.field' arguments='${bmpProcCont}' />";
                          $("#bmpProcCont").focus();
                          result =  false;
                 </enhance:out>

            }else if(  dms.string.isEmpty( $("#itemChkDt").val()) && statCd == "A" ){
                msgText = "<spring:message code='ser.lbl.itemChkDt' var='itemChkDt' />"+
                          "<spring:message code='global.info.required.field' arguments='${itemChkDt}' />";
                          $("#itemChkDt").focus();
                          result =  false;
            }else if(  $("#wrtrDt").val() > $("#itemChkDt").val() && statCd == "A" ){
                msgText = "<spring:message code='ser.lbl.itemChkDt' var='itemChkDt' />"+
                          "<spring:message code='ser.lbl.wrtrDt' var='wrtrDt' />"+
                          "<spring:message code='global.info.validation.min' arguments='${itemChkDt} , ${wrtrDt}' />";
                $("#itemChkDt").focus();
                result =  false;
            }


            if(!result) dms.notification.warning(msgText);

            return result;
        };

       /** 조회 **/
       $("#btnSearch").kendoButton({
           click:function(e){
               $("#grid").data("kendoExtGrid").dataSource.data([]);
               $("#grid").data("kendoExtGrid").dataSource.read();
           }
       });


       /** 접수버튼 **/
       $("#btnAccept").kendoButton({

           click:function(e){
               requestSaveData("S");
           }
       });

       /** 반송 **/
       $("#btnDeny").kendoButton({
           click:function(e){

               requestSaveData("R");
           }
       });
       /** 승인 **/
       $("#btnAppr").kendoButton({
           click:function(e){
               requestSaveData("A");
           }
       });

       /** 버튼 세팅 **/
        setButtonEnable = function (sFlag){

            switch(sFlag){

                case "S":/** 접수  **/
                    $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                    $("#btnAccept").data("kendoButton").enable(false);    /** 접수**/
                    $("#btnDeny").data("kendoButton").enable(true);       /** 반송 **/
                    $("#btnAppr").data("kendoButton").enable(true);       /** 승인 **/
                          break;
                case "A":/** 완료 **/
                    $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                    $("#btnAccept").data("kendoButton").enable(false);    /** 접수**/
                    $("#btnDeny").data("kendoButton").enable(false);      /** 반송 **/
                    $("#btnAppr").data("kendoButton").enable(false);      /** 승인 **/
                          break;
                case "Q":/** 제출 **/
                    $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                    $("#btnAccept").data("kendoButton").enable(true);     /** 접수**/
                    $("#btnDeny").data("kendoButton").enable(false);      /** 반송 **/
                    $("#btnAppr").data("kendoButton").enable(false);      /** 승인 **/
                          break;
                case "R":/**반송 **/
                    $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                    $("#btnAccept").data("kendoButton").enable(false);    /** 접수**/
                    $("#btnDeny").data("kendoButton").enable(false);      /** 반송 **/
                    $("#btnAppr").data("kendoButton").enable(false);      /** 승인 **/
                          break;
                default :
                    $("#btnSearch").data("kendoButton").enable(true);     /** 조회 **/
                    $("#btnAccept").data("kendoButton").enable(false);    /** 접수**/
                    $("#btnDeny").data("kendoButton").enable(false);      /** 반송 **/
                    $("#btnAppr").data("kendoButton").enable(false);      /** 승인 **/
                    $("#btnFileAdd").hide();
                         break;
            }
        };

        /** 결과값 세팅 **/
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
            $("#approveNo").val(dms.string.strNvl(result.approveNo));


            $("#runDistVal").data("kendoExtNumericTextBox").value( Number(dms.string.defaultString(result.itemChkDt,"0")) );
            $("#itemChkDt").data("kendoExtMaskedDatePicker").value( dms.string.strNvl(result.itemChkDt) );
            $("#wartStartDt").data("kendoExtMaskedDatePicker").value( dms.string.strNvl(result.wartStartDt) );
            $("#creDt").data("kendoExtMaskedDatePicker").value( dms.string.strNvl(result.creDt) );
            $("#wrtrDt").data("kendoExtMaskedDatePicker").value( dms.string.strNvl(result.wrtrDt) );

        };


        $("#grid").kendoExtGrid({
            gridId:"G-SER-0803-165101"
            ,dataSource:{
                transport:{
                       read :{
                           url:"<c:url value='/ser/wac/sanbaoAppr/selectSanbaoApproveMains.do' />"
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
                            rnum:{type:"number", editable:false }
                            ,docNo:{type:"string", editable:false } // 문서번호
                            ,vinNo:{type:"string", editable:false, validation:{required:true} }//차대번호
                            ,statCd:{type:"string", editable:false }//상태
                            ,dlrSignReqDt:{type:"date"  } //신청일자
                            ,judgDt:{type:"date", editable:false }//판정일
                            ,judgNm:{type:"string", editable:false } // 판정자
                            ,delayDay:{type:"number", editable:false } // 지연일
                        }

                     }//model
               }//schema
            }//dataSource
            // pageable:false
            ,autoBind:false
            ,sortable:false
            ,editable:false
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
                params["sDocNo"] = selectedVal.docNo;
                params["sVinNo"] = selectedVal.vinNo;


                $.ajax({
                    url:"<c:url value='/ser/wac/sanbaoAppr/selectSanbaoApproveByKey.do' />"
                   ,data:JSON.stringify(params)
                   ,type:"POST"
                   ,dataType:"json"
                   ,contentType:"application/json"
                   ,error:function(jqXHR,status,error) {

                      dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                   }
                   ,success:function (result){

                       getResultDataSet(result);

                       $("#gridPart").data("kendoExtGrid").dataSource.data([]);
                       $("#gridPart").data("kendoExtGrid").dataSource.read();
                       $("#fileGrid").data("kendoExtGrid").dataSource.data([]);
                       $("#fileGrid").data("kendoExtGrid").dataSource.read();

                       setButtonEnable($("#statCd").val());

                    }

                }) ;



            }
            ,columns:[
                        {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                       ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:80, attributes :{"class":"al"}}
                       ,{field:"docNo", title:"<spring:message code='ser.lbl.docNo' />", width:100, attributes :{"class":"al"}}
                       ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:100, attributes :{"class":"al"}}
                       ,{field:"statCd", title:"<spring:message code='ser.lbl.statNm' />", width:80
                           ,attributes :{"class":"ac"} //statList statMap
                           ,template:"#=setStatCd(statCd)#"
                           ,editor:function(container, options){
                               $('<input required name="statCd" data-bind="value:' + options.field + '"/>')
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
                       ,{field:"judgNm", title:"<spring:message code='ser.lbl.hqApproveNm' />", width:100
                           ,attributes :{"class":"ac"}
                           ,format:"{0:<dms:configValue code='dateFormat' />}"
                       }
                       ,{field:"delayDay", title:"<spring:message code='ser.lbl.delayDay' />", width:80, attributes :{"class":"ar"}}
                     ]

        });


        /**부품 그리드 **/
        $("#gridPart").kendoExtGrid({
            gridId:"G-SER-0803-165102"
            ,dataSource:{
                transport:{
                       read :{
                           url:"<c:url value='/ser/wac/sanbaoAppr/selectSanbaoApproveParts.do' />"
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

                             params["sDocNo"] = $("#docNo").val();
                             params["sDlrCd"] = $("#dlrCd").val();

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
                            rnum:{type:"number", editable:false }
                           ,itemCd:{type:"string", editable:false, validation:{required:true} }//부품코드
                           ,itemNm:{type:"string", editable:false }//부품명
                           ,parOrdNo:{type:"string", editable:true, validation:{required:true} }// 부품주문번호
                           ,reqQty:{type:"number", editable:true, validation:{required:true} } //수량
                           ,saleUnitCd:{type:"string", editable:false }//단위
                           ,salePrc:{type:"number", editable:false } // 단가
                           ,saleAmt:{type:"number", editable:true }//금액
                           ,docNo:{type:"string", editable:true }//문서번호
                        }

                     }//model
               }//schema
            }//dataSource
            ,pageable:false
            ,autoBind:false
            ,height:104
            ,resizable:false
            ,multiSelectWithCheckbox:true
            ,filterable:false                 // 필터링 기능 사용안함
            ,edit:function(e){
                var fieldName = $(e.container.find("input")[0]).attr("name");
                 if(fieldName=="itemAmt" ){
                     this.closeCell();
                 }
             }
            ,columns:[
                        {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes :{"class":"al"}}
                       ,{field:"itemCd", title:"<spring:message code='ser.lbl.itemCd' />", width:80, attributes :{"class":"al"}}
                       ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:150, attributes :{"class":"al"}}
                       ,{field:"parOrdNo", title:"<spring:message code='ser.lbl.parOrdNo' />", width:80
                           ,attributes :{"class":"al"}
                           ,editor:function(container, options){
                               $('<input required id="parOrdNo" name="parOrdNo" maxLength=20 class="form_input" data-name="<spring:message code="ser.lbl.parOrdNo" />" data-bind="value:' + options.field + '"/>').appendTo(container)
                               $('<span class="k-invalid-msg" data-for="parOrdNo"></span>').appendTo(container);
                            }
                       }
                       ,{field:"reqQty", title:"<spring:message code='ser.lbl.itemQty' />", width:40
                           , attributes :{"class":"ar"}
                           , editor:function(container, options){
                               $('<input required name="reqQty" data-bind="value:' + options.field + '"/>')
                               .appendTo(container)
                               .kendoExtNumericTextBox({
                                   format:"n0"                // n0:###,###, n2:###,###.##
                                  ,decimals:0                // 소숫점
                                  ,min:1
                                  ,value:0
                                  ,spinners:false
                                  ,change:calPartAmt
                               });
                               $('<span class="k-invalid-msg" data-for="reqQty"></span>').appendTo(container);
                            }
                       }
                       ,{field:"saleUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:50, attributes :{"class":"ac"}, hidden:true}
                       ,{field:"salePrc", title:"<spring:message code='ser.lbl.itemUntPrc' />", width:50, attributes :{"class":"ar"}, hidden:true}
                       ,{field:"saleAmt", title:"<spring:message code='ser.lbl.itemAmt' />", width:50, attributes :{"class":"ar"} , hidden:true}
                       ,{field:"docNo", title:"<spring:message code='ser.lbl.docNo' />", width:50, attributes :{"class":"ar"} , hidden:true}
                     ]

        });

        setButtonEnable("");

        $("#tabstrip").kendoExtTabStrip({
            animation:false
        });
    });

</script>
<!-- //script -->
</body>

