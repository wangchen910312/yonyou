<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



<!-- 출고관리 - 출고취소  -->
<div id="resizableContainer">
    <section class="group">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.cancelDelivery" /></h1><!-- 출고취소 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10778" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnDeliveryCancel1st"><spring:message code="sal.lbl.thisMonth" /><spring:message code="sal.btn.cancelReq" /><!-- 출고취소 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-10777" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnDeliveryCancel2nd"><spring:message code="sal.lbl.overTheMoon" /><spring:message code="sal.btn.cancelReq" /><!-- 출고취소 --></button>
                </dms:access>
                <dms:access viewId="VIEW-D-10776" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 -->

        <!-- 조회 조건 시작 -->
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:7%;">
                    <col style="width:18%;">
                    <col style="width:7%;">
                    <col style="width:16%;">
                    <col style="width:7%;">
                    <col style="width:16%;">
                    <col style="width:7%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
	                    <th scope="row"><spring:message code="global.lbl.giDocRegDt" /></th> <!-- 출고일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input id="sSrchStartDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input id="sSrchEndDt" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.contractNo" /></th> <!-- 계약번호 -->
                        <td>
                            <input id="sContractNo" id=sContractNo type="text" class="form_input">
                        </td>
	                    <th scope="row"><spring:message code="sal.lbl.carVinNum" /></th> <!-- 차대번호(VIN NO) -->
	                    <td>
	                        <input id="sVinNo" id="sVinNo" type="text" class="form_input">
	                    </td>
	                    <th scope="row"><spring:message code="global.lbl.custNm" /></th> <!-- 고객명 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <div class="form_search">
                                        <input id="vContractCustNm" class="form_input" >
                                        <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                        <input id="sContractCustNm" type="hidden" />
                                    </div>
                                </div>
                                <div class="form_right">
                                    <input id="sContractCustNo" readonly class="form_input form_readonly">
                                </div>
                            </div>
                        </td>
                	</tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->


        <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
        <!-- 그리드 종료 -->

    </section>
</div>
<!-- script -->
<script>
var oneDay = "${oneDay}";       // 해당월 1일
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nowMonth = "${nowMonth}";   // 현재월
var toDay = "${toDay}";         // 오늘날짜
var sysYyyyMm = "${sysYyyyMm}"; // 이월취소비교용년월
var dlrCd  = "${dlrCd}";

//판매취소사유(출고취소사유) Array(SAL129)
var cancReasonCdList = [];
var cancReasonCdDs = [];
var cancReasonCdList_CA = [];
var cancReasonCdList_CB = [];
var cancReasonCdList_CC = [];
var cancReasonCdList_CD = [];
var cancReasonCdList_CE = [];
var cancReasonCdList_CF = [];
var cancReasonCdList_CG = [];
////20200828 tjx 新增G4
var cancReasonCdList_G4 = [];
<c:forEach var="obj" items="${cancReasonCdDs}">
    cancReasonCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
	<c:if test="${obj.cmmCd == 'CA'}">
	    cancReasonCdList_CA.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
	</c:if>
	<c:if test="${obj.cmmCd == 'CB'}">
		cancReasonCdList_CB.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
	</c:if>
	<c:if test="${obj.cmmCd == 'CC'}">
		cancReasonCdList_CC.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
	</c:if>
	<c:if test="${obj.cmmCd == 'CD'}">
		cancReasonCdList_CD.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
	</c:if>
	<c:if test="${obj.cmmCd == 'CE'}">
		cancReasonCdList_CE.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
	</c:if>
	<c:if test="${obj.cmmCd == 'CF'}">
		cancReasonCdList_CF.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
	</c:if>
	<c:if test="${obj.cmmCd == 'CG'}">
		cancReasonCdList_CG.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
	</c:if>
	////20200828 tjx 新增G4
	<c:if test="${obj.cmmCd == 'G4'}">
		cancReasonCdList_G4.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
//강제판매처리신청상태 Map
var cancReasonCdMap = dms.data.arrayToMap(cancReasonCdList, function(obj){ return obj.cmmCd; });



//심사상태 Array(SAL189)
var reqStatCdList = [];
<c:forEach var="obj" items="${reqStatCdDs}">
    reqStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});

</c:forEach>
//심사상태 Map
var reqStatCdMap = dms.data.arrayToMap(reqStatCdList, function(obj){ return obj.cmmCd; });


$(document).ready(function() {


    //조회조건 - 출고일자
    $("#sCustSaleDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    // 시작일
    $("#sSrchStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:oneDay
   });

    // 종료일
    $("#sSrchEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       ,value:toDay
    });

    //버튼 - 출고취소
    $("#btnDeliveryCancel1st").kendoButton({
        click:function(e){

            var chkOneShot = srchOneShotChk();

            if(chkOneShot > 0){
                dms.notification.warning("<spring:message code='sal.menu.cancelDelivery' var='cancelDelivery' /><spring:message code='sal.info.deadLineCheckMsg' arguments='${cancelDelivery}' />");
                return false;
            }

          	//주문그리드
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var rows = grid.select();
            var selectVal = data[selectIdx];
            var arrSave = [];

            if(selectIdx == -1){
                // 출고취소할 계약건을(를) 선택하십시오.
                dms.notification.warning("<spring:message code='sal.info.contDeliveryCancel' var='contDeliveryCancel' /><spring:message code='global.lbl.contractHd' var='globalLblContractHd' /><spring:message code='global.info.chkselect' arguments='${globalBtnDeliveryHandle}, ${globalLblContractHd}' />");
                return false;
            }

            var vinNoChk = true;
            var rowNum = 0;
            var contracNo;
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);

                if( dataItem.cancReasonCd == null){
                	vinNoChk = false;
                    rowNum = index+1;
                    vinNo = dataItem.vinNo;
                    return false;
                }else {
                    arrSave.push(dataItem);
                }

            });


            if(vinNoChk == false){
                dms.notification.warning("(" + rowNum + ")<spring:message code='global.lbl.vinNum' />:"+ vinNo +" <spring:message code='sal.lbl.cancReasonInput' />");
                return false;
            }

            var saveData = {"updateList":arrSave};

            //alert(kendo.stringify(saveData));

            var msg = "<spring:message code='sal.info.contDeliveryCancel' var='contDeliveryCancel' /><spring:message code='global.lbl.proce' var='globalLblProce' /><spring:message code='global.info.cnfrmsMsg' arguments='${contDeliveryCancel}, ${globalLblProce}' />";

            dms.window.confirm({
                message:msg
                ,title :"<spring:message code='global.lbl.info' />"
                ,callback:function(result){
                    if(result){
                        //dms.loading.show();
                        $.ajax({
                            url:"<c:url value='/sal/dlv/contDeliveryCanc/contDeliveryCanc.do' />",
                            dataType:"json",
                            type:"POST",
                            contentType:"application/json",
                            data:JSON.stringify(saveData),
                            error:function(jqXHR,status,error){
                                if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }else{
                                    dms.notification.error(error);
                                }
                            },
                            success:function(jqXHR, textStatus){
                                //정상적으로 반영되였습니다.
                                dms.notification.success("<spring:message code='global.info.success' />");
                                $('#grid').data('kendoExtGrid').dataSource.page(1);
                            }
                        });
                    }else{
                        return false;
                    }
                }
            });
        }
    });

    $("#btnDeliveryCancel2nd").kendoButton({
        click:function(e){

            var chkOneShot = srchOneShotChk();

            if(chkOneShot > 0){
                dms.notification.warning("<spring:message code='sal.menu.cancelDelivery' var='cancelDelivery' /><spring:message code='sal.info.deadLineCheckMsg' arguments='${cancelDelivery}' />");
                return false;
            }

            //주문그리드
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var data = grid.dataSource.view();
            var rows = grid.select();
            var selectVal = data[selectIdx];
            var arrSave = [];

            if(selectIdx == -1){
                // 출고취소할 계약건을(를) 선택하십시오.
                dms.notification.warning("<spring:message code='sal.info.contDeliveryCancel' var='contDeliveryCancel' /><spring:message code='global.lbl.contractHd' var='globalLblContractHd' /><spring:message code='global.info.chkselect' arguments='${globalBtnDeliveryHandle}, ${globalLblContractHd}' />");
                return false;
            }

            var vinNoChk = true;
            var rowNum = 0;
            var contracNo;
            rows.each(function(index, row) {
                var dataItem = grid.dataItem(row);

                if( dataItem.cancReasonCd == null){
                    vinNoChk = false;
                    rowNum = index+1;
                    vinNo = dataItem.vinNo;
                    return false;
                }else {
                    arrSave.push(dataItem);
                }

            });


            if(vinNoChk == false){
                dms.notification.warning("(" + rowNum + ")<spring:message code='global.lbl.vinNum' />:"+ vinNo +" <spring:message code='sal.lbl.cancReasonInput' />");
                return false;
            }

            var saveData = {"updateList":arrSave};

            var msg = "<spring:message code='sal.info.contDeliveryCancel' var='contDeliveryCancel' /><spring:message code='global.lbl.proce' var='globalLblProce' /><spring:message code='global.info.cnfrmsMsg' arguments='${contDeliveryCancel}, ${globalLblProce}' />";
            dms.window.confirm({
                message:msg
                ,title :"<spring:message code='global.lbl.info' />"
                ,callback:function(result){
                    if(result){
                        //dms.loading.show();
                        $.ajax({
                            url:"<c:url value='/sal/dlv/contDeliveryCanc/contDeliveryCanc.do' />",
                            dataType:"json",
                            type:"POST",
                            contentType:"application/json",
                            data:JSON.stringify(saveData),
                            error:function(jqXHR,status,error){
                                if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }else{
                                    dms.notification.error(error);
                                }
                            },
                            success:function(jqXHR, textStatus){
                                //정상적으로 반영되였습니다.
                                dms.notification.success("<spring:message code='global.info.success' />");
                                $('#grid').data('kendoExtGrid').dataSource.page(1);
                            }
                        });
                    }else{
                        return false;
                    }
                }
            });
        }
    });

    /*******************  //버튼   *******************************************/

    //그리드 설정
    $("#grid").kendoExtGrid({

        gridId:"G-SAL-2017-051923"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/dlv/contDeliveryCanc/selectContDeliveryCanc.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sVinNo"] 		  = $("#sVinNo").val();            								  // 빈번호
                        params["sContractCustNo"] = $("#sContractCustNo").val();                    			  // 고객번호
                        params["sContractCustNm"] = $("#vContractCustNm").val();    							  // 고객명
                        params["sContractNo"]     = $("#sContractNo").val();                                      // 계약번호

                        params["sSrchStartDtStr"] = $("#sSrchStartDt").val().replace(/-/gi, "");
                        params["sSrchEndDtStr"] = $("#sSrchEndDt").val().replace(/-/gi, "");

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
                    	vinNo 			:{type:"string",editable:false}
             			,contractCustNo :{type:"string",editable:false}
             			,contractCustNm :{type:"string",editable:false}
             			,realDlDt 		:{type:"date",editable:false}
             			,contractNo 	:{type:"string",editable:false}
             			,carlineNm 		:{type:"string",editable:false}
             			,modelNm 		:{type:"string",editable:false}
             			,extColorNm 	:{type:"string",editable:false}
             			,contractCustNm :{type:"string",editable:false}
             			,reqDt 			:{type:"date",editable:false}
             			,cancReasonCd   :{type:"string",editable:true}
             			,reqStatCd 		:{type:"string",editable:false}
             			,approveYn 		:{type:"string",editable:false}
             			,saleEmpNm 		:{type:"string",editable:false}
             			,approveDt      :{type:"string",editable:false}
             			,carId          :{type:"string",editable:false}
             			,befSaleOpptNo  :{type:"string",editable:false}

                    }
                }
            }
        }
        ,edit:function(e){
            var dataItem = e.model;
            if(dataItem.reqStatCd == "R"){
                this.closeCell();
            }

            /*
            var container = e.container;
            var cancReasonCdDropDownList = container.find("[data-role=dropdownlist]").data("kendoExtDropDownList");

            if(cancReasonCdDropDownList){
                cancReasonCdDropDownList.setDataSource(cancReasonCdDs);
            }
            */
        }
        ,change:function(e){
            var that = this;
            var rows = that.select();
            var dataItem = this.dataItem(rows);

            if(rows.length > 0){
                if (dms.string.isNotEmpty(dataItem) ) {
                    if(dataItem.reqStatCd == "R"){
                        that.clearSelection();
                        return;
                    }

                    if (dms.string.isNotEmpty(dataItem.realDlDt) ) {
                        var dlvYyyyMM = kendo.toString(dataItem.realDlDt, "yyyyMM");

                        if(Number(dlvYyyyMM) != Number(sysYyyyMm)){
                            $("#btnDeliveryCancel1st").data("kendoButton").enable(false);
                            $("#btnDeliveryCancel2nd").data("kendoButton").enable(true);
                        }else{
                            $("#btnDeliveryCancel1st").data("kendoButton").enable(true);
                            $("#btnDeliveryCancel2nd").data("kendoButton").enable(false);
                        }
                    }
                }

                if(dataItem.ordTp == "AD"){
                    cancReasonCdDs = cancReasonCdList_CA;
                }else if(dataItem.ordTp == "N1"){
                    cancReasonCdDs = cancReasonCdList_CC;
                }else if(dataItem.ordTp == "N8" || dataItem.ordTp == "N9" ||
                        dataItem.ordTp  == "C1" || dataItem.ordTp == "N5" || dataItem.ordTp == "NS" ||
                        dataItem.ordTp  == "N7" || dataItem.ordTp == "C3" || dataItem.ordTp == "N6" ||
                        dataItem.ordTp  == "C4" ){
                    cancReasonCdDs = cancReasonCdList_CE;
                }else if(dataItem.ordTp == "C6" || dataItem.ordTp == "C9" || dataItem.ordTp == "N4" ||
                        dataItem.ordTp  == "C2" || dataItem.ordTp == "C8" ){
                    cancReasonCdDs = cancReasonCdList_CF;
                }else if(dataItem.ordTp == "N3" || dataItem.ordTp == "NB" || dataItem.ordTp == "C7" || dataItem.ordTp == "N2" ){
                    cancReasonCdDs = cancReasonCdList_CG;
                }else if(dataItem.ordTp == "AS" ){
                    cancReasonCdDs = cancReasonCdList_CD;
                }else if(dataItem.ordTp == "G4" ){    //20200828 tjx 新增G4  
                    cancReasonCdDs = cancReasonCdList_G4;
                }
                dataItem["cancReasonCd"] = cancReasonCdDs[0].cmmCd;
                dataItem["dirty"] = true;
            }
        }
	    ,dataBound:function(e) {

	        var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var dataItem = e.sender.dataItem(row);
                if(dataItem.reqStatCd == "R"){
                    $(row).css("background-color", "#E0E0E0");
                    $(".grid-checkbox-item", row).each(function(){
                        $(this).prop("disabled", true);
                    });
                }

            });
	    }
        //,autoBind:false
        ,height:450
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,multiSelectWithCheckbox:false
        ,sortable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:"row"
        ,columns:[
                     {field:"rnum"          ,title:"<spring:message code = 'global.lbl.noName'/>"       ,width:40   ,attributes:{"class":"ac"}} //순번
                    ,{field:"contractNo"    ,title:"<spring:message code = 'global.lbl.contractNo'/>"   ,width:110  ,attributes:{"class":"ac"}} //계약번호
                    ,{field:"vinNo" 		,title:"<spring:message code = 'global.lbl.vinNum'/>"   	,width:170  ,attributes:{"class":"ac"}} //VIN NO
                    ,{field:"contractCustNm",title:"<spring:message code = 'global.lbl.customer'/>"     ,width:150  ,attributes:{"class":"al"}} //고객
                    ,{field:"realDlDt"      ,title:"<spring:message code = 'global.lbl.giDocRegDt'/>"   ,width:80  	,attributes:{"class":"ac"}  //출고일자
	                    ,format:"{0:<dms:configValue code='dateFormat' />}"
	                 }
                    /*
                    ,{field:"cancReasonCd", title:"<spring:message code='sal.lbl.cancReason' />", width:80,attributes:{"class":"al"}
                        ,filterable:{
                            cell:{
                                showOperators:false
                                ,template: function (e) {
                                       e.element.kendoExtDropDownList({
                                           dataSource:cancReasonCdList
                                           ,dataTextField:"cmmCdNm"
                                           ,dataValueField:"cmmCd"
                                           ,valuePrimitive:true
                                           ,optionLabel:" "
                                       });
                                   }
                            }
                        }
                        ,template:"# if(cancReasonCdMap[cancReasonCd] != null) { # #= cancReasonCdMap[cancReasonCd].cmmCdNm# # }#"
                    	,editor:function(container, options) {
                            $('<input name="cancReasonCd" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                dataSource:cancReasonCdDs
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,valuePrimitive:true
                            });
                            $('<span class="k-invalid-msg" data-for="cancReasonCd"></span>').appendTo(container);
                        }
                    }
                    */
                    ,{field:"reqDt"    		,title:"<spring:message code = 'sal.contDeliveryCacRegDt'/>"   ,width:80   ,attributes:{"class":"ac"}  //출고취소신청일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"approveDt"         ,title:"<spring:message code = 'sal.lbl.confirmDt'/>"   ,width:80   ,attributes:{"class":"ac"}  //심사일자
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    }
                    ,{field:"reqStatCd"    ,title:"<spring:message code = 'crm.lbl.evalStatus'/>"   	,width:80  ,attributes:{"class":"ac"}
                        ,template:"# if(reqStatCdMap[reqStatCd] != null) { # #= reqStatCdMap[reqStatCd].cmmCdNm# # }#"
                    } //심사상태
                    ,{field:"carlineNm"    ,title:"<spring:message code = 'global.lbl.carLine'/>"      	,width:100  ,attributes:{"class":"al"}} //차종
                    ,{field:"modelNm"      ,title:"<spring:message code = 'global.lbl.model'/>"        	,width:200  ,attributes:{"class":"al"}} //모델
                    //,{field:"ocnNm"         ,title:"<spring:message code = 'global.lbl.ocn' />"         ,width:120  ,attributes:{"class":"al"}} //OCN
                    ,{field:"extColorNm"   ,title:"<spring:message code = 'global.lbl.extColor'/>"     	,width:150  ,attributes:{"class":"al"}} //외장색
                    //,{field:"intColorNm"    ,title:"<spring:message code = 'global.lbl.intColor'/>"     ,width:120  ,attributes:{"class":"al"}} //내장색
                    ,{field:"saleEmpNm"    ,title:"<spring:message code = 'sal.lbl.saleEmp'/>"       	,width:80  ,attributes:{"class":"al"}}//판매고문
                    //,{field:"ordTp"    ,title:""       	,width:80  ,attributes:{"class":"al"}}//판매고문
                    //,{field:"deliveryGb"    ,title:""       	,width:80 ,attributes:{"class":"al"}    }//판매고문
                ]
    });

    // 고객명에서 ObKeyDown
    $(".onKey_down").keydown(function(e){
        if (e.keyCode == 13) {
            if($(this).val() != "") {
                $(".custSearch").click();
            }
        }
    });

    // 고객조회
    //var custSearch = function() {
     $(".custSearch").click(function(){

         var custNm = $("#sContractCustNm").val();

         popupWindow = dms.window.popup({
             windowId:"customerSearchPopupMain"
             , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
             , content:{
                 url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                 , data:{
                     "autoBind":true
                     , "closeYn":"Y"
                     , "custNm":custNm
                     , "type"  :null
                     , "callbackFunc":function(data){
                         if (data.length >= 1) {
                             if ( dms.string.isNotEmpty(data[0].custNo) ) {
                                 $("#sContractCustNo").val(data[0].custNo);
                                 $("#sContractCustNm").val(data[0].custNm);
                             }

                             //popupWindow.close();

                             $("#btnSearch").click();
                         }
                     }
                 }
             }
         })
     });

    fnOnChange = function(id,vl){
        $("#sContractCustNo").val("");
    }

    $("#btnDeliveryCancel1st").data("kendoButton").enable(false);
    $("#btnDeliveryCancel2nd").data("kendoButton").enable(false);
});

/**
 * 원샷개폐조회
 **/
function srchOneShotChk() {

    var sCtrlGrpCd = 'Y'

    var responseJson = dms.ajax.getJson({
        url:"<c:url value='/sal/dlv/contDeliveryCanc/selectOneShotChkSearch.do'/>"
        ,data:JSON.stringify({"sDlrCd":sCtrlGrpCd})
        ,async:false
    });

    return responseJson;
}

//CRM 고객 조회
bf_searchCustomer = function(){

    var responseJson = {};
    if( dms.string.trim($("#vContractCustNm").val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sCustNm":$("#vContractCustNm").val()})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        $("#sContractCustNo").val(responseJson.data[0].custNo);       // 고객코드
        $("#sContractCustNm").val(responseJson.data[0].custNm);       // 고객명
        $("#vContractCustNm").val(responseJson.data[0].custNm);      // 고객명
    }else{
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , modal:true
            //, draggable:false
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":true
                    , "closeYn":"Y"
                    , "custNm":$("#vContractCustNm").val()
                    , "type":null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#sContractCustNm").val(data[0].custNm);       // 고객명
                            $("#vContractCustNm").val(data[0].custNm);       // 고객명
                        }
                        //popupWindow.close();
                    }
                }
            }
        });
    }
}

//고객명 event
$("#vContractCustNm").blur(function(e){
    cleanCustCheck();
});

//고객명 변경시 고객정보 clean
function cleanCustCheck(){
    if(dms.string.strNvl($("#vContractCustNm").val()) != dms.string.strNvl($("#sContractCustNm").val()) ){
        $("#sContractCustNo").val('');
        $("#sContractCustNm").val('');
    }
}
</script>