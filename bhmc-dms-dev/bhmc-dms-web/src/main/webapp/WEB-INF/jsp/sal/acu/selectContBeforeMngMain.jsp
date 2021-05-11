<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 예약판매관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.lbl.beforeCont' /></h1> <!-- 예약판매관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13084" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnPrint" type="button" class="btn_m btn_print"><spring:message code='global.btn.print' /><!-- 인쇄 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-12964" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnViewDetail" type="button" class="btn_m"><spring:message code='global.btn.detail' /></button>           <!-- 상세 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12963" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12962" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnRefresh" type="button" class="btn_m btn_new" style=""><spring:message code='global.btn.new' /></button>         <!-- 신규 -->
            </dms:access>
            <dms:access viewId="VIEW-D-12961" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnDelete" type="button" class="btn_m"><spring:message code='sal.btn.cancellation' /></button>              <!-- 삭제 -->
            </dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:7%;">
                <col style="width:20%;">
                <col style="width:8%;">
                <col style="width:18%;">
                <col style="width:8%;">
                <col style="width:18%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='sal.lbl.statNm' /></th>  <!-- 상태 -->
                    <td>
                        <input id="sBeforeStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.orderDate' /></th>        <!-- 예약일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartContractDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndContractDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vCustNm" class="form_input" >
                                    <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                    <input id="sCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th> <!-- 판매담당자 -->
                    <td>
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>       <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
                    <td>
                        <input id="sFscCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.ocn' /></th>       <!-- OCN -->
                    <td>
                        <input id="sOcnCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 계약내역 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 계약내역 그리드 종료 -->
</section>
</div>
<!-- //계약관리 -->

<!-- hidden값  -->
<span style="display:none">

    <!-- 저장 후 선택될 계약번호 -->
    <input id="savedBeforeNo" />

    <!-- 판매기회번호 -->
    <input id="saleOpptNo" name="saleOpptNo" />

</span>
</section>
<!-- //계약관리 화면 -->

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
var vDtyyyyMMdd = "${_dateFormat}";
// HH:mm
var vDtHHmm = vDateTimeFormat.substring(11,16);

// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

//판매담당자 여부
var saleEmpYn = "${saleEmpYn}";
//판매담당자 전체조회 권한
var saleAdminYn = "${saleAdminYn}";

// 임시 작업
//if(userId == "admin2"){ saleAdminYn = "Y"; }

var toDay = "${toDay}";         // 현재일자
var oneDay = "${oneDay}";       // 해당월 1일
var sevenDay = "${sevenDay}";   // 현재일의 7일전
var lastDay = "${lastDay}";     // 해당월 마지막일자
var nextMonthDay = "${nextMonthDay}";   // 현재일 기준 한달후
var threeMonthDay = "${threeMonthDay}"; // 현재일 기준 3달전

//차종조회
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>


//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

//상태 SAL208
var statCdList = [];
var statCdArray = {};
<c:forEach var="obj" items="${statCdDS}">
    <c:if test="${obj.cmmCd ne '90' }">
        statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>
    statCdArray["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 고객정보 CRM001
var custTpList = [];
var custTpObj = {};
<c:forEach var="obj" items="${custTpList}">
    custTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    custTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var popupWindow;
var zipCodeSearchPopupWin = null;
var mainPopupWindow;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

    // 계약상태
    $("#sBeforeStatCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(statCdList)
       ,optionLabel:"<spring:message code='sal.lbl.all' />"
    });

    //  시작일
    $("#sStartContractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:threeMonthDay
    });

    // 계약 종료일
    $("#sEndContractDt").kendoExtMaskedDatePicker({
        format :"<dms:configValue code='dateFormat' />"
        ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    //판매담당자
    $("#sSaleEmpNo").kendoExtDropDownList({
        dataTextField :"saleEmpNm"
       ,dataValueField :"saleEmpCd"
       ,dataSource:selectSaleEmpDSList
       ,optionLabel:" "
    });

    if(saleEmpYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").value(userId);
    }else{
        $("#sSaleEmpNo").data("kendoExtDropDownList").value("");
    }
    if(saleAdminYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(true);
    }else{
        $("#sSaleEmpNo").data("kendoExtDropDownList").enable(false);
    }

    /**
     * 차종 콤보박스
     */
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField :"carlineNm"
       ,dataValueField :"carlineCd"
       ,dataSource :carLineCdList
       ,optionLabel:" "
       , filter :"contains"
       ,filtering:function(e){
           var filter = e.filter;
       }
       ,select :function(e){
           $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sFscCd").data("kendoExtDropDownList").enable(true);

           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);   // OCN data
           $("#sOcnCd").data("kendoExtDropDownList").enable(false);       // OCN 닫음

           var dataItem = this.dataItem(e.item);
           if(dataItem.carlineCd == ""){
               $("#sFscCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sFscCd").data("kendoExtDropDownList").enable(false);
               return false;
           }
           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/acu/contBeforeMng/selectFsc.do' />"
               ,data :JSON.stringify({"sCarlineCd":dataItem.carlineCd})
               ,async :false
           });

           if(responseJson == null || responseJson.data == null){
               responseJson.data = null;
           }
           $("#sFscCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });

    /**
     * 차관 콤보박스
     */
    $("#sFscCd").kendoExtDropDownList({
        dataTextField :"fscNm"
       ,dataValueField :"fscCd"
       ,filter :"contains"
       ,select :function(e){
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);

           var dataItem = this.dataItem(e.item);
           if(dataItem.fscCd == ""){
               $("#sOcnCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url :"<c:url value='/sal/acu/contBeforeMng/selectOcn.do' />"
               ,data :JSON.stringify({"sCarlineCd":$("#sCarlineCd").val(), "sFscCd":dataItem.fscCd})
               ,async :false
           });
           if(responseJson == null || responseJson.data == null){
               responseJson.data = null;
           }
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
       ,optionLabel:" "
    });
    $("#sFscCd").data("kendoExtDropDownList").enable(false);

    /**
    * ocn 콤보박스
    */
    $("#sOcnCd").kendoExtDropDownList({
         dataTextField: "ocnNm"
        ,dataValueField:"ocnCd"
        ,filter :"contains"
        ,optionLabel:" "
    });
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);

    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());

            if ( dms.string.isNotEmpty(selectedItem) ){
                if(grid.select().length > 1){
                    //목록을 1건만 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                    return;
                }else{
                    viewDetailPopup(selectedItem);
                }
            } else {
                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.info("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }
        }
    });

    //인쇄
    $("#btnPrint").kendoButton({
        click:function(e){
            var grid = $('#grid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            if(grid.select().length != 1){
                //목록을 1건만 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                return;
            }

            if(dms.string.isNotEmpty(selectedItem) && dms.string.isNotEmpty(selectedItem.beforeNo)) {
                if(selectedItem.beforeStatCd == "20"){
                    //parent._createOrReloadTabMenu("<spring:message code='sal.lbl.beforeContReport'/>", "<c:url value='/ReportServer?reportlet=sale/selectPresellOrder.cpt'/>&sDlrCd="+selectedItem.dlrCd+"&sBeforeNo="+selectedItem.beforeNo);
                    var printItemUrl = "<c:url value='/ReportServer?reportlet=sale/selectPresellOrder.cpt&sDlrCd="+selectedItem.dlrCd+"&sBeforeNo="+selectedItem.beforeNo+"' />";
                    var newWindow=open(printItemUrl,"<spring:message code='sal.lbl.beforeContReport' />",'top=0,left=0,width=925,height=600,toolbar=1,location=1,directories=0,status=0,menubar=0,resizable=1,scrolling=0,scrollbars=1');
                }else{
                    // 완성상태에서만 인쇄가 가능합니다.
                    dms.notification.info("<spring:message code='sal.lbl.complete' var='salLblComplete' /><spring:message code='global.btn.print' var='globalBtnPrint' /><spring:message code='global.info.possible' arguments='${salLblComplete}, ${globalBtnPrint}' />");
                }
            } else {
                // {예판목록}을(를) 선택해주세요.
                dms.notification.warning("<spring:message code='sal.lbl.beforeContInfo' var='arg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${arg}' />");
            };
        }
    });

    $("#btnRefresh").kendoButton({ // 신규
        click:function(e){
            viewDetailPopup();
        }
    });

    $("#btnDelete").kendoButton({ // 삭제
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");

            if(grid.select().length != 1){
                //목록을 1건만 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                return;
            }

            dms.window.confirm({
                message:"<spring:message code='sal.info.conDeleteMsg' />"
                ,title :"<spring:message code='sal.btn.contsancel' />"
                ,callback:function(result){
                    if(result){
                        var rows = grid.select();

                        var cancelList = []        // 예판계약취소
                          , deleteList = []        // 예판계약삭제
                          , isError = false;

                        rows.each(function(index, row) {
                            var item = grid.dataItem(row);
                            var stat = Number(item.beforeStatCd);

                            if(stat >= 90 ){
                                isError = true;
                            }

                            if(Number(item.beforeStatCd) < 20 ){
                                deleteList.push(item);
                            }else{
                                cancelList.push(item);
                            }
                        });

                        if(isError){
                            // 삭제 또는 취소된 계약건은 처리할 수 없습니다.
                            dms.notification.error("<spring:message code='sal.err.contMultiDel'/>");
                            return false;
                        }

                        var param = { "deleteList": deleteList, "cancelList": cancelList}

                        $.ajax({
                            url :"<c:url value='/sal/acu/contBeforeMng/deleteContractMnt.do' />"
                            ,data :JSON.stringify(param)
                            ,type :'POST'
                            ,dataType :'json'
                            ,contentType :'application/json'
                            ,async :false
                            ,error :function(jqXHR,status,error) {
                                if(jqXHR.responseJSON != null && jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                                }
                            }
                            ,success :function(jqXHR, textStatus) {
                                grid.dataSource._destroyed = [];
                                grid.dataSource.page(1);

                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                        });

                    }else{
                        return false;
                    }
                }
            });

        }
    });

    $("#btnSearch").kendoButton({ // 조회
         enable:true,
         click:function(e){
             $('#grid').data('kendoExtGrid').dataSource.page(1);
         }
    });

   // 메인 그리드
    $("#grid").kendoExtGrid({
        gridId :"G-SAL-0302-230306"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/acu/contBeforeMng/selectContBeforeMngSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 딜러코드
                        params["sDlrCd"] = dlrCd;

                        // 판매사원
                        params["sSaleEmpNo"] = $("#sSaleEmpNo").data("kendoExtDropDownList").value();
                        // 고객명
                        params["sCustNm"] = $("#vCustNm").val();
                        //고객
                        params["sCustNo"] = $("#sCustNo").val();
                        //상태
                        params["sBeforeStatCd"] = $("#sBeforeStatCd").data("kendoExtDropDownList").value();
                        //일자
                        params["sStartBeforeDt"] = $("#sStartContractDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndBeforeDt"] = $("#sEndContractDt").data("kendoExtMaskedDatePicker").value();
                        //
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        params["sFscCd"] = $("#sFscCd").data("kendoExtDropDownList").value();
                        params["sOcnCd"] = $("#sOcnCd").data("kendoExtDropDownList").value();

                        params["sBeforeNo"] = $("#savedBeforeNo").val();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,schema :{
                model :{
                    id :"beforeNo",
                    fields:{
                        beforeNo:{type:"string"}                 //예약번호
                        ,beforeDt:{type:"date"}
                        ,custNm:{type:"string"}
                        ,custTp:{type:"string"}                  //고객유형
                        ,telNo1:{type:"string"}                  //이동전화
                        ,carlineCd:{type:"string"}               //차종코드
                        ,carlineNm:{type:"string"}               //차종명
                        ,fscCd:{type:"string"}                 //모델코드
                        ,fscNm:{type:"string"}                 //모델명
                        ,beforeAmt:{type:"number"}
                        ,compYn:{type:"string"}
                        ,implyYn:{type:"string"}
                        ,beforeStatCd:{type:"string"}
                        ,fincBank:{type:"string"}                //
                        ,saleEmpNm:{type:"string"}               //판매사원명
                    }
                }
            }
            ,requestEnd:function(e){if(e.type =="read"){$(".checkAll").prop("checked", false);}}
        }
        ,dataBound :function(e) {
            // 저장시에만 계약번호가 1회 들어있음.
            var saveBeforeNo = $("#savedBeforeNo").val();

            if(saveBeforeNo != ""){
                var rows = e.sender.tbody.children();

                var selectRow
                  , grid = $("#grid").data("kendoExtGrid");

                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);
                    if(dataItem.beforeNo == saveBeforeNo){

                         selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(idx);
                         grid.select(selectRow);
                    }
                });
            }
            $("#savedBeforeNo").val("");      // 초기화
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default :true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default :true
       ,multiSelectWithCheckbox:true     //멀티선택 적용. default :false
       ,appendEmptyColumn:true           //빈컬럼 적용. default :false
       ,enableTooltip:false               //Tooltip 적용, default :false
       ,pageable :{
           refresh :true
           ,pageSize :40
           ,pageSizes :[ "40", "80", "100", "200"]
       }
       ,height:434
       ,editable:false
       ,resizable:true
       ,autoBind:true
       //,selectable:"row"
       ,navigatable:true
       ,columns :[
          {field:"beforeNo", title:"<spring:message code='sal.lbl.beforeNo' />", attributes:{"class":"al"}, width:100} //예약번호
          ,{
              field:"beforeStatCd", title:"<spring:message code='sal.lbl.statNm' />", attributes:{"class":"ac"}, width:80
              ,template:function(dataItem){
                  var statCdNm = "";

                  if(!dms.string.isEmpty(statCdArray[dataItem.beforeStatCd])){
                      statCdNm = statCdArray[dataItem.beforeStatCd];
                  }

                  if(dataItem.beforeStatCd == "10"){
                      return "<span class='txt_label bg_green'>" + statCdNm + "</span>";
                  }else if(dataItem.beforeStatCd == "20"){
                      return "<span class='txt_label bg_blue'>" + statCdNm + "</span>";
                  }else if(dataItem.beforeStatCd == "90" || dataItem.beforeStatCd == "91"){
                      return "<span class='txt_label bg_red'>" + statCdNm + "</span>";
                  }

                  return statCdNm;
              }
          }   //상태
          ,{field:"beforeDt", title:"<spring:message code='sal.lbl.orderDate' />", attributes:{"class":"ac"}, width:120, format:"{0:"+vDtyyyyMMdd+"}"}  //주문일자
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"al"}, width:100}   //고객명
          ,{
              field:"custTp", title:"<spring:message code='global.lbl.custTp' />", attributes:{"class":"al"}, width:100
             ,template:"#=custTpObj[custTp]#"
          }   //사용성질
          ,{field:"telNo1", title:"<spring:message code='global.lbl.hpNo' />", attributes:{"class":"ac"}, width:120}      //이동전화
          ,{field:"carlineCd", title:"<spring:message code='global.lbl.intrCar' />", attributes:{"class":"al"}, width:90, hidden:true}    //관심차
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.intrCar' />", attributes:{"class":"al"}, width:180}   //관심차
          ,{field:"fscCd", title:"<spring:message code='sal.lbl.intentionModel' />", hidden:true, attributes:{"class":"al"}}            //모델코드
          ,{field:"fscNm", title:"<spring:message code='sal.lbl.intentionModel' />", attributes:{"class":"al"}, width:230}   //모델명
          ,{field:"beforeAmt", title:"<spring:message code='global.lbl.contractAmt' />", attributes:{"class":"ar"}, width:80, format:"{0:n2}"} // 계약금
          ,{
              field:"compYn", title:"<spring:message code='sal.lbl.payYn' />", attributes:{"class":"ac"}, width:90
             ,template:"#=dms.string.strNvl(ynObj[compYn])#"
             ,filterable:{
                 cell:{
                     showOperators:false
                     ,template: function (e) {
                            e.element.kendoExtDropDownList({
                                dataSource:ynList
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,valuePrimitive:true
                                ,optionLabel:" "
                            });
                        }
                 }
             }

          }   //수납완성여부
          ,{
              field:"implyYn", title:"<spring:message code='sal.lbl.finImplysYn' />", attributes:{"class":"ac"}, width:90
             ,template:"#=dms.string.strNvl(ynObj[implyYn])#"
             ,filterable:{
                 cell:{
                     showOperators:false
                     ,template: function (e) {
                            e.element.kendoExtDropDownList({
                                dataSource:ynList
                                ,dataTextField:"cmmCdNm"
                                ,dataValueField:"cmmCd"
                                ,valuePrimitive:true
                                ,optionLabel:" "
                            });
                        }
                 }
             }
          }   //수납여부
          ,{field:"saleEmpNm", title:"<spring:message code='sal.lbl.saleEmp' />", attributes:{"class":"al"}, width:130 } //판매사원
       ]
   });

    // 그리드 더블클릭.
   $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#grid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());
       viewDetailPopup(selectedItem);
   });

});
/******************************************
 * ready () = End =
 ******************************************/

/******************************************
 * 함수영역 - start
 ******************************************/
// 검색조건
function reSearch(BeforeNo){

    if(saleAdminYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").value("");
    }
    $("#savedBeforeNo").val(BeforeNo);  // 계약번호
    $("#vCustNm").val("");
    $("#sCustNo").val("");
    $("#sBeforeStatCd").data("kendoExtDropDownList").value("");
    $("#sStartContractDt").data("kendoExtMaskedDatePicker").value(threeMonthDay);
    $("#sEndContractDt").data("kendoExtMaskedDatePicker").value(toDay);
    $("#sCarlineCd").data("kendoExtDropDownList").value("");
    $("#sFscCd").data("kendoExtDropDownList").value("");
    $("#sFscCd").data("kendoExtDropDownList").enable(false);
    $("#sOcnCd").data("kendoExtDropDownList").value("");
    $("#sOcnCd").data("kendoExtDropDownList").enable(false);
}

// 상세내용 팝업 호출
function viewDetailPopup(data){
    var sDlrCd = dlrCd
      , sBeforeNo  = "";

    if(typeof(data) != "undefined"){
        sDlrCd = data.dlrCd;
        sBeforeNo  = data.beforeNo;
    }

    mainPopupWindow = dms.window.popup({
        windowId:"contBeforeMngPopup"
        ,title:"<spring:message code='sal.lbl.beforeCont' />"      //예약관리
        ,width :950
        ,height:430
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/acu/contBeforeMng/selectContBeforeMngPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":false
                ,"sDlrCd":sDlrCd                  // 딜러코드
                ,"sBeforeNo":sBeforeNo            // 예판번호
                ,"callbackFunc":function(data){
                    if (data.msg == "save"){
                        reSearch(data.cntNo);
                        $("#grid").data("kendoExtGrid").dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                 }
            }
        }
    });
}


//고객명 event
$("#vCustNm").blur(function(e){
    cleanCustCheck();
});

// 고객명 enter event
$("#vCustNm").keyup(function(e){
    if (e.keyCode != 13) {
        cleanCustCheck();
    }
});

//고객명 변경시 고객정보 clean
function cleanCustCheck(){
    if(dms.string.strNvl($("#vCustNm").val()) != dms.string.strNvl($("#sCustNm").val()) ){
        $("#sCustNo").val('');
        $("#sCustNm").val('');
    }
}

//CRM 고객 조회
bf_searchCustomer = function(){

    var responseJson = {};
    if( dms.string.trim($("#vCustNm").val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sCustNm":$("#vCustNm").val()})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        $("#sCustNo").val(responseJson.data[0].custNo);       // 고객코드
        $("#sCustNm").val(responseJson.data[0].custNm);       // 고객명
        $("#vCustNm").val(responseJson.data[0].custNm);      // 고객명
    }else{
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , modal:true
            //, draggable:false
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":dms.string.isEmpty($("#vCustNm").val())?false:true
                    , "custNm":$("#vCustNm").val()
                    , "closeYn":"Y"
                    , "type":null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sCustNo").val(data[0].custNo);       // 고객코드
                            $("#sCustNm").val(data[0].custNm);       // 고객명
                            $("#vCustNm").val(data[0].custNm);       // 고객명
                        }
                        //popupWindow.close();
                    }
                }
            }
        });
    }
}

/********************************
 ** 자식 popup에서 호출
 ********************************/

 //고객조회
function bf_pSearchCustomer(obj) {

    popupWindow = dms.window.popup({
        windowId :"customerSearchPopup"
        , title :"<spring:message code='global.title.custSearch' />"   // 고객 조회
        , modal:true
        , content :{
            url :"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
            , data :{
                "autoBind" :dms.string.isEmpty(obj["sIdNm"])?false:true
                , "closeYn":"Y"
                , "custNm" :obj["sIdNm"]
                , "mngScId":obj["sMngScId"]
                , "addrTp" :obj["sAddrTp"]
                , "type"   :null
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contBeforeMngPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_customerSet(data);
                    }
                    //popupWindow.close();
                }
            }
        }
    });
}

// 우편번호 찾기
function bf_pSearchZipCode(obj){

    zipCodeSearchPopupWin = dms.window.popup({
        windowId :"zipCodeSearchPopupWin"
        , title :"<spring:message code='cmm.title.zipcode.search' />"   // 우편번호 조회
        , modal:true
        , content :{
            url :"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
            , data :{
                "autoBind" :true
                , "sZipCd":obj["sZipCd"]
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contBeforeMngPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        data[0].custTp = obj["custTp"];
                        iframeWindowObject.bf_custZipCodeSearchCallBack(data);
                    }
                    zipCodeSearchPopupWin.close();
                }
            }
        }
    });
}

//-->
</script>