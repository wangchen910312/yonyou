<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- TP차량모니터링 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.distributorAbnormalInventory" /></h1><!-- 운송중위치조회:TP차량모니터링 -->
        <div class="btn_right">
		<dms:access viewId="VIEW-I-13234" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
		</dms:access>
            <!-- <button class="btn_m btn_print">인쇄</button> -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:9%;">
                <col style="width:13%;">
                <col style="width:7%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:14%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th> <!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" type="text" value="" maxlength="5" class="form_input">
                    </td>
                    
                     <th scope="row"><spring:message code='sal.lbl.sdpt' /></th><!-- 사업부 -->
                        <td>
                            <input id="sSdptCd" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.officeNm' /></th><!-- 사무소 -->
                        <td>
                            <input id="sSistOfficeCd" type="text" class="form_comboBox">
                        </td>
                    <th scope="row"><spring:message code='ser.lbl.creDt' /></th> <!-- 발차일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sSrchFrDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sSrchToDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                
            </tbody>
            <tbody>
            <tr>
                <th scope="row"><spring:message code='sal.lbl.grDts' /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sGrDtsFrDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sGrDtsToDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                </tr>
            
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
        <dms:access viewId="VIEW-I-13235" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_s" id="btnExcelExport"><spring:message code='sal.lbl.excelDownload' /></button>   <!-- 엑셀다운로드 -->
        </dms:access>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>

<section id="viewTpVehicleMonitoringPopup" class="pop_wrap">
   <section class="group">
        <div class="header_area">
        </div>
        <div class="table_grid">
            <div id="subGrid"></div>
        </div>
    </section>
</section>
</div>

<!-- script -->
<script>

//현재일자
var toDay = "${toDay}";
var oneDay = "${oneDay}";

//물류회사 Array
var tpCmpDs = [];
<c:forEach var="obj" items="${tpCmpCdDS}">
    tpCmpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var tpVehicleMonitoringPopupWin;

var subParam = {};

$(document).ready(function() {
	//사업부
	var sdptList = [];
	<c:forEach var="obj" items="${sdptList}">
	    sdptList.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
	</c:forEach>

	var distCdObj = {};
	<c:forEach var="obj" items="${distCdDS}">
	    distCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
	</c:forEach>
	
    // 본문 팝업 설정
    $("#viewTpVehicleMonitoringPopup").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='global.title.tpVehicleMonitoring' />"      //재고실사
        ,width:"600px"
        ,height:"150px"
    }).data("kendoWindow");

     //조회조건 - 물류회사
    $("#sTpCmpCd").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:tpCmpDs
        ,optionLabel:" "
    });


    // 등록일자 시작일
    $("#sSrchFrDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         
    });

    // 등록일자 종료일
    $("#sSrchToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        
    });
    
    $("#sGrDtsFrDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        
   });sGrDtsFrDt

   // 등록일자 종료일
   $("#sGrDtsToDt").kendoExtMaskedDatePicker({
       format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
       
   });

    // 시작일은 종료일보다 클수가 없다.
    //$("#sSrchFrDt").on('change', fnChkSearchDate);
    //$("#sSrchToDt").on('change', fnChkSearchDate);


    //버튼 - 엑셀업로드
    $("#btnExcelImport").kendoButton({
        click:function(e) {

            tpVehicleMonitoringPopupWin = dms.window.popup({
                title:"<spring:message code='global.title.tpVehicleMonitoring' />"    // TP차량모니터링 업로드
                ,windowId:"tpVehicleMonitoringPopupWin"
                ,content:{
                    url:"<c:url value='/sal/lom/tpVehicleMonitoring/selectTpVehicleMonitoringUploadPopup.do'/>"
                    ,data:{
                        "callbackFunc":function(){
                            $('#grid').data('kendoExtGrid').dataSource.page(1);
                            //$('#grid').data('kendoExtGrid').dataSource.data([]);
                            tpVehicleMonitoringPopupWin.close();
                        }
                    }
                }
            });
        }
    });


    //버튼 - 엑셀다운로드
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"DistributorAbnormalInventoryService"
                ,"templateFile":"DistributorAbnormalInventory.xlsx"
                ,"fileName":"DistributorAbnormalInventory.xlsx"
                ,"sDlrCd":$("#sDlrCd").val()
                ,"sSdptCd":$("#sSdptCd").val()
                ,"sSistOfficeCd":$("#sSistOfficeCd").val()
                ,"sSrchFrDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sSrchFrDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sSrchToDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sSrchToDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sGrDtsFrDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sGrDtsFrDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sGrDtsToDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sGrDtsToDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
            });
        }
    });
    
    //下拉选事件
    $("#sSdptCd").kendoExtDropDownList({
        dataTextField:"sdptNm"
       ,dataValueField:"sdptCd"
       ,dataSource:sdptList
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sSistOfficeCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sSistOfficeCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.sdptCd == ""){
               $("#sSistOfficeCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sSistOfficeCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           $.ajax({
               url : "<c:url value='/sal/cmm/selectDealerOffice.do'/>",
               data : JSON.stringify({"sSdptCd":dataItem.sdptCd}),
               type : "POST",
               dataType : "json",
               contentType : "application/json",
               async : false,
               error : function(jqXHR,status,error) {

               },
               success : function(data) {
                   var responseJson = JSON.parse(JSON.stringify(data));
                   $("#sSistOfficeCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
                   $("#sSistOfficeCd").data("kendoExtDropDownList").enable(true);
               }
           });
        }
    });
    
 // 사무소
    $("#sSistOfficeCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
       ,dataValueField:"distOfficeCd"
       //,dataSource:officeList
       ,select:function(e){
           var dataItem = this.dataItem(e.item);

       }
       ,optionLabel:" "   // 전체
       ,enable:false
    });

/*     // 상세정보  关联的是在途车信息查询 的详情页面。没有用
    $("#btnViewDetail").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                fn_gridDBclick(selectedItem);
                viewTpVehicleMonitoringPopup();

            } else {

                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='sal.btn.policySearch' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    }) */


     //버튼 - 조회
     $("#btnSearch").kendoButton({
        click:function(e){
/*             if( !($("#sContractStartDt").val() == '' && $("#sContractEndDt").val() == '') ){
                if($("#sContractStartDt").val() == '' || $("#sContractEndDt").val() == ''){
                    //적용일을 모두 입력해 주세요
                    dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                    return false;
                }
            }
*/
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

     // 그리드 더블클릭.
     $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
         var grid = $("#grid").data("kendoExtGrid");
         var selectedItem = grid.dataItem(grid.select());
         fn_gridDBclick(selectedItem);
         viewTpVehicleMonitoringPopup();
     });

     fn_gridDBclick = function(selectedItem){
         if( selectedItem != null && selectedItem != 'undefined'){

             subParam["sVinNo"] = selectedItem.vinNo;
             $('#subGrid').data('kendoExtGrid').dataSource.page(1);
         }
     }

    //상세내용 팝업 호출
     function viewTpVehicleMonitoringPopup(){
         var win = $("#viewTpVehicleMonitoringPopup").data("kendoWindow").center().open();
     }

        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-SAL-0926-114103"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/sal/lom/tpVehicleMonitoring/selectDistributorAbnormalInventory.do'/>"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            /*Paging Param Start~!*/
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;
                            /*Paging Param End~!*/

                            /*Screen Param Start~!*/
                            params["sDlrCd"] = $("#sDlrCd").val();          //딜러코드
                            params["sSdptCd"] = $("#sSdptCd").val(); 
                            params["sSistOfficeCd"] = $("#sSistOfficeCd").val(); 
                            params["sSrchFrDt"] = $("#sSrchFrDt").data("kendoExtMaskedDatePicker").value();   //발차일자FROM
                            params["sSrchToDt"] = $("#sSrchToDt").data("kendoExtMaskedDatePicker").value(); 
                            params["sGrDtsFrDt"] = $("#sGrDtsFrDt").data("kendoExtMaskedDatePicker").value();
                            params["sGrDtsToDt"] = $("#sGrDtsToDt").data("kendoExtMaskedDatePicker").value();//발차일자TO
                            /*Screen Param End~!*/

                            return kendo.stringify(params);
                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,requestEnd:function(e) {
                    if (e.type == "read") {
                        //조회가 완료 되였습니다.
                        //dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                    }
                }
                ,schema:{
                    model:{
                        id:"vinNo"
                        ,fields:{
                        	divCd :{type:"string"}
                            ,distCd :{type:"string"}
                            , vinNo          :{type:"string"}
                            ,carlineCd :{type:"string"}
                            ,carlineNm:{type:"string"}
                            ,fscCd:{type:"string"}
                            ,fscNm:{type:"string"}
                            ,ocnCd:{type:"string"}
                            ,ocnNm:{type:"string"}
                            ,extColorCd:{type:"string"}
                            ,dlrCd:{type:"string"}
                            ,distOfficeNm:{type:"string"}
                            ,manufactYyMmDt:{type:"string"}
                            ,ordDlrYyMmDt:{type:"string"}
                        }
                    }
                }
            }
            ,pageable:{
                refresh:true
                ,pageSize:50
                ,pageSizes:[ "50", "100", "200", "300"]
                ,buttonCount:5
                ,input:false
                ,numeric:true
                ,info:true
                ,messages:{
                    itemsPerPage:""
                    ,display:"{0}-{1} of {2}"
                    ,empty:""
                }
            }
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,height:450
            ,editable:false
            ,autoBind:false
            ,selectable:"row"
            ,columns:[
            	{field:"divCd",          title:"<spring:message code='global.lbl.division' />",       width:150, attributes:{"class":"al"}} //VIN
            	,{field:"distCd",          title:"<spring:message code='sal.lbl.officeNm' />",       width:150, attributes:{"class":"al"}} //VIN
                ,{field:"dlrCd",          title:"<spring:message code='global.lbl.dlrCd' />",width:80, attributes:{"class":"ac"}} //딜러코드
                ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:70,  attributes:{"class":"ac"}}    // 차종
                ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",    width:80, attributes:{"class":"al"}}    // 차종
                ,{field:"fscCd",         title:"<spring:message code='global.lbl.model' />",        width:120, attributes:{"class":"ac"}, hidden:true}    // 모델
                ,{field:"fscNm",         title:"<spring:message code='global.lbl.model' />",      width:170, attributes:{"class":"al"}}    // 모델
                ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",          width:90, attributes:{"class":"ac"}}    // OCN
                ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",        width:170, attributes:{"class":"al"}}    // OCN
                ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80, attributes:{"class":"ac"}}   // 외장색코드
                ,{field:"vinNo",          title:"<spring:message code='global.lbl.vinNum' />",       width:150, attributes:{"class":"al"}} //VIN 
                ,{field:"manufactYyMmDt",    title:"<spring:message code='sal.lbl.grDts' />",        width:90, attributes:{"class":"al"}} 
                ,{field:"ordDlrYyMmDt",    title:"<spring:message code='ser.lbl.creDt' />",        width:90, attributes:{"class":"al"}} 
            ]
        });

/*         $("#subGrid").kendoExtGrid({
            gridId:"G-SAL-0814-154001"
            ,dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/sal/lom/tpVehicleMonitoring/selectTpVehicleMonitoringConditionPopup.do'/>"
                 }
                ,parameterMap:function(options, operation) {
                     if (operation == "read") {
                         return kendo.stringify(subParam);
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
                     id:"uploadTimestamp"
                    ,fields:{
                         uploadTimestamp :{type:"string"}
                        ,uploadDt:{type:"string"}         //업로드일자
                        ,uploadHm:{type:"string"}        //업로드시간
                        ,trsfLocCd:{type:"string"}        //운송중위치
                        ,trsfStatCd:{type:"string"}        //상태
                        ,preAlrtNtceCont:{type:"string"}    //조기경보통지
                     }
                 }
             }
           }
            ,dataBound:function(e) {
            }
           ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
           ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
           ,appendEmptyColumn:false          //빈컬럼 적용. default:false
           ,enableTooltip:false               //Tooltip 적용, default:false
           ,autoBind:false
           ,scrollable:true
           ,editable:false
           ,pageable:false
           ,filterable:false
           ,columns:[
                 {field:"uploadDt"   ,title:"<spring:message code = 'sal.lbl.uploadDt'/>"  ,width:120 ,attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateTimeFormat' />}"}   //업로드일자
                ,{field:"uploadHm"    ,title:"<spring:message code = 'sal.lbl.uploadHm'/>"        ,width:100  ,attributes:{"class":"al"}, hidden:true} //업로드시간
                ,{field:"trsfLocCd",title:"<spring:message code = 'global.lbl.trsfPosition'/>"              ,width:100  ,attributes:{"class":"al"}}  //운송중위치
                ,{field:"trsfStatCd",     title:"<spring:message code='ser.lbl.statNm' />",      width:80, attributes:{"class":"al"}} //상태
                ,{field:"preAlrtNtceCont"     ,title:"<spring:message code = 'global.lbl.preAltNoti'/>"   ,width:160  ,attributes:{"class":"al"}}  //조기경보통지
            ]
        }); */
});

</script>