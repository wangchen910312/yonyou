<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>
<!-- *************************************************************************
**************************파일업로드1********************************************
***************************************************************************-->

<!-- 재고실사 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.stockRealSearch" /></h1><!-- 재고실사 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-10933" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnCreateInfo"><spring:message code='sal.btn.stockCreate' /></button> <!-- 재고생성 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10932" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /></button>        <!-- 상세 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10931" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.stockDt" /></th> <!-- 재고일자 -->
                    <td>
                        <input id="sStockDt" class="form_datepicker">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.stockMonth" /></th> <!-- 재고월령 -->
                    <td>
                        <input id="sAgingCntRange" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.vinNo" /></th> <!-- 차대번호 -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.confirmYn" /></th> <!-- 확인여부 -->
                    <td>
                        <input id="sConfirmYn" type="text" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="mainGrid" class="resizable_grid"></div>
    </div>
</section>
</div>

<section id="callStockDueWindow" class="pop_wrap">
    <section class="group">
        <div class="header_area">
            <div class="btn_left">
                <button id="btnAllChange" class="btn_m"><spring:message code='sal.btn.stockStateAllChange' /></button>       <!-- 일괄변경 -->
            </div>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-10930" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnPrint" type="button" class="btn_m"><spring:message code='sal.btn.print' /></button>         <!-- 출력 -->
                </dms:access>
                <dms:access viewId="VIEW-D-10929" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSave" type="button" class="btn_m btn_save"><spring:message code='global.btn.save' /></button>    <!-- 저장 -->
                </dms:access>
            </div>
        </div>
   </section>
   <section class="group">
        <div class="header_area">
        </div>
        <div class="table_grid">
            <div id="subGrid"></div>
        </div>
    </section>
</section>

<!-- #스크립트 영역# -->
<script type="text/javascript">
<!--
//시스템 날짜 정보 가져오기.
var vDateTimeFormat = "${_dateTimeFormat}";
//yyyy-MM-dd HH:mm:ss
var vDtyyyyMMddHHmmss = vDateTimeFormat;
//yyyy-MM-dd HH:mm
var vDtyyyyMMddHHmm = vDateTimeFormat.substring(0,16);
// yyyy-MM-dd
//var vDtyyyyMMdd = vDateTimeFormat.substring(0,10);
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var userId = "${userId}";
var toMonth = "${toMonth}";
var toDay = "${toDay}";         // 현재일자

//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//창고
var storageDSList = [];
var strgeCdObj = {};
<c:forEach var="obj" items="${storageList}">
    <c:if test="${obj.strgeTp eq '02'}">
        storageDSList.push({cmmCdNm:"${obj.strgeNm}", cmmCd:"${obj.strgeCd}"});
    </c:if>
    strgeCdObj["${obj.strgeCd}"] = "${obj.strgeNm}";
</c:forEach>

// 위치
var locDSList = [];
var locCdObj = {};
<c:forEach var="obj" items="${locDSList}">
    locDSList.push({cmmCdNm:"${obj.locNm}", cmmCd:"${obj.locCd}"});
    locCdObj["${obj.locCd}"] = "${obj.locNm}";
</c:forEach>

// 차량
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//재고월령범위
var agingCntList = [];
<c:forEach var="obj" items="${agingCntDSList}">
    agingCntList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var subParam = {};
var popupWindow;
$(document).ready(function() {

    // 본문 팝업 설정
    $("#callStockDueWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.btn.create' />"      //재고실사
        ,width:"950px"
        ,height:"500px"
    }).data("kendoWindow");


    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#mainGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                fn_mainGridDBclick(selectedItem);
                viewDetailPopup();
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });


    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            subParam = {};
            subParam["sStockDt"] = $("#sStockDt").val();
            subParam["sAgingCntRange"] = $("#sAgingCntRange").data("kendoExtDropDownList").value();
            subParam["sVinNo"] = $("#sVinNo").val();
            subParam["sConfirmYn"] = $("#sConfirmYn").val();

            $('#mainGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    $("#btnCreateInfo").kendoButton({ // 실사생성
        enable:true,
        click:function(e){

            $.ajax({
                url:"<c:url value='/sal/inv/stockDue/CreateStockDueInfo.do' />"
                ,data:JSON.stringify({})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    if(jqXHR.responseJSON.errors.length > 0){
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }else{
                        dms.notification.error(error);
                    }
                }
                ,success:function(jqXHR, textStatus) {
                    var grid = $("#mainGrid").data("kendoExtGrid");
                    grid.dataSource.read();

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });

        }
    });

    //버튼 - 엑셀다운로드
    //$("#btnPrint").kendoButton({
    //    click:function(e) {
    //        dms.ajax.excelExport({
    //            "beanName":"stockDueService"
    //            ,"templateFile":"MultiStockDueList.xlsx"
    //            ,"fileName":"MultiStockDueList.xlsx"
    //            ,"eStockDt":$("#sStockDt").val()
    //            ,"sAgingCntRange":$("#sAgingCntRange").data("kendoExtDropDownList").value()
    //            ,"sVinNo":$("#sVinNo").val()
    //            ,"sConfirmYn":$("#sConfirmYn").val()
    //        });
    //    }
    //});

    $("#btnAllChange").kendoButton({ // 일괄변경
        click:function(e){
            var grid = $("#mainGrid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());


            var subGrid = $("#subGrid").data("kendoExtGrid")

            if ( dms.string.isNotEmpty(selectedItem)
                    && subGrid.select().length > 0){

                popupWindow = dms.window.popup({
                    windowId:"stockDueAllChangePopupWin"
                    ,title:"<spring:message code='sal.title.stockStateAllChange' />"   // 일괄변경
                    ,width:350
                    ,height:200
                    , modal:true
                    ,content:{
                        url:"<c:url value='/sal/inv/stockDue/selectStockAllChangePopup.do'/>"
                        ,data:{
                            "type":null
                            ,"autoBind":false
                            ,"callbackFunc":function(data){

                                if(data.state == "01"){
                                    /*
                                    // 일괄변경.
                                    $.ajax({
                                        url:"<c:url value='/sal/inv/stockDue/saveAllStockDue.do' />"
                                        ,data:JSON.stringify({"stockDt":selectedItem.stockDt,"confirmYn":data.sConfirmYn})
                                        ,type:'POST'
                                        ,dataType:'json'
                                        ,contentType:'application/json'
                                        ,error:function(jqXHR, status, error) {
                                            dms.notification.error(jqXHR.responseJSON.errors);
                                            popupWindow.close();
                                        }
                                        ,success:function(jqXHR, textStatus) {
                                            grid.dataSource._destroyed = [];
                                            grid.dataSource.page(1);

                                            //정상적으로 반영 되었습니다.
                                            dms.notification.success("<spring:message code='global.info.success'/>");
                                            $("#callStockDueWindow").data("kendoWindow").close();
                                            popupWindow.close();
                                        }
                                    });
                                    */

                                    var rows = subGrid.select();
                                    var saveList = [];
                                    rows.each(function(index, row) {
                                        dataItem = subGrid.dataItem(row);
                                        dataItem["confirmYn"] = data.sConfirmYn;
                                        saveList.push(dataItem);
                                    });

                                    // 선택변경
                                    $.ajax({
                                        url:"<c:url value='/sal/inv/stockDue/saveSelectStockDue.do' />"
                                        ,data:JSON.stringify({"insertList":saveList})
                                        ,type:'POST'
                                        ,dataType:'json'
                                        ,contentType:'application/json'
                                        ,error:function(jqXHR, status, error) {
                                            dms.notification.error(jqXHR.responseJSON.errors);
                                            popupWindow.close();
                                        }
                                        ,success:function(jqXHR, textStatus) {
                                            grid.dataSource._destroyed = [];
                                            grid.dataSource.page(1);

                                            //정상적으로 반영 되었습니다.
                                            dms.notification.success("<spring:message code='global.info.success'/>");
                                            $("#callStockDueWindow").data("kendoWindow").close();
                                            popupWindow.close();
                                        }
                                    });

                                }else{
                                    popupWindow.close();
                                }

                            }
                        }
                    }
                });

            }else{
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

        }
    });

    $("#btnPrint").kendoButton({
        click:function(e){
            var stockDueUrl = "<c:url value='/ReportServer?reportlet=sale/selectSalesTotalStockReport.cpt' />";
            var param = "";
            param += "&sDlrCd="+dlrCd;
            param += "&sAgingCntRange="+$("#sAgingCntRange").data("kendoExtDropDownList").value();
            param += "&sVinNo="+$("#sVinNo").val();
            param += "&sConfirmYn="+$("#sConfirmYn").val();
            param += "&sStockDt="+kendo.toString(subParam.sStockDt, "<dms:configValue code='dateFormat' />");
            //var param = "&sStockDt="+$("#sStockDt").val()+"&sAgingCntRange="+$("#sAgingCntRange").data("kendoExtDropDownList").value()+"&sVinNo="+$("#sVinNo").val()+"&sConfirmYn="+$("#sConfirmYn").val()+"&sStockDt="+subParam.sStockDt;

            var newWindow=open(stockDueUrl+param,"",'top=0,left=0,width=1024,height=768,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
        }
    });

    // 저장
    $("#btnSave").kendoButton({
        enable:true,
        click:function(e){

            var grid = $("#subGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/sal/inv/stockDue/multiStockDue.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {

                        if(jqXHR.responseJSON.errors.length > 0){
                            dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                        }else{
                            dms.notification.error(error);
                        }

                    }
                    ,success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        $("#mainGrid").data("kendoExtGrid").dataSource.page(1);

                        $("#callStockDueWindow").data("kendoWindow").close();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    // 재고일자
    $("#sStockDt").kendoExtMaskedDatePicker({
        value:toDay
        ,format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 재고월령 범위
    $("#sAgingCntRange").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:agingCntList
       ,optionLabel:" "
    });

    // Y /N
    $("#sConfirmYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ynList
       ,optionLabel:" "
    });

    //헤더 그리드
	$("#mainGrid").kendoExtGrid({
	    gridId:"G-SAL-0805-180101"
       	,dataSource:{
       	   transport:{
             read:{
                 url:"<c:url value='/sal/inv/stockDue/selectStockDueSearch.do' />"
             }
            ,parameterMap:function(options, operation) {
                 if (operation === "read") {

                     var params = {};
                     params["recordCountPerPage"] = options.pageSize;
                     params["pageIndex"] = options.page;
                     params["firstIndex"] = options.skip;
                     params["lastIndex"] = options.skip + options.take;
                     params["sort"] = options.sort;

                     params["sStockDt"] = $("#sStockDt").data("kendoExtMaskedDatePicker").value();
                     params["sAgingCntRange"] = $("#sAgingCntRange").data("kendoExtDropDownList").value();
                     params["sVinNo"] = $("#sVinNo").val();
                     params["sConfirmYn"] = $("#sConfirmYn").val();

                     return kendo.stringify(params);
                 }else if (operation !== "read" && options.models) {
                     return kendo.stringify(options.models);
                 }
             }
         }
	     ,batch:false
	     ,schema:{
             model:{
                  id:"dlrCd"
                  ,fields:{
                      rnum    :{type:"number"}
                     ,dlrCd   :{type:"string"}
                     ,stockDt :{type:"date"}
                     ,stockDtFormat:{type:"date"}
                     ,carTot :{type:"number"}
                     ,conY   :{type:"number"}
                     ,conN   :{type:"number"}
                 }
             }
             ,parse:function(d) {
                 if(d.data){
                     $.each(d.data, function(idx, elem) {
                         elem.stockDtFormat = kendo.parseDate(elem.stockDt, "<dms:configValue code='dateFormat' />");
                     });
                 }
                 return d;
             }
         }
       }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,multiSelectLocked:false          //멀티선택 컬럼 틀고정 default:false
       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
	   ,height:450
       ,autoBind:false
       ,editable:false
	   ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                   ,attributes:{"class":"ac"}
               }
               ,{field:"dlrCd", hidden:true}
               ,{field:"stockDtFormat", title:"<spring:message code='sal.lbl.stockDt' />", width:200
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#= kendo.toString(data.stockDt, '<dms:configValue code='dateFormat' />') #"
               }    // 재고일자
               ,{field:"carTot", title:"<spring:message code='sal.lbl.carTot' />", width:120, attributes:{"class":"ac"}, format:"{0:n0}"
               } // 총수
               ,{field:"conY", title:"<spring:message code='global.lbl.complete' />", width:120, attributes:{"class":"ac"}, format:"{0:n0}"
               } // 완료
               ,{field:"conN", title:"<spring:message code='global.lbl.incomplete' />", width:120, attributes:{"class":"ac"}, format:"{0:n0}"
               } // 미완료
          ]
	});

    // 그리드 더블클릭.
   $("#mainGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#mainGrid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());
       fn_mainGridDBclick(selectedItem);
       viewDetailPopup();
   });

   fn_mainGridDBclick = function(selectedItem){
       if( selectedItem != null && selectedItem != 'undefined'){
           subParam["sStockDt"] = selectedItem.stockDt;
           $('#subGrid').data('kendoExtGrid').dataSource.page(1);
       }
   }

   // 상세내역 그리드
   $("#subGrid").kendoExtGrid({
       dataSource:{
           transport:{
               read:{
                   url:"<c:url value='/sal/inv/stockDue/selectStockDueDetailSearch.do' />"
               },
               parameterMap:function(options, operation) {
                   if (operation === "read") {

                       subParam["recordCountPerPage"] = options.pageSize;
                       subParam["pageIndex"] = options.page;
                       subParam["firstIndex"] = options.skip;
                       subParam["lastIndex"] = options.skip + options.take;
                       subParam["sort"] = options.sort;

                       return kendo.stringify(subParam);

                   }else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,batch:false
           ,requestEnd:function(e){
               if(e.type =="read" && e.response.total > 0){
                   //console.log(e.sender._data);
               }
           }
           ,schema:{
               model:{
                   id:"carId",
                   fields:{
                         dlrCd     :{type:"string", editable:false}
                        ,carId     :{type:"string", editable:false}
                        ,stockDt   :{type:"date", editable:false}
                        ,confirmYn :{type:"string"}
                        ,vinNo     :{type:"string", editable:false}
                        ,carlineCd :{type:"string", editable:false}
                        ,carlineNm :{type:"string", editable:false}
                        ,modelCd   :{type:"string", editable:false}
                        ,modelNm   :{type:"string", editable:false}
                        ,ocnCd     :{type:"string", editable:false}
                        ,ocnNm     :{type:"string", editable:false}
                        ,extColorCd:{type:"string", editable:false}
                        ,extColorNm:{type:"string", editable:false}
                        ,intColorCd:{type:"string", editable:false}
                        ,intColorNm:{type:"string", editable:false}
                        ,carStatCd :{type:"string", editable:false}
                        ,carStatNm :{type:"string", editable:false}
                        ,strgeCd   :{type:"string", editable:false}
                        ,strgeNm   :{type:"string", editable:false}
                        ,locCd     :{type:"string", editable:false}
                        ,locNm     :{type:"string", editable:false}
                        ,manufactYyMmDt :{type:"string", editable:false}
                        ,signoffDt      :{type:"date", editable:false}
                        ,grDt           :{type:"date", editable:false}
                        ,pltGiDt        :{type:"date", editable:false}
                        ,stockAgingCnt  :{type:"number", editable:false}
                        ,photoFilePathNm:{type:"string"}
                        ,fileDocNo      :{type:"string"}
                        ,fileNo         :{type:"string"}
                        ,fileYn         :{type:"string"}
                        ,remark        :{type:"string"}

                   }
               }
           }
       }
       ,multiSelectWithCheckbox:true
       ,height:415
       ,pageable :{
           refresh :true
           ,pageSize :40
           ,pageSizes :[ "40", "80", "100", "200", "500"]
       }
       ,resizable :true
       ,selectable:"multiple, row"
       ,autoBind:false
       ,filterable:false
       ,edit:function(e){
           var eles = e.container.find("input");
           var fieldName;
           if(eles.length > 1){
               fieldName = eles[eles.length-1].getAttribute("name");
           }else{
               fieldName = eles.attr("name");
           }
           var input = e.container.find(".k-input");

           if(fieldName == "fileYn"){
               this.closeCell();
           }
           if(fieldName == "photoFilePathNm"){
               this.closeCell();
           }

       }
       ,columns:[
            {field:"dlrCd", hidden:true}       // 딜러코드
           ,{field:"carId", hidden:true}       // 계약번호
           ,{field:"stockDt", hidden:true}     //
           ,{
               field:"confirmYn", title:"<spring:message code='global.lbl.confirmYn' />", width:100, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
               ,template:"#= dms.string.strNvl(ynObj[confirmYn]) #"
               ,editor:function (container, options){
                   $('<input required name="confirmYn" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind:false
                       ,dataTextField:"cmmCdNm"
                       ,dataValueField:"cmmCd"
                       ,dataSource:ynList
                       ,valuePrimitive:true
                       ,template:"#= dms.string.strNvl(ynObj[cmmCd]) #"
                   });
                   $('<span class="k-invalid-msg" data-for="confirmYn"></span>').appendTo(container);
               }
           }    // 확인여부
           ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:160, attributes:{"class":"ac"}}
           ,{field:"carlineCd",     title:"<spring:message code='global.lbl.carlineCd' />",      width:80,  attributes:{"class":"ac"}}//차종code
           ,{field:"carlineNm",     title:"<spring:message code='global.lbl.carlineNm' />",      width:120, attributes:{"class":"ac"}}//차종description
           ,{field:"modelNm",       title:"<spring:message code='global.lbl.model' />",          width:120, attributes:{"class":"ac"}} //모델description
           ,{field:"ocnCd",         title:"<spring:message code='global.lbl.ocnCode' />",        width:80,  attributes:{"class":"ac"}} //OCNcode
           ,{field:"ocnNm",         title:"<spring:message code='global.lbl.ocnNm' />",          width:140, attributes:{"class":"ac"}} //OCNdescription
           ,{field:"extColorCd",    title:"<spring:message code='global.lbl.extColorCd' />",     width:80,  attributes:{"class":"ac"}} //외장색code
           ,{field:"extColorNm",    title:"<spring:message code='global.lbl.extColorNm' />",     width:80,  attributes:{"class":"ac"}} //외장색description
           ,{field:"intColorCd",    title:"<spring:message code='global.lbl.intColorCd' />",     width:80,  attributes:{"class":"ac"}} //내장색code
           ,{field:"strgeNm", title:"<spring:message code='sal.lbl.strgeCd' />", width:150, attributes:{"class":"al"}}    //창고
           ,{field:"locNm", title:"<spring:message code='sal.lbl.location' />", width:150, attributes:{"class":"al"}, hidden:true}        //위치
           ,{field:"manufactYyMmDt", title:"<spring:message code='sal.lbl.manufactYyMmDt' />", width:150, attributes:{"class":"ac"}, hidden:true}    //제작년월
           ,{field:"signoffDt", title:"<spring:message code='sal.lbl.regDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 생산일자
           ,{field:"pltGiDt", title:"<spring:message code='sal.lbl.pltGiDt' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 출고일자
           ,{field:"grDt", title:"<spring:message code='sal.lbl.grDts' />", attributes:{"class":"ac"}, width:100, format:"{0:"+vDtyyyyMMdd+"}" }   // 입고일자
           ,{field:"stockAgingCnt", title:"<spring:message code='global.lbl.stockMonth' />", width:70, attributes:{"class":"ar"}, format:"{0:n0}"}        //재고월령

           ,{field:"photoFilePathNm", title:"<spring:message code='global.lbl.fileNm' />", width:150, attributes:{"class":"al"}
           , template:"#= fn_file(photoFilePathNm, fileDocNo, fileNo)#"
           }     // 파일명
           ,{field:"fileDocNo", hidden:true}           // 문서번호
           ,{field:"fileNo", hidden:true}              // 파일번호
           ,{field:"fileYn", title:" &nbsp; ", attributes:{"class":"ac" }, width:100
                //,template:'<span class="btn_file" id="fileSelect"><spring:message code="global.btn.upload" /><input type="file" id="uploadFile" onchange="fn_upload(this, \'#=uid#\' )" /></span>'
               ,template:"#= fn_fileButtonTmp(photoFilePathNm, fileDocNo, fileNo, uid) #"
           }
           ,{field:"remark", title:"<spring:message code='global.lbl.remark' />", width:350, attributes:{"class":"al"}}
       ]
   });

});

//상세내용 팝업 호출
function viewDetailPopup(){
    var win = $("#callStockDueWindow").data("kendoWindow").center().open();
}

// 버튼표현
function fn_fileButtonTmp(fileName, docNo, no, uid){
    var buttonInfo = "";

    if(dms.string.strNvl(fileName) == ""){
        buttonInfo = '<span class="btn_file" id="fileSelect"><spring:message code="global.btn.upload" /><input type="file" id="uploadFile" onchange="fn_upload(this, \''+uid+'\' )" /></span>';
    }else{
        buttonInfo = '<dms:access viewId="VIEW-D-10928" hasPermission="${dms:getPermissionMask('READ')}"><button type="button" class="btn_s" id="btnFileReDelete" onclick="fn_fileDelClick(\''+docNo+'\', \''+no+'\', \''+uid+'\')"><spring:message code="global.btn.fileDelete" /></button></dms:access>';
    }
    return buttonInfo;
}

// 파일표현
function fn_file(photoFilePathNm, fileDocNo, fileNo){
    var fileInfo = "";
    if(dms.string.strNvl(photoFilePathNm) == ""){
        fileInfo = "";
    }else{
        fileInfo += "<a href=\"javascript:goFileDown(\'"+ fileDocNo +"\', \'"+ fileNo +"\');\" style='cursor:pointer'>";
        fileInfo += "<span class='k-tool-icon'></span>";
        fileInfo += "<span class='file_name'>"+ photoFilePathNm +"</span>";
        fileInfo += "</a>";
    }
    return fileInfo;
}

//파일 다운
function goFileDown(fileDocNo, fileNo){
    dms.fileManager.download(fileDocNo, fileNo);
}

// 선택한 파일의 uid
var fUid = "";

// 파일 업로드
function fn_upload(obj, uid){
    fUid = uid;

    r.files = [];
    $(".resumable-list").html("");

    var imgPath = obj.value;
    var fileTp = imgPath.substring(imgPath.lastIndexOf('.') + 1).toLowerCase();

    if( fileTp == "gif" || fileTp == "png" || fileTp == "jpg" || fileTp == "jpeg" ){
        if( typeof(FileReader) != "undefined" ){
            var reader = new FileReader();
            //reader.readAsDataURL(obj.files[0]);       // 보여줄때.
        }

        r.appendFilesFromFileList(obj.files);           // 파일 읽기.

    }else{
        dms.notification.info("<spring:message code='global.info.fileTpImgYn'/>"); //이미지 파일만 업로드 가능합니다.(jpg, jpeg, gif, png)
    }
}


// 파일삭제 버튼 클릭
fn_fileDelClick = function(docNo, no, uid){

    if( dms.string.isEmpty(docNo) || dms.string.isEmpty(no) ){
        // 삭제할 파일이 없습니다.
        dms.notification.info("<spring:message code='sal.info.isDelEmptyFile' />");
        return false;
    }
    fileDelete(docNo, no, uid);
}

/**
 * 파일삭제
 * - 파일 추가중 호출시, uid 없음.
 * - 버튼으로 추가시, uid 있음
 */
fileDelete = function(fileDocId, fileNo, uid){
    var deleteList = [];
    deleteList.push({"fileDocNo":fileDocId , "fileNo":fileNo});

    $.ajax({
        url:"<c:url value='/cmm/sci/fileUpload/deleteFiles.do' />"
       ,data:JSON.stringify(deleteList)
       ,type:'POST'
       ,dataType:'json'
       ,contentType:'application/json'
       ,async:false
       ,error:function(jqXHR, status, error) {
           dms.notification.error(error);
       }
       ,success:function(jqXHR, textStatus) {

           if(jqXHR){
               //정상적으로 반영 되었습니다.
               //dms.notification.success("<spring:message code='global.info.success'/>");

               var grid = $("#subGrid").data("kendoExtGrid");
               var dataSourceRow;
               if( typeof(uid) != "undefined" ){
                   dataSourceRow = grid.dataSource.getByUid(uid);
               }else{
                   dataSourceRow = grid.dataSource.getByUid(fUid);
               }

               dataSourceRow.set("photoFilePathNm", '');
               dataSourceRow.set("fileDocNo", '');
               dataSourceRow.set("fileNo", '');
            }
        }
    });
}

//================================
    var r = new Resumable({
        target:"<c:url value='/cmm/sci/fileUpload/selectResumableFileUpload.do'/>"
        ,chunkSize:1 * 1024 * 1024
        ,simultaneousUploads:4
        ,testChunks:true
        ,throttleProgressCallbacks:1
        ,method:"octet"
        ,maxFiles:1
    });
//     r.assignBrowse($('#fileSelect')[0]);

    //파일추가 이벤트
    r.on('fileAdded', function(file) {

        // 파일이 존재할 경우.
        var grid = $("#subGrid").data("kendoExtGrid");
        var dataSourceRow = grid.dataSource.getByUid(fUid);

        if( !dms.string.isEmpty(dataSourceRow.fileDocNo)
                && !dms.string.isEmpty(dataSourceRow.fileNo) ){
            fileDelete(dataSourceRow.fileDocNo, dataSourceRow.fileNo);
        }

        $("#progressWindow").kendoWindow({
            width:"600px"
            ,height:"300px"
            ,title:"<spring:message code='global.lbl.fileSend'/>"     // 파일전송
            ,animation:false
            ,draggable:false
            ,visible:false
            ,resizable:false
            ,modal:true
        }).data("kendoWindow").center().open();


        $('.resumable-progress, .resumable-list').show();
        $('.resumable-progress .progress-resume-link').hide();
        $('.resumable-progress .progress-pause-link').show();

        //파일목록 출력
        $('.resumable-list').append('<li class="resumable-file-'+file.uniqueIdentifier+'"><div class="progress-file-name"><div class="resumable-file-name"></div><div class="progress-file-size"><!--<span class="progress-complete-size">00</span>MB/<span class="progress-whole-size">00</span>MB</div>--></div><div class="file-progress-container"><div class="resumable-file-progress"></div><div class="resumable-file-txt"></div></div>');
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-name').html(file.fileName);

        //업로드 시작
        r.upload();

    });
    r.on('pause', function() {
        $('.resumable-progress .progress-resume-link').show();
        $('.resumable-progress .progress-pause-link').hide();
    });
    r.on('uploadStart', function() {

        var _that = this;

        if (_that.opt["query"] == null) {
             _that.opt["query"] = {};
        }

        var grid = $("#subGrid").data("kendoExtGrid");
        var dataSourceRow = grid.dataSource.getByUid(fUid);

        if (dms.string.isEmpty(dataSourceRow.fileDocNo)) {
            $.ajax({
                url:"<c:url value='/cmm/sci/fileUpload/selectFileDocNo.do' />",
                dataType:"json",
                type:"get",
                async:false,
                cache:false,
                success:function(id) {
                    _that.opt["query"]["resumableSessionId"] = id;
                    //$("#docId").val(id);
                }
            });
        } else {
            _that.opt["query"]["resumableSessionId"] = dataSourceRow.fileDocNo;
        }

        $('.resumable-progress .progress-resume-link').hide();
        $('.resumable-progress .progress-pause-link').show();
    });
    r.on('complete', function() {

        var _that = this;

        $('.resumable-progress .progress-resume-link, .resumable-progress .progress-pause-link').hide();
        $("#progressWindow").data("kendoWindow").close();
        r.files = [];
        $(".resumable-list").html("");
    });
    r.on('fileSuccess', function(file, message) {
        var result = JSON.parse(message);

        if(result.status === "finished") {

            var grid = $("#subGrid").data("kendoExtGrid");
            var dataSourceRow = grid.dataSource.getByUid(fUid);
            dataSourceRow.set("photoFilePathNm", result.fileNm);
            dataSourceRow.set("fileDocNo", result.fileDocNo);
            dataSourceRow.set("fileNo", result.fileNo);

            //$('.resumable-file-'+file.uniqueIdentifier+' .resumable-file-progress').html('(completed)');
        }

    });
    r.on('fileError', function(file, message) {
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html('(file could not be uploaded:' + message + ')');
    });
    r.on('fileProgress', function(file) {
        var fileProgress = 0;

        if (file instanceof ResumableChunk) {
            fileProgress = file.fileObj.progress();
        } else {
            fileProgress = file.progress();
        }

        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-txt').html(Math.min(Math.floor(fileProgress * 100), 100) + '%');
        $('.resumable-file-' + file.uniqueIdentifier + ' .resumable-file-progress').css({width:Math.min(Math.floor(fileProgress * 100), 100) + '%'});
        $('.progress-bar').css({width:Math.min(Math.floor(r.progress() * 100), 100)+ '%'});
    });
//================================

//-->
</script>