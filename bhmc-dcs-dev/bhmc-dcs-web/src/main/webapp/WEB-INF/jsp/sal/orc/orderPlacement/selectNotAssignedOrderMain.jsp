<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<div id="resizableContainer">
    <!-- 미배정 주문조회 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.NotAssignedOrder" /></h1> <!-- 미배정 주문조회 -->
            <div class="btn_right">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            </div>
        </div>
        <!-- 조회 조건 시작 -->
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
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
                        <th scope="row"><spring:message code="global.lbl.carLine" /></th> <!-- 차종 -->
                        <td>
                            <input name="sCarlineCd" id="sCarlineCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.model" /></th> <!-- 모델 -->
                        <td>
                            <input name="sModelCd" id="sModelCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ocn" /></th> <!-- OCN -->
                        <td>
                            <input name="sOcnCd" id="sOcnCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->
<%--         <div class="txt_total">
            <p><spring:message code="sal.lbl.assignOrderTotalAmt" />:<span id="ordpVaprSum">0</span></p> <!-- 주문배정 필요한 총금액 -->
            <p><spring:message code="sal.lbl.orderTotalCnt" />:<span id="ordpCountSum">0</span></p> <!-- 오더수량 -->
        </div> --%>
        <div class="table_grid mt10">
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>



<script  type="text/javascript">

    /**
     * 주문유형 콤보박스
     */
     var ordTpCdObj = {};
     <c:forEach var="obj" items="${ordTpInfo}">
         ordTpCdObj["${obj.cmmCd}"] = "["+"${obj.cmmCd}"+"]"+"${obj.cmmCdNm}";
     </c:forEach>

	/**
	 * 차종 콤보
	 */
	 var carLineCdList = [];
	 <c:forEach var="obj" items="${carLineCdInfo}">
	  carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
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

            $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);

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

            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);

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

		//버튼 - 조회
	    $("#btnSearch").kendoButton({
	        click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);
	        }
	    });

	    function dataBinding(e) {

	        var grid = e.sender;
	        var ordpVaprSum = grid.dataSource.aggregates().ordpVapr;
	        var ordpCountSum = grid.dataSource.aggregates().ordpCount;

	        $("#ordpVaprSum").html(ordpVaprSum);
	        $("#ordpCountSum").html(ordpCountSum);
	    }

    	//그리드 1번
    	$("#grid").kendoExtGrid({
    	    gridId:"G-SAL-0721-114109"
           	,dataSource:{
           	 transport:{
                 read:{
                     url:"<c:url value='/sal/orc/orderPlacement/selectNotAssignedOrder.do' />"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         /*Paging Param Start~!*/
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         /*Paging Param End~!*/

                         params["sort"] = options.sort;

                         params["sCarlineCd"] = $("#sCarlineCd").val();
                         params["sModelCd"] = $("#sModelCd").val();
                         params["sOcnCd"] = $("#sOcnCd").val();

                         //console.log(kendo.stringify(params));

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
                     id:"modelCd"
                    ,fields:{
                         carlineCd:{type:"string", hidden:true} //차종코드
                        ,modelCd:{type:"string", hidden:true} //모델코드
                        ,ocnCd:{type:"string", hidden:true} //OCN코드
                        ,extColorCd:{type:"string", hidden:true} //외색코드
                        ,intColorCd:{type:"string", hidden:true} //내색코드
                        ,carlineNm:{type:"string", editable:false} //차종명
                        ,modelNm:{type:"string", editable:false} //모델명
                        ,ocnNm:{type:"string", editable:false} //OCN명
                        ,extColorNm:{type:"string", editable:false} //외색명
                        ,intColorNm:{type:"string", editable:false} //내색명
                        ,mdpr:{type:"number", editable:false} //할인전금액
                        ,aftMdpr:{type:"number", editable:false} //할인후금액
                        ,adjp:{type:"number", editable:false} //할인금액
                        ,ordpVapr:{type:"number", editable:false} //필요자금
                        ,ordpCount:{type:"number", editable:false} //오더댓수
                     }
                 }
             }
    	   ,aggregate:[
                      { field:"mdpr", aggregate:"sum" }
                     ,{ field:"adjp", aggregate:"sum" }
                     ,{ field:"ordpCount", aggregate:"sum" }
                     ,{ field:"ordpVapr", aggregate:"sum"}
           ]
           }
           ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
           ,appendEmptyColumn:false           //빈컬럼 적용. default:false
           ,enableTooltip:true               //Tooltip 적용, default:false
           ,autoBind:true
           ,scrollable:true
           ,editable:false
           ,columns:[
                {field:"ordpCndy", title:"<spring:message code='global.lbl.orderDt' />"
                    , width:100
                    ,attributes:{"class":"ac"}
                    ,footerAttributes:{style:"visibility:hidden;"}
                }  // 주문일자
                ,{field:"salesNo", title:"<spring:message code='global.lbl.ordNo' />"
                    ,width:100
                    ,attributes:{"class":"ac"}
                    ,footerAttributes:{style:"visibility:hidden;"}
                }  // 주문번호
                ,{field:"sord", title:"<spring:message code='global.lbl.orderType' />"
                    , width:70
                    ,headerAttributes:{style:"text-align:center;"}
                    ,footerAttributes:{style:"visibility:hidden;"}
                    ,template:"#= ordTpCdObj[sord] #"
                }  // 주문유형
/*                 ,{field:"sordNm", title:"<spring:message code='global.lbl.orderTypeNm' />"
                    , width:70
                    ,headerAttributes:{style:"text-align:center;"}
                    ,footerAttributes:{style:"visibility:hidden;"}
                }  // 주문명칭 */
                ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />"
                    , width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,footerAttributes:{style:"visibility:hidden;"}
                }  // 차종
                ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />"
                    ,width:130
                    ,headerAttributes:{style:"text-align:center;"}
                    ,footerAttributes:{style:"visibility:hidden;"}
                }  // 모델
                ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />"
                    ,width:130
                    ,headerAttributes:{style:"text-align:center;"}
                    ,footerAttributes:{style:"visibility:hidden;"}
                }  // OCN
                ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,footerAttributes:{style:"visibility:hidden;"}
                }  // 외장색
                ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,footerAttributes:{style:"visibility:hidden;"}
                }  // 내장색
                ,{field:"chrgCd", title:"<spring:message code='global.lbl.chrgCd' />"
                    ,width:100
                    ,headerAttributes:{style:"text-align:center;"}
                    ,footerTemplate:"<spring:message code='global.lbl.total' />"    // 합계
                    ,footerAttributes:{style:"text-align:right;"}
                }  // 주문자
                ,{field:"mdpr"
    			    ,title:"<spring:message code='global.lbl.mdpr' />"
    			    ,width:100
    			    ,attributes:{"class":"ar"}
    			    ,format:"{0:n2}"
    			    ,footerTemplate:"#=kendo.toString(sum, 'n2')#"
    			    , footerAttributes:{style:"text-align:right;"}
    			}//시장지도가
                ,{field:"ordpCount"
                    ,title:"<spring:message code='global.lbl.ordpCount' />"
                    ,width:80
                    ,attributes:{"class":"ar"}
                    ,footerTemplate:"#=kendo.toString(sum, 'n0')#"
                    ,footerAttributes:{style:"text-align:right;"}
                }//오더수량
    			,{field:"adjp"
                    ,title:"<spring:message code='par.lbl.dcAmt' />"
                    ,width:100
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,footerTemplate:"#=kendo.toString(sum, 'n2')#"
                    , footerAttributes:{style:"text-align:right;"}
                }//할인금액
/* 			    ,{field:"aftMdpr"
                    ,title:"<spring:message code='global.lbl.aftMdpr' />"
                    ,width:100
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,footerAttributes:{style:"visibility:hidden;"}
                }//DC후 가격*/
                ,{field:"ordpVapr"
                    ,title:"<spring:message code='sal.lbl.whPrc' />"
                    ,width:100
                    ,attributes:{"class":"ar"}
                    ,format:"{0:n2}"
                    ,footerTemplate:"#=kendo.toString(sum, 'n2')#"
                    , footerAttributes:{style:"text-align:right;"}
                }//필요자금
            ]
    	});
	}); //document.ready End

</script>