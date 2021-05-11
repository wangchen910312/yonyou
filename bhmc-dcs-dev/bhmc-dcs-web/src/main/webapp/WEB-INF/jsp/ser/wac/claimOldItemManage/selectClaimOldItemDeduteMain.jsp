<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<!-- 클레임 고품 공제 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">

            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.oldItemDeduMng" />(DCS)</h1><!-- 고품공제관리 -->
                <div class="btn_right">
				<dms:access viewId="VIEW-I-12492" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m " id="btnSave"><spring:message code="ser.btn.dedute" /></button><!-- 공제 -->
				</dms:access>
				<dms:access viewId="VIEW-I-12491" hasPermission="${dms:getPermissionMask('READ')}">
                    <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
				</dms:access>
                </div>
            </div>
            <!-- 조회 조건 타이틀 종료 -->

            <!-- 조회 조건 시작 -->
            <div class="table_form" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                        <col style="width:10%;">
                        <col style="width:19%;">
                        <col style="width:10%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col style="width:14%;">
                        <col style="width:10%;">
                        <col>
                    <tbody>
                        <tr>
                            <th scope="row">
                                <input type="text" id="sField" name="sField" class="form_comboBox" value="01" style="width:80%"/>
                            </th><!--요청일자  -->
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sReqFromDt" value="" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sReqToDt" value="" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.dlrCd" /></th><!--딜러   -->
                            <td>
                                <input type="text" id="sDlrCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.OldItemstatNm" /></th><!--상태  -->
                            <td>
                                <input type="text" id="sStatCd" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.oldItemStatCd" /></th><!--상태  -->
                            <td>
                                <input type="text" id="sOlditemStatCd" class="form_comboBox">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.claimNo" /></th><!--클레임번호  -->
                            <td>
                                <input type="text" id="sClaimDocNo" value="" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.oitemCd" /></th><!--부품코드  -->
                            <td>
                                <input type="text" id="sItemCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.oldItemAcceptYn' /></th><!--접수여부  -->
                            <td>
                                <input type="text" id="sAcceptYn" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.reqDept' /></th><!--요청부서  -->
                            <td>
                                <input id="sReqDeptCd" name="sReqDeptCd" type="text" value="" class="form_comboBox"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 조회 조건 종료 -->

            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
            </div>
            <!-- 그리드 기능 버튼 종료 -->

            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="grid" class="grid"></div>
            </div>
            <!-- 그리드 종료 -->

            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
            </div>
            <!-- 조회 조건 타이틀 종료 -->

            <form id="oldItemform">
                <div class="table_form form_width_100per">
                    <table>
                        <caption></caption>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.requestUsr' /></th><!--요청자  -->
                                <td>
                                    <input type="hidden" id="reqId" name="reqId"">
                                    <input type="text" id="reqNm" name="reqNm" value="" class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.telNum' /></th><!--전화  -->
                                <td>
                                    <input type="text" id="reqTelNo" name="reqTelNo" value="" class="form_input form_readonly">
                                </td>
                                <th scope="row"><spring:message code='ser.lbl.reqDept' /></th><!--요청부서  -->
                                <td>
                                    <input type="text" id="reqDeptCd" name="reqDeptCd" value="" class="form_comboBox form_readonly">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.deduUser' /></span></th><!--공제자  -->
                                <td>
                                    <input required type="text" id="ddctId" name="ddctId" data-name="<spring:message code='ser.lbl.deduUser' />" value="" class="form_input">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code='ser.lbl.dedDt' /></span></th><!--공제일  -->
                                <td>
                                    <input required type="text" id="ddctDt" name="ddctDt" data-name="<spring:message code='ser.lbl.dedDt' />" class="form_datepicker ac">
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            <!-- 조회 조건 종료 -->
        </section>
    </div>
</div>
<!-- confirm 팝업 -->
<c:import url="/WEB-INF/jsp/ser/cmm/popup/selectConfirmPopup.jsp" />
<!-- confirm 팝업 -->
<script type="text/javascript">

//요청상태 Array
var statCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${statCdList}">
<c:if test='${obj.remark4 eq "Y" }'>
    statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>
//요청상태 Map
var statCdMap = dms.data.arrayToMap(statCdList, function(obj){ return obj.cmmCd; });

//브랜드 Array
var useYnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${useYnList}">
useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//브랜드 Map
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){ return obj.cmmCd; });

//고품조회조건
var searchList = [];
<c:forEach var="obj" items="${searchList}">
<c:if test="${obj.remark4 eq 'Y' }" >
    searchList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:if>
</c:forEach>

//고품조회조건 Map
var searchMap = dms.data.arrayToMap(searchList, function(obj){ return obj.cmmCd; });

//고품부품상태
var itemStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${itemStatCdList}">
itemStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고품부품상태 Map
var itemStatCdMap = dms.data.arrayToMap(itemStatCdList, function(obj){ return obj.cmmCd; });

//고품지불방식
var oldItemPaymCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${oldItemPaymCdList}">
oldItemPaymCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//고품지불방식 Map
var oldItemPaymCdMap = dms.data.arrayToMap(oldItemPaymCdList, function(obj){ return obj.cmmCd; });

//부서코드 Array
var deptCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${deptCdList}">
deptCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//부서코드 Map
var deptCdMap = dms.data.arrayToMap(deptCdList, function(obj){ return obj.cmmCd; });


$(document).ready(function() {


    // 요청상태
    statCdGrid = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(statCdMap[val] != undefined){
                returnVal =  statCdMap[val].cmmCdNm;
            }
        }
        return returnVal;
    };

     // 요청부서
    deptCdGrid = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(deptCdMap[val] != undefined){
                returnVal =  deptCdMap[val].cmmCdNm;
            }
         }
        return returnVal;
    };

     // 고품조회조건
    setSearchMap = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(searchMap[val] != undefined){
                returnVal =  searchMap[val].cmmCdNm;
            }
         }
        return returnVal;
    };

    // 고품부품상태
    setItemStatCdMap = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(itemStatCdMap[val] != undefined){
                returnVal =  itemStatCdMap[val].cmmCdNm;
            }
         }
        return returnVal;
    };

    // 고품지불방식
    setOldItemPaymCdMap = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(oldItemPaymCdMap[val] != undefined){
                returnVal =  oldItemPaymCdMap[val].cmmCdNm;
            }
         }
        return returnVal;
    };

    //조회조건
    $("#sField").kendoExtDropDownList({
         dataSource:searchList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - 상태코드
    $("#sStatCd").kendoExtDropDownList({
        dataSource:statCdList
       ,dataValueField:"cmmCd"
       ,dataTextField:"cmmCdNm"
       ,index:0
   });

    //조회조건 - 부품상태코드
    $("#sOlditemStatCd").kendoExtDropDownList({
         dataSource:itemStatCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - 상태
    $("#sStatCd").kendoExtDropDownList({
         dataSource:statCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - 접수여부
    $("#sAcceptYn").kendoExtDropDownList({
         dataSource:useYnList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });
    //조회조건 - 요청부서
    $("#sReqDeptCd").kendoExtDropDownList({
         dataSource:deptCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //요청부서
    $("#reqDeptCd").kendoExtDropDownList({
         dataSource:deptCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    $("#sReqFromDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sFromDt}"
    });

    $("#sReqToDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sToDt}"
    });

    $("#ddctDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {


            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();
            var saveData = [];

            var validator = $("#oldItemform").kendoExtValidator().data("kendoExtValidator");

            if (validator.validate()) { //validation check

                $(".grid-checkbox-item").each( function(index , obj){
                    var dataItem = grid.dataSource._data;
                    if( $(obj).hasClass("k-state-selected")){
                        var statCd = dataItem[index].statCd;
                        //요청 대상만 담음.
                        if(statCd == "04" ){
                            dataItem[index].ddctId        = $("#ddctId").val();                                    //공제자
                            dataItem[index].ddctDt        = $("#ddctDt").data("kendoExtMaskedDatePicker").value(); //공제일
                            dataItem[index].statCd        = "05";          //상태
                            saveData.push(dataItem[index]);
                        }
                    }
                });

                if(saveData.length == 0){
                    dms.notification.warning("<spring:message code='ser.btn.reqSend' var='reqSend' />"+
                                             "<spring:message code='ser.info.noInfoData' arguments='${reqSend} ' />");
                    return;
                }else{

                   $("#messageId").html("<spring:message code='ser.btn.reqSend' var='reqSend' />"+
                    "<spring:message code='global.info.cnfrmMsg' arguments='${reqSend}' />" );
                    conformKendoWindow.content( $(".msgDiv").html());
                    conformKendoWindow.open();
                    $(".yes, .no").click(function(){
                        if($(this).hasClass("yes")){
                            conformKendoWindow.close();

                            var jsonData = {"claimOldItemManageList":saveData};

                            if (grid.gridValidation()) {

                                $.ajax({
                                    url:"<c:url value='/ser/wac/claimOldItemManage/updateDeductOldItemManage.do' />",
                                    data:JSON.stringify(jsonData),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(jqXHR, textStatus) {

                                        grid.dataSource._destroyed = [];
                                        grid.dataSource.page(1);
                                        //정상적으로 반영 되었습니다.
                                        dms.notification.success("<spring:message code='global.info.success'/>");
                                    }
                                    ,beforeSend:function(xhr){
                                        dms.loading.show($("#resizableContainer"));
                                    }
                                    ,complete:function(xhr,status){
                                        dms.loading.hide($("#resizableContainer"));
                                    }
                                });

                            }else{
                                //입력값을 확인하여 주십시오.
                                dms.notification.warning("<spring:message code='global.info.check.input'/>");
                            }

                    }else{
                            conformKendoWindow.close();
                            $(".grid-checkbox-item").each( function(index , obj){
                                var dataItem = grid.dataSource._data;
                                if( $(obj).hasClass("k-state-selected")){
                                    var statCd = dataItem[index].statCd;
                                    //요청 대상상태 원복
                                    if(statCd == "05" ){
                                        dataItem[index].statCd  = "04"; //상태
                                    }
                                }
                            });
                        }
                    }).end();
                }
            }
         }
    });

     //버튼 - 엑셀
    $("#btnExcelImport").kendoButton({
        click:function(e) {
            claimOldItemBatchUploadPopupWin = dms.window.popup({
                title:"Excel upload"
                ,windowId:"claimOldItemBatchUploadPopupWin"
                ,content:{
                    url:"<c:url value='/ser/wac/claimOldItemManage/selectClaimOldItemApproveBatchUploadPopup.do'/>"
                    ,data:{
                        "callbackFunc":function(data){
                            $('#grid').data('kendoExtGrid').dataSource.data([]);

                            $.each(data,function(i,v){
                                var json = {};
                                json.rnum = v.rnum
                                json.dlrCd = v.dlrCd
                                json.claimDocNo = v.claimDocNo
                                json.itemCd = v.itemCd
                                json.collcQty = v.collcQty
                                json.claimQty = v.collcQty
                                json.vinNo = 'vin'
                                json.statCd = '01'

                                $('#grid').data('kendoExtGrid').dataSource.insert(json);
                            })
                        }
                    }
                }
            });
        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-0625-103439"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimOldItemManage/selectDeductOldItemManage.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sReqFromDt"] = $("#sReqFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sReqToDt"] = $("#sReqToDt").data("kendoExtMaskedDatePicker").value();
                        params["sDlrCd"] = $("#sDlrCd").val();
                        params["sStatCd"] = $("#sStatCd").data("kendoExtDropDownList").value();
                        params["sClaimDocNo"] = $("#sClaimDocNo").val();
                        params["sItemCd"] = $("#sItemCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", validation:{required:true}, editable:false}
                        ,vinNo:{type:"string", editable:false}
                        ,claimDocNo:{type:"string", editable:false}
                        ,statCd:{type:"string", editable:false}
                        ,atqReqNo:{type:"string", editable:false}
                        ,runDistVal:{type:"number", editable:false}
                        ,itemCd:{type:"string", editable:false}
                        ,itemNm:{type:"string", editable:false}
                        ,itemUnitCd:{type:"string", editable:false}
                        ,collcQty:{type:"number"}
                        ,claimQty:{type:"number", editable:false}
                        ,reqStatCd:{type:"string", editable:false}
                        ,reqReasonCont:{type:"string", editable:false}
                        ,collcReqDt:{type:"date", editable:false}
                        ,reqId:{type:"string", editable:false}
                        ,reqNm:{type:"string", editable:false}
                        ,reqDt:{type:"date", editable:false}
                        ,reqDeptCd:{type:"string", editable:false}
                        ,collcId:{type:"string", editable:false}
                        ,collcDt:{type:"date", editable:false}
                        ,ddctId:{type:"string", editable:false}
                        ,ddctDt:{type:"date", editable:false}
                        ,giDstinCd:{type:"string", editable:false}
                        ,giDt:{type:"date", editable:false}
                        ,returnDt:{type:"date", editable:false}
                        ,giDeptCd:{type:"string", editable:false}
                        ,giId:{type:"string", editable:false}
                    }
                }
            }
        }
        ,editable:false
        ,dataBound:function (e){

            var rows = e.sender.tbody.children();

            $.each(rows, function(idx, row){
                var row = $(rows[idx]);
                var dataItem = e.sender.dataItem(row);

                if(dataItem.statCd == "04"){
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled");
                }else{
                    e.sender.tbody.find("input[data-uid='" + dataItem.uid + "']").attr("disabled","disabled");
                }
            });
        }
        ,change:function(e){
            var selectedVal = this.dataItem(this.select());

            if(selectedVal != null){
                $("#ddctDt").data("kendoExtMaskedDatePicker").value(selectedVal.ddctDt);
                $("#reqId").val(selectedVal.reqId);
                $("#reqNm").val(selectedVal.reqNm);
                $("#reqDeptCd").val(selectedVal.reqDeptCd);
                $("#reqTelNo").val(selectedVal.reqTelNo);
                $("#ddctId").val(selectedVal.ddctId);
            }
        }
        ,columns:[
            {title:"", width:40, _field:"_checkAll"
                ,attributes:{"class":"ac"}, _field:"_checkAll"
                ,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' />"
                ,headerTemplate:"<input type='checkbox' class='checkAll' />"
            }
            ,{field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"statCd", title:"<spring:message code='ser.lbl.OldItemstatNm' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=statCdGrid(statCd)#"
            }//상태
            ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dealerCo' />", width:80, attributes:{"class":"ac"}}//딜러사
            ,{field:"dlrNm", title:"<spring:message code='sal.lbl.dlrNm' />", width:120, attributes:{"class":"al"}}//딜러명칭
            ,{field:"returnDt", title:"<spring:message code='ser.lbl.receivableDt' />", width:100//클레임일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:100,attributes:{"class":"ac"}}//클레임번호
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.oitemCd' />", width:100,attributes:{"class":"ac"}}//부품코드
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200,attributes:{"class":"ac"}}//부품명칭
            ,{field:"claimQty", title:"<spring:message code='ser.lbl.qty' />", width:100//수량
                ,attributes:{"class":"ac"}
                ,editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtNumericTextBox({
                                min:0,
                                decimals:0,
                                spinners:false,
                                change:function(e)
                                {
                                    if(Number(this.value())-Number(options.model.claimQty)>0){
                                    options.model.collcQty = options.model.claimQty;
                                    $("#grid").data("kendoExtGrid").refresh();
                                    }
                                }
                            });
                         }
            }
            ,{field:"collcQty", title:"<spring:message code='ser.lbl.recQty' />", width:100,attributes:{"class":"ac"}}//회수수량
            ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:100,attributes:{"class":"ac"}}//단위
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:180,attributes:{"class":"ac"} }//VIN
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />", width:100, format:"{0:n0}" ,attributes:{"class":"ac"}}//주행거리
            ,{field:"reqNm", title:"<spring:message code='sal.lbl.requestUsr' />", width:100,attributes:{"class":"ac"}}//요청자
            ,{field:"reqDt", title:"<spring:message code='ser.lbl.reqDt' />", width:100//요청일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"reqDeptCd", title:"<spring:message code='ser.lbl.reqDept' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=deptCdGrid(reqDeptCd)#"
            }//요청부서
        ]

    });


//############################################################################
//체크박스 세팅
//############################################################################

    //체크박스 세팅
    gridCheckBoxSet = function(uid , checked){
        var grid = $("#grid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var rows = grid.tbody.find("tr[data-uid=" + uid + "]");
        if(checked){
            $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", true);
            $(".grid-checkbox-item[data-uid=" + uid + "]").addClass("k-state-selected");
        }else{
            $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked", false);
            $(".grid-checkbox-item[data-uid=" + uid + "]").removeClass("k-state-selected");
        }

    };

    //그리드 헤더CheckBox 클릭이벤트
    $(".checkAll").on("click" , function(e){

        var grid = $("#grid").data("kendoExtGrid");
        var checked = $(this).is(":checked");
        var rows = grid.tbody.find("tr");
        var uid = $(this).attr("data-uid");
        var chkRows = grid.tbody.find("tr[data-uid=" + uid + "]");

        if(checked){
            rows.each(function(index, row) {
                var dataItem = grid.dataSource._data;
                if( dataItem[index].statCd == "04" ){
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", true);
                    $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
                }
            });
        }else{
            grid.clearSelection();
            rows.each(function(index, row) {
            var dataItem = grid.dataSource._data;
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").prop("checked", false);
                $(".grid-checkbox-item[data-uid=" + dataItem[index].uid + "]").addClass("k-state-selected");
            });
        }
    });

    //그리드 선택 이벤트
    $("#grid").on("click", "tr.k-state-selected", function (e) {

        var grid = $("#grid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var chkBoolean = true;
        if(selectedVal != null){
            var uid = selectedVal.uid;
            if( selectedVal.statCd == "04" ){
                chkBoolean = $(".grid-checkbox-item[data-uid=" + uid + "]").prop("checked") ? false : true;
                gridCheckBoxSet(uid , chkBoolean);
            }
        }
    });

    //체크박스 선택이벤트
    $("#grid").on("click", ".grid-checkbox-item", function(e){
        var checked = $(this).is(":checked");

        var grid = $("#grid").data("kendoExtGrid");

        var chkBoolean = true;
        var uid = $(this).attr("data-uid");
        var rows = grid.tbody.find("tr");
        rows.each( function(index , obj){
            var dataItem = grid.dataSource._data;
            if( uid  == dataItem[index].uid){
                $(grid.tbody.find("tr[data-uid=" + dataItem[index].uid  + "]")).toggleClass("k-state-selected");
            }else{
                $(grid.tbody.find("tr[data-uid=" + dataItem[index].uid + "]")).removeClass("k-state-selected");
            }
        });

        gridCheckBoxSet($(this).attr("data-uid") , checked);

    });


});


</script>


