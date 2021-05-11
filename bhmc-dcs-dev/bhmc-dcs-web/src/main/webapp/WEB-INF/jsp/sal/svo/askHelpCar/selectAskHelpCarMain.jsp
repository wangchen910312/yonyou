<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<!-- 구원차/대부차 신청 -->
<div id="resizableContainer">
<section class="group">
	<div class="header_area">
        <h1 class="title_basic"><spring:message code='sal.title.askHelpCar' /></h1> <!-- 구원차/대부차 신청 -->
		<div class="btn_right">
			<button id="btnCreate" class="btn_m"><spring:message code='global.lbl.registration' /></button>   <!-- 등록 -->
			<button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
		</div>
	</div>
	<div class="table_form form_width_40per">
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
					<th scope="row"><spring:message code='global.lbl.statNm' /></th>      <!-- 상태 -->
					<td>
                        <input id="sApproveCd" class="form_comboBox" />
                    </td>
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
<!-- //구원차/대부차량신청 -->

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

// 딜러코드 , 사용자
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";

//현재일자
var toDay = "${toDay}";
var oneDay = "${oneDay}";

// 상태 SAL141
var stateTpDSList = [];
var stateTpObj = {};
<c:forEach var="obj" items="${stateTpDS}">
    stateTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    stateTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
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
var askGubunTpDSList = [];
var askGubunTpObj = {};
<c:forEach var="obj" items="${askGubunTpDS}">
    askGubunTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    askGubunTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 구원차/대부차량 신청 팝업
var popupWindow;
function selectAskHelpCarPopupWindow(data){
    var sDlrCd = dlrCd
      , sDlrNm = dlrNm
      , usrId  = userId
      , usrNm  = userNm
      , reqNo = 0
      , sHeight = 450;

    if(typeof(data) != "undefined" ){
        sDlrCd = data.dlrCd;
        sDlrNm = data.dlrNm;
        usrId  = data.usrId;
        usrNm  = data.usrNm;
        reqNo = data.reqNo;
        if(data.approveCd == "C" || data.approveCd == "D"){
            sHeight = 500;
        }
    }
    if( typeof($("#askHelpCarPopup").data("kendoWindow")) != "undefined"){
        $("#askHelpCarPopup").data("kendoWindow").setOptions({height:sHeight});
    }

    popupWindow = dms.window.popup({
        windowId:"askHelpCarPopup"
        ,title:"<spring:message code='sal.title.askHelpCar' />"   // 구원차/대부차 신청
        ,width :800
        ,height:sHeight
        ,resizable:false
        //,modal:true
        ,content:{
            url:"<c:url value='/sal/svo/askHelpCar/selectAskHelpCarPopup.do'/>"
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
                        $('#grid').data('kendoExtGrid').dataSource.read();

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
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnCreate").kendoButton({ // 팝업호출
        enable:true,
        click:function(e){
            selectAskHelpCarPopupWindow();
        }
    });

    // 상태
    $("#sApproveCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stateTpDSList
       ,optionLabel:" "   // 전체
    });

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
    //$("#sStartReqDt").on('change', fnChkDateValue);
    //$("#sEndReqDt").on('change', fnChkDateValue);

    // 시작일은 종료일보다 클수가 없다.
    $("#sStartReqDt").on('change', fnChkSearchDate);
    $("#sEndReqDt").on('change', fnChkSearchDate);


    // 차량유형
    $("#sTpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:typeTpDSList
       ,optionLabel:" "   // 전체
    });


    // 메인 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115207"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/askHelpCar/selectAskHelpCars.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 딜러코드
                        params["sDlrCd"] = dlrCd;
                        // 상태
                        params["sApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();
                        // 차량유형
                        params["sTpCd"] = $("#sTpCd").data("kendoExtDropDownList").value();
                        // 등록일자
                        //params["sStartReqDt"] = $("#sStartReqDt").val();
                        //params["sEndReqDt"]   = $("#sEndReqDt").val();
                        params["sStartReqDt"] = $("#sStartReqDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndReqDt"]   = $("#sEndReqDt").data("kendoExtMaskedDatePicker").value();

                        //console.log('params:',kendo.stringify(params) );
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
                        dlrCd :{type:"string", editable:false} //딜러코드
                        ,usrId:{type:"string"}            //사용자ID
                        ,reqNo:{type:"number"}           //요청번호

                        ,tpCd:{type:"string"}             //유형코드(차량유형)
                        ,salePrsnNm:{type:"string"}       //판매담당자명
                        ,salePrsnTelNo:{type:"string"}    //판매담당자전화번호
                        ,reqTp:{type:"string"}            //요청유형(신청구분)
                        ,reqDt:{type:"date"}               //요청일자(등록일자)
                        ,evalDt:{type:"date"}             //심사일자
                        ,spcCarQty:{type:"number"}        //수량
                        ,approveCd:{type:"string"}        //승인여부(상태)
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
       ,appendEmptyColumn:true          //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:480
       ,editable:false
       ,autoBind:true
       ,navigatable:true
       ,selectable:"row"
       //,edit:onEditMainCd
       ,columns:[
          {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true, width:100}       // 딜러코드
    //      ,{field:"usrId", hidden:true}       // 사용자ID
     //     ,{field:"reqNo", hidden:true}       // 요청번호

          ,{  // 차량유형
              field:"tpCd"
             ,title:"<spring:message code='global.lbl.carType' />"
             ,sortable:false
             ,width:130
             ,attributes:{"class":"ac"}
             ,template:"#=typeTpObj[tpCd]#"
          }
          ,{  //판매담당자명
              field:"salePrsnNm"
             ,title:"<spring:message code='global.lbl.salPrsnNm' />"
             ,width:130
             ,attributes:{"class":"ac"}
          }
          ,{  //판매담당자전화번호
              field:"salePrsnTelNo"
             ,title:"<spring:message code='global.lbl.salPrsnNm' /> <spring:message code='sal.lbl.helpCarTelNumer' />"
             ,width:150
             ,attributes:{"class":"ac"}
          }
          ,{  //신청구분
              field:"reqTp"
             ,title:"<spring:message code='global.lbl.reqTpn' />"
             ,width:120
             ,attributes:{"class":"ac"}
             ,template:"#= askGubunTpObj[reqTp] #"
          }
          ,{  //등록일자
              field:"reqDt"
             ,title:"<spring:message code='global.lbl.fincReqDt' />"    //타이틀을 신청일자로 변경(합의된 내용) 2016.04.11
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
          ,{  //수량
              field:"spcCarQty"
             ,title:"<spring:message code='global.lbl.qty' />"
             ,width:50
             ,attributes:{"class":"ac"}
          }
          ,{  //상태
              field:"approveCd"
             ,title:"<spring:message code='global.lbl.statNm' />"
             ,width:90
             ,attributes:{"class":"ac"}
             ,template:"#=stateTpObj[approveCd]#"
          }
          ,{
              field:"fileNm"
              , title:"<spring:message code='sal.lbl.askCarImgFile' />"
              , width:200
              , attributes:{"class":"al"}
              , template:"#= fn_file(fileNm, fileDocNo, fileNo)#"
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

       selectAskHelpCarPopupWindow(selectedItem);
   });

});

//alert( dms.data.arrayToMap(askGubunTpDSList, function(obj){ return obj.cmmCd; }) );

// 날짜 검증
/*
function fnChkDateValue(e){
    var chkDateValue = dms.string.checkDate($(this),$(this).val(),'date');

    if(!chkDateValue.result){
        var chkArgs = chkDateValue.resultArgs;

        if(dms.string.isEmpty(chkArgs)){
            dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        }else{
            dms.notification.warning("<spring:message code='global.err.checkDateExceedParam' arguments='" + chkArgs + "'/>");
        }
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
    }else{
        $(this).data("kendoExtMaskedDatePicker").value(new Date(chkDateValue.resultMsg));
    }
}
*/

// 검색조건:계약일자의 시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
    if(dms.string.isEmpty($(this).val())){return;}

    var startDt = $("#sStartReqDt").data("kendoExtMaskedDatePicker").value();
    var endDt = $("#sEndReqDt").data("kendoExtMaskedDatePicker").value();
    if(startDt > endDt){
        dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
        $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
        $(this).focus();
    }
}

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

function gridReLosd(){
    $("#grid").data("kendoExtGrid").dataSource._destroyed = [];
    $("#grid").data("kendoExtGrid").dataSource.page(1);
}

</script>
<!-- //script -->
</body>
</html>
