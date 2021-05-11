<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.orderInquirySrch" /></h1> <!-- 주문취소유지관리 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10961" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10960" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m" id="btnReqCancel"><spring:message code="global.btn.save" /></button> <!-- 수정 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:16%;">
                    <col style="width:8%;">
                    <col style="width:16%;">
                    <col style="width:8%;">
                    <col style="width:16%;">
                    <col style="width:8%;">
                    <col style="width:20%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.date" /></span></th> <!-- 일자 -->
                        <td class="required_area">
                            <input name="sSysDt" id="sSysDt"  class="form_datepicker" >
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.orderType" /></span></th> <!-- 주문유형 -->
                        <td>
                            <input name="sPtyOrdTp" id="sPtyOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="sal.lbl.stockCau" /></span></th> <!-- 책임구분 -->
                        <td>
                            <input name="sStockCauCd" id="sStockCauCd" type="hidden" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ordStat" /></th> <!-- 주문상태 -->
                        <td>
                            <input name="sPtyOrdStatCd" id="sPtyOrdStatCd" type="text" class="form_comboBox">
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
                            <input id="hiddenFscCode" type="hidden" />
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.ocn" /></span></th> <!-- OCN -->
                        <td>
                            <input name="sOcnCd" id="sOcnCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.extIntColor' /></th>        <!-- 외장/내장색 -->
                        <td>
                            <input id="sExtColorCd" class="form_comboBox" style="width:49%"/>
                            <input id="sIntColorCd" class="form_comboBox" style="width:49%"/>
                        </td>
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
     var sysDate = "${sysDate}";
     var toDay = "${toDay}";

     /************* 주문유형 SELECT BOX  *******************/
	 var ordTpList = [];
     <c:forEach var="obj" items="${ordTpInfo}">
         <c:if test="${obj.cmmCd eq 'N1' || obj.cmmCd eq 'AD'}">
             ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
         </c:if>
     </c:forEach>

     var ordTpArr = dms.data.arrayToMap(ordTpList, function(obj){return obj.cmmCd});
     /************* 주문유형 SELECT BOX  *******************/

     /************* 위약오더 상태 SELECT BOX  *******************/
     var ptyOrdStatCdList = [];
     var ptyOrdStatCdAllList = [];
     <c:forEach var="obj" items="${ptyOrdStatCdInfo}">
     <c:if test="${obj.cmmCd eq 'C'}">
       ptyOrdStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:if>
       ptyOrdStatCdAllList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>
     var ptyOrdStatCdArr = dms.data.arrayToMap(ptyOrdStatCdAllList, function(obj){return obj.cmmCd});
     /************* 위약오더 상태 SELECT BOX  *******************/

     /************* 책임구분 SELECT BOX  *******************/
     var stockCauCdList = [];
     <c:forEach var="obj" items="${stockCauCdInfo}">
     stockCauCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var stockCauCdArr = dms.data.arrayToMap(stockCauCdList, function(obj){return obj.cmmCd});
     /************* 책임구분 SELECT BOX  *******************/

     var cancelFlagList = [{cmmCdNm:"<spring:message code='global.lbl.maintain' />", cmmCd:"N"}
                          ,{cmmCdNm:"<spring:message code='global.lbl.cancel' />", cmmCd:"Y"}]

     var cancelFlagArr = [];
     cancelFlagArr["N"] = "<spring:message code='global.lbl.maintain' />";
     cancelFlagArr["Y"] = "<spring:message code='global.lbl.cancel' />";

     /**
     * 차종 콤보
     */
     var carLineCdList = [];
     <c:forEach var="obj" items="${carLineCdInfo}">
       carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
     </c:forEach>

	$(document).ready(function () {

	    //년월
         $("#sSysDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
            ,value:sysDate
         });

	    $("#sPtyOrdTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:ordTpList
           ,value:"N1"
        });

        $("#sStockCauCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:stockCauCdList
           ,optionLabel:" "  // 전체
        });

        $("#sPtyOrdStatCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:ptyOrdStatCdList
           //,optionLabel:" "  // 선택
        });

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

               $("#hiddenFscCode").val("");

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
           ,select:function(e){
               var dataItem = this.dataItem(e.item);
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOcnCd").data("kendoExtDropDownList").enable(true);

               $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

               $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

               $("#hiddenFscCode").val("");

               if(dataItem.modelCd == ""){
                   $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
                   $("#sOcnCd").data("kendoExtDropDownList").enable(false);
                   return false;
               }
               var responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/veh/vehicleMaster/selectOcnCombo.do' />"
                   ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.fscCd})
                   ,async:false
               });
               $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           }
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

                $("#hiddenFscCode").val("");

                if(this.dataItem(e.item).ocnCd == ""){
                    $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
                    $("#sExtColorCd").data("kendoExtDropDownList").enable(false);
                    return false;
                }

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/veh/vehicleMaster/selectExtColorCombo.do' />"
                    ,data:JSON.stringify({"sModelCd":e.dataItem.modelCd})
                    ,async:false
                    ,success:function(data) {
                        $("#hiddenFscCode").val(e.dataItem.modelCd);
                    }
                });

                $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }
        });
        $("#sOcnCd").data("kendoExtDropDownList").enable(false);

        //외장색
        $("#sExtColorCd").kendoExtDropDownList({
             dataTextField: "extColorNm"
            ,dataValueField:"extColorCd"
            ,optionLabel:" "   // 전체
            ,select:function(e){
                if(this.dataItem(e.item).extColorCd == ""){
                    $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                    $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
                    return false;
                }

                $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sIntColorCd").data("kendoExtDropDownList").enable(true);

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/veh/vehicleMaster/selectIntColorCombo.do' />"
                    ,data:JSON.stringify({"sModelCd":$("#hiddenFscCode").val()})
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
            ,optionLabel:" "   // 전체
        });
        $("#sIntColorCd").data("kendoExtDropDownList").enable(false);

		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {

                if( dms.string.isEmpty(kendo.toString($("#sSysDt").data('kendoExtMaskedDatePicker').value(), "yyyyMM")) ){
                    dms.notification.info("<spring:message code='sal.lbl.ordYyMm' var='ordYyMm' /><spring:message code='global.info.chkSelectItemMsg' arguments='${ordYyMm},' />"); // 년월
                    $("#sSysDt").focus();
                    return;
                }

	            $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

        //버튼 - 신청
        $("#btnReqCancel").kendoButton({
            click:function(e) {

                var grid = $("#grid").data("kendoExtGrid");

                if( grid.select().index() < 0 ){
                    return;
                }

                var arrUpdate = [];
                var rows = grid.tbody.find("tr");

                rows.each(function(index, row) {
                    var dataItem = grid.dataItem(row);

                    if( dataItem.chgErpSendYn == "Y" && dataItem.erpSendYn == "N" ){
                        arrUpdate.push(dataItem);
                    }

                });

                if(arrUpdate.length == 0){
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                var saveData = { "updateList":arrUpdate}

                dms.window.confirm({
                    message:"<spring:message code='global.btn.request' var='request' /><spring:message code='global.info.cnfrmMsg' arguments='${request},' />"
                    ,title :"<spring:message code='global.btn.request' />"
                    ,callback:function(result){
                        if(result){

                            $.ajax({
                                url:"<c:url value='/sal/orm/maintainOrderInquiry/updateMaintainOrderInquiry.do' />",
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
                });
            }
        });


        //그리드 1번
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0416-114404"
           	,dataSource:{
               	transport:{
                     read:{
                         url:"<c:url value='/sal/orm/maintainOrderInquiry/selectMaintainOrderInquiry.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};
                             var sModelCd = "";
                             var sFscCd = "";

                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;

                             params["sSysDt"] = kendo.toString($("#sSysDt").data('kendoExtMaskedDatePicker').value(), "yyyyMMdd");
                             //params["sSysDt"] = $("#sSysDt").data('kendoExtMaskedDatePicker').value();

                             params["sPtyOrdTp"] = $("#sPtyOrdTp").data('kendoExtDropDownList').value();
                             params["sStockCauCd"] = $("#sStockCauCd").data('kendoExtDropDownList').value();
                             params["sCarlineCd"] = $("#sCarlineCd").data('kendoExtDropDownList').value();

                             if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                                 sModelCd = $("#hiddenFscCode").val();
                             }else{
                                 sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                             }

                             params["sFscCd"]   = sFscCd;    // fsc코드
                             params["sModelCd"]   = sModelCd;    // 모델

                             params["sOcnCd"] = $("#sOcnCd").data('kendoExtDropDownList').value();
                             params["sIntColorCd"] = $("#sIntColorCd").data('kendoExtDropDownList').value();
                             params["sExtColorCd"] = $("#sExtColorCd").data('kendoExtDropDownList').value();
                             params["sPtyOrdStatCd"] = $("#sPtyOrdStatCd").data('kendoExtDropDownList').value();

                             //console.log(kendo.stringify(params));
                             return kendo.stringify(params);
                         }else if (operation !== "read" && options.models) {
                             return kendo.stringify(options.models);
                         }
                     }
                 }
                 ,schema:{
                      model:{
                          id:"ptyOrdSerialNo"
                          ,fields:{
                               sysDt:{type:"string", editable:false} // 시스템 일자(년월)
                              ,ptyOrdYyMmDt:{type:"string", editable:false} // 위약오더 년월일자
                              ,ptyOrdSerialNo:{type:"string", editable:false} //위약오더 시리얼번호
                              ,ptyOrdSeq:{type:"string", editable:false} // 위약오더 일련번호
                              ,carlineCd:{type:"string", editable:false} // 차종
                              ,modelCd:{type:"string", editable:false} // 모델
                              ,ocnCd:{type:"string", editable:false} // OCN
                              ,extColorCd:{type:"string", editable:false} // 외장색
                              ,intColorCd:{type:"string", editable:false} // 내장색
                              ,erpReqDt:{type:"date", editable:false} // 처리일자
                              ,chgPfpDt:{type:"date", editable:false} // 처리일자
                              ,erpSendYn:{type:"string", editable:false} // 연장취소여부
                              ,ptyOrdStatCd:{type:"string", editable:false} // 위약오더 상태코드
                              ,dlrCd:{type:"string", editable:false} // 딜러코드
                              ,ptyOrdWkcntCd:{type:"string", editable:false} // 주차 코드
                              //,ordNo:{type:"string", editable:false} // 주문번호
                              ,salesNo:{type:"string", editable:false} //판매 주문번호
                              ,carlineCd:{type:"string", editable:false}    //차종코드
                              ,carlineNm:{type:"string", editable:false} //
                              ,modelNm:{type:"string", editable:false} //
                              ,ocnCd         :{type:"string", editable:false}               //OCN코드
                              ,ocnNm:{type:"string", editable:false} //
                              ,extColorCd    :{type:"string", editable:false}               //외색코드
                              ,extColorNm:{type:"string", editable:false} //
                              ,intColorCd    :{type:"string", editable:false}               //내색코드
                              ,ptyOrdTp:{type:"string", editable:false} // 위약오더 유형
                              ,ptyOrdGradeTp:{type:"string", editable:false} // 위약오더 등급유형
                              ,pfpDt:{type:"date", editable:false} //납기예시일
                              ,ordDt:{type:"date", editable:false} //주문일자
                              ,ptyAmt:{type:"number", editable:false} //위약금액
                              ,stockCauCd:{type:"string", editable:false} // 책임구분
                              ,erpProcDt:{type:"date", validation:{required:true}} // 처리일자
                              ,chgErpSendYn:{type:"string", editable:true} // 연장취소
                              ,ptyOrdSeq:{type:"string", editable:true} // 연장취소
                              ,sysDtDate:{type:"date", editable:false} //납기예시일
                          }
                     }
                 }
            }
    	    ,height:450
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
    	    ,edit:onEditGrid
            ,autoBind:true
            ,scrollable:true
            ,sortable:false
            ,edit:function(e){
                var fieldName = e.container.find("input[name][data-bind]").attr("name");

                if(fieldName == "chgErpSendYn"){
                    if((kendo.toString(e.model.sysDt,"<dms:configValue code='dateFormat' />")).replace(/-/gi, "") != toDay || e.model.ptyOrdStatCd == "A"){
                        this.closeCell();
                    }
                }
            }
            ,columns:[
                 {field:"ptyOrdWkcntCd", hidden:true }  // 위약오더 주차코드
                ,{field:"ptyOrdSerialNo", hidden:true }  // 위약오더 시리얼번호
                ,{field:"ptyOrdSeq", hidden:true }  // 위약오더 일련번호
                ,{field:"sysDt", hidden:true }  // 딜러코드
                ,{field:"carlineCd", hidden:true }  // 차종코드
                ,{field:"modelCd", hidden:true }  // 모델코드
                ,{field:"ocnCd", hidden:true }  // ocn코드
                ,{field:"extColorCd", hidden:true }  // 외장색 코드
                ,{field:"intColorCd", hidden:true }  // 내장색 코드
                ,{field:"erpReqDt", hidden:true }  // 처리일자
                ,{field:"chgPfpDt", hidden:true }  // 변경 납기일자
                ,{field:"erpSendYn", hidden:true }  // 연장취소
                ,{field:"chgErpSendYn", title:"<spring:message code='sal.lbl.erpSendCancel' />"
                    , width:70
                    ,headerAttributes:{"class":"ac"}
                    ,attributes:{"class":"ac"}
                    ,template:"#=cancelFlagArr[chgErpSendYn]#"
                    ,editor:function (container, options){
                                  $('<input required name="chgErpSendYn" data-bind="value:' + options.field + '"/>').appendTo(container).kendoExtDropDownList({
                                       autoBind:false
                                      ,dataTextField:"cmmCdNm"
                                      ,dataValueField:"cmmCd"
                                      ,dataSource:cancelFlagList
                                  });
                              }
                    ,filterable:{
                        cell:{
                            showOperators:false
                            ,template: function (e) {
                                   e.element.kendoExtDropDownList({
                                       dataSource:cancelFlagList
                                       ,dataTextField:"cmmCdNm"
                                       ,dataValueField:"cmmCd"
                                       ,valuePrimitive:true
                                       ,optionLabel:" "
                                   });
                               }
                        }
                    }
                }
                 ,{field:"ptyOrdStatCd", title:"<spring:message code='sal.lbl.ordStat' />"
                    ,width:75
                    ,headerAttributes:{style:"text-align:center;"}
                    , template:"# if(ptyOrdStatCdArr[ptyOrdStatCd] != null){# #= ptyOrdStatCdArr[ptyOrdStatCd].cmmCdNm# #}#"
                    ,attributes:{ "style":"text-align:center"}
                    ,filterable:{
                        cell:{
                            showOperators:false
                            ,template: function (e) {
                                   e.element.kendoExtDropDownList({
                                       dataSource:ptyOrdStatCdAllList
                                       ,dataTextField:"cmmCdNm"
                                       ,dataValueField:"cmmCd"
                                       ,valuePrimitive:true
                                       ,optionLabel:" "
                                   });
                               }
                        }
                    }
                }  // 위약오더 상태
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.dealer' />"
                    ,width:55
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 딜러코드
                ,{field:"ptyOrdYyMmDt", title:"<spring:message code='sal.lbl.ordYyMm' />"
                    ,width:100
                    ,format:"{0:yyyy-MM}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 년월
                ,{field:"ptyOrdWkcntCd", title:"<spring:message code='global.lbl.week' />"
                    ,width:50
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 위약오더 주차코드

                ,{field:"salesNo", title:"<spring:message code='global.lbl.ordNo' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 판매 주문번호
                ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />"
                    , width:80
                    , headerAttributes:{style:"text-align:center;"}}//차종code
                ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />"
                    , width:70
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 차종
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />"
                    ,width:200
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 모델
                ,{field:"ocnCd",   title:"<spring:message code='global.lbl.ocnCode' />"
                    ,width:80
                    ,headerAttributes:{style:"text-align:center;"}} //OCNcode
                ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocnNm' />"
                    ,width:150
                    ,headerAttributes:{style:"text-align:center;"}
                }  // OCN
                ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />"
                    ,width:80
                    ,headerAttributes:{style:"text-align:center;"}} //외장색code
                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 외장색
                ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />"
                    ,width:80
                    ,headerAttributes:{style:"text-align:center;"}} //내장색code
                //,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />"
                //    ,width:180
                //    ,headerAttributes:{style:"text-align:center;"}
                //}  // 내장색
                ,{field:"ptyOrdTp", title:"<spring:message code='global.lbl.orderType' />"
                    ,width:120
                    ,headerAttributes:{style:"text-align:center;"}
                    ,template:"#=ordTpArr[ptyOrdTp].cmmCdNm#"
                    ,attributes:{ "style":"text-align:left"}
                    ,filterable:{
                        cell:{
                            showOperators:false
                            ,template: function (e) {
                                   e.element.kendoExtDropDownList({
                                       dataSource:ordTpList
                                       ,dataTextField:"cmmCdNm"
                                       ,dataValueField:"cmmCd"
                                       ,valuePrimitive:true
                                       ,optionLabel:" "
                                   });
                               }
                        }
                    }
                }  // 위약오더 유형
                ,{field:"ptyOrdGradeTp", title:"<spring:message code='global.lbl.orderGrade' />"
                    ,width:55
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 주문등급
                ,{field:"pfpDt", title:"<spring:message code='sal.lbl.pfpExamDt' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "style":"text-align:center"}
                }  // 납기예시일
                ,{field:"ordDt", title:"<spring:message code='global.lbl.ordDt' />"
                    ,width:100
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 주문일자
                ,{field:"ptyAmt", title:"<spring:message code='global.lbl.ptyAmt' />"
                    ,width:55
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:right"}
                }  // 위약금액
                ,{field:"stockCauCd", title:"<spring:message code='sal.lbl.stockCau' />"
                    ,width:75
                    ,template:"#=stockCauCdArr[stockCauCd].cmmCdNm#"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,filterable:{
                        cell:{
                            showOperators:false
                            ,template: function (e) {
                                   e.element.kendoExtDropDownList({
                                       dataSource:stockCauCdList
                                       ,dataTextField:"cmmCdNm"
                                       ,dataValueField:"cmmCd"
                                       ,valuePrimitive:true
                                       ,optionLabel:" "
                                   });
                               }
                        }
                    }
                }  // 책임구분
                ,{field:"sysDtDate", title:"<spring:message code='global.lbl.erpProcDt' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "style":"text-align:center"}
                }  // 처리일자
            ]
    	});

	}); //document.ready End

	function onEditGrid(e){
	    var rows = e.sender.select();
        var selectedItem = e.sender.dataItem(rows[0]);

	    var fieldName = e.container.find("input").attr("name");

        if(!e.model.isNew()){
            if(fieldName=="chgErpSendYn" && selectedItem.erpSendYn == "Y"){
                this.closeCell();
            }
        }
    }

</script>