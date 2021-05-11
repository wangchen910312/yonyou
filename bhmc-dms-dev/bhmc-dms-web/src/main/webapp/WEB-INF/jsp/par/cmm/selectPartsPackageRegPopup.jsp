<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>

<div id="resizableContainer">

    <!-- 패키지부품 등록 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <button id="btnSave" name="btnSave" class="btn_m btn_save"><spring:message code="par.btn.save" /><!-- 조회 --></button>
            </div>
        </div>
        <div class="table_form form_width_100per" role="search" data-btnid="btnSearch" id="packageForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:20%;">
                    <col style="width:33%;">
                    <col style="width:20%;">
                    <col style="width:33%;">
                    <col/>
                </colgroup>
                <tbody>
                    <tr class="mt5">
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.brand" /><!-- 브랜드 --></span></th>
                        <td class="required_area">
                            <input id="brandCd" name="brandCd" type="text" data-type="combo" data-mandatory="true" class="form_comboBox" required data-name="<spring:message code="par.lbl.brand" />">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.carLine" /><!-- 차종 --></span></th>
                        <td>
                            <input id="ltsModelCd" data-type="combo" class="form_comboBox" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.packageCd" /><!-- Package 번호 --></span></th>
                        <td>
                            <input id="itemCd" name="itemCd" type="text" value="" class="form_input form_required"  data-mandatory="true" required data-name="<spring:message code="par.lbl.itemCd" />" maxlength="18" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.packageNm" /><!-- Package 명 --></span></th>
                        <td>
                            <input id="itemNm" name="itemNm" type="text" value="" class="form_input form_required"  data-mandatory="true" required data-name="<spring:message code="par.lbl.itemNm" />" maxlength="50" />
                        </td>
                    </tr>
                    <tr class="mt5">
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.startDttm" /><!-- 유효시작일자 --></span></th>
                        <td>
                            <input id="pkgStartDt" name="pkgStartDt" class="form_datepicker" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="par.lbl.endDttm" /><!-- 유효종료일자 --></span></th>
                        <td>
                            <input id="pkgEndDt" name="pkgEndDt" class="form_datepicker" />
                            <input id="updtDtStr" type="hidden" class="form_input" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </section>
    <!-- //부품선택 팝업 -->
</div>

    <div class="hidden">
        <input type="hidden" id="stockUnitCd" name="stockUnitCd" />
        <input type="hidden" id="itemDstinCd" name="itemDstinCd" />
        <input type="hidden" id="pkgDocNo" name="pkgDocNo" />
    </div>

 <script type="text/javascript">

/************************************************************
 팝업옵션 설정
*************************************************************/
/**
* 팝업 옵션
*/
    var options = parent.partsPackageRegPopupWindow.options.content.data,
    brandCdList = [],
    ltsModelCdList =[];

    //brandCdList
    brandCdList.push({"cmmCd":"", "cmmCdNm":" ", "useYn":""});
    <c:forEach var="obj" items="${brandCdList}" varStatus="status">
    if("${obj.useYn}" !== 'N'){
        brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    }
    </c:forEach>

    <c:forEach var="obj" items="${ltsModelDs}">
        ltsModelCdList.push({cmmCdNm:"${obj.ltsModelNm}", cmmCd:"${obj.ltsModelCd}"});
    </c:forEach>

    $(document).ready(function() {

        //브랜드:검색
        $("#brandCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:brandCdList
            ,index:0
        });
        //조회조건 - LTS MODEL CD
        $("#ltsModelCd").kendoExtDropDownList({
           dataTextField:"cmmCdNm"
          ,dataValueField:"cmmCd"
          ,dataSource:ltsModelCdList
          ,template:"[#:cmmCd#]#:cmmCdNm#"
          ,valueTemplate:"[#:cmmCd#]#:cmmCdNm#"
          ,height:100
        });

        //pkgStartDt
        $("#pkgStartDt").kendoExtMaskedDatePicker({
            value:null
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //pkgEndDt
        $("#pkgEndDt").kendoExtMaskedDatePicker({
            value:null
            ,format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#itemDstinCd").val(options.itemDstinCd);
        $("#brandCd").data("kendoExtDropDownList").value("HD");
        $("#stockUnitCd").val("EA");

        if(options.pkgSelectedItem != null){
            var pkgSelectedItem = options.pkgSelectedItem;
            var pkgDocNo = pkgSelectedItem.pkgDocNo;

            //package receive selectedItem.
            if(!dms.string.isEmpty(pkgSelectedItem)){
                $("#brandCd").data("kendoExtDropDownList").value(pkgSelectedItem.brandCd);
                $("#ltsModelCd").data("kendoExtDropDownList").value(pkgSelectedItem.ltsModelCd);
                $("#itemCd").val(pkgSelectedItem.itemCd);

                $("#itemCd").prop("readOnly", true).addClass("form_readonly");

                $("#itemNm").val(pkgSelectedItem.itemNm);
                $("#pkgDocNo").val(pkgSelectedItem.pkgDocNo);
                $("#updtDtStr").val(pkgSelectedItem.updtDtStr);
                $("#pkgStartDt").data("kendoExtMaskedDatePicker").value(pkgSelectedItem.pkgStartDt);
                $("#pkgEndDt").data("kendoExtMaskedDatePicker").value(pkgSelectedItem.pkgEndDt);
            }else{
                $("#ltsModelCd").data("kendoExtDropDownList").value('ALL');
            }
        }

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 저장 버튼
        $("#btnSave").kendoButton({
            click:function(e){

                var ItemMasterPackageSaveVO,
                    ItemMasterVO,
                    PackagePartsHeaderVO;

                if(options.pkgTp == "01"){
                    if(dms.string.isEmpty($("#ltsModelCd").data("kendoExtDropDownList").value())){
                        dms.notification.warning("<spring:message code='par.lbl.carLine' var='carLine' /><spring:message code='par.info.issueCheckMsg' arguments='${carLine}' />");
                        return false;
                    }
                }

                //validation itemCd / itemNm / brand
                if(dms.string.isEmpty($("#itemCd").val())){
                    //itemCd check message
                    dms.notification.warning("<spring:message code='ser.lbl.packageCd' var='itemCd' /><spring:message code='par.info.issueCheckMsg' arguments='${itemCd}' />");
                    return false;
                }
                if(dms.string.isEmpty($("#itemNm").val())){
                    //itemNm check message
                    dms.notification.warning("<spring:message code='ser.lbl.packageNm' var='itemNm' /><spring:message code='par.info.issueCheckMsg' arguments='${itemNm}' />");
                    return false;
                }
                if(dms.string.isEmpty($("#brandCd").data("kendoExtDropDownList").value())){
                    //brandCd check message
                    dms.notification.warning("<spring:message code='par.lbl.brand' var='brandCd' /><spring:message code='par.info.issueCheckMsg' arguments='${brandCd}' />");
                    return false;
                }

                var vPkgStartDt = $("#pkgStartDt").data("kendoExtMaskedDatePicker").value();
                var vPkgEndDt = $("#pkgEndDt").data("kendoExtMaskedDatePicker").value();

                if(dms.string.isEmpty(vPkgStartDt)){
                    //pkgStartDt check message
                    dms.notification.warning("<spring:message code='par.lbl.startDttm' var='startDttm' /><spring:message code='par.info.issueCheckMsg' arguments='${startDttm}' />");
                    return false;
                }

                if(dms.string.isEmpty(vPkgEndDt)){
                    //pkgEndDt check message
                    dms.notification.warning("<spring:message code='par.lbl.endDttm' var='endDttm' /><spring:message code='par.info.issueCheckMsg' arguments='${endDttm}' />");
                    return false;
                }

                if(vPkgEndDt < vPkgStartDt){
                    //start dt over end dt
                    dms.notification.warning("<spring:message code='par.lbl.startDttm' var='startDttm' /><spring:message code='par.lbl.endDttm' var='endDttm' /><spring:message code='par.info.itemReqCntMsg' arguments='${startDttm},${endDttm}' />");

                    return false;
                }

                itemMasterVO = {
                    "itemCd":$("#itemCd").val()
                    ,"oldRplcParCmptYn":"N"
                    ,"itemNm":$("#itemNm").val()
                    ,"newRplcParCmptYn":"N"
                    ,"endYn":"N"
                    ,"stockUnitCd":$("#stockUnitCd").val()
                    ,"brandCd":$("#brandCd").data("kendoExtDropDownList").value()
                    ,"itemDstinCd":$("#itemDstinCd").val()
                    ,"prndYn":"N"
                    ,"impTestTp":"Y"
                    ,"purcCqtyCalcYn":"N"
                    ,"nonMovingFlg":"N"
                    ,"dgrItemYn":"N"
                    ,"stdrdStockCalcYn":"N"
                    ,"paintYn":"N"
                    ,"mjrUseYn":"N"
                    ,"mjrErrYn":"N"
                    ,"spyrCd":"02"//Local
                    ,"updtDtStr":$("#updtDtStr").val()
                };

                packagePartsHeaderVO = {
                    "pkgItemCd":$("#itemCd").val()
                    ,"pkgItemNm":$("#itemNm").val()
                    ,"pkgDocNo":$("#pkgDocNo").val()
                    ,"ltsModelCd":$("#ltsModelCd").data("kendoExtDropDownList").value()
                    ,"brandCd":$("#brandCd").data("kendoExtDropDownList").value()
                    ,"pkgStartDt":vPkgStartDt
                    ,"pkgEndDt":vPkgEndDt
                    ,"pkgTp":options.pkgTp
                };

                itemMasterPackageSaveVO = {
                    "itemMasterVO":itemMasterVO
                    ,"packagePartsHeaderVO":packagePartsHeaderVO
                };

                var vUrl = "<c:url value='/par/pmm/itemMaster/insertItemMasterPackage.do' />";

                if(packagePartsHeaderVO.pkgDocNo != ""){
                    vUrl = "<c:url value='/par/pmm/itemMaster/updateItemMasterPackage.do' />";
                }

                $.ajax({
                    url:vUrl
                    ,type:"POST"
                    ,data:JSON.stringify(itemMasterPackageSaveVO)
                    ,dataType:"json"
                    ,contentType:'application/json'
                    ,async:false
                    ,success:function(result) {
                        if (result == true) {
                            var itemCd = '[' + $("#itemCd").val() + ']';
                            dms.notification.success("<spring:message code='global.info.updateSuccessParam' arguments='" + itemCd + "'/>");
                            options.callbackFunc();

                        } else {
                            if(result === 0){
                                //error message
                                var itemCd = '[' + $("#itemCd").val() + ']';
                                dms.notification.error("<spring:message code='global.err.updateFailedParam' arguments='" + itemCd + "'/>");
                            }
                        }
                    }
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#resizableContainer"));
                    }
                });
            }
        });



    });

 </script>

