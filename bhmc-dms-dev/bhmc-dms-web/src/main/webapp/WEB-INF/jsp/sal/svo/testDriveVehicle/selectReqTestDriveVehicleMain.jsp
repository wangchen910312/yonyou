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
                <dms:access viewId="VIEW-D-11236" hasPermission="${dms:getPermissionMask('READ')}">
                    <button id="btnCreate" class="btn_m"><spring:message code='global.lbl.registration' /></button>   <!-- 등록 -->
                </dms:access>
                <dms:access viewId="VIEW-D-11235" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per"  role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:20%;">
                    <col style="width:8%;">
                    <col style="width:23%;">
                    <col style="width:8%;">
                    <col style="width:23%;">
                    <col style="width:8%;">
                    <col style="width:20%;">
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
                                    <input name="sStartReqDt" id="sStartReqDt" class="form_datepicker ac">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sEndReqDt" id="sEndReqDt" class="form_datepicker ac">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.evalDt" /></span></th> <!-- 심사일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sStartEvalDt" id="sStartEvalDt" class="form_datepicker ac ">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sEndEvalDt" id="sEndEvalDt" class="form_datepicker ac ">
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
                        <th scope="row"></th>
                        <td></td>
                        <th scope="row"></th>
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
    var userTelNum = "${userTelNo}";

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
          , userTelNo = userTelNum
          , reqNo  = 0
          , sHeight = 450;

        if(typeof(data) != "undefined" ){
            sDlrCd = data.dlrCd;
            sDlrNm = data.dlrNm;
            usrId  = data.usrId;
            usrNm  = data.usrNm;
            userTelNo = data.salePrsnTelNo;
            reqNo = data.reqNo;
          //  if(data.approveCd == "C"){
          //      sHeight = 538;
          //  }
        }
        //if( typeof($("#reqTestDrivePopup").data("kendoWindow")) != "undefined"){
        //    $("#reqTestDrivePopup").data("kendoWindow").setOptions({height:sHeight});
        //}

        popupWindow = dms.window.popup({
            windowId:"reqTestDrivePopup"
            ,title:"<spring:message code='sal.title.reqTestDriveVehicle' />"   // 시승차량 신청
            //,width :800
            //,height:sHeight
            ,width :900  //Q21012900011 DMS试驾车申请 新增界面 申请类型 新建店申请 改成  “首次申请”  弹框放大 jiaMing 2021-3-10
            ,height:600  //Q21012900011 DMS试驾车申请 新增界面 申请类型 新建店申请 改成  “首次申请” 弹框放大    jiaMing 2021-3-10
            ,resizable:false
            ,modal:true
            ,content:{
                url:"<c:url value='/sal/svo/testDriveVehicle/selectReqTestDriveVehiclePopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"dlrCd":sDlrCd                   // 딜러코드
                    ,"dlrNm":sDlrNm                   // 딜러명
                    ,"usrId":usrId                    // 사용자id
                    ,"usrNm":usrNm                    // 사용자id
                    ,"userTelNo":userTelNo
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

               if(dataItem.carlineCd == ""){
                   $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
                   $("#sModelCd").data("kendoExtDropDownList").enable(false);
                   return false;
               }

               var responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/veh/vehicleMaster/selectModelTypeCombo.do' />"
                   ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
                   ,async:false
               });
               $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           }
        });

        // 모델
        $("#sModelCd").kendoExtDropDownList({
            dataTextField:"fscNm"
           ,dataValueField:"fscCd"
           ,optionLabel:" "   // 전체
        });
        $("#sModelCd").data("kendoExtDropDownList").enable(false);

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
                             // 차관
                             params["sFscCd"] = $("#sModelCd").data("kendoExtDropDownList").value();

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
                              ,fileUpNm:{type:"string"}           //화표사진
                              ,fileUpDt:{type:"date"}           //화표일자

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
                      //:신청번호,신청유형,신쳥일자,심사일자,상태,첨부업로드,재차심사,
                {field:"reqCarNo", title:"<spring:message code='global.lbl.applNumber' />",width:120,attributes:{"class":"ac"}}  // 신청번호
                ,{field:"reqTp", title:"<spring:message code='global.lbl.reqTpn' />",width:100
                    ,template:"#=reqTpArr[reqTp].cmmCdNm#"
                    ,attributes:{"class":"ac"}
                }  // 신청구분
                ,{field:"reqDt", title:"<spring:message code='global.lbl.fincReqDt' />"  //타이틀만 신청일자로 바꿈 (협의된 내용) 2016.04.11
                    ,width:100
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{"class":"ac"}
                }  // 신청일자
                ,{field:"evalDt", title:"<spring:message code='global.lbl.evalDt' />",width:100
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{"class":"ac"}
                }  // 심사일자
                ,{field:"approveCd", title:"<spring:message code='global.lbl.statNm' />",width:55
                    ,template:"#=approveCdArr[approveCd].cmmCdNm#"
                    ,attributes:{"class":"ac"}
                }  // 상태
                ,{field:"fileYn", title:"<spring:message code='sal.lbl.reUploadFile' />",width:75
                    ,template:"#if(fileYn != null){# #= fileYnArr[fileYn].cmmCdNm # #}#"
                }  // 보충자료
                ,{field:"fsdmAgrYn",title:"<spring:message code='sal.lbl.fsdmAgrm' />",width:80
                   ,template:"#if(fsdmAgrYn != null){# #= evalRsltYnArr[fsdmAgrYn].cmmCdNm # #}#"
                   ,attributes:{"class":"ac"}
                }  //합격여부
                ,{field:"carlineCd", title:"<spring:message code='global.lbl.carLine' />", width:100}   //차종코드
                ,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:100} //차종명
                ,{field:"modelCd", title:"<spring:message code='global.lbl.modelCd' />", width:100, hidden:true}     //모델코드
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:120}       //모델
                ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocn' />", width:100}       //OCN코드
                ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocnNm' />", width:120}           //OCN명
                ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />", width:100 } //외장색상코드
                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />", width:120} //외장색
                ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:120, hidden:true}   //내장색명
                ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />", width:100} //내장색상코드
                ,{field:"asOrdDt", title:"<spring:message code='sal.lbl.asOrdDt' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:"#= dms.string.strNvl(kendo.toString(data.asOrdDt, '<dms:configValue code='dateFormat' />')) #"
                } //이전 신청일자
                ,{field:"asPltGiDt", title:"<spring:message code='sal.lbl.asPltGiDt' />", width:100
                    ,attributes:{"class":"ac"}
                    ,template:"#= dms.string.strNvl(kendo.toString(data.asPltGiDt, '<dms:configValue code='dateFormat' />')) #"
                } //이전 제조사 출고일자
                ,{field:"tpCd", title:"<spring:message code='global.lbl.carType' />",width:80 ,hidden:true// 차량유형
                    ,template:"#=tpCdArr[tpCd].cmmCdNm#"
                }
               ,{field:"salePrsnNm", title:"<spring:message code='sal.lbl.salePrsnNm' />",width:80}  // 판매담당자
               ,{field:"salePrsnTelNo", title:"<spring:message code='sal.lbl.helpCarTelNumer' />",width:80}  // 연락처
               ,{field:"evalRsltYn", title:"<spring:message code='global.lbl.evalRsltChoice' />",width:70,hidden:true}  // 심사여부
               ,{field:"spcCarQty", title:"<spring:message code='global.lbl.qty' />",width:35,attributes:{"class":"ar"},hidden:true}  // 수량
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}       // 딜러코드
               ,{field:"usrId", hidden:true}       // 사용자ID
               ,{field:"reqNo", hidden:true}       // 신청번호
           /*   ,{field:"fileUpNm", title:"发票图片", width:150
                   ,attributes:{"class":"al"}
               }  // 화표사진
               ,{field:"fileUpDt", title:"发票日期", width:100
                   ,attributes:{"class":"ac"}
                   ,template:"#= dms.string.strNvl(kendo.toString(data.fileUpDt, '<dms:configValue code='dateFormat' />')) #"
               } //화표일자 */
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