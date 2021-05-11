<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

            <!-- 실사문서  검색-->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><%-- <spring:message code="par.title.selectInvestigationList" /> --%><!-- 재고실사현황 --></h1>
                    <div class="btn_right">
                        <button class="btn_m" id="btnMove"><spring:message code="par.title.selectInvestigationTarget" /><!-- 재고실사 대상선정 --></button>
                        <button class="btn_m btn_reset" id="btnInit"><spring:message code="par.btn.init" /><!-- 초기화 --></button>
                        <button class="btn_m btn_search" id="btnSearch"><spring:message code="par.btn.search" /><!-- 조회 --></button>
                    </div>
                </div>
                <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
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
                                <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 상태 --></th>
                                <td>
                                    <input type="text" id="sDocStatCd" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 담당자 --></th>
                                <td>
                                    <div class="form_search">
                                        <input type="text" id="sPrsnId" class="form_input" />
                                        <a id="searchPrsnId"><!-- 검색 --></a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code="par.lbl.date" /></span><!-- 날짜 --></th>
                                <td class="required_area">
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
                                <th scope="row"><spring:message code="par.lbl.stockLockYn" /><!-- 재고통제여부 --></th>
                                <td>
                                    <input type="text" id="sStockLockYn" class="form_comboBox">
                                </td>
                                <th scope="row" class="hidden"><spring:message code="par.lbl.approveReqDt" /><!-- 승인요청일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input type="text" id="sApproveReqDtFr" class="form_datepicker hidden">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input type="text" id="sApproveReqDtTo" class="form_datepicker hidden">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table_grid mt10">
                    <div class="grid" id="grid"></div>
                </div>

            <!-- 재고실사문서  정보-->
            <section class="group">
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="par.title.stockDdDocInfo" /><!-- 재고실사상세현황 --></h2>
                </div>

                <div class="table_form form_width_70per">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:24%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.stockDdDoc" /><!-- 재고실사문서 --></th>
                            <td>
                                <input type="text" id="stockDdDocNo" readonly class="form_input form_readonly">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.statNm" /><!-- 문서상태 --></th>
                            <td>
                                <input type="text" id="docStatCd" class="form_comboBox form_readonly" readonly>
                            </td>
                            <th scope="row"><spring:message code="par.lbl.investigationPrsId" /><!-- 담당자 --></th>
                            <td>
                                <input type="text" id="prsnId" readonly class="form_input form_readonly">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.invDocRegDt" /><!-- 실사문서생성일자 --></th>
                            <td class="readonly_area">
                                <input type="text" id="regDt" readonly class="form_datepicker">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.invRsltRegDt" /><!-- 실사결과등록일자 --></th>
                            <td class="readonly_area">
                                <input type="text" id="approveReqDt" readonly class="form_datepicker">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.stockLockYn" /><!-- 재고통제여부 --></th>
                            <td>
                                <input type="text" id="stockLockYn" readonly class="form_comboBox form_readonly">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.remark" /><!-- 비고 --></th>
                            <td colspan="3">
                                <input type="text" id="remark" readonly class="form_input form_readonly">
                            </td>
                            <th scope="row"><spring:message code="par.lbl.evalRegDt" /><!-- 심사일자 --></th>
                            <td class="readonly_area">
                                <input type="text" id="endDt" readonly class="form_datepicker">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="par.lbl.signOpnCont" /><!-- 결재의견 --></th>
                            <td colspan="3">
                                <input type="text" id="signOpnCont" readonly class="form_input form_readonly">
                            </td>
                            <th scope="row"></th>
                            <td></td>
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
                    docStatList.push({cmmCd:"${obj.cmmCd}", cmmCdNm:"${obj.cmmCdNm}"});
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

                function fn_linkInvestigation(pType,pStockDdDocNo){

                    //spanObj = "<a href ='<c:url value='/par/stm/investigation/selectInvestigationApproveMain.do?pStockDdDocNo="+dataItem.stockDdDocNo+"'/>'><spring:message code='par.menu.stockMoveInvest' /></a>";
                    //spanObj = "<a href ='<c:url value='/par/stm/investigation/selectInvestigationManageMain.do?pStockDdDocNo="+dataItem.stockDdDocNo+"'/>'><spring:message code='par.menu.stockResultInvest' /></a>";

                     if(pType === "REQ"){ //승인요청
                         parent._createOrReloadTabMenu('<spring:message code="par.menu.stockMoveInvest" />'
                                 ,"<c:url value='/par/stm/investigation/selectInvestigationApproveMain.do?pStockDdDocNo="+pStockDdDocNo+"'/>", "VIEW-I-10194");
                     }else if(pType === "RGST"){
                         parent._createOrReloadTabMenu('<spring:message code="par.menu.stockResultInvest" />'
                                 ,"<c:url value='/par/stm/investigation/selectInvestigationManageMain.do?pStockDdDocNo="+pStockDdDocNo+"'/>", "VIEW-I-10193");
                     }

                }

                $(document).ready(function() {

               //조회조건-상태
                $("#sDocStatCd").kendoExtDropDownList({
                     dataSource     :  docStatList
                    ,dataTextField  :  "cmmCdNm"
                    ,dataValueField :  "cmmCd"
                    ,optionLabel:" "
                });

               //조회조건-상태
                $("#sStockLockYn").kendoExtDropDownList({
                     dataSource     :  stockLockYnList
                    ,dataTextField  :  "cmmCdNm"
                    ,dataValueField :  "cmmCd"
                    ,optionLabel:" "
                });

               //조회조건-등록일 From
                $("#sRegDtFr").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                   ,change:fnChkDateValue
                 });

                //조회조건-등록일 To
                $("#sRegDtTo").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                   ,change:fnChkDateValue
                 });

               //조회조건-승인요청일 From
                $("#sApproveReqDtFr").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                   ,change:fnChkDateValue
                 });

                //조회조건-승인요청일 To
                $("#sApproveReqDtTo").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                   ,change:fnChkDateValue
                 });

              //조회조건-상태
                $("#docStatCd").kendoExtDropDownList({
                     dataSource     :  docStatList
                    ,dataTextField  :  "cmmCdNm"
                    ,dataValueField :  "cmmCd"
                    ,optionLabel:" "
                });

               //조회조건-재고통제여부
                $("#stockLockYn").kendoExtDropDownList({
                     dataSource     :  stockLockYnList
                    ,dataTextField  :  "cmmCdNm"
                    ,dataValueField :  "cmmCd"
                    ,optionLabel:" "
                });

                //등록일
                $("#regDt").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                 });

               //승인요청일
                $("#approveReqDt").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                 });

               //완료일
                $("#endDt").kendoExtMaskedDatePicker({
                    format:"<dms:configValue code='dateFormat' />"
                   ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                 });

                $("#searchStockDdDocNo").on('click', selectInvestigationListPopupWindow);
                $("#searchPrsnId").on('click', userSearchPopup);

              //초기화 버튼
              $("#btnInit").kendoButton({
                click:function(e){
                  initPage();
                }
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
              $("#btnMove").kendoButton({
                  click:function(e){

                      document.location.href = "<c:url value='/par/stm/investigation/selectInvestigationMain.do' />";

                  }
              });
              //실사문서 그리드 세팅
              $("#grid").kendoExtGrid({
                  dataSource:{
                      transport:{
                           read :{
                              url:"<c:url value='/par/stm/investigation/selectInvestigationListGrid.do' />"
                          }
                          ,parameterMap:function(options, operation){
                              if(operation === "read"){
                                  var params = {};

                                  params["sort"]                 = options.sort;
                                  params["sPrsnId"]              = $("#sPrsnId").val();
                                  params["sStockDdDocNo"]        = $("#sStockDdDocNo").val();
                                  params["sDocStatCd"]           = $("#sDocStatCd").data("kendoExtDropDownList").value();
                                  params["sStockLockYn"]         = $("#sStockLockYn").data("kendoExtDropDownList").value();
                                  params["sRegDtFr"]             = $("#sRegDtFr").data("kendoExtMaskedDatePicker").value();
                                  params["sRegDtTo"]             = $("#sRegDtTo").data("kendoExtMaskedDatePicker").value();
                                  params["sApproveReqDtFr"]      = $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").value();
                                  params["sApproveReqDtTo"]      = $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").value();

                                  console.log("params :", JSON.stringify(params));

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
                                  ,stockLockYn            :{ type:"string" } //재고통제여부
                                  ,remark                 :{ type:"string" } //비고
                                  ,signOpnCont            :{ type:"string" } //결재의견
                              }
                          }
                       }
                  }
                 ,height:290
                 ,selectable:"row"
                 ,scrollable :true
                 ,autoBind   :false
                 ,pageable:{
                     refresh:true
                     ,pageSize:100
                     ,pageSizes:["100", "300", "500", "all"]
                     ,buttonCount:5
                     ,input:false
                     ,numeric:true
                     ,info:false
                     ,messages:{
                         itemsPerPage:""
                         ,empty:"No data"
                     }
                 }
                 ,editable   :false
                 ,dataBinding:function(e){
                     rowNumber = 0;
                  }
                 ,change:function(e) {
                     console.log("e.sender:",e.sender );
                     console.log("e.sender.dataItem:",e.sender.dataItem );

                         var selectedVal = this.dataItem(this.select());

                         //재고실사문서 정보 SEARCHING DATA SETTING
                         $("#prsnId").val(selectedVal.prsnId);                                                //재고실사문서
                         $("#remark").val(selectedVal.remark);                                                //비고
                         $("#signOpnCont").val(selectedVal.signOpnCont);                                      //결재의견
                         $("#stockDdDocNo").val(selectedVal.stockDdDocNo);                                    //재고실사문서
                         $("#docStatCd").data("kendoExtDropDownList").value(selectedVal.docStatCd);              //문서상태코드
                         $("#stockLockYn").data("kendoExtDropDownList").value(selectedVal.stockLockYn);          //재고통제여부
                         $("#regDt").data("kendoExtMaskedDatePicker").value(selectedVal.regDt);               //등록일
                         $("#endDt").data("kendoExtMaskedDatePicker").value(selectedVal.endDt);               //완료일
                         $("#approveReqDt").data("kendoExtMaskedDatePicker").value(selectedVal.approveReqDt); //승인요청일

                         console.log('selectedVal.stockLockYn:',selectedVal.stockLockYn);
                         console.log("selectedVal",selectedVal);
                         //재고실사문서 정보 조회
                         $("#detailgrid").data("kendoExtGrid").dataSource.read();

                 }
                 ,columns:[
                             {//No
                                  field     :"rnum"
                                 ,title     :"<spring:message code='par.lbl.line'  />"
                                 ,attributes:{"class":"ac"}
                                 ,sortable  :false
                                 ,template  :"#= ++rowNumber #"
                                 ,width     :50 }
                            ,{//딜러코드
                                  field     :"dlrCd"
                                 ,title     :"<spring:message code='par.lbl.dlrCd'  />"
                                 ,attributes:{"class":"ac"}
                                 ,hidden    :true
                                 ,width     :100 }
                            ,{//상태
                                  field     :"docStatCd"
                                 ,title     :"<spring:message code='par.lbl.statNm'  />"
                                 ,attributes:{"class":"ac"}
                                 ,template  :'#= changeDocStatCd(docStatCd)#'
                                 ,width     :120 }
                            ,{//move
                                  field     :"move"
                                 ,title     :"<spring:message code='par.lbl.move'  />"
                                 ,attributes:{"class":"ac"}
                                 ,sortable  :false
                                 ,template  :function(dataItem){

                                     var spanObj = "";

                                     spanObj = "<a class='k-link' onclick=\"fn_linkInvestigation('" + dataItem.docStatCd + "','" + dataItem.stockDdDocNo + "'); \"><spring:message code='par.menu.stockResultInvest' /></a>";
                                     /*
                                     switch(dataItem.docStatCd)
                                     {
                                         case "REQ"://승인요청
                                                 spanObj = "<a href ='<c:url value='/par/stm/investigation/selectInvestigationApproveMain.do?pStockDdDocNo="+dataItem.stockDdDocNo+"'/>'><spring:message code='par.menu.stockMoveInvest' /></a>";
                                                 break;

                                         case "RGST"://등록
                                                 spanObj = "<a href ='<c:url value='/par/stm/investigation/selectInvestigationManageMain.do?pStockDdDocNo="+dataItem.stockDdDocNo+"'/>'><spring:message code='par.menu.stockResultInvest' /></a>";
                                                 break;

                                         default:break;

                                     }*/

                                     console.log('spanObj:', spanObj);

                                     return spanObj;
                                 }
                                 ,width     :140 }
                            ,{//재고실사문서
                                  field     :"stockDdDocNo"
                                 ,title     :"<spring:message code='par.lbl.stockDdDoc'  />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :120 }
                            ,{//등록일
                                  field     :"regDt"
                                 ,title     :"<spring:message code='par.lbl.date'  />"
                                 ,attributes:{"class":"ac"}
                                 ,format    :"{0:<dms:configValue code='dateFormat' />}"
                                 ,width     :100 }
                            ,{//담당자
                                  field     :"prsnId"
                                 ,title     :"<spring:message code='par.lbl.investigationPrsId'  />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :100 }
                            ,{//재고통제여부
                                  field     :"stockLockYn"
                                 ,title     :"<spring:message code='par.lbl.stockLockYn'  />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :100 }
                            ,{//비고
                                  field     :"remark"
                                 ,title     :"<spring:message code='par.lbl.remark'  />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :120 }
                            ,{//실사대상<-INPUT(등록)
                                       title     :"盘点对象"
                                     , headerAttributes:{"class":"hasBob"}
                                     , columns   :[
                                                  {field     :"inputItem"
                                                  ,title     :"<spring:message code='sal.lbl.totNo'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"inputQty"
                                                  ,title     :"<spring:message code='par.lbl.qty'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"inputAmt"
                                                  ,title     :"<spring:message code='global.lbl.amt'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                     ]
                               }
                            ,{//APPROVE(승인요청)
                                       title     :"APPROVE"
                                     , hidden    :true
                                     , headerAttributes:{"class":"hasBob"}
                                     , columns   :[
                                                  {field     :"approveItem"
                                                  ,title     :"<spring:message code='sal.lbl.totNo'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"approveQty"
                                                  ,title     :"<spring:message code='par.lbl.qty'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"approveAmt"
                                                  ,title     :"<spring:message code='global.lbl.amt'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                     ]
                               }
                            ,{//결과등록<-AGREEMENT(승인)
                                       title     :"实际"
                                     , headerAttributes:{"class":"hasBob"}
                                     , columns   :[
                                                  {field     :"agreementItem"
                                                  ,title     :"<spring:message code='sal.lbl.totNo'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"agreementQty"
                                                  ,title     :"<spring:message code='par.lbl.qty'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"agreementAmt"
                                                  ,title     :"<spring:message code='global.lbl.amt'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                     ]
                               }
                            ,{//OBJECTION(반려)
                                       title     :"OBJECTION"
                                     , hidden    :true
                                     , headerAttributes:{"class":"hasBob"}
                                     , columns   :[
                                                  {field     :"objectionItem"
                                                  ,title     :"<spring:message code='sal.lbl.totNo'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"objectionQty"
                                                  ,title     :"<spring:message code='par.lbl.qty'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"objectionAmt"
                                                  ,title     :"<spring:message code='global.lbl.amt'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                     ]
                               }
                            ,{//OVERAGE(초과):장수부량 < 실사수량
                                       title     :"盘盈"
                                     , headerAttributes:{"class":"hasBob"}
                                     , columns   :[
                                                  {field     :"overItem"
                                                  ,title     :"<spring:message code='sal.lbl.totNo'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"overQty"
                                                  ,title     :"<spring:message code='par.lbl.qty'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"overAmt"
                                                  ,title     :"<spring:message code='global.lbl.amt'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                     ]
                               }
                            ,{//SHORTAGE(부족):장수부량 > 실사수량
                                       title     :"盘亏"
                                     , headerAttributes:{"class":"hasBob"}
                                     , columns   :[
                                                  {field     :"shortItem"
                                                  ,title     :"<spring:message code='sal.lbl.totNo'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"shortQty"
                                                  ,title     :"<spring:message code='par.lbl.qty'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                                  ,{field    :"shortAmt"
                                                  ,title     :"<spring:message code='global.lbl.amt'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :60}
                                     ]
                               }
                            ,{//NORMAL(정상):장수부량 = 실사수량
                                       title     :"NORMAL"
                                     , hidden    :true
                                     , headerAttributes:{"class":"hasBob"}
                                     , columns   :[
                                                  {field     :"norItem"
                                                  ,title     :"<spring:message code='sal.lbl.totNo'  />"
                                                  ,attributes:{"class":"ar"}
                                                  ,width     :70}
                                     ]
                               }

              ]

              });

              //실사문서 그리드 세팅
              $("#detailgrid").kendoExtGrid({
                  dataSource:{
                      transport:{
                           read :{
                                  url:"<c:url value='/par/stm/investigation/selectInvestigationListDetailGrid.do' />"
                          }
                          ,parameterMap:function(options, operation){
                              if(operation === "read"){
                                  var params = {};

                                  params["sort"]                 = options.sort;
                                  params["sPrsnId"]              = $("#prsnId").val();
                                  params["sRemark"]              = $("#remark").val();
                                  params["sStockDdDocNo"]        = $("#stockDdDocNo").val();
                                  params["sSignOpnCont"]         = $("#signOpnCont").val();
                                  params["sStockLockYn"]         = $("#stockLockYn").data("kendoExtDropDownList").value();
                                  params["sDocStatCd"]           = $("#docStatCd").data("kendoExtDropDownList").value();
                                  params["sEndDt"]               = $("#endDt").data("kendoExtMaskedDatePicker").value();
                                  params["sRegDt"]               = $("#regDt").data("kendoExtMaskedDatePicker").value();
                                  params["sApproveReqDt"]        = $("#approveReqDt").data("kendoExtMaskedDatePicker").value();

                                  console.log("params :", JSON.stringify(params));
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
                 ,height:290
                 ,selectable:"row"
                 ,scrollable :true
                 ,autoBind   :false
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
                            ,{//품목상태코드
                                  field     :"itemStatCd"
                                 ,title     :"<spring:message code='par.lbl.itemStatCd'  />"
                                 ,attributes:{"class":"ac"}
                                 ,template  :'#= changeItemStatCd(itemStatCd)#'
                                 ,hidden    :true
                                 ,width     :90
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
                            ,{//부품분류(품목구분)
                                  field     :"itemDstinCd"
                                 ,title     :"<spring:message code='par.lbl.itemDstin'  />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :80
                             }
                            ,{//차종
                                  field     :"carlineCd"
                                 ,title     :"<spring:message code='par.lbl.carLine'  />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :120
                             }
                            ,{//ABC Class
                                  field     :"abcInd"
                                 ,title     :"<spring:message code='par.lbl.abcInd'  />"
                                 ,attributes:{"class":"ac"}
                                 ,template  :'#= changeAbcInd(abcInd)#'
                                 ,width     :90
                             }
                            ,{//최근입고일
                                  field     :"lastGrDt"
                                 ,title     :"<spring:message code='par.lbl.lastGrDt' />"
                                 ,format    :"{0:<dms:configValue code='dateFormat' />}"
                                 ,attributes:{"class":"ac"}
                                 ,width     :90
                             }
                            ,{//최근출고일
                                  field     :"lastGiDt"
                                 ,title     :"<spring:message code='par.lbl.lastGiDt' />"
                                 ,format    :"{0:<dms:configValue code='dateFormat' />}"
                                 ,attributes:{"class":"ac"}
                                 ,width     :90
                             }
                            ,{//재고수량(장부수량)
                                  field     :"bookQty"
                                 ,title     :"<spring:message code='par.lbl.strgeStockQty' />"
                                 ,attributes:{"class":"ar"}
                                 ,format    :"{0:n0}"
                                 ,decimal   :0
                                 ,width     :80
                             }
                            ,{//실사수량
                                  field     :"ddQty"
                                 ,title     :"<spring:message code='par.lbl.ddQty' />"
                                 ,format    :"{0:n0}"
                                 ,attributes:{"class":"ar"}
                                 ,decimal   :0
                                 ,width     :80
                             }
                            ,{//손익수량
                                  field     :"diffQty"
                                 ,title     :"<spring:message code='par.lbl.diffQty' />"
                                 ,format    :"{0:n0}"
                                 ,attributes:{"class":"ar"}
                                 ,decimal   :0
                                 ,width     :80
                             }
                            ,{//단가
                                field       :"movingAvgPrc"
                               ,title       :"<spring:message code='global.lbl.prc' />"
                               ,decimals    :2
                               ,format      :"{0:n2}"
                               ,attributes  :{"class":"ar"}
                               ,width       :100
                            }
                            ,{//차이사유(비고)
                                  field     :"remark"
                                 ,title     :"<spring:message code='par.lbl.reasonCont'  />"
                                 ,attributes:{"class":"ac"}
                                 ,width     :100
                             }
                             /* , { field:"" } */
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

                    $("#grid").data("kendoExtGrid").dataSource.data([]);                //그리드
                    $("#detailgrid").data("kendoExtGrid").dataSource.data([]);          //재고실사문서 정보그리드
                    $("#sPrsnId").val('');                                              //담당자
                    $("#sStockDdDocNo").val('');                                        //재고실사문서
                    $("#sDocStatCd").data("kendoExtDropDownList").value("");               //상태
                    $("#sStockLockYn").data("kendoExtDropDownList").value("");             //재고통제여부
                    $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").value("");
                    $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").value("");

                    $("#prsnId").val('');
                    $("#remark").val('');
                    $("#signOpnCont").val('');
                    $("#stockDdDocNo").val('');
                    $("#docStatCd").data("kendoExtDropDownList").value("");
                    $("#docStatCd").data("kendoExtDropDownList").enable(false);
                    $("#stockLockYn").data("kendoExtDropDownList").value("");
                    $("#stockLockYn").data("kendoExtDropDownList").enable(false);
                    $("#endDt").data("kendoExtMaskedDatePicker").value("");
                    $("#regDt").data("kendoExtMaskedDatePicker").value("");
                    $("#approveReqDt").data("kendoExtMaskedDatePicker").value("");


                    frYY = minDate.getFullYear();
                    frMM = minDate.getMonth();
                    frDD = minDate.getDate();

                    toYY = maxDate.getFullYear();
                    toMM = maxDate.getMonth();
                    toDD = maxDate.getDate();
                    $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                    $("#sRegDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                    $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                    $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                }


                //날짜 검증
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
                          }}
                          else{
                        //승인요청일
                          if(id === 'sApproveReqDtFr'){
                              frYY = this.value().getFullYear();
                              frMM = this.value().getMonth();
                              frDD = this.value().getDate();
                              $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                          }else if(id === 'sApproveReqDtTo'){
                              toYY = this.value().getFullYear();
                              toMM = this.value().getMonth();
                              toDD = this.value().getDate();
                              $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                        //등록일
                          }else if(id === 'sRegDtFr'){
                              frYY = this.value().getFullYear();
                              frMM = this.value().getMonth();
                              frDD = this.value().getDate();
                              $("#sRegDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                          }else if(id === 'sRegDtTo'){
                              toYY = this.value().getFullYear();
                              toMM = this.value().getMonth();
                              toDD = this.value().getDate();
                              $("#sRegDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                          }
                    }
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
                                        $("#sStockDdDocNo").val(data[0].stockDdDocNo);
                                        $("#sDocStatCd").data("kendoExtDropDownList").value(data[0].docStatCd);
                                        $("#sStockLockYn").data("kendoExtDropDownList").value(data[0].stockLockYn);
                                        $("#sRegDtFr").data("kendoExtMaskedDatePicker").value(data[0].regDt);
                                        $("#sRegDtTo").data("kendoExtMaskedDatePicker").value("");
                                        $("#sApproveReqDtFr").data("kendoExtMaskedDatePicker").value(data[0].approveReqDt);
                                        $("#sApproveReqDtTo").data("kendoExtMaskedDatePicker").value("");

                                        $("#grid").data("kendoExtGrid").dataSource.read();
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

                                    }
                                   // userSearchPopupWin.close();
                                }
                            }
                        }

                    });
                }

                </script>
