<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%-- 결재선 결재처리유형이 미결이 아닌 경우 --%>
<c:set var="signLineGridHeight" value="180" />
<c:set var="signReqContHeight" value="155" />

<%-- 결재선 결재처리유형이 미결인 경우 --%>
<c:if test="${signLineVO.signRsltCd == '01'}" >
    <c:set var="signLineGridHeight" value="120" />
    <c:set var="signReqContHeight" value="93" />
</c:if>

<section class="pop_wrap">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.signInfo" />[${signVO.signDocNm}]</h1>
        
        <div class="btn_right">
	        <!-- 결재문서의 결재선의 결재자에 해당하는 결재처리유형이 미결 인 경우  -->
	        <c:if test="${signLineVO.signRsltCd == '01'}">
	        <dms:access viewId="VIEW-D-11426" hasPermission="${dms:getPermissionMask('READ')}">
	            <button id="btnAppr" class="btn_m btn_save"><spring:message code="global.btn.approval" /></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11427" hasPermission="${dms:getPermissionMask('READ')}">
	            <button id="btnReject" class="btn_m btn_save"><spring:message code="global.btn.appRollback" /></button>
	        </dms:access>
	        </c:if>
	        
			<!-- 결재참조문서 URL이 있고 참조문서 파라메터가 있는 경우 -->	        
	        <c:if test="${not empty signVO.refDocViewUrlNm and not empty signVO.refDocParams}">
	        	<button id="btnRefDoc" class="btn_m btn_search"><spring:message code="global.btn.refDocView" /></button>
	        </c:if>
        </div>
    </div>

    <div class="table_form">
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
                    <th scope="row"><spring:message code="global.lbl.empNo" /><!-- 사원번호 --></th>
                    <td>
                        <input type="text" id="reqEmpNo" name="reqEmpNo" value="${signVO.reqEmpNo}" class="form_input" readOnly />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.name" /><!-- 이름 --></th>
                    <td>
                        <input type="text" id="reqUsrNm" value="${signVO.reqUsrNm}" class="form_input" readOnly  />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.signDt" /><!-- 기안일자 --></th>
                    <td>
                        <input type="text" id="reqDt" class="form_datepicker" readOnly />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.signReqTitle" /><!-- 결재요청제목 --></th>
                    <td colspan="5">
                        <input type="text" id="reqTitleNm" class="form_input" value="${signVO.reqTitleNm}" readOnly />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.signReqCont" /><!-- 결재요청내용 --></h2>
    </div>
    <div>
         <textarea id="reqCont" class="form_textarea" style="height:${signReqContHeight}px;" readOnly>${signVO.reqCont}</textarea>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.signLine" /><!-- 결재선 --></h2>
    </div>

    <div class="table_grid">
        <div id="gridSignLine"></div>
    </div>

    <c:if test="${signLineVO.signRsltCd == '01'}">
    <!-- 결재문서의 결재선의 결재자에 해당하는 결재처리유형이 미결 인 경우 -->
    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.signCont" /><!-- 결재의견 --></h2>
    </div>
    <div>
         <textarea id="signCont" class="form_textarea" style="height:80px;"></textarea>
    </div>
    </c:if>
</section>

<script type="text/javascript">
//결재선 결재처리유형
var signRsltCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${signRsltCdList}">
signRsltCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var signRsltCdMap = dms.data.arrayToMap(signRsltCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    //팝업 옵션
    var popupWindow = parent.$("#signApprPopupWin").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    //결재문서의 결재선의 결재자에 해당하는 결재처리유형이 미결 인 경우
    <c:if test="${signLineVO.signRsltCd == '01'}">
    //버튼 - 승인/반려
    $(".btn_save").kendoButton({
        click:function(e) {
            if(dms.string.isEmpty($("#signCont").val())) {
                dms.notification.warning("<spring:message code='global.lbl.signCont' var='signContMsg' /><spring:message code='global.info.validation.required' arguments='${signContMsg}' />");
                return;
            }

            dms.window.confirm({
                 message:e.event.target.id == "btnAppr"? "<spring:message code='global.info.approval'/>":"<spring:message code='global.info.reject'/>"
                ,width:300
                ,callback:function(result){
                    if(result){
                        $.ajax({
                            url:"<c:url value='/cmm/apr/sign/updateSignLine.do' />"
                            ,data:JSON.stringify({
                                "signDocId":"${signVO.signDocId}"
                                ,"signDocNo":"${signVO.signDocNo}"
                                ,"signDocLineNo":"${signLineVO.signDocLineNo}"
                                ,"signCont":$("#signCont").val()
                                ,"signStatCd":"03"
                                ,"signRsltCd":e.event.target.id == "btnAppr"? "04":"02"
                            })
                            ,type:'POST'
                            ,dataType:'json'
                            ,async:false
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            }
                            ,success:function(jqXHR, textStatus) {
                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                                popupOptions.callbackFunc();
                                popupWindow.close();
                            }
                        });
                    }
                }
            });
        }
    });
    </c:if>
    
    //결재참조문서 URL이 있고 참조문서 파라메터가 있는 경우       
    <c:if test="${not empty signVO.refDocViewUrlNm and not empty signVO.refDocParams}">
    //버튼 - 참조문서보기
    $("#btnRefDoc").kendoButton({
        click:function(e) {
        	var refDocViewUrlNm = "${signVO.refDocViewUrlNm}";
        	var refDocParams = "${signVO.refDocParams}";
        	
        	$.ajax({
                url:"<c:url value='/cmm/ath/viewInfo/selectViewInfoByTcd.do' />"
                ,data:JSON.stringify({
                    "tCd":refDocViewUrlNm
                })
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error){
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }
            }).done(function(viewData) {
                if(viewData != null && !dms.string.isEmpty(viewData.viewUrl)){
                    var viewUrl = viewData.viewUrl;

                    if(dms.string.isNotEmpty(refDocParams)){
                        viewUrl = viewUrl + (viewUrl.match( /[\?]/g ) ? '&' : '?' + refDocParams);
                    }

                    parent.parent._addTabMenu(viewData.viewNm, _contextPath + viewUrl, viewData.tCd, viewData.viewId, false, true);
                }
            });
        }
    });
    </c:if>
    
    //기안일자
    $("#reqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,parseFormat:"yyyy-MM-dd"
        ,value:"<fmt:formatDate pattern='yyyy-MM-dd' value='${signVO.reqDt}' />"
    });
    
    //결재선 그리드
    $("#gridSignLine").kendoExtGrid({
        gridId:"G-CMM-0117-172501"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/apr/sign/selectSignLines.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        return kendo.stringify({"sSignDocNo":"${signVO.signDocNo}"});
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,navigatable:false
            ,serverPaging:false
            ,pageSize:0
            ,schema:{
                model:{
                     id:"signDocLineNo"
                    ,fields:{
                        rnum:{type:"number"}
                        ,signDocNo:{type:"string"}
                        ,signDocLineNo:{type:"number"}
                        ,signTp:{type:"string"}
                        ,signUsrId:{type:"string"}
                        ,signUsrNm:{type:"string"}
                        ,signPstiCd:{type:"string"}
                        ,signPstiNm:{type:"string"}
                        ,signDeptCd:{type:"string"}
                        ,signDeptNm:{type:"string"}
                        ,signStatCd:{type:"string"}
                        ,signRsltCd:{type:"string"}
                        ,signCont:{type:"string"}
                    }
                }
            }
        }
        ,selectable:"row"
        ,editable:false
        ,filterable:false
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,pageable:false
        ,height:${signLineGridHeight}
        ,columns:[
            {field:"signDocLineNo", title:"<spring:message code='global.lbl.signDocLineNo' />", width:100 ,attributes:{"class":"ac"}}
            ,{field:"signRsltCd", title:"<spring:message code='global.lbl.signRsltCd' />", width:100 ,attributes:{"class":"ac"}
                ,template:"# if(signRsltCdMap[signRsltCd] != null) { # #= signRsltCdMap[signRsltCd].cmmCdNm# # }#"
            }
            ,{field:"signUsrNm", title:"<spring:message code='global.lbl.prsNm' />", width:150}
            ,{field:"signCont", title:"<spring:message code='global.lbl.signCont' />"}
        ]
    });
});
</script>