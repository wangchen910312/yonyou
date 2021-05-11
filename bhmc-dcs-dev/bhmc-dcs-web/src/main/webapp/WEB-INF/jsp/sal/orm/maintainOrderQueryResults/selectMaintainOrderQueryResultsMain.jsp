<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 오더유지 결과조회 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.orderQueryResult" /></h1><!-- 오더유지 결과조회 -->
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per"  role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:14%;">
                    <col style="width:19%;">
                    <col style="width:14%;">
                    <col style="width:19%;">
                    <col style="width:15%;">
                    <col style="width:19%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.date" /></span></th> <!-- 일자 -->
                        <td class="required_area">
                            <input name="sSysDt" id="sSysDt"  class="form_datepicker" >
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.orderType" /></span></th> <!-- 주문유형 -->
                        <td>
                            <input name="sPtyOrdTp" id="sPtyOrdTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="sal.lbl.stockCau" /></span></th> <!-- 책임구분 -->
                        <td>
                            <input name="sStockCauCd" id="sStockCauCd" type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.ordStat" /></th> <!-- 주문상태 -->
                        <td>
                            <input name="sPtyOrdStatCd" id="sPtyOrdStatCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.carLine" /></span></th> <!-- 차종 -->
                        <td>
                            <input name="sCarlineCd" id="sCarlineCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.model" /></span></th> <!-- 모델 -->
                        <td>
                            <input name="sModelCd" id="sModelCd" type="text" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span><spring:message code="global.lbl.ocn" /></span></th> <!-- OCN -->
                        <td>
                            <input name="sOcnCd" id="sOcnCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.extColor" /></span></th> <!-- 외장색 -->
                        <td>
                            <input name="sExtColorCd" id="sExtColorCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.intColor" /></span></th> <!-- 내장색 -->
                        <td>
                            <input name="sIntColorCd" id="sIntColorCd" type="text" class="form_comboBox">
                        </td>

                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid">
            <div id="grid"></div>
        </div>
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="global.lbl.dtlInfo" /></h2> <!-- 상세정보 -->
        </div>
        <div class="table_grid">
            <div id="grid2"></div>
        </div>
    </section>

<script  type="text/javascript">
     var sysDate = "${sysDate}";

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
     <c:forEach var="obj" items="${ptyOrdStatCdInfo}">
     ptyOrdStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var ptyOrdStatCdArr = dms.data.arrayToMap(ptyOrdStatCdList, function(obj){return obj.cmmCd});
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

     /************* 발생원인 SELECT BOX  *******************/
     var causesCdList = [];
     <c:forEach var="obj" items="${causesCdInfo}">
     causesCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>

     var causesCdArr = dms.data.arrayToMap(causesCdList, function(obj){return obj.cmmCd});
     /************* 발생원인 SELECT BOX  *******************/


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
     var extColorList = [];
     var intColorList = [];

	$(document).ready(function () {
	    /**
         * 년월
         */
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
        * 외장색 콤보박스
        */
        $("#sExtColorCd").kendoExtDropDownList({
            dataTextField:"extColorNm"
           ,dataValueField:"extColorCd"
           ,select:onSelectExtColorCd
           ,optionLabel:" "  // 전체
        });

        /**
        * 내장색 콤보박스
        */
        $("#sIntColorCd").kendoExtDropDownList({
            dataTextField:"intColorNm"
           ,dataValueField:"intColorCd"
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



		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {

                var dtSysDt = $("#sSysDt").val();
                if( dtSysDt == null || dtSysDt == ""){
                    dms.notification.info("<spring:message code='sal.lbl.date' var='date' /><spring:message code='global.info.chkSelectItemMsg' arguments='${date},' />"); // 년월
                    $("#sSysDt").focus();
                    return;
                }

                $('#grid2').data('kendoExtGrid').dataSource.data([]);
	            $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

        //그리드 1번
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0721-114405"
           	,dataSource:{
               	transport:{
                     read:{
                         url:"<c:url value='/sal/orm/maintainOrderQueryResults/selectMaintainOrderQueryResults.do' />"
                     }
                    ,parameterMap:function(options, operation) {
                         if (operation === "read") {

                             var params = {};
                             params["recordCountPerPage"] = options.pageSize;
                             params["pageIndex"] = options.page;
                             params["firstIndex"] = options.skip;
                             params["lastIndex"] = options.skip + options.take;
                             params["sort"] = options.sort;

                             params["sSysDt"] = $("#sSysDt").data('kendoExtMaskedDatePicker').value();
                             params["sPtyOrdTp"] = $("#sPtyOrdTp").data('kendoExtDropDownList').value();
                             params["sStockCauCd"] = $("#sStockCauCd").data('kendoExtDropDownList').value();
                             params["sCarlineCd"] = $("#sCarlineCd").data('kendoExtDropDownList').value();
                             params["sModelCd"] = $("#sModelCd").data('kendoExtDropDownList').value();
                             params["sOcnCd"] = $("#sOcnCd").data('kendoExtDropDownList').value();
                             params["sIntColorCd"] = $("#sIntColorCd").data('kendoExtDropDownList').value();
                             params["sExtColorCd"] = $("#sExtColorCd").data('kendoExtDropDownList').value();
                             params["sPtyOrdStatCd"] = $("#sPtyOrdStatCd").data('kendoExtDropDownList').value();

                             console.log(kendo.stringify(params));

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
                              sysDt:{type:"date", hidden:true} // 시스템 일자(년월)
                              ,ptyOrdWkcntCd:{type:"string", hidden:true} // 주차 코드
                              ,ptyOrdSerialNo:{type:"string", hidden:true} //위약오더 시리얼번호
                              ,ptyOrdSeq:{type:"string", hidden:true} // 위약오더 일련번호
                              ,carlineCd:{type:"string", hidden:true} // 차종
                              ,modelCd:{type:"string", hidden:true} // 모델
                              ,ocnCd:{type:"string", hidden:true} // OCN
                              ,extColorCd:{type:"string", hidden:true} // 외장색
                              ,intColorCd:{type:"string", hidden:true} // 내장색
                              ,erpReqDt:{type:"date", hidden:true} // 처리일자
                              ,chgPfpDt:{type:"date", hidden:true} // 처리일자
                              ,erpSendYn:{type:"string", hidden:true} // 연장취소여부
                              ,dlrCd:{type:"string", editable:false} // 딜러코드
                              ,carlineNm:{type:"string", editable:false} //
                              ,modelNm:{type:"string", editable:false} //
                              ,ocnNm:{type:"string", editable:false} //
                              ,extColorNm:{type:"string", editable:false} //
                              ,intColorNm:{type:"string", editable:false} //
                              ,ptyOrdTp:{type:"string", editable:false} // 위약오더 유형
                              ,ptyOrdYyMmDt:{type:"date", editable:false} // 위약오더 년월일자
                              ,ordDt:{type:"date", editable:false} //주문일자
                              ,pfpDt:{type:"date", editable:false} //납기예시일
                              ,chgPfpDt:{type:"date", editable:false} //변경납기예시일
                              ,stockCauCd:{type:"string", editable:false} // 책임구분
                              ,causesCd:{type:"string", editable:false} // 발생원인
                              ,erpProcDt:{type:"date", validation:{required:true}} // 처리일자
                              ,ptyOrdStatCd:{type:"string", editable:false} // 위약오더 상태코드
                          }
                     }
                 }
            }
    	    ,height:406
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
            ,appendEmptyColumn:false          //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,autoBind:false
            ,scrollable:true
            ,change:function(e){
                $("#grid2").data("kendoExtGrid").dataSource.read();
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
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.dealer' />"
                    ,width:55
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 딜러코드
                ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />"
                    , width:70
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 차종
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />"
                    ,width:200
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 모델
                ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />"
                    ,width:150
                    ,headerAttributes:{style:"text-align:center;"}
                }  // OCN
                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 외장색
                ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />"
                    ,width:180
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 내장색
                ,{field:"ptyOrdTp", title:"<spring:message code='global.lbl.orderType' />"
                    ,width:75
                    ,headerAttributes:{style:"text-align:center;"}
                    ,template:"#=ordTpArr[ptyOrdTp].cmmCdNm#"
                    ,attributes:{ "style":"text-align:left"}
                }  // 위약오더 유형
                ,{field:"ptyOrdYyMmDt", title:"<spring:message code='sal.lbl.ordYyMm' />"
                    ,width:100
                    ,format:"{0:yyyy-MM}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 년월
                ,{field:"ordDt", title:"<spring:message code='global.lbl.ordDt' />"
                    ,width:100
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 주문일자
                ,{field:"pfpDt", title:"<spring:message code='sal.lbl.pfpExamDt' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "style":"text-align:center"}
                }  // 납기예시일
                ,{field:"chgPfpDt", title:"<spring:message code='sal.lbl.chgPfpExamDt' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,attributes:{ "style":"text-align:center"}
                }  // 변경납기예시일
                ,{field:"stockCauCd", title:"<spring:message code='sal.lbl.stockCau' />"
                    ,width:75
                    ,template:"#=stockCauCdArr[stockCauCd].cmmCdNm#"
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 귀책처(책임구분)
                ,{field:"causesCd", title:"<spring:message code='sal.lbl.stockCau' />"
                    ,width:75
                    ,template:"#=causesCdArr[causesCd].cmmCdNm#"
                    ,headerAttributes:{style:"text-align:center;"}
                }  // 발생원인
                ,{field:"erpProcDt", title:"<spring:message code='global.lbl.erpProcDt' />"
                    ,width:100
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
                }  // 처리일자
                ,{field:"ptyOrdStatCd", title:"<spring:message code='sal.lbl.ordStat' />"
                    ,width:75
                    ,headerAttributes:{style:"text-align:center;"}
                    ,template:"#=ptyOrdStatCdArr[ptyOrdStatCd].cmmCdNm#"
                    ,attributes:{ "style":"text-align:center"}
                }  // 위약오더 상태
            ]
    	});

    	//그리드 2번
        $("#grid2").kendoExtGrid({
            gridId:"G-SAL-0721-114406"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/sal/orm/maintainOrderQueryResults/selectMaintainOrderQueryResultsDet.do' />"
                    }
                   ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var grid = $("#grid").data("kendoExtGrid");
                            var rows = grid.tbody.find("tr");
                            var gridData = grid.dataItem(rows[grid.select().index()]);

                            var params = {};
                            params["sort"] = options.sort;

                            params["sysDt"] = gridData.sysDt;
                            params["dlrCd"] = gridData.dlrCd;
                            params["ptyOrdYyMmDt"] = gridData.ptyOrdYyMmDt;
                            params["ptyOrdWkcntCd"] = gridData.ptyOrdWkcntCd;
                            params["carlineCd"] = gridData.carlineCd;
                            params["ptyOrdSerialNo"] = gridData.ptyOrdSerialNo;
                            params["ptyOrdSeq"] = gridData.ptyOrdSeq;
                            params["modelCd"] = gridData.modelCd;
                            params["ocnCd"] = gridData.ocnCd;
                            params["extColorCd"] = gridData.extColorCd;
                            params["intColorCd"] = gridData.intColorCd;

                            return kendo.stringify(params);
                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
               ,error:function(e){

                }
               ,schema:{
                    data:"data"
                   ,model:{
                        id:"erpProcDt"
                       ,fields:{
                            erpProcDt:{type:"date",  editable:false}
                           ,pfpDt:{type:"date",  editable:false}
                           ,chgPfpDt:{type:"date",  editable:false}
                           ,stockCauCd:{type:"string",  editable:false}
                           ,causesCd:{type:"string",  editable:false}
                           ,ptyAmt:{type:"number",  editable:false}
                           ,ptyOrdStatCd:{type:"string",  editable:false}
                           ,repSendYn:{type:"string",  editable:false}
                        }
                    }
                }
            }
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,appendEmptyColumn:false          //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,height:173
           ,autoBind:false
           ,scrollable:true
           ,pageable:false
           ,columns:[
                {field:"erpProcDt", title:"<spring:message code='global.lbl.erpProcDt' />"
                    ,width:100
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                    ,headerAttributes:{style:"text-align:center;"}
                    ,attributes:{ "style":"text-align:center"}
               }  // 처리일자
               ,{field:"pfpDt", title:"<spring:message code='global.lbl.erpProcDt' />"
                   ,width:100
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,headerAttributes:{style:"text-align:center;"}
                   ,attributes:{ "style":"text-align:center"}
               }  // 납기예시일
               ,{field:"chgPfpDt", title:"<spring:message code='global.lbl.erpProcDt' />"
                   ,width:100
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,headerAttributes:{style:"text-align:center;"}
                   ,attributes:{ "style":"text-align:center"}
               }  // 변경 납기예시일
               ,{field:"stockCauCd", title:"<spring:message code='sal.lbl.stockCau' />"
                   ,width:75
                   ,template:"#=stockCauCdArr[stockCauCd].cmmCdNm#"
                   ,headerAttributes:{style:"text-align:center;"}
               }  // 귀책처(책임구분)
               ,{field:"causesCd", title:"<spring:message code='sal.lbl.stockCau' />"
                   ,width:75
                   ,template:"#=causesCdArr[causesCd].cmmCdNm#"
                   ,headerAttributes:{style:"text-align:center;"}
               }  // 발생원인
               ,{   field:"ptyAmt"
                   ,title:"<spring:message code='global.lbl.ptyAmt' />"
                   ,width:170
                   ,attributes:{"class":"ar"}
               } //위약금액
               ,{field:"ptyOrdStatCd", title:"<spring:message code='sal.lbl.ordStat' />"
                   ,width:75
                   ,headerAttributes:{style:"text-align:center;"}
                   ,template:"#=ptyOrdStatCdArr[ptyOrdStatCd].cmmCdNm#"
                   ,attributes:{ "style":"text-align:center"}
               }  // 위약오더 상태
               ,{field:"erpSendYn", title:"<spring:message code='sal.lbl.erpSendCancel' />"
                   , width:70
                   ,headerAttributes:{"class":"ac"}
                   ,attributes:{"class":"ac"}
                   ,template:"#=cancelFlagArr[erpSendYn]#"
               }// 취소요청
            ]
        });

	}); //document.ready End



</script>