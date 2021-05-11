<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="pop_wrap">
    <div class="table_form mt10">
    <form id="userForm">
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
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.dlrCd" /></span></th>
                    <td>
                        <input id="dlrCd" name="dlrCd" type="text" value="${user.dlrCd}" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.usrId" /></span></th>
                    <td>
                        <input id="usrId" name="usrId" type="text" value="${user.usrId}" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.usrPw" /></span></th>
                    <td>
                        <input id="usrPw" name="usrPw" type="password" class="form_input form_disabled" disabled  />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.dept" /></th>
                    <td>
                        <input id="deptCd" name="deptCd" type="text" value="${user.deptCd}" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.usrNm" /></span></th>
                    <td>
                        <input id="usrNm" name="usrNm" type="text" value="${user.usrNm}" class="form_input form_disabled" disabled  />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.empNo" /></th>
                    <td>
                        <input id="empNo" name="empNo" type="text" value="${user.empNo}" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.pstn" /></th>
                    <td>
                        <input id="pstnCd" name="pstnCd" type="text" value="${user.pstnCd}" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.telNo" /></th>
                    <td>
                        <input id="telNo1" name="telNo1" type="tel" value="${user.telNo1}" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.cellphone" /></th>
                    <td>
                        <input id="hpNo" name="hpNo" type="tel" value="${user.hpNo}" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.claimReqPermYn" /></th>
                    <td>
                        <input id="claimReqPermYn" name="claimReqPermYn" type="text" value="${user.claimReqPermYn}" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.sex" /></span></th>
                    <td>
                        <input id="gndrCd1" name="gndrCd" value="M" type="radio" disabled  /><spring:message code="global.lbl.man" />&nbsp;
                        <input id="gndrCd2" name="gndrCd" value="F" type="radio" disabled  /><spring:message code="global.lbl.woman" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.emailNm" /></th>
                    <td>
                        <input id="email" name="email" type="email" value="${user.email}" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.bizCd" /></th>
                    <td>
                        <input id="bizCd" name="bizCd" type="text" value="${user.bizCd}" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.birthday" /></th>
                    <td>
                        <input id="birthday" name="birthday" type="date" class="form_datepicker" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.joinDt" /></th>
                    <td>
                        <input id="joinDt" name="joinDt" type="date" class="form_datepicker" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.servYn" /></th>
                    <td>
                        <input id="servYn" name="servYn" type="text" value="${user.servYn}" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.zipCd" /></th>
                    <td>
                        <input id="zipNo" name="zipNo" type="text" value="${user.zipNo}" class="form_input form_disabled" disabled />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.retireDt" /></th>
                    <td>
                        <input id="retireDt" name="retireDt" type="date" class="form_datepicker"  />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.saleYn" /></th>
                    <td>
                        <input id="saleYn" name="saleYn" type="text" value="${user.saleYn}" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.addr" />1</th>
                    <td colspan="3">
                        <input id="addr1" name="addr1" type="text" value="${user.addr1}" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.task" /></th>
                    <td>
                        <input id="tskCd" name="tskCd" type="text" value="${user.tskCd}" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.addr" />2</th>
                    <td colspan="3">
                        <input id="addr2" name="addr2" type="text" value="${user.addr2}" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.tskDetl" /></th>
                    <td>
                        <input id="tskDetl" name="tskDetl" type="text" value="${user.tskDetl}" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.addr" />3</th>
                    <td colspan="3">
                        <input id="addr3" name="addr3" type="text" value="${user.addr3}" class="form_input form_disabled" disabled />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.langCd" /></span></th>
                    <td>
                        <input id="langCd" name="langCd" type="text" value="${user.langCd}" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code="global.lbl.enabledYn" /></span></th>
                    <td>
                        <input id="enabledYn" name="enabledYn" type="text" value="${user.enabledYn}" class="form_comboBox" />
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </form>
    </div>
</section>

<script type="text/javascript">
//부서목록
var deptCdList = [{"deptCd":"", "deptNm":"", "useYn":"Y", "cmpTp":""}];
<c:forEach var="obj" items="${deptCdList}">
deptCdList.push({"deptCd":"${obj.deptCd}", "deptNm":"${obj.deptNm}", "useYn":"${obj.useYn}", "cmpTp":"${obj.cmpTp}"});
</c:forEach>

//직급목록
var pstnCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${pstnCdList}">
pstnCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//직무목록
var tskCdList = [{"tskCd":"", "tskNm":"", "deptCd":"", "cmpTp":""}];
<c:forEach var="obj" items="${taskList}">
tskCdList.push({"tskCd":"${obj.tskCd}", "tskNm":"${obj.tskNm}", "deptCd":"${obj.deptCd}", "cmpTp":"${obj.cmpTp}"});
</c:forEach>

//직무상세목록
var salesMgrDetlList = [{"saleMgrDetlCd":"", "saleMgrDetlNm":"", "useYn":""}];
<c:forEach var="obj" items="${salesMgrDetlList}">
salesMgrDetlList.push({"saleMgrDetlCd":"${obj.saleMgrDetlCd}", "saleMgrDetlNm":"${obj.saleMgrDetlNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//지원언어 목록
var supportedLangs = [{"langCd":"", "langNm":""}];
<c:forEach var="obj" items="${supportedLangs}">
supportedLangs.push({"langCd":"${obj}", "langNm":"${obj}"});
</c:forEach>

$(document).ready(function() {
    //입력폼 - 생일
    <c:if test="${user.gndrCd != null}">
    $('input:radio[name=gndrCd][value=${user.gndrCd}]')[0].checked = true;
    </c:if>

    //입력폼 - 부서
    $("#deptCd").kendoExtDropDownList({
        dataSource:dms.data.arrayFilter(deptCdList, function(element, index, array){
            return element.useYn !== "N";
        })
        ,dataValueField:"deptCd"
        ,dataTextField:"deptNm"
        ,enabled:false
    });

    //입력폼 - 직급
    $("#pstnCd").kendoExtDropDownList({
        dataSource:dms.data.cmmCdFilter(pstnCdList)
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,enabled:false
    });

    //입력폼 - 정비업무여부
    $("#servYn").kendoExtDropDownList({
        dataSource:["Y","N"]
        ,enabled:false
        ,index:0
    });

    //입력폼 - 판매업무여부
    $("#saleYn").kendoExtDropDownList({
        dataSource:["Y","N"]
        ,enabled:false
        ,index:0
    });

    //입력폼 - 활성여부
    $("#enabledYn").kendoExtDropDownList({
        dataSource:["Y","N"]
        ,enabled:false
        ,index:0
    });

    //입력폼 - 언어선택
    $("#langCd").kendoExtDropDownList({
        dataSource:supportedLangs
        ,dataTextField:"langNm"
        ,dataValueField:"langCd"
        ,enabled:false
        ,index:0
    });

    //입력폼 - 생일
    $("#birthday").kendoExtMaskedDatePicker({
        format:"yyyy-MM-dd"
        ,parseFormat:"yyyyMMdd"
        ,value:"${user.birthday}"
    }).data("kendoExtMaskedDatePicker").enable(false);

    //입력폼 - 가입일
    $("#joinDt").kendoExtMaskedDatePicker({
        format:"yyyy-MM-dd"
        ,parseFormat:"yyyyMMdd"
        ,value:"${user.joinDt}"
    }).data("kendoExtMaskedDatePicker").enable(false);

    //입력폼 - 은퇴일
    $("#retireDt").kendoExtMaskedDatePicker({
        format:"yyyy-MM-dd"
        ,parseFormat:"yyyyMMdd"
        ,value:"${user.retireDt}"
    }).data("kendoExtMaskedDatePicker").enable(false);

    //입력폼 - 클레인신청 권한 여부
    $("#claimReqPermYn").kendoExtDropDownList({
        dataSource:["Y","N"]
        ,enabled:false
        ,index:0
    });

    //입력폼 - 직무
    $("#tskCd").kendoExtDropDownList({
        dataSource:tskCdList
        ,dataValueField:"tskCd"
        ,dataTextField:"tskNm"
        ,enabled:false
    });
    
  	//입력폼 - 직무상세
    $("#tskDetl").kendoExtDropDownList({
        dataSource:salesMgrDetlList
        ,dataValueField:"saleMgrDetlCd"
        ,dataTextField:"saleMgrDetlNm"
        ,enabled:false
    });
});
</script>
