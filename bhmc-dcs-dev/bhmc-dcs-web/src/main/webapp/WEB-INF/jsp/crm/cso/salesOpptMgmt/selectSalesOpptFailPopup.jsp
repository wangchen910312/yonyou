<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="window" class="pop_wrap">

    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="global.title.saleOpptFailReg" /><!-- 판매기회 실패등록 --></h1> --%>
        <div class="btn_right">
            <button id="btnFailSave" class="btn_m btn_save"><spring:message code="global.btn.save" /><!-- 저장 --></button>
        </div>
    </div>
    <div class="table_form">
        <form id="salesOpptFailForm">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:10%;">
                <col style="width:22%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.failTpCd' /><!-- 실패 유형 --></span></th>
                    <td class="required_area">
                        <input id="failTpCd" name="failTpCd" class="form_comboBox" />
                        <input type="hidden" id="saleOpptNo" name="saleOpptNo" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.failBrandCd' /><!-- 실패브랜드 --></th>
                    <td>
                        <input id="failBrandCd" name="failBrandCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.failModelCd' /><!-- 실패차형--></th>
                    <td>
                        <input type="text" id="failModelCd" name="failModelCd" class="form_input" />
                    </td>
                </tr>
                <tr>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.failCau1Cd' /><!-- 실패1급원인 --></span></th>
                    <td class="required_area">
                        <input id="failCau1Cd" name="failCau1Cd" class="form_comboBox" />
                    </td>
                    <th scope="row"><span class="bu_required"><spring:message code='global.lbl.failCau2Cd' /><!-- 실패2급원인 --></span></th>
                    <td class="required_area">
                        <input id="failCau2Cd" name="failCau2Cd" class="form_comboBox" />
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>

</section>

<script type="text/javascript">

    $(document).ready(function() {

        // 팝업 form 데이터 set
        var options = parent.salesOpptFailPopup.options.content.data;

        console.log("실패 팝업 options :",options);

        $("#saleOpptNo").val(options.saleOpptNo);     //  판매기회 번호 set

        // 실패유형 DS
        var failTpCdListDs = [];
        <c:forEach var="obj" items="${failTpCdList}">
            failTpCdListDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        </c:forEach>

        // 브랜드
        var failBrandCdListDs = [];
        <c:forEach var="obj" items="${failBrandCdList}">
            failBrandCdListDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        </c:forEach>

        // 실패1급원인 DS
        var failCau1CdListDs = [];
        <c:forEach var="obj" items="${failCau1CdList}">
            failCau1CdListDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        </c:forEach>

        // 실패2급원인 DS
        var failCau2CdListDs = [];
        <c:forEach var="obj" items="${failCau2CdList}">
            failCau2CdListDs.push({text:"${obj.cmmCdNm}", value:"${obj.cmmCd}"});
        </c:forEach>

        // 실패유형
        $("#failTpCd").kendoExtDropDownList({
            dataSource:failTpCdListDs
            , dataTextField:"text"
            , dataValueField:"value"
            , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
            , index:0
        });

        // 실패브랜드
        $("#failBrandCd").kendoExtDropDownList({
            dataSource:failBrandCdListDs
            , dataTextField:"text"
            , dataValueField:"value"
            , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
            , index:0
        });

        // 실패1급원인
        $("#failCau1Cd").kendoExtDropDownList({
            dataSource:failCau1CdListDs
            , dataTextField:"text"
            , dataValueField:"value"
            , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
            , index:0
        });

        // 실패2급원인
        $("#failCau2Cd").kendoExtDropDownList({
            dataSource:failCau2CdListDs
            , dataTextField:"text"
            , dataValueField:"value"
            , optionLabel:"<spring:message code='global.btn.select' />"   // 선택
            , index:0
        });

        // 판매기회 실패등록
        $("#btnFailSave").kendoButton({
            click:function(e){

                if( dms.string.isEmpty($("#saleOpptNo").val()) ){
                    // 판매기회 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.saleOppt' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                    return;
                }

                if( dms.string.isEmpty($("#failTpCd").val()) ){
                    // 실패유형 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.failTpCd' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                    return;
                }

                if( dms.string.isEmpty($("#failCau1Cd").val()) ){
                     // 실패1급원인 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.failCau1Cd' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                    return;
                }

                if( dms.string.isEmpty($("#failCau2Cd").val()) ){
                    // 실패2급원인 / 을(를) 선택해주세요.
                    dms.notification.warning("<spring:message code='global.lbl.failCau2Cd' var='global_info_customer' /><spring:message code='global.info.chkSelectItemMsg' arguments='${global_info_customer}' />");
                    return;
                }

                var saveData = $("#salesOpptFailForm").serializeObject();

                console.log("saveData:"+JSON.stringify(saveData));
                //return;

                // 판매기회 실패등록
                $.ajax({
                        url:"<c:url value='/crm/cso/salesOpptMgmt/insertSalesOpptFail.do' />"
                        ,data:JSON.stringify(saveData)      //파라미터
                        ,type:'POST'                        //조회요청
                        ,dataType:'json'                  //json 응답
                        ,contentType:'application/json'   //문자열 파라미터
                        ,error:function(jqXHR,status,error){
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                }).done(function(body) {

                    console.log("판매기회 실패 팝업 저장 완료")
                    options.callbackFunc("SUCCESS");
                    parent.salesOpptFailPopup.close();

                });

            }
        });


    });
</script>
