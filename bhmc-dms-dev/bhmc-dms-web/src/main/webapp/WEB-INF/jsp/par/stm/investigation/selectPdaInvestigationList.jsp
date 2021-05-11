<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

            <!-- 실사문서  검색-->
            <section class="group">
                <div class="header_area">
                    <div class="btn_left">
                        <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                    </div>
                    <div class="btn_right">
                        <button class="btn_m btn_save" id="btnSave">保存<!-- 저장 --></button>
                        <button class="btn_m" id="invConf">盘点确认<!-- 실사확인 --></button>
                        <button class="btn_m" id="invCancel">盘点取消<!-- 실사취소 --></button>
                        <button class="btn_m" id="">文件导出<!-- 다운로드 --></button>
                    </div>
                </div>

            <!-- 재고실사문서  정보-->
            <section class="group">

                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
                            <col style="width:10%;">
                            <col style="width:15%;">
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
                            <td class="readonly_area">
                                <input type="text" id="sRegDt" readonly class="form_datepicker">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 담당자 --></th>
                            <td>
                                <input type="hidden" id="sPrsnId" readonly class="form_input form_readonly">
                                <input type="text" id="sPrsnNm" readonly class="form_input form_readonly">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.stockLockYn" /><!-- 재고통제여부 --></th>
                            <td class="readonly_area">
                                <input type="text" id="sStockLockYn" readonly class="form_comboBox form_readonly">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.investigationConfPsn" /><!-- 실사확인자 --></th>
                            <td class="readonly_area">
                                <input type="text" id=""  class="form_input" readonly>
                                <input type="hidden" id="sDocStatCd">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.investigationConfDt" /><!-- 실사확인일자 --></th>
                            <td class="readonly_area">
                                <input type="text" id="sConfDt" class="form_datepicker" readonly>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.investigationReqDt" /><!-- 실사요청일자 --></th>
                            <td class="readonly_area">
                                <input type="text" id="sApproveReqDt" class="form_datepicker" readonly>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.investigationApprDt" /><!-- 실사심사일자 --></th>
                            <td class="readonly_area">
                                <input type="text" id="sEndDt" class="form_datepicker" readonly>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div class="grid" id="detailgrid" ></div>
                </div>

            <!-- //재고실사문서 정보 -->
            </section>
        <!-- 실사문서  검색-->
        </section>


                <script>
                 var stockStatList    = []
                    ,docStatList      = []
                    ,docStatObj       = {}
                    ,stockLockYnList  = []
                    ,abcIndList       = []
                    ,abcIndObj        = {}
                    ,itemStatList     = []
                    ,itemStatObj      = {}
                    ,storageCdList    = []
                    ,storageObj       = {}
                    ,rowNumber        = 0
                    ,sevenDtBf        = "${sevenDtBf}"
                    ,toDt             = "${toDt}";


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

                function fn_linkInvestigation(){
                    //spanObj = "<a href ='<c:url value='/par/stm/investigation/selectInvestigationApproveMain.do?pStockDdDocNo="+dataItem.stockDdDocNo+"'/>'><spring:message code='par.menu.stockMoveInvest' /></a>";
                    //spanObj = "<a href ='<c:url value='/par/stm/investigation/selectInvestigationManageMain.do?pStockDdDocNo="+dataItem.stockDdDocNo+"'/>'><spring:message code='par.menu.stockResultInvest' /></a>";
                     if($("#sDocStatCd").val() === "REQ"){ //승인요청
                         parent._createOrReloadTabMenu('<spring:message code="par.menu.stockMoveInvest" />'
                                 ,"<c:url value='/par/stm/investigation/selectInvestigationApproveMain.do?pStockDdDocNo="+$("#sStockDdDocNo").val()+"'/>", "VIEW-D-10232");
                     }else if($("#sDocStatCd").val() === "RGST"){
                         parent._createOrReloadTabMenu('<spring:message code="par.menu.stockResultInvest" />'
                                 ,"<c:url value='/par/stm/investigation/selectInvestigationManageMain.do?pStockDdDocNo="+$("#sStockDdDocNo").val()+"'/>", "VIEW-D-10548");
                     }

                }

                $(document).ready(function() {

               //조회조건-상태
                $("#sStockLockYn").kendoExtDropDownList({
                     dataSource     :  stockLockYnList
                    ,dataTextField  :  "cmmCdNm"
                    ,dataValueField :  "cmmCd"
                    ,optionLabel:" "
                });

               //조회조건-등록일 From
                $("#sRegDt").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                 });

               //조회조건-확인일
                $("#sConfDt").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                 });

                //조회조건-요청일
                $("#sApproveReqDt").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                 });

               //조회조건-승인일
                $("#sEndDt").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                 });

               //조회조건-재고통제여부
                $("#sStockLockYn").kendoExtDropDownList({
                     dataSource     :  stockLockYnList
                    ,dataTextField  :  "cmmCdNm"
                    ,dataValueField :  "cmmCd"
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

              //저장 버튼
              $("#btnSave").kendoButton({
                click:function(e){
                }
                ,enable:false
              });

              //실사확인 버튼
              $("#invConf").kendoButton({
                click:function(e){
                }
                ,enable:false
              });

              //실사취소 버튼
              $("#invCancel").kendoButton({
                click:function(e){
                }
                ,enable:false
              });

              //조회 버튼
              $("#btnSearch").kendoButton({
                  click:function(e){

                      if(dms.string.isEmpty($("#sRegDtFr").val())){
                          return false;
                      }

                      $("#grid").data("kendoExtGrid").dataSource.read();

                  }
              });

              //재고실사문서생성 버튼
              /*
              $("#btnMove").kendoButton({
                  click:function(e){

                      document.location.href = "<c:url value='/par/stm/investigation/selectInvestigationMain.do' />";

                  }
              });
              */

              //실사문서 그리드 세팅
              $("#detailgrid").kendoExtGrid({
                  gridId:"G-PAR-0519-181706"
                 ,dataSource:{
                      transport:{
                           read :{
                                  url:"<c:url value='/par/stm/investigation/selectInvestigationListDetailGrid.do' />"
                          }
                          ,parameterMap:function(options, operation){
                              if(operation === "read"){
                                  var params = {};

                                  params["sort"]                 = options.sort;
                                  params["sPrsnId"]              = $("#sPrsnId").val();
                                  params["sPrsnNm"]              = $("#sPrsnNm").val();
                                  params["sStockDdDocNo"]        = $("#sStockDdDocNo").val();
                                  params["sStockLockYn"]         = $("#sStockLockYn").data("kendoExtDropDownList").value();
                                  params["sEndDt"]               = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                                  params["sRegDt"]               = $("#sRegDt").data("kendoExtMaskedDatePicker").value();
                                  params["sApproveReqDt"]        = $("#sApproveReqDt").data("kendoExtMaskedDatePicker").value();

                                  return kendo.stringify(params);
                           }
                           }
                       }
                      ,schema:{
                          model:{
                              id:"InvestigationDetailList"
                              ,fields:{
                                   dlrcd                  :{ type:"string" } //딜러코드
                                  ,rowno                  :{ type:"number" } //RNUM
                                  ,itemStatCd             :{ type:"string" } //품목상태코드
                                  ,strgeCd                :{ type:"string" } //창고코드
                                  ,locCd                  :{ type:"string" } //위치코드
                                  ,itemCd                 :{ type:"string" } //품목코드
                                  ,itemDstinCd            :{ type:"string" } //품목구분
                                  ,carlineCd              :{ type:"string" } //차종
                                  ,abcInd                 :{ type:"string" } //ABC Class
                                  ,lastGrDt               :{ type:"date"   } //최근입고일
                                  ,lastGiDt               :{ type:"date"   } //최근출고일
                                  ,bookQty                :{ type:"number" } //장부수량
                                  ,ddQty                  :{ type:"number" } //실사수량
                                  ,diffQty                :{ type:"number" } //손익수량
                                  ,movingAvgPrc           :{ type:"number" } //단가
                                  ,remark                 :{ type:"string" } //remark
                              }
                          }
                       }
                  }
                 ,height:450
                 ,selectable:"row"
                 ,scrollable :true
                 ,autoBind   :false
                 ,filterable:false
                 ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                 ,pageable   :false
                 ,editable   :false
                 ,dataBinding:false
                 ,columns:[
                             {//딜러코드
                                  field     :"dlrCd"
                                 ,title     :"<spring:message code='par.lbl.dlrCd'  />"
                                 ,hidden    :true
                                 ,width     :100
                             }
                            ,{//Line
                                  field     :"rowno"
                                 ,title     :"<spring:message code='par.lbl.line'  />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :50
                             }
                            ,{//move
                                field     :"move"
                               ,title     :"<spring:message code='par.lbl.move'  />"
                               ,attributes:{"class":"ac"}
                               ,sortable  :false
                               ,template  :function(dataItem){

                                   var spanObj = "";

                                   spanObj = "<a class='k-link' onclick=\"fn_linkInvestigation(); \"><spring:message code='par.menu.stockResultInvest' /></a>";

                                   return spanObj;
                               }
                               ,width     :140 }
                            ,{//공급처유형
                                  field     :""
                                 ,title     :"<spring:message code='par.lbl.itemMasterBpTp'  />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :100
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
                               ,attributes:{"class":"ac"}
                               ,width     :100
                             }
                            ,{//위치
                                field     :"locCd"
                               ,title     :"<spring:message code='par.lbl.locationCd'  />"
                               ,attributes:{"class":"ac"}
                               ,width     :120
                             }
                            ,{//부품분류(품목구분)
                                  field     :"itemDstinCd"
                                 ,title     :"配件属性"
                                 ,attributes:{"class":"ac"}
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
                               ,attributes:{"class":"ac"}
                               ,width     :90
                             }
                            ,{//차종
                                  field     :"carlineCd"
                                 ,title     :"<spring:message code='par.lbl.carLine'  />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :120
                             }
                            ,{//차형
                                  field     :""
                                 ,title     :"<spring:message code='par.lbl.model' />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :120
                             }
                            ,{//재고수량(장부수량)
                                field     :"bookQty"
                               ,title     :"<spring:message code='mis.lbl.stockvaluecnt'  />"
                               ,attributes:{"class":"ar"}
                               ,format    :"{0:n0}"
                               ,decimal   :0
                               ,width     :80
                            }
                            ,{//가용수량
                                field     :""
                               ,title     :"可用数量"
                               ,attributes:{"class":"ar"}
                               ,format    :"{0:n0}"
                               ,decimal   :0
                               ,width     :80
                            }
                            ,{//예류수량
                                field     :""
                               ,title     :"<spring:message code='par.lbl.readyQty' />"
                               ,attributes:{"class":"ar"}
                               ,format    :"{0:n0}"
                               ,decimal   :0
                               ,width     :80
                            }
                            ,{//차출수량
                                field     :""
                               ,title     :"<spring:message code='par.lbl.avlbOutQty' />"
                               ,attributes:{"class":"ar"}
                               ,format    :"{0:n0}"
                               ,decimal   :0
                               ,width     :80
                            }
                            ,{//차입수량
                                  field     :""
                                 ,title     :"<spring:message code='par.lbl.borrowItemQty' />"
                                 ,attributes:{"class":"ar"}
                                 ,format    :"{0:n0}"
                                 ,width     :90
                             }
                            ,{//실사수량
                                  field     :"ddQty"
                                 ,title     :"<spring:message code='par.lbl.ddQty' />"
                                 ,format    :"{0:n0}"
                                 ,attributes:{"class":"ar"}
                                 ,decimal   :0
                                 ,width     :80
                             }
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



                initPage();

                });

                function initPage(){

                    var minDate = new Date(sevenDtBf),
                    maxDate = new Date(toDt),
                    toYY,
                    toMM,
                    toDD,
                    frYY,
                    frMM,
                    frDD;

                    $("#detailgrid").data("kendoExtGrid").dataSource.data([]);          //재고실사문서 정보그리드
                    $("#sPrsnId").val('');                                              //담당자
                    $("#sPrsnNm").val('');                                              //담당자
                    $("#sStockDdDocNo").val('');                                        //재고실사문서
                    $("#sStockLockYn").data("kendoExtDropDownList").value("");             //재고통제여부
                    $("#sApproveReqDt").data("kendoExtMaskedDatePicker").value("");

                    $("#prsnId").val('');
                    $("#prsnNm").val('');
                    $("#sStockLockYn").data("kendoExtDropDownList").value("");
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value("");
                }

             // 재고실사리스트 팝업 열기 함수.
                function selectInvestigationListPopupWindow(){

                    investigationListPopupWindow = dms.window.popup({
                        windowId:"investigationListPopup"
                        ,title:"<spring:message code='par.title.stockDDDocInfo' />"   // 재고실사정보
                        ,content:{
                            url:"<c:url value='/par/cmm/selectInvestigationListPopup.do'/>"
                            ,data:{
                                "type":"custom1"
                                ,"autoBind":false
                                ,"stockDdDocNo":$("#sStockDdDocNo").val()
                                ,"callbackFunc":function(data){
                                    if(data.length > 0)
                                    {
                                        $("#sPrsnId").val(data[0].prsnId);
                                        $("#sPrsnNm").val(data[0].prsnNm);
                                        $("#sStockDdDocNo").val(data[0].stockDdDocNo);
                                        $("#sStockLockYn").data("kendoExtDropDownList").value(data[0].stockLockYn);
                                        $("#sApproveReqDt").data("kendoExtMaskedDatePicker").value(data[0].approveReqDt);
                                        $("#sEndDt").data("kendoExtMaskedDatePicker").value(data[0].endDt);
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
                                        $("#sPrsnId").val(data[0].usrId);
                                        $("#sPrsnNm").val(data[0].usrNm);

                                    }
                                   // userSearchPopupWin.close();
                                }
                            }
                        }

                    });
                }


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

                </script>
