<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>



<!-- 날짜 -->
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


// 현재일자
var toDay = "${toDay}";
// 해당월 1일
//var oneDay = toDay.substring(0, 8) + "01";
var oneDay = "${oneDay}";

//공통 PROPERTY LIST
var cmmPrtyListObj = {};
<c:forEach var="obj" items="${cmmPrtyDS}">
    $.extend(cmmPrtyListObj, {"${obj.prtyNm}":"${obj.prtyVal}"});
</c:forEach>

</script>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnDuplicate" class="btn_m"><spring:message code='cmm.btn.copy' /></button>
        </div>
    </div>

    <div class="header_area pt0">
        <h2 class="title_basic"><spring:message code='global.title.basicInfo' /></h2>
    </div>

<form id="basicForm" name="basicForm" method="POST" onsubmit="return false;">
    <div class="table_form" id="specInfoForm01">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:12%;">
                <col style="width:14%;">
                <col style="width:12%;">
                <col style="width:12%;">
                <col style="width:13%;">
                <col style="width:12%;">
                <col style="width:13%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.specNm' /></th>                         <!-- SPEC명 -->
                    <td colspan=3>
                        <input id="specCd" name="specCd" type="hidden" data-json-obj="true">
                        <input id="srcSpecCd" name="srcSpecCd" type="hidden" data-json-obj="true">
                        <input id="specNm" name="specNm" class="form_input" data-json-obj="true">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>

                <tr>
                    <th scope="row"><spring:message code='global.lbl.specCont' /></th>      <!-- Note -->
                    <td colspan="7">
                        <textarea id="specCont" name="specCont" rows="3" cols="30" placeholder="" class="form_textarea" data-json-obj="true" ></textarea>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>
</form>

    <!-- SPEC 기본정보 -->
    <div class="header_area pt0">
        <h2 class="title_basic"><spring:message code='global.title.copyTarget' /></h2>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:15%;">
                <col style="width:5%;">
                <col style="width:80%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.appDeploy' /></th>
                    <td>&nbsp;</td>
                    <td>
                        <label for="sServiceY" class="label_check"><input type="radio" id="sServiceY" name="sServiceYN" value="Y" class="form_check" /> <spring:message code='global.lbl.target' /></label>
                        <label for="sServiceN" class="label_check"><input type="radio" id="sServiceN" name="sServiceYN" value="N" class="form_check" /> <spring:message code='global.lbl.notTarget' /></label>
                    </td>
                </tr>
                <%-- <tr>
                    <th scope="row"><spring:message code='global.lbl.repositoryDeploy' /></th>
                    <td>&nbsp;</td>
                    <td>
                        <label for="sRepositoryY" class="label_check"><input type="radio" id="sRepositoryY" name="sRepositoryYN" value="Y" class="form_check" /> <spring:message code='global.lbl.target' /></label>
                        <label for="sRepositoryN" class="label_check"><input type="radio" id="sRepositoryN" name="sRepositoryYN" value="N" class="form_check" /> <spring:message code='global.lbl.notTarget' /></label>
                    </td>
                </tr> --%>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.commandDeploy' /></th>
                    <td>&nbsp;</td>
                    <td>
                        <label for="sCommandY" class="label_check"><input type="radio" id="sCommandY" name="sCommandYN" value="Y" class="form_check" /> <spring:message code='global.lbl.target' /></label>
                        <label for="sCommandN" class="label_check"><input type="radio" id="sCommandN" name="sCommandYN" value="N" class="form_check" /> <spring:message code='global.lbl.notTarget' /></label>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.sqlDeploy' /></th>
                    <td>&nbsp;</td>
                    <td>
                        <label for="sSqlY" class="label_check"><input type="radio" id="sSqlY" name="sSqlYN" value="Y" class="form_check" /> <spring:message code='global.lbl.target' /></label>
                        <label for="sSqlN" class="label_check"><input type="radio" id="sSqlN" name="sSqlYN" value="N" class="form_check" /> <spring:message code='global.lbl.notTarget' /></label>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.propertyDeploy' /></th>
                    <td>&nbsp;</td>
                    <td>
                        <label for="sPropertyY" class="label_check"><input type="radio" id="sPropertyY" name="sPropertyYN" value="Y" class="form_check" /> <spring:message code='global.lbl.target' /></label>
                        <label for="sPropertyN" class="label_check"><input type="radio" id="sPropertyN" name="sPropertyYN" value="N" class="form_check" /> <spring:message code='global.lbl.notTarget' /></label>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.fileDeploy' /></th>
                    <td>&nbsp;</td>
                    <td>
                        <label for="sFileY" class="label_check"><input type="radio" id="sFileY" name="sFileYN" value="Y" class="form_check" /> <spring:message code='global.lbl.target' /></label>
                        <label for="sFileN" class="label_check"><input type="radio" id="sFileN" name="sFileYN" value="N" class="form_check" /> <spring:message code='global.lbl.notTarget' /></label>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>


</section>


<script type="text/javascript">

$(document).ready(function() {

    /************************************************************
                팝업옵션 설정
    *************************************************************/
    /**
     * 팝업 옵션
     */
     var parentOptions = parent.searchDupSpecPopupWin.options.content.data;


    /************************************************************
                기능버튼 설정
    *************************************************************/

    // 버튼.
    $("#btnDuplicate").kendoButton({
        click:function(e){
            duplicateSpec();
        }
    });

    /************************************************************
                조회조건 설정
    *************************************************************/
    if (parentOptions.srcSpecCd) {
        $("#srcSpecCd").val(parentOptions.srcSpecCd);
//         alert($("#srcSpecCd").val());
    }

    if (parentOptions.displayGrid) {

    }


    if(parentOptions.autoBind){
//         $("#grid").data("kendoExtGrid").dataSource.read();
    }


    function duplicateSpec() {
        var params = {
                "specBasicVO":$("#basicForm").serializeObject($("#basicForm").serializeArrayInSelector("[data-json-obj='true']"))
            };

//         params[""]      = '10015';       // DCS File List Query

//         if(dms.string.isEmpty($('#serviceRepository').data('kendoExtDropDownList').value())) {
//             return;
//         }

        // 저장하시겠습니까?
        if(!confirm("<spring:message code='global.lbl.save' var='globalLblUpdate' /><spring:message code='global.info.cnfrmMsg' arguments='${globalLblUpdate}' />")){
            return;
        }

        params.specBasicVO.sServiceYN    = $("input[name=sServiceYN]:checked")[0].value;
//        params.specBasicVO.sRepositoryYN = $("input[name=sRepositoryYN]:checked")[0].value;
        params.specBasicVO.sCommandYN    = $("input[name=sCommandYN]:checked")[0].value;
        params.specBasicVO.sSqlYN        = $("input[name=sSqlYN]:checked")[0].value;
        params.specBasicVO.sPropertyYN   = $("input[name=sPropertyYN]:checked")[0].value;
        params.specBasicVO.sFileYN       = $("input[name=sFileYN]:checked")[0].value;

        $.ajax({
            url:"<c:url value='/dply/spec/specMng/multiSpecDuplicate.do' />",
            data:JSON.stringify(params),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR, status, error) {
                dms.notification.error(jqXHR.responseJSON.errors);

            },
            success:function(jqXHR, textStatus) {
//                 alert(jqXHR);
                $("#specCd").val(jqXHR);   //

                //정상적으로 반영 되었습니다.
                dms.notification.success("<spring:message code='global.info.success'/>");

                parentOptions.callbackFunc($("#specCd").val());
                parent.searchDupSpecPopupWin.close();

//                 postProcDuplicateSpec(jqXHR, params);
            }
        });

    }

    function postProcDuplicateSpec(jqXHR, params) {
        var objXML = $.parseXML(jqXHR);
        var objJson = $.xml2json(objXML);

        return;

        if(dms.string.isEmpty($("#fileurl").val())) {
            return;
        }

        var param = {
            "fileurl":$("#fileurl").val()
        }

        parentOptions.callbackFunc(param);
        parent.searchDupSpecPopupWin.close();


    }

    function initDefaultValue() {
        $("input[name=sServiceYN][value=Y]").attr("checked", true);
//        $("input[name=sRepositoryYN][value=Y]").attr("checked", true);
        $("input[name=sCommandYN][value=Y]").attr("checked", true);
        $("input[name=sSqlYN][value=Y]").attr("checked", true);
        $("input[name=sPropertyYN][value=Y]").attr("checked", true);
        $("input[name=sFileYN][value=Y]").attr("checked", true);

    }


    initDefaultValue();


});
</script>









