<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

            <!-- 실사문서  검색-->
            <section class="group">
                <div class="header_area">
                    <div class="btn_left">
					<dms:access viewId="VIEW-D-11900" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
					</dms:access>
                    </div>
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-10233" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m hidden" id="excelDownload"><spring:message code="par.btn.excelDownload" /><!-- 다운로드 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11898" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                    </dms:access>
                    </div>
                </div>

            <!-- 재고실사문서  정보-->
            <section class="group">

                <div class="table_form form_width_70per" id="searchForm" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:17%;">
                            <col style="width:8%;">
                            <col style="width:17%;">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 실사문서번호 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="sStockDdDocNo" class="form_input">
                                        <a id="searchStockDdDocNo"><!-- 검색 --></a>
                                    </div>
                                </td>
                            <th scope="row"><spring:message code="par.lbl.invDocRegDt" /><!-- 실사문서생성일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sRegDtFr" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sRegDtTo" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 담당자 --></th>
                            <td>
                                <input type="text" id="sPrsnNm" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.stockLockYn" /><!-- 재고통제여부 --></th>
                            <td>
                                <input type="text" id="sStockLockYn" class="form_comboBox"  data-type="combo"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.investigationConfPsn" /><!-- 실사확인자 --></th>
                            <td>
                                <input type="text" id="sRegUsrNm"  class="form_input">
                                <input type="hidden" id="sDocStatCd">
                                <input type="hidden" id="stockDdDocNo">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.investigationConfDt" /><!-- 실사확인일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sRegCfDtFr" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sRegCfDtTo" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.investigationReqDt" /><!-- 실사요청일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sApproveReqDtFr" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sApproveReqDtTo" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.investigationApprDt" /><!-- 실사심사일자 --></th>
                            <td>
                                <div class="form_float">
                                    <div class="date_left">
                                        <input type="text" id="sEndFrDt" class="form_datepicker">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input type="text" id="sEndToDt" class="form_datepicker">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div class="grid" id="hgrid" ></div>
                </div>

                <div class="table_grid mt10">
                    <div class="grid" id="detailgrid" ></div>
                </div>

            <!-- //재고실사문서 정보 -->
            </section>
        <!-- 실사문서  검색-->
        </section>

    <script>
     var stockStatList = []
        ,docStatList = []
        ,docStatObj = {}
        ,stockLockYnList = []
        ,abcIndList = []
        ,abcIndObj = {}
        ,itemDstinCdList = []
        ,itemDstinCdObj = {}
        ,itemStatList = []
        ,itemStatObj = {}
        ,storageCdList = []
        ,storageObj = {}
        ,rowNumber = 0
        ,bpTpList = []
        ,bpTpMap = {}
        ,toDt = "${toDt}"
        ,sevenDtBf = "${sevenDtBf}";

    itemDstinCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    itemDstinCdObj[' '] = "";
    <c:forEach var="obj" items="${itemDstinList}" varStatus="status">
        itemDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        itemDstinCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //조회옵션 설정--문서상태
    <c:forEach var="obj" items="${docStatList}">
        docStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        docStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //조회옵션 설정--ABC CLASS
    <c:forEach var="obj" items="${abcIndList}">
        abcIndObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //조회옵션 설정--품목상태
    <c:forEach var="obj" items="${itemStatList}" varStatus="status">
        itemStatObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    //창고 선택
    <c:forEach var="obj" items="${storageList}" varStatus="status"> //key value
        storageCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
        storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
    </c:forEach>

    //조회조건-재고통제여부
    stockLockYnList.push({cmmCd:"Y", cmmCdNm:"Yes"});
    stockLockYnList.push({cmmCd:"N", cmmCdNm:"No"});

    //bpTpList
    <c:forEach var="obj" items="${bpTpList}">
    bpTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    //bpTpMap
    $.each(bpTpList, function(idx, obj){
        bpTpMap[obj.cmmCd] = obj.cmmCdNm;
    });

    function fn_linkInvestigation(){
        if($("#sDocStatCd").val() === "REQ"){ //승인요청
            parent._createOrReloadTabMenu('<spring:message code="par.menu.stockMoveInvest" />'
                ,"<c:url value='/par/stm/investigation/selectInvestigationApproveMain.do?pStockDdDocNo="+$("#sStockDdDocNo").val()+"'/>", "VIEW-D-10232");
        }else if($("#sDocStatCd").val() === "RGST"){
            parent._createOrReloadTabMenu('<spring:message code="par.menu.stockResultInvest" />'
                ,"<c:url value='/par/stm/investigation/selectInvestigationManageMain.do?pStockDdDocNo="+$("#sStockDdDocNo").val()+"'/>", "VIEW-D-10548");
        }
    }


    //재고실사리스트 팝업 열기 함수.
    function selectInvestigationListPopupWindow(){

        investigationListPopupWindow = dms.window.popup({
            windowId:"investigationListPopup"
            ,title:"<spring:message code='par.title.stockDDDocInfo' />"
            ,width:860
            ,height:380
            ,content:{
                url:"<c:url value='/par/cmm/selectInvestigationListPopup.do'/>"
                ,data:{
                    "type":"custom1"
                    ,"autoBind":false
                    ,"stockDdDocNo":$("#sStockDdDocNo").val()
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#sPrsnNm").val(data[0].prsnNm);
                            $("#sStockDdDocNo").val(data[0].stockDdDocNo);
                            $("#sStockLockYn").data("kendoExtDropDownList").value(data[0].stockLockYn);
                            //$("#sApproveReqDt").data("kendoExtMaskedDatePicker").value(data[0].approveReqDt);
                            $("#sDocStatCd").val(data[0].docStatCd);

                            $("#detailgrid").data("kendoExtGrid").dataSource.read();
                        }
                        investigationListPopupWindow.close();
                    }
                }
            }
        });
    }

    function userSearchPopup() {
        userSearchPopupWin = dms.window.popup({
            windowId:"userSearchPopupWin"
            ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
            ,content:{
                url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
                , data:{
                    "autoBind":false
                    ,"usrNm":""
                    ,"callbackFunc":function(data){
                        if(data.length > 0){
                            $("#sPrsnNm").val(data[0].usrNm);
                        }
                    }
                }
            }

        });
    }

    $(document).ready(function() {

    //조회조건-상태
    $("#sStockLockYn").kendoExtDropDownList({
        dataSource:stockLockYnList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
    });

    //조회조건-실사문서생성일자 From
    $("#sRegDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-실사문서생성일자 To
    $("#sRegDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-실사확인일자 From
    $("#sRegCfDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-실사확인일자 To
    $("#sRegCfDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-실사요청일자 From
    $("#sApproveReqDtFr").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-실사요청일자 To
    $("#sApproveReqDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-요청일자 From
    $("#sEndFrDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-요청일자 To
    $("#sEndToDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,change:fnChkDateValue
    });

    //조회조건-재고통제여부
    $("#sStockLockYn").kendoExtDropDownList({
        dataSource:stockLockYnList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
    });

    $("#searchStockDdDocNo").on('click', selectInvestigationListPopupWindow);
    $("#searchPrsnId").on('click', userSearchPopup);

    //초기화 버튼
    $("#btnInit").kendoButton({
        click:function(e){
            initPage();
        }
    });

    //다운로드 버튼
    $("#excelDownload").kendoButton({
        click:function(e){

        }
        ,enable:false
    });

    //조회 버튼
    $("#btnSearch").kendoButton({
      click:function(e){

          $("#hgrid").data("kendoExtGrid").dataSource.read();
          $("#detailgrid").data("kendoExtGrid").dataSource.data([]);

      }
    });

    //실사문서 그리드 세팅
      $("#hgrid").kendoExtGrid({
          gridId:"G-PAR-0921-171502"
         ,dataSource:{
              transport:{
                   read :{
                      url:"<c:url value='/par/stm/investigation/selectInvestigationListGrid.do' />"
                  }
                  ,parameterMap:function(options, operation){
                      if(operation === "read"){
                          var params = {};

                          params["recordCountPerPage"] = options.pageSize;
                          params["pageIndex"] = options.page;
                          params["firstIndex"] = options.skip;
                          params["lastIndex"] = options.skip + options.take;
                          params["sort"] = options.sort;

                          params["sPrsnNm"]                = $("#sPrsnNm").val();
                          params["sRegUsrNm"]              = $("#sRegUsrNm").val();
                          params["sStockDdDocNo"]          = $("#sStockDdDocNo").val();
                          params["sStockLockYn"]           = $("#sStockLockYn").data("kendoExtDropDownList").value();

                          //실사문서생성일자 From
                          var sRegDtFr = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                          if(sRegDtFr == null){
                              sRegDtFr = "";
                          }
                          //실사문서생성일자 To
                          var sRegDtTo = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                          if(sRegDtTo == null){
                              sRegDtTo = "";
                          }
                          //실사확인일자 From
                          var sRegCfDtFr = $("#sRegCfDtFr").data("kendoExtMaskedDatePicker").value();
                          if(sRegCfDtFr == null){
                              sRegCfDtFr = "";
                          }
                          //실사확인일자 To
                          var sRegCfDtTo = $("#sRegCfDtTo").data("kendoExtMaskedDatePicker").value();
                          if(sRegCfDtTo == null){
                              sRegCfDtTo = "";
                          }
                          //실사요청일자 From
                          var sApproveReqDtFr = $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").value();
                          if(sApproveReqDtFr == null){
                              sApproveReqDtFr = "";
                          }
                          //실사요청일자 To
                          var sApproveReqDtTo = $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").value();
                          if(sApproveReqDtTo == null){
                              sApproveReqDtTo = "";
                          }

                          //실사승인일자 From
                          var sEndFrDt = $("#sEndFrDt").data("kendoExtMaskedDatePicker").value();
                          if(sEndFrDt == null){
                              sEndFrDt = "";
                          }
                          //실사승인일자 To
                          var sEndToDt = $("#sEndToDt").data("kendoExtMaskedDatePicker").value();
                          if(sEndToDt == null){
                              sEndToDt = "";
                          }

                          params["sRegDtFr"] = sRegDtFr;
                          params["sRegDtTo"] = sRegDtTo;
                          params["sRegCfDtFr"] = sRegCfDtFr;
                          params["sRegCfDtTo"] = sRegCfDtTo;
                          params["sApproveReqDtFr"] = sApproveReqDtFr;
                          params["sApproveReqDtTo"] = sApproveReqDtTo;
                          params["sEndFrDt"] = sEndFrDt;
                          params["sEndToDt"] = sEndToDt;

                          return kendo.stringify(params);

                       }
                   }
               }
              ,schema:{
                  data:function(result){
                      if(result.total === 0){
                          dms.notification.warning("<spring:message code='global.info.noSearchDataMsg' />");
                      }
                      return result.data;
                  }
                 ,model:{
                      id:"InvestigationList"
                      ,fields:{
                           rnum                   :{ type:"string" } //No
                          ,move                   :{ type:"string" } //바로가기
                          ,dlrcd                  :{ type:"string" } //딜러코드
                          ,docStatCd              :{ type:"string" } //문서상태코드
                          ,stockDdDocNo           :{ type:"string" } //재고실사문서번호
                          ,regDt                  :{ type:"date"   } //등록일
                          ,approveReqDt           :{ type:"date"   } //승인요청일자
                          ,endDt                  :{ type:"date"   } //완료일자
                          ,prsnId                 :{ type:"string" } //담당자
                          ,prsnNm                 :{ type:"string" } //담당자
                          ,regUsrId               :{ type:"string" } //확인자
                          ,regUsrNm               :{ type:"string" } //확인자
                          ,stockLockYn            :{ type:"string" } //재고통제여부
                          ,remark                 :{ type:"string" } //비고
                          ,signOpnCont            :{ type:"string" } //결재의견
                      }
                  }
               }
          }
         ,height:242
         ,selectable:"row"
         ,scrollable :true
         ,autoBind   :false
         ,filterable:false
         ,appendEmptyColumn:true           //빈컬럼 적용. default:false
         ,editable   :false
         ,dataBound:function(e){

             rowNumber = 0;

         }
         ,change:function(e) {

                 var selectedVal = this.dataItem(this.select());

                 //재고실사문서 정보 SEARCHING DATA SETTING
                 $("#stockDdDocNo").val(selectedVal.stockDdDocNo);                                                //재고실사문서
                 //재고실사문서 정보 조회
                 $("#detailgrid").data("kendoExtGrid").dataSource.read();

         }
         ,columns:[
             {field:"rnum" ,title:"<spring:message code='par.lbl.line'  />" ,attributes:{"class":"ac"} ,sortable:false ,width:50
                 ,template  :"#= ++rowNumber #"
             }//No
             ,{field:"stockDdDocNo" ,title:"<spring:message code='par.lbl.stockDdDoc'  />" ,attributes:{"class":"ac"} ,width:120
                 //,template  :"<a class='k-link' onclick=\"goInvestigationLink('#= stockDdDocNo #','#= docStatCd #'); \">#= stockDdDocNo #</a>"
                 ,template:function(dataItem){
                     var spanObj = "";
                     switch(dataItem.docStatCd){
                         case "REDY"://준비
                         case "RGST"://등록
                         case "RJCT"://반환
                             spanObj = "<a class='k-link' onclick=\"goInvestigationLink('"+dataItem.stockDdDocNo+"','"+dataItem.docStatCd+"'); \">"+dataItem.stockDdDocNo+"</a>";
                             break;
                         default: //ready:request
                             spanObj = dataItem.stockDdDocNo;
                             break;
                     }
                     return spanObj;
                 }
             }//재고실사문서
             ,{field:"regDt" ,title:"<spring:message code='par.lbl.invDocRegDt'  />" ,attributes:{"class":"ac"} ,format:"{0:<dms:configValue code='dateFormat' />}" ,width:100 }//등록일
             ,{field:"prsnId" ,title:"<spring:message code='par.lbl.investigationPrsId'  />" ,attributes:{"class":"ac"} ,width:100,hidden:true }//담당자
             ,{field:"prsnNm" ,title:"<spring:message code='par.lbl.investigationPrsId'  />" ,attributes:{"class":"ac"} ,width:100 }//담당자
             ,{field:"stockLockYn" ,title:"<spring:message code='par.lbl.stockLockYn'  />" ,attributes:{"class":"ac"} ,width:100 }//재고통제여부
             ,{field:"stockQty" ,title:"<spring:message code='par.lbl.ddTotQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//실사총수량
             ,{field:"stockPrice" ,title:"<spring:message code='par.lbl.ddTotPrice' />" ,width:100 ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimals:2}//실사총금액
             ,{field:"docStatCd" ,title:"<spring:message code='par.lbl.stockDdStatCd' />" ,attributes:{"class":"ac"} ,width:120
                 ,template:function(dataItem){
                     var spanObj = "";
                     switch(dataItem.docStatCd){
                         case "RGST"://등록
                             spanObj = "<span class='txt_label bg_yellow'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                             break;
                         case "REQ"://승인요청
                             spanObj = "<span class='txt_label bg_green'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                             break;
                         case "END"://승인완료
                             spanObj = "<span class='txt_label bg_blue'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                             break;
                         case "ENDA"://완성
                             spanObj = "<span class='txt_label bg_purple'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                             break;
                         case "CANC"://취소
                             spanObj = "<span class='txt_label bg_orange'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                             break;
                         case "RJCT"://반환
                             spanObj = "<span class='txt_label bg_red'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                             break;
                         default: // ready:request
                             spanObj = "<span class='txt_label bg_gray'>"+changeDocStatCd(dataItem.docStatCd)+"</span>";
                             break;
                     }
                     return spanObj;
                 }
             }//재고실사상태
             ,{field:"regUsrId" ,title:"<spring:message code='par.lbl.investigationConfPsn' />" ,attributes:{"class":"ac"} ,width:100,hidden:true }//실사자
             ,{field:"regUsrNm" ,title:"<spring:message code='par.lbl.investigationConfPsn' />" ,attributes:{"class":"ac"} ,width:100 }//실사자
             ,{field:"regDt" ,title:"<spring:message code='par.lbl.investigationConfDt'  />" ,attributes:{"class":"ac"} ,format:"{0:<dms:configValue code='dateFormat' />}" ,width:100 }//실사확인일
             ,{field:"approveReqDt" ,title:"<spring:message code='par.lbl.investigationReqDt'  />" ,attributes:{"class":"ac"} ,format:"{0:<dms:configValue code='dateFormat' />}" ,width:100 }//실사요청일
             ,{field:"endDt" ,title:"<spring:message code='par.lbl.investigationApprDt'  />" ,attributes:{"class":"ac"} ,format:"{0:<dms:configValue code='dateFormat' />}" ,width:100 }//실사승인일
             //,{field:"" ,title:"<spring:message code='par.lbl.stockCheckResult'  />" ,width:100 }//심사결과
             ,{field:"remark" ,title:"<spring:message code='par.lbl.stockCheckRemark'  />" ,width:200 }//실사비고
          ]

      });

      //실사문서 그리드 세팅
      $("#detailgrid").kendoExtGrid({
          gridId:"G-PAR-0519-181705"
         ,dataSource:{
              transport:{
                   read :{
                          url:"<c:url value='/par/stm/investigation/selectInvestigationListDetailGrid.do' />"
                  }
                  ,parameterMap:function(options, operation){
                      if(operation === "read"){
                          var params = {};

                          params["recordCountPerPage"] = options.pageSize;
                          params["pageIndex"] = options.page;
                          params["firstIndex"] = options.skip;
                          params["lastIndex"] = options.skip + options.take;
                          params["sort"] = options.sort;

                          params["sStockDdDocNo"] = $("#stockDdDocNo").val();

                          return kendo.stringify(params);
                   }
                   }
               }
              ,schema:{
                  model:{
                      id:"rnum"
                      ,fields:{
                           dlrcd        :{ type:"string" } //딜러코드
                          ,rnum         :{ type:"number" } //RNUM
                          ,itemStatCd   :{ type:"string" } //품목상태코드
                          ,strgeCd      :{ type:"string" } //창고코드
                          ,locCd        :{ type:"string" } //위치코드
                          ,locCdMig     :{ type:"string" } //위치코드
                          ,itemCd       :{ type:"string" } //품목코드
                          ,itemDstinCd  :{ type:"string" } //품목구분
                          ,carlineCd    :{ type:"string" } //차종
                          ,abcInd       :{ type:"string" } //ABC Class
                          ,lastGrDt     :{ type:"date"   } //최근입고일
                          ,lastGiDt     :{ type:"date"   } //최근출고일
                          ,bookQty      :{ type:"number" } //장부수량
                          ,ddQty        :{ type:"number" } //실사수량
                          ,diffQty      :{ type:"number" } //손익수량
                          ,movingAvgPrc :{ type:"number" } //단가
                          ,remark       :{ type:"string" } //remark
                          ,resvStockQty :{ type:"number" }
                          ,borrowQty    :{ type:"number" }
                          ,rentQty      :{ type:"number" }
                      }
                  }
               }
          }
         ,height:250
         ,selectable:"row"
         ,scrollable :true
         ,autoBind   :false
         ,filterable:false
         ,appendEmptyColumn:true           //빈컬럼 적용. default:false
         ,editable   :false
         ,dataBound:function(e){

             rowNumber = 0;

             var rows = e.sender.tbody.children();
             $.each(rows, function(idx, row){
                 var row = $(rows[idx]);
                 var dataItem = e.sender.dataItem(row);

                 if( dataItem != null && dataItem != 'undefined'){
                     e.sender.tbody.find("tr[data-uid='" + dataItem.uid + "']").addClass("k-alt");
                 }

             });

         }
         ,columns:[
            {//Line
                  field     :"rnum"
                 ,title     :"<spring:message code='par.lbl.line'  />"
                 ,attributes:{"class":"ac"}
                 ,width     :50
                 ,template  :"#= ++rowNumber #"
             }
            ,{//공급처유형
                  field     :"bpTp"
                 ,title     :"<spring:message code='par.lbl.itemMasterBpTp'  />"
                 ,attributes:{"class":"ac"}
                 ,width     :100
                 ,template:'#if(bpTpMap[bpTp] !== undefined ){# #= bpTpMap[bpTp]# #}#'
             }
            ,{//품목상태코드
                  field     :"itemStatCd"
                 ,title     :"<spring:message code='par.lbl.itemStatCd'  />"
                 ,attributes:{"class":"ac"}
                 ,template  :'#= changeItemStatCd(itemStatCd)#'
                 ,hidden    :true
                 ,width     :90
             }
            ,{//품목코드
                  field     :"itemCd"
                 ,title     :"<spring:message code='par.lbl.itemCd'  />"
                 ,width     :140
             }
            ,{//품목명
                  field     :"itemNm"
                 ,title     :"<spring:message code='par.lbl.itemNm'  />"
                 ,width     :200
             }
            ,{//창고
                field     :"strgeCd"
               ,title     :"<spring:message code='par.lbl.strgeCd'  />"
               ,template  :'#= changeStrgeCd(strgeCd)#'
               ,width     :120
             }
            ,{//위치
                field     :"locCd"
               ,title     :"<spring:message code='par.lbl.locationCd'  />"
               ,width     :150
             }
            ,{
                field     :"locCdMig"
               ,title     :"<spring:message code='par.lbl.locationCd' /> 2"
               ,width     :180
             }
            ,{//부품분류(품목구분)
                  field     :"itemDstinCd"
                 ,title     :"<spring:message code='par.lbl.itemDstinCd'  />"
                 ,attributes:{"class":"ac"}
                 ,template  :"#= changeItemDstinCd(itemDstinCd)#"
                 ,width     :80
             }
            ,{//ABC Class
                field     :"abcInd"
               ,title     :"<spring:message code='par.lbl.abcInd'  />"
               ,attributes:{"class":"ac"}
               ,width     :90
             }
            ,{//단위
                field     :"unitCd"
               ,title     :"<spring:message code='par.lbl.stockUnitCd'  />"
               ,width     :90
             }
            ,{//차종
                  field     :"carlineCd"
                 ,title     :"<spring:message code='par.lbl.carLine'  />"
                 ,width     :120
             }
            ,{//차형
                  field     :"carlineCd2"
                 ,title     :"<spring:message code='par.lbl.model' />"
                 ,width     :120
             }
            ,{
                field:"stockQty"
               ,title:"<spring:message code='par.lbl.stockQty' />"
               ,attributes:{ "class":"ar"}
               ,format:"{0:n2}" ,width:70 }//장부재고
            ,{//재고수량(장부수량)
                field     :"bookQty"
               ,title     :"<spring:message code='par.lbl.realStockQty' />"
               ,attributes:{"class":"ar"}
               ,format    :"{0:n2}"
               ,decimal   :2
               ,width     :80
            }
            ,{//가용수량
               _field     :"avlbQty"
               ,title     :"<spring:message code='par.lbl.stockQty' />"
               ,attributes:{"class":"ar"}
               ,format    :"{0:n2}"
               ,decimal   :2
               ,width     :80
               ,hidden    :true
            }
            ,{//실사수량
                  field     :"ddQty"
                 ,title     :"<spring:message code='par.lbl.ddQty' />"
                 ,format    :"{0:n2}"
                 ,attributes:{"class":"ar"}
                 ,decimal   :2
                 ,width     :80
             }
            , {field:"resvStockQty" ,title:"<spring:message code='par.lbl.readyQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//예류수량
            , {field:"rentQty" ,title:"<spring:message code='par.lbl.avlbOutQty' />" ,attributes:{"class":"ar"} ,format:"{0:n2}" ,decimal:2 ,width:80}//차출수량
            , {field:"borrowQty" ,title:"<spring:message code='par.lbl.borrowItemQty' />",attributes:{"class":"ar"}  ,format:"{0:n2}" ,decimal:2 ,width:80}//차입수량
         ]
      });
    //문서 상태 그리드 콤보
    changeDocStatCd = function(val){
      var returnVal = "";
      if(val != null && val != ""){
          returnVal = docStatObj[val];
      }
      return returnVal;
    };

    //ABC CLASS 그리드 콤보
    changeAbcInd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = abcIndObj[val];
        }
        return returnVal;
    };

    //품목구분
    changeItemDstinCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = itemDstinCdObj[val];
        }
        return returnVal;
    };

    //품목 상태 그리드 콤보
    changeItemStatCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = itemStatObj[val];
        }
        return returnVal;
    };

    // 재고통제여부 그리드 콤보
    changeStockLockYn = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = stockLockYnObj[val];
        }
        return returnVal;
    };

    // 창고 그리드 콤보
    changeStrgeCd = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = storageObj[val];
        }
        return returnVal;
    };

    //상태별 재고실사문서 번호 링크처리 2016.12.08 yewon.K
    goInvestigationLink = function(stockDdDocNo,docStatCd){
        if(docStatCd == "REDY"){
            //실사대상선정 화면으로 이동.
            window.parent._createOrReloadTabMenu("<spring:message code = 'par.menu.stockTargetInvest'/>"
                  , "<c:url value='/par/stm/investigation/selectInvestigationMain.do?stockDdDocNo="+stockDdDocNo+"&docStatCd="+docStatCd+" '/>","VIEW-I-10192", true);
        }else if(docStatCd == "RGST" || docStatCd == "RJCT"){
            //실사결과신청 화면으로 이동.
            window.parent._createOrReloadTabMenu("<spring:message code = 'par.menu.stockMoveRequest'/>"
                  , "<c:url value='/par/stm/investigation/selectInvestigationManageMain.do?pStockDdDocNo="+stockDdDocNo+"&pDocStatCd="+docStatCd+" '/>","VIEW-I-10193", true);
        }

    };

    initPage();

    });

    function initPage(){
        var minDate = new Date('1990-01-01'),
            maxDate = new Date('9999-12-31'),
            toYY,
            toMM,
            toDD,
            frYY,
            frMM,
            frDD;

        frYY = minDate.getFullYear();
        frMM = minDate.getMonth();
        frDD = minDate.getDate();

        toYY = maxDate.getFullYear();
        toMM = maxDate.getMonth();
        toDD = maxDate.getDate();

        //if (!partsJs.validate.getAllPluginObjInfo($("#genInfoForm")[0])) {
        //radio항목만 제외됨. 이유. 라디오 항목은 여러개이고 id값이 여러개니까 컬럼ID와 매핑 불가함.
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        if (!partsJs.validate.getAllPluginObjInfo($("#searchForm")[0])) {
            return false;
        }

        // 품목 정보 Reset
        //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
        partsJs.validate.groupObjAllDataInit();

        $("#hgrid").data("kendoExtGrid").dataSource.data([]);               //재고실사문서 정보그리드
        $("#detailgrid").data("kendoExtGrid").dataSource.data([]);          //재고실사문서 정보그리드

        $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegCfDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sEndFrDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
        $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        $("#sRegCfDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
        $("#sEndToDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));

    }

    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        if(this.value() == null){
            if(id === 'sRegDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sRegCfDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sRegCfDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sRegCfDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegCfDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sRegCfDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sRegCfDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sApproveReqDtFr'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sApproveReqDtTo'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sEndFrDt'){
                var minDate = new Date(sevenDtBf);
                frYY = minDate.getFullYear();
                frMM = minDate.getMonth();
                frDD = minDate.getDate();
                $("#sEndFrDt").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                $("#sEndToDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sEndToDt'){
                var maxDate = new Date(toDt);
                toYY = maxDate.getFullYear();
                toMM = maxDate.getMonth();
                toDD = maxDate.getDate();

                $("#sEndToDt").data("kendoExtMaskedDatePicker").value(toDt);
                $("#sEndFrDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }else{
            if(id === 'sRegDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sRegCfDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sRegCfDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sRegCfDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sRegCfDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sApproveReqDtFr'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sApproveReqDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }else if(id === 'sEndFrDt'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sEndToDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sEndToDt'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sEndFrDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }
     }

</script>
