<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 집단판매업무심사 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.packageSalesWorkJudge' /></h1>      <!-- 집단판매업무심사 -->
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>      <!-- 조회 -->
        </div>
    </div>
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:23%;">
                <col style="width:9%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:7%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.applNumber' /></th>      <!-- 신청번호 -->
                    <td>
                        <input id="sReqSeq" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.distOffice' /></th>      <!-- 사무처 -->
                    <td>
                        <input id="sDistCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>      <!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" class="form_input" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.reqDt' /></th>       <!-- 신청일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sReqStartDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sReqEndDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th> <!-- 차종 -->
                    <td>
                        <input id="sCarlineCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.model' /></th>    <!-- 모델 -->
                    <td>
                        <input id="sModelCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.statNm' /></th>        <!-- 상태 -->
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

//딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

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

//차종
var carLineCdList = [];
<c:forEach var="obj" items="${carLineCdInfo}">
    carLineCdList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
</c:forEach>

//판매지역(딜러지역) SAL146
var distCdDSList = [];
var distCdObj = {};
<c:forEach var="obj" items="${distCdDS}">
    distCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    distCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 집단판매업무심사
var popupWindow;
function selectPackageSalesWorkJudgePopupWindow(data){
    var sDlrCd  = dlrCd
      , sDlrNm  = dlrNm
      , sUsrId  = userId
      , sUsrNm  = userNm
      , sReqSeq = 0
      , sCarlineCd = "";

    if(typeof(data) != "undefined" ){
        sDlrCd     = data.dlrCd;
        sDlrNm     = data.dlrNm;
        sUsrId     = data.usrId;
        sUsrNm     = data.usrNm;
        sReqSeq    = data.reqSeq;
        sCarlineCd = data.carlineCd;
    }

    popupWindow = dms.window.popup({
        windowId:"packageSalesWorkJudgePopup"
        ,title:"<spring:message code='sal.title.packageSalesWorkJudge' />"   // 집단판매업무신청
        ,width :800
        ,height:515
        //,resizable:false
        ,content:{
            url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWorkJudgePopup.do'/>"
            ,data:{
                "type":null
                ,"autoBind":false

                ,"sDlrCd":sDlrCd                    // 딜러코드
                ,"sDlrNm":sDlrNm                    // 딜러명
                ,"sUsrId":sUsrId                    // 사용자id
                ,"sUsrNm":sUsrNm                    // 사용자id
                ,"sReqSeq":sReqSeq                  // 일련번호

                ,"callbackFunc":function(data){
                    if (data.msg == "save"){
                        $('#grid').data('kendoExtGrid').dataSource.read();
                        popupWindow.close();

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                }
            }
        }

    });
}

$(document).ready(function() {
    // 조회
    $("#btnSearch").kendoButton({
        enable:true,
        click:function(e){
            var fromDt = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sReqStartDt").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sReqEndDt").focus();
               return false;
            }

            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sReqEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sReqEndDt").focus();
               return false;
            }
            
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

    //딜러지역
    $("#sDistCd").kendoExtDropDownList({
         dataTextField :"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:distCdDSList
        ,optionLabel:" "           //선택
     });

    // 상태
    $("#sApproveCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stateTpDSList
       ,optionLabel:" "           //선택
       ,value:"B"
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

    //차종
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
                        params["sort"] = options.sort;

                        //신청번호
                        params["sReqSeq"] = $("#sDlrCd").val();
                        //딜러지역
                        params["sDistCd"] = $("#sDistCd").data("kendoExtDropDownList").value();
                        // 딜러코드
                        params["sDlrCd"] = $("#sDlrCd").val();
                        // 상태
                        params["sApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();
                        //등록일자
                        params["sReqStartDt"] = $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();
                        params["sReqEndDt"] = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();
                        //차종
                        params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();
                        //모델
                        params["sModelCd"] = $("#sModelCd").data("kendoExtDropDownList").value();

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
                          dlrCd       :{type:"string"}           //딜러코드
                        , distCd      :{type:"string"}           //딜러지역
                        , dlrNm       :{type:"string"}           //딜러이름
                        , usrId       :{type:"string"}           //사용자id
                        , reqSeq      :{type:"number"}           //신청번호
                        , atcDstinCd  :{type:"string"}           //항목
                        , carlineCd   :{type:"string"}           //차종코드
                        , carlineNm   :{type:"string"}           //차종
                        , modelCd     :{type:"string"}           //모델코드
                        , modelNm     :{type:"string"}           //모델
                        , appQty     :{type:"number"}            //수량
                        , custNm     :{type:"string"}            //고객명
                        , reqDt      :{type:"date"}              //등록일자
                        , approveCd  :{type:"string"}            //상태
                        , approveYn  : {type:"string"}           //심사여부
                        , carCnt     :{type:"number"}            //차종수
                        , sumQty     :{type:"number"}            //총수량
                    }
                }
            }
        }
       ,multiSelectWithCheckbox:false
       //,height:160
       ,editable:false
       ,pageable:false
       ,autoBind:false
       ,navigatable:true
       ,selectable:"row"
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[
          {  // 딜러지역(사무처)
              field:"distCd"
             ,title:"<spring:message code='sal.lbl.distOffice' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,template:"#=dms.string.strNvl(distCdObj[distCd])#"
          }
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}       // 딜러코드
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:100, attributes:{"class":"ac"}}       // 딜러명
          ,{field:"usrId", hidden:true}       // 사용자ID
          ,{field:"reqSeq", title:"<spring:message code='global.lbl.applNumber' />", width:100, attributes:{"class":"ar"}}       // 신청번호
          ,{  // 항목
              field:"atcDstinCd"
             ,title:"<spring:message code='global.lbl.item' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,template:"#=atcDstinCdObj[atcDstinCd]#"
          }
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine' />", width:100, attributes:{"class":"ac"}}                 // 차종
          //,{field:"carlineNm", title:"<spring:message code='global.lbl.carlineNm' />", width:200, attributes:{"class":"al"}}               // 차종명
          ,{field:"modelNm", title:"<spring:message code='global.lbl.model' />", width:150, attributes:{"class":"ac"}}                     // 모델
          //,{field:"modelNm", title:"<spring:message code='global.lbl.modelNm' />", width:200, attributes:{"class":"al"}}                   // 모델명
          ,{field:"appQty", title:"<spring:message code='global.lbl.qty' />", width:100, attributes:{"class":"ar"}, format:"{0:n0}"}     // 수량
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:150, attributes:{"class":"al"}}                     // 고객명
          ,{field:"reqDt", title:"<spring:message code='sal.lbl.reqDt' />", width:150, attributes:{"class":"ac"}, format:"{0:"+vDtyyyyMMdd+"}"} //신청일자
          ,{  // 상태
              field:"approveCd"
             ,title:"<spring:message code='global.lbl.statNm' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,template:"#=stateTpObj[approveCd]#"
          }
          ,{    //심사여부
               field:"approveYn"
              ,title:"<spring:message code='sal.lbl.evalYn' />"
              ,width:100
              ,attributes:{"class":"ac"}
              ,template:"#= (approveCd == 'C' || approveCd == 'D') ? 'Y' : 'N' #"
          }
          ,{field:"carCnt", title:"<spring:message code='sal.lbl.carlineCount'/>", width:50, attributes:{"class":"ar"}, format:"{0:n0}", hidden:true}     // 차종수
          ,{field:"sumQty", title:"<spring:message code='par.lbl.itemInnerOutTotQty'/>", width:50, attributes:{"class":"ar"}, format:"{0:n0}", hidden:true}     // 총수량
       ]
   });

   // 그리드 더블클릭
   $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#grid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       selectPackageSalesWorkJudgePopupWindow(selectedItem);
   });


});
</script>
<!-- //script -->