<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 이월판매취소결과조회 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.lbl.tranfSaleSearch" /></h1><!-- 이월판매취소결과조회 -->
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:18%;">
                <col style="width:10%;">
                <col style="width:17%;">
                <col style="width:10%;">
                <col style="width:17%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.cancReason' /></th><!-- 판매취소사유 -->
                    <td >
                        <input id="sCancReasonCd" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.evalRsltChoice' /></th><!-- 심사여부 -->
                    <td >
                        <input id="sApproveYn" type="text" class="form_comboBox">
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th><!-- 신청일자 -->
                    <td colspan="3">
                        <div class="date_left">
                            <input id="sReqStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from">~</span>
                        </div>
                        <div class="date_right">
                            <input id="sReqEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.approveDt' /></th><!-- 승인일자 -->
                    <td colspan="3">
                        <div class="date_left">
                            <input id="sApproveStartDt" data-type="maskDate" class="form_datetimepicker">
                            <span class="txt_from" >~</span>
                        </div>
                        <div class="date_right">
                            <input id="sApproveEndDt" data-type="maskDate" class="form_datetimepicker">
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->


    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->


</section>
</div>




<!-- script -->
<script>
var oneDay = "${oneDay}";       // 해당월 1일
var lastDay = "${lastDay}";     // 해당월 마지막일자



//판매취소사유 Array(SAL130)
var cancReasonCdDs = [];
<c:forEach var="obj" items="${cancReasonCdList}">
    cancReasonCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//판매취소사유 Map
var cancReasonCdMap = dms.data.arrayToMap(cancReasonCdDs, function(obj){ return obj.cmmCd; });


//심사여부 Array(SAL131)
var approveYnDs = [];
<c:forEach var="obj" items="${approveYnList}">
    approveYnDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//심사여부 Map
var approveYnMap = dms.data.arrayToMap(approveYnDs, function(obj){ return obj.cmmCd; });


//주문유형(오더유형) Array(SAL138)
var ordTpDs = [];
<c:forEach var="obj" items="${ordTpList}">
    var cmmCdNm = "[" + "${obj.cmmCd}" + "]" + "${obj.cmmCdNm}"
    ordTpDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//주문유형 Map
var ordTpMap = dms.data.arrayToMap(ordTpDs, function(obj){ return obj.cmmCd; });



//요청상태 Array(SAL154)
var reqStatCdDs = [];
<c:forEach var="obj" items="${reqStatCdList}">
    reqStatCdDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//요청상태 Map
var reqStatCdMap = dms.data.arrayToMap(reqStatCdDs, function(obj){ return obj.cmmCd; });



//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>



$(document).ready(function() {

    //차종
    $("#sCarlineCd").kendoExtDropDownList({
        dataTextField:"carlineNm"
       ,dataValueField:"carlineCd"
       ,dataSource:carLineCdList
       ,optionLabel:" "   // 전체
    });


    //취소사유
    $("#sCancReasonCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:cancReasonCdDs
       ,optionLabel:" "   // 전체
    });


    //승인상태
    $("#sApproveYn").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:approveYnDs
       ,optionLabel:" "   // 전체
    });



    //조회조건 - 신청일자(기간)- START
    $("#sReqStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 신청일자(기간)- END
    $("#sReqEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:lastDay
    });

    // 조회조건 - 시작일, 종료일
    $("#sReqStartDt").on('change', {from:$("#sReqStartDt"), to:$("#sReqEndDt")}, fnChkSearchDate);
    $("#sReqEndDt").on('change',   {from:$("#sReqStartDt"), to:$("#sReqEndDt")}, fnChkSearchDate);



    //조회조건 - 승인일자(기간)- START
    $("#sApproveStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });

    //조회조건 - 승인일자(기간)- END
    $("#sApproveEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:lastDay
    });

    // 조회조건 - 시작일, 종료일
    $("#sApproveStartDt").on('change', {from:$("#sApproveStartDt"), to:$("#sApproveEndDt")}, fnChkSearchDate);
    $("#sApproveEndDt").on('change',   {from:$("#sApproveStartDt"), to:$("#sApproveEndDt")}, fnChkSearchDate);



    /*************************** 검색 조건 영역 END **************************************************/

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    /*******************  //버튼   *******************************************/



    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113328"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/dlv/cancDelivery/selectCancDelivery.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarlineCd"]    = $("#sCarlineCd").data("kendoExtDropDownList").value();                   // 차종
                        params["sCancReasonCd"] = $("#sCancReasonCd").data("kendoExtDropDownList").value();                // 취소사유
                        params["sApproveYn"]    = $("#sApproveYn").data("kendoExtDropDownList").value();                   // 승인상태
                        params["sReqStartDt"]   = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();           // 신청일자 - 시작일
                        params["sReqEndDt"]     = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();             // 신청일자 - 종료일
                        params["sApproveStartDt"]= $("#sApproveStartDt").data("kendoExtMaskedDatePicker").value();      // 승인상태 - 시작일
                        params["sApproveEndDt"] = $("#sApproveEndDt").data("kendoExtMaskedDatePicker").value();         // 승인상태 - 종료일

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"contractNo"
                    ,fields:{
                        contractNo :{type:"string"}
                        ,rnum      :{type:"number"}
                        ,reqDt     :{type:"date"}
                        ,approveDt :{type:"date"}
                        ,dlrCd     :{type:"string"}
                        ,realDlDt  :{type:"date"}
                        ,ordTp     :{type:"string"}
                        //,custNm    :{type:"string"}
                        ,carlineNm :{type:"string"}
                        ,modelNm   :{type:"string"}
                        ,modelCd   :{type:"string"}
                        ,ocnNm     :{type:"string"}
                        ,extColorNm:{type:"string"}
                        ,intColorNm:{type:"string"}
                        ,approveYn :{type:"string"}
                        ,vinNo1    :{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:false
        //,height:428
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                    {field:"rnum"     ,title:"<spring:message code = 'global.lbl.noName'/>"   ,width:50  ,attributes:{"class":"ac"}} //순번
                    ,{field:"reqDt",title:"<spring:message code = 'global.lbl.fincReqDt'/>" ,width:80  ,attributes:{"class":"ac"}  //신청일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"reqStatCd",title:"<spring:message code = 'global.lbl.reqStat'/>" ,width:80  ,attributes:{"class":"ac"}  //요청상태
                        ,template:"# if(reqStatCdMap[reqStatCd] != null){# #= reqStatCdMap[reqStatCd].cmmCdNm# #}#"
                     }
                    ,{field:"approveDt"    ,title:"<spring:message code = 'global.lbl.approveDt'/>" ,width:80  ,attributes:{"class":"ac"}  //승인일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"dlrCd"       ,title:"<spring:message code = 'global.lbl.dlrCd'/>"      ,width:80  ,attributes:{"class":"ac"}} //딜러코드
                    ,{field:"realDlDt"    ,title:"<spring:message code = 'global.lbl.giDocRegDt'/>" ,width:80  ,attributes:{"class":"ac"}  //출고일자
                        ,format:"{0:<dms:configValue code='dateFormat' />}"
                     }
                    ,{field:"ordTp"     ,title:"<spring:message code = 'global.lbl.orderType'/>", width:100, attributes:{"class":"al"}
                        ,template:"# if(ordTpMap[ordTp] != null){# #= ordTpMap[ordTp].cmmCdNm# #}#"
                     }
                    //,{field:"custNm"       ,title:"<spring:message code = 'global.lbl.custNm'/>"      ,width:80  ,attributes:{"class":"ac"}} //고객명
                    ,{field:"contractNo"       ,title:"<spring:message code = 'global.lbl.contractNo'/>"      ,width:100  ,attributes:{"class":"ac"}} //계약번호
                    ,{field:"carlineNm"     ,title:"<spring:message code = 'global.lbl.carLine'/>"      ,width:80  ,attributes:{"class":"al"}} //차종
                    ,{field:"cancReasonCd"    ,title:"<spring:message code = 'global.lbl.cancReasonCd'/>" ,width:100  ,attributes:{"class":"ac"}  //취소사유
                        ,template:"# if(cancReasonCdMap[cancReasonCd] != null){# #= cancReasonCdMap[cancReasonCd].cmmCdNm# #}#"
                     }
                    ,{field:"vinNo1"       ,title:"VIN_NO"      ,width:140  ,attributes:{"class":"ac"}} //VIN1
                    ,{field:"modelNm"       ,title:"<spring:message code = 'global.lbl.model'/>"        ,width:150  ,attributes:{"class":"al"}} //차관
                    ,{field:"ocnNm"         ,title:"<spring:message code = 'global.lbl.ocn' />"         ,width:150  ,attributes:{"class":"al"}} //OCN
                    ,{field:"extColorNm"    ,title:"<spring:message code = 'global.lbl.extColor'/>"     ,width:120  ,attributes:{"class":"al"}} //외장색
                    ,{field:"intColorNm"    ,title:"<spring:message code = 'global.lbl.intColor'/>"     ,width:120  ,attributes:{"class":"al"}} //내장색

                ]
    });




});


//조회조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
  if(dms.string.isEmpty(e.data.from.val())){return;}
  if(dms.string.isEmpty(e.data.to.val())){return;}

  var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
  var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
  if(startDt > endDt){
      dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
      $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
      $(this).focus();
  }
}






</script>
<!-- //script -->