<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 시승차량 신청 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.reqTestDriveVehicle" /></h1> <!-- 시승차량 신청 -->
            <div class="btn_right">
                <button id="btnCreate" class="btn_m"><spring:message code='global.lbl.registration' /></button>   <!-- 등록 -->
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per"  role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span><spring:message code="global.lbl.statNm" /></span></th> <!-- 상태 -->
                        <td>
                            <input name="sApproveCd" id="sApproveCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.fincReqDt" /></span></th> <!-- 신청일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sStartReqDt" id="sStartReqDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sEndReqDt" id="sEndReqDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.evalDt" /></span></th> <!-- 심사일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sStartEvalDt" id="sStartEvalDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sEndEvalDt" id="sEndEvalDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
                        <td>
                            <input id="sCarlineCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                        <td>
                            <input id="sModelCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th>     <!-- OCN -->
                        <td>
                            <input id="sOcnCd" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.extColor' /></th>        <!-- 외장색 -->
                        <td>
                            <input id="sExtColorCd" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.intColor' /></th>        <!-- 내장색 -->
                        <td class="bor_none">
                            <input id="sIntColorCd" class="form_comboBox" />
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script  type="text/javascript">
    //딜러코드
    var dlrCd  = "${dlrCd}";
    var dlrNm  = "${dlrNm}";

    // 사용자
    var userId = "${userId}";
    var userNm = "${userNm}";

    var sysDate = "${sysDate}";
    var fifteenDayBf = "${fifteenDayBf}"

    /************* 상태 SELECT BOX  *******************/
	var approveCdList = [];
    <c:forEach var="obj" items="${approveCdInfo}">
    approveCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var approveCdArr = dms.data.arrayToMap(approveCdList, function(obj){return obj.cmmCd});
    /************* 상태 SELECT BOX  *******************/

    /************* 차량유형 SELECT BOX  *******************/
    var tpCdList = [];
    <c:forEach var="obj" items="${tpCdInfo}">
    tpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var tpCdArr = dms.data.arrayToMap(tpCdList, function(obj){return obj.cmmCd});
    /************* 차량유형 SELECT BOX  *******************/

    /************* 보충자료 SELECT BOX  *******************/
    var fileYnList = [];
    <c:forEach var="obj" items="${fileYnInfo}">
    fileYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var fileYnArr = dms.data.arrayToMap(fileYnList, function(obj){return obj.cmmCd});
    /************* 보충자료 SELECT BOX  *******************/

    /************* 합격여부 SELECT BOX  *******************/
    var evalRsltYnList = [];
    <c:forEach var="obj" items="${evalRsltYnInfo}">
    evalRsltYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var evalRsltYnArr = dms.data.arrayToMap(evalRsltYnList, function(obj){return obj.cmmCd});
    /************* 합격여부 SELECT BOX  *******************/

    //신청구분 Array
    var reqTpList = [];
    <c:forEach var="obj" items="${reqTpInfo}">
    reqTpList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
    </c:forEach>

    //신청구분 Map
    var reqTpArr = dms.data.arrayToMap(reqTpList, function(obj){ return obj.cmmCd; });



    // 차종
    var carLineCdList = [];
    <c:forEach var="obj" items="${carLineCdInfo}">
        carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    </c:forEach>



    // 시승차량 신청 팝업
    var popupWindow = null;
    function selectAskHelpCarPopupWindow(data){
        var sDlrCd = dlrCd
          , sDlrNm = dlrNm
          , usrId  = userId
          , usrNm  = userNm
          , reqNo  = 0
          , sHeight = 485;
        
        if(typeof(data) != "undefined" ){
            sDlrCd = data.dlrCd;
            sDlrNm = data.dlrNm;
            usrId  = data.usrId;
            usrNm  = data.usrNm;
            reqNo = data.reqNo;
            if(data.approveCd == "C"){
                sHeight = 538;
            }
        }
        if( typeof($("#reqTestDrivePopup").data("kendoWindow")) != "undefined"){
            $("#reqTestDrivePopup").data("kendoWindow").setOptions({height:sHeight});
        }
        
        popupWindow = dms.window.popup({
            windowId:"reqTestDrivePopup"
            ,title:"<spring:message code='sal.title.reqTestDriveVehicle' />"   // 시승차량 신청
            ,width :800
            ,height:sHeight
            ,resizable:false
            ,content:{
                url:"<c:url value='/sal/svo/testDriveVehicle/selectReqTestDriveVehiclePopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"dlrCd":sDlrCd                   // 딜러코드
                    ,"dlrNm":sDlrNm                   // 딜러명
                    ,"usrId":usrId                    // 사용자id
                    ,"usrNm":usrNm                    // 사용자id
                    ,"reqNo":reqNo                    // 요청번호
                    ,"callbackFunc":function(data){
                        if (data.msg == "save"){
                            $('#grid').data('kendoExtGrid').dataSource.read();
                        }

                    }
                }
            }
        });
        
    }

	$(document).ready(function () {

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
         * 시작 등록일자 (From)
         */
         $("#sStartReqDt").kendoExtMaskedDatePicker({
             value:fifteenDayBf
             ,format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         })
         /**
         * 종료 등록일자 (From)
         */
         $("#sEndReqDt").kendoExtMaskedDatePicker({
             value:sysDate
             ,format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         })

         /**
          * 시작 심사일자 (From)
          */
         $("#sStartEvalDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         })
         /**
          * 종료 심사일자 (From)
          */
         $("#sEndEvalDt").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         })



        //차종
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carLineCdList
           ,optionLabel:" "   // 전체
           ,select:function(e){
               var dataItem = this.dataItem(e.item);
               $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sModelCd").data("kendoExtDropDownList").enable(true);

               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

               $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

               $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

               if(dataItem.carlineCd == ""){
                   $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
                   $("#sModelCd").data("kendoExtDropDownList").enable(false);
                   return false;
               }

               var responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/veh/vehicleMaster/selectModel.do' />"
                   ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
                   ,async:false
               });
               $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           }
        });

        // 모델
        $("#sModelCd").kendoExtDropDownList({
            dataTextField:"modelNm"
           ,dataValueField:"modelCd"
           ,optionLabel:" "   // 전체
           ,select:function(e){
               var dataItem = this.dataItem(e.item);
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(true);

               $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

               $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

               if(dataItem.modelCd == ""){
                   $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
                   $("#sOcnCd").data("kendoExtDropDownList").enable(false);
                   return false;
               }
               var responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/veh/vehicleMaster/selectOcn.do' />"
                   ,data:JSON.stringify({"carlineCd":$("#sCarlineCd").val(), "modelCd":dataItem.modelCd})
                   ,async:false
               });
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);       }
        });
        $("#sModelCd").data("kendoExtDropDownList").enable(false);

        // ocn
        $("#sOcnCd").kendoExtDropDownList({
             dataTextField: "ocnNm"
            ,dataValueField:"ocnCd"
            ,optionLabel:" "   // 전체
            ,select:function(e){
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sExtColorCd").data("kendoExtDropDownList").enable(true);

                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

                if(this.dataItem(e.item).ocnCd == ""){
                    $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                    return false;
                }

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/veh/vehicleMaster/selectExtColor.do' />"
                    ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                    ,async:false
                });
                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }
        });
        $("#sOcnCd").data("kendoExtDropDownList").enable(false);

        //외장색
        $("#sExtColorCd").kendoExtDropDownList({
             dataTextField: "extColorNm"
            ,dataValueField:"extColorCd"
            ,optionLabel:" "
            ,select:function(e){
                if(this.dataItem(e.item).extColorCd == ""){
                    $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                    return false;
                }

                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/veh/vehicleMaster/selectIntColor.do' />"
                    ,data:JSON.stringify({"modelCd":$("#sModelCd").data("kendoExtDropDownList").value() })
                    ,async:false
                });
                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }
        });
        $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

        //내장색
        $("#sIntColorCd").kendoExtDropDownList({
             dataTextField: "intColorNm"
            ,dataValueField:"intColorCd"
            ,optionLabel:" "
        });
        $("#sIntColorCd").data("kendoExtDropDownList").enable(false);




		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {
	            if( !($("#sStartReqDt").data('kendoExtMaskedDatePicker').value() == null && $("#sEndReqDt").data('kendoExtMaskedDatePicker').value() == null ) ){
                    if($("#sStartReqDt").data('kendoExtMaskedDatePicker').value() == null || $("#sEndReqDt").data('kendoExtMaskedDatePicker').value() == null){
                        //등록일자를 입력해 주십시오.
                        dms.notification.warning("<spring:message code='global.lbl.carRegDt' var='carRegDt' /><spring:message code='global.info.validation.required' arguments='${carRegDt}' />");
                        return false;
                    }
                }

	            if( !($("#sStartEvalDt").data('kendoExtMaskedDatePicker').value() == null && $("#sEndEvalDt").data('kendoExtMaskedDatePicker').value() == null ) ){
                    if($("#sStartEvalDt").data('kendoExtMaskedDatePicker').value() == null || $("#sEndEvalDt").data('kendoExtMaskedDatePicker').value() == null){
                        //심사일자를 입력해 주십시오.
                        dms.notification.warning("<spring:message code='global.lbl.evalDt' var='evalDt' /><spring:message code='global.info.validation.required' arguments='${evalDt}' />");
                        return false;
                    }
                }

	            $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

	    $("#btnCreate").kendoButton({ // 팝업호출
	        enable:true,
	        click:function(e){
	            selectAskHelpCarPopupWindow();
	        }
	    });

        //그리드 1번
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0721-115503"
           	,dataSource:{
               	transport:{
                     read:{
                         url:"<c:url value='/sal/svo/testDriveVehicle/selectReqTestDriveVehicle.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};
                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;

                             // 상태
                             params["sApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();
                             // 차량유형
                             params["sTpCd"] = 'N7'
                             // 등록일자
                             params["sStartReqDt"] = $("#sStartReqDt").data("kendoExtMaskedDatePicker").value();
                             params["sEndReqDt"]   = $("#sEndReqDt").data("kendoExtMaskedDatePicker").value();

                             // 심사일자
                             params["sStartEvalDt"] = $("#sStartEvalDt").data("kendoExtMaskedDatePicker").value();
                             params["sEndEvalDt"]   = $("#sEndEvalDt").data("kendoExtMaskedDatePicker").value();

                             // 차종
                             params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                             // 모델
                             params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();
                             // OCN
                             params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();
                             // 외장색
                             params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                             // 내장색
                             params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();


                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                      model:{
                          id:"reqNo",
                          fields:{
                              dlrCd :{type:"string", editable:false} //딜러코드
                              ,usrId:{type:"string"}            //사용자ID
                              ,reqNo:{type:"number"}           //요청번호
                              ,reqCarNo:{type:"string"}         //요청번호 (딜러코드+년월+SEQ)

                              ,tpCd:{type:"string"}             //유형코드(차량유형)
                              ,salePrsnNm:{type:"string"}       //판매담당자명
                              ,salePrsnTelNo:{type:"string"}    //판매담당자전화번호
                              ,reqTp:{type:"string"}            //요청유형(신청구분)
                              ,reqDt:{type:"date"}              //요청일자(등록일자)
                              ,evalDt:{type:"date"}             //심사일자
                              ,spcCarQty:{type:"number"}        //수량
                              ,approveCd:{type:"string"}        //승인여부(상태)

                              ,evalGradeCd:{type:"string"}      //심사등급코드
                              ,uploadUsrId:{type:"string"}      //업로드사용자ID
                              ,uploadSeq:{type:"string"}        //업로드일련번호
                              ,remark:{type:"string"}           //비고

                              ,approveEndDt:{type:"date"}       //승인종료일자
                              ,lastApproveCnt:{type:"number"}   //최종승인차수
                              ,delYn:{type:"string"}            //삭제여부
                              ,updtUsrId:{type:"string"}        //수정자ID
                              ,updtDt:{type:"date"}             //수정일자

                              ,fileYn:{type:"string"}           //보충자료
                              ,evalRsltYn:{type:"string"}       //합격여부
                              
                              ,carlineCd:{type:"string"}
                              ,carlineNm:{type:"string"}
                              ,modelNm:{type:"string"}
                              ,modelCd:{type:"string"}
                              ,ocnCd:{type:"string"}
                              ,ocnNm:{type:"string"}
                              ,extColorNm:{type:"string"}
                              ,extColorCd:{type:"string"}
                              ,intColorNm:{type:"string"}
                              ,intColorCd:{type:"string"}
                              ,asOrdDt:{type:"date"}
                              ,asPltGiDt:{type:"date"}
                          }
                     }
                 }
            }
            ,height:450
        	,multiSelectWithCheckbox:false
            ,editable   :false
            ,autoBind:false
            ,navigatable:true
            ,selectable:"row"
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,columns:[
                {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}       // 딜러코드
                ,{field:"usrId", hidden:true}       // 사용자ID
                ,{field:"reqNo", hidden:true}       // 신청번호
                ,{field:"reqCarNo", title:"<spring:message code='global.lbl.applNumber' />"
                    ,width:120
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 신청번호
                ,{field:"tpCd", title:"<spring:message code='global.lbl.carType' />"
                    ,width:80
                    ,template:"#=tpCdArr[tpCd].cmmCdNm#"
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 차량유형
                ,{field:"salePrsnNm", title:"<spring:message code='sal.lbl.prsNm' />"
                    ,width:80
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 판매담당자
                ,{field:"salePrsnTelNo", title:"<spring:message code='global.lbl.telNumer' />"
                    ,width:80
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 연락처
                ,{field:"reqTp", title:"<spring:message code='global.lbl.reqTpn' />"
                    ,width:80
                    ,template:"#=reqTpArr[reqTp].cmmCdNm#"
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 신청구분
                ,{field:"reqDt", title:"<spring:message code='global.lbl.fincReqDt' />"  //타이틀만 신청일자로 바꿈 (협의된 내용) 2016.04.11
                    ,width:60
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 등록일자
                ,{field:"evalDt", title:"<spring:message code='global.lbl.evalDt' />"
                    ,width:60
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 심사일자
                ,{field:"spcCarQty", title:"<spring:message code='global.lbl.qty' />"
                    ,width:35
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:right"}
                }  // 수량
                ,{field:"approveCd", title:"<spring:message code='global.lbl.statNm' />"
                    ,width:55
                    ,template:"#=approveCdArr[approveCd].cmmCdNm#"
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 상태
                ,{field:"fileYn", title:"<spring:message code='sal.lbl.reUploadFile' />"
                    ,width:75
                    ,template:"#if(fileYn != null){# #= fileYnArr[fileYn].cmmCdNm # #}#"
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 보충자료
                ,{field:"evalRsltYn", title:"<spring:message code='global.lbl.evalRsltChoice' />"
                    ,width:70
                    ,headerAttributes:{style:"text-align:center;"}
                    ,hidden:true
                }  // 심사여부
                ,{
                    field:"fsdmAgrYn"
                   ,title:"<spring:message code='global.lbl.whthrPassing' />"
                   ,width:80
                   ,template:"#if(fsdmAgrYn != null){# #= evalRsltYnArr[fsdmAgrYn].cmmCdNm # #}#"
                   ,attributes:{"class":"ac"}
                }  //합격여부
                ,{field:"carlineCd", title:"<spring:message code='global.lbl.carLine' />", width:100}   //차종코드
                ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:100} //차종명
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:120}       //모델
                ,{field:"modelCd", title:"<spring:message code='global.lbl.modelCd' />", width:100}     //모델코드
                ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocnCode' />", width:100}       //OCN코드
                ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:120}           //OCN명
                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:120} //외장색
                ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />", width:100} //외장색상코드
                ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:120}   //내장색명
                ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />", width:100} //내장색상코드
                ,{field:"asOrdDt", title:"<spring:message code='sal.lbl.asOrdDt' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:"#= dms.string.strNvl(kendo.toString(data.asOrdDt, '<dms:configValue code='dateFormat' />')) #"
                } //이전 신청일자
                ,{field:"asPltGiDt", title:"<spring:message code='sal.lbl.asPltGiDt' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:"#= dms.string.strNvl(kendo.toString(data.asPltGiDt, '<dms:configValue code='dateFormat' />')) #"
                } //이전 제조사 출고일자
            ]
    	});

    	// 그리드 더블클릭
	    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
	        var grid = $("#grid").data("kendoExtGrid");
	        var selectedItem = grid.dataItem(grid.select());

	        selectAskHelpCarPopupWindow(selectedItem);
	    });

	}); //document.ready End


function gridReLosd(){
    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
    $("#grid").data("kendoExtGrid").dataSource.page(1);
}


</script>