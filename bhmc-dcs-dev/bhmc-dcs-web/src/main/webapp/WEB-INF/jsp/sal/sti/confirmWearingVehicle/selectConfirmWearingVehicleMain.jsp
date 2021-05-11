<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 완성차 입고확정 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.confirmWearingVehicle" /></h1> <!-- 완성차 입고확정 -->
            <div class="btn_right">
                <!-- <button class="btn_m" id="btnEval">评价</button> --> <!-- 평가 -->
                <button class="btn_m" id="btnReceiveCnfrm"><spring:message code="par.btn.receiveCnfm" /></button> <!-- 입고확정 -->
                <button class="btn_m" id="btnReceiveCncl"><spring:message code="global.btn.receiveCncl" /></button> <!-- 입고취소 -->
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
                        <th scope="row"><span><spring:message code="global.lbl.vinSts" /></span></th> <!-- 차량상태 -->
                        <td>
                            <label for="sVinmStatus50" class="label_check">
                                <input type="radio" id="sVinmStatus50" name="sVinmStatus" value="60" class="form_check" onClick="slcRadio(1);"/>
                                <spring:message code="par.lbl.receive" />
                            </label> <!-- 입고 -->
                            <label for="sVinmStatus60" class="label_check">
                                <input type="radio" id="sVinmStatus60" name="sVinmStatus" value="50" checked class="form_check" onClick="slcRadio(2);"/>
                                <spring:message code="global.lbl.notReceive" />
                            </label> <!-- 미입고 -->
                        </td>
                        <th scope="row"><span><spring:message code="par.lbl.purcOrdTp" /></span></th> <!-- 오더유형 -->
                        <td>
                            <input name="sOrdTp" id="sOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.vinNo" /></span></th> <!-- VIN -->
                        <td>
                            <input name="sVinNo" id="sVinNo" type="text" class="form_input">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span><spring:message code="global.lbl.carLine" /></span></th> <!-- 차종 -->
                        <td>
                            <input name="sCarlineCd" id="sCarlineCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.model" /></span></th> <!-- 모델 -->
                        <td>
                            <input name="sModelCd" id="sModelCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.orderRegDt" /></span></th> <!-- 주문등록일 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sOrdDtS" id="sOrdDtS"  class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sOrdDtE" id="sOrdDtE"  class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="grid"></div>
        </div>
    </section>

<script  type="text/javascript">
     var oneDay = "${oneDay}";
     var toDay = "${toDay}";

     /************* 주문유형 SELECT BOX [SAL138]  *******************/
	 var ordTpList = [];
     <c:forEach var="obj" items="${ordTpInfo}">
     ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var ordTpArr = dms.data.arrayToMap(ordTpList, function(obj){return obj.cmmCd});
     /************* 주문유형 SELECT BOX  *******************/

     //하치장 Array[SAL152]
     var carDumpCdList = [];
     <c:forEach var="obj" items="${carDumpCdInfo}">
     carDumpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     //하치장 Map
     var carDumpCdArr = dms.data.arrayToMap(carDumpCdList, function(obj){ return obj.cmmCd; });

     /************* 차량상태(입고확정상태) SELECT BOX [SAL001] *******************/
     var carStatCdList = [];
     <c:forEach var="obj" items="${carStatCdInfo}">
     carStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var carStatCdArr = dms.data.arrayToMap(carStatCdList, function(obj){return obj.cmmCd});
     /************* 차량상태 SELECT BOX  *******************/


     /**
     * 차종 콤보
     */
     var carLineCdList = [];
     var carLineCdArr = [];
     <c:forEach var="obj" items="${carLineCdInfo}">
      carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
      carLineCdArr["${obj.carlineCd}"] = "${obj.carlineNm}";
     </c:forEach>
     var modelCdList = [];
     var modelCdArr;
     var ocnCdList = [];


     save = function(cnfrmInfo, carStatCd, prty) {
         var saveData;
         var saveFlag = true;

         var arrSave = [];

         var grid = $("#grid").data("kendoExtGrid");
         var rows = grid.select();

         if(rows.length  == 0 ){
             //차량을 선택해주세요.
             dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
             return false;
         }else{
             rows.each(function(index, row) {
                 var dataItem = grid.dataItem(row);

                 if( carStatCd == "50" && dataItem.carStatCd != "60"){
                     // 입고확정 상태에서만  입고취소 처리를 할 수 있습니다.
                     dms.notification.info("<spring:message code='sal.lbl.receiveCnfmInfo' var='confirm' /><spring:message code='sal.lbl.receiveCncl' var='cancel' /><spring:message code='sal.info.chkStatConfirm' arguments='${confirm},${cancel},' />");

                     arrSave = [];
                     saveFlag = false;
                     return false;
                 }
                 arrSave.push(dataItem);

             });
         }

         if( saveFlag ){
             if( carStatCd == "50" ){
                 // 입고취소 처리를 하시겠습니까?
                 if( !confirm("<spring:message code='sal.lbl.receiveCncl' var='cancel' /><spring:message code='global.info.cnfrmMessage' arguments='${cancel},' />")){
                     return;
                 }
             }
             var saveData = {};

             if( cnfrmInfo != null ){
                 saveData = { "carStatCd":carStatCd
                             ,"prty":prty
                             ,"updateList":arrSave
                             ,"popupVO":cnfrmInfo};
             }else{
                 saveData = { "carStatCd":carStatCd
                             ,"prty":prty
                             ,"updateList":arrSave};
             }

             $.ajax({
                 url:"<c:url value='/sal/sti/confirmWearingVehicle/updateConfirmWearingVehicle.do' />",
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

                     //정상적으로 반영 되었습니다.
                     dms.notification.success("<spring:message code='global.info.success'/>");
                 }
             });
         }
     }

  // 집단판매 차량적용 팝업
     var popupWindow;
     function selectConfirmWearingPopupWindow(strVinNo){

         popupWindow = dms.window.popup({
             windowId:"confirmWearingPopup"
             ,title:""   //
             ,width :500
             ,height:285
             ,resizable:false
             ,content:{
                 url:"<c:url value='/sal/sti/confirmWearingVehicle/selectConfirmWearingVehiclePopupMain.do'/>"
                 ,data:{
                     "type":"custom1"
                     ,"autoBind":false
                     ,"strVinNo":strVinNo                  //
                     ,"callbackFunc":function(data){
                         if (data.msg == "save"){
                             save(data.result, "60", "D");
                         }

                     }
                 }
             }

         });
     }

     function fnChkVehiclePopup(){

         var grid = $('#grid').data('kendoExtGrid');
         var rows = grid.select();
         if(rows.length  == 0 ){
             //목록을 선택하여 주십시오.
             dms.notification.info("<spring:message code='global.info.required.select'/>");
             return false;
         }

         var strVinNo = "";
         var strCarStatCd = "";
         var checkFlag = true;

         if( rows.length > 1){
             rows.each(function(index, row) {
                 var gridData = grid.dataItem(rows[index]);

                 if( gridData.carStatCd == "60" ){
                     // 이미 입고확정 되었습니다.
                     dms.notification.info("<spring:message code='sal.lbl.receiveCnfmInfo' var='confirm' /><spring:message code='global.info.usedMsg' arguments='${confirm},' />");

                     checkFlag = false;
                     return false;
                 }
             });

             if( checkFlag ){
                 selectConfirmWearingPopupWindow(strVinNo);
             }
         }else if( rows.length == 1){
             var gridData = grid.dataItem(rows[0]);
             strVinNo = gridData.vinNo;
             strCarStatCd = gridData.carStatCd;

             if( strCarStatCd == "60" ){
                 // 이미 입고확정 되었습니다.
                 dms.notification.info("<spring:message code='sal.lbl.receiveCnfmInfo' var='confirm' /><spring:message code='global.info.usedMsg' arguments='${confirm},' />");
                 return;

             }else if( strCarStatCd == "50" ){
                 // 입고확정 처리를 하시겠습니까?
                 //if( !confirm("<spring:message code='sal.lbl.receiveCnfmInfo' var='confirm' /><spring:message code='global.info.cnfrmMessage' arguments='${confirm},' />")){
                 //    return;
                 //}

                 //save(null, "60", "D")
                 //}else{
                 selectConfirmWearingPopupWindow(strVinNo);
             }
         }else{
             // 차량을 선택해주세요.
             dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.usedMsg' arguments='${car},' />");
             return false;
         }
     }

	$(document).ready(function () {

	    $("#sOrdTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:ordTpList
           ,optionLabel:" "  // 선택
        });

        /**
        * 차종 콤보박스
        */
        $("#sCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
           ,dataValueField:"carlineCd"
           ,dataSource:carLineCdList
           ,select:onSelectCarlineCd
           ,optionLabel:" "  // 전체
        });
        /**
        * 모델 콤보박스
        */
        $("#sModelCd").kendoExtDropDownList({
            dataTextField:"modelNm"
           ,dataValueField:"modelCd"
           ,optionLabel:" "  // 전체
        });

	    /**
        * 차종에 따른 모델 조회
        */
        function onSelectCarlineCd(e) {

            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecModelList.do'/>"
                ,data:JSON.stringify({"carlineCd":this.dataItem(e.item).carlineCd})
                ,async:false
            });

            $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        };

        /**
         * 시작일자 (From)
         */
         $("#sOrdDtS").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:oneDay
         });

         /**
         * 종료일자 (From)
         */
         $("#sOrdDtE").kendoExtMaskedDatePicker({
             format:"<dms:configValue code='dateFormat' />"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
             ,value:toDay
         });

         // 조회조건 - 시작일, 종료일
         $("#sOrdDtS").on('change', {from:$("#sOrdDtS"), to:$("#sOrdDtE")}, fnChkSearchDate);
         $("#sOrdDtE").on('change',   {from:$("#sOrdDtS"), to:$("#sOrdDtE")}, fnChkSearchDate);

         /*********************************************** 검색 조건 영역 END ************************************************************/

		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {

	            $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

	    //버튼 - 입고확정
        $("#btnReceiveCnfrm").kendoButton({
            enable:true,
            click:function(e) {
                fnChkVehiclePopup();

            }
        });

        //버튼 - 입고취소
        $("#btnReceiveCncl").kendoButton({
            enable:false,
            click:function(e) {
                save(null, "50", "C");

            }
        });

        /*********************************************** 버튼영역 END ************************************************************/

        //그리드
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0721-115005"
           	,dataSource:{
               	transport:{
                     read:{
                         url:"<c:url value='/sal/sti/confirmWearingVehicle/selectConfirmWearingVehicle.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};
                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;

                             params["sOrdTp"] = $("#sOrdTp").data('kendoExtDropDownList').value();
                             params["sOrdDtS"] = $("#sOrdDtS").data('kendoExtMaskedDatePicker').value();
                             params["sOrdDtE"] = $("#sOrdDtE").data('kendoExtMaskedDatePicker').value();
                             params["sVinNo"] = $("#sVinNo").val();

                             params["sCarlineCd"] = $("#sCarlineCd").data('kendoExtDropDownList').value();
                             params["sModelCd"] = $("#sModelCd").data('kendoExtDropDownList').value();

                             $("input[name='sVinmStatus']").each(function(){
                                 if( this.checked ){
                                     params["sCarStatCd"] = this.value;
                                 }
                             });
                             //console.log(kendo.stringify(params));

                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                      model:{
                          id:"vinNo"
                          ,fields:{
                               carId:{type:"string"}
                              ,vinNo1:{type:"string", hidden:true}
                              ,vinNo2:{type:"string", hidden:true}
                              ,carStatCd:{type:"string"}
                              ,dstbCmpNm:{type:"string"}
                              ,carRegNo:{type:"string"}
                              ,ordNo:{type:"string"}
                              ,vinNo:{type:"string"}
                              ,carDumpCd:{type:"string"}
                              ,carlineNm:{type:"string"}
                              ,modelNm:{type:"string"}
                              ,ocnNm:{type:"string"}
                              ,extColorNm:{type:"string"}
                              ,intColorNm:{type:"string"}
                              ,ordTp:{type:"string"}
                              ,manufactYyMmDt:{type:"string"}
                              ,asdy:{type:"date"}
                              ,grDt:{type:"date"}
                              ,enginNo:{type:"string"}
                              ,certNo:{type:"string"}
                              ,chrgCd:{type:"string"}
                              ,rfidNo:{type:"string"}
                          }
                     }
                 }
            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
    	    ,autoBind:false
            ,scrollable:true
            ,editable:false
            ,columns:[
                 {field:"carId"    ,hidden:true}  // CAR_ID
                ,{field:"vinNo1"   ,hidden:true}  // VIN_NO1
                ,{field:"vinNo2"   ,hidden:true}  // VIN_NO2
                ,{field:"carStatCd",hidden:true}  // 차량상태
                ,{field:"dstbCmpNm"        ,title:"<spring:message code='global.lbl.logisticsCmpn' />"       ,width:60 ,attributes:{"class":"al"}}  // 물류회사
                ,{field:"carRegNo"         ,title:"<spring:message code='global.lbl.licensePlt' />"          ,width:50 ,attributes:{"class":"al"}}  // 번호판
                ,{field:"ordNo"            ,title:"<spring:message code='global.lbl.ordNo' />"               ,width:50 ,attributes:{"class":"ac"}}  // 주문번호
                ,{field:"vinNo"            ,title:"<spring:message code='sal.lbl.vinNo' />"                  ,width:90 ,attributes:{"class":"ac"}}  // VIN번호
                ,{field:"carStatCd"        ,title:"<spring:message code='global.lbl.vinSts' />"              ,width:80 ,attributes:{"class":"ac"}
                    ,template:"# if(carStatCdArr[carStatCd] != null) { # #= carStatCdArr[carStatCd].cmmCdNm# # }#"
                 }  // 차량상태
                ,{field:"carDumpCd"        ,title:"<spring:message code='global.lbl.yard' />"                ,width:60 ,attributes:{"class":"ac"}
                    ,template:"# if(carDumpCdArr[carDumpCd] != null) { # #= carDumpCdArr[carDumpCd].cmmCdNm# # }#"
                 }  // 하차장
                ,{field:"carlineNm"        ,title:"<spring:message code='global.lbl.carLine' />"             ,width:60 ,attributes:{"class":"al"}}  // 차종
                ,{field:"modelNm"          ,title:"<spring:message code='global.lbl.model' />"               ,width:70 ,attributes:{"class":"al"}}  // 모델
                ,{field:"ocnNm"           ,title:"<spring:message code='global.lbl.ocn' />"                 ,width:70 ,attributes:{"class":"al"}}  // OCN
                ,{field:"extColorNm"      ,title:"<spring:message code='global.lbl.extColor' />"            ,width:60 ,attributes:{"class":"al"}}  // 외장색
                ,{field:"intColorNm"      ,title:"<spring:message code='global.lbl.intColor' />"            ,width:60 ,attributes:{"class":"al"}}  // 내장색
                ,{field:"rfidNo"          ,title:"RFID",width:60,attributes:{"class":"ac"}}  // RFID NO
                ,{field:"ordTp"           ,title:"<spring:message code='par.lbl.purcOrdTp' />"              ,width:50 ,attributes:{"class":"ac"}
                    ,template:"# if(ordTpArr[ordTp] != null) { # #= ordTpArr[ordTp].cmmCdNm# # }#"
                 }  // 주문유형
                ,{field:"manufactYyMmDt"  ,title:"<spring:message code='global.lbl.creDt' />"               ,width:50 ,attributes:{"class":"ac"}}  // 생산년월
                ,{field:"asdy"            ,title:"<spring:message code='global.lbl.corporationRealseDt' />" ,width:70 ,attributes:{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                 }  // 법인출고일자
                ,{field:"grDt"            ,title:"<spring:message code='sal.lbl.grDt' />"                   ,width:70 ,attributes:{"class":"ac"}
                    , format:"{0:<dms:configValue code='dateFormat' />}"
                 }  // 입고일자
                ,{field:"enginNo"         ,title:"<spring:message code='global.lbl.engnNo' />"              ,width:60 ,attributes:{"class":"al"}}  // 엔진번호
                ,{field:"certNo"          ,title:"<spring:message code='global.lbl.vehicleWarrant' />"      ,width:60 ,attributes:{"class":"al"}}  // 차량합격증
                ,{field:"chrgCd"          ,title:"<spring:message code='global.lbl.prsNm' />"               ,width:50 ,attributes:{"class":"ac"}}  // 담당자
            ]
    	});

	}); //document.ready End


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

	slcRadio = function(val){
	    switch(val){
	        case 1:
	            $("#btnReceiveCnfrm").data("kendoButton").enable(false);
                $("#btnReceiveCncl").data("kendoButton").enable(true);
	            break;
	        case 2:
                $("#btnReceiveCnfrm").data("kendoButton").enable(true);
                $("#btnReceiveCncl").data("kendoButton").enable(false);
	            break;
	        default:
	            $("#btnReceiveCnfrm").data("kendoButton").enable(false);
	            $("#btnReceiveCncl").data("kendoButton").enable(false);
	            break;
	    }
	    $('#grid').data('kendoExtGrid').dataSource.page(1);
	}
</script>