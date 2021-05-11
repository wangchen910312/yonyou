<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- TP차량모니터링 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.tpVehicleMonitoring" /></h1><!-- 운송중위치조회:TP차량모니터링 -->
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12378" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m" id="btnViewDetail" ><spring:message code='sal.btn.policySearch' /><!-- 상세 --></button>
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
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th> <!-- VIN -->
                    <td>
                        <!--
                        <div class="form_float">
                            <div class="form_left" style="width:65%">
                                <input id="sVinNo1" type="text" value="" maxlength="11" class="form_input">
                            </div>
                            <div class="form_right" style="width:35%">
                                <input id="sVinNo2" type="text" value="" maxlength="6" class="form_input">
                            </div>
                        </div>
                         -->
                         <input id="sVinNo" type="text" maxlength="17" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.logisticsCmpn' /></th> <!-- 운송회사 -->
                    <td>
                        <input id="sTpCmpCd" type="text" value="" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.realDlDts' /></th> <!-- 발차일자 -->
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
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12377" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_s" id="btnExcelImport"><spring:message code='sal.lbl.excellUpload' /></button>   <!-- 엑셀업로드 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12376" hasPermission="${dms:getPermissionMask('READ')}">
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
    <!-- R19071700884 张伟丽反馈 ：dcs在途车信息管理画面，已经设置了不适用的，还在下拉框显示   贾明 2019-7-17 start-->
    if("Y"==="${obj.useYn}"){
      tpCmpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    <!-- R19071700884 张伟丽反馈 ：dcs在途车信息管理画面，已经设置了不适用的，还在下拉框显示   贾明 2019-7-17 start-->
    //tpCmpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    
</c:forEach>

var tpVehicleMonitoringPopupWin;

var subParam = {};

$(document).ready(function() {

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
         ,value:oneDay
    });

    // 등록일자 종료일
    $("#sSrchToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
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
                "beanName":"tpVehicleMonitoringService"
                ,"templateFile":"TpVehicleMonitoring_Tpl.xlsx"
                ,"fileName":"ExcelDown.xlsx"
                ,"sDlrCd":$("#sDlrCd").val()
                ,"sVinNo":$("#sVinNo").val()
                ,"sTpCmpCd":$("#sTpCmpCd").val()
                ,"sSrchFrDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sSrchFrDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
                ,"sSrchToDt":dms.string.strNvl(kendo.toString(kendo.parseDate($("#sSrchToDt").data('kendoExtMaskedDatePicker').value()),"<dms:configValue code='dateFormat' />"))
            });
        }
    });

    // 상세정보
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
    })


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
            gridId:"G-SAL-0926-114102"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/sal/lom/tpVehicleMonitoring/selectTpVehicleMonitoringCondition.do'/>"
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
                            params["sVinNo1"] = $("#sVinNo1").val();        //VIN_NO1
                            params["sVinNo2"] = $("#sVinNo2").val();        //VIN_NO2
                            params["sVinNo"] = $("#sVinNo").val();        //VIN_NO2
                            params["sTpCmpCd"] = $("#sTpCmpCd").val();      //물류회사코드
                            params["sSrchFrDt"] = $("#sSrchFrDt").data("kendoExtMaskedDatePicker").value();   //발차일자FROM
                            params["sSrchToDt"] = $("#sSrchToDt").data("kendoExtMaskedDatePicker").value();   //발차일자TO
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
                             vinNo          :{type:"string"}
                            ,carlineCd :{type:"string"}
                            ,carlineNm:{type:"string"}
                            ,fscCd:{type:"string"}
                            ,fscNm:{type:"string"}
                            ,ocnCd:{type:"string"}
                            ,ocnNm:{type:"string"}
                            ,extColorCd:{type:"string"}
                            ,extColorNm:{type:"string"}
                            ,intColorCd:{type:"string"}
                            ,intColorNm:{type:"string"}
                            ,dstbCmpNm:{type:"string"}
                            ,trsfCarNo:{type:"string"}
                            ,carRegNo:{type:"string"}
                            ,pltGiDt:{type:"string"}
                            ,dstbCmpDlDt:{type:"date"}
                            ,trsfLocCd:{type:"string"}
                            ,trsfStatCd:{type:"string"}
                            ,preAlrtNtceCont:{type:"string"}
                            ,driverNm:{type:"string"}
                            ,driverTelNo:{type:"string"}
                            ,dlrCd:{type:"string"}
                            ,dlrNm:{type:"string"}
                            ,distOfficeNm:{type:"string"}
                            ,cstlNm:{type:"string"}
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
                 {field:"vinNo",          title:"<spring:message code='global.lbl.vinNum' />",       width:150, attributes:{"class":"al"}} //VIN

                ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:70,  attributes:{"class":"ac"}}    // 차종
                ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",    width:80, attributes:{"class":"al"}}    // 차종
                ,{field:"fscCd",         title:"<spring:message code='global.lbl.model' />",        width:120, attributes:{"class":"ac"}, hidden:true}    // 모델
                ,{field:"fscNm",         title:"<spring:message code='global.lbl.model' />",      width:170, attributes:{"class":"al"}}    // 모델
                ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",          width:90, attributes:{"class":"ac"}}    // OCN
                ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",        width:170, attributes:{"class":"al"}}    // OCN
                ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80, attributes:{"class":"ac"}}   // 외장색코드
                ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",   width:100, attributes:{"class":"al"}}    // 외장색명
                ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColorCd' />",     width:80, attributes:{"class":"ac"}}    // 내장색
                ,{field:"intColorNm",    title:"<spring:message code='global.lbl.intColorNm' />",   width:140, attributes:{"class":"al"}, hidden:true}    // 내장색명
                ,{field:"dlrCd",          title:"<spring:message code='global.lbl.dlrCd' />",width:80, attributes:{"class":"ac"}} //딜러코드
                ,{field:"dlrNm",          title:"<spring:message code='global.lbl.dlrNm' />",width:200, attributes:{"class":"al"}} //딜러명
                ,{field:"distOfficeNm",   title:"<spring:message code='sal.lbl.officeNm' />",width:80, attributes:{"class":"al"}} //사무소
                ,{field:"cstlNm",         title:"<spring:message code='global.lbl.sung' />",width:80, attributes:{"class":"al"}}  //성

                ,{field:"dstbCmpNm",      title:"<spring:message code='global.lbl.logisticsCmpn' />",width:120, attributes:{"class":"al"}} //물류회사
                ,{field:"trsfCarNo",      title:"<spring:message code='global.lbl.tpCarNo' />",      width:120, attributes:{"class":"al"}} //트럭번호
                ,{field:"carRegNo",       title:"<spring:message code='global.lbl.licensePlt' />",   width:90, attributes:{"class":"al"}} //번호판
                ,{field:"pltGiDt",        title:"<spring:message code='global.lbl.realDlDts' />",    width:130,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"}                                                                //발차일자
                ,{field:"dstbCmpDlDt",      title:"<spring:message code='sal.lbl.expcArriveDt' />",  width:130,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateTimeFormat' />}"}                                                                //예상도착일
                ,{field:"trsfLocCd",      title:"<spring:message code='sal.lbl.trsfLoc' />",         width:90, attributes:{"class":"al"}} //운송위치
                ,{field:"trsfStatCd",     title:"<spring:message code='global.lbl.statNm' />",       width:90, attributes:{"class":"ac"}} //상태
                ,{field:"preAlrtNtceCont",title:"<spring:message code='global.lbl.preAltNoti' />",   width:90, attributes:{"class":"al"}} //조기경보통지
                ,{field:"driverNm",       title:"<spring:message code='global.lbl.driver' />",       width:90, attributes:{"class":"al"}} //운전기사
                ,{field:"driverTelNo",    title:"<spring:message code='sal.lbl.driverTel' />",        width:90, attributes:{"class":"al"}} //전화번호
            ]
        });

        $("#subGrid").kendoExtGrid({
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
        });
});

</script>