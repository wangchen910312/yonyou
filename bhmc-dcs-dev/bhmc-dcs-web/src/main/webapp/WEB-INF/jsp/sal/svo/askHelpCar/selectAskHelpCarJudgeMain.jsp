<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 구원차/대부차량 심사 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.askHelpCarJudge' /></h1> <!-- 구원차/대부차량 심사 -->
        <div class="left_area">
            <span class="txt_label bg_green">${userId} : Lv${usrEvalGrade}</span>
        </div>
        <div class="btn_right">
        <dms:access viewId="VIEW-I-12399" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnCreate" class="btn_m"><spring:message code='global.btn.policyInput' /></button>          <!-- 정책입력 -->
        </dms:access>
        <dms:access viewId="VIEW-I-12398" hasPermission="${dms:getPermissionMask('READ')}">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
        </dms:access>
        <button class="btn_m" id="btnExcel"><spring:message code="global.btn.excelExport" /></button> <!-- 엑셀다운로드 -->
        </div>
    </div>
    <div class="table_form form_width_40per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:19%;">
                <col style="width:10%;">
                <col style="width:14%;">
                <col style="width:9%;">
                <col style="width:14%;">
                <col style="width:9%;">
                <col>
            </colgroup>
            <tbody>
               <tr>
                    <th scope="row"><spring:message code='sal.lbl.sdpt' /></th><!-- 사업부 -->
                    <td>
                        <input id="sDiviCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='crm.lbl.officeNm' /></th><!-- 사무소 -->
                    <td>
                        <input id="sOffCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>   <!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.statNm' /></th>    <!-- 상태 -->
                    <td>
                        <input id="sApproveCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>    <!-- 신청일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartReqDt" class="form_datepicker ac">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndReqDt" class="form_datepicker ac">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.applNumber' /></th>   <!-- 신청번호 -->
                    <td>
                        <input id="sReqNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.carImgUploadYn' /></th>    <!-- 차량등록여부 -->
                    <td>
                        <input id="sCarImgYn" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carType' /></th>    <!-- 차량유형 -->
                    <td>
                        <input id="sTpCd" class="form_comboBox" />
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
<!-- //구원차/대부차량 심사 -->

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

// 딜러코드
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";

// 사용자
var userId = "${userId}";
var userNm = "${userNm}";

//현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

// 상태 SAL141 (A 제외)
var stateTpDSList = [];
var stateTpObj = {};
<c:forEach var="obj" items="${stateTpDS}">
    <c:if test="${obj.cmmCd ne 'A'}">
        stateTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        stateTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>

//심사여부 SAL145
var approveDSList = [];
var approveObj = {};
<c:forEach var="obj" items="${approveDS}">
    approveDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    approveObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 차량유형 SAL142 (시승차:N7 제외)
var typeTpDSList = [];
var typeTpObj = {};
<c:forEach var="obj" items="${typeTpDS}">
    <c:if test="${obj.cmmCd ne 'N7'}">
        typeTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        typeTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:if>
</c:forEach>

// 신청구분 SAL143
//var askGubunTpDSList = [];
var askGubunTpObj = {};
<c:forEach var="obj" items="${askGubunTpDS}">
    //askGubunTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    askGubunTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 판매지역 SAL146
//var distCdDSList = [];
var distCdObj = {};
<c:forEach var="obj" items="${distCdDS}">
    //distCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    distCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>


//여부(Y/N) COM020
var ynList = [];
var ynObj = {};
<c:forEach var="obj" items="${ynDs}">
  ynList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
  ynObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

//사업부
var sdptList = [];
<c:forEach var="obj" items="${sdptList}">
    sdptList.push({"sdptCd":"${obj.sdptCd}", "sdptNm":"${obj.sdptNm}"});
</c:forEach>


// 구원차/대부차량 신청 팝업
var popupWindow;
function selectAskHelpCarJudgePopupWindow(data){
    var sDlrCd = data.dlrCd
      , sDlrNm = data.dlrNm
      , usrId  = data.usrId
      , usrNm  = data.usrNm
      , reqNo  = data.reqNo
      , useApproveCd  = data.useApproveCd // //Q21012900014 DCS代步车审批加控制 代步车审批明细弹窗打开时要对审批结果做判断显示，当单据状态是否决时，需要显示成灰色。目前是可操作的状态。jiaMing 2021-2-8

    popupWindow = dms.window.popup({
        windowId:"askHelpCarPopup"
        ,title:"<spring:message code='sal.title.askHelpCarJudge' />"   // 구원차/대부차 심사
        ,width :800
        ,height:420
        ,modal:true
        ,content:{
            url:"<c:url value='/sal/svo/askHelpCar/selectAskHelpCarJudgePopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":false

                ,"dlrCd":sDlrCd                   // 딜러코드
                ,"dlrNm":sDlrNm                   // 딜러명
                ,"usrId":usrId                    // 사용자id
                ,"usrNm":usrNm                    // 사용자id
                ,"reqNo":reqNo                    // 요청번호
                ,"useApproveCd":useApproveCd     // //Q21012900014 DCS代步车审批加控制 代步车审批明细弹窗打开时要对审批结果做判断显示，当单据状态是否决时，需要显示成灰色。目前是可操作的状态。jiaMing 2021-2-8
                ,"callbackFunc":function(data){
                    if (data.msg == "save"){
                        $('#grid').data('kendoExtGrid').dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                 }
            }
        }

    });
}

$(document).ready(function() {

    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    $("#btnCreate").kendoButton({ // 정책입력 팝업 호출
        enable:true,
        click:function(e){

            popupWindow = dms.window.popup({
                windowId:"policyInputPopup"
                ,title:"<spring:message code='global.title.policyInput' />"   // 정책입력
                ,width :600
                ,height:200
                ,modal:true
                ,content:{
                    url:"<c:url value='/sal/svo/askHelpCar/selectPolicyInputPopup.do'/>"
                    ,data:{
                        "type":null
                        ,"autoBind":false
                        ,"callbackFunc":function(data){
                           if (data.msg == "save"){
                                $('#grid').data('kendoExtGrid').dataSource.read();
                            }
                        }
                    }
                }

            });
        }
    });

    // 차량유형
    $("#sTpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:typeTpDSList
       ,optionLabel:" "   // 전체
    });

    // 상태
    $("#sApproveCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stateTpDSList
       ,optionLabel:" "   // 전체
    });
    $("#sApproveCd").data("kendoExtDropDownList").value("B");

    // 차량등록여부
    $("#sCarImgYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:ynList
       ,optionLabel:" "   // 전체
    });

    //승인결과
    /*
    $("#sEvalRsltYn").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:[{cmmCdNm:"<spring:message code="global.btn.approval" />", cmmCd:"Y"}, {cmmCdNm:"<spring:message code="global.btn.nonApproval" />", cmmCd:"N"}]     //승인:Y , 불승인:N
       ,optionLabel:" "   // 전체
    }); */

    // 등록일자 시작일
    $("#sStartReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
   });


    // 등록일자 종료일
    $("#sEndReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
   });

    //사업부
    $("#sDiviCd").kendoExtDropDownList({
        dataTextField:"sdptNm"
       ,dataValueField:"sdptCd"
       ,dataSource:sdptList
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

          /*  var responseJson = dms.ajax.getJson({
               url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
               ,data:JSON.stringify({"sSdptCd":dataItem.sdptCd})
               ,async:false
           }); */

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
                   $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
                   $("#sOffCd").data("kendoExtDropDownList").enable(true);
               }

           //$("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
           });

        }
    });

    // 사무소
    $("#sOffCd").kendoExtDropDownList({
        dataTextField:"distOfficeNm"
       ,dataValueField:"distOfficeCd"
       //,dataSource:officeList
       ,select:function(e){
           var dataItem = this.dataItem(e.item);

           /* $.ajax({
               url : "<c:url value='/sal/cmm/selectDealerSung.do'/>",
               data : JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":dataItem.distOfficeCd}),
               type : "POST",
               dataType : "json",
               contentType : "application/json",
               async : false,
               error : function(jqXHR,status,error) {

               },
               success : function(data) {
                   var responseJson = JSON.parse(JSON.stringify(data));
                   $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
               }
           });
           */

       }
       ,optionLabel:" "   // 전체
       ,enable:false
    });


    //버튼 - 엑셀다운로드
    $("#btnExcel").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"askHelpCarService"
                ,"templateFile":"AskHelpCarJudgeMainList_Tpl.xlsx"
                ,"fileName"     :"AskHelpCarJudge.xlsx"
                //Q21020200018 DCS中有17个模块的下载文件名不是模块名称，而是英文或数字，需要调整为模块名称。 jiaMing 2021-2-3 start
                 ,"fileName":"<spring:message code='sal.info.askHelpCarJudge' />.xlsx"
                //Q21020200018 DCS中有17个模块的下载文件名不是模块名称，而是英文或数字，需要调整为模块名称。 jiaMing 2021-2-3 end
                //,"fileName"   :"<spring:message code='sal.title.askHelpCarJudge' />.xlsx"
                ,"sReqCarNo"    :$("#sReqNo").val()
                ,"sDlrCd"       :$("#sDlrCd").val()
                ,"sTpCd"        :$("#sTpCd").val()
                ,"sStartReqDt"  :$("#sStartReqDt").val()
                ,"sEndReqDt"    :$("#sEndReqDt").val()
                ,"sUseApproveCd":$("#sApproveCd").val()
                ,"sDiviCd"      :$("#sDiviCd").val()
                ,"sOffCd"       :$("#sOffCd").val()
                ,"sCarImgYn"    :$("#sCarImgYn").val()
            });
        }
    });


    // 메인 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115206"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/askHelpCar/selectAskHelpCarJudges.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sReqCarNo"] = $("#sReqNo").val();      //신청번호
                        params["sDlrCd"] = $("#sDlrCd").val();      // 딜러코드
                        params["sTpCd"] = $("#sTpCd").data("kendoExtDropDownList").value();    // 차량유형
                        // 등록일자
                        params["sStartReqDt"] = $("#sStartReqDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndReqDt"]   = $("#sEndReqDt").data("kendoExtMaskedDatePicker").value();
                        // 상태
                        params["sUseApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();
                        params["sDiviCd"]       = $("#sDiviCd").data("kendoExtDropDownList").value();
                        params["sOffCd"]        = $("#sOffCd").data("kendoExtDropDownList").value();
                        // 심사여부
                        //params["sApprovesCd"] = $("#sApprovesCd").data("kendoExtDropDownList").value();

                        // 심사여부
                        //params["sEvalRsltYn"] = $("#sEvalRsltYn").data("kendoExtDropDownList").value();

                        //차량등록여부
                        params["sCarImgYn"] = $("#sCarImgYn").data("kendoExtDropDownList").value();

                        //console.log('grid params:',kendo.stringify(params) );
                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"reqNo",
                    fields:{
                         reqNo:{type:"number"}           //요청번호
                        ,distCd :{type:"string"}        //딜러지역
                        ,dlrCd :{type:"string", editable:false} //딜러코드
                        ,dlrNm :{type:"string"}           //딜러명칭
                        ,usrId :{type:"string"}           //사용자ID
                        ,usrNm :{type:"string"}           //사용자명
                        ,tpCd:{type:"string"}             //유형코드(차량유형)
                        ,salePrsnNm:{type:"string"}       //판매담당자명
                        ,salePrsnTelNo:{type:"string"}    //판매담당자전화번호
                        ,reqTp:{type:"string"}            //요청유형(신청구분)
                        ,spcCarQty:{type:"number"}        //수량
                        ,reqDt:{type:"date"}               //요청일자(등록일자)
                        ,evalDt:{type:"date"}             //심사일자
                        ,useApproveCd:{type:"string"}     //심사상태
                        ,approvesCd:{type:"string"}       //심사여부
                        ,carImgYn       :{type:"string"}
                        ,fileNm         :{type:"string"}
                        ,fileDocNo      :{type:"string"}
                        ,fileNo         :{type:"string"}
                        ,fileUploadDt   :{type:"date"}
                        ,fileUploadDtFormat:{type:"date", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.fileUploadDtFormat = kendo.parseDate(elem.fileUploadDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
//       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:480
       ,editable   :false
       ,autoBind   :false
       ,navigatable:true
       ,scrollable:true
       ,selectable :"row"
       ,columns:[
          {field:"reqNo", title:"<spring:message code='global.lbl.applNumber' />", sortable:false, width:70, attributes:{"class":"ar"}, hidden:true}       // 요청번호
          ,{field:"sdptNm", title:"<spring:message code='global.lbl.division' />", width:80, attributes:{"class":"ac"}}    // 사업부
          ,{field:"officeNm", title:"<spring:message code='sal.lbl.officeNm' />",width:80, attributes:{"class":"ac"}}		// 사무소
          ,{field:"reqCarNo", title:"<spring:message code='global.lbl.applNumber' />"
              ,width:120
              ,headerAttributes:{style:"text-align:center;"}
              ,attributes:{ "style":"text-align:center"}
           }  // 신청번호
          ,{field:"distCd", title:"<spring:message code='global.lbl.dist' />", width:80, attributes:{"class":"ac"} //딜러지역
              ,template:"#= dms.string.strNvl(distCdObj[distCd]) #"
              ,hidden:true
           }
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}       // 딜러코드
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:100}       // 딜러명
          ,{  // 차량유형
              field:"tpCd"
             ,title:"<spring:message code='global.lbl.carType' />"
             ,sortable:false
             ,width:80
             ,attributes:{"class":"ac"}
             ,template:"#=typeTpObj[tpCd]#"
          }
          ,{  //오더발행자
              field:"salePrsnNm"
             ,title:"<spring:message code='global.lbl.chrgCd' />"
             ,width:100
             ,attributes:{"class":"ac"}
          }
          ,{  //전화번호
              field:"salePrsnTelNo"
             ,title:"<spring:message code='global.lbl.telNumer' />"
             ,width:130
             ,attributes:{"class":"ac"}
          }
          ,{  //신청구분
              field:"reqTp"
             ,title:"<spring:message code='global.lbl.reqTpn' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,template:"#= askGubunTpObj[reqTp] #"
          }
          ,{  //수량
              field:"spcCarQty"
             ,title:"<spring:message code='global.lbl.qty' />"
             ,width:70
             ,attributes:{"class":"ac"}
          }
          ,{  //등록일자
              field:"reqDt"
             ,title:"<spring:message code='global.lbl.fincReqDt' />"   //타이틀만 신청일자로 변경(합의된 내용 ) 2016.04.11
             ,width:100
             ,attributes:{"class":"ac"}
             ,format:"{0:"+vDtyyyyMMdd+"}"
          }
          ,{  //심사일자
              field:"evalDt"
             ,title:"<spring:message code='global.lbl.evalDt' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,format:"{0:"+vDtyyyyMMdd+"}"
          }
          ,{  //상태
              field:"useApproveCd"
             ,title:"<spring:message code='global.lbl.statNm' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,template:"#=dms.string.strNvl( stateTpObj[useApproveCd] )  #"
          }
          ,{  //심사여부
              field:"approvesCd"
             ,title:"<spring:message code='global.lbl.evalRsltChoice' />"
             ,width:100
             ,template:"#=dms.string.strNvl( approveObj[approvesCd] )  #"
             ,attributes:{"class":"ac"}, hidden:true
          }
          ,{
              field:"carImgYn"
              , title:"<spring:message code='sal.lbl.carImgUploadYn' />"
              , width:120
              , attributes:{"class":"ac"}
              , filterable:{
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
              , template:"#= dms.string.strNvl( ynObj[carImgYn] ) #"
          }     // 차량자료등록 여부
          ,{
              field:"fileNm"
              , title:"<spring:message code='sal.lbl.askCarImgFile' />"
              , width:200
              , attributes:{"class":"al"}
              , template:"#= fn_file(fileNm, fileDocNo, fileNo)#"
              , hidden:true
          }     // 인수차량 이미지
          ,{field:"fileDocNo", hidden:true}           // 문서번호
          ,{field:"fileNo", hidden:true}              // 파일번호
          ,{
              field:"fileUploadDtFormat"
             ,title:"<spring:message code='sal.lbl.askCarImgFileUploadDt' />"
             ,width:180
             ,attributes:{"class":"ac tooltip-disabled"}
             ,template:"#= dms.string.strNvl(kendo.toString(data.fileUploadDt, '<dms:configValue code='dateTimeFormat' />')) #"
          } // 인수차량 이미지 업로드시간
       ]
   });

   // 그리드 더블클릭
   $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#grid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       selectAskHelpCarJudgePopupWindow(selectedItem);
   });

});

//파일표현
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


</script>
<!-- //script -->
</body>
</html>