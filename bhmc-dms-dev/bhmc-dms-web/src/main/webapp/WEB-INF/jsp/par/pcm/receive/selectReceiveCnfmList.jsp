<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

            <!--입고 현황-->
        <div id="resizableContainer">
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><%-- <spring:message code="par.btn.receiveCnfmList" /> --%><!-- 입고 현황 --></h1>
                    <div class="btn_right">
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
                                <th scope="row"><spring:message code="par.lbl.bpCd" /><!-- 공급업체 --></th>
                                <td>
                                    <input id="sBpCd" class="form_input form_readonly hidden" readonly>
                                    <input id="sBpNm" class="form_input form_readonly" readonly>
                                </td>
                                <th scope="row"><spring:message code="par.lbl.purcOrdNo" /><!-- 구매오더번호 --></th>
                                <td>
                                    <input id="sPurcOrdNo" class="form_input">
                                </td>
                                <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.grDt" /><!-- 입고일 --></span></th>
                                <td class="required_area">
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sInvcGrDtFr" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sInvcGrDtTo" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.itemCd" /><!-- 부품번호 --></th>
                                <td>
                                    <div class="form_search">
                                        <input id="sItemCd" class="form_input">
                                        <a id="searchItemCd"><!-- 검색 --></a>
                                    </div>
                                </td>
                                <th scope="row"><spring:message code="par.lbl.invcNo" /><!-- INVOICE번호 --></th>
                                <td>
                                    <input id="sMobisInvcNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.invcDt" /><!-- INVOICE일자 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sInvcDtFr" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sInvcDtTo" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="par.lbl.dlPdcCd" /><!-- 배송PDC --></th>
                                <td>
                                    <input id="sDlPdcCd" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.itemNm" /><!-- 부품명 --></th>
                                <td>
                                    <input id="sItemNm" type="text" value="" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="par.lbl.grStrgeCd" /><!-- 입고창고 --></th>
                                <td>
                                    <input id="sGrStrgeCd" class="form_comboBox">
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
            <!-- //입고 현황 -->
            <!-- script -->

            <script>
            var storageList = []
               ,dlPdcCdList = []
               ,storageObj  = {}
               ,dlPdcCdObj  = {}
               ,rowNumber   = 0
               ,searchItemPopupWindow
               ,fnChkDateValue
               ,sessionBpCd = "${bpCd}"
               ,sessionBpNm = "${bpNm}"
               ,sevenDtBf   = "${sevenDtBf}"
               ,toDt        = "${toDt}";

          //창고 선택
            <c:forEach var="obj" items="${storageList}" varStatus="status"> //key value
              storageList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
              storageObj["${obj.strgeCd}"] = "${obj.strgeNm}";
            </c:forEach>

          //배송PDC 선택
            <c:forEach var="obj" items="${dlPdcCdList}" varStatus="status"> //key value
              dlPdcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
              dlPdcCdObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
            </c:forEach>

            $(document).ready(function(){

                //조회조건-창고선택
                $("#sGrStrgeCd").kendoExtDropDownList({
                   dataSource    :storageList
                  ,dataTextField :"cmmCdNm"
                  ,dataValueField:"cmmCd"
                  ,optionLabel:" "
                });
                //조회조건-배송PDC선택
                $("#sDlPdcCd").kendoExtDropDownList({
                   dataSource    :dlPdcCdList
                  ,dataTextField :"cmmCdNm"
                  ,dataValueField:"cmmCd"
                  ,optionLabel:" "
                });
                //조회조건-입고일선택
                $("#sInvcGrDtFr").kendoExtMaskedDatePicker({
                 format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
                });

                $("#sInvcGrDtTo").kendoExtMaskedDatePicker({
                 format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
                });
                //조회조건-INVOICE일자선택
                $("#sInvcDtFr").kendoExtMaskedDatePicker({
                 format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
                });

                $("#sInvcDtTo").kendoExtMaskedDatePicker({
                 format:"<dms:configValue code='dateFormat' />"
                ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                ,change:fnChkDateValue
                });

                $("#searchItemCd").on('click', selectPartsMasterPopupWindow);

                //조회버튼
                $("#btnSearch").kendoButton({
                     click:function(e){
                         $("#grid").data("kendoExtGrid").dataSource.read();
                    }
                });

                //초기화 버튼
                $("#btnInit").kendoButton({
                    click:function(e){
                        initPage();
                    }
                });
                //입고현황 그리드
                $("#grid").kendoExtGrid({
                    gridId:"G-PAR-0808-160901"
                   ,dataSource:{
                     transport:{
                           read:{
                              url:"<c:url value='/par/pcm/receive/selectReceiveCnfmListByCondition.do' />"
                           }
                          ,parameterMap:function(options, operation){

                             if(operation ==="read"){

                               var params = {};

                               //검색조건
                               /* params["recordCountPerPage"]    = options.pageSize;
                               params["pageIndex"]             = options.page;
                               params["firstIndex"]            = options.skip;
                               params["lastIndex"]             = options.skip + options.take; */
                               params["sort"]                  = options.sort;

                               params["sBpCd"]                 = $("#sBpCd").val();
                               params["sItemCd"]               = $("#sItemCd").val();
                               params["sItemNm"]               = $("#sItemNm").val();
                               params["sPurcOrdNo"]            = $("#sPurcOrdNo").val();
                               params["sMobisInvcNo"]          = $("#sMobisInvcNo").val();
                               params["sDlPdcCd"]              = $("#sDlPdcCd").data("kendoExtDropDownList").value();
                               params["sGrStrgeCd"]            = $("#sGrStrgeCd").data("kendoExtDropDownList").value();
                               params["sInvcDtFr"]             = $("#sInvcDtFr").data("kendoExtMaskedDatePicker").value();
                               params["sInvcDtTo"]             = $("#sInvcDtTo").data("kendoExtMaskedDatePicker").value();
                               params["sInvcGrDtTo"]           = $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value();
                               params["sInvcGrDtFr"]           = $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value();

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
                                   id:"selectReceiveCnfmList"
                              ,fields:{
                                    dlrCd               :{ type:"string"} //딜러코드
                                   ,mobisInvcNo         :{ type:"string"} //모비스송장번호(userKey)
                                   ,mobisInvcLineNo     :{ type:"number"} //모비스송장라인번호
                                   ,purcOrdNo           :{ type:"string"} //구매오더번호
                                   ,purcOrdLineNo       :{ type:"number"} //구매오더라인번호
                                   ,itemCd              :{ type:"string"} //품목코드
                                   ,itemNm              :{ type:"string"} //품목명
                                   ,invcQty             :{ type:"number"} //송장수량
                                   ,invcUnitCd          :{ type:"string"} //송장단위코드
                                   ,invcPrc             :{ type:"number"} //송장단가
                                   ,invcAmt             :{ type:"number"} //송장금액
                                   ,vatAmt              :{ type:"number"} //부가세금액
                                   ,invcTotAmt          :{ type:"number"} //송장총금액
                                   ,invcGrDt            :{ type:"date"}   //송장입고일자
                                   ,dlPdcCd             :{ type:"string"} //배송PDC코드
                                   ,grStrgeCd           :{ type:"string"} //입고창고코드
                                   ,grLocCd             :{ type:"string"} //입고위치코드
                                   ,grEndYn             :{ type:"string"} //입고완료여부
                                   ,invcDt              :{ type:"date"}   //송장일자
                                   ,bpCd                :{ type:"string"} //거래처코드
                               }
                           }
                       }
                  }
                  ,selectable:"row"
                  ,scrollable:true
                  ,autoBind  :false
                  ,filterable:false
                  ,appendEmptyColumn:true           //빈컬럼 적용. default:false
                  ,pageable  :false
                  ,editable  :false
                  ,dataBinding:function(e){
                      rowNumber = 0;
                  }
                  ,columns:[
                              {//No
                               field     :"rnum"
                              ,title     :"<spring:message code='par.lbl.line' />"
                              ,sortable  :false
                              ,template  :"#= ++rowNumber #"
                              ,width     :40}
                             ,{//딜러코드
                               field     :"dlrCd"
                              ,title     :"<spring:message code='par.lbl.dlrCd' />"
                              ,hidden    :80}
                             ,{//송장일자
                               field     :"invcDt"
                              ,title     :"<spring:message code='par.lbl.invcDt' />"
                              ,attributes:{"class":"ac"}
                              ,format    :"{0:<dms:configValue code='dateFormat' />}"
                              ,width     :100}
                             ,{//송장입고일자
                               field     :"invcGrDt"
                              ,title     :"<spring:message code='sal.lbl.grDt' />"
                              ,attributes:{"class":"ac"}
                              ,format    :"{0:<dms:configValue code='dateFormat' />}"
                              ,width     :100}
                             ,{//공급업체
                               field     :"bpNm"
                              ,title     :"<spring:message code='par.lbl.bpCd' />"
                              ,attributes:{"class":"ac"}
                              ,width     :60}
                             ,{//모비스송장번호
                               field     :"mobisInvcNo"
                              ,title     :"<spring:message code='par.lbl.invcNo' />"
                              ,width     :140}
                             ,{//모비스송장라인번호
                               field     :"mobisInvcLineNo"
                              ,title     :"<spring:message code='par.lbl.lineNm' />"
                              ,attributes:{"class":"ar"}
                              ,width     :45}
                             ,{//품목코드
                               field     :"itemCd"
                              ,title     :"<spring:message code='par.lbl.itemCd' />"
                              ,width     :140}
                             ,{//품목명
                               field     :"itemNm"
                              ,title     :"<spring:message code='par.lbl.itemNm' />"
                              ,width     :200}
                             ,{//송장수량
                               field     :"invcQty"
                              ,title     :"<spring:message code='par.lbl.qty' />"
                              ,attributes:{"class":"ar"}
                              ,width     :60}
                             ,{//송장단위코드
                               field     :"invcUnitCd"
                              ,title     :"<spring:message code='par.lbl.unit' />"
                              ,attributes:{"class":"ac"}
                              ,width     :80}
                             ,{//입고창고코드
                               field     :"grStrgeCd"
                              ,title     :"<spring:message code='par.lbl.grStrgeCd' />"
                              ,template  :'#= changeGrStrgeCd(grStrgeCd)#'
                              ,width     :100}
                             ,{//입고위치코드
                               field     :"grLocCd"
                              ,title     :"<spring:message code='par.lbl.grLocCd' />"
                              ,width     :220}
                             ,{//구매오더번호
                               field     :"purcOrdNo"
                              ,title     :"<spring:message code='par.lbl.purcOrd' />"
                              ,width     :100}
                             ,{//구매오더라인번호
                               field     :"purcOrdLineNo"
                              ,title     :"<spring:message code='par.lbl.lineNm' />"
                              ,attributes:{"class":"ar"}
                              ,width     :45}
                             ,{//송장단가
                               field     :"invcPrc"
                              ,title     :"<spring:message code='par.lbl.prc' />"
                              ,attributes:{"class":"ar"}
                              ,format    :"{0:n2}"
                              ,width     :100}
                             ,{//송장금액
                               field     :"invcAmt"
                              ,title     :"<spring:message code='par.lbl.amt' />"
                              ,format    :"{0:n2}"
                              ,attributes:{"class":"ar"}
                              ,width     :100}
                             ,{//부가세금액
                               field     :"vatAmt"
                              ,title     :"<spring:message code='par.lbl.vatAmt' />"
                              ,format    :"{0:n2}"
                              ,attributes:{"class":"ar"}
                              ,width     :100}
                             ,{//송장총금액
                               field     :"invcTotAmt"
                              ,title     :"<spring:message code='par.lbl.totAmt' />"
                              ,attributes:{"class":"ar"}
                              ,format    :"{0:n2}"
                              ,width     :100}
                             ,{//배송PDC코드
                               field     :"dlPdcCd"
                              ,title     :"<spring:message code='par.lbl.dlPdcCd' />"
                              ,template  :'#= changeDlPdcCd(dlPdcCd)#'
                              ,width     :140}
                             ,{//입고완료여부
                               field     :"grEndYn"
                              ,title     :"<spring:message code='par.lbl.grEndYn' />"
                              ,attributes:{"class":"ac"}
                              ,width     :100}
                              ]
                });

             //창고그리드 콤보
             changeGrStrgeCd = function(val){
                  var returnVal = "";

                  if(val != null && val != ""){
                      returnVal = storageObj[val];
                  }
                  return returnVal;
              };
             //배송PDC그리드 콤보
             changeDlPdcCd = function(val){
                  var returnVal = "";

                  if(val != null && val != ""){
                      returnVal = dlPdcCdObj[val];
                  }
                  return returnVal;
              };

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
               //INVOICE입고일
                 if(id === 'sInvcDtFr'){
                     var minDate = new Date(sevenDtBf);
                         frYY = minDate.getFullYear();
                         frMM = minDate.getMonth();
                         frDD = minDate.getDate();
                         $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                 }else if(id === 'sInvcDtTo'){
                     var maxDate = new Date(toDt);
                         toYY = maxDate.getFullYear();
                         toMM = maxDate.getMonth();
                         toDD = maxDate.getDate();
                         $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               //입고일
                 }else if(id === 'sInvcGrDtFr'){
                     var minDate = new Date(sevenDtBf);
                         frYY = minDate.getFullYear();
                         frMM = minDate.getMonth();
                         frDD = minDate.getDate();
                         $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                         $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                 }else if(id === 'sInvcGrDtTo'){
                     var maxDate = new Date(toDt);
                         toYY = maxDate.getFullYear();
                         toMM = maxDate.getMonth();
                         toDD = maxDate.getDate();

                         $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                         $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                 }
             }else{
               //INVOICE입고일
                 if(id === 'sInvcDtFr'){
                     frYY = this.value().getFullYear();
                     frMM = this.value().getMonth();
                     frDD = this.value().getDate();
                     $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                 }else if(id === 'sInvcDtTo'){
                     toYY = this.value().getFullYear();
                     toMM = this.value().getMonth();
                     toDD = this.value().getDate();
                     $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
               //입고일
                 }else if(id === 'sInvcGrDtFr'){
                     frYY = this.value().getFullYear();
                     frMM = this.value().getMonth();
                     frDD = this.value().getDate();
                     $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                 }else if(id === 'sInvcGrDtTo'){
                     toYY = this.value().getFullYear();
                     toMM = this.value().getMonth();
                     toDD = this.value().getDate();
                     $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                 }
             }

            }

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
               //그리드 reset
                 $("#grid").data("kendoExtGrid").dataSource.data([]);
               //조회조건reset
                 $("#sBpCd").val(sessionBpCd); //공급업체 기본셋팅
                 $("#sBpNm").val(sessionBpNm); //공급업체 기본셋팅
                 $("#sItemCd").val('');
                 $("#sItemNm").val('');
                 $("#sPurcOrdNo").val('');
                 $("#sMobisInvcNo").val('');
                 $("#sDlPdcCd").data("kendoExtDropDownList").value("");
                 $("#sGrStrgeCd").data("kendoExtDropDownList").value();

                 frYY = minDate.getFullYear();
                 frMM = minDate.getMonth();
                 frDD = minDate.getDate();

                 toYY = maxDate.getFullYear();
                 toMM = maxDate.getMonth();
                 toDD = maxDate.getDate();
                 $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").value(sevenDtBf);
                 $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").value(toDt);
                 $("#sInvcGrDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                 $("#sInvcGrDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
                 $("#sInvcDtFr").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
                 $("#sInvcDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));


             }

             //부품 팝업 열기 함수
             function selectPartsMasterPopupWindow(){

                 searchItemPopupWindow = dms.window.popup({
                    windowId:"ItemMasterPopup"
                    ,title  :"<spring:message code='par.title.partSearch' />" // 부품 조회
                    ,content:{
                        url :"<c:url value='/par/cmm/selectSearchItemPopup.do' />"
                       ,data:{
                           "type"        :""
                          ,"autoBind"    :false
                          ,"itemCd"      :$("#sItemCd").val()
                          ,"itemNm"      :$("#sItemNm").val()
                          ,"callbackFunc":function(data){
                                 $("#sItemCd").val(data[0].itemCd);
                                 $("#sItemNm").val(data[0].itemNm);

                                 searchItemPopupWindow.close();
                          }

                       }
                    }
                 });
             }

            </script>
            <!-- //script -->
