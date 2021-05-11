<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.service-1.0.js' />"></script>

<div id="resizableContainer">
    <div class="content">
        <input type="hidden" id="preRoDocNo" name="preRoDocNo" data-json-obj="true">
        <!-- 보증현황 -->
        <section class="group">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code="ser.title.rpipPreChkStatus" /><!-- 정비미리점검이력현황 --></h1>
                <div class="btn_right">
                    <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
                </div>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col style="width:15%;">
                        <col style="width:9%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.carNo' /><!-- 차량번호 --></th>
                            <td>
                                <input type="text" id="sCarRegNo" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.carOwner' /><!-- 차량소유자 --></th>
                            <td>
                                <input type="text" id="sCarOwnerNm" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.driver' /><!-- 운전자 --></th>
                            <td>
                                <input id="sDriverNm" type="text" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.vinNo' /><!-- vinNo --></th>
                            <td>
                                <input type="text" id="sVinNo" class="form_input">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">维修预检者<!-- RO미리점검인 --></th>
                            <td>
                                <input type="text" id="sRegUsrNm" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.preChkRoDocNo' /><!-- RO미리점검번호 --></th>
                            <td>
                                <input type="text" id="sPreRoDocNo" class="form_input">
                            </td>
                             <th scope="row">维修预检类型<!-- ro미리점검유형 --></th>
                            <td>
                                <input id="preRoTp" class="form_comboBox">
                            </td>
                            <th scope="row"><span class="bu_required">维修预检日期</span><!-- ro미리점검일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input id="sPreRoFromDt" class="form_datepicker ac">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sPreRoToDt" class="form_datepicker ac">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="table_grid mt10">
                <div id="gridHeader" class="resizable_grid"></div>
            </div>
        </section>

        <!-- 일반 -->
        <div id="tabstrip2" class="tab_area">
            <!-- 탭메뉴 -->
            <ul>
                <li><spring:message code="ser.lbl.custRemark" /><!-- 고객요청사항 --></li>
                <li><spring:message code="ser.lbl.trblExpl" /><!-- 고장설명 --></li>
                <li class="k-state-active"><spring:message code="ser.lbl.rpipProject" /><!-- 정비항목 --></li>
                <li><spring:message code="ser.lbl.part" /><!-- 부품 --></li>
                <li><spring:message code='ser.lbl.othDetail' /><!-- 기타사항 --></li>
            </ul>
            <!-- //탭메뉴 -->

            <!-- 고객요청사항 & 고장설명 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectTabInfo.jsp" />
            <!-- //고객요청사항 & 고장설명 -->

            <!-- 정비항목 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectLbrList.jsp" />
            <!-- //정비항목 -->

            <!-- 부품 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectPartList.jsp" />
            <!-- //부품 -->

            <!-- 기타 -->
            <c:import url="/WEB-INF/jsp/ser/cmm/tabInfo/selectEtcIssue.jsp" />
            <!-- //기타 -->
        </div>
        <!-- //일반 -->
    </div>
</div>

<!-- script -->
<script>


//공통코드:RO상태
var roStatCdList = [];
<c:forEach var="obj" items="${roStatCdList}">
roStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roStatCdArr = dms.data.arrayToMap(roStatCdList, function(obj){return obj.cmmCd});

//공통코드:RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
roTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var roTpCdArr = dms.data.arrayToMap(roTpCdList, function(obj){return obj.cmmCd});

/** 캠페인 유형 **/
var crTpList = [];
<c:forEach var="obj" items="${campaignDs}">
    crTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var crTpMap = dms.data.arrayToMap(crTpList, function(obj){return obj.cmmCd;});


//공통코드:고객대기방식유형
var custWaitMthCdList = [];
<c:forEach var="obj" items="${custWaitMthCdList}">
custWaitMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var custWaitMthMap = dms.data.arrayToMap(custWaitMthCdList, function(obj){return obj.cmmCd;});

//공통코드:고품처리유형
var atqProcTpCdList = [];
<c:forEach var="obj" items="${atqProcTpCdList}">
atqProcTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var atqProcTpMap = dms.data.arrayToMap(atqProcTpCdList, function(obj){return obj.cmmCd;});

//공통코드:차량세차유형
var carWashTpCdList = [];
<c:forEach var="obj" items="${carWashTpCdList}">
carWashTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carWashTpMap = dms.data.arrayToMap(carWashTpCdList, function(obj){return obj.cmmCd;});

//공통코드:차량시승요청유형
var carDriveReqTpCdList = [];
<c:forEach var="obj" items="${carDriveReqTpCdList}">
carDriveReqTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var carDriveReqTpMap = dms.data.arrayToMap(carDriveReqTpCdList, function(obj){return obj.cmmCd;});

//공통코드:품질검사
var qtTestMthCdList = [];
<c:forEach var="obj" items="${qtTestMthCdList}">
qtTestMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var qtTestMthMap = dms.data.arrayToMap(qtTestMthCdList, function(obj){return obj.cmmCd;});


$(document).ready(function() {


 // 상태
    roStatCdGrid = function(value){
        var returnVal = "";
        if( dms.string.isNotEmpty(value)){
            if(roStatCdArr[value] != undefined)
                returnVal = roStatCdArr[value].cmmCdNm;
        }
        return returnVal;
    }

    // RO유형
    roTpCdGrid = function(value){
        var returnVal = "";
        if( dms.string.isNotEmpty(value)){
            if(roTpCdArr[value] != undefined)
                returnVal = roTpCdArr[value].cmmCdNm;
        }
        return returnVal;
    }

    //캠페인유형
    crTpCdGrid = function(value){
        var returnVal = "";
        if( dms.string.isNotEmpty(value)){
            if(crTpMap[value] != undefined)
                returnVal = crTpMap[value].cmmCdNm;
        }
        return returnVal;
    }

  //고객대기방식유형
  setCustWaitMthMap = function(val){
      var returnVal = "";
      if(val != null && val != ""){
          if(custWaitMthMap[val] != undefined)
          returnVal = custWaitMthMap[val].cmmCdNm;
      }
      return returnVal;
  }

  //고품처리유형
  setAtqProcTpMap = function(val){
      var returnVal = "";
      if(val != null && val != ""){
          if(atqProcTpMap[val] != undefined)
          returnVal = atqProcTpMap[val].cmmCdNm;
      }
      return returnVal;
  }

  //차량세차유형
  setCarWashTpMap = function(val){
      var returnVal = "";
      if(val != null && val != ""){
          if(carWashTpMap[val] != undefined)
          returnVal = carWashTpMap[val].cmmCdNm;
      }
      return returnVal;
  }

  //차량시승요청유형
  setCarDriveReqTpMap = function(val){
      var returnVal = "";
      if(val != null && val != ""){
          if(carDriveReqTpMap[val] != undefined)
          returnVal = carDriveReqTpMap[val].cmmCdNm;
      }
      return returnVal;
  }


  //공통코드:품질검사
  setQtTestMthMap = function(val){
      var returnVal = "";
      if(val != null && val != ""){
          if(qtTestMthMap[val] != undefined)
          returnVal = qtTestMthMap[val].cmmCdNm;
      }
      return returnVal;
  }


    $(document).on("click", ".linkPreRoDocNo", function(e){
        var grid = $("#gridHeader").data("kendoExtGrid");
        var row = $(e.target).closest("tr");
        grid.tbody.find('>tr').each(function(){
            $(this).removeClass("k-state-selected");
         });
         row.addClass("k-state-selected");

        var selectedVal = grid.dataItem(row);
        parent._createOrReloadTabMenu("<spring:message code='ser.menu.rpipPreChk' />", "<c:url value='/ser/ro/repairOrder/selectPreRepairOrderMain.do'/>?preRoDocNo="+selectedVal.preRoDocNo, "VIEW-D-10337"); // RO Main
    });

    $("#tabstrip, #tabstrip2").kendoExtTabStrip({
        animation:false
    });

 // RO유형
    $("#preRoTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:roTpCdList
        ,optionLabel:" "
        ,index:0
    });

    // 조회 버튼.
    $("#btnSearch").kendoButton({
        click:function(e){

            if( dms.string.isEmpty($("#sPreRoToDt").val()) || dms.string.isEmpty($("#sPreRoFromDt").val()) ){
                dms.notification.warning("<spring:message code='ser.lbl.preChkRoDt' var='roDt'/><spring:message code='global.info.validation.required' arguments='${roDt}' />");
                return;
            }
            $("#gridHeader").data("kendoExtGrid").dataSource.read();
            serviceJs.commonListInit();     // service 공통 JS
        }
    });

    // RO일자
    $("#sPreRoFromDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sPreRoFromDt}"
    });

    // RO일자
    $("#sPreRoToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sPreRoToDt}"
    });

    $("#gridHeader").kendoExtGrid({
        gridId:"G-SER-1011-000093"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectPreRepairOrdersList.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sDlrCd"] = $("sDlrCd").val();
                        params["sCarRegNo"]     = $("#sCarRegNo").val();
                        params["sDriverNm"]     = $("#sDriverNm").val();
                        params["sCarOwnerNm"]   = $("#sCarOwnerNm").val();
                        params["sVinNo"]        = $("#sVinNo").val();
                        params["sRegUsrNm"]     = $("#sRegUsrNm").val();
                        params["sPreRoDocNo"]   = $("#sPreRoDocNo").val();
                        params["sPreRoTp"]      = $("#preRoTp").data("kendoExtDropDownList").value();
                        params["sPreRoFromDt"]  = $("#sPreRoFromDt").data("kendoExtMaskedDatePicker").value();
                        params["sPreRoToDt"]    = $("#sPreRoToDt").data("kendoExtMaskedDatePicker").value();
                        params["sPreFixId"]      = "${preFixId}";

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,dlrCd:{type:"string", editable:false}
                        ,resvDocNo:{type:"string", editable:false}
                        ,preRoDocNo:{type:"string", editable:false}
                        ,preRoDt:{type:"date"}
                    }
                }
            }
        }
        ,height:186
        ,pageable:false
        ,editable:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function(e){
            if(!e.sender.dataItem(e.sender.select()).isNew()){

                var selectedVal = this.dataItem(this.select());
                var preRoDocNo = selectedVal.preRoDocNo;
                $("#preRoDocNo").val(preRoDocNo);
                lbrInfo(preRoDocNo, "PRC");
                partInfo(preRoDocNo, "PRC");
                trobleDescInfo(preRoDocNo, "PRC");  // 고객요구사항및 고장설명
                etcIssueSet(preRoDocNo, "PRC");     // 기타사항
            };
        }
        ,columns:[
            {field:"carRegNo", title:"<spring:message code='ser.lbl.carNo' />", width:100}                    // 차량번호
            ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150}                       // VIN
            ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:100}               // 소유자
            ,{field:"driverNm", title:"<spring:message code='ser.lbl.vsitr' />", width:100}                    // 방문자
            ,{field:"carlineNm", title:"<spring:message code='ser.lbl.carlineNm' />", width:100}                                        // 차종명칭
            ,{field:"modelNm", title:"<spring:message code='par.lbl.modelNm' />", width:100}                                            // 모델명칭
            ,{field:"runDistVal", title:"<spring:message code='ser.lbl.nowRunDist' />", width:100, attributes :{"class":"ar"}, format:"{0:n0}"}   // 현주행거리
            ,{field:"lastRunDistVal", title:"<spring:message code='ser.lbl.accuDrivDis' />", attributes :{"class":"ar"}, width:100 , format:"{0:n0}"}    // 누적주행거리
            ,{field:"preRoStatCd", title:"<spring:message code='ser.lbl.roStatus' />", width:100, attributes:{"class":"ac"}
                ,template: "#=roStatCdGrid(preRoStatCd)#"
            }// 미리점검유형
            ,{field:"preRoDocNo", title:"<spring:message code='ser.lbl.preRoDocNo' />", width:150
                ,template:function(dataItem){
                    var spanObj = "<a href='#' class='linkPreRoDocNo'>"+dataItem.preRoDocNo+"</a>";
                    return spanObj;
                }
            }//미러점검번호
            ,{field:"regUsrNm", title:"维修预检委托者", width:100}         // 미리점검위탁인
            ,{field:"preRoDt", title:"维修预检生成时间", width:100, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}} // 미리점검생성시간
            ,{field:"preRoDt", title:"维修预检确认时间", width:100, format:"{0:<dms:configValue code='dateFormat' />}", attributes:{"class":"ac"}, hidden:true} // 미리점검확인시간
            ,{field:"roCancDt", title:"取消维修预检时间", width:140
                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}
              }// 미리점검취소시간
            ,{field:"roCancNm", title:"取消维修预检者", width:100}                 // 미리점검취소자
            ,{field:"lbrAmt", title:"<spring:message code='ser.lbl.preLbrSubAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}                    // 예정공임비
            ,{field:"parAmt", title:"<spring:message code='ser.lbl.preParSubAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}                    // 예정부품비
            ,{field:"etcAmt", title:"<spring:message code='ser.lbl.preEtcSubAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}                    // 에정기타비
            ,{field:"dcAmt", title:"<spring:message code='ser.lbl.preDcAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}            //예정혜택금액
            ,{field:"sumAmt", title:"<spring:message code='ser.lbl.preTotAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}                    // 예정총금액
            ,{field:"balAmt", title:"<spring:message code='ser.lbl.preBalAmt' />", width:100, attributes:{"class":"ar"} ,format:"{0:n2}"}          //선수금
            ,{field:"cancReasonCont", title:"<spring:message code='ser.lbl.cancReasonCd' />", width:100}                    // 취소원인
            ,{field:"roRemark", title:"<spring:message code='ser.lbl.roRemark' />", width:100}                    // RO비고
            ,{field:"expcDlDt", title:"<spring:message code='ser.lbl.expcDlvDt' />", width:140
                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}
            } //예정인도시간
            ,{field:"chgExpcDlDt", title:"<spring:message code='ser.lbl.chgExpcDlDt' />", width:140
                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}
            } //변경된예정인도시간
            ,{field:"atqProcTp", title:"<spring:message code='ser.lbl.OldItemHandTp' />", width:100
                ,template:"#=setAtqProcTpMap(atqProcTp)#"
            } //고품처리
            ,{field:"carWashTp", title:"<spring:message code='ser.lbl.carWash' />", width:100
                ,template:"#=setCarWashTpMap(carWashTp)#"
            } //차량세차
            ,{field:"custWaitMthCd", title:"<spring:message code='ser.lbl.custStbyMth' />", width:100
                ,template:"#=setCustWaitMthMap(custWaitMthCd)#"
            } //고객대기
            ,{field:"roadTestCd", title:"<spring:message code='ser.lbl.roadTest' />", width:100, hidden:true}     // 도로테스트
            ,{field:"qtTestMthCd", title:"<spring:message code='ser.lbl.qtTest' />", width:100
                ,template:"#=setQtTestMthMap(qtTestMthCd)#"
            } //품질검사
            ,{field:"carDriveReqTp", title:"<spring:message code='ser.lbl.tdrvReq' />", width:100
                ,template:"#=setCarDriveReqTpMap(carDriveReqTp)#"
            } //시승요청유형
            ,{field:"resvDocNo", title:"<spring:message code='ser.lbl.resvDocNo' />", width:100}                    // 예약번호
            ,{field:"diagDocNo", title:"<spring:message code='ser.lbl.preInsNo' />", width:100}                    // 사전점검번호
            ,{field:"incReqNo", title:"<spring:message code='ser.lbl.incReqNo' />", width:100}                    // 보험번호
            ,{field:"baseRoNo", title:"<spring:message code='ser.lbl.origRorcptNo' />", width:100}              // 원RO번호
            ,{field:"", title:"PWA号码", width:100, hidden:true}                             // PWA번호
            ,{field:"roDt", title:"维修委托生成时间", width:100
                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}
            }                                           // RO생성일자
            ,{field:"roDt", title:"维修委托确认时间", width:100 ,hidden : true
                , format:"{0:<dms:configValue code='dateFormat' /> HH:mm}", attributes:{"class":"ac"}
            }    //ro확인일자
            ,{field:"", title:"维修委托者", width:100 ,hidden : true}               // 위탁인
            ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:150 }// RO번호
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:100 ,hidden : true}  // RO유형
        ]
    });


});

$(".btn_right_absolute").hide();
$(".form_search a").hide();
</script>
<!-- //script -->

