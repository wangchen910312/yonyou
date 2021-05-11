<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 클레임 고품 요청 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">

            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.oldItemReqSearch" />(DCS)</h1><!-- 고품요청조회 -->
                <div class="btn_right">
				<dms:access viewId="VIEW-I-12489" hasPermission="${dms:getPermissionMask('READ')}">
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

            <!-- 그리드 시작 -->
            <div class="table_grid mt10">
                <div id="headGrid" class="grid"></div>
            </div>
            <!-- 그리드 시작 -->
            <div class="table_grid mt10">
                <div id="grid" class="grid"></div>
            </div>
            <!-- 그리드 종료 -->
            <input type="hidden" id="dlrCd" name="dlrCd"/>
            <input id="atqReqNo" type="hidden" >
        </section>
    </div>
</div>
<script type="text/javascript">

//요청상태 Array
var statCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${statCdList}">
    statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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
<c:if test="${obj.remark2 eq 'Y' }" >
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
     // 접수여부
    setUseYnMap = function(val){
        var returnVal = "";
        if(dms.string.strNvl(val) != ""){
            if(useYnMap[val] != undefined){
                returnVal =  useYnMap[val].cmmCdNm;
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

    $("#sReqFromDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sReqFromDt}"
    });

    $("#sReqToDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:"${sReqToDt}"
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#headGrid').data('kendoExtGrid').dataSource.page(1);
            $('#grid').data('kendoExtGrid').dataSource.data([]);
            $("#dlrCd").val("");
            $("#atqReqNo").val("");
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //globalNotification.show("저장할 정보가 없습니다.", "info");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/rateMaster/multiRateMasters.do' />",
                    data:JSON.stringify(saveData),
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
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }



        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그리드 설정
    $("#headGrid").kendoExtGrid({
        gridId:"G-SER-0625-103001"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimOldItemManage/selectClaimHeadInfo.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sReqFromDt"]      = $("#sReqFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sReqToDt"]        = $("#sReqToDt").data("kendoExtMaskedDatePicker").value();
                        params["sDlrCd"]          = $("#sDlrCd").val();
                        params["sOlditemStatCd"]  = $("#sOlditemStatCd").data("kendoExtDropDownList").value();
                        params["sStatCd"]         = $("#sStatCd").data("kendoExtDropDownList").value();
                        params["sReqDeptCd"]      = $("#sReqDeptCd").data("kendoExtDropDownList").value();
                        params["sAcceptYn"]       = $("#sAcceptYn").data("kendoExtDropDownList").value();
                        params["sClaimDocNo"]     = $("#sClaimDocNo").val();
                        params["sItemCd"]         = $("#sItemCd").val();
                        params["sField"]          = $("#sField").data("kendoExtDropDownList").value();

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
                        ,atqReqNo:{type:"string"}
                        ,collcQty:{type:"number"}
                        ,claimQty:{type:"number"}
                        ,claimCnt:{type:"number"}
                        ,dlrCnt:{type:"number"}
                        ,vinCnt:{type:"number"}
                        ,reqStatCd:{type:"string"}
                        ,reqId:{type:"string"}
                        ,reqDt:{type:"date"}
                        ,reqDeptCd:{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:false
        ,editable:false
        ,height:250
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
            $("#atqReqNo").val(dataItem.atqReqNo);
            $("#dlrCd").val(dataItem.dlrCd);
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
        ,columns:[
             {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"atqReqNo", title:"<spring:message code='ser.lbl.requestNo' />", width:120, attributes:{"class":"ac"}}//요청번호
            ,{field:"reqStatCd", title:"<spring:message code='ser.lbl.reqStatCd' />", width:80, attributes:{"class":"ac"}
                ,template:"#=statCdGrid(reqStatCd)#"
            }//요처유형
            ,{field:"reqDeptCd", title:"<spring:message code='ser.lbl.reqDept' />", width:80
                , attributes:{"class":"ac"}
                ,template:"#=deptCdGrid(reqDeptCd)#"
            }//요청부서
            ,{field:"reqDt", title:"<spring:message code="ser.lbl.reqDt" />", width:100//요청일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"dlrCnt", title:"<spring:message code='ser.lbl.qty' />", width:80, format:"{0:n0}",attributes:{"class":"ar"} }//딜러수량
            ,{field:"claimQty", title:"<spring:message code='ser.lbl.reqQty' />", width:80, format:"{0:n0}",attributes:{"class":"ar"} }//부품요청수량
            ,{field:"collcQty", title:"<spring:message code='ser.lbl.recQty' />", width:80, format:"{0:n0}" ,attributes:{"class":"ar"} }//부품회수수량
            ,{field:"claimCnt", title:"<spring:message code='ser.lbl.claimItemCnt' />", width:100, format:"{0:n0}" ,attributes:{"class":"ar"} }//클레임건수
            ,{field:"vinCnt", title:"<spring:message code='sal.lbl.carCnt' />", width:100, format:"{0:n0}",attributes:{"class":"ar"} }//차량수량
            ,{field:"rcipId", title:"<spring:message code='ser.lbl.rcipNm' />", width:100 ,attributes:{"class":"al"} }//수취인
            ,{field:"rcipTelNo", title:"<spring:message code='ser.lbl.commMthCd' />", width:180 ,attributes:{"class":"al"} }//연락방식 联系方式
            ,{field:"rcipAddrNm", title:"<spring:message code='ser.lbl.addr' />", width:100 ,attributes:{"class":"al"} }//주소
            ,{field:"expsCmpNm", title:"<spring:message code="ser.lbl.trsfCmpCd" />", width:100 ,attributes:{"class":"al"} }//택배회사
            ,{field:"payTp", title:"<spring:message code="ser.lbl.payMethod" />", width:100 ,attributes:{"class":"al"} }//지불방식
        ]

    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-0625-103122"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/wac/claimOldItemManage/selectOldItemsDetail.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sAtqReqNo"] = $("#atqReqNo").val();
                        params["sDlrCd"] = $("#dlrCd").val();

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
                        ,dlrCd:{type:"string", validation:{required:true}}
                        ,vinNo:{type:"string", editable:false}
                        ,claimDocNo:{type:"string"}
                        ,statCd:{type:"string"}
                        ,atqReqNo:{type:"string"}
                        ,runDistVal:{type:"number"}
                        ,itemCd:{type:"string"}
                        ,itemNm:{type:"string"}
                        ,itemUnitCd:{type:"string"}
                        ,collcQty:{type:"number"}
                        ,claimQty:{type:"number"}
                        ,reqStatCd:{type:"string"}
                        ,reqReasonCont:{type:"string"}
                        ,collcReqDt:{type:"date"}
                        ,reqNm:{type:"string"}
                        ,reqDt:{type:"date"}
                        ,reqDeptCd:{type:"string"}
                        ,collcId:{type:"string"}
                        ,collcDt:{type:"date"}
                        ,dedId:{type:"string"}
                        ,dedDt:{type:"date"}
                        ,giDstinCd:{type:"string"}
                        ,giDt:{type:"date"}
                        ,claimStartDt:{type:"date"}
                        ,giDeptCd:{type:"string"}
                        ,giId:{type:"string"}
                    }
                }
            }
        }
        ,height:300
        ,editable:false
        ,scrollable:true
        ,autoBind:false
        ,sortable:false
        ,selectable:"row"
        ,columns:[
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"statCd", title:"<spring:message code='ser.lbl.OldItemstatNm' />", width:100//상태
                ,attributes:{"class":"ac"}
                ,template:"#=statCdGrid(statCd)#"
            }
            ,{field:"dlrCd", title:"<spring:message code='ser.lbl.dlrCd' />", width:80, attributes:{"class":"ac"}}//딜러사
            ,{field:"dlrNm", title:"<spring:message code='sal.lbl.dlrNm' />", width:80, attributes:{"class":"ar"}}//딜러명칭
            ,{field:"claimStartDt", title:"<spring:message code='ser.lbl.receivableDt' />", width:120//클레임일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{field:"claimDocNo", title:"<spring:message code='ser.lbl.claimNo' />", width:120 ,attributes:{"class":"al"}}//클레임번호
            ,{field:"itemCd", title:"<spring:message code='ser.lbl.oitemCd' />", width:100 ,attributes:{"class":"al"}}//부품코드
            ,{field:"itemNm", title:"<spring:message code='ser.lbl.itemNm' />", width:200 ,attributes:{"class":"al"} }//부품명칭
            ,{field:"claimQty", title:"<spring:message code='ser.lbl.qty' />", width:100 ,attributes:{"class":"ar"} , format:"{0:n0}"}//수량
            ,{field:"collcQty", title:"<spring:message code='ser.lbl.recQty' />", width:100, format:"{0:n0}" ,attributes:{"class":"ar"} }//회수수량
            ,{field:"itemUnitCd", title:"<spring:message code='ser.lbl.unitCd' />", width:100 ,attributes:{"class":"ac"} }//단위
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:180 ,attributes:{"class":"al"} }//VIN
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.runDist' />", width:100, format:"{0:n0}" ,attributes:{"class":"ar"} }//주행거리
            ,{field:"reqNm", title:"<spring:message code='sal.lbl.requestUsr' />", width:100 ,attributes:{"class":"ac"}}//요청자
            ,{field:"reqDt", title:"<spring:message code='ser.lbl.reqDt' />", width:100
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }//요청일자
            ,{field:"reqDeptCd", title:"<spring:message code='ser.lbl.reqDept' />", width:100
                ,attributes:{"class":"ac"}
                ,template:"#=deptCdGrid(reqDeptCd)#"
            }//요청부서
        ]

    });

});

// 요청상태
statCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        returnVal = statCdMap[val].cmmCdNm;
    }
    return returnVal;
}

</script>







