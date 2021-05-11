<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 오더 취소신청 관리 -->
<div id="resizableContainer">
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.cancelOrdMngApplication" /></h1> <!-- 오더 취소신청 관리 -->
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                <button class="btn_m" id="btnDel"><spring:message code="global.btn.request" /></button> <!-- 삭제 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form"  role="search" data-btnid="btnSearch">
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
                        <th scope="row"><span><spring:message code="sal.lbl.ordYyMmDt" /></span></th> <!-- 년월 주차 -->
                        <td>
                            <div class="form_float">
                                <div class="form_left">
                                    <input name="sOrdYyMmDt" id="sOrdYyMmDt" class="form_datepicker">
                                </div>
                                <div class="form_right">
                                    <input name="sOrdPrid" id="sOrdPrid" type="text" maxlength="1" class="form_numeric">
                                </div>
                            </div>
                        </td>
                        <th scope="row"><span><spring:message code="par.lbl.purcOrdTp" /></span></th> <!-- 오더유형 -->
                        <td>
                            <input name="sOrdTp" id="sOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"></th>
                        <td></td>
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
                    <tr>
                        <th scope="row"><span><spring:message code="global.lbl.extColor" /></span></th> <!-- 외장색 -->
                        <td>
                            <input name="sExtColorCd" id="sExtColorCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.intColor" /></span></th> <!-- 내장색 -->
                        <td>
                            <input name="sIntColorCd" id="sIntColorCd" type="text" class="form_comboBox">
                        </td>
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
     var sDlrCd  = "${dlrCd}";
     var sysDate = "${sysDate}";

     /************* 주문유형 SELECT BOX  *******************/
     var ordTpList = [];
     var ordTpObj = {};
     <c:forEach var="obj" items="${ordTpInfo}">
       ordTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
       ordTpObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
     </c:forEach>

     var ordTpArr = dms.data.arrayToMap(ordTpList, function(obj){return obj.cmmCd});


     /**
      * 차종 콤보
      */
      var carLineCdList = [];
      var carLineCdArr = [];
      <c:forEach var="obj" items="${carLineCdInfo}">
       carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
       carLineCdArr["${obj.carlineCd}"] = "${obj.carlineNm}"
      </c:forEach>
      var modelCdList = [];
      var modelCdArr;
      var ocnCdList = [];
      var extColorList = [];
      var intColorList = [];

     save = function(carStatCd, prty) {
         var saveData;


         var arrSave = [];

         var grid = $("#grid").data("kendoExtGrid");
         var rows = grid.select();

         if(rows.length  == 0 ){
             dms.notification.info("<spring:message code='global.lbl.car' var='car' /><spring:message code='global.info.chkSelectItemMsg' arguments='${car},' />"); // 차량을 선택해주세요.
             return false;
         }else{
             rows.each(function(index, row) {
                 var dataItem = grid.dataItem(row);

                 arrSave.push(dataItem);
              // 체크여부
                 //var check = $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").is(":checked");
              // 체크된 Row만.
              /*
                 if(check){
                     if( dataItem.ordNo != null || dataItem.ordNo != "" ){
                         arrUpdate.push(dataItem);
                     }else{
                         arrInsert.push(dataItem);
                     }
                 }
              */
             });
         }

         var saveData = { "updateList":arrSave }
         $.ajax({
             url:"<c:url value='/sal/orm/orderPriorityManagement/updateOrderPriorityManagement.do' />",
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

	$(document).ready(function () {

	    $("#sOrdTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
           ,dataValueField:"cmmCd"
           ,dataSource:ordTpList
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
           ,optionLabel:" "  // 선택
        });
        /**
        * 모델 콤보박스
        */
        $("#sModelCd").kendoExtDropDownList({
            dataTextField:"modelNm"
           ,dataValueField:"modelCd"
           ,select:onSelectModelCd
           ,optionLabel:" "  // 선택
        });

        /**
        * OCN 콤보박스
        */
        $("#sOcnCd").kendoExtDropDownList({
            dataTextField:"ocnNm"
           ,dataValueField:"ocnCd"
               ,optionLabel:" "  // 선택
        });

        /**
        * 외장색 콤보박스
        */
        $("#sExtColorCd").kendoExtDropDownList({
            dataTextField:"extColorNm"
           ,dataValueField:"extColorCd"
           ,select:onSelectExtColorCd
           ,optionLabel:" "  // 선택
        });

        /**
        * 내장색 콤보박스
        */
        $("#sIntColorCd").kendoExtDropDownList({
            dataTextField:"intColorNm"
           ,dataValueField:"intColorCd"
           //,select:onSelectIntColorCd
           ,optionLabel:" "  // 선택
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
             $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
             $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
             $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
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

             var responseExtColorCdJson = dms.ajax.getJson({
                 url:"<c:url value='/sal/cnt/contract/selectExtColor.do'/>"
                 ,data:JSON.stringify({"modelCd":this.dataItem(e.item).modelCd})
                 ,async:false
             });

             $("#sExtColorCd").data("kendoExtDropDownList").setDataSource(responseExtColorCdJson.data);
             $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
         };

        /**
         * 외장색에 따른 내장색 조회
         */
         function onSelectExtColorCd(e) {

             var responseJson = dms.ajax.getJson({
                 url:"<c:url value='/sal/cnt/contract/selectIntColor.do'/>"
                 ,data:JSON.stringify({"modelCd":this.dataItem(e.item).modelCd})
                 ,async:false
             });
             $("#sIntColorCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
         };

         $("#sOrdPrid").kendoExtNumericTextBox({
             min:1
            ,max:5
            ,spinners:false
            ,format:"{0:##,###}"
         });
        /**
         * 년월
         */
         $("#sOrdYyMmDt").kendoExtMaskedDatePicker({
             format:"yyyy-MM"
             ,start:"year"
             ,depth:"year"
             ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
             ,value:sysDate
         });

		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {

	            $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

	    //버튼 - 입고확정
        $("#btnDel").kendoButton({
            click:function(e) {
                save();

            }
        });

        //그리드 1번
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0721-115001"
           	,dataSource:{
               	transport:{
                     read:{
                         url:"<c:url value='/sal/orm/orderPriorityManagement/selectOrderPriorityManagement.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};
                             params["sort"] = options.sort;

                             var strOrdTp = $("#sOrdTp").data('kendoExtDropDownList').value();
                             var sOrdYyMmDt = $("#sOrdYyMmDt").data('kendoExtMaskedDatePicker').value();

                             params["sOrdTp"] = strOrdTp;
                             params["sOrdYyMmDt"] = sOrdYyMmDt;
                             params["sOrdPrid"] = $("#sOrdPrid").val();
                             params["sDlrCd"] = sDlrCd;

                             params["sCarlineCd"] = $("#sCarlineCd").data('kendoExtDropDownList').value();
                             params["sModelCd"] = $("#sModelCd").data('kendoExtDropDownList').value();
                             params["sOcnCd"] = $("#sOcnCd").data('kendoExtDropDownList').value();
                             params["sExtColorCd"] = $("#sExtColorCd").data('kendoExtDropDownList').value();
                             params["sIntColorCd"] = $("#sIntColorCd").data('kendoExtDropDownList').value();

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
                              ordYyMmDt:{type:"string", hidden:true} //
                              ,ordPrid:{type:"string", hidden:true} //
                              ,dlrCd:{type:"string", editable:false} //딜러코드
                              ,carlineNm:{type:"string", editable:false} //차종명
                              ,modelNm:{type:"string", editable:false} //모델명
                              ,ocnNm:{type:"string", editable:false} //ocn명
                              ,extColorNm:{type:"string", editable:false} //외색명
                              ,intColorNm:{type:"string", editable:false} //내색명
                              ,ordGradeCd:{type:"string", editable:false} //오더등급코드
                              ,ordTp:{type:"string", editable:false} //오더유형
                              ,pfpExamDt:{type:"Date", editable:false} //납기예시일
                              ,erpSendYn:{type:"string", editable:false} //erp전송여부
                              ,salesNo:{type:"string", editable:false} //erp주문번호
                          }
                     }
                 }
            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
            ,appendEmptyColumn:false          //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
    	    ,autoBind:false
            ,scrollable:true
            ,pageable:false
            ,columns:[
                 {field:"ordYyMmDt", hidden:true}  // 년월
                ,{field:"ordPrid", hidden:true}  // 주차
                ,{field:"dlrCd", hidden:true}  // 딜러코드
                ,{field:"carlineNm",      title:"<spring:message code='global.lbl.carLine' />",width:80, attributes:{"class":"al"}} //차종
                ,{field:"modelNm",      title:"<spring:message code='global.lbl.model' />",width:140, attributes:{"class":"al"}} //모델
                ,{field:"ocnNm",      title:"<spring:message code='global.lbl.ocn' />",width:140, attributes:{"class":"al"}} //OCN
                ,{field:"extColorNm",      title:"<spring:message code='global.lbl.extColor' />",width:100, attributes:{"class":"al"}} //외장색
                ,{field:"intColorNm",      title:"<spring:message code='global.lbl.intColor' />",width:100, attributes:{"class":"al"}} //내장색
                ,{field:"ordGradeCd",      title:"<spring:message code='global.lbl.orderGrade' />",width:80, attributes:{"class":"ac"}} //주문등급
                ,{field:"salesNo",      title:"<spring:message code='global.lbl.ordNo' />",width:80, attributes:{"class":"ac"}} //erp주문번호
                ,{field:"ordTp", title:"<spring:message code='global.lbl.orderType' />", width:120,  attributes:{"class":"al"}, template:"#=dms.string.strNvl(ordTpObj[ordTp])#"}    // 주문유형
                ,{field:"pfpExamDt",      title:"<spring:message code='sal.lbl.pfpExamDt' />",width:80, attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateFormat' />}"} //납기예시일
                ,{field:"erpSendYn",      title:"<spring:message code='sal.lbl.erpSendYn' />",width:80, attributes:{"class":"ac"}} //GASS (ERP전송여부)
            ]
    	});


    	$("#btnDel").data("kendoButton").enable(false);

	}); //document.ready End
</script>