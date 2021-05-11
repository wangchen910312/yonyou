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
        <div class="btn_right">
            <button id="btnCreate" class="btn_m"><spring:message code='global.btn.policyInput' /></button>          <!-- 정책입력 -->
            <button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
        </div>
    </div>
    <div class="table_form form_width_40per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
               <tr>
                    <th scope="row"><spring:message code='global.lbl.applNumber' /></th>   <!-- 신청번호 -->
                    <td>
                        <input id="sReqNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>   <!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carType' /></th>    <!-- 차량유형 -->
                    <td>
                        <input id="sTpCd" class="form_comboBox" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.fincReqDt' /></th>    <!-- 신청일자 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartReqDt" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndReqDt" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.statNm' /></th>    <!-- 상태 -->
                    <td>
                        <input id="sApproveCd" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
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


// 구원차/대부차량 신청 팝업
var popupWindow;
function selectAskHelpCarJudgePopupWindow(data){
    var sDlrCd = data.dlrCd
      , sDlrNm = data.dlrNm
      , usrId  = data.usrId
      , usrNm  = data.usrNm
      , reqNo  = data.reqNo;

    popupWindow = dms.window.popup({
        windowId:"askHelpCarPopup"
        ,title:"<spring:message code='sal.title.askHelpCarJudge' />"   // 구원차/대부차 심사
        ,width :800
        ,height:470
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


    //$("#sDlrCd").val(dlrCd);

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
                        params["sApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();
                        // 심사여부
                        //params["sEvalRsltYn"] = $("#sEvalRsltYn").data("kendoExtDropDownList").value();

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
                        ,approveCd:{type:"string"}        //승인여부(상태)
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
       ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:480
       ,editable   :false
       ,autoBind   :false
       ,navigatable:true
       ,selectable :"row"
       ,columns:[
          {field:"reqNo", title:"<spring:message code='global.lbl.applNumber' />", sortable:false, width:90, attributes:{"class":"ar"}, hidden:true}       // 요청번호

          ,{field:"reqCarNo", title:"<spring:message code='global.lbl.applNumber' />"
              ,width:60
              ,headerAttributes:{style:"text-align:center;"}
              ,attributes:{ "style":"text-align:center"}
           }  // 신청번호
          ,{field:"distCd", title:"<spring:message code='global.lbl.dist' />", width:80, attributes:{"class":"ac"}, template:"#= dms.string.strNvl(distCdObj[distCd]) #"}       //딜러지역
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}       // 딜러코드
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:100}       // 딜러명
          //,{field:"usrId", hidden:true}       // 사용자ID
          //,{field:"usrNm", hidden:true}       // 사용자
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
              field:"approveCd"
             ,title:"<spring:message code='global.lbl.statNm' />"
             ,width:100
             ,attributes:{"class":"ac"}
             ,template:"#=dms.string.strNvl( stateTpObj[approveCd] )  #"
          }
          ,{
              field:"carImgYn"
              , title:"<spring:message code='sal.lbl.carImgUploadYn' />"
              , width:120
              , attributes:{"class":"ac"}
          }     // 차량자료등록 여부 - 上牌资料
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
             , width:180
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
