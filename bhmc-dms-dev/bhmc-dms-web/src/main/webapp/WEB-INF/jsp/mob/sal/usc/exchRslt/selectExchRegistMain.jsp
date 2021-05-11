<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<!-- 날짜, 통화 -->
<dms:configValue code='dateFormat' var="_dateFormat" />
<dms:configValue code='dateTimeFormat' var="_dateTimeFormat" />

    <section id="content">
        <!-- content_list -->
        <section id="content_list">
            <div class="content_title conttitlePrev">
                <h2 id="content_list_title"><spring:message code="sal.menu.midAgeVehicleChgSaleApprvSrch" /><!-- 중고차치환판매심사결과조회 --></h2>
            </div>
            <%-- <div class="skeyarea">
                <div>
                    <table class="slist01">
                        <colgroup>
                            <col style="width:35%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <tr id="search1Area">
                                <th scope="row"><span><spring:message code='crm.lbl.officeNm' /><!-- 사무소 --></span></th>
                                <td><span name="searchStr"></span><span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search2Area">
                                <th scope="row"><span><spring:message code='global.lbl.dealer' /><!-- 딜러 --></span></th>
                                <td><span name="searchStr"></span><span class="btn_delete">삭제</span></td>
                            </tr>
                            <tr id="search3Area">
                                <th scope="row"><span><spring:message code='global.lbl.carRegDt' /><!-- 등록일자 --></span></th>
                                <td><span name="searchStr"></span><span class="btn_delete">삭제</span></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="btnarea">
                        <span class="sbtn">전체조건 삭제</span>
                    </div>
                </div>
            </div> --%>

            <div class="listarea01">
                <div class="listhead dlistitem">
                    <span style="width:70%"><spring:message code="sal.lbl.carVinNo" /><!-- Vin No --></span>
                    <span style="width:30%"><spring:message code="global.lbl.carNo" /><!-- 차량번호 --></span>
                    <%-- <span class="clboth" style="width:70%"><spring:message code="sal.lbl.uploadDtTime" /><!-- 등록일자 --></span> --%>
                    <span style="width:30%" class="clboth"><spring:message code="global.lbl.type" /><!-- 유형 --></span>
                    <span style="width:35%"><spring:message code='sal.lbl.payYyMmDt' /><!-- 지불년월 --></span>
                    <span style="width:35%"><spring:message code="crm.lbl.amount" /><!-- 지불금액 --></span>
                </div>
                <iframe id="mainList" border="0" frameborder="0" width="100%" height=""></iframe>
                <div class="dlistitem bgNone" style="display:none;" id="listarea_noData"><span></span></div>
            </div>
        </section>


    <!-- content_search -->
    <section id="content_search" class="content_search" style="display:none;">
        <div class="content_title conttitlePrev">
            <h2><spring:message code="sal.menu.midAgeVehicleChgSaleApprvSrch" /><!-- 중고차치환판매심사결과조회 --></h2>
        </div>
        <div class="formarea">
<%--             <input type="hidden" id="sDlrCd" name="sDlrCd" value="${dlrCd}" />
 --%>
            <table class="flist01">
                <caption></caption>
                <colgroup>
                    <col style="width:30%;">
                    <col style="">
                </colgroup>
                 <tbody>
                    <tr style="display: none;">
                        <th scope="row"><spring:message code='global.lbl.division' /><!-- 사업부 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sDiviCd" name="sDiviCd" /></div>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <th scope="row"><spring:message code='crm.lbl.officeNm' /><!-- 사무소 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sOffCd" name="sOffCd" /></div>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <th scope="row"><spring:message code='global.lbl.sung' /><!-- 성 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sSungCd" name="sSungCd" /></div>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <th scope="row"><spring:message code='sal.lbl.city' /><!-- 시 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sCityCd" name="sCityCd" /></div>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <th scope="row"><spring:message code='global.lbl.dealer' /><!-- 딜러 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sDlrCd" name="sDlrCd" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.carRegDt' /><!-- 등록일자 --></th>
                        <td class="f_term">
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sUploadStartDt" style="width:140px" class=""  />
                                <span class="date" onclick="calpicker('sUploadStartDt');">날짜선택</span>
                            </div><span class="termtext"> ∼</span>
                            <div class="f_item01" style = "width:82%">
                                <input type="search" id="sUploadEndDt" style="width:140px" class=""  />
                                <span class="date" onclick="calpicker('sUploadEndDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr>
                    <%-- <tr>
                       <th scope="row"><spring:message code='sal.lbl.payYyMmDt' /><!-- 지불년월 --></th>
                        <td class="f_term">
                            <div class="f_item01">
                                <input type="text" id="sPayYyMmDt" style="width:140px" class="" readOnly />
                                <span class="date" onclick="calpicker('sPayYyMmDt');">날짜선택</span>
                            </div>
                        </td>
                    </tr> --%>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.payYyMmDt' /><!-- 지불년월 --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sPayYyMmDt" name="sPayYyMmDt" /></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='sal.lbl.carVinNo' /><!-- Vinno --></th>
                        <td>
                            <div class="f_text"><input type="text" id="sVinNo" name="sVinNo" /></div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="con_btnarea">
            <dms:access viewId="VIEW-D-12637" hasPermission="${dms:getPermissionMask('READ')}">
                <span id="btnSearch" class="btnd1"><span class="search"><spring:message code='global.btn.search' /><!-- 조회 --></span></span>
            </dms:access>
        </div>
    </section>

    <!-- content_detail -->
    <div class="content_right" id="itemForm">
        <section id="content_detail" class="content_detail" style="display:none">
            <div class="co_group">
                <div class="content_title conttitlePrev">
                    <h2><spring:message code="global.title.defaultInfo" /><!-- 기본 정보 --></h2>
                </div>
                <div class="formarea">
                    <table  class="flist01">
                        <caption></caption>
                        <colgroup>
                            <col style="width:30%;">
                            <col style="">
                        </colgroup>
                        <tbody>
                            <%-- <tr>
                                <th scope="row"><spring:message code='sal.lbl.uploadDtTime' /></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="uploadDt" disabled="disabled" /></div>
                                </td>
                            </tr> --%>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.type' /><!-- 유형 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="exchTp" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.dlrNm' /><!-- 딜러명 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="dlrNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.city' /><!-- 도시 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="cityCd" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.sung' /><!-- 성 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="sungCd" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='crm.lbl.officeNm' /><!-- 사무소 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="officeCd" disabled="disabled" /></div>
                                </td>
                           </tr>
                           <tr>
                                <th scope="row"><spring:message code='global.lbl.division' /><!-- 사업부 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="sdptCd" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.brand' /><!-- 브랜드 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ocarMakerTp" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.oldCarOwnerNm' /><!-- 기존 차주명 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ocarOwnerNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.brand' /><!-- 브랜드 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ocarMakerNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.carVinNo' /><!-- Vin No --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ocarVinNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carNo' /><!-- 차량번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ocarNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.usedCarBillingNo' /><!-- 중고차 영수증 번호 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ocarRcptNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.newCarVinNo' /><!-- 신차 Vin No --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ncarVinNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.code' /><!-- 코드 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ocarDlrCd" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.newCarOwnerNm' /><!-- 신차주명 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ncarOwnerNm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.idCardNo' /><!-- ID 카드 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ssnCrnNo" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.carLine' /><!-- 차종 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ncarCarlineCd" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.gradeCd' /><!-- 등급 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="ncarGradeCd" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.terminal' /><!-- 단말기 --></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="tmrCd" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.terminalMonth' /><!-- 단말기 월--></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="tmrMm" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.terminalYear' /><!-- 단말기 년--></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="tmrYy" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.evalRslt' /><!-- 심사결과--></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="evalRsltCd" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.imsAmt' /><!-- 청구 금액--></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="payAmt" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.mayYyMmDt' /><!-- 자재년월--></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="matYyMmDt" disabled="disabled" /></div>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='sal.lbl.payYyMmDt' /><!-- 지불년월--></th>
                                <td>
                                    <div class="f_text f_disabled"><input type="text" id="payYyMmDt" disabled="disabled" /></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="con_btnarea">
                <div><span class="btnd1" id="detailConfirmBtn"><spring:message code='global.btn.close' /><!-- 닫기 --></span></div>
            </div>
        </section>
    </div>

    <div id="docu_prev" ><spring:message code="global.btn.pre" /><!-- 이전 --></div>

<script type="text/javascript">
    var dateFormat =  '<dms:configValue code="dateFormat" />';

  //현재일자
    var toDay = "${toDay}";
    var oneDay = "${oneDay}";
    var pageGubun = "${sysCd}";        //"D" : DMS , "I" : DCS

    var lastDays =[];
    lastDays.push("");

    /************* 사업부 SELECT BOX  *******************/
    var divisionCdDs = [];
    <c:forEach var="obj" items="${sdptCdList}">
    divisionCdDs.push({"diviCd":"${obj.sdptCd}", "diviNm":"${obj.sdptNm}"});
    </c:forEach>
    var divisionCdArr = dms.data.arrayToMap(divisionCdDs, function(obj){return obj.cmmCd});
    /************* 사업부 SELECT BOX  *******************/

    $(document).ready(function() {


        var year = Number(oneDay.split("-")[0]);
        var month = Number(oneDay.split("-")[1]);
        var yn=0;
        var mn=0;

        for(yn=year; yn>year-5; yn--){
            if((yn)==year){
                for(mn=month-1; mn>0; mn--){
                    if(mn>9){
                        lastDays.push((yn)+"-"+(mn));
                    }else{
                        lastDays.push((yn)+"-0"+(mn));
                    }
                }
            }else{
                for(mn=12; mn>0; mn--){
                    if(mn>9){
                        lastDays.push((yn)+"-"+(mn));
                    }else{
                        lastDays.push((yn)+"-0"+(mn));
                    }
                }
            }
        }

     // 조회조건 - 구분
        $("#sPayYyMmDt").kendoExtDropDownList({
            //dataTextField:"cmmCdNm"
            //,dataValueField:"cmmCd"
           dataSource:lastDays
            ,optionLabel:year+"-"+(month>9 ? month : "0"+month)
            //,optionLabel:" "   // 전체
        });






      //사업부
        $("#sDiviCd").kendoExtDropDownList({
            dataTextField:"diviNm"
           ,dataValueField:"diviCd"
           ,dataSource:divisionCdDs
           ,optionLabel:" "   // 전체
           ,select:function(e){
               var dataItem = this.dataItem(e.item);
               $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sOffCd").data("kendoExtDropDownList").enable(true);


               if(dataItem.diviCd == ""){
                   $("#sOffCd").data("kendoExtDropDownList").setDataSource([]);
                   $("#sOffCd").data("kendoExtDropDownList").enable(false);
                   return false;
               }

               var responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/cmm/selectDealerOffice.do' />"
                   ,data:JSON.stringify({"sSdptCd":dataItem.diviCd})
                   ,async:false
               });
               $("#sOffCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
               $("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
           }
        });

        // 사무소
        $("#sOffCd").kendoExtDropDownList({
            dataTextField:"distOfficeNm"
           ,dataValueField:"distOfficeCd"
           ,select:function(e){
               var dataItem = this.dataItem(e.item);
               $("#sSungCd").data("kendoExtDropDownList").setDataSource([]);
               $("#sSungCd").data("kendoExtDropDownList").enable(true);


               if(dataItem.offCd == ""){
                   $("#sSungCd").data("kendoExtDropDownList").setDataSource([]);
                   $("#sSungCd").data("kendoExtDropDownList").enable(false);
                   return false;
               }

               var responseJson = dms.ajax.getJson({
                   url:"<c:url value='/sal/cmm/selectDealerSung.do' />"
                   ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":dataItem.distOfficeCd})
                   ,async:false
               });
               $("#sSungCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
               $("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
           }
           ,optionLabel:" "   // 전체
        });
        $("#sOffCd").data("kendoExtDropDownList").enable(false);




        //성
        $("#sSungCd").kendoExtDropDownList({
            dataTextField:"saleDlrSungNm"
            ,dataValueField:"saleDlrSungCd"
            ,optionLabel:" "    // 전체
            ,select:function(e){
                var dataItem = this.dataItem(e.item);

                $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sCityCd").data("kendoExtDropDownList").enable(true);

                if(dataItem.sungCd == ""){
                    $("#sCityCd").data("kendoExtDropDownList").setDataSource([]);
                    //$("#sCityCd").data("kendoExtDropDownList").enable(false);
                    return false;
                }

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/cmm/selectDealerCity.do' />"
                    ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":$("#sOffCd").data("kendoExtDropDownList").value(),"sSaleDlrSungCd":dataItem.saleDlrSungCd})
                    ,async:false
                });
                $("#sCityCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
                $("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
            }
        });
        $("#sSungCd").data("kendoExtDropDownList").enable(false);


        //시
        $("#sCityCd").kendoExtDropDownList({
            dataTextField:"saleDlrCityNm"
            ,dataValueField:"saleDlrCityCd"
            ,select:function(e){
                var dataItem = this.dataItem(e.item);

                $("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
                $("#sDlrCd").data("kendoExtDropDownList").enable(true);

                if(dataItem.sungCd == ""){
                    $("#sDlrCd").data("kendoExtDropDownList").setDataSource([]);
                    $("#sDlrCd").data("kendoExtDropDownList").enable(false);
                    return false;
                }

                var responseJson = dms.ajax.getJson({
                    url:"<c:url value='/sal/cmm/selectDealer.do' />"
                    ,data:JSON.stringify({"sSdptCd":$("#sDiviCd").data("kendoExtDropDownList").value(),"sDistOfficeCd":$("#sOffCd").data("kendoExtDropDownList").value()
                        ,"sSaleDlrSungCd":dataItem.saleDlrSungCd,"sSaleDlrCityCd":dataItem.saleDlrCityCd})
                    ,async:false
                });
                $("#sDlrCd").data("kendoExtDropDownList").setDataSource(responseJson.data);
            }
            ,optionLabel:" "   // 전체
        });
        $("#sCityCd").data("kendoExtDropDownList").enable(false);


        //딜러
        $("#sDlrCd").kendoExtDropDownList({
            dataTextField:"dlrNm"
            ,dataValueField:"dlrCd"
            ,optionLabel:" "   // 전체
        });
        $("#sDlrCd").data("kendoExtDropDownList").enable(false);



        if(pageGubun == 'D'){
            //사업부
            $("#sDiviCd").data("kendoExtDropDownList").setDataSource([{diviCd:"${dealerVO.sdptCd}", diviNm:"${dealerVO.sdptNm}"}]);
            $("#sDiviCd").data("kendoExtDropDownList").enable(false);
            $("#sDiviCd").data("kendoExtDropDownList").value("${dealerVO.sdptCd}");

            //사무소
            $("#sOffCd").data("kendoExtDropDownList").setDataSource([{distOfficeCd:"${dealerVO.distOfficeCd}", distOfficeNm:"${dealerVO.distOfficeNm}"}]);
            $("#sOffCd").data("kendoExtDropDownList").enable(false);
            $("#sOffCd").data("kendoExtDropDownList").value("${dealerVO.distOfficeCd}");

            //성
            $("#sSungCd").data("kendoExtDropDownList").setDataSource([{saleDlrSungCd:"${dealerVO.saleDlrSungCd}", saleDlrSungNm:"${dealerVO.saleDlrSungNm}"}]);
            $("#sSungCd").data("kendoExtDropDownList").enable(false);
            $("#sSungCd").data("kendoExtDropDownList").value("${dealerVO.saleDlrSungCd}");

            //도시
            $("#sCityCd").data("kendoExtDropDownList").setDataSource([{saleDlrCityCd:"${dealerVO.saleDlrCityCd}", saleDlrCityNm:"${dealerVO.saleDlrCityNm}"}]);
            $("#sCityCd").data("kendoExtDropDownList").enable(false);
            $("#sCityCd").data("kendoExtDropDownList").value("${dealerVO.saleDlrCityCd}");

            //딜러
            var dlrCdNm = "["+"${dealerVO.dlrCd}" +"]"+ "${dealerVO.dlrNm}";
            $("#sDlrCd").data("kendoExtDropDownList").setDataSource([{dlrCd:"${dealerVO.dlrCd}", dlrNm:dlrCdNm}]);
            $("#sDlrCd").data("kendoExtDropDownList").enable(false);
            var dlrCdNm = "${dealerVO.dlrCd}" + "${dealerVO.dlrNm}";
            $("#sDlrCd").data("kendoExtDropDownList").value("${dealerVO.dlrCd}");
        }


        /************************************************* 사업부,사무소,성,시 셋팅 END **************************************************/

        $("#sDlrCd").val("${dlrCd}");

        //$("#sUploadStartDt").val("${oneDay}");
        //$("#sUploadEndDt").val("${today}");

        /* fnInitPage = function (){
            $(".skeyarea").hide();
        } */

        //fnInitPage();

        // 타이틀
        $("#header_title").html("<spring:message code='sal.menu.midAgeVehicleChgSaleApprvSrch' />");
        $("#header_title").css("font-size","17px");

        $("#header_title").on("click", moveSearch);$("#header_title").html("<span class='search_open'>" + $("#header_title").html()+"</span>");

        // 목록 조회
        $("#mainList").attr("src", "<c:url value='/mob/sal/usc/exchRslt/selectExchRegistList.do' />");

        // 버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                $("#listarea_noData").hide();
                mob.loading.show();

                /* var sSdptCd = $("#sSdptCd");
                var sDlrCd = $("#sDlrCd");
                var sUploadStartDt = $("#sUploadStartDt");
                var sUploadEndDt = $("#sUploadEndDt");

                if(sSdptCd.val() != "") {
                    $("#search1Area span[name='searchStr']").text(sSdptCd.val());
                }

                if(sDlrCd.val() != "") {
                    $("#search2Area span[name='searchStr']").text(sDlrCd.val());
                }

                if (sUploadStartDt.val() != "" && sUploadEndDt.val() != "") {
                    $("#search3Area span[name='searchStr']").html(sUploadStartDt.val() + " ~<br>" + sUploadEndDt.val());
                }
                else {
                    if(sUploadStartDt.val() != "") {
                        $("#search3Area span[name='searchStr']").html(sUploadStartDt.val() + " ~");
                    }
                    else if (sUploadEndDt.val() != "") {
                        $("#search3Area span[name='searchStr']").text(" ~ " + sUploadEndDt.val());
                    }
                } */

                //fnSetSearchBox();
                contentList();
            }
        });

        // 버튼 - 이전
        $("#docu_prev").bind("click", function() {
            if ($("#content_list").css("display") == "block") { goMain(); }
            else if ($("#content_search").css("display") == "block") { contentList(); }
            else if ($("#content_detail").css("display") == "block") { contentList(); }
        });

        //버튼 - TOP
        $("#docu_top").bind("click", function() {
            $("body,html").animate({scrollTop:0}, 200);
        });

        //상단으로 이동
        $(window).scroll(function () {
            if ($(this).scrollTop() != 0) {
                $("#docu_top").fadeIn();
            }
            else {
                $("#docu_top").fadeOut();
            }
        });
    });
</script>

<script type="text/javascript">
    //메인화면 가기
    function goMain() {
        window.open("<c:url value='/mob/cmm/main/selectMain.do'/>", "_self");
    }

    //목록페이지 보기
    function contentList() {
        $("#content_search").css("display", "none");
        $("#content_detail").css("display", "none");
        $("#content_list").css("display", "block");

        // 0705
        $("#content_list").css("display","block");$("#header_title span").attr("class","search_open");

        document.getElementById("mainList").contentWindow.document.location.reload();
    }

    //검색페이지 보기
    function contentSearch() {
        $("#content_list").css("display", "none");
        $("#content_detail").css("display", "none");
        $("#content_search").css("display", "block");
    }

    //상세페이지 보기
    fnContentDetail = function (key) {
        $("#content_list").css("display", "none");
        $("#content_search").css("display", "none");
        $("#content_detail").css("display", "block");

        // 0705
        $("#header_title span").removeAttr("class");

        if( key != null && key != 'undefined') {
            gCrud = 'U';

            $("#uploadDt").val(key.uploadDt);
            $("#exchTp").val(key.exchTp);
            $("#dlrNm").val(key.dlrNm);
            $("#cityCd").val(key.cityCd);
            $("#sungCd").val(key.sungCd);
            $("#officeCd").val(key.officeCd);
            $("#sdptCd").val(key.sdptCd);
            $("#ocarMakerTp").val(key.ocarMakerTp);
            $("#ocarOwnerNm").val(key.ocarOwnerNm);
            $("#ocarMakerNm").val(key.ocarMakerNm);
            $("#ocarVinNo").val(key.ocarVinNo);
            $("#ocarNo").val(key.ocarNo);
            $("#ocarDlrCd").val(key.ocarDlrCd);
            $("#ocarRcptNo").val(key.ocarRcptNo);
            $("#ncarVinNo").val(key.ncarVinNo);
            //$("#ocarDlrCd").val(key.ocarDlrCd);
            $("#ncarOwnerNm").val(key.ncarOwnerNm);
            $("#ssnCrnNo").val(key.ssnCrnNo);
            $("#ncarCarlineCd").val(key.ncarCarlineCd);
            $("#ncarGradeCd").val(key.ncarGradeCd);
            $("#tmrCd").val(key.tmrCd);
            $("#tmrMm").val(key.tmrMm);
            $("#tmrYy").val(key.tmrYy);
            $("#evalRsltCd").val(key.evalRsltCd);
            //$("#payAmt").val(key.payAmt);
            $("#payAmt").val(dms.format.currency(Number(key.payAmt)));
            $("#matYyMmDt").val(key.matYyMmDt);
            $("#payYyMmDt").val(key.payYyMmDt);
        }
    }
</script>