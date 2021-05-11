<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 시스템설정 관리 -->
<section class="group">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.systemConfMng" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12154" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-13041" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_m btn_del" id="btnDelCache"><spring:message code="global.btn.del.cache" /><!-- 캐시삭제 --></button>
            </dms:access>
        </div>
    </div>

    <form id="systemConfigInfoForm">
    <div class="header_area pt0">
        <h2 class="title_basic"><spring:message code="cmm.title.defaultCurrency" /><!-- 기본통화 --></h2>
    </div>
    <div class="table_form">
        <table>
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
                    <th scope="row"><spring:message code="global.lbl.defaultCurrency" /><!-- 기본통화 --></th>
                    <td><input type="text" id="defaultCurrency" name="defaultCurrency" class="form_input" required data-name="<spring:message code='global.lbl.defaultCurrency' />" /></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 날짜포맷 설정 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="cmm.title.systemConfigInfo.dateFormat" /><!-- 날짜포맷 설정 --></h2>
    </div>
    <div class="table_form">
        <table>
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
                    <th scope="row"><spring:message code="global.lbl.dateFormat" /><!-- 날짜 포맷 --></th>
                    <td><input type="text" id="dateFormat" name="dateFormat" class="form_comboBox" required data-name="<spring:message code='global.lbl.dateFormat' />" /></td>
                    <th scope="row"><spring:message code="global.lbl.timeFormat" /><!-- 시간 포맷 --></th>
                    <td><input type="text" id="timeFormat" name="timeFormat" class="form_comboBox" required data-name="<spring:message code='global.lbl.timeFormat' />" /></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 언어 설정 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="cmm.title.systemConfigInfo.language" /><!-- 언어 설정 --></h2>
    </div>
    <div class="table_form">
        <table>
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
                    <th scope="row"><spring:message code="global.lbl.supportLangs" /><!-- 지원 언어 --></th>
                    <td><select id="supportLangs" name="supportLangs" multiple="multiple" class="form_comboBox" required data-name="<spring:message code='global.lbl.supportLangs' />"></select></td>
                    <th scope="row"><spring:message code="global.lbl.defaultLang" /><!-- 기본 언어 --></th>
                    <td><input type="text" id="defaultLang" name="defaultLang" class="form_comboBox" required data-name="<spring:message code='global.lbl.defaultLang' />" /></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- JMS 설정 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="cmm.title.systemConfigInfo.jms" /><!-- JMS 설정 --></h2>
    </div>
    <div class="table_form">
        <table>
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
                    <th scope="row"><spring:message code="global.lbl.jmsIp" /><!-- JMS IP --></th>
                    <td><input type="text" id="jmsIp" name="jmsIp" class="form_input" required data-name="<spring:message code='global.lbl.jmsIp' />" /></td>
                    <th scope="row"><spring:message code="global.lbl.jmsPort" /><!-- JMS Port --></th>
                    <td><input type="text" id="jmsPort" name="jmsPort" class="form_input" required data-name="<spring:message code='global.lbl.jmsPort' />" /></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 기타 설정 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="cmm.title.systemConfigInfo.etc" /><!-- 기타 설정 --></h2>
    </div>
    <div class="table_form">
        <table>
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
                    <th scope="row"><spring:message code="global.lbl.custInfoUpdtValidPrid" /><!-- 고객정보 수정 유효기간(일) --></th>
                    <td><input type="text" id="custInfoUpdtValidPrid" name="custInfoUpdtValidPrid" class="form_numeric" required min="0" data-name="<spring:message code='global.lbl.custInfoUpdtValidPrid' />" /></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    
    <!-- 시스템 캐시 관리 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="cmm.title.cacheMgr" /><!-- 시스템 캐시 관리 --></h2>
    </div>
    <div class="table_form">
        <table>
            <tbody>
                <tr>
                    <td>
                    	<input type="checkbox" name="cache" value="messageSourceCache" /><spring:message code="global.lbl.messageSourceCache" />&nbsp;&nbsp;<!-- 메세지소스 캐시 -->
                    	<input type="checkbox" name="cache" value="commonCodeCache" /><spring:message code="global.lbl.commonCodeCache" />&nbsp;&nbsp;<!-- 공통코드 캐시 -->
                    	<input type="checkbox" name="cache" value="gridIndvCache" /><spring:message code="global.lbl.gridIndvCache" />&nbsp;&nbsp;<!-- 그리드개인화 캐시 -->
                    	<input type="checkbox" name="cache" value="systemConfigInfoCache" /><spring:message code="global.lbl.systemConfigInfoCache" />&nbsp;&nbsp;<!-- 시스템설정 캐시 -->
                    	<input type="checkbox" name="cache" value="currencyCache" /><spring:message code="global.lbl.currencyCache" />&nbsp;&nbsp;<!-- 통화정보 캐시 -->
                    	<input type="checkbox" name="cache" value="viewInfoCache" /><spring:message code="global.lbl.viewInfoCache" />&nbsp;&nbsp;<!-- 화면정보 캐시 -->
                    	<input type="checkbox" name="cache" value="viewMappingCache" /><spring:message code="global.lbl.viewMappingCache" /><!-- 화면매핑 캐시 -->
                   	</td>
                </tr>
            </tbody>
        </table>
    </div>
    </form>
</section>

<script type="text/javascript">
var configMap = [];
var supportLangs = [];

<c:forEach var="obj" items="${configList}">
configMap["${obj.prefKey}"] = "${obj.prefVal}";
</c:forEach>

<c:forEach var="obj" items="${supportLangs}">
supportLangs.push({"langCd":"${obj.langCd}", "langNm":"${obj.langNm}"});
</c:forEach>

var defaultLangDatasourceSetting = function(e){
    var defaultLangs = new Array();
    var selectedSupportLangs = $("#supportLangs").data("kendoMultiSelect").value();

    if(selectedSupportLangs.length == 0){
        return;
    }

    $.each(supportLangs, function(index, data){
        if(selectedSupportLangs.indexOf(data.langCd) > -1){
            defaultLangs.push(data);
        }
    });

    $("#defaultLang").data("kendoExtDropDownList").setDataSource(defaultLangs);
};

$(document).ready(function() {

    var validator = $("#systemConfigInfoForm").kendoExtValidator().data("kendoExtValidator");

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e){
            if (validator.validate()) {
                var json = $("#systemConfigInfoForm").serializeObject();

                var params = [];
                var idx = 0;

                $.each(json, function(key, value){
                    obj = {};
                    obj["prefKey"] = key;

                    if (value.constructor === Array) {
                        obj["prefVal"] = value.join(",");
                        obj["multiYn"] = 1;
                    } else {
                        obj["prefVal"] = value;
                        obj["multiYn"] = 0;
                    }

                    params.push(obj);

                    idx++;
                });

                $.ajax({
                    url:"<c:url value='/cmm/sci/systemConfigInfo/updateSystemConfigInfo.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                    ,data:JSON.stringify({"updateList":params})
                    ,error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(data) {
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }
        }
    });
    
  	//버튼 - 캐시삭제
    $("#btnDelCache").kendoButton({
        click:function(e){
            var removeCacheList = [];
        	$.each($("input[name=cache]:checked"), function(idx, elem){
            	removeCacheList.push($(elem).val());
            });
        	
        	if(removeCacheList.length == 0){
        		dms.notification.warning("<spring:message code='global.info.required.select' />");
        		return;
        	}
        	
        	$.ajax({
                url:"<c:url value='/cmm/sci/systemConfigInfo/delectCache.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
                ,data:JSON.stringify(removeCacheList)
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {
                    dms.notification.success("<spring:message code='global.info.success' />");
                }
            });
        }
    });

    /**********************************************************
        기본값 설정
    ***********************************************************/
    //기본통화
    $("#defaultCurrency").val(configMap["defaultCurrency"]);

    //날짜포맷
    $("#dateFormat").kendoExtDropDownList({
        dataSource:["yyyy-MM-dd", "MM/dd/yyyy", "dd/MM/yyyy"]
    });
    $("#dateFormat").data("kendoExtDropDownList").value(configMap["dateFormat"]);

    //시간포맷
    $("#timeFormat").kendoExtDropDownList({
        dataSource:["HH:mm:ss", "hh:mm:ss"]
    });
    $("#timeFormat").data("kendoExtDropDownList").value(configMap["timeFormat"]);

    //지원언어
    $("#supportLangs").kendoMultiSelect({
        dataSource:supportLangs,
        valuePrimitive:true,
        placeholder:"",
        dataTextField:"langNm",
        dataValueField:"langCd",
        dataBound:defaultLangDatasourceSetting,
        change:defaultLangDatasourceSetting
    });

    $("#defaultLang").kendoExtDropDownList({
        dataTextField:"langNm",
        dataValueField:"langCd",
        optionLabel:"",
        index:0
    });

    $("#supportLangs").data("kendoMultiSelect").value(configMap["supportLangs"].split(","));
    defaultLangDatasourceSetting();
    $("#defaultLang").data("kendoExtDropDownList").value(configMap["defaultLang"]);

    //JMS 설정
    $("#jmsIp").val(configMap["jmsIp"]);
    $("#jmsPort").val(configMap["jmsPort"]);

    //고객정보 수정 유효기간(일)
    $("#custInfoUpdtValidPrid").kendoExtNumericTextBox({
        decimals:0
        ,format:"n0"
        ,min:0
    });
    $("#custInfoUpdtValidPrid").data("kendoExtNumericTextBox").value(configMap["custInfoUpdtValidPrid"]);
});
</script>