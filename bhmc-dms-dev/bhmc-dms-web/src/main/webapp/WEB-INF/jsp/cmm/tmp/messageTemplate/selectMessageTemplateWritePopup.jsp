<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button>
        </div>
    </div>

    <div id="inputForm" class="table_form form_width_100per" role="search" data-btnid="btnSearch">
    <table>
        <caption></caption>
        <colgroup>
            <col style="width:15%;">
            <col style="width:60%">
            <col>
        </colgroup>
        <tbody>
            <tr>
                <th scope="row"><spring:message code='global.lbl.mesgTmplTp'/><!-- 메세지템플릿유형  --></th>
                <td>
                    <input type="text" id="mesgTmplTp" name="mesgTmplTp" class="form_comboBox" required data-name="<spring:message code="global.lbl.mesgTmplTp" />" />
                </td>
                <td></td>
            <tr>
                <th scope="row"><spring:message code='global.lbl.mesgTmplNm'/><!-- 메세지템플릿명  --></th>
                <td>
                    <input type="text" id="mesgTmplNm" name="mesgTmplNm" class="form_input" required maxlength="128" data-name="<spring:message code="global.lbl.mesgTmplNm" />" />
                </td>
                <td>
                    &nbsp;&nbsp;
                    <spring:message code='global.lbl.defaultYn'/><!-- 기본여부  -->
                    <input type="checkbox" id="defaultYn" name="defaultYn" value="Y" class="form_check">

                    &nbsp;&nbsp;
                    <spring:message code='global.lbl.useYn'/><!-- 사용여부  -->
                    <input type="checkbox" id="useYn" name="useYn" value="Y" class="form_check" checked>
                </td>
            </tr>
            <tr>
                <th scope="row"><spring:message code='global.lbl.mesgTmplCont'/><!-- 템플릿내용  --></th>
                <td colspan="2"><textarea  id="mesgTmplCont"  name="mesgTmplCont" class="form_textarea" style="height:393px;" required data-name="<spring:message code="global.lbl.mesgTmplCont" />"></textarea></td>
            </tr>
        </tbody>
    </table>
    </div>

</section>

<script type="text/javascript">

    //메세지템플릿 유형 목록
    var mesgTmplTpList = [];
    <c:forEach var="obj" items="${mesgTmplTpList}">
    mesgTmplTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    $(document).ready(function() {

        //메세지템플릿 유형
        $("#mesgTmplTp").kendoExtDropDownList({
            dataSource:dms.data.cmmCdFilter(mesgTmplTpList)
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,index:0
        });

        var validator = $("#inputForm").kendoExtValidator().data("kendoExtValidator");

        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.messageTemplatePopupWin.options.content.data;

         /************************************************************
                    기능버튼 설정
        *************************************************************/

        // 기본여부
        $("#defaultYn").click(function(){
            if($(this).prop("checked")){
                $("#useYn").prop("checked", true);
            }
        });

        // 사용자여부
        $("#useYn").click(function(){
            if($("#defaultYn").prop("checked")){
                $("#useYn").prop("checked", true);
            }
        });

        //버튼 - 저장
        $("#btnSave").click(function(){

            if (validator.validate()) {
                $.ajax({
                    url:"<c:url value='/cmm/tmp/messageTemplate/insertMessageTemplate.do' />"
                    ,data:JSON.stringify({
                        "mesgTmplGrpId":options.mesgTmplGrpId
                        ,"mesgTmplTp":$("#mesgTmplTp").data("kendoExtDropDownList").value()
                        ,"mesgTmplNm":$("#mesgTmplNm").val()
                        ,"mesgTmplCont":$("#mesgTmplCont").val()
                        ,"defaultYn":$("#defaultYn").prop("checked")? "Y":"N"
                        ,"useYn":$("#useYn").prop("checked")? "Y":"N"
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
                        options.callbackFunc();
                        parent.messageTemplatePopupWin.close();

                    }
                });
            }
        });

    });
</script>









