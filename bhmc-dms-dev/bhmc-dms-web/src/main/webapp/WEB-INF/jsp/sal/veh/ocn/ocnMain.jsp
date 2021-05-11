<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- OCN 구성 정보 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.ocnConfInfo" /></h1>  <!-- OCN 구성 정보 -->
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12794" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                </dms:access>
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form" role="search" data-btnid="btnSearch">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col style="width:17%;">
                    <col style="width:8%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.carLine" /></th>  <!-- 차종 -->
                        <td>
                            <input name="sCarlineCd" id="sCarlineCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.model" /></th>  <!-- 모델 -->
                        <td>
                            <input name="sModelCd" id="sModelCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ocn" /></th>  <!-- OCN -->
                        <td>
                            <input name="sOcnCd" id="sOcnCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.applyDt" /></th>  <!-- 적용일 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sStartDt" id="sStartDt" class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sEndDt" id="sEndDt" class="form_datepicker">
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->

        <div class="clfix">
	        <!-- 차종별 OCN구성 내역 -->
	        <section class="left_areaStyle">
	            <div class="header_area">
	                <h2 class="title_basic"><spring:message code="sal.title.carlineOcnConfHis" /></h2>  <!-- 차종별 OCN구성 내역 -->
	            </div>
	            <div class="table_grid">
	                <div id="grid"></div>
	            </div>
	        </section>
	        <!-- //모델별 OCN구성 내역 -->
	        <!-- 옵션 구성 내역 -->
	        <section class="right_areaStyle">
	            <!-- 그리드 시작 -->
	            <div class="header_area">
	                <h2 class="title_basic"><spring:message code="sal.title.optionConfHis" /></h2>  <!-- 옵션 구성 내역 -->
	            </div>
	            <div class="table_grid">
	                <div id="grid2"></div>
	            </div>
	            <!-- 그리드 종료 -->
	        </section>
	        <!-- //옵션 구성 내역 -->
	    </div>
	    <!-- //Vehicle Spec-패키지 -->

    </section>


<script  type="text/javascript">

    /**
     * 차종 콤보
     */
     var carLineCdList = [];
     <c:forEach var="obj" items="${carLineCdInfo}">
      carLineCdList.push({carlineNm:"${obj.carlineCdNm}", carlineCd:"${obj.carlineCd}"});
     </c:forEach>

    $(document).ready(function () {

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
             dataTextField:"modelCdNm"
            ,dataValueField:"modelCd"
            ,select:onSelectModelCd
            ,optionLabel:" "  // 선택
         });

         /**
          * OCN 콤보박스
          */
          $("#sOcnCd").kendoExtDropDownList({
              dataTextField:"ocnCdNm"
             ,dataValueField:"ocnCd"
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

        };
        /**
        * 모델에 따른 OCN 조회
        */
        function onSelectModelCd(e) {

            var strModelCd = this.dataItem(e.item).modelCd;

            if( strModelCd != null && strModelCd != "" ){
                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/veh/modelPackage/selectModelPackageOcn.do'/>"
                    ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sModelCd":this.dataItem(e.item).modelCd})
                    ,async:false
                });

                $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }else{
                $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
            }
        };

	 	// 날짜 세팅
		//var fromDt = "${currentDt}";
		//fromDt.setMonth(fromDt.getMonth() - 1);
		//var toDt = new Date();
        //var fromDt = new Date();

		//var eFromDt = "${currentDt}";
		//eFromDt.setMonth(toDt.getMonth() + 1);
		//var toDt = new Date();
		//eToDt.setMonth(eToDt.getMonth() + 2);
		//eToDt.setDate(eToDt.getMonth() - 1);

		/**
		* 시작일자 (From)
		*/
		$("#sStartDt").kendoExtMaskedDatePicker({
	        format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        })


		/**
		* 종료일자 (From)
		*/
		$("#sEndDt").kendoExtMaskedDatePicker({
	        format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        })

		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e){

	            if( !($("#sStartDt").data('kendoExtMaskedDatePicker').value() == null && $("#sEndDt").data('kendoExtMaskedDatePicker').value() == null ) ){
	                if($("#sStartDt").data('kendoExtMaskedDatePicker').value() == null || $("#sEndDt").data('kendoExtMaskedDatePicker').value() == null){
	                    //적용일을 모두 입력해 주세요
	                    dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
	                    return false;
	                }
	            }

	            $('#grid2').data('kendoExtGrid').dataSource.data([]);
	            $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

    	//그리드 1번
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0721-115801"
           	,dataSource:{
           	 transport:{
                 read:{
                     url:"<c:url value='/sal/veh/ocn/selectOcn.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sCarlineCd"] = $("#sCarlineCd").val();
                         params["sModelCd"] = $("#sModelCd").val();
                         params["sOcnCd"] = $("#sOcnCd").val();
                         params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                         params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 data:"data"
                ,model:{
                     id:"modelCd"
                    ,fields:{
                         carlineCd:{type:"string", editable:false}
                        ,carlineNm:{type:"string", editable:false}
                        ,modelCd:{type:"string", editable:false}
                        ,ocnCd:{type:"string", editable:false}
                        ,ocnNm:{type:"string", editable:false}
                        ,startDt:{type:"date", editable:false}
                        ,endDt:{type:"date", editable:false}
                     }
                 }
             }
           }
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,enableTooltip:true               //Tooltip 적용, default:false
    	   ,height:439
    	   ,pageable:false
           ,appendEmptyColumn:true           //빈컬럼 적용. default:false
           ,filterable:false                 // 필터링 기능 사용안함
           ,change:function(e){
                $("#grid2").data("kendoExtGrid").dataSource.read();
           }
    	   ,columns:[
    		    {
    				title:"<spring:message code='global.lbl.carlineCd' />"  //차종
    			   ,field:"carlineCd"
    			   ,sortable:false
    			   ,width:100
    			   ,attributes:{ "style":"text-align:center"}
    			}
    		   ,{
    				title:"<spring:message code='global.lbl.carlineNm' />"  //차종명
    			   ,field:"carlineNm"
    			   ,sortable:false
    			   ,width:180
    			   ,attributes:{ "style":"text-align:left"}
    			}
    		   ,{
    				title:"<spring:message code='global.lbl.ocn' />"  //OCN
    			   ,field:"ocnCd"
    			   ,width:100
    			   ,attributes:{ "style":"text-align:center"}
    			}
    		   ,{
    				title:"<spring:message code='global.lbl.applyStartDt' />"  //적용시작일
    			   ,field:"startDt"
    			   ,format:"{0:<dms:configValue code='dateFormat' />}"
    			   ,width:120
    			   ,attributes:{ "style":"text-align:center"}
    			}
    		   ,{
                    title:"<spring:message code='global.lbl.applyEndDt' />"  //적용종료일
                   ,field:"endDt"
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,width:120
                   ,attributes:{ "style":"text-align:center"}
                }
    		]
    	});

    	//그리드 1번
        $("#grid2").kendoExtGrid({
            gridId:"G-SAL-0721-115802"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/sal/veh/ocn/selectOcnOption.do' />"
                    }
                   ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var grid = $("#grid").data("kendoExtGrid");
                            var rows = grid.tbody.find("tr");
                            var gridData = grid.dataItem(rows[grid.select().index()]);

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sCarlineCd"] = gridData.carlineCd;
                            params["sOcnCd"] = gridData.ocnCd;

                            return kendo.stringify(params);
                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
               ,schema:{
                    data:"data"
                   ,model:{
                        id:"modelCd"
                       ,fields:{
                            carlineCd:{type:"string",  editable:false}
                           ,modelCd:{type:"string",  editable:false}
                           ,ocnCd:{type:"string",  editable:false}
                           ,optionCd:{type:"string",  editable:false}
                           ,optionNm:{type:"string",  editable:false}
                           ,startDt:{type:"date",  editable:false}
                           ,endDt:{type:"date",  editable:false}
                        }
                    }
                }
            }
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,height:439
           ,autoBind:false
           ,appendEmptyColumn:true           //빈컬럼 적용. default:false
           ,filterable:false                 // 필터링 기능 사용안함
           ,pageable:false
           ,columns:[
                {
                    title:"<spring:message code='global.lbl.ocn' />" //OCN
                   ,field:"ocnCd"
                   ,sortable:false
                   ,width:70
                   ,attributes:{ "style":"text-align:center"}
                }
               ,{
                    title:"<spring:message code='global.lbl.optionCode' />"  //옵션코드
                   ,field:"optionCd"
                   ,width:90
                   ,attributes:{ "style":"text-align:center"}
                }
               ,{
                    title:"<spring:message code='global.lbl.optionNm' />"  //옵션명
                   ,field:"optionNm"
                   ,width:200
                   ,attributes:{ "style":"text-align:left"}
                }
               ,{
                   title:"<spring:message code='global.lbl.applyStartDt' />"  //적용시작일
                  ,field:"startDt"
                  ,format:"{0:<dms:configValue code='dateFormat' />}"
                  ,width:100
                  ,attributes:{ "style":"text-align:center"}
               }
              ,{
                   title:"<spring:message code='global.lbl.applyEndDt' />"  //적용종료일
                  ,field:"endDt"
                  ,format:"{0:<dms:configValue code='dateFormat' />}"
                  ,width:100
                  ,attributes:{ "style":"text-align:center"}
               }
            ]
        });

	}); //document.ready End

	function complete(jqXHR, textStatus){
		var response = jQuery.parseJSON(jqXHR.responseText);
		globalNotification.show(response["result"], "info");
	}
</script>