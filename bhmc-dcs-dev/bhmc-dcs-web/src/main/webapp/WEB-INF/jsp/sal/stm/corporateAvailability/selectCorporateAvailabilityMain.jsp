<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 법인 재고현황 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="sal.title.corporateAvailability" /></h1> <!-- 법인 재고현황 -->
            <div class="btn_right">
			<dms:access viewId="VIEW-I-12388" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
			</dms:access>
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
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.carLine" /></span></th> <!-- 차종 -->
                        <td class="required_area">
                            <input name="sCarlineCd" id="sCarlineCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.model" /></span></th> <!-- 모델 -->
                        <td class="required_area">
                            <input name="sModelCd" id="sModelCd" type="text" class="form_comboBox">
                            <input id="hiddenFscCode" type="hidden" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.ocn" /></span></th> <!-- OCN -->
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
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="grid"></div>
        </div>
    </section>

<script  type="text/javascript">

//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

// 하치장 SAL152
var vinmVlocObj = {};
<c:forEach var="obj" items="${vinmVlocDS}">
    vinmVlocObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function () {

    /**
     * 차종 콤보박스
     */
    $("#sCarlineCd").kendoExtDropDownList({
         dataTextField:"carlineNm"
        ,dataValueField:"carlineCd"
        ,dataSource:carLineCdList
        ,optionLabel:" "
        ,change:function(e){
            $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sModelCd").data("kendoExtDropDownList").enable(true);

            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sOcnCd").data("kendoExtDropDownList").enable(false);

            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
            
            $("#hiddenFscCode").val("");
            
            var dataItem = this.dataItem(e.item);
            if(dataItem.carlineCd == ""){
                $("#sModelCd").data("kendoExtDropDownList").enable(false);
                return false;
            }
            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/stm/corporateAvailability/selectModelTypeCombo.do' />"
                ,data:JSON.stringify({"sCarlineCd":dataItem.carlineCd})
                ,async:false
            });
            $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
    });
     /**
     * 모델 콤보박스
     */
     $("#sModelCd").kendoExtDropDownList({
         dataTextField:"fscNm"
        ,dataValueField:"fscCd"
        ,optionLabel:" "
        ,change:function(e){
            $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sOcnCd").data("kendoExtDropDownList").enable(true);
            
            $("#sExtColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sExtColorCd").data("kendoExtDropDownList").enable(false);

            $("#sIntColorCd").data("kendoExtDropDownList").setDataSource([]);
            $("#sIntColorCd").data("kendoExtDropDownList").enable(false);
            
            $("#hiddenFscCode").val("");
            
            var dataItem = this.dataItem(e.item);
            if(dataItem.modelCd == ""){
                $("#sOcnCd").data("kendoExtDropDownList").enable(false);
                return false;
            }
            var responseJson = dms.ajax.getJson({
                url:"<c:url value='/sal/stm/corporateAvailability/selectOcnCombo.do' />"
                ,data:JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.fscCd})
                ,async:false
            });
            $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
        }
         });
         $("#sModelCd").data("kendoExtDropDownList").enable(false);

     /**
     * OCN 콤보박스
     */
     $("#sOcnCd").kendoExtDropDownList({
         dataTextField:"ocnNm"
        ,dataValueField:"ocnCd"
        ,optionLabel:" "   // 전체
        ,select:function(e){
            
            if(this.dataItem(e.item).modelCnt > 1){
                dms.notification.info("<spring:message code='sal.info.modelOcnDupWrrMsg'/>");
                return false;
            }
            
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
                url:"<c:url value='/sal/stm/corporateAvailability/selectExtColorCombo.do' />"
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
                url:"<c:url value='/sal/stm/corporateAvailability/selectIntColorCombo.do' />"
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
            //기능개발중입니다.
            //dms.notification.warning("<spring:message code = 'sal.info.functionDeveloping'/>");

            if($("#sCarlineCd").data("kendoExtDropDownList").value() == "" ){
                dms.notification.info("<spring:message code='global.lbl.carLine' var='globalLblCarLine' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblCarLine}' />");
                return false;
            }

            // 모델
            if($("#sModelCd").data("kendoExtDropDownList").value() == "" ){
                dms.notification.info("<spring:message code='global.lbl.model' var='globalLblModel' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblModel}' />");
                return false;
            }

            // ocn
            if($("#sOcnCd").data("kendoExtDropDownList").value() == "" ){
                dms.notification.info("<spring:message code='global.lbl.ocn' var='globalLblOcn' /><spring:message code='global.info.chkSelectItemMsg' arguments='${globalLblOcn}' />");
                return false;
            }


            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

    //그리드 1번
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0819-204301"
    	,dataSource:{
        	 transport:{
        	     read:{
        	         url:"<c:url value='/sal/stm/corporateAvailability/selectCorporateAvailability.do' />"
        	     }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                          var params = {};
                          var sModelCd = "";
                          var sFscCd = "";
                          
                          if(dms.string.isNotEmpty($("#hiddenFscCode").val())){
                              sModelCd = $("#hiddenFscCode").val();
                          }else{
                              sFscCd = $("#sModelCd").data("kendoExtDropDownList").value();
                          }
                          
                          params["sFscCd"]   = sFscCd;    // fsc코드
                          params["sModelCd"]   = sModelCd;    // 모델
                          
                          params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                          params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();
                          params["sExtColorCd"] = $("#sExtColorCd").data("kendoExtDropDownList").value();
                          params["sIntColorCd"] = $("#sIntColorCd").data("kendoExtDropDownList").value();

                          return kendo.stringify(params);

                      }else if (operation !== "read" && options.models) {
                          return kendo.stringify(options.models);
                      }
                }
             }
         	 ,error:function(e){
         	     if( e.xhr.responseText == "" || e.xhr.responseText == null ){
         	         dms.notification.error(e.xhr.status + ":" + e.xhr.statusText); //
         	     }else{
         	         dms.notification.error(e.xhr.responseText);
         	     }
              }
         	  ,schema:{
                   model:{
                       id:"carlineNm"
                       ,fields:{
                            carlineNm:{type:"string", editable:false} //차종
                           ,modelNm:{type:"string", editable:false} //모델
                           ,ocnNm:{type:"string", editable:false} //OCN
                           ,extColorNm:{type:"string", editable:false} //외장색
                           ,intColorNm:{type:"string", editable:false} //내장색
                           ,lgOrt:{type:"string", editable:false} // 하치장
                           ,kwmeng:{type:"number", editable:false} // 수량
                           ,unit:{type:"string", editable:false} // 단위
                       }
                  }
              }
         }
        ,height:450
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,autoBind:false
        ,selectable :"row"
        ,pageable:false
        ,sortable:false
        ,columns:[
             {field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />"
                 , width:180
                 ,headerAttributes:{style:"text-align:center;"}
             }  // 차종
             ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />"
                 ,width:250
                 ,headerAttributes:{style:"text-align:center;"}
             }  // 모델
             ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocn' />"
                 ,width:250
                 ,headerAttributes:{style:"text-align:center;"}
             }  // OCN
             ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColor' />"
                 ,width:230
                 ,headerAttributes:{style:"text-align:center;"}
             }  // 외장색
             ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />"
                 ,width:230
                 ,headerAttributes:{style:"text-align:center;"}
             }  // 내장색
             ,{field:"lgOrt", title:"<spring:message code='global.lbl.yard' />"
                 ,width:180
                 ,headerAttributes:{style:"text-align:center;"}
                 ,template:"#= dms.string.strNvl(vinmVlocObj[lgOrt]) #"
                 ,attributes:{ "style":"text-align:left"}
             }  // 하치장
             ,{field:"kwmeng", title:"<spring:message code='ser.lbl.qty' />"
                 ,width:100
                 ,headerAttributes:{style:"text-align:center;"}
                 ,attributes:{ "style":"text-align:right"}
             }  // 수량
         ]
    });

}); //document.ready End

</script>