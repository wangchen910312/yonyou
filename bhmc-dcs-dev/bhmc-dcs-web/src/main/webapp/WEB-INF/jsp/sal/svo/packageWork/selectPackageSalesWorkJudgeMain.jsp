<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 집단판매업무심사 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.packageSalesWorkJudge' /></h1> <!-- 집단판매업무심사 -->
        <div class="left_area">
            <span class="txt_label bg_green">${userId} : Lv${usrEvalGrade}</span>
        </div>
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12400" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button> <!-- 조회 -->
		</dms:access>
        </div>
    </div>
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
               <%--  <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col style="width:17%;">
                <col style="width:8%;">
                <col> --%>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.applNumber' /></th> <!-- 신청번호 -->
                    <td>
                        <input id="sReqSeq" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.officeNm' /></th> <!-- 사무소 -->
                    <td>
                        <input id="sOffCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th> <!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.reqDt' /></th> <!-- 신청일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sReqStartDt" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sReqEndDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.evalYn" /></th> <!-- 심사여부 -->
                    <td>
                        <input name="sEvalRsltYn" id="sEvalRsltYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.statNm' /></th> <!-- 상태 -->
                    <td>
                        <input id="sApproveCd" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
</section>
</div>
<!-- //집단판매업무심사 -->

<!-- script -->
<script>
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
var usrEvalGrade = "${usrEvalGrade}";
var loginUsrId = "${userId}";

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";
var wrkDstinCd = "${wrkDstinCd}";

//현재일자
var toDay = "${toDay}";
// 해당월 1일
var oneDay = "${oneDay}";

//상태 SAL184
var stateTpDSList = [];
var stateTpObj = {};
<c:forEach var="obj" items="${stateTpDS}">
  <c:if test="${obj.cmmCd ne 'A'}">
    stateTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  </c:if>
    stateTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//항목 SAL151
var atcDstinCdDSList = [];
var atcDstinCdObj = {};
<c:forEach var="obj" items="${atcDstinCdDS}">
    atcDstinCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    atcDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//판매지역(딜러지역) SAL146
var distCdDSList = [];
var distCdObj = {};
<c:forEach var="obj" items="${distCdDS}">
    distCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    distCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//심사여부 SAL145
var evalRsltYnList = [];
<c:forEach var="obj" items="${evalYnInfo}">
evalRsltYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var evalRsltYnArr = dms.data.arrayToMap(evalRsltYnList, function(obj){return obj.cmmCd;});

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//사업부
/* var sdptDs = [];
<c:forEach var="obj" items="${sdptList}">
    sdptDs.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
</c:forEach> */

//사무소
var officeList = [];
<c:forEach var="obj" items="${officeList}">
    officeList.push({"distOfficeCd":"${obj.distOfficeCd}", "distOfficeNm":"${obj.distOfficeNm}"});
</c:forEach>

// 집단판매업무심사
var popupWindow;
function selectPackageSalesWorkJudgePopupWindow(data){

    popupWindow = dms.window.popup({
        windowId:"packageSalesWorkJudgePopup"
        ,title:"<spring:message code='sal.title.packageSalesWorkJudge' />"   // 집단판매업무신청
        ,width :800
        ,height:600
        ,draggable:true
        ,modal:true
        ,resizable:false
        ,visible:false
        ,content:{
            url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWorkJudgePopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":false
                ,"sData":data
                ,"callbackFunc":function(data){
                    $('#grid').data('kendoExtGrid').dataSource.page(1);
                    popupWindow.close();
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    //if (data.msg == "save"){
                    //}
                }
            }
        }

    });
}

// 검색조건:계약일자의 시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
    if(dms.string.isEmpty($(this).val())){return;}
    var startDt = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
    var endDt = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();

    if(startDt > endDt){
        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
        $(this).focus();
    }
};

$(document).ready(function() {

    //사업부
    /*
    $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"sdptNm"
       ,dataValueField:"sdptCd"
       ,dataSource:sdptDs
       ,optionLabel:" "   // 전체
       ,select:function(e){
           var dataItem = this.dataItem(e.item);
           $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOffCd").data("kendoExtDropDownList").enable(true);

           if(dataItem.sdptCd == ""){
               $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOffCd").data("kendoExtDropDownList").enable(false);
               return false;
           }

           var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
               ,data:JSON.stringify({"sSdptCd":dataItem.sdptCd})
               ,async:false
           });
           $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
       }
    });
 */
    // 사무소
    $("#sOffCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
       ,dataValueField:"distOfficeCd"
       ,dataSource:officeList
       ,optionLabel:" "   // 전체
       //,enable:false
    });

    // 조회
    $("#btnSearch").kendoButton({
        enable:true,
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);

        }
    });

    // 상태
    $("#sApproveCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stateTpDSList
       ,optionLabel:" "           //선택
       //,value:"B"
    });

    /**
     * 심사여부 콤보박스
     */
     $("#sEvalRsltYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:evalRsltYnList
        ,optionLabel:" "  // 전체
        ,value : "02"
     });

    //등록일자:시작일
    $("#sReqStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    // 등록일자:종료일
    $("#sReqEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });

    // 시작일은 종료일보다 클수가 없다.
    $("#sReqStartDt").on('change', fnChkSearchDate);
    $("#sReqEndDt").on('change', fnChkSearchDate);

   /*  //차종
    $("#sCarlineCd").kendoExtDropDownList({
       dataTextField:"carlineNm"
      ,dataValueField:"carlineCd"
      ,dataSource:carLineCdList
      ,optionLabel:" "   // 전체
      ,select:function(e){
          $("#sModelCd").data("kendoExtDropDownList").setDataSource([]);
          $("#sModelCd").data("kendoExtDropDownList").enable(true);

          var dataItem = this.dataItem(e.item);
          var responseJson = dms.ajax.getJson({
              url:"<c:url value='/sal/cnt/contract/selectModel.do' />"
              ,data:JSON.stringify({"carlineCd":dataItem.carlineCd})
              ,async:false
          });
          $("#sModelCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
      }
    });

    // 모델
    $("#sModelCd").kendoExtDropDownList({
        dataTextField:"modelNm"
       ,dataValueField:"modelCd"
       ,optionLabel:" "   // 전체
       ,select:function(e){
           $("#sOcnCd").data("kendoExtDropDownList").setDataSource([]);
           $("#sOcnCd").data("kendoExtDropDownList").enable(true);
       }
    });
    $("#sModelCd").data("kendoExtDropDownList").enable(false);
 */

    // 그리드 더블클릭
    $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#grid").data("kendoExtGrid");
        var selectedItem = grid.dataItem(grid.select());
        selectPackageSalesWorkJudgePopupWindow(selectedItem);
    });

 // 메인 그리드
    $("#grid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-SAL-0721-115501"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWorkJudge.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;


                        params["sReqSeq"] = $("#sReqSeq").val();//신청번호
                        //params["sDiviCd"] = $("#sDiviCd").data("kendoExtDropDownList").value();// 사업부
                        params["sOffCd"] = $("#sOffCd").data("kendoExtDropDownList").value();// 사무소
                        params["sDlrCd"] = $("#sDlrCd").val();// 딜러코드
                        params["sApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();// 상태
                        //등록일자
                        params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();
                        //로그인 USER 심사등급
                        params["sUsrEvalGrade"] = usrEvalGrade;
                        params["sWrkDstinCd"] = wrkDstinCd;
                        params["sEvalRsltYn"] = $("#sEvalRsltYn").data("kendoExtDropDownList").value();

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"reqSeq",
                    fields:{
                          dlrCd      :{type:"string"} //딜러코드
                        , distCd     :{type:"string"} //딜러지역
                        , dlrNm      :{type:"string"} //딜러이름
                        , usrId      :{type:"string"} //사용자id
                        , reqSeq     :{type:"number"} //신청번호
                        , atcDstinCd :{type:"string"} //항목
                        , custNm     :{type:"string"} //고객명
                        , reqDt      :{type:"date"}   //등록일자
                        , approveEndDt :{type:"date"}
                        , approveCd  :{type:"string"} //상태
                        , approveYn  :{type:"string"} //심사여부
                        , sumQty     :{type:"number"} //총수량
                        , evalYn     :{type:"string"} //심사여부
                        , reqNo      :{type:"number"} //심사번호
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:false
       ,editable:false
       ,pageable:true
       ,autoBind:false
       ,navigatable:true
       ,selectable:"row"
       ,appendEmptyColumn:true
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[
           {field:"reqSalNo", title:"<spring:message code='global.lbl.applNumber' />", width:150, attributes:{"class":"ac"}}        // 신청번호
          ,{field:"sdptNm", title:"<spring:message code='global.lbl.division' />", width:80, attributes:{"class":"ac"},hidden:true}            // 사업부
          ,{field:"officeNm", title:"<spring:message code='crm.lbl.officeNm' />", width:80, attributes:{"class":"ac"}}           // 사무소
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}                // 딜러코드
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:250, attributes:{"class":"al"}}                // 딜러명
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:250, attributes:{"class":"al"}}              // 고객명
          ,{field:"atcDstinCd",title:"<spring:message code='global.lbl.item' />",width:100,template:"#=atcDstinCdObj[atcDstinCd]#"} // 항목
          ,{field:"sumQty", title:"<spring:message code='global.lbl.qty' />", width:80, attributes:{"class":"ar"}, format:"{0:n0}"} // 수량
          ,{field:"reqDt", title:"<spring:message code='sal.lbl.reqDt' />", width:120, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"} //신청일자
          ,{field:"approveEndDt", title:"<spring:message code='global.lbl.approveDt' />", width:120, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"} //신청일자
          ,{field:"approveCd",title:"<spring:message code='global.lbl.statNm' />", width:100, attributes:{"class":"ac"}             // 상태
             ,template:"#=stateTpObj[approveCd]#"
          }
          ,{field:"evalYn", title:"<spring:message code='sal.lbl.evalYn' />", width:100, attributes:{"class":"ac"}                  // 심사여부
              ,template:"# if(evalRsltYnArr[evalYn] != null) { # #= evalRsltYnArr[evalYn].cmmCdNm# # }#"
          }
          ,{field:"usrId", hidden:true}       // 사용자ID
          ,{field:"evalGradeCd",width:60, hidden:true}           // 심사일련번호
       ]
   });

});
</script>