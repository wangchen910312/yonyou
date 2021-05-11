<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<div id="resizableContainer">
    <div class="content">
        <input type="hidden" id="dlrCd" name="dlrCd" value="${dlrCd}"/>
        <!-- 정산취소 -->
        <section class="group">
            <div class="header_area">
                <div class="btn_left">
                    <dms:access viewId="VIEW-D-13101" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" id="btnInit" class="btn_m btn_reset"><spring:message code="global.btn.init" /></button>
                    </dms:access>
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-11609" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11610" hasPermission="${dms:getPermissionMask('READ')}">
                        <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="ser.btn.cancel" /></button>
                    </dms:access>
                </div>
            </div>
            <form id="searchForm">
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.calcDt' /><!--  정산일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sCalcRegFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sCalcRegToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                            <td>
                                <input type="text" id="sCarRegNo" class="form_input" style="text-transform:uppercase">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.vinNo' /><!--  VIN --></th>
                            <td>
                                <input type="text" id="sVinNo" class="form_input" style="text-transform:uppercase">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.roTp' /><!-- RO유형 --></th>
                            <td>
                                <input id="sRoTp" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.roDocNo' /><!-- RO번호 --></th>
                            <td>
                                <input type="text" id="sRoDocNo" class="form_input" style="text-transform:uppercase">
                            </td>
                            <th scope="row"><spring:message code='global.lbl.calcNo' /><!-- 정산번호 --></th>
                            <td>
                                <input type="text" id="sCalcDocNo" class="form_input" style="text-transform:uppercase">
                            </td>

                            <th scope="row"><spring:message code='ser.lbl.carOwner' /></th><!-- 소유자 -->
                            <td>
                                <input type="text" id="sCarOwnerNm" class="form_input" style="text-transform:uppercase">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.driver' /></th><!-- 운전자 -->
                            <td>
                                <input type="text" id="sDriverNm" class="form_input" style="text-transform:uppercase">
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
            </form>

            <div class="table_grid mt10">
                <div id="gridHeader" class="resizable_grid"></div>
            </div>
        </section>
    </div>
</div>

<!-- script -->
<script>

//RO상태 Array
var roStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//RO상태 Map
var roStatCdMap = dms.data.arrayToMap(roStatCdList, function(obj){ return obj.cmmCd; });

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd;});

//RO상태
roStatCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roStatCdMap[val] != undefined)
        returnVal = roStatCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// RO유형
roTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(roTpCdArr[val] != undefined)
        returnVal = roTpCdArr[val].cmmCdNm;
    }
    return returnVal;
};

var calcCancelPopup;
var popupWindow; //贾明 卡券反核销功能 贾明 2020-6-3 
$(document).ready(function() {
    // RO유형
    $("#sRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 초기화 버튼.
    $("#btnInit").kendoButton({
        click:function(e){
            $("#searchForm").get(0).reset();
            $("#sCalcRegFromDt").data("kendoExtMaskedDatePicker").value("${sCalcFromDt}");
            $("#sCalcRegToDt").data("kendoExtMaskedDatePicker").value("${sCalcToDt}");
            $("#gridHeader").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#gridHeader").data("kendoExtGrid").dataSource.page(1);
        }
    });

    // 취소 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){

            var grid = $("#gridHeader").data("kendoExtGrid");
            var rows = grid.select();
            var selectedVal = grid.dataItem(rows);
			
			//结算取消时 卡券核销功能 贾明 2020-6-3 start
            //console.log("获取的数据",selectedVal.lanBinCardNo);
            if(dms.string.isEmpty(selectedVal.lanBinCardNo)){
               cancelBilling();//正常取消结算
            }
            
            if(dms.string.isNotEmpty(selectedVal.lanBinCardNo)){
                //selectedVal.lanBinCardEffeDt;
                //结算完成时
              if("00" == selectedVal.calcStatCd){
                 var promptVal = "";
                 var lanBiDt = selectedVal.lanBinCardEffeDt.substr(0,11);
                 var lanBiDte = kendo.toString(kendo.parseDate(lanBiDt,'yyyy-MM-dd'), "yyyyMMdd");
                 var nowDate = kendo.toString(new Date(), "yyyyMMdd");//当前系统时间
                 console.log(typeof(kendo.parseFloat(nowDate)))
                 if(kendo.parseFloat(lanBiDte) >= kendo.parseFloat(nowDate)){
                    promptVal = "<spring:message code='ser.info.CancelBillingCardInfo' />";
                  } else {
                   promptVal = "<spring:message code='ser.info.cardExpired' />";
                  }
                
                    popupWinSettCards(promptVal);//反核销后再进行 取消结算
                 }else{
                   cancelBilling();//正常取消结算
                 }
            }
            
            //结算取消时 卡券核销功能 贾明 2020-6-3 end
           /**
            calcCancelPopup = dms.window.popup({
                windowId:"calcCancelPopup"
                , title:"<spring:message code='ser.menu.calcCanc'/>"   // 사전점검취소
                , width:400
                , height:200
                , content:{
                    url:"<c:url value='/ser/cal/calculate/selectCalculateCancelPopup.do'/>"
                    ,data:{
                        "calcDocNo": selectedVal.calcDocNo
                        ,"callbackFunc":function(data){


                            var gridData = [];
                            $.each(rows, function(idx, row){
                                gridData.push(grid.dataItem(row));
                                gridData[idx].calcCancReasonCont = data.calcCancReasonCont;
                                gridData[idx].calcCancReasonCd = data.calcCancReasonCd;
                                gridData[idx].calcStatCd = data.calcStatCd;
                                gridData[idx].serParDstinCd = "SER";
                            });

                            if(data != null){
                                $.ajax({
                                    url:"<c:url value='/ser/cal/calculate/multiCalculateCancel.do' />"
                                    ,data:JSON.stringify(gridData)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR, status, error){
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,success:function(result, textStatus){

                                        dms.notification.success("<spring:message code='ser.lbl.calc' var='calc' /><spring:message code='global.info.cancelSuccessParam' arguments='${calc}' />");
                                        $("#btnSearch").click();

                                    }
                                    ,beforeSend:function(xhr){
                                        dms.loading.show($("#resizableContainer"));
                                    }
                                    ,complete:function(xhr,status){
                                        dms.loading.hide($("#resizableContainer"));
                                    }
                                });
                            }

                        }
                    }
                }
            });
           **/

            /*

            if(rows !== null){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });


                $.ajax({
                    url:"<c:url value='/ser/cal/calculate/multiCalculateCancel.do' />"
                    ,data:JSON.stringify(data)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,success:function(result, textStatus){
                        $("#gridHeader").data("kendoExtGrid").dataSource.read();
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#resizableContainer"));
                    }
                });
            } else {
                dms.notification.info("<spring:message code='ser.info.cancelNoData' />");
            }
 */
        }
    });
	
	//取消结算 贾明 2020-6-3 
	cancelBilling = function(){
		 var grid = $("#gridHeader").data("kendoExtGrid");
            var rows = grid.select();
            var selectedVal = grid.dataItem(rows);
		calcCancelPopup = dms.window.popup({
                windowId:"calcCancelPopup"
                , title:"<spring:message code='ser.menu.calcCanc'/>"   // 사전점검취소
                , width:400
                , height:200
                , content:{
                    url:"<c:url value='/ser/cal/calculate/selectCalculateCancelPopup.do'/>"
                    ,data:{
                        "calcDocNo": selectedVal.calcDocNo
                        ,"callbackFunc":function(data){


                            var gridData = [];
                            $.each(rows, function(idx, row){
                                gridData.push(grid.dataItem(row));
                                gridData[idx].calcCancReasonCont = data.calcCancReasonCont;
                                gridData[idx].calcCancReasonCd = data.calcCancReasonCd;
                                gridData[idx].calcStatCd = data.calcStatCd;
                                gridData[idx].serParDstinCd = "SER";
                            });

                            if(data != null){
                                $.ajax({
                                    url:"<c:url value='/ser/cal/calculate/multiCalculateCancel.do' />"
                                    ,data:JSON.stringify(gridData)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR, status, error){
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,success:function(result, textStatus){

                                        dms.notification.success("<spring:message code='ser.lbl.calc' var='calc' /><spring:message code='global.info.cancelSuccessParam' arguments='${calc}' />");
                                        $("#btnSearch").click();

                                    }
                                    ,beforeSend:function(xhr){
                                        dms.loading.show($("#resizableContainer"));
                                    }
                                    ,complete:function(xhr,status){
                                        dms.loading.hide($("#resizableContainer"));
                                    }
                                });
                            }

                        }
                    }
                }
            });
		
	};
	
	//取消结算卡券反核销方法 贾明 2020-6-3  Cancellation of anti-verification of settlement cards
     popupWinSettCards  = function(val){
     
            var grid = $("#gridHeader").data("kendoExtGrid");
            var rows = grid.select();
            var selectedVal = grid.dataItem(rows);//roTp dlrCd
           
            var param = {
                 "calcDocNo":selectedVal.calcDocNo
                 ,"roTp":selectedVal.roTp
                 ,"vinNo":selectedVal.vinNo
                 ,"roDocNo":selectedVal.roDocNo
                 ,"lanBinCardNo":selectedVal.lanBinCardNo
            }
            //console.log("选中的值",selectedVal.calcDocNo);
         popupWindow = dms.window.popup({
               windowId :"messagePopup"
               ,title :false
               ,width :300
               ,height:110
               ,modal:true
               ,content :{
                   url :"<c:url value='/sal/cnt/contractRe/contractMessagePopup.do' />"
                   ,data :{
                       "type" :null
                       ,"autoBind" :false
                       , msg :val //"取消结算会同时取消粉丝卡券的使用"
                       , btnMsg01 :"<spring:message code='global.lbl.yes' />"
                       , btnMsg02 :"<spring:message code='global.lbl.n' />"
                       ,"callbackFunc" :function(data){
                           if (data.msg == "01"){
                               $.ajax({
                                    url:"<c:url value='/ser/cal/calculate/cancelBillingCouponAntiWriteOff.do' />"
                                    ,data:JSON.stringify(param)
                                    ,type:'POST'
                                    ,dataType:'json'
                                    ,contentType:'application/json'
                                    ,error:function(jqXHR, status, error){
                                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                    }
                                    ,success:function(result, textStatus){
                                    	console.log("返回值",result);
                                    	if("S" == result ){
                                    	    cancelBilling();//正常结算取消
                                    	}
                                    }
                                    ,beforeSend:function(xhr){
                                        dms.loading.show($("#resizableContainer"));
                                    }
                                    ,complete:function(xhr,status){
                                        dms.loading.hide($("#resizableContainer"));
                                    }
                                });
                                
                            }else{
                                return false;
                            }
                        }
                   }
               }
           });
     };

    $(document).on("click", ".linkCalcDocNo", function(e){
        var grid = $("#gridHeader").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.calcMng' />", "<c:url value='/ser/cal/calculate/selectCalculateMain.do'/>?calcDocNo="+selectedVal.calcDocNo, "VIEW-D-10347"); // 정산 Main
    });

    // RO일자
    $("#sRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    // RO일자
    $("#sRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:""
    });

    // 정산일자(From)
    $("#sCalcRegFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sCalcFromDt}"
    });

    // 정산일자(To)
    $("#sCalcRegToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sCalcToDt}"
    });

    $("#gridHeader").kendoExtGrid({
        gridId:"G-SER-1011-000001"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cal/calculate/selectCalculatesList.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarRegNo"]   = $("#sCarRegNo").val();
                        params["sRoTp"]       = $("#sRoTp").data("kendoExtDropDownList").value()
                        params["sCalcDocNo"]  = $("#sCalcDocNo").val();
                        params["sRoDocNo"]    = $("#sRoDocNo").val();
                        params["sVinNo"]      = $("#sVinNo").val();
                        params["sDriverNm"]   = $("#sDriverNm").val();
                        params["sCarOwnerNm"] = $("#sCarOwnerNm").val();
                        params["sCalcRegFromDt"] = $("#sCalcRegFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sCalcRegToDt"]   = $("#sCalcRegToDt").data("kendoExtMaskedDatePicker").value();
                        //params["sRoStatCd"] = "04";
                        params["sCalcCancYn"] = "N";
                        //params["sRcvStatCd"] = "O";
                        params["sScreenGb"]   = "C";    // C: 정신취소화면(정신취소화면에서는 정산확인건도 조회 되어야 해서 조건 추가)


                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,calcDocNo:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,calcDt:{type:"date"}
                        ,roDt:{type:"date"}
                        ,expcChkDt:{type:"date"}
                        ,regDt:{type:"date"}
                    }
                }
            }
        }
        ,height:480
        ,editable:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
              {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}       // 차량번호
             ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}          // VIN NO
             ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}  // 소유자
             ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}       // 방문자
             ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}  // 차종명칭
             ,{field:"modelNm", title:"<spring:message code='ser.lbl.model' />", width:100}        // 모델명칭
             ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}      // 현주행거리
             ,{field:"carRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"} // 누적주행거리
             ,{field:"calcStatCd", title:"<spring:message code='ser.lbl.calcStat' />", width:100, sortable:false, attributes:{"class":"ac"}
                 ,template: "#=roStatCdGrid(calcStatCd)#"
             }   // RO상태
             ,{field:"calcDocNo", title:"<spring:message code='global.lbl.calcNo' />", width:120
                 ,template:function(dataItem){
                     var spanObj = "<a href='#' class='linkCalcDocNo'>"+dataItem.calcDocNo+"</a>";
                     return spanObj;
                 }
             }   // 정산번호
             ,{field:"regUsrNm", title:"<spring:message code='ser.lbl.settlement' />", width:100}   // 서비스정산자
             ,{field:"regDt", title:"<spring:message code='ser.lbl.calcDt' />", width:120, sortable:false, attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
             }   // 정산일자
             ,{field:"calcPrintDt", title:"<spring:message code='ser.lbl.calcPrintDt' />", width:120, sortable:false, attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
             }   // 정산프린트시간
             ,{field:"calcCancDt", title:"<spring:message code='ser.lbl.calcCancelDt' />", width:120, sortable:false, attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
             }   // 정산취소시간
             ,{field:"calcDt", title:"<spring:message code='ser.lbl.calcEndDt' />", width:120, sortable:false, attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
             }   // 정산완료시간
             ,{field:"calcCompUsrNm", title:"<spring:message code='ser.lbl.calcCompNm' />", width:100}           // 정산완료자
             ,{field:"calcCancNm", title:"<spring:message code='ser.lbl.calcCancNm' />", width:100}           // 취소서비스정산자
             ,{field:"calcCancReasonNm", title:"<spring:message code='ser.lbl.cancReasonCd' />", width:100}   // 취소원인
             ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:100}                 // RO번호
             ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:120, sortable:false, attributes:{"class":"ac"}
                 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
             }   // RO일자
             ,{field:"roUsrNm", title:"<spring:message code='ser.lbl.roWrtrNm' />", width:100}    // 정비위탁자
             ,{field:"estDocNo", title:"<spring:message code='ser.lbl.estDocNo' />", width:100, hidden:true}   // 정비견적번호
             ,{field:"estDt", title:"<spring:message code='ser.lbl.estDt' />", width:100, hidden:true}          // 정비견적일자
             ,{field:"estUsrNm", title:"<spring:message code='ser.lbl.estWrtrNm' />", width:100, hidden:true}   // 정비견적자
             ,{field:"lbrCalcSumAmt", title:"<spring:message code='ser.lbl.lbrCalcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}  //공임정산금액
             ,{field:"parCalcSumAmt", title:"<spring:message code='ser.lbl.parCalcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}  //부품정산금액
             ,{field:"etcCalAmt", title:"<spring:message code='ser.lbl.etcCalcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}        //기타정산금액
             ,{field:"lbrDcAmt", title:"<spring:message code='ser.lbl.lbrCdDcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}         //공임할인금액
             ,{field:"parDcAmt", title:"<spring:message code='ser.lbl.parDcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}           //부품할인금액
             ,{field:"dcTotAmt", title:"<spring:message code='ser.lbl.calcDcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}          //정산할인금액
             ,{field:"pointTotAmt", title:"<spring:message code='ser.lbl.pointUseAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}     //포인트사용금액
             ,{field:"bmPointTotAmt", title:"<spring:message code='ser.lbl.bmPointUseAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"} //BM포인트사용금액
             ,{field:"etcTotAmt", title:"<spring:message code='ser.lbl.etcSaleAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}        //기타할인금액
             ,{field:"calcTotAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}     //정산금액
             ,{field:"wonUnitCutAmt", title:"<spring:message code='ser.lbl.interSettAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}  //정산절사금액
             ,{field:"demicPointCutAmt", title:"<spring:message code='ser.lbl.calcZeroAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}   //정산제로금액
             ,{field:"paymAmt", title:"<spring:message code='ser.lbl.arCd' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}          //수납금액 (수납)
             ,{field:"rcvAmt", title:"<spring:message code='ser.lbl.gisuAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}        //실수금액 (수납)
             ,{field:"npayAmt", title:"<spring:message code='ser.lbl.outstdAmt' />", width:90, attributes:{"class":"ar"}, format:"{0:n2}"}     //미수금액 (수납)
             ,{field:"paymYnNm", title:"<spring:message code='ser.lbl.paidYn' />", width:90, attributes:{"class":"ac"} }               //지불완료여부 (수납)
             ,{field:"calcRemark", title:"<spring:message code='ser.lbl.CalcRemark' />", width:90, attributes:{"class":"ar"}}
             ,{field:"lanBinCardNo", title:"<spring:message code='ser.lbl.cardNumber' />", width:90,hidden:true }//卡券编号 贾明 2020-6-3 
             ,{field:"couponWrite", width:90, hidden:true}// 卡券是否核销 Y 代表是 空代表未核销 贾明 2020-6-3
             ,{field:"lanBinCardEffeDt", width:120,hidden:true}   // 卡券截止日期 贾明 2020-6-3
             ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:80, attributes:{"class":"ac"},hidden:true
                 ,template: "#=roTpCdGrid(roTp)#"
              }               // RO유형
             ,{field:"rcvDocNo", width:80, hidden:true}                  //수납 번호
         ]
    });

/*     $("#gridHeader").kendoExtGrid({
        gridId:"G-SER-170519-173835"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/cal/calculate/selectCalculates.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("#dlrCd").val();
                        params["sCarRegNo"] = $("#sCarRegNo").val();
                        //params["sCalcDocNo"] = $("#sCalcDocNo").val();
                        params["sRoDocNo"] = $("#sRoDocNo").val();
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sDriverNm"] = $("#sDriverNm").val();
                        params["sCalcFromDt"] = $("#sCalcFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sCalcToDt"] = $("#sCalcToDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoFromDt"] = $("#sRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoToDt"] = $("#sRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sRoStatCd"] = "04";
                        params["sRcvStatCd"] = "O";

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,calcDocNo:{type:"string"}
                        ,roDocNo:{type:"string"}
                        ,calcDt:{type:"date"}
                        ,roDt:{type:"date"}
                        ,expcChkDt:{type:"date"}
                    }
                }
            }
        }
        ,height:480
        ,editable:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,columns:[
            {field:"calcDt", title:"<spring:message code='ser.lbl.calcDt' />", width:100, sortable:false, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }   // 정산일자
            ,{field:"calcDocNo", title:"<spring:message code='global.lbl.calcNo' />", width:120
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='linkCalcDocNo'>"+dataItem.calcDocNo+"</a>";
                    return spanObj;
                }
            }   // 정산번호
            ,{field:"roStatCd", title:"<spring:message code='ser.lbl.roStatus' />", width:100, sortable:false, attributes:{"class":"ac"}
                ,template:"#=roStatCdGrid(roStatCd)#"
            }   // 정산상태
            ,{field:"roDt", title:"<spring:message code='ser.lbl.roDt' />", width:120, sortable:false, attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"
            }   // RO일자
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:100}  // RO번호
            ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}   // 차량번호
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}  // 고객명
            ,{field:"calcTotAmt", title:"<spring:message code='ser.lbl.finalCalcAmt' />", width:90, attributes:{"class":"ar"}}  // 고객명
            ,{field:"lbrCalcSumAmt", title:"<spring:message code='ser.lbl.totLbrAmt' />", width:90, attributes:{"class":"ar"}}  // 고객명
            ,{field:"parCalcSumAmt", title:"<spring:message code='ser.lbl.totParAmt' />", width:90, attributes:{"class":"ar"}}  // 고객명
            ,{field:"dcTotAmt", title:"<spring:message code='ser.lbl.dcAmt' />", width:90, attributes:{"class":"ar"}}  // 고객명
            ,{field:"etcTotAmt", title:"<spring:message code='ser.lbl.etcDcAmt' />", width:90, attributes:{"class":"ar"}}  // 고객명
            ,{field:"carId",width:90,hidden:true}
        ]
    }); */
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            var colEmt=$("#searchForm col");
            $(colEmt[0]).css("width","5%");
            $(colEmt[1]).css("width","19%");
            $(colEmt[2]).css("width","5%");
            $(colEmt[3]).css("width","15%");
            $(colEmt[4]).css("width","6%");
            $(colEmt[5]).css("width","15%");
            $(colEmt[6]).css("width","6%");
            $(colEmt[7]).css("width","15%");
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }

    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제

});
</script>
<!-- //script -->

