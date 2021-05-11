<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

<script type="text/javascript">
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

// 차량유형 SAL142 (시승차:N7)
var typeTpDSList = [];
var typeTpObj = {};
<c:forEach var="obj" items="${typeTpDS}">
    typeTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    typeTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 신청구분 SAL143
var askGubunTpObj = {};
<c:forEach var="obj" items="${askGubunTpDS}">
    askGubunTpObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 판매지역 SAL146
//var distCdDSList = [];
var distCdObj = {};
<c:forEach var="obj" items="${distCdDS}">
    //distCdDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    distCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/************* 보충자료 SELECT BOX  *******************/
var fileYnList = [];
<c:forEach var="obj" items="${fileYnInfo}">
fileYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var fileYnArr = dms.data.arrayToMap(fileYnList, function(obj){return obj.cmmCd});

// file 유/무 
var fileCdList = [{"cmmCd":"Y", "cmmCdNm":"<spring:message code='sal.lbl.yes' />"}, {"cmmCd":"N", "cmmCdNm":"<spring:message code='sal.lbl.none' />"}];
var fileCdObj = {};
    fileCdObj["Y"] = "<spring:message code='sal.lbl.yes' />";
    fileCdObj["N"] = "<spring:message code='sal.lbl.none' />";

/************* 보충자료 SELECT BOX  *******************/

/************* 합격여부 SELECT BOX  *******************/
var evalRsltYnList = [];
<c:forEach var="obj" items="${evalRsltYnInfo}">
evalRsltYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var evalRsltYnArr = dms.data.arrayToMap(evalRsltYnList, function(obj){return obj.cmmCd});
/************* 합격여부 SELECT BOX  *******************/

</script>

    <!-- 시승차량 심사 -->
<div id="resizableContainer">
	<section class="group">
		<div class="header_area">
            <h1 class="title_basic"><spring:message code='sal.title.testDriveVehicleInspection' /></h1> <!-- 시승차량 심사 -->
			<div class="btn_right">
                <button id="btnExcelExport" class="btn_m" type="button"><spring:message code="global.btn.excelExport" /></button>   <!-- 엑셀다운로드 -->
				<button id="btnCreate" class="btn_m" type="button"><spring:message code='global.btn.policyInput' /></button>          <!-- 정책입력 -->
                <button id="btnSearch" class="btn_m btn_search" type="button"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
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
                        <th scope="row"><spring:message code='global.lbl.applNumber' /></th>
                        <td>
                            <input id="sReqNo" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.dlrCd' /></th>
                        <td>
                            <input id="sDlrCd" class="form_input">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.carType' /></th>    <!-- 차량유형 -->
                        <td>
                            <input id="sTpCd" class="form_comboBox">
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
                            <input id="sApproveCd" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.whthrPassing' /></th> <!-- 합격여부 -->
                        <td>
                            <input id="sFsdmAgrYn" class="form_comboBox">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span><spring:message code="global.lbl.spplmntrData" /></span></th> <!-- 보충자료 -->
                        <td>
                            <input name="sFileYn" id="sFileYn" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><span><spring:message code="global.lbl.evalDt" /></span></th> <!-- 심사일자 -->
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input name="sStartEvalDt" id="sStartEvalDt"  class="form_datepicker">
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input name="sEndEvalDt" id="sEndEvalDt"  class="form_datepicker">
                                </div>
                            </div>
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
    <!-- //시승차량 심사 -->


<!-- script -->
<script>

// 시승차량 신청 팝업
var popupWindow;
var popupWindow2;
function selectTestDriveVehicleInspctPopupWindow(data){
    var sDlrCd = data.dlrCd
      , sDlrNm = data.dlrNm
      , usrId  = data.usrId
      , usrNm  = data.usrNm
      , reqNo  = data.reqNo;

    popupWindow = dms.window.popup({
        windowId:"testDriveVehicleInspctPopup"
        ,title:"<spring:message code='sal.title.testDriveVehicleInspection' />"   // 시승차량 심사
        ,width :800
        ,height:540
        ,content:{
            url:"<c:url value='/sal/svo/testDriveVehicle/selectTestDriveVehicleInspctPopup.do'/>"
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

            if( !($("#sStartReqDt").data('kendoExtMaskedDatePicker').value() == null && $("#sEndReqDt").data('kendoExtMaskedDatePicker').value() == null ) ){
                if($("#sStartReqDt").data('kendoExtMaskedDatePicker').value() == null || $("#sEndReqDt").data('kendoExtMaskedDatePicker').value() == null){
                    //등록일자를 입력해 주십시오.
                    dms.notification.warning("<spring:message code='global.lbl.carRegDt' var='carRegDt' /><spring:message code='global.info.validation.required' arguments='${carRegDt}' />");
                    return false;
                }
            }

            if( !($("#sStartEvalDt").data('kendoExtMaskedDatePicker').value() == null && $("#sEndEvalDt").data('kendoExtMaskedDatePicker').value() == null ) ){
                if($("#sStartEvalDt").data('kendoExtMaskedDatePicker').value() == null || $("#sEndEvalDt").data('kendoExtMaskedDatePicker').value() == null){
                    //심사일자를 입력해 주십시오.
                    dms.notification.warning("<spring:message code='global.lbl.evalDt' var='evalDt' /><spring:message code='global.info.validation.required' arguments='${evalDt}' />");
                    return false;
                }
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    $("#btnCreate").kendoButton({ // 정책입력 팝업 호출
        enable:true,
        click:function(e){

            popupWindow2 = dms.window.popup({
                windowId:"policyInputPopup"
                ,title:"<spring:message code='global.title.policyInput' />"   // 정책입력
                ,width :600
                ,height:200
                ,modal:true
                ,content:{
                    url:"<c:url value='/sal/svo/testDriveVehicle/selectPolicyInputPopup.do'/>"
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

    //버튼 - 엑셀다운로드
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"testDriveVehicleInspctService"
                ,"templateFile":"TestDriveList_Tpl.xlsx"
                ,"fileName":"ExcelDown.xlsx"
                ,"sDlrCd":dlrCd
                ,"sApproveCd":$("#sApproveCd").data("kendoExtDropDownList").value()
                ,"sTpCd":$("#sTpCd").data("kendoExtDropDownList").value()
                ,"sStartReqDt":$("#sStartReqDt").data("kendoExtMaskedDatePicker").value()
                ,"sEndReqDt":$("#sEndReqDt").data("kendoExtMaskedDatePicker").value()
                ,"sReqNo":$("#sReqNo").val()
                ,"sStartEvalDt":$("#sStartEvalDt").data("kendoExtMaskedDatePicker").value()
                ,"sEndEvalDt":$("#sEndEvalDt").data("kendoExtMaskedDatePicker").value()
                ,"sFsdmAgrYn":$("#sFsdmAgrYn").data("kendoExtDropDownList").value()
                ,"sFileYn":$("#sFileYn").data("kendoExtDropDownList").value()
            });
        }
    });


    // 차량유형
    $("#sTpCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:typeTpDSList
       ,value:'N7'
       ,enabled:false
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

    /**
     * 보충자료 콤보박스
     */
     $("#sFileYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:fileCdList
        ,optionLabel:" "  // 전체
        ,value:'N'
     });

    /**
     * 합격여부 콤보박스
     */
     $("#sFsdmAgrYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:evalRsltYnList
        ,optionLabel:" "  // 전체
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

    /**
     * 시작 심사일자 (From)
     */
    $("#sStartEvalDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });
    /**
     * 종료 심사일자 (From)
     */
    $("#sEndEvalDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });

    //$("#sDlrCd").val(dlrCd);

    // 메인 그리드
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115504"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/testDriveVehicle/selectTestDriveVehicleInspct.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sReqNo"] = $("#sReqNo").val();      //신청번호
                        params["sDlrCd"] = $("#sDlrCd").val();      // 딜러코드
                        params["sTpCd"] = $("#sTpCd").data("kendoExtDropDownList").value();    // 차량유형
                        // 등록일자
                        params["sStartReqDt"] = $("#sStartReqDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndReqDt"]   = $("#sEndReqDt").data("kendoExtMaskedDatePicker").value();
                        // 상태
                        params["sApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();

                        // 심사여부
                        //params["sEvalRsltYn"] = $("#sEvalRsltYn").data("kendoExtDropDownList").value();

                        // 합격여부
                        params["sFsdmAgrYn"] = $("#sFsdmAgrYn").data("kendoExtDropDownList").value();

                        // 보충자료
                        params["sFileYn"] = $("#sFileYn").data("kendoExtDropDownList").value();

                        // 심사일자
                        params["sStartEvalDt"] = $("#sStartEvalDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndEvalDt"]   = $("#sEndEvalDt").data("kendoExtMaskedDatePicker").value();

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
                        ,reqCarNo:{type:"string"}         //요청번호 (딜러코드+년월+SEQ)
                        ,distCd :{type:"string"}        //딜러지역
                        ,dlrCd :{type:"string", editable:false} //딜러코드
                        ,dlrNm :{type:"string"}           //딜러명칭
                        ,usrId :{type:"string"}           //사용자ID
                        ,usrNm :{type:"string"}           //사용자명
                        ,tpCd:{type:"string"}             //유형코드(차량유형)
                        ,salePrsnNm:{type:"string"}       //판매담당자명
                        ,salePrsnTelNo:{type:"string"}    //판매담당자전화번호
                        ,reqTp:{type:"string"}            //요청유형(신청구분)
                        ,fileYn:{type:"string"}           //보충자료
                        ,spcCarQty:{type:"number"}        //수량
                        ,reqDt:{type:"date"}               //요청일자(등록일자)
                        ,evalDt:{type:"date"}             //심사일자
                        ,approveCd:{type:"string"}        //승인여부(상태)
                        ,evalRsltYn:{type:"string"}       //심사여부
                        ,fsdmAgrYn:{type:"string"}        //합격여부
                        ,updtUsrId:{type:"string"}        //수정자ID
                        ,updtDt:{type:"date"}             //수정일자
                    }
                }
            }
        }
       ,height:430
       ,multiSelectWithCheckbox:false
       ,editable   :false
       ,autoBind   :false
       ,navigatable:true
       ,selectable :"row"
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,columns:[
          {field:"reqNo", title:"<spring:message code='global.lbl.applNumber' />", width:70, hidden:true}       // 요청번호
          ,{field:"reqCarNo", title:"<spring:message code='global.lbl.applNumber' />"
              ,width:120
              ,headerAttributes:{style:"text-align:center;"}
              ,attributes:{ "style":"text-align:center"}
          }  // 신청번호
          ,{field:"distCd", title:"<spring:message code='sal.lbl.distOffice' />", width:80, attributes:{"class":"ac"}, template:"#=dms.string.strNvl(distCdObj[distCd])#"}       //딜러지역
          ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, attributes:{"class":"ac"}}       // 딜러코드
          ,{field:"dlrNm", title:"<spring:message code='global.lbl.dlrNm' />", width:100, attributes:{"class":"ac"}}       // 딜러이름
          ,{field:"usrId", hidden:true}       // 사용자ID
          ,{field:"usrNm", hidden:true}       // 사용자
          ,{field:"tpCd",title:"<spring:message code='global.lbl.carType' />",sortable:false,width:80  // 차량유형
             ,attributes:{"class":"ac"}
             ,template:"#=dms.string.strNvl(typeTpObj[tpCd])#"
          }
          ,{field:"salePrsnNm",title:"<spring:message code='global.lbl.prsNm' />",width:100,attributes:{"class":"ac"}}//담당자
          ,{field:"salePrsnTelNo",title:"<spring:message code='sal.lbl.telNo' />",width:120,attributes:{"class":"ac"}}//전화번호
          ,{field:"reqTp",title:"<spring:message code='global.lbl.reqTpn' />",width:100,attributes:{"class":"ac"}     //신청구분
             ,template:"#= askGubunTpObj[reqTp] #"
          }
          ,{field:"fileYn", title:"<spring:message code='sal.lbl.fileYn' />",width:75 // 첨부파일유무
              ,template:"#if(fileYn != null){# #= fileCdObj[fileYn] # #}#"
              ,attributes:{"class":"ac"}
          }  
          ,{field:"spcCarQty",title:"<spring:message code='global.lbl.qty' />",width:70,attributes:{"class":"ac"}}//수량
          ,{field:"reqDt",title:"<spring:message code='global.lbl.fincReqDt' />",width:100 //등록일자  타이틀만 신청일자로 바꿈 (협의된 내용) 2016.04.11
             ,attributes:{"class":"ac"}
             ,format:"{0:"+vDtyyyyMMdd+"}"
          }
          ,{field:"evalDt",title:"<spring:message code='global.lbl.evalDt' />",width:100  //심사일자
             ,attributes:{"class":"ac"}
             ,format:"{0:"+vDtyyyyMMdd+"}"
          }
          ,{field:"approveCd",title:"<spring:message code='global.lbl.statNm' />",width:100  //상태
             ,attributes:{"class":"ac"}
             ,template:"#=dms.string.strNvl( stateTpObj[approveCd] )  #"
          }
          ,{field:"evalRsltYn",title:"<spring:message code='global.lbl.evalRsltChoice' />",width:100,attributes:{"class":"ac"},hidden:true}//심사여부
          ,{field:"fsdmAgrYn",title:"<spring:message code='global.lbl.whthrPassing' />",width:100
             ,template:"#if(fsdmAgrYn != null){# #= evalRsltYnArr[fsdmAgrYn].cmmCdNm # #}#"
             ,attributes:{"class":"ac"}
          }//합격여부
          ,{field:"updtUsrId",title:"updtUsrId",sortable:false,width:0,hidden:true}//수정자ID
          ,{field:"updtDt",title:"updtDt",sortable:false,width:0,hidden:true}//수정일자
       ]
   });

   // 그리드 더블클릭
   $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#grid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       selectTestDriveVehicleInspctPopupWindow(selectedItem);
   });
});

</script>
<!-- //script -->
</body>
</html>
