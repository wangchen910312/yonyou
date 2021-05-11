<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="pop_wrap">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.signInfo" />[${signVO.signDocNm}]</h1>

        <c:if test="${signVO.signStatCd == '01'}">
        <!-- 결재상신 문서의 결재진행 상태가 대기 인 경우 상신취소 버튼 출력 -->
        <div class="btn_right">
            <button id="btnCancelSign" class="btn_m btn_cancel"><spring:message code="global.btn.cancelSign" /></button>
        </div>
        </c:if>
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
                        <input type="text" id="reqUsrNm" name="reqUsrNm" value="${signVO.reqUsrNm}" class="form_input" readOnly />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.signDt" /><!-- 기안일자 --></th>
                    <td>
                        <input type="text" id="reqDt" name="reqDt" class="form_datepicker" readOnly />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.signReqTitle" /><!-- 결재요청제목 --></th>
                    <td colspan="5">
                        <input type="text" id="reqTitleNm" name="reqTitleNm" value="${signVO.reqTitleNm}" class="form_input" readOnly />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.signReqCont" /><!-- 결재요청상세 --></h2>
    </div>
    <div class="table_form">
         <textarea id="reqCont" name="reqCont" class="form_textarea" style="height:137px;" readOnly>${signVO.reqCont}</textarea>
    </div>
    </form>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.signLine" /><!-- 결재선 --></h2>
    </div>

    <div class="table_grid">
        <div id="gridSignLine"></div>
    </div>

</section>

<script type="text/javascript">
//결재구분
var signTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${signTpList}">
signTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var signTpMap = dms.data.arrayToMap(signTpList, function(obj){ return obj.cmmCd; });

//결재선 결재진행상태
var signStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${signStatCdList}">
signStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var signStatCdMap = dms.data.arrayToMap(signStatCdList, function(obj){ return obj.cmmCd; });

//결재선 결재처리유형
var signRsltCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${signRsltCdList}">
signRsltCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var signRsltCdMap = dms.data.arrayToMap(signRsltCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    //팝업 옵션
    var popupWindow = parent.$("#signViewPopupWin").data("kendoWindow");
    var popupOptions = popupWindow.options.content.data;

    //조회조건-기안일자
    $("#reqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,parseFormat:"yyyy-MM-dd"
        ,value:"<fmt:formatDate pattern='yyyy-MM-dd' value='${signVO.reqDt}' />"
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

    //그리드 설정
    $("#gridSignLine").kendoExtGrid({
        gridId:"G-CMM-0116-102201"
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
                        ,signDocLineNo:{type:"string"}
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
        ,pageable:false
        ,sortable:false
        ,filterable:false
        ,indvColumnVisible:false
        ,indvColumnReorderable:false
        ,height:180
        ,columns:[
            {field:"signDocLineNo", title:"<spring:message code='global.lbl.signDocLineNo' />", width:100 ,attributes:{"class":"ac"}}
            ,{field:"signTp", title:"<spring:message code='global.lbl.gubun' />", width:80 ,attributes:{"class":"ac"}
                ,template:"# if(signTpMap[signTp] != null) { # #= signTpMap[signTp].cmmCdNm# # }#"
            }
            ,{field:"signStatCd", title:"<spring:message code='global.lbl.signStatCd' />", width:80 ,attributes:{"class":"ac"}
                ,template:"# if(signStatCdMap[signStatCd] != null) { # #= signStatCdMap[signStatCd].cmmCdNm# # }#"
            }
            ,{field:"signRsltCd", title:"<spring:message code='global.lbl.signRsltCd' />", width:80 ,attributes:{"class":"ac"}
                ,template:"# if(signRsltCdMap[signRsltCd] != null) { # #= signRsltCdMap[signRsltCd].cmmCdNm# # }#"
            }
            ,{field:"signUsrNm", title:"<spring:message code='global.lbl.prsNm' />", width:120}
            ,{field:"signCont", title:"<spring:message code='global.lbl.signCont' />"}
        ]
    });
});
</script>