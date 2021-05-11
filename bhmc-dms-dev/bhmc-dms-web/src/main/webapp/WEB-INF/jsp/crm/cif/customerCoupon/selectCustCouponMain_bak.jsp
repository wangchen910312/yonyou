<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


        <div id="resizableContainer">  <!-- resizableContainer Start-->
        <!-- 탭메뉴 전체 영역 -->
        <div class="tab_area" id="tab_area_main"> <!-- 탭메뉴 시작-->
            <ul>
                <li id="couponInfoTab" class="k-state-active" ><spring:message code="crm.lbl.coupon" /><!-- 쿠폰 --></li>
                <li id="packageInfoTab"><spring:message code="crm.lbl.package" /> <!-- 패키지--></li>
            </ul>
            <span class="btn_right_absolute2">
<%--                 <button type="button" id="btnCtlResetCoupon" class="btn_m btn_reset couponInfoTab"><spring:message code="global.btn.init" /><!-- 초기화 --></button> --%>
                <button type="button" id="btnCtlSearchCoupon" class="btn_m btn_search couponInfoTab"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                <button type="button" id="btnCtlAddCoupon" class="btn_m btn_add couponInfoTab"><spring:message code='global.btn.add' /><!-- 추가 --></button>
<%--                 <button type="button" id="btnCtlCanCoupon" class="btn_m btn_cancel couponInfoTab"><spring:message code="global.btn.cancel" /><!-- 취소 --></button> --%>
                <button type="button" id="btnCtlSaveCoupon" class="btn_m btn_save couponInfoTab"><spring:message code="global.btn.save" /><!-- 저장 --></button>
<%--                 <button type="button" id="btnCtlResetPackage" class="btn_m btn_reset packageInfoTab" style="display:none;"><spring:message code="global.btn.init" /><!-- 초기화 --></button> --%>
                <button type="button" id="btnCtlSearchPackage" class="btn_m btn_search packageInfoTab" style="display:none;"><spring:message code='global.btn.search' /><!-- 조회 --></button>
                <button type="button" id="btnCtlAddPackage" class="btn_m btn_add packageInfoTab" style="display:none;"><spring:message code='global.btn.add' /><!-- 추가 --></button>
<%--                 <button type="button" id="btnCtlCanPackage" class="btn_m btn_cancel packageInfoTab" style="display:none;"><spring:message code="global.btn.cancel" /><!-- 취소 --></button> --%>
                <button type="button" id="btnCtlSavePackage" class="btn_m btn_save packageInfoTab" style="display:none;"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </span>
            <div id="custInfoTabDiv" class="mt0"> <!-- custInfoTabDiv Start -->

                <section class="group"> <!-- group Start -->
                    <div class="header_area">
                        <div class="table_form" role="search" data-btnid="btnCtlSearchCoupon">
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
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><spring:message code="crm.lbl.cupnNm"/></th><!-- 쿠폰명 -->
                                        <td>
                                            <input type="text" id="sCupnNm" name="sCupnNm" maxlength="100" value="" class="form_input"/>
                                        </td>
                                        <th scope="row"><spring:message code="crm.lbl.dcUseTp"/></th><!-- 할인사용구분 -->
                                        <td>
                                            <input type="text" id="sDcUseTp" name="sDcUseTp" maxlength="100" value="" class="form_comboBox" />
                                        </td>
                                        <th scope="row"></th>
                                        <td>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="table_grid">
                        <div id="couponGrid"></div>
                    </div>
                    <div class="tab_area" id="tab_area_sub_01"> <!-- 서브 탭 Start -->
                        <ul>
                            <li id="basicSubTab" class="k-state-active" ><spring:message code="global.lbl.basicInfo" /><!-- 기본정보 --></li>
                            <li id="custSubTab"><spring:message code="global.lbl.customer" /> <!-- 고객--></li>
                            <li id="vinSubTab"><spring:message code="global.lbl.vinNo" /> <!-- VIN--></li>
                        </ul>
                        <span class="btn_right_absolute2">
<%--                             <button type="button" id="btnCtlSubCustSubSMS" class="btn_s custSubTab" style="display:none;"><spring:message code="global.btn.sms" /><!-- SMS --></button> --%>
<%--                             <button type="button" id="btnCtlSubCustSubDownload" class="btn_s custSubTab" style="display:none;"><spring:message code="crm.btn.templateDownload" /><!-- 양식다운로드 --></button> --%>
<%--                             <button type="button" id="btnCtlSubCustSubUpload" class="btn_s custSubTab" style="display:none;"><spring:message code="global.btn.excelImport" /><!-- 업로드 --></button> --%>
                            <button type="button" id="btnCtlSubCustSubAdd" class="btn_s custSubTab" style="display:none;"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                            <button type="button" id="btnCtlSubCustSubDel" class="btn_s custSubTab" style="display:none;"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                            <button type="button" id="btnCtlSubCustSubPub" class="btn_s custSubTab" style="display:none;"><spring:message code="crm.lbl.publish" /><!-- 발행 --></button>

                            <button type="button" id="btnCtlSubvinSubAdd" class="btn_s vinSubTab" style="display:none;"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                            <button type="button" id="btnCtlSubvinSubDel" class="btn_s vinSubTab" style="display:none;"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                            <button type="button" id="btnCtlSubvinSubPub" class="btn_s vinSubTab" style="display:none;"><spring:message code="crm.lbl.publish" /><!-- 발행 --></button>
                        </span>
                        <div id="basicSubTabDiv" class="mt0"> <!-- basicSubTabDiv Start -->
                        <div id="custInfoTabDivForm" name="custInfoTabDivForm" onsubmit="return false;">  <!-- custInfoTabDivForm Start -->

                            <section class="left_areaStyle">
                                <section class="group">
                                    <div class="header_area">
                                        <h3 class="title_basic"><spring:message code="global.lbl.basicInfo"/></h3>
                                    </div>
                                    <div class="table_form">
                                        <table>
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width:18%;">
                                                <col style="width:32%;">
                                                <col style="width:18%;">
                                                <col style="width:32%;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row"><spring:message code="crm.lbl.couponSeq"/></th>  <!-- 쿠폰시퀀스 -->
                                                    <td>
                                                        <input type="text" id="cupnSeq" name="cupnSeq" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                                    </td>
                                                    <th scope="row"><spring:message code="crm.lbl.useYn"/></th> <!-- 사용여부 -->
                                                    <td>
                                                        <input type="text" id="useYn" name="useYn" value="" class="form_comboBox" data-json-obj="true" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><spring:message code="crm.lbl.cupnNm"/></th> <!-- 쿠폰명 -->
                                                    <td colspan="3">
                                                        <input type="text" id="cupnNm" name="cupnNm" value="" class="form_input" data-json-obj="true" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><spring:message code="crm.lbl.validPrid"/></th>  <!-- 유효일자 -->
                                                    <td>
                                                        <input type="text" id="cupnValidPrid" name="cupnValidPrid" value="" class="form_numeric ar" data-json-obj="true" />
                                                    </td>
                                                    <th scope="row"><spring:message code="crm.lbl.dcUseTp"/></th> <!-- 할인사용구분 -->
                                                    <td>
                                                        <input type="text" id="dcUseTp" name="dcUseTp" value="" class="form_comboBox" data-json-obj="true" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><spring:message code="crm.lbl.cupnFromDt"/></th>  <!-- 쿠폰시작일 -->
                                                    <td>
                                                        <input type="text" id="cupnFromDt" name="cupnFromDt" value="" class="form_datepicker" data-json-obj="true" />
                                                    </td>
                                                    <th scope="row"><spring:message code="crm.lbl.cupnToDt"/></th> <!-- 쿠폰종료일 -->
                                                    <td>
                                                        <input type="text" id="cupnToDt" name="cupnToDt" value="" class="form_datepicker" data-json-obj="true" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </section>
                            </section>
                            <section class="right_areaStyle">
                                <section class="group">
                                    <div class="header_area">
                                        <h3 class="title_basic"><spring:message code="crm.lbl.discountInfo"/></h3>  <!-- 할인정보 -->
                                    </div>
                                    <div class="table_form">
                                        <table>
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width:18%;">
                                                <col style="width:32%;">
                                                <col style="width:18%;">
                                                <col style="width:32%;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row"><spring:message code="crm.lbl.dcCd"/></th> <!-- 할인방식 -->
                                                    <td colspan="3">
                                                        <input type="text" id="dcCd" name="dcCd" value="" class="form_comboBox" data-json-obj="true" />
                                                    </td>
                                                </tr>
                                                <tr class="dcCd01">
                                                    <th scope="row"><spring:message code="global.lbl.lbrDcRate"/></th> <!-- 공임할인율 -->
                                                    <td>
                                                        <input type="text" id="lbrDcRate" name="lbrDcRate" value="" class="form_numeric ar" data-json-obj="true" />
                                                    </td>
                                                    <th scope="row"><spring:message code="global.lbl.parDcRate"/></th> <!-- 부품할인율 -->
                                                    <td>
                                                        <input type="text" id="parDcRate" name="parDcRate" value="" class="form_numeric ar" data-json-obj="true" />
                                                    </td>
                                                </tr>
                                                <tr class="dcCd01">
                                                    <th scope="row"><spring:message code="crm.lbl.totDcRate"/></th> <!-- 총액할인율 -->
                                                    <td>
                                                        <input type="text" id="totDcRate" name="totDcRate" value="" class="form_numeric ar" data-json-obj="true" />
                                                    </td>
                                                </tr>
                                                <tr class="dcCd02" style="display:none;">
                                                    <th scope="row"><spring:message code="global.lbl.lbrDcAmt"/></th> <!-- 공임할인금액 -->
                                                    <td>
                                                        <input type="text" id="lbrDcAmt" name="lbrDcAmt" value="" class="form_numeric ar" data-json-obj="true" />
                                                    </td>
                                                    <th scope="row"><spring:message code="global.lbl.parDcAmt"/></th> <!-- 부품할인금액 -->
                                                    <td>
                                                        <input type="text" id="parDcAmt" name="parDcAmt" value="" class="form_numeric ar" data-json-obj="true" />
                                                    </td>
                                                </tr>
                                                <tr class="dcCd02" style="display:none;">
                                                    <th scope="row"><spring:message code="crm.lbl.totDcAmt"/></th> <!-- 총액할인금액 -->
                                                    <td>
                                                        <input type="text" id="totDcAmt" name="totDcAmt" value="" class="form_numeric ar" data-json-obj="true" />
                                                    </td>
                                                </tr>
                                                <tr class="dcCd03" style="display:none;">
                                                    <th scope="row"><spring:message code="sal.lbl.goodsCd"/></th> <!-- 용품코드 -->
                                                    <td>
                                                        <input type="text" id="itemCd" name="itemCd" value="" class="form_input form_readonly" readonly data-json-obj="true" />
                                                    </td>
                                                    <th scope="row"><spring:message code="crm.lbl.prenGoods"/></th> <!-- 사은품 -->
                                                    <td>
                                                        <div class="form_search">
                                                            <input type="text" id="itemNm" value="" class="form_input form_readonly " data-json-obj="true" />
                                                            <a href="#;" class="goodsSearch"><spring:message code="crm.lbl.prenGoods" /><!-- 사은품조회 --></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr class="dcCd03" style="display:none;">
                                                    <th scope="row"><spring:message code="global.lbl.qty"/></th> <!-- 수량 -->
                                                    <td>
                                                        <input type="text" id="goodsCnt" name="goodsCnt" value="" class="form_numeric ar" data-json-obj="true" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </section>
                            </section>
                        </div> <!-- custInfoTabDivForm End -->
                        </div> <!-- basicSubTabDiv End -->
                        <div id="custSubTabDiv" class="mt0"> <!-- custSubTabDiv Start -->
                            <div class="header_area">
                                <h2 class="title_basic"><spring:message code='crm.title.package'/></h2><!-- 패키지 -->
                            </div>
                            <div class="table_grid">
                                <div id="custSubGrid"></div>
                            </div>
                        </div> <!-- custSubTabDiv End -->
                        <div id="vinSubTabDiv" class="mt0"> <!-- vinSubTabDiv Start -->
                            <div class="header_area"></div>
                            <div class="table_grid">
                                <div id="vinSubGrid"></div>
                            </div>
                        </div> <!-- vinSubTabDiv End -->
                    </div>
                </section> <!-- group End -->
            </div> <!-- custInfoTabDiv end -->

            <div id="packageInfoTabDiv" class="mt0"> <!-- packageInfoTabDiv Start -->
                <section class="group">
                <div class="header_area">
                <div class="table_form" role="search" data-btnid="btnSearch">
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
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.pkgNm"/></th><!-- 패키지명 -->
                                <td>
                                    <input type="text" id="sPkgNm" name="sPkgNm" maxlength="100" value="" class="form_input" data-json-obj="true" />
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                </div>
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.package'/></h2><!-- 패키지 -->
                    <div class="btn_right">
                        <button class="btn_s btn_add" id="btnPackageAdd"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
                        <button class="btn_s btn_save" id="btnPackageSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                        <button class="btn_s btn_cancel" id="btnPackageCan"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="packageGrid"></div>
                </div>

                    <div class="tab_area" id="tab_area_sub_02"> <!-- tab_area_sub_02 Start -->
                        <ul>
                            <li id="basicSubTab_02" class="k-state-active" ><spring:message code="global.lbl.basicInfo" /><!-- 기본정보 --></li>
                            <li id="custSubTab_02"><spring:message code="global.lbl.customer" /> <!-- 고객--></li>
                            <li id="vinSubTab_02"><spring:message code="global.lbl.vinNo" /> <!-- VIN--></li>
                        </ul>
                        <span class="btn_right_absolute2">
                            <button type="button" id="btnPkgCtlBasicSubAdd" class="btn_s basicSubTab_02">11<spring:message code="global.btn.add" /><!-- 추가 --></button>
                            <button type="button" id="btnPkgCtlBasicSubDel" class="btn_s basicSubTab_02"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                            <button type="button" id="btnPkgCtlBasicSubSave" class="btn_s basicSubTab_02"><spring:message code="global.btn.save" /><!-- 저장 --></button>

                            <button type="button" id="btnPkgCtlcustSubAdd" class="btn_s custSubTab_02" style="display:none;"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                            <button type="button" id="btnPkgCtlcustSubDel" class="btn_s custSubTab_02" style="display:none;"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                            <button type="button" id="btnPkgCtlcustSubSave" class="btn_s custSubTab_02" style="display:none;"><spring:message code="crm.lbl.publish" /><!-- 발행 --></button>

                            <button type="button" id="btnPkgCtlvinSubAdd" class="btn_s vinSubTab_02" style="display:none;"><spring:message code="global.btn.add" /><!-- 추가 --></button>
                            <button type="button" id="btnPkgCtlvinSubDel" class="btn_s vinSubTab_02" style="display:none;"><spring:message code="global.btn.del" /><!-- 삭제 --></button>
                            <button type="button" id="btnPkgCtlvinSubSve" class="btn_s vinSubTab_02" style="display:none;"><spring:message code="crm.lbl.publish" /><!-- 발행 --></button>
                        </span>
                        <div id="basicSubTab_02Div" class="mt0"> <!-- basicSubTab_02Div Start -->
                            <div class="header_area"></div>
                            <div class="table_grid">
                                <div id="basicSubTab_02Grid"></div>
                            </div>
                        </div> <!-- basicSubTab_02Div End -->
                        <div id="custSubTab_02Div" class="mt0"> <!-- custSubTab_02Div Start -->
                            <div class="header_area">
                                <h2 class="title_basic"><spring:message code='crm.title.package'/></h2><!-- 패키지 -->
                            </div>
                            <div class="table_grid">
                                <div id="custSubTab_02Grid"></div>
                            </div>
                        </div> <!-- custSubTab_02Div End -->
                        <div id="vinSubTab_02Div" class="mt0"> <!-- vinSubTab_02Div Start -->
                            <div class="header_area"></div>
                            <div class="table_grid">
                                <div id="vinSubTab_02Grid"></div>
                            </div>
                        </div> <!-- vinSubTab_02Div End -->


                </section>
            </div> <!-- packageInfoTabDiv end -->
        </div>   <!-- 탭메뉴 끝-->


<script type="text/javascript">
        $("#tab_area_main").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;
                var callUrl;
                console.log(selectTabId);

                $("[id^=btnCtl]").hide();
                $("[class*="+selectTabId+"]").show();

                if (selectTabId == "couponInfoTab") {
                    $("#tab_area_sub_01").data("kendoExtTabStrip").select(0);
                    // $("#activeHistoryTabGrid").data("kendoExtGrid").dataSource.page(1);
                } else if (selectTabId == "packageInfoTab") {
                     //$("#packageGrid").data("kendoExtTabStrip").select(0);
                     $("#packageGrid").data("kendoExtGrid").dataSource.page(1);
                }
            }
        });
        //$("#tab_area_main").data("kendoExtTabStrip").select(0);

        $("#tab_area_sub_01").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;
                var callUrl;
                console.log(selectTabId);

                $("[id^=btnCtlSub]").hide();
                $("[class*="+selectTabId+"]").show();

                var grid = $('#couponGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                //var cupnSeq =  selectedItem.cupnSeq;
                if (selectedItem != null) {
                    if (selectTabId == "custSubTab") {
                        $("#custSubGrid").data("kendoExtGrid").dataSource.page(1);

                    } else if (selectTabId == "vinSubTab") {
                        //$("#vinSubGrid").data("kendoExtGrid").dataSource.page(1);
                    }
                }

            }
        });
        $("#tab_area_sub_02").kendoExtTabStrip({
            animation:false
            , select:function(e) {
                var selectTabId = e.item.id;
                var callUrl;
                console.log(selectTabId);

                $("[id^=btnPkgCtl]").hide();
                $("[class*="+selectTabId+"]").show();

                var grid = $('#packageGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                //var cupnSeq =  selectedItem.cupnSeq;
                if (selectedItem != null) {
                    if (selectTabId == "basicSubTab_02") {
                        $("#basicSubTab_02Grid").data("kendoExtGrid").dataSource.page(1);
                    } else if (selectTabId == "custSubTab_02") {
                        //$("#custSubTab_02Grid").data("kendoExtGrid").dataSource.page(1);
                    } else if (selectTabId == "vinSubTab_02") {
                        //$("#vinSubTab_02Grid").data("kendoExtGrid").dataSource.page(1);
                    }
                }

            }
        });
</script>
        </div>  <!-- resizableContainer End-->
      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
/*************************************************************
데이터 셋업
*************************************************************/

    var dcCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var dcCdArr = [];
    var dcUseTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var dcUseTpArr = [];
    var yesNoDS = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var yesNoDSMap = [];

    <c:forEach var="obj" items="${dcCdList}">
        dcCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        dcCdArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    <c:forEach var="obj" items="${dcUseTpList}">
        dcUseTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        dcUseTpArr["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    yesNoDS.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    yesNoDS.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    yesNoDSMap["Y"] = "<spring:message code='global.lbl.yes' />";
    yesNoDSMap["N"] = "<spring:message code='global.lbl.n' />";

    $(document).ready(function() {

        // 사은품조회
        $(".goodsSearch").click(function(){

            popupWindow = dms.window.popup({
                windowId:"goodsItemSearchPopup"
                ,width:700
                ,height:420
                ,title:"<spring:message code='sal.title.goodsSearch' />"   // 용품조회
                ,content:{
                    url:"<c:url value='/sal/acc/accessoryMng/selectGoodsItemSearchPopup.do'/>"
                    ,data:{
                        "type":null
                        ,"autoBind":true
                        , "sDlrCd":''
                        , "sCarlineCd" :null
                        , "sGoodsCd"   :null
                        , "sPkgItemCd" :null
                        , "onlyItemTab" :"Y"
                        ,"callbackFunc":function(data, type){

                            if(data.length >= 1) {
                                $("#itemCd").val(data[0].itemCd);
                                $("#itemNm").val(data[0].itemNm);
                            }

                            popupWindow.close();
                        }
                    }
                }
            })
        });



        //조회조건-소멸일 선택
        $("#cupnFromDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#cupnToDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

     // 쿠폰할인구분   sDcUseTp
        $("#sDcUseTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:dcUseTpList
            , index:0
        });

    // 사용여부   useYn
        $("#useYn").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:yesNoDS
            , index:1
        });

    // 할인사용구분   dcUseTp
        $("#dcUseTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:dcUseTpList
            , index:0
        });

    // 할인방식   dcCd
        $("#dcCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:dcCdList
            , index:0
            , change:function(){
                var selcmmCd = this.dataItem(this.select()).cmmCd;
                $("[class^=dcCd]").hide();
                if (selcmmCd == "01"){
                    $(".dcCd01").show();
                } else if (selcmmCd == "02"){
                    $(".dcCd02").show();
                } else if (selcmmCd == "03"){
                    $(".dcCd03").show();
                }
            }
        });

        $("#lbrDcRate").kendoExtNumericTextBox({
            format:"n2"
           ,decimals :2
           //,min:0.00
           ,value:0.00
           ,spinners:false
        });

        $("#parDcRate").kendoExtNumericTextBox({
            format:"n2"
           ,decimals :2
           //,min:0.00
           ,value:0.00
           ,spinners:false
        });

        $("#totDcRate").kendoExtNumericTextBox({
            format:"n2"
           ,decimals :2
           //,min:0.00
           ,value:0.00
           ,spinners:false
        });

        $("#lbrDcAmt").kendoExtNumericTextBox({
            format:"n1"
           ,decimals :1
           //,min:0.00
           ,value:0.0
           ,spinners:false
        });

        $("#parDcAmt").kendoExtNumericTextBox({
            format:"n1"
           ,decimals :1
           //,min:0.00
           ,value:0.0
           ,spinners:false
        });

        $("#totDcAmt").kendoExtNumericTextBox({
            format:"n1"
           ,decimals :1
           //,min:0.00
           ,value:0.0
           ,spinners:false
        });

        $("#goodsCnt").kendoExtNumericTextBox({
            format:"n0"
           ,decimals :0
           //,min:0.00
           ,value:0
           ,spinners:false
        });

        $("#cupnValidPrid").kendoExtNumericTextBox({
            format:"n0"
           ,decimals :0
           //,min:0.00
           ,value:0
           ,spinners:false
//            ,change:function(){
//                if ($(this).val()) {
//                    $("#cupnFromDt").data("kendoExtMaskedDatePicker").enable(false);
//                    $("#cupnToDt").data("kendoExtMaskedDatePicker").enable(false);
//                    $("#cupnFromDt").data("kendoExtMaskedDatePicker").value('');
//                    $("#cupnToDt").data("kendoExtMaskedDatePicker").value('');
//                } else {
//                    $("#cupnFromDt").data("kendoExtMaskedDatePicker").enable(true);
//                    $("#cupnToDt").data("kendoExtMaskedDatePicker").enable(true);
//                }

//            }
        });

        /*************************************************************
         *   UI
        *************************************************************/
        $("#cupnValidPrid").focusout(function(){
            if ($(this).val()) {
                $("#cupnFromDt").data("kendoExtMaskedDatePicker").value('');
                $("#cupnToDt").data("kendoExtMaskedDatePicker").value('');
                $("#cupnFromDt").data("kendoExtMaskedDatePicker").enable(false);
                $("#cupnToDt").data("kendoExtMaskedDatePicker").enable(false);
            } else {
                $("#cupnFromDt").data("kendoExtMaskedDatePicker").enable(true);
                $("#cupnToDt").data("kendoExtMaskedDatePicker").enable(true);
            }
        });
        /*************************************************************
         *   버튼 셋팅
        *************************************************************/
        //버튼 - 쿠폰 Master 조회
        $("#btnCtlSearchCoupon").kendoButton({
            click:function(e) {
                $("#couponGrid").data("kendoExtGrid").dataSource.page(1);
            }
        });

        //버튼 - 패키지 Master 조회
        $("#btnCtlSearchPackage").kendoButton({
            click:function(e) {
                $('#packageGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        //버튼 - 쿠폰 추가
        $("#btnCtlAddCoupon").kendoButton({
            click:function(e) {

                // 쿠폰정보 리셋
                $("#useYn").data("kendoExtDropDownList").value("Y");
                $("#cupnSeq").val("");
                $("#cupnNm").val("");
                $("#cupnValidPrid").data("kendoExtNumericTextBox").value("");
                $("#dcUseTp").data("kendoExtDropDownList").value("");
                $("#cupnFromDt").data("kendoExtMaskedDatePicker").value("");
                $("#cupnToDt").data("kendoExtMaskedDatePicker").value("");
                $("#dcCd").data("kendoExtDropDownList").value("");
                $("#lbrDcRate").data("kendoExtNumericTextBox").value("");
                $("#parDcRate").data("kendoExtNumericTextBox").value("");
                $("#totDcRate").data("kendoExtNumericTextBox").value("");
                $("#lbrDcAmt").data("kendoExtNumericTextBox").value("");
                $("#parDcAmt").data("kendoExtNumericTextBox").value("");
                $("#totDcAmt").data("kendoExtNumericTextBox").value("");
                $("#goodsCnt").data("kendoExtNumericTextBox").value("");
                $("#itemCd").val("");
                $("#itemNm").val("");

            }
        });


        //버튼 - 쿠폰 저장
        $("#btnCtlSaveCoupon").kendoButton({
            click:function(e) {

                var useYn = $("#useYn").data("kendoExtDropDownList").value();
                var cupnNm = $("#cupnNm").val();
                var cupnSeq = $("#cupnSeq").val();
                var cupnValidPrid = $("#cupnValidPrid").data("kendoExtNumericTextBox").value();
                var dcUseTp = $("#dcUseTp").data("kendoExtDropDownList").value();
                var cupnFromDt = $("#cupnFromDt").data("kendoExtMaskedDatePicker").value();
                var cupnToDt = $("#cupnToDt").data("kendoExtMaskedDatePicker").value();
                var dcCd = $("#dcCd").data("kendoExtDropDownList").value();
                var lbrDcRate = $("#lbrDcRate").data("kendoExtNumericTextBox").value();
                var parDcRate = $("#parDcRate").data("kendoExtNumericTextBox").value();
                var totDcRate = $("#totDcRate").data("kendoExtNumericTextBox").value();
                var lbrDcAmt = $("#lbrDcAmt").data("kendoExtNumericTextBox").value();
                var parDcAmt = $("#parDcAmt").data("kendoExtNumericTextBox").value();
                var totDcAmt = $("#totDcAmt").data("kendoExtNumericTextBox").value();
                var goodsCnt = $("#goodsCnt").data("kendoExtNumericTextBox").value();
                var itemCd = $("#itemCd").val();
                var itemNm = $("#itemNm").val();

                // 필수 체크
                if ( dms.string.isEmpty(useYn) ){
                    dms.notification.warning("<spring:message code='crm.lbl.useYn' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                };
                if ( dms.string.isEmpty(cupnNm) ){
                    dms.notification.warning("<spring:message code='crm.lbl.cupnNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                };

                if (dms.string.isEmpty(cupnValidPrid) || cupnValidPrid == 0) {
                    if ( dms.string.isEmpty(cupnFromDt)) {
                        dms.notification.warning("<spring:message code='crm.lbl.cupnFromDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                    if ( dms.string.isEmpty(cupnToDt)) {
                        dms.notification.warning("<spring:message code='crm.lbl.cupnFromDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                }

                if ( dms.string.isEmpty(dcUseTp) ){
                    dms.notification.warning("<spring:message code='crm.lbl.dcUseTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                };

                if ( dms.string.isEmpty(dcCd) ){
                    dms.notification.warning("<spring:message code='crm.lbl.dcCd' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return false;
                };

                if (dcCd == "01"){
                    if ( dms.string.isEmpty(lbrDcRate)){
                        dms.notification.warning("<spring:message code='global.lbl.lbrDcRate' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                    if ( dms.string.isEmpty(parDcRate) ){
                        dms.notification.warning("<spring:message code='global.lbl.parDcRate' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                    if ( dms.string.isEmpty(totDcRate) ){
                        dms.notification.warning("<spring:message code='crm.lbl.totDcRate' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };

                    if ( (dms.string.isEmpty(lbrDcRate) && dms.string.isEmpty(parDcRate) && dms.string.isEmpty(totDcRate))
                            || (lbrDcRate == "0.00" && parDcRate== "0.00" && totDcRate =="0.00")
                            ){
                        dms.notification.warning("<spring:message code='crm.lbl.dcRate' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                } else if(dcCd == "02"){
                    if ( dms.string.isEmpty(lbrDcAmt) ){
                        dms.notification.warning("<spring:message code='global.lbl.lbrDcAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                    if ( dms.string.isEmpty(parDcAmt) ){
                        dms.notification.warning("<spring:message code='global.lbl.parDcAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                    if ( dms.string.isEmpty(totDcAmt) ){
                        dms.notification.warning("<spring:message code='crm.lbl.totDcAmt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                } else if(dcCd == "03"){
                    if ( dms.string.isEmpty(itemCd) ){
                        dms.notification.warning("<spring:message code='crm.lbl.prenGoods' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };
                    if ( dms.string.isEmpty(goodsCnt) ){
                        dms.notification.warning("<spring:message code='global.lbl.qty' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                        return false;
                    };

                }
                var param =
                    $("#custInfoTabDivForm").serializeObject(
                        $("#custInfoTabDivForm").serializeArrayInSelector("[data-json-obj='true']")
                    );

                console.log(param);
//                 param["useYn"] = $("#useYn").data("kendoExtDropDownList").value();
//                 param["cupnNm"] = $("#cupnNm").val();
//                 param["cupnSeq"] = $("#cupnSeq").val();
//                 param["cupnValidPrid"] = $("#cupnValidPrid").data("kendoExtNumericTextBox").value();
//                 param["dcUseTp"] = $("#dcUseTp").data("kendoExtDropDownList").value();
//                 param["cupnFromDt"] = $("#cupnFromDt").data("kendoExtMaskedDatePicker").value();
//                 param["cupnToDt"] = $("#cupnToDt").data("kendoExtMaskedDatePicker").value();
//                 param["dcCd"] = $("#dcCd").data("kendoExtDropDownList").value();
//                 param["lbrDcRate"] = $("#lbrDcRate").data("kendoExtNumericTextBox").value();
//                 param["parDcRate"] = $("#parDcRate").data("kendoExtNumericTextBox").value();
//                 param["totDcRate"] = $("#totDcRate").data("kendoExtNumericTextBox").value();
//                 param["lbrDcAmt"] = $("#lbrDcAmt").data("kendoExtNumericTextBox").value();
//                 param["parDcAmt"] = $("#parDcAmt").data("kendoExtNumericTextBox").value();
//                 param["totDcAmt"] = $("#totDcAmt").data("kendoExtNumericTextBox").value();
//                 param["goodsCnt"] = $("#goodsCnt").data("kendoExtNumericTextBox").value();
//                 param["itemCd"] = $("#itemCd").val();

                var url = "<c:url value='/crm/cif/customerDcInfo/insertCustCouponInfo.do' />";
                if ( dms.string.isEmpty(cupnSeq) ){
                    // 신규등록 URL
                    url = "<c:url value='/crm/cif/customerDcInfo/insertCustCouponInfo.do' />";
                } else {
                    // 업데이트 URL
                    url = "<c:url value='/crm/cif/customerDcInfo/updaetCustCouponInfo.do' />";
                }

                console.log("-btnCustSave-----------------");
                console.log(url);
                console.log(param);

               $.ajax({
                    url:url
                    ,data:JSON.stringify(param)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        console.log(jqXHR);
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    },
                    success:function(result){
                        console.log("success!!!!");
                        console.log(result);
                        if (result != null){
                            dms.notification.success("<spring:message code='global.info.success'/>");
                            $("#cupnSeq").val(result);
                        }
                        $("#couponGrid").data("kendoExtGrid").dataSource.read();
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show();
                    }
                    ,complete:function(xhr, status) {
                        dms.loading.hide();
                    }
                }).done(function(result) {
                    console.log("Save Done!!!!");
                });
            }
        });

        //버튼 - 쿠폰 취소
        $("#btnCtlCanCoupon").kendoButton({
            click:function(e) {
                $('#couponGrid').data('kendoExtGrid').cancelChanges();
            }
        });

        ///////////////////////////////////////////////////////////////

        //버튼 - 패키지 저장
        $("#btnPackageSave").kendoButton({
            click:function(e) {

                var grid = $("#packageGrid").data("kendoExtGrid");
                var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }


                if (grid.gridValidation()) {

                     console.log("쿠폰 param :: ");
                     console.log(saveData);
//                     return;

                    $.ajax({
                        url:"<c:url value='/crm/cif/customerDcInfo/multiCustPackage.do' />",
                        data:JSON.stringify(saveData),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }


            }
        });

        //버튼 - 패키지 행추가
        $("#btnPackageAdd").kendoButton({
            click:function(e) {
                $('#packageGrid').data('kendoExtGrid').dataSource.insert(0,{
                    "pkgNm":null
                    ,"pkgPubCnt":0
                    ,"useYn":"Y"
                    ,"regDt":null
                    });

            }
        });

        //버튼 - 패키지 취소
        $("#btnPackageCan").kendoButton({
            click:function(e) {
                $('#packageGrid').data('kendoExtGrid').cancelChanges();
            }
        });


      //버튼 - 쿠폰 고객 행추가
        $("#btnCtlSubCustSubAdd").kendoButton({
            click:function(e) {
                var grid = $('#couponGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                if (selectedItem == null) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                var cupnSeq =  selectedItem.cupnSeq;
                var dcCd =  selectedItem.dcCd;
                var dcUseTp =  selectedItem.dcUseTp;
                var cupnValidPrid =  selectedItem.cupnValidPrid;
                var cupnFromDt =  selectedItem.cupnFromDt;
                var cupnToDt =  selectedItem.cupnToDt;

                var sysDate = kendo.parseDate("<c:out value='${sysDate}' />");
                if (cupnValidPrid != 0) {
                    console.log("cupnValidPrid Check::::::::");
                    console.log("sysDate Check::::::::" + sysDate);
                    cupnFromDt = kendo.parseDate("<c:out value='${sysDate}' />");
                    cupnToDt = sysDate;
                    cupnToDt.setDate(cupnToDt.getDate() + cupnValidPrid);
                }

                $('#custSubGrid').data('kendoExtGrid').dataSource.insert(0,{
                    "custNo":null
                    ,"custNm":null
                    ,"cupnSeq":cupnSeq
                    ,"publiCd":"01"
                    ,"vinNo":null
                    ,"cupnValidPrid":cupnValidPrid
                    ,"regDt":null
                    ,"updtDt":null
                    ,"cupnFromDt":cupnFromDt
                    ,"cupnToDt":cupnToDt
                    ,"publiDt":null
                    ,"dlrMbr":null
                    ,"bmMbr":null
                    ,"publiUsrId":null
                    ,"dcCd":dcCd
                    ,"dcUseTp":dcUseTp
                    ,"useYn":"Y"
                    });
            }
        });

        //버튼 - 쿠폰 고객 행삭제
        $("#btnCtlSubCustSubDel").kendoButton({
            click:function(e) {
                var grid = $("#custSubGrid").data("kendoExtGrid");
                var rows = grid.select();
                var selectedItem = grid.dataItem(rows);


                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                if (selectedItem.publiNo != null) {
                  //발행된 쿠폰은 삭제 할 수 없습니다.
                    dms.notification.info("<spring:message code='crm.err.UnableToDelPub'/>");
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });
        //버튼 - 쿠폰 -패키지 - 삭제
        $("#btnPkgCtlBasicSubDel").kendoButton({
            click:function(e) {
                var grid = $("#basicSubTab_02Grid").data("kendoExtGrid");
                var rows = grid.select();
                var selectedItem = grid.dataItem(rows);


                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        //버튼 - 쿠폰 고객 행삭제
        $("#btnPkgCtlBasicSubAdd").kendoButton({
            click:function(e) {
                console.log("btnPkgCtlBasicSubAdd call:::");
            }
        });

        //버튼 - 추가 kjlee
        $("#btnCtlSubCustSubPub").kendoButton({
            click:function(e) {

                var grid = $("#custSubGrid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList", ["dlrMbr","bmMbr"]);
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                console.log("btnCtlSubCustSubPub saveData");
                console.log(saveData);

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/crm/cif/customerDcInfo/multiCustCouponPublish.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(data, textStatus, jqXHR) {

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        });
      //버튼 - 쿠폰 vin 행추가
        $("#btnCtlSubvinSubAdd").kendoButton({
            click:function(e) {
                var grid = $('#couponGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                if (selectedItem == null) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                var cupnSeq =  selectedItem.cupnSeq;
                var dcCd =  selectedItem.dcCd;
                var dcUseTp =  selectedItem.dcUseTp;
                var cupnValidPrid =  selectedItem.cupnValidPrid;
                var cupnFromDt =  selectedItem.cupnFromDt;
                var cupnToDt =  selectedItem.cupnToDt;

                var sysDate = kendo.parseDate("<c:out value='${sysDate}' />");
                if (cupnValidPrid != 0) {
                    console.log("cupnValidPrid Check::::::::");
                    console.log("sysDate Check::::::::" + sysDate);
                    cupnFromDt = kendo.parseDate("<c:out value='${sysDate}' />");
                    cupnToDt = sysDate;
                    cupnToDt.setDate(cupnToDt.getDate() + cupnValidPrid);
                }

                $('#vinSubGrid').data('kendoExtGrid').dataSource.insert(0,{
                    "custNo":null
                    ,"custNm":null
                    ,"cupnSeq":cupnSeq
                    ,"publiCd":"02"
                    ,"vinNo":null
                    ,"cupnValidPrid":cupnValidPrid
                    ,"regDt":null
                    ,"updtDt":null
                    ,"cupnFromDt":cupnFromDt
                    ,"cupnToDt":cupnToDt
                    ,"publiDt":null
                    ,"dlrMbr":null
                    ,"bmMbr":null
                    ,"publiUsrId":null
                    ,"dcCd":dcCd
                    ,"dcUseTp":dcUseTp
                    ,"useYn":"Y"
                    });
            }
        });

        //버튼 - 쿠폰Vin 행삭제
        $("#btnCtlSubvinSubDel").kendoButton({
            click:function(e) {
                var grid = $("#vinSubGrid").data("kendoExtGrid");
                var rows = grid.select();
                var selectedItem = grid.dataItem(rows);


                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                if (selectedItem.publiNo != null) {
                  //발행된 쿠폰은 삭제 할 수 없습니다.
                    dms.notification.info("<spring:message code='crm.err.UnableToDelPub'/>");
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        //버튼 - 추가 kjlee
        $("#btnCtlSubvinSubPub").kendoButton({
            click:function(e) {

                var grid = $("#vinSubGrid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList", ["dlrMbr","bmMbr"]);
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                console.log("btnCtlSubvinSubPub saveData");
                console.log(saveData);

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/crm/cif/customerDcInfo/multiCustCouponPublish.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(data, textStatus, jqXHR) {

                            grid.dataSource._destroyed = [];
                            grid.dataSource.page(1);

                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        }
                    });
                }else{
                    //입력값을 확인하여 주십시오.
                    dms.notification.warning("<spring:message code='global.info.check.input'/>");
                }
            }
        });
        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#packageGrid").kendoExtGrid({
            gridId:"G-CRM-0519-172103"
            ,dataSource:{
                transport:{
                    read:{
                        //url:"<c:url value='/crm/dmm/packageCouponMasterMng/selectPackageCouponMasterMngs.do' />"
                        url:"<c:url value='/crm/cif/customerDcInfo/selectCustCouponPackagenInfo.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};
                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

//                             params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
//                             params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
//                             params["sPkgNm"] = $("#sPkgNm").val();

                            console.log("패키지 조회 : ",kendo.stringify(params))

                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"pkgSeq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,pkgSeq:{type:"number", editable:false} //패키지 일련번호
                                ,pkgNm:{type:"string", validation:{required:true}} //패키지명
                                ,pkgPubCnt:{type:"int" , editable:false}
                                ,useYn:{type:"string"}      //사용유무
                                ,regDt:{type:"date", editable:false}   //등록일
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
//                                     elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
//                                     elem.startDtFormat = kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
//                                     elem.endDtFormat = kendo.parseDate(elem.endDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,change:function(e){
                var dataItem = this.dataItem(this.select());
                if(!dms.string.isEmpty(dataItem.pkgSeq)){
                    $("#basicSubTab_02Grid").data("kendoExtGrid").dataSource.read();
                }
            }
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:280
            ,navigatable:true
            ,sortable:true
            ,edit:function(e){
                e.container.find("input[name=pkgNm]").attr("maxlength",33);
            }
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"pkgSeq", title:"", hidden:true}// 패키지 일련번호
               ,{field:"pkgNm", title:"<spring:message code='crm.lbl.pkgNm'/>",attributes:{"class":"al"}}// 패키지명
               ,{field:"pkgPubCnt", title:"<spring:message code='crm.lbl.publishStat'/>",attributes:{"class":"ac"}
                   ,width:75
                   ,template:function(dataItem){
                       var spanObj = "";
                       if (dataItem.pkgPubCnt == 0) {
                           spanObj = "<span class='txt_label bg_blue'><spring:message code='crm.lbl.Nopublish'/></span>";
                       } else {
                           spanObj = "<span class='txt_label bg_blue'><spring:message code='crm.lbl.publishComplete'/></span>";
                       }
                       return spanObj;
                   }
               }// 발행상태
               ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:75
                   ,attributes:{"class":"ac"}
                   ,editor:function(container, options) {
                       $('<input required name="useYn" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:true
                           ,dataSource:['Y','N']
                           ,index:0
                       });
                       $('<span class="k-invalid-msg" data-for="useYn"></span>').appendTo(container);
                   }
               }
               ,{field:"regDt", title:"<spring:message code='global.lbl.regDt' />"               // 등록일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (regDt !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') # #} else {# #= '' # #}#"
               }
            ]
        });


        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#couponGrid").kendoExtGrid({
            gridId:"G-CRM-0519-172109"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cif/customerDcInfo/selectCustCouponInfo.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sCupnNm"] = $("#sCupnNm").val();
                            params["sDcUseTp"] = $("#sDcUseTp").data("kendoExtDropDownList").value();

                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"cupnSeq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,cupnSeq:{type:"string", editable:false}
                                ,cupnNm:{type:"string", editable:false}
                                ,dcCd:{type:"string", editable:false}
                                ,dcUseTp:{type:"string", editable:false}
                                ,useYn:{type:"string", editable:false}
                                ,cupnFromDt:{type:"date", editable:false}
                                ,cupnFromDtFormat:{type:"date", editable:false}
                                ,cupnToDt:{type:"date", editable:false}
                                ,cupnToDtFormat:{type:"date", editable:false}
                                ,regDt:{type:"date", validation:{required:false},editable:false}    //등록일
                                ,updtDt:{type:"date", validation:{required:false},editable:false}    //수정일
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.cupnFromDtFormat = kendo.parseDate(elem.cupnFromDt, "<dms:configValue code='dateFormat' />");
                                    elem.cupnToDtFormat = kendo.parseDate(elem.cupnToDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,change:function(e){
                var dataItem = this.dataItem(this.select());
                if(!dms.string.isEmpty(dataItem.cupnSeq)){
                    $("#cupnSeq").val(dataItem.cupnSeq);
                    console.log("dcUseTp::::");
                    //console.log($("#useYn").data("kendoExtDropDownList").value());
                    $("#useYn").data("kendoExtDropDownList").value(dataItem.useYn);
                    $("#cupnNm").val(dataItem.cupnNm);
                    $("#cupnValidPrid").data("kendoExtNumericTextBox").value(dataItem.cupnValidPrid);
                    $("#dcUseTp").data("kendoExtDropDownList").value(dataItem.dcUseTp);
                    $("#cupnFromDt").data("kendoExtMaskedDatePicker").value(dataItem.cupnFromDt);
                    $("#cupnToDt").data("kendoExtMaskedDatePicker").value(dataItem.cupnToDt);
                    $("#dcCd").data("kendoExtDropDownList").value(dataItem.dcCd);
                    $("#lbrDcRate").data("kendoExtNumericTextBox").value(dataItem.lbrDcRate);
                    $("#parDcRate").data("kendoExtNumericTextBox").value(dataItem.parDcRate);
                    $("#totDcRate").data("kendoExtNumericTextBox").value(dataItem.totDcRate);
                    $("#lbrDcAmt").data("kendoExtNumericTextBox").value(dataItem.lbrDcAmt);
                    $("#parDcAmt").data("kendoExtNumericTextBox").value(dataItem.parDcAmt);
                    $("#totDcAmt").data("kendoExtNumericTextBox").value(dataItem.totDcAmt);
                    $("#goodsCnt").data("kendoExtNumericTextBox").value(dataItem.goodsCnt);
                    $("#itemCd").val(dataItem.itemCd);
                    $("#itemNm").val(dataItem.itemNm);

                    $("[class^=dcCd]").hide();
                    if (dataItem.dcCd == "01"){
                        $(".dcCd01").show();
                    } else if (dataItem.dcCd == "02"){
                        $(".dcCd02").show();
                    } else if (dataItem.dcCd == "03"){
                        $(".dcCd03").show();
                    }

                    $("#custSubGrid").data("kendoExtGrid").dataSource.read();
                    $("#vinSubGrid").data("kendoExtGrid").dataSource.read();

                }

            }
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:280
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:true
            ,navigatable:true
            ,sortable:false
//             ,pageable:true
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"cupnSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
               ,{field:"cupnNm", title:"<spring:message code='crm.lbl.cupnNm'/>", attributes:{"class":"al"}}  //쿠폰명
               ,{field:"dcCd", title:"<spring:message code='crm.lbl.dcCd' />", width:100 , attributes:{"class":"ac"}       // 할인방식
                    , template:'#if (dcCd !== ""){# #= dcCdArr[dcCd]# #}#'
                }
               ,{field:"dcUseTp", title:"<spring:message code='crm.lbl.dcUseTp' />", width:100 , attributes:{"class":"ac"}       // 할인사용구분
                    , template:'#if (dcUseTp !== ""){# #= dcUseTpArr[dcUseTp]# #}#'
                }
               ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:75 , attributes:{"class":"ac"}                   //사용여부
                    , template:'#if (useYn !== ""){# #= yesNoDSMap[useYn]# #}#'
               }
               ,{field:"cupnValidPrid", title:"<spring:message code='crm.lbl.validPrid' />", width:75 , attributes:{"class":"ac"}                   //유효일자
               }
               ,{field:"cupnFromDtFormat", title:"<spring:message code='crm.lbl.cupnFromDt' />", width :150               // 쿠폰시작일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (cupnFromDtFormat !== null ){# #= kendo.toString(data.cupnFromDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"cupnToDtFormat", title:"<spring:message code='crm.lbl.cupnToDt' />", width :150               // 쿠폰종료일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (cupnToDtFormat !== null ){# #= kendo.toString(data.cupnToDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
            ]
        });
        //그리드 설정
        $("#custSubGrid").kendoExtGrid({
            gridId:"G-CRM-0118-103552"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cif/customerDcInfo/selectCustCouponPublishInfo.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            var grid = $('#couponGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());

                            params["sCupnSeq"] = selectedItem.cupnSeq;
                            params["sPubliCd"] = "01";

                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"publiNo"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,cupnSeq:{type:"string", editable:false}
                                ,publiCd:{type:"string", editable:false}
                                ,publiNo:{type:"string", editable:false}
                                ,custNo:{type:"string"}
                                ,vinNo:{type:"string", editable:false}
                                ,cupnValidPrid:{type:"string"}
                                ,regDt:{type:"date", validation:{required:false},editable:false}    //등록일
                                ,updtDt:{type:"date", validation:{required:false},editable:false}    //수정일
                                ,cupnFromDt:{type:"date"}
                                ,cupnToDt:{type:"date"}
                                ,dlrMbr:{type:"string", editable:false}
                                ,bmMbr:{type:"string", editable:false}
                                ,useYn:{type:"string", editable:false}
                                ,publiUsrId:{type:"string", editable:false}
                                ,publiDt:{type:"date", editable:false}
                                //,cupnFromDtFormat:{type:"date"}
                                //,cupnToDtFormat:{type:"date"}
                                //,regDtFormat:{type:"date", editable:false}
                                //,publiDtFormat:{type:"date", editable:false}
                            }
                        }
//                         ,parse:function(d) {
//                             if(d.data){
//                                 $.each(d.data, function(idx, elem) {
//                                     if (elem.cupnValidPrid != 0){
//                                         var sysDate = kendo.parseDate("<c:out value='${sysDate}' />");
//                                         elem.cupnFromDt = kendo.parseDate(sysDate, "<dms:configValue code='dateFormat' />");

//                                         var selectDt = kendo.parseDate(kendo.toString(e.sender.value(), '<dms:configValue code='dateFormat' /> 00:00:00'));
//                                         var oneDay = 1000*60*60*24;
//                                     }

//                                     elem.cupnFromDtFormat = kendo.parseDate(elem.cupnFromDt, "<dms:configValue code='dateFormat' />");
//                                     elem.cupnToDtFormat = kendo.parseDate(elem.cupnToDt, "<dms:configValue code='dateFormat' />");
//                                     elem.publiDtFormat = kendo.parseDate(elem.publiDt, "<dms:configValue code='dateFormat' />");
//                                 });
//                             }
//                             return d;
//                         }
                }
            }
            ,edit:function(e) {
                if(!e.model.isNew()) {
                    if(e.sender.columns[e.container.index()].field == "custNo"){
                        this.closeCell();
                    }
                    if(e.sender.columns[e.container.index()].field == "custNm"){
                        this.closeCell();
                    }

                    if(e.sender.columns[e.container.index()].field == "cupnValidPrid"){
                        this.closeCell();
                    }
                    if(e.sender.columns[e.container.index()].field == "cupnFromDt"){
                        this.closeCell();
                    }
                    if(e.sender.columns[e.container.index()].field == "cupnToDt"){
                        this.closeCell();
                    }
                } else {

                    if(e.sender.columns[e.container.index()].field == "cupnValidPrid"){
                        this.closeCell();
                    }
                    if(e.sender.columns[e.container.index()].field == "custNm"){
                        this.closeCell();
                    }
                }
            }
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:280
            ,autoBind:false
            ,navigatable:true
            ,sortable:false
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}, hidden:true}// 일련번호
               ,{field:"cupnSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
               ,{field:"custNo", title:"<spring:message code='global.lbl.custNo' />", width :150 , attributes:{"class":"ac"}
                   ,editor :function(container, options) {
                       if(!options.model.isNew()
                               || dms.string.isNotEmpty(options.model.custNo) ){
                           container.context.innerText = dms.string.strNvl(options.model.custNo);
                           return;
                       }
                       $('<div class="form_search"><input required class="form_input" readonly data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectCustSearchPopup();"></a></div>')
                       .appendTo(container);
                   }
               }  // 고객번호
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width :100, attributes:{"class":"ac"}}  // 고객명
               ,{field:"publiNo", title:"<spring:message code='crm.lbl.publishNo' />", attributes:{"class":"ac"} , width:180 }  // 발행번호
               ,{field:"cupnValidPrid", title:"<spring:message code='crm.lbl.validPrid' />", attributes:{"class":"ar"} , width:80}  // 유효일자
               ,{field:"cupnFromDt", title:"<spring:message code='crm.lbl.cupnFromDt' />", width :100               // 쿠폰시작일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (data.cupnFromDt !== null ){# #= kendo.toString(data.cupnFromDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"cupnToDt", title:"<spring:message code='global.lbl.custNo' />", width :100               // 쿠폰종료일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   //,template:"#if (cupnToDtFormat !== null ){# #= kendo.toString(data.cupnToDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function(container, options) {
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                               format:"<dms:configValue code='dateFormat' />"
                               ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                               ,change:function(e){

                                   var sysDate = kendo.parseDate("<c:out value='${sysDate}' />");
                                   var selectDt = kendo.parseDate(kendo.toString(e.sender.value(), '<dms:configValue code='dateFormat' /> 00:00:00'));
                                   var oneDay = 1000*60*60*24;

                                   var minDate = new Date(sysDate);
                                   this.min(new Date(minDate.getFullYear(),minDate.getMonth(),minDate.getDate()+1))

                                   // 현재일 보다 이전날짜 선택 불가
                                   if ( selectDt/oneDay - sysDate/oneDay < 1 ) {
                                       console.log("aaa");
                                       // 오늘 이후 날짜를 선택해주세요.
                                       //dms.notification.info("<spring:message code='crm.info.todayAfterSelect' />");
                                       return;
                                   } else {
                                       console.log("bbb");
                                       var grid = $("#custSubGrid").data("kendoExtGrid");
                                       var selectRow = grid.dataItem(grid.select());
                                       selectRow.set("cupnValidPrid", Math.ceil((selectDt - sysDate)/oneDay));
                                   };
                               }
                       });
                   }

               }
               ,{field:"dlrMbr", title:"<spring:message code='crm.lbl.mbrShipTpYn' />", attributes:{"class":"ac"}}  // 딜러회원
               ,{field:"bmMbr", title:"<spring:message code='ser.lbl.bmMemb' />", attributes:{"class":"ac"}}  // BM회원
               ,{field:"publiDt", title:"<spring:message code='crm.lbl.publishDt' />", width :150               // 발행날짜
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (data.publiDt !== null ){# #= kendo.toString(data.publiDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"publiUsrId", title:"<spring:message code='crm.lbl.publisher' />", attributes:{"class":"ac"}}  // 발행일
            ]
        });
        $("#vinSubGrid").kendoExtGrid({
            gridId:"G-CRM-0119-103550"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cif/customerDcInfo/selectCustCouponPublishInfo.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            var grid = $('#couponGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());

                            params["sCupnSeq"] = selectedItem.cupnSeq;
                            params["sPubliCd"] = "02";

                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"publiNo"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,cupnSeq:{type:"string", editable:false}
                                ,publiCd:{type:"string", editable:false}
                                ,publiNo:{type:"string", editable:false}
                                ,vinNo:{type:"string"}
                                ,custNo:{type:"string"}
                                ,vinNo:{type:"string"}
                                ,cupnValidPrid:{type:"string"}
                                ,regDt:{type:"date", validation:{required:false},editable:false}    //등록일
                                ,updtDt:{type:"date", validation:{required:false},editable:false}    //수정일
                                ,cupnFromDt:{type:"date"}
                                ,cupnToDt:{type:"date"}
                                ,dlrMbr:{type:"string", editable:false}
                                ,bmMbr:{type:"string", editable:false}
                                ,useYn:{type:"string", editable:false}
                                ,publiUsrId:{type:"string", editable:false}
                                ,publiDt:{type:"date", editable:false}
                                //,cupnFromDtFormat:{type:"date"}
                                //,cupnToDtFormat:{type:"date"}
                                //,regDtFormat:{type:"date", editable:false}
                                //,publiDtFormat:{type:"date", editable:false}
                            }
                        }
//                         ,parse:function(d) {
//                             if(d.data){
//                                 $.each(d.data, function(idx, elem) {
//                                     if (elem.cupnValidPrid != 0){
//                                         var sysDate = kendo.parseDate("<c:out value='${sysDate}' />");
//                                         elem.cupnFromDt = kendo.parseDate(sysDate, "<dms:configValue code='dateFormat' />");

//                                         var selectDt = kendo.parseDate(kendo.toString(e.sender.value(), '<dms:configValue code='dateFormat' /> 00:00:00'));
//                                         var oneDay = 1000*60*60*24;
//                                     }

//                                     elem.cupnFromDtFormat = kendo.parseDate(elem.cupnFromDt, "<dms:configValue code='dateFormat' />");
//                                     elem.cupnToDtFormat = kendo.parseDate(elem.cupnToDt, "<dms:configValue code='dateFormat' />");
//                                     elem.publiDtFormat = kendo.parseDate(elem.publiDt, "<dms:configValue code='dateFormat' />");
//                                 });
//                             }
//                             return d;
//                         }
                }
            }
            ,edit:function(e) {
                if(!e.model.isNew()) {

                    if(e.sender.columns[e.container.index()].field == "vinNo"){
                        this.closeCell();
                    }
                    if(e.sender.columns[e.container.index()].field == "custNm"){
                        this.closeCell();
                    }

                    if(e.sender.columns[e.container.index()].field == "cupnValidPrid"){
                        this.closeCell();
                    }
                    if(e.sender.columns[e.container.index()].field == "cupnFromDt"){
                        this.closeCell();
                    }
                    if(e.sender.columns[e.container.index()].field == "cupnToDt"){
                        this.closeCell();
                    }
                } else {

                    if(e.sender.columns[e.container.index()].field == "cupnValidPrid"){
                        this.closeCell();
                    }
                    if(e.sender.columns[e.container.index()].field == "custNm"){
                        this.closeCell();
                    }
                }
            }
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:280
            ,autoBind:false
            ,navigatable:true
            ,sortable:false
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}, hidden:true}// 일련번호
               ,{field:"cupnSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
               ,{field:"vinNo", title:"<spring:message code='crm.lbl.vinNo' />", width :150 , attributes:{"class":"ac"}
                   ,editor :function(container, options) {
                       if(!options.model.isNew()
                               || dms.string.isNotEmpty(options.model.vinNo) ){
                           container.context.innerText = dms.string.strNvl(options.model.vinNo);
                           return;
                       }
                       $('<div class="form_search"><input required class="form_input" readonly data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:custPopupWindow();"></a></div>')
                       .appendTo(container);
                   }
               }  // 고객번호
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width :100, attributes:{"class":"ac"}}  // 고객명
               ,{field:"publiNo", title:"<spring:message code='crm.lbl.publishNo' />", attributes:{"class":"ac"} , width:180 }  // 발행번호
               ,{field:"cupnValidPrid", title:"<spring:message code='crm.lbl.validPrid' />", attributes:{"class":"ar"} , width:80}  // 유효일자
               ,{field:"cupnFromDt", title:"<spring:message code='crm.lbl.cupnFromDt' />", width :100               // 쿠폰시작일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (data.cupnFromDt !== null ){# #= kendo.toString(data.cupnFromDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"cupnToDt", title:"<spring:message code='global.lbl.custNo' />", width :100               // 쿠폰종료일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   //,template:"#if (cupnToDtFormat !== null ){# #= kendo.toString(data.cupnToDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function(container, options) {
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                               format:"<dms:configValue code='dateFormat' />"
                               ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                               ,change:function(e){

                                   var sysDate = kendo.parseDate("<c:out value='${sysDate}' />");
                                   var selectDt = kendo.parseDate(kendo.toString(e.sender.value(), '<dms:configValue code='dateFormat' /> 00:00:00'));
                                   var oneDay = 1000*60*60*24;

                                   var minDate = new Date(sysDate);
                                   this.min(new Date(minDate.getFullYear(),minDate.getMonth(),minDate.getDate()+1))

                                   // 현재일 보다 이전날짜 선택 불가
                                   if ( selectDt/oneDay - sysDate/oneDay < 1 ) {
                                       console.log("aaa");
                                       // 오늘 이후 날짜를 선택해주세요.
                                       //dms.notification.info("<spring:message code='crm.info.todayAfterSelect' />");
                                       return;
                                   } else {
                                       console.log("bbb");
                                       var grid = $("#custSubGrid").data("kendoExtGrid");
                                       var selectRow = grid.dataItem(grid.select());
                                       selectRow.set("cupnValidPrid", Math.ceil((selectDt - sysDate)/oneDay));
                                   };
                               }
                       });
                   }

               }
               ,{field:"dlrMbr", title:"<spring:message code='crm.lbl.mbrShipTpYn' />", attributes:{"class":"ac"}}  // 딜러회원
               ,{field:"bmMbr", title:"<spring:message code='ser.lbl.bmMemb' />", attributes:{"class":"ac"}}  // BM회원
               ,{field:"publiDt", title:"<spring:message code='crm.lbl.publishDt' />", width :150               // 발행날짜
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (data.publiDt !== null ){# #= kendo.toString(data.publiDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"publiUsrId", title:"<spring:message code='crm.lbl.publisher' />", attributes:{"class":"ac"}}  // 발행일
            ]
        });

        $("#basicSubTab_02Grid").kendoExtGrid({
            gridId:"G-CRM-0519-172105"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cif/customerDcInfo/selectCouponInPackageInfo.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            var grid = $('#packageGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());

                            params["sPkgSeq"] = selectedItem.pkgSeq;

                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"seq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,cupnSeq:{type:"string", editable:false}
                                ,cupnNm:{type:"string", editable:false}
                                ,dcCd:{type:"string", editable:false}
                                ,dcUseTp:{type:"string", editable:false}
                                ,useYn:{type:"string", editable:false}
                                ,cupnFromDt:{type:"date", editable:false}
                                ,cupnFromDtFormat:{type:"date", editable:false}
                                ,cupnValidPrid:{type:"string", editable:false}
                                ,cupnToDt:{type:"date", editable:false}
                                ,cupnToDtFormat:{type:"date", editable:false}
                                ,regDt:{type:"date", validation:{required:false},editable:false}    //등록일
                                ,updtDt:{type:"date", validation:{required:false},editable:false}    //수정일
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.cupnFromDtFormat = kendo.parseDate(elem.cupnFromDt, "<dms:configValue code='dateFormat' />");
                                    elem.cupnToDtFormat = kendo.parseDate(elem.cupnToDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,change:function(e){
                var dataItem = this.dataItem(this.select());
                if(!dms.string.isEmpty(dataItem.cupnSeq)){



                }

            }
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:280
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,navigatable:true
            ,sortable:false
//             ,pageable:true
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}, hidden:true}
               ,{field:"cupnSeq", title:"", attributes:{"class":"ac"}, hidden:true}//일련번호
               ,{field:"cupnNm", title:"<spring:message code='crm.lbl.cupnNm'/>", attributes:{"class":"al"}}  //쿠폰명
               ,{field:"dcCd", title:"<spring:message code='crm.lbl.dcCd' />", width:100 , attributes:{"class":"ac"}       // 할인방식
                    , template:'#if (dcCd !== ""){# #= dcCdArr[dcCd]# #}#'
                }
               ,{field:"dcUseTp", title:"<spring:message code='crm.lbl.dcUseTp' />", width:100 , attributes:{"class":"ac"}       // 할인사용구분
                    , template:'#if (dcUseTp !== ""){# #= dcUseTpArr[dcUseTp]# #}#'
                }
               ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:75 , attributes:{"class":"ac"}                   //사용여부
                    , template:'#if (useYn !== ""){# #= yesNoDSMap[useYn]# #}#'
               }
               ,{field:"cupnValidPrid", title:"<spring:message code='crm.lbl.validPrid' />", width:75 , attributes:{"class":"ac"}                   //유효일자
               }
               ,{field:"cupnFromDtFormat", title:"<spring:message code='crm.lbl.cupnFromDt' />", width :150               // 쿠폰시작일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (cupnFromDtFormat !== null ){# #= kendo.toString(data.cupnFromDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"cupnToDtFormat", title:"<spring:message code='crm.lbl.cupnToDt' />", width :150               // 쿠폰종료일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (cupnToDtFormat !== null ){# #= kendo.toString(data.cupnToDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
            ]
        });


    }); //end ready

    // 날짜 검증
    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

          //등록시작일
          if (this.value() != null) {
              if(id === 'cupnFromDt'){
                  frYY = this.value().getFullYear();
                  frMM = this.value().getMonth();
                  frDD = this.value().getDate();
                  $("#cupnToDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
              }else if(id === 'cupnToDt'){//등록종료일
                  toYY = this.value().getFullYear();
                  toMM = this.value().getMonth();
                  toDD = this.value().getDate();
                  $("#cupnFromDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
              }
          }
          console.log("1:: " + $("#cupnFromDt").data("kendoExtMaskedDatePicker").value());
          console.log("2:: " + $("#cupnToDt").data("kendoExtMaskedDatePicker").value());

          if (($("#cupnFromDt").data("kendoExtMaskedDatePicker").value() != null)
                  || ($("#cupnToDt").data("kendoExtMaskedDatePicker").value() != null)
                  ){
              $("#cupnValidPrid").data("kendoExtNumericTextBox").enable(false);
          }

          if (($("#cupnFromDt").data("kendoExtMaskedDatePicker").value() == null)
                  && ($("#cupnToDt").data("kendoExtMaskedDatePicker").value() == null)
                  ){
              $("#cupnValidPrid").data("kendoExtNumericTextBox").enable(true);
          }
     }

  //고객조회
  selectCustSearchPopup = function(){

      popupWindow = dms.window.popup({
          windowId:"customerSearchPopupMain"
          , title:"<spring:message code='global.title.custSearch' />"   // 고객 조회
          , width:800
          , content:{
              url:"<c:url value='/crm/cif/customerInfo/selectCustSearchPopup.do'/>"
              , data:{
                  "autoBind":false
                  , "custNm":null
                  , "type"  :null
                  , "custCd":null
                  , "hpNo":null
                  , "closeYn":null
                  , "callbackFunc":function(data){
                      if (data.length >= 1) {
                          console.log("Popup Search fn_custSearchPopUp:::");
                          console.log(data);
                          console.log(data[0].custNo);
                          var grid = $("#custSubGrid").data("kendoExtGrid");
                          var selectItem = grid.dataItem(grid.select());

                          selectItem.set("custNo", data[0].custNo);
                          selectItem.set("custNm", data[0].custNm);

                          popupWindow.close();
                      }
                  }
              }
          }
      });
  }

//고객 팝업
  custPopupWindow = function(preFixId){

      var autoBind = false;

      if(preFixId != "CA"){

          vehOfCustInfoSearchPopup = dms.window.popup({
              windowId:"vehOfCustInfoSearchPopup"
              , title:"<spring:message code='ser.title.custSearch' />"   // 고객 조회
              , content:{
                  url:"<c:url value='/ser/cmm/popup/selectVehOfCustInfoPopup.do'/>"
                  , data:{
                      "autoBind":autoBind
                      , "type"  :null
                      , "vinNo":null
                      , "carId":null
                      , "newEnableYn":"Y"
                      , "carRegNo":null//khskhs  문제시 삭제  $("#carRegNo").val()
                      , "carOwnerNm":null
                      , "preFixId":preFixId
                      , "callbackFunc":function(data){

                          if (data.length >= 1) {
                              console.log("Popup Search custPopupWindow:::");
                              //console.log(data);
                              var grid = $("#vinSubGrid").data("kendoExtGrid");
                              var selectItem = grid.dataItem(grid.select());

                              selectItem.set("vinNo", data[0].vinNo);
                              selectItem.set("custNm", data[0].carOwnerNm);

                          }

                      }//callback
                  }
              }
          });
      }

  };

</script>