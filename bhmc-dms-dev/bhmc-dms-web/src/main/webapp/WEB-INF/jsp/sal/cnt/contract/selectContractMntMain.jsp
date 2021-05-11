<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 계약관리 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.contractCt' /></h1> <!-- 계약체결관리 -->
        <div class="btn_right">
            <%-- <button id="btnViewDetail" type="button" class="btn_m"><spring:message code='global.btn.detail' /></button> --%>           <!-- 상세 -->
            <dms:access viewId="VIEW-D-10762" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnSearch" type="button" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10761" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnRefresh" type="button" class="btn_m btn_new"><spring:message code='global.btn.new' /></button>         <!-- 신규 -->
            </dms:access>
            <dms:access viewId="VIEW-D-10760" hasPermission="${dms:getPermissionMask('READ')}">
                <button id="btnDelete" type="button" class="btn_m"><spring:message code='sal.btn.contsancel' /></button>                  <!-- 삭제 -->
            </dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:22%;">
                <col style="width:8%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row">&nbsp;</th>
                    <td>
                        <label class="label_check onKey_down"><input id="cntTp01" name="cntTp" type="radio" value="1" checked="checked" class="form_check onKey_down"> <spring:message code='sal.lbl.cntTpOne' /><!-- 체결대기 --></label>
                        <label class="label_check onKey_down"><input id="cntTp02" name="cntTp" type="radio" value="2" class="form_check onKey_down"> <spring:message code='sal.lbl.cntTpTwo' /><!-- 기체결 --></label>
                        <input type="hidden" id="cntTp" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.contractNo' /></th>      <!-- 계약번호 -->
                    <td>
                        <input id="sContractNo" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.customer' /></th>      <!-- 고객 -->
                    <td>
                        <div class="form_float">
                            <div class="form_left">
                                <div class="form_search">
                                    <input id="vContractCustNm" class="form_input" >
                                    <a href="javascript:bf_searchCustomer();"><spring:message code='global.lbl.search' /></a>       <!-- 검색 -->
                                    <input id="sContractCustNm" type="hidden" />
                                </div>
                            </div>
                            <div class="form_right">
                                <input id="sContractCustNo" readonly class="form_input form_readonly">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.salPrsnNm' /></th> <!-- 판매담당자 -->
                    <td>
                        <input id="sSaleEmpNo" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.vinNum" /></th>    <!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" maxlength="17" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.channelType" /></th>  <!-- 채널유형 -->
                    <td>
                        <input id="sDstbChnCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.lv2DlrOrg" /></th>    <!-- 2급딜러 -->
                    <td>
                        <input id="sLv2DlrOrgCd" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>
                    <td class="bor_none"></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 계약내역 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="contGrid" class="resizable_grid"></div>
    </div>
    <!-- 계약내역 그리드 종료 -->
</section>
</div>
<!-- //계약관리 -->

<!-- hidden값  -->
<span style="display:none">

    <!-- 견적번호 -->
    <input id="estimateNo" name="estimateNo" type="hidden" data-json-obj="true" />

    <!-- 저장 후 선택될 계약번호 -->
    <input id="savedContractNo" value="" />

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
//판매인전체 조회권한 여부
var saleAdminYn = "${saleAdminYn}";

// 임시 작업
//if(userId == "admin2"){ saleAdminYn = "Y"; }

//판매사원 리스트
var selectSaleEmpDSList = [];
<c:forEach var="obj" items="${saleEmpDSInfo}">
    selectSaleEmpDSList.push({saleEmpNm:"[${obj.usrId}]${obj.usrNm}", saleEmpCd:"${obj.usrId}"});
</c:forEach>

//계약유형 SAL003
var sContractTpList = [];
var contractTpList = [];    // 집단판매 제외, 직접
<c:forEach var="obj" items="${contractTpDS}">

    <c:if test="${obj.cmmCd ne 'G' and obj.cmmCd ne 'D' }">
        contractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:if>

    sContractTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//계약상태 SAL002
var contractStatCdList = [];
var contractStatCdArray = {};
<c:forEach var="obj" items="${contractStatCdDS}">
    contractStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    contractStatCdArray["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 할인레벨 SAL156
var dcLvlCdObj = {};
<c:forEach var="obj" items="${dcLvlCdDS}">
    dcLvlCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
    ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//채널유형 COM072
var dstbChnList = [];
<c:forEach var="obj" items="${dstbChnDs}">
    dstbChnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//2급딜러 리스트
var lvTwoDlrList = [];
<c:forEach var="obj" items="${lvTwoDlrDs}">
    lvTwoDlrList.push({"cmmCd":"${obj.sdlrCd}", "cmmCdNms":"${obj.sdlrNms}", "cmmCdNm":"${obj.sdlrNm}"});
</c:forEach>

var popupWindow;
var beforepopupWindow;
var zipCodeSearchPopupWin = null;
var mainPopupWindow;

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {

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

    // 체결대기
    $("#cntTp01").click(function(){
        $("#cntTp").val("1");
        var grid = $("#contGrid").data("kendoExtGrid");
        grid.dataSource._destroyed = [];
        grid.dataSource.page(1);
    });
    // 기체결
    $("#cntTp02").click(function(){
        $("#cntTp").val("2");
        var grid = $("#contGrid").data("kendoExtGrid");
        grid.dataSource._destroyed = [];
        grid.dataSource.page(1);
    });
    $("#cntTp").val("1");
    $("#cntTp01").prop("checked", true);

    // 채널유형
    $("#sDstbChnCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNm"
       ,dataValueField :"cmmCd"
       ,dataSource:dms.data.cmmCdFilter(dstbChnList)
       ,optionLabel:" "
    });

    // 2급딜러
    $("#sLv2DlrOrgCd").kendoExtDropDownList({
        dataTextField  :"cmmCdNms"
       ,dataValueField :"cmmCd"
       ,dataSource:lvTwoDlrList
       ,optionLabel:" "
    });


    /*
    $("#btnViewDetail").kendoButton({    // 상세조회.
        click:function(e){
            var grid = $("#contGrid").data("kendoExtGrid");
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
    */

    $("#btnRefresh").kendoButton({ // 신규
        click:function(e){
            viewDetailPopup();
        }
    });

    $("#btnDelete").kendoButton({ // 삭제
        click:function(e){

            if($("#contGrid").data("kendoExtGrid").select().length < 1){
                //목록을 1건만 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.title.list' var='globalTitleList' /><spring:message code='global.info.isSelectChk' arguments='${globalTitleList}, 1' />");
                return;
            }

            dms.window.confirm({
                message:"<spring:message code='sal.info.conDeleteMsg' />"
                ,title :"<spring:message code='sal.btn.contsancel' />"
                ,callback:function(result){
                    if(result){

                        var grid = $("#contGrid").data("kendoExtGrid");
                        var rows = grid.select();

                        var cancelList = []        // 계약취소
                          , deleteList = []        // 계약삭제
                          , isError = false;

                        rows.each(function(index, row) {
                            var item = grid.dataItem(row);
                            var stat = Number(item.contractStatCd);

                            if(stat >= 90 ){
                                isError = true;
                            }

                            if(Number(item.contractStatCd) < 20 ){
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
                            url :"<c:url value='/sal/cnt/contractMnt/deleteContractMnt.do' />"
                            ,data :JSON.stringify(param)
                            ,type :'POST'
                            ,dataType :'json'
                            ,contentType :'application/json'
                            ,async :false
                            ,error :function(jqXHR,status,error) {
                                if(jqXHR.responseJSON.errors != null && jqXHR.responseJSON.errors.length > 0){
                                    dms.notification.error(jqXHR.responseJSON.errors);
                                }else{
                                    dms.notification.error(error);
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

             $('#contGrid').data('kendoExtGrid').dataSource.page(1);
             //fn_btnState();  // 버튼상태
         }
    });


   /** 판매기회 정보 셋팅 **/
   var saleOpptNo = '${saleOpptNo}';       // 판매기회 데이터
   if(saleOpptNo != ""){
       reSearch(saleOpptNo);
       $("#cntTp").val("1");
       $("#cntTp01").prop("checked", true);
       //$("#savedContractNo").val(saleOpptNo);
   }
   /** 판매기회 정보 셋팅 END **/

   if('${orderNo}' != ""){
       $("#cntTp").val("2");
       $("#cntTp02").prop("checked", true);
       reSearch('${orderNo}');
   }else if('${estimateNo}' != ""){
       reSearch('${estimateNo}');
       $("#cntTp").val("1");
       $("#cntTp01").prop("checked", true);
   }

   // 메인 그리드
    $("#contGrid").kendoExtGrid({
        gridId :"G-SAL-1021-113316"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/cnt/contractMnt/selectContractMntSearch.do' />"
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
                        params["sContractCustNm"] = $("#vContractCustNm").val();
                        //고객
                        params["sContractCustNo"] = $("#sContractCustNo").val();
                        // 유형
                        params["sCntTp"] = $("#cntTp").val();
                        // 계약번호
                        params["sContractNo"] = $("#sContractNo").val();
                        params["savedContractNo"] = $("#savedContractNo").val();
                        // vin no
                        params["sVinNo"] = $("#sVinNo").val();
                        // 채널유형
                        params["sDstbChnCd"] = $("#sDstbChnCd").data("kendoExtDropDownList").value();
                        // 2급딜러
                        params["sLv2DlrOrgCd"] = $("#sLv2DlrOrgCd").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,schema :{
                model :{
                    id :"contractNo",
                    fields :{
                         dlrCd         :{type :"string", editable:false} //딜러코드
                        ,contractNo    :{type :"string"}                 //계약번호
                        ,contractCustNo :{type :"string"}               //계약고객번호
                        ,custNm         :{type :"string"}
                        ,grpContractNo  :{type :"string"}                //그룹계약번호
                        ,contractTpNm   :{type :"string"}                //계약유형
                        ,contractStatNm :{type :"string"}                //계약상태
                        ,contractDt     :{type :"date"}                 //계약일
                        ,carlineCd  :{type :"string"}                   //차종코드
                        ,carlineNm  :{type :"string"}                   //차종명
                        ,fscCd      :{type :"string"}                   //차관코드
                        ,fscNm      :{type :"string"}                   //차관명
                        ,modelCd    :{type :"string"}                   //모델명
                        ,ocnCd      :{type :"string"}                   //OCN코드
                        ,ocnNm      :{type :"string"}                   //OCN명
                        ,extColorCd :{type :"string"}                   //외장색상코드
                        ,extColorNm :{type :"string"}                   //외장색
                        ,intColorCd :{type :"string"}                   //내장색상코드
                        ,intColorNm :{type :"string"}                   //내장색명
                        ,saleEmpNo  :{type :"string"}                   //판매사원번호
                        ,saleEmpNm  :{type :"string"}                   //판매사원명
                        //,payTpNm    :{type :"string"}                   //지불유형
                        //,retlAmt    :{type :"number"}                   //지도가
                        ,realPayAmt :{type :"number"}                   //판매금액
                        ,vinNo      :{type :"string"}                   //점용VIN NO
                        ,dstbChnNm  :{type :"string"}                   //채널유형
                        ,lv2DlrYn   :{type :"string"}                   //2급딜러여부
                        ,lv2DlrOrgCd:{type :"string"}                   //2급딜러코드
                        ,lv2DlrOrgNm:{type :"string"}                   //2급딜러명
                        ,dcLvlCd    :{type :"string"}                   //할인레벨코드
                    }
                }
            }
            ,requestEnd:function(e){if(e.type =="read"){$(".checkAll").prop("checked", false);}}
        }
        ,dataBound :function(e) {
            // 저장시에만 계약번호가 1회 들어있음.
            var saveContNo = $("#savedContractNo").val();

            if(saveContNo != ""){
                var rows = e.sender.tbody.children();

                var selectRow
                  , grid = $("#contGrid").data("kendoExtGrid");

                $.each(rows, function(idx, row){
                    var dataItem = e.sender.dataItem(row);
                    if(dataItem.contractNo == saveContNo){

                         selectRow = grid.tbody.find(">tr:not(.k-grouping-row)").eq(idx);
                         grid.select(selectRow);
                        //viewDetailPopup();
                    }
                });
            }
            $("#savedContractNo").val("");      // 초기화
        }
       ,multiSelectWithCheckbox :true     //멀티선택 적용. default :false
       ,pageable :{
           refresh :true
           ,pageSize :40
           ,pageSizes :[ "40", "80", "100", "200"]
       }
       ,height :434
       ,editable    :false
       ,resizable :true
       ,autoBind :true
       //,selectable :"row"
       ,navigatable :true
       ,sortable:{mode:"single"}
       ,columns :[
          {field:"dlrCd",       title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
          ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo' />", attributes:{"class":"al"}, width:120}               //계약번호
          ,{field:"contractCustNo", title:"<spring:message code='global.lbl.contractCustNo' />", width:150}             //계약고객번호
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", attributes:{"class":"al"}, width:100}                       //고객명
          ,{field:"grpContractNo", title:"<spring:message code='sal.lbl.grpContractNo' />", attributes:{"class":"al"}, width:100, hidden:true}      //그룹계약번호
          ,{field:"contractTpNm", title:"<spring:message code='global.lbl.contractType' />", attributes:{"class":"ac"}, width:90, hidden:true}      //계약유형
          ,{field:"contractStatNm", title:"<spring:message code='global.lbl.contractStat' />", attributes:{"class":"ac"}, width:90, hidden:true }   //계약상태
          ,{field:"contractDt", title:"<spring:message code='global.lbl.contractDt' />", attributes:{"class":"ac"}, width:90, format:"{0:"+vDtyyyyMMdd+"}"}                   //계약일
          ,{field:"carlineCd", title:"<spring:message code='global.lbl.carlineCd' />", attributes:{"class":"al"}, width:60}    //차종코드
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", attributes:{"class":"al"}, width:100}     //차종명
          ,{field:"fscCd", title:"fscCd", hidden:true, attributes:{"class":"al"}}            // 차관코드
          ,{field:"fscNm", title:"<spring:message code='global.lbl.model' />", attributes:{"class":"al"}, width:150}   //차관명
          ,{field:"ocnCd", title:"<spring:message code='global.lbl.ocnCode' />", attributes:{"class":"al"}, width:60}    //OCN코드
          ,{field:"ocnNm", title:"<spring:message code='global.lbl.ocnNm' />", attributes:{"class":"al"}, width:150}     //OCN명
          ,{field:"extColorCd", title:"<spring:message code='global.lbl.extColorCd' />", attributes:{"class":"al"}, width:80}     //외장색코드
          ,{field:"extColorNm", title:"<spring:message code='global.lbl.extColorNm' />", attributes:{"class":"al"}, width:140}    //외장색명
          ,{field:"intColorCd", title:"<spring:message code='global.lbl.intColorCd' />", attributes:{"class":"al"}, width:80}     //내장색상코드
          ,{field:"intColorNm", title:"<spring:message code='global.lbl.intColor' />", hidden:true}                       //내장색명
          ,{field:"saleEmpNo", title:"<spring:message code='global.lbl.saleEmpNo' />", hidden:true}                     //판매사원번호
          ,{field:"saleEmpNm", title:"<spring:message code='sal.lbl.saleEmp' />", attributes:{"class":"al"}, width:90 } //판매사원명
          //,{field:"payTpNm", title:"<spring:message code='sal.lbl.payTp' />", attributes:{"class":"al"}, width:90 }     //지불방식
          //,{field:"retlAmt", title:"<spring:message code='sal.lbl.carRetlAmt' />", attributes:{"class":"ar"}, width:90, format:"{0:n2}" }    //지불방식
          ,{field:"realPayAmt", title:"<spring:message code='global.lbl.salAmt' />", attributes:{"class":"ar"}, width:80,format:"{0:n2}"}                  // 판매금액
          ,{field:"vinNo", title:"<spring:message code='sal.lbl.sVinNo' />", attributes:{"class":"al"}, width:150}                  // 점용VIN NO
          ,{field:"dstbChnNm", title:"<spring:message code='sal.lbl.channelType' />", attributes:{"class":"al"}, width:100}          // 채널유형
          ,{field:"lv2DlrYn", title:"<spring:message code='global.lbl.lv2DlrYn' />", attributes:{"class":"al"}, width:100, template :"#= dms.string.strNvl(ynObj[lv2DlrYn]) #", hidden:true }          // 2급딜러여부
          ,{field:"lv2DlrOrgNm", title:"<spring:message code='global.lbl.lv2DlrNm' />", attributes:{"class":"al"}, width:100}          // 2급딜러명
          ,{field:"dcLvlCd", title:"<spring:message code='sal.lbl.dcLvlCd' />", attributes:{"class":"ac"}, width:70, template :"#= dms.string.strNvl(dcLvlCdObj[dcLvlCd]) #", hidden:true }       // 할인레벨
       ]
   });

    // 그리드 더블클릭.
   $("#contGrid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#contGrid").data("kendoExtGrid");
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
function reSearch(contNo){
    if(saleAdminYn == "Y"){
        $("#sSaleEmpNo").data("kendoExtDropDownList").value("");
    }
    $("#savedContractNo").val(contNo);  // 계약번호
    $("#sContractNo").val("");  // 계약번호
    $("#vContractCustNm").val("");
    $("#sContractCustNo").val("");
    $("#cntTp").val("2");
    $("#cntTp02").prop("checked", true);

    $("#sContractNo").val("");
    $("#sVinNo").val("");
}

// 상세내용 팝업 호출
function viewDetailPopup(data){
    var windowHeight = $(window).innerHeight();
    var vHeight = 0;
    if(windowHeight >= 870){
        vHeight = 770;
    }else if(windowHeight >= 800){
        vHeight = 625;
    }else if(windowHeight >= 580){
        vHeight = 500;
    }else{
        vHeight = 450;
    }

    var sDlrCd = dlrCd
      , sContractNo  = "";

    if(typeof(data) != "undefined"){
        sDlrCd = data.dlrCd;
        sContractNo  = data.contractNo;
    }

    mainPopupWindow = dms.window.popup({
        windowId:"contractMntPopup"
        ,title:"<spring:message code='sal.title.retailContractOrd' />"      // 계약관리
        //,width :950
        ,width :1100
        ,height:vHeight
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/cnt/contractMnt/selectContractMntPopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":false
                ,"sDlrCd":sDlrCd                   // 딜러코드
                ,"sContractNo":sContractNo              // 딜러명

                ,"callbackFunc":function(data){
                    if (data.msg == "save"){
                        reSearch(data.cntNo);

                        if( typeof(data.cntTp) != "undefined"){
                            if(data.cntTp == "01"){
                                $("#cntTp").val("1");
                                $("#cntTp01").prop("checked", true);
                            }
                        }
                        $("#contGrid").data("kendoExtGrid").dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                 }
            }
        }
    });
}


//고객명 event
$("#vContractCustNm").blur(function(e){
    cleanCustCheck();
});

// 고객명 enter event
$("#vContractCustNm").keyup(function(e){
    if (e.keyCode != 13) {
        cleanCustCheck();
    }
});

//상하좌우
$(".onKey_down").keydown(function(e){
    e = (e?e:window.event);
    if(e.keyCode == "37" || e.keyCode == "38" || e.keyCode == "39" || e.keyCode == "40"){
        return false;
    }
});

//고객명 변경시 고객정보 clean
function cleanCustCheck(){
    if(dms.string.strNvl($("#vContractCustNm").val()) != dms.string.strNvl($("#sContractCustNm").val()) ){
        $("#sContractCustNo").val('');
        $("#sContractCustNm").val('');
    }
}

//CRM 고객 조회
bf_searchCustomer = function(){
    //전체권한자는 고객전체 검색 가능.
    var sMngScId = "";
    if(saleAdminYn != "Y"){
        sMngScId = userId;
    }

    var responseJson = {};
    if( dms.string.trim($("#vContractCustNm").val()).length > 0 ){
        responseJson = dms.ajax.getJson({
            url :"<c:url value='/sal/cnt/contractRe/selectCrmCustomerInfo.do' />"
            ,data :JSON.stringify({"lastIndex":2, "firstIndex":0, "sDlrCd":dlrCd, "sCustNm":$("#vContractCustNm").val(), "sMngScId":sMngScId})
            ,async :false
        });
    }

    if(responseJson != null && responseJson.total == 1){
        $("#sContractCustNo").val(responseJson.data[0].custNo);       // 고객코드
        $("#sContractCustNm").val(responseJson.data[0].custNm);       // 고객명
        $("#vContractCustNm").val(responseJson.data[0].custNm);      // 고객명
    }else{
        popupWindow = dms.window.popup({
            windowId:"customerSearchPopup"
            , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
            , modal:true
            //, draggable:false
            , content:{
                url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
                , data:{
                    "autoBind":dms.string.isEmpty($("#vContractCustNm").val())?false:true
                    , "closeYn":"Y"
                    , "custNm":$("#vContractCustNm").val()
                    , "mngScId":sMngScId
                    , "type":null
                    , "callbackFunc":function(data){
                        if(data.length >= 1) {
                            $("#sContractCustNo").val(data[0].custNo);       // 고객코드
                            $("#sContractCustNm").val(data[0].custNm);       // 고객명
                            $("#vContractCustNm").val(data[0].custNm);       // 고객명
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

 //예약판매 조회
function bf_beforeNoSearchPopup(obj)  {

    beforepopupWindow = dms.window.popup({
        windowId :"beforeNoSearchPopupWin"    // 예약판매 팝업
        ,title :"<spring:message code='sal.lbl.beforeCont'/>"   // 예약판매
        ,content :{
            url :"<c:url value='/sal/cnt/contractMnt/selectContractBeforeSearchPopup.do'/>"
            ,data:{
                "autoBind":false
                ,"sDlrCd":obj["dlrCd"]
                ,"sSaleEmpNo":obj["saleEmpNo"]
                ,"sCustNm":obj["custNm"]
                ,"sCustNo":obj["custNo"]
                //,"sBeforeNo":obj["beforeNo"]
                ,"callbackFunc":function(data){
                    if (data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_beforeNoSearchPopupCallBack(data);
                    }
                    beforepopupWindow.close();
                }
            }
        }
    });
}

//고객조회
function bf_pSearchCustomer(obj, callbackFunc1) {

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
                    if(typeof(callbackFunc1) != "undefined"){
                        callbackFunc1(data);
                    }else{
                        if(data.length >= 1) {
                            var windowElement = $("#contractMntPopup");
                            var iframeDomElement = windowElement.children("iframe")[0];
                            var iframeWindowObject = iframeDomElement.contentWindow;
                            iframeWindowObject.bf_customerSet(data);
                        }
                    }
                    //popupWindow.close();
                }
            }
        }
    });
}

// 신차 vin no조회
function bf_pSearchVinNo(obj) {

    popupWindow = dms.window.popup({
        windowId :"vinNoContractPopup"
        , title :"<spring:message code='sal.title.carSearch' />"   // 차량조회
        , modal:true
        , content :{
            url :"<c:url value='/sal/cnt/contractMnt/selectContractReVinNoSearchPopup.do'/>"
            , data :{
                "autoBind" :false
                , "type"   :null
                , "sDlrCd" :obj["sDlrCd"]
                , "sCarlineCd" :obj["sCarlineCd"]
                , "sCarlineNm" :obj["sCarlineNm"]
                , "sModelCd" :obj["sModelCd"]
                , "sFscCd"   :obj["sFscCd"]
                , "sFscNm"   :obj["sFscNm"]
                , "sOcnCd" :obj["sOcnCd"]
                , "sOcnNm" :obj["sOcnNm"]
                , "sExtColorCd" :obj["sExtColorCd"]
                , "sExtColorNm" :obj["sExtColorNm"]
                , "sIntColorCd" :obj["sIntColorCd"]
                , "sIntColorNm" :obj["sIntColorNm"]
                , "sVinNo" :obj["sVinNo"]
                , "sContractNo":obj["sContractNo"]
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_vinNoSet(data);
                    }
                    popupWindow.close();
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
        , "selectable":"row"
        , "addrDetlUsingYn":"N"
        , width:770
        , height:410
        , modal:true
        , content :{
            url :"<c:url value='/cmm/sci/commonPopup/selectZipCodePopup.do'/>"
            , data :{
                "autoBind" :dms.string.isNotEmpty(obj["sValue"])?true:false
                //, "sZipCd":obj["sZipCd"]
                , "sValue":obj["sValue"]
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
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

// 용품조회
function bf_pSearchGoodsSearchPopup(obj){

     dms.window.popup({
        windowId:"accessoryItemSearchPopup"
        ,width:700
        ,title:"<spring:message code='sal.title.goodsSearch' />"   // 용품조회
        ,content:{
            //url:"<c:url value='/sal/acc/accessoryMng/selectGoodsItemSearchPopup.do'/>"
            url:"<c:url value='/sal/acc/itemSales/selectAccessoryItemSearchPopup.do'/>"       // 신규 용품
            ,data:{
                "type":null
                ,"autoBind":true
                , "sDlrCd":obj["dlrCd"]
                , "sCarlineCd" :obj["carlineCd"]
                , "sGoodsCd"   :obj["goodsCd"]
                , "sPkgItemCd" :obj["pkgItemCd"]

                //, "onlyItemTab":"Y"
                ,"callbackFunc":function(data, type){
                    var windowElement = $("#contractMntPopup");
                    var iframeDomElement = windowElement.children("iframe")[0];
                    var iframeWindowObject = iframeDomElement.contentWindow;
                    iframeWindowObject.bf_goodsSearchPopupCallBack(data, type);

                    //popupWindow.close();
                    $("#accessoryItemSearchPopup").data("kendoWindow").close();
                }
            }
        }
    });
}

// 보험 item 추가
function bf_pSearchIncItem(){
    popupWindow = dms.window.popup({
        windowId:"incItemPopup"
        , title:"<spring:message code='sal.title.incJoinInfoMng' />"   // 보험정보등록
        , width:600
        , height:400
        , content:{
            url:"<c:url value='/sal/inc/incJoinInfo/selectIncItemPopup.do' />"
            , data:{
                "autoBind":true
                , "type"  :null
                , "callbackFunc":function(data, num){
                    if (data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_incItemPopupCallBack(data, num);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

// 대행업무 item 추가
function bf_pSearchAapItem(){
    popupWindow = dms.window.popup({
        windowId:"aapItemPopup"
        , title:"<spring:message code='sal.lbl.subServices' />"   // 대행업무
        , width:600
        , height:400
        , content:{
            url:"<c:url value='/sal/aap/aapInfo/selectAapInfoItemPopup.do' />"
            , data:{
                "autoBind":true
                , "type"  :null
                , "callbackFunc":function(data, num){
                    if (data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_aapItemPopupCallBack(data, num);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}


// 중고차 vin no 조회 검색
function bf_pSearchUsedCarVinNo(obj){

    popupWindow = dms.window.popup({
        windowId :"VinNoContractPopup"
        , title :"<spring:message code='sal.title.usedCarSearch' />"   // 중고차조회
        , modal:true
        , content :{
            url :"<c:url value='/sal/cnt/contractRe/selectContractReUsedCarSearchPopup.do'/>"
            , data :{
                "autoBind" :true
                , "type"   :null
                , "sDlrCd" :obj["sDlrCd"]
                , "sVinNo" :obj["sVinNo"]
                , "callbackFunc" :function(data){
                    if(data.length >= 1) {
                        var windowElement = $("#contractMntPopup");
                        var iframeDomElement = windowElement.children("iframe")[0];
                        var iframeWindowObject = iframeDomElement.contentWindow;
                        iframeWindowObject.bf_searchUsedCarVinNoCallBack(data);
                    }
                    popupWindow.close();
                }
            }
        }
    });
}

//-->
</script>