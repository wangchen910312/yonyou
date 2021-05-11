<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- BTO 주문조회 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.btoSearchOrd" /></h1> <!-- BTO 주문조회 -->
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            </div>
        </div>

        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per"  role="search" data-btnid="btnSearch">
            <table boder="2" style="border-bottom-color: red;">
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
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.orderType" /></span></th> <!-- 주문유형 -->
                        <td class="required_area">
                            <input name="sOrdTp" id="sOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt2"><span class="bu_required"><spring:message code="global.lbl.orderWeek" /></span></th> <!-- 주문주차 -->
                        <td class="required_area group-OrdDt2">
                            <input name="sOrdYyMmPrid" id="sOrdYyMmPrid" type="text" class="form_comboBox">
                        </td>
                        <th scope="row" class="group-OrdDt1" style="display:none;"><span class="bu_required"><spring:message code="global.lbl.orderRegDt" /></span></th> <!-- 주문등록일 -->
                        <td class="group-OrdDt1 required_area" style="display:none;">
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sOrdDtS" id="sOrdDtS" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sOrdDtE" id="sOrdDtE" class="form_datepicker">
                                </div>
                            </div>
                        </td>

                        <th scope="row"><span><spring:message code="global.lbl.statNm" /></span></th> <!-- 상태 -->
                        <td>
                            <input name="sOrdStatCd" id="sOrdStatCd" type="text" class="form_comboBox">
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
                        <th scope="row"><span><spring:message code="global.lbl.ocn" /></span></th> <!-- OCN -->
                        <td>
                            <input name="sOcnCd" id="sOcnCd" type="text" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt10">
            <div id="grid"></div>
        </div>
        <!-- 상세정보 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='ser.title.campaign.detailInfo' /></h2>    <!-- 상세정보 -->
        </div>
        <div class="table_grid">
            <div id="grid2" class="resizable_grid"></div>
        </div>


    </section>
</div>

<script  type="text/javascript">
     var sysDate = "${sysDate}";
     var fifteenDayBf = "${fifteenDayBf}"

     /************* 주문유형 SELECT BOX  *******************/
	 var ordTpList = [];
     var ordTpObj = {};
     <c:forEach var="obj" items="${ordTpInfo}">
       ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
       ordTpObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
     </c:forEach>

     var ordTpArr = dms.data.arrayToMap(ordTpList, function(obj){return obj.cmmCd});
     /************* 주문유형 SELECT BOX  *******************/

     /************* 주문주차 SELECT BOX  *******************/
     var ordYyMmPridList = [];
     <c:forEach var="obj" items="${ordYyMmPridInfo}">
       ordYyMmPridList.push({btoYmwNm:"${obj.btoYmwNm}", btoYmwCd:"${obj.btoYmwCd}"});
     </c:forEach>

     var ordYyMmPridArr = dms.data.arrayToMap(ordYyMmPridList, function(obj){return obj.btoYmwCd});
     /************* 주문주차 SELECT BOX  *******************/

     /**
     * 차종 콤보
     */
     var carLineCdList = [];
     var carLineCdArr = [];
     <c:forEach var="obj" items="${carLineCdInfo}">
      carLineCdList.push({carlineNm:"${obj.carlineCdNm}", carlineCd:"${obj.carlineCd}"});
      carLineCdArr["${obj.carlineCd}"] = "${obj.carlineCdNm}"
     </c:forEach>
     var modelCdList = [];
     var modelCdArr;
     var ocnCdList = [];

    //주문상태 Array
    var ordStatCdList = [];
    var ordStatCdObj = {};
    <c:forEach var="obj" items="${ordStatCdInfo}">
      ordStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      ordStatCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //bto 주문상태 Array
    var detOrdStatCdList = [];
    <c:forEach var="obj" items="${detOrdStatCdInfo}">
      detOrdStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //상태 Map
    var detOrdStatCdMap = dms.data.arrayToMap(detOrdStatCdList, function(obj){ return obj.cmmCd; });

    //인터페이스상태 Array SAL186
    var interfaceStatCdInfoList = [];
    var interfaceStatCdInfoObj = {};
    <c:forEach var="obj" items="${interfaceStatCdInfo}">
      interfaceStatCdInfoList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
      interfaceStatCdInfoObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    $(document).ready(function () {
	    //주문유형
	    $("#sOrdTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:ordTpList
           ,select:onSelectOrdTp
           ,optionLabel:" "  // 선택
           ,value:"N1"
        });

	    /**
        * 주문상태 콤보박스
        */
        $("#sOrdStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:ordStatCdList
           ,optionLabel:" "  // 전체
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
            dataTextField:"modelCdNm"
           ,dataValueField:"modelCd"
           ,select:onSelectModelCd
           ,optionLabel:" "  // 전체
        });

        /**
        * OCN 콤보박스
        */
        $("#sOcnCd").kendoExtDropDownList({
            dataTextField:"ocnCdNm"
           ,dataValueField:"ocnCd"
           ,optionLabel:" "  // 전체
        });


        /**
        * 주문주차 콤보박스
        */
        $("#sOrdYyMmPrid").kendoExtDropDownList({
            dataTextField:"btoYmwNm"
           ,dataValueField:"btoYmwCd"
           ,dataSource:ordYyMmPridList
           ,optionLabel:" "  // 선택
           ,index:ordYyMmPridList.length
        });

	    /**
        * 주문유형에 따른 주문주차 및 메모 조회
        */
        function onSelectOrdTp(e) {
            var ordTpCd = this.dataItem(e.item).cmmCd;

            if( ordTpCd != null && ordTpCd != ""){

                if( ordTpCd == "N1" ){
                    $("#sOrdDtS").data("kendoDatePicker").value("");
                    $("#sOrdDtE").data("kendoDatePicker").value("");

                    $(".group-OrdDt1").hide();
                    $(".group-OrdDt2").show();

                }else{
                    if( $("#sOrdDtS").data("kendoDatePicker").value() == "" || $("#sOrdDtS").data("kendoDatePicker").value() == null ){
                        $("#sOrdDtS").data("kendoDatePicker").value(fifteenDayBf);
                        $("#sOrdDtE").data("kendoDatePicker").value(sysDate);
                    }

                    $(".group-OrdDt1").show();
                    $(".group-OrdDt2").hide();
                }
            }else{
                $("#sOrdYyMmPrid").data("kendoExtDropDownList").setDataSource([]);
            }

            //$("#sOrdDtS").data("kendoDatePicker").value(fifteenDayBf);
            //$("#sOrdDtE").data("kendoDatePicker").value(sysDate);


            $("#sCarlineCd").data("kendoExtDropDownList").value("");
            $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
        };

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
            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
        };
        /**
        * 모델에 따른 OCN 조회
        */
        function onSelectModelCd(e) {

            var responseOcnCdJson = dms.ajax.getJson({
                url:"<c:url value='/sal/veh/modelPackage/selectModelPackageOcn.do'/>"
                ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sModelCd":this.dataItem(e.item).modelCd})
                ,async:false
            });

            $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseOcnCdJson.data);
        };

        /**
         * 시작일자 (From)
         */
         $("#sOrdDtS").kendoDatePicker({
             value:fifteenDayBf
            ,format:"{0:<dms:configValue code='dateFormat' />}"
         });
         /**
         * 종료일자 (From)
         */
         $("#sOrdDtE").kendoDatePicker({
             value:sysDate
            ,format:"{0:<dms:configValue code='dateFormat' />}"
         });


		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {

	            var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
                var strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
                var dtOrdDtS = $("#sOrdDtS").data('kendoDatePicker').value();
                var dtOrdDtE = $("#sOrdDtE").data('kendoDatePicker').value();

                if( strOrdTp == "N1" ){
                    if( strOrdYyMmPrid == null || strOrdYyMmPrid == '' ){
                        dms.notification.info("<spring:message code='global.lbl.orderWeek' var='orderWeek' /><spring:message code='global.info.chkSelectItemMsg' arguments='${orderWeek},' />"); // 주문주차
                        return;
                    }
                }else{
                    if( dtOrdDtS == null || dtOrdDtE == null ){
                        dms.notification.info("<spring:message code='global.lbl.orderRegDt' var='orderRegDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${orderRegDt},' />"); // 주문등록일
                        return;
                    }
                }

	            $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

        //그리드 1번
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0721-114402"
           	,dataSource:{
               	transport:{
                     read:{
                         url:"<c:url value='/sal/orm/btoSearchOrder/selectBtoSearchOrder.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};
                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;

                             var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
                             var strOrdYyMmPrid = $("#sOrdYyMmPrid").data('kendoExtDropDownList').value();
                             var dtOrdDtS = $("#sOrdDtS").data('kendoDatePicker').value();
                             var dtOrdDtE = $("#sOrdDtE").data('kendoDatePicker').value();

                             if(strOrdTp == "N1"){
                                 params["sOrdYyMmPrid"] = strOrdYyMmPrid;
                             }else{
                                 params["sOrdDtS"] = dtOrdDtS;
                                 params["sOrdDtE"] = dtOrdDtE;
                             }

                             params["sOrdTp"] = strOrdTp;

                             params["sCarlineCd"] = $("#sCarlineCd").data('kendoExtDropDownList').value();
                             params["sModelCd"] = $("#sModelCd").data('kendoExtDropDownList').value();
                             params["sOcnCd"] = $("#sOcnCd").data('kendoExtDropDownList').value();
                             params["sOrdStatCd"] = $("#sOrdStatCd").data('kendoExtDropDownList').value();

                             console.log(kendo.stringify(params));

                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                      model:{
                          id:"ordTp"
                          ,fields:{
                              ordYyMmDt: {type:"string", hidden:true} //
                              ,ordPrid: {type:"string", hidden:true} //
                              ,ordTp:{type:"string", hidden:true} //
                              ,carlineCd: {type:"string", hidden:true} //
                              ,modelCd: {type:"string", hidden:true} //
                              ,ocnCd:{type:"string", hidden:true} //
                              ,extColorCd:{type:"string", hidden:true} //
                              ,intColorCd:{type:"string", hidden:true} //
                              ,ordStatCd:{type:"string", editable:false} //
                              ,carlineNm: {type:"string", editable:false} //
                              ,modelNm: {type:"string", editable:false} //
                              ,ocnNm:{type:"string", editable:false} //
                              ,extColorNm:{type:"string", editable:false} //
                              ,intColorNm:{type:"string", editable:false} //
                              ,ordGradeCd:{type:"string", editable:false} //
                              ,ordTpNm:{type:"string", editable:false} //
                              ,ordReqQty: {type:"number", editable:false} //
                              ,ordStatNm:{type:"string", editable:false} //
                              ,ordCnfrmQty: {type:"number", editable:false} //
                              ,ordNo: {type:"string", editable:false} //
                          }
                     }
                 }
            }
            ,height:450
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:false               //Tooltip 적용, default:false
            ,autoBind:false
            ,editable:false
            ,columns: [
                {field:"ordYyMmDt", hidden:true }  // 오더 년월일자
                ,{field:"ordPrid", hidden:true }  // 오더기간
                ,{field:"ordTp", hidden:true }  // 오더기간
                ,{field:"carlineCd", hidden:true }  // 차종코드
                ,{field:"modelCd", hidden:true }  // 모델코드
                ,{field:"ocnCd", hidden:true }  // ocn코드
                ,{field:"extColorCd", hidden:true }  // 외장색 코드
                ,{field:"intColorCd", hidden:true }  // 내장색 코드
                ,{field:"ordNo", hidden:true }  // 오더번호
                ,{field:"ifresultRtn", title:"<spring:message code='sal.lbl.infStatNm' />"
                    ,width:90 ,attributes:{"class":"ac"}
                    ,template:function(dataItem){
                         var spanObj = "";
                         switch(dataItem.ifresultRtn){
                             case "E"://인터페이스 실패
                                 spanObj = "<span class='txt_label bg_yellow'>"+interfaceStatCdInfoObj[dataItem.ifresultRtn]+"</span>";
                                 break;
                             case "Z"://인터페이스 성공
                                 spanObj = "<span class='txt_label bg_green'>"+interfaceStatCdInfoObj[dataItem.ifresultRtn]+"</span>";
                                 break;
                             case "N"://인터페이스 중
                                 spanObj = "<span class='txt_label bg_blue'>"+interfaceStatCdInfoObj[dataItem.ifresultRtn]+"</span>";
                                 break;
                             default:
                                 spanObj = "<span class='txt_label bg_gray'>"+interfaceStatCdInfoObj[dataItem.ifresultRtn]+"</span>";
                                 break;
                         }
                         return spanObj;
                    }
                  } // 인터페이스상태
                ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:120,  attributes:{"class":"al"}}    // 차종
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:150,  attributes:{"class":"al"}}    // 모델
                ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />", width:150,  attributes:{"class":"al"}}    // ocn
                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />", width:100,  attributes:{"class":"al"}}    // 외색
                ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", width:100,  attributes:{"class":"al"}}    // 내색
                ,{field:"ordGradeCd", title:"<spring:message code='global.lbl.orderGrade' />", width:100,  attributes:{"class":"ac"}}    // 주문등급
                ,{field:"ordTp", title:"<spring:message code='global.lbl.orderType' />", width:70,  attributes:{"class":"al"}, template:"#=dms.string.strNvl(ordTpObj[ordTp])#"}    // 주문유형
                ,{field:"ordReqQty", title:"<spring:message code='global.lbl.applyQty' />", width:70,  attributes:{"class":"ar"}}    // 신청수량
                ,{field:"ordStatCd", title:"<spring:message code='global.lbl.statNm' />", width:80,  attributes:{"class":"al"}, template:"#=dms.string.strNvl(ordStatCdObj[ordStatCd])#"}    // 상태
                ,{field:"ordCnfrmQty", title:"<spring:message code='sal.lbl.btoConfirmQty' />", width:90,  attributes:{"class":"ar"}, format:"{0:n0}"}    // 심사확정수량
            ]
    	});

    	// 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
            $('#grid2').data('kendoExtGrid').dataSource.page(1);
        });

    	//그리드 2번
        $("#grid2").kendoExtGrid({
            gridId:"G-SAL-0721-114403"
            ,dataSource:{
                transport:{
                     read:{
                         url:"<c:url value='/sal/orm/btoSearchOrder/selectBtoSearchOrderDetail.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var grid = $("#grid").data("kendoExtGrid");
                             var rows = grid.tbody.find("tr");
                             var gridData = grid.dataItem(rows[grid.select().index()]);

                             var params = {};
                             params["sort"] = options.sort;

                             params["sOrdTp"] = gridData.ordTp;
                             params["sOrdYyMmDt"] = gridData.ordYyMmDt;
                             params["sOrdPrid"] = gridData.ordPrid;
                             params["sCarlineCd"] = gridData.carlineCd;
                             params["sOrdNo"] = gridData.ordNo;

                             console.log(kendo.stringify(params));

                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                      model:{
                          id:"ordNo"
                          ,fields:{
                              carlineCd: {type:"string", hidden:true, validation:{required:true}} //
                              ,modelCd: {type:"string", hidden:true, validation:{required:true}} //
                              ,ocnCd:{type:"string", hidden:true, validation:{required:true}} //
                              ,extColorCd:{type:"string", hidden:true, validation:{required:true}} //
                              ,intColorCd:{type:"string", hidden:true, validation:{required:true}} //
                              ,trsfDlrCd:{type:"string", hidden:true, validation:{required:true}}
                              ,ordNo:{type:"string", editable:false} //
                              ,pfpExamDt:{type:"date", editable:false} //
                              ,trsfDlrNm:{type:"string", editable:false} //
                              ,ordStatCd:{type:"string", editable:false} //
                              ,aldy:{type:"date", editable:false} //
                          }
                     }
                 }
            }
            ,height:80
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false          //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,autoBind:false
            ,scrollable:true
            ,pageable:false
            ,columns: [
                {field:"carlineCd", hidden:true }  // 차종코드
                ,{field:"modelCd", hidden:true }  // 모델코드
                ,{field:"ocnCd", hidden:true }  // ocn코드
                ,{field:"extColorCd", hidden:true }  // 외장색 코드
                ,{field:"intColorCd", hidden:true }  // 내장색 코드
                ,{field:"trsfDlrCd", hidden:true }  // 운송딜러
                ,{field:"ordNo", title:"<spring:message code='global.lbl.ordNo' />"
                    ,width:80
                    ,headerAttributes:{style: "text-align: center;"}
                    ,attributes:{"class":"ac"}
                }  // 주문번호
                ,{field:"aldy", title:"<spring:message code='sal.lbl.ordSetDt' />"
                    ,width:120
                    ,headerAttributes:{style: "text-align: center;"}
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                }  // 오더배정일
                ,{field:"pfpExamDt", title:"<spring:message code='sal.lbl.pfpExamDt' />"
                    ,width:120
                    ,headerAttributes:{style: "text-align: center;"}
                    ,attributes:{"class":"ac"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                }  // 납기예시일
                ,{field:"trsfDlrCd", title:"<spring:message code='global.lbl.trsfDealer' />"
                    ,width:120
                    ,headerAttributes:{style: "text-align: center;"}
                    ,attributes:{"class":"ac"}
                }  // 운송딜러
                ,{field:"ordStatCd", title:"<spring:message code='global.lbl.statNm' />"
                    ,width:120
                    ,template:"#=detOrdStatCdMap[ordStatCd].cmmCdNm#"
                    ,headerAttributes:{style: "text-align: center;"}
                    ,attributes:{"class":"al"}
                }  // 상태
            ]
        });

        $("#sOrdDtS").data("kendoDatePicker").value("");
        $("#sOrdDtE").data("kendoDatePicker").value("");

	}); //document.ready End

	function complete(jqXHR, textStatus){
		var response = jQuery.parseJSON(jqXHR.responseText);
		globalNotification.show(response["result"], "info");
	}

</script>