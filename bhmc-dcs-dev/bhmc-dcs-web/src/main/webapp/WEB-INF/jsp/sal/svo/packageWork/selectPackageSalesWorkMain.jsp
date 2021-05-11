<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 집단판매업무신청 -->
<div id="resizableContainer">
	<section class="group">
		<div class="header_area">
	        <h1 class="title_basic"><spring:message code='sal.title.packageSalesWork' /></h1>           <!-- 집단판매업무신청 -->
			<div class="btn_right">
	            <button id="btnCreate" class="btn_m"><spring:message code='global.lbl.registration' /></button>         <!-- 등록 -->
				<button id="btnSearch" class="btn_m btn_search"><spring:message code='global.btn.search' /></button>    <!-- 조회 -->
			</div>
		</div>
		<div class="table_form form_width_100per">
			<table>
				<caption></caption>
				<colgroup>
					<col style="width:8%;">
					<col style="width:15%;">
					<col style="width:8%;">
					<col style="width:23%;">
					<col style="width:7%;">
					<col style="width:16%;">
					<col style="width:7%;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><spring:message code='global.lbl.statNm' /></th>        <!-- 상태 -->
						<td>
	                        <input id="sApproveCd" class="form_comboBox" />
	
	                    </td>
						<th scope="row"><spring:message code='global.lbl.reqDt' /></th>      <!-- 신청일자 -->
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
	                    <th scope="row"><spring:message code='global.lbl.carLine' /></th>   <!-- 차종 -->
	                    <td>
	                        <input id="sCarlineCd" class="form_comboBox" />
	                    </td>
	                    <th scope="row"><spring:message code='global.lbl.model' /></th>     <!-- 모델 -->
	                    <td>
	                        <input id="sModelCd" class="form_comboBox" />
	                    </td>
					</tr>
				</tbody>
			</table>
		</div>
	
	    <div class="txt_total">
	        <p>Total:<span id="qtyTot">0</span></p>
	    </div>
	    <div class="table_grid">
	        <div id="grid" class="resizable_grid"></div>
	    </div>
	</section>
</div>
<!-- //집단판매업무신청 -->

<script>
var toDay = "${toDay}";			//현재일자
var oneDay = "${oneDay}";		//해당월1일
var dlrCd  = "${dlrCd}";
var dlrNm  = "${dlrNm}";
var userId = "${userId}";
var userNm = "${userNm}";
var popupWindow;



//상태 SAL184
var stateTpDSList = [];
var stateTpObj = {};
<c:forEach var="obj" items="${stateTpDS}">
    stateTpDSList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
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



$(document).ready(function() {

    // 상태
    $("#sApproveCd").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:stateTpDSList
       ,optionLabel:" "           //선택
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

	
    /************************************************************************* 검색조건 영역 END **************************************************************************/
	
    $("#btnSearch").kendoButton({ // 조회
        enable:true,
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.read();
        }
    });

    $("#btnCreate").kendoButton({ // 팝업호출
        enable:true,
        click:function(e){
        	var grid = $("#grid").data("kendoExtGrid");
            grid.clearSelection();
            selectPackageSalesWorkPopupWindow();
        }
    });


    /************************************************************************* 버튼영역END  **************************************************************************/

    // 메인 그리드
    $("#grid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-SAL-0721-115502"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWork.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sDlrCd"] 	 = dlrCd;														//딜러코드
                        params["sUsrId"]	 = userId;														//유저코드
                     	params["sApproveCd"] = $("#sApproveCd").data("kendoExtDropDownList").value();			//상태
                     	params["sReqStartDt"]= $("#sReqStartDt").data("kendoExtMaskedDatePicker").value();	//등록일자 - 시작일
                     	params["sReqEndDt"]  = $("#sReqEndDt").data("kendoExtMaskedDatePicker").value();    //등록일자 - 종료일
                     	params["sCarlineCd"] = $("#sCarlineCd").data("kendoExtDropDownList").value();			//차종
                     	params["sModelCd"] 	 = $("#sModelCd").data("kendoExtDropDownList").value();			//모델
	
                     	
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
                        , usrId       :{type:"string"}           //사용자id
                        , reqSeq      :{type:"number"}           //신청번호
                        , atcDstinCd  :{type:"string"}           //항목
                        , carlineCd   :{type:"string"}           //차종코드
                        , carlineNm   :{type:"string"}           //차종
                        , modelCd     :{type:"string"}           //모델코드
                        , modelNm     :{type:"string"}           //모델
                        , appQty      :{type:"number"}           //수량
                        , custNm      :{type:"string"}           //고객명
                        , reqDt       :{type:"date"}             //등록일자
                        , approveCd   :{type:"string"}           //상태
                        , carCnt      :{type:"number"}           //차종수
                        , sumQty      :{type:"number"}           //총수량
                    }
                }
            }
        }
       ,dataBound:function(e) {
           var rows = e.sender.tbody.children();

           var sumQty = 0;
           $.each(rows, function(idx, row){
               var dataItem = e.sender.dataItem(row);

               if(dataItem.sumQty != null){
                   sumQty += Number(dataItem.sumQty);
               }
           });
           $("#qtyTot").text(sumQty);
        }
       ,multiSelectWithCheckbox:false
       //,height:160
       ,editable:false
       ,pageable:false
       //,autoBind:false
       ,navigatable:true
       ,selectable:"row"
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn :true           //빈컬럼 적용. default :false
       ,columns:[
          {field:"dlrCd",  hidden:true}       // 딜러코드
          ,{field:"usrId", hidden:true}       // 사용자ID
          ,{field:"reqSeq", title:"<spring:message code='global.lbl.applNumber'/>", width:120, attributes:{"class":"ac"}}       // 신청번호
          ,{  // 항목
              field:"atcDstinCd"
             ,title:"<spring:message code='sal.lbl.itemTp'/>"
             ,width:180
             ,attributes:{"class":"al"}
             ,template:"#=atcDstinCdObj[atcDstinCd]#"
          }
          ,{field:"carlineNm", title:"<spring:message code='global.lbl.carLine'/>", width:130, attributes:{"class":"al"}, hidden:true}       // 차종
          ,{field:"modelNm", title:"<spring:message code='global.lbl.model'/>", width:220, attributes:{"class":"al"}, hidden:true}       // 모델
          ,{field:"appQty", title:"<spring:message code='global.lbl.qty'/>", width:50, attributes:{"class":"ar"}, format:"{0:n0}", hidden:true}     // 수량
          ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>", width:230, attributes:{"class":"al"}}     // 고객명
          ,{field:"reqDt", title:"<spring:message code='global.lbl.fincReqDt'/>", width:230, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //신청일자
          ,{  // 상태
              field:"approveCd"
             ,title:"<spring:message code='global.lbl.statNm'/>"
             ,width:200
             ,attributes:{"class":"al"}
             ,template:"#=stateTpObj[approveCd]#"
          }
          ,{field:"carCnt", title:"<spring:message code='sal.lbl.carlineCount'/>", width:50, attributes:{"class":"ar"}, format:"{0:n0}", hidden:true}   // 차종수
          ,{field:"sumQty", title:"<spring:message code='par.lbl.itemInnerOutTotQty'/>", width:130, attributes:{"class":"ar"}, format:"{0:n0}"}     // 수량(총수량)
       ]
   });


   // 그리드 더블클릭
   $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
       var grid = $("#grid").data("kendoExtGrid");
       var selectedItem = grid.dataItem(grid.select());

       selectPackageSalesWorkPopupWindow(selectedItem);
   });

});




//집단판매업무신청
function selectPackageSalesWorkPopupWindow(data){
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
        windowId:"packageSalesWorkPopup"
        ,title:"<spring:message code='sal.title.packageSalesWork' />"   // 집단판매업무신청
        ,width :800
        ,height:540
        ,draggable:true
        ,modal:false
        //,resizable:false
        ,content:{
            url:"<c:url value='/sal/svo/packageWork/selectPackageSalesWorkPopup.do'/>"
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

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                }
            }
        }

    });
}

</script>

