<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="pop_wrap">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.signWrite" />[${signVO.signDocNm}]<!-- 결재양식제목명 --></h1>
        <div class="btn_right">
            <button id="btnTempSave" class="btn_m btn_save"><spring:message code="global.btn.tempSave" /></button>
            <button id="btnApprovalRequest" class="btn_m btn_save"><spring:message code="global.btn.approvalRequest" /></button>
            <c:if test="${signVO.signStatCd == '01'}">
            <!-- 결재상신 문서의 결재진행 상태가 대기 인 경우 상신취소 버튼 출력 -->
            <button id="btnCancelSign" class="btn_m btn_cancel"><spring:message code="global.btn.cancelSign" /></button>
            </c:if>
        </div>
    </div>

    <form id="form">
    <input type="hidden" id="reqUsrId" name="reqUsrId" value="${signVO.reqUsrId}" />

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
                        <input type="text" id="reqEmpNo" name="reqEmpNo" value="${signVO.reqEmpNo}" required data-name="<spring:message code="global.lbl.empNo" />" class="form_input" readOnly />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.name" /><!-- 이름 --></th>
                    <td>
                        <input type="text" id="reqUsrNm" name="reqUsrNm" value="${signVO.reqUsrNm}" required data-name="<spring:message code="global.lbl.name" />" class="form_input" readOnly />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.signDt" /><!-- 기안일자 --></th>
                    <td>
                        <input type="text" id="reqDt" name="reqDt" required data-name="<spring:message code="global.lbl.signDt" />" class="form_datepicker" readOnly />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.signReqTitle" /><!-- 결재요청제목 --></th>
                    <td colspan="5">
                        <input type="text" id="reqTitleNm" name="reqTitleNm" value="${signVO.reqTitleNm}" required data-name="<spring:message code="global.lbl.signReqTitle" />" class="form_input" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.signReqCont" /><!-- 결재요청상세 --></h2>
    </div>
    <div class="table_form">
         <textarea id="reqCont" name="reqCont" class="form_textarea" style="height:137px;" required data-name="<spring:message code="global.title.signReqCont" />">${signVO.reqCont}</textarea>
    </div>
    </form>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.signLine" /><!-- 결재선 --></h2>
        <div class="btn_right">
            <button type="button" class="btn_s btn_add" id="btnChangeLine"><spring:message code='global.btn.signLineChange' /></button><!-- 결재선변경 -->
        </div>
    </div>

    <div class="table_grid">
        <div id="gridSignLine"></div>
    </div>

</section>

<script type="text/javascript">

//결재상신 저장 URL
var signDocSaveUrl;
//결재상신 결재선조회 URL
var signDocLineUrl;
//결재상신 결재선조회 파라메터
var signDocLineParams = {};

<c:choose>
<c:when test="${signVO.signDocNo == null}">
    //결재상신 신규문서 인 경우
    signDocSaveUrl = "<c:url value='/cmm/apr/sign/insertSign.do' />";
    signDocLineUrl = "<c:url value='/cmm/apr/doc/selectDocLines.do' />";
    signDocLineParams["sSignDocId"] = "${signVO.signDocId}";
</c:when>
<c:otherwise>
    //결재상신 임시저장 인 경우
    signDocSaveUrl = "<c:url value='/cmm/apr/sign/updateSign.do' />";
    signDocLineUrl = "<c:url value='/cmm/apr/sign/selectSignLines.do' />";
    signDocLineParams["sSignDocNo"] = "${signVO.signDocNo}";
</c:otherwise>
</c:choose>

//결재구분
var signTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${signTpList}">
signTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var signTpMap = dms.data.arrayToMap(signTpList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    //팝업 옵션
    var popupWindow = parent.$("#signWritePopupWin").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;
    var validator = $("#form").kendoExtValidator().data("kendoExtValidator");

    //조회조건-기안일자
    $("#reqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,parseFormat:"yyyy-MM-dd"
        ,value:"<fmt:formatDate pattern='yyyy-MM-dd' value='${signVO.reqDt}' />"
    });

    //버튼 - 임시저장/저장
    $(".btn_save").kendoButton({
        click:function(e) {
            if (validator.validate()) {
                $.ajax({
                    url:signDocSaveUrl
                    ,data:JSON.stringify({
                        "signDocNo":"${signVO.signDocNo}"
                        ,"signDocId":"${signVO.signDocId}"
                        ,"reqEmpNo":$("#reqEmpNo").val()
                        ,"reqUsrId":$("#reqUsrId").val()
                        ,"reqUsrNm":$("#reqUsrNm").val()
                        ,"reqDt":$("#reqDt").data("kendoExtMaskedDatePicker").value()
                        ,"reqTitleNm":$("#reqTitleNm").val()
                        ,"reqCont":$("#reqCont").val()
                        ,"signLines":$("#gridSignLine").data("kendoExtGrid").dataSource.data()
                        ,"tempSaveYn":e.event.target.id == "btnTempSave"? "Y":"N"
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

    //버튼-상신취소
    <c:if test="${signVO.signStatCd == '01'}">
    //결재상신 문서의 결재진행 상태가 대기 인 경우 상신취소 가능
    $("#btnCancelSign").kendoButton({
        click:function(e) {
            dms.window.confirm({
                message:"<spring:message code='global.info.cancel'/>"
                ,width:300
                ,callback:function(result){
                    if(result){
                        $.ajax({
                            url:"<c:url value='/cmm/apr/sign/deleteSign.do' />"
                            ,data:"signDocNo=${signVO.signDocNo}"
                            ,type:'POST'
                            ,dataType:'json'
                            ,async:true
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

    // 결재라인 변경 버튼
    $("#btnChangeLine").kendoButton({
        click:function(e) {
            var signLineGrid = $("#gridSignLine").data("kendoExtGrid");
            window.parent.changeSignLine(signLineGrid);
        }
    });

    //그리드 설정
    $("#gridSignLine").kendoExtGrid({
        gridId:"G-CMM-0106-082701"
        ,dataSource:{
             transport:{
                read:{
                    url:signDocLineUrl
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        return kendo.stringify(signDocLineParams);
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
                        rnum:{type:"number", editable:false}
                        ,signDocNo:{type:"string", validation:{required:true}}
                        ,signDocLineNo:{type:"string", validation:{required:true}}
                        ,signTp:{type:"string", validation:{required:true}}
                        ,signUsrId:{type:"string", validation:{required:true}}
                        ,signUsrNm:{type:"string", validation:{required:true}}
                        ,signPsitCd:{type:"string", validation:{required:true}}
                        ,signPsitNm:{type:"string", validation:{required:true}}
                        ,signDeptCd:{type:"string", validation:{required:true}}
                        ,signDeptNm:{type:"string", validation:{required:true}}
                    }
                }
            }
        }
        ,selectable:"row"
        ,editable:false
        ,pageable:false
        ,sortable:false
        ,filterable:false
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,height:180
        ,columns:[
            {field:"signDocLineNo", title:"<spring:message code='global.lbl.signDocLineNo' />", width:100 ,attributes:{"class":"ac"}}
            ,{field:"lastSignYn", title:"<spring:message code='global.lbl.final' />", width:100 ,attributes:{"class":"ac"}}
            ,{field:"signTp", title:"<spring:message code='global.lbl.gubun' />", width:100 ,attributes:{"class":"ac"}
                ,template:"# if(signTpMap[signTp] != null) { # #= signTpMap[signTp].cmmCdNm# # }#"
             }
            ,{field:"signUsrNm", title:"<spring:message code='global.lbl.apprUsrNm' />", width:200}
            ,{title:""}
        ]
    });
});
</script>