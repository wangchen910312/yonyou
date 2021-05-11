<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<link rel="stylesheet" href="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.css"/>" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery-ui-1.11.4.custom/jquery-ui.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery.form.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dms/jquery.ui.ext-1.0.js"/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.parts-1.0.js' />"></script>


    <!-- 부품선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <div class="table_form form_width_100per mt5" role="search" data-btnid="btnSearch" id="claimForm">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:11%;">
                    <col style="width:9%;">
                    <col style="width:12%;">
                    <col style="width:12%;">
                    <col style="width:12%;">
                    <col style="width:10%;">
                    <col style="width:12%;">
                    <col style="width:10%;">
                    <col style="width:12%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row" colspan="2"><spring:message code="par.lbl.oversAndShortsClaimNo" /><!-- 클레임번호 --></th>
                        <td>
                            <input id="claimantNo" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row"><spring:message code="par.lbl.procStatus" /><!-- 처리상태 --></th>
                        <td>
                            <input id="status"  data-type="combo" class="form_comboBox form_readonly" readonly/>
                        </td>
                        <th scope="row">目标库的<!-- 창고 --></th>
                        <td colspan="3">
                            <input id=enabled  data-type="combo" class="form_comboBox form_readonly" readonly/>
                        </td>
                    </tr>
                    <tr>

                        <th scope="row">1.审核信息</th>
                        <th scope="row">审核类型</th>
                        <td>
                            <input id="auditType"  data-type="combo" class="form_comboBox form_readonly" readonly/>
                        </td>
                        <th scope="row">审核担当 ID</th>
                        <td>
                            <input id="auditUserId" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row">审核担当</th>
                        <td>
                            <input id="auditUserName" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row">审核时间</th>
                        <td>
                            <input id="auditTime" data-type="maskDate" class="form_datepicker form_readonly" readonly/>
                        </td>
                    </tr>
                    <tr>

                        <th scope="row">2.确认信息</th>
                        <th scope="row">确认类型</th>
                        <td>
                            <input id="confirmType"  data-type="combo" class="form_comboBox form_readonly" readonly/>
                        </td>
                        <th scope="row">确认担当 ID</th>
                        <td>
                            <input id="confirmUserId" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row">确认担当</th>
                        <td>
                            <input id="confirmUserName" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row">确认时间</th>
                        <td>
                            <input id="confirmTime" data-type="maskDate" class="form_datepicker form_readonly" readonly/>
                        </td>
                    </tr>
                    <tr>

                        <th scope="row">3.处理信息</th>
                        <th scope="row">处理类型</th>
                        <td>
                            <input id="handleType"  data-type="combo" class="form_comboBox form_readonly" readonly/>
                        </td>
                        <th scope="row">处理担当 ID</th>
                        <td>
                            <input id="handleUserId" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row">处理担当</th>
                        <td>
                            <input id="handleUserName" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row">处理时间</th>
                        <td>
                            <input id="handleTime" data-type="maskDate" class="form_datepicker form_readonly" readonly/>
                        </td>
                    </tr>
                    <tr>

                        <th scope="row">4.后续跟踪(财务)</th>
                        <th scope="row">跟踪类型</th>
                        <td>
                            <input id="accountTrackType"  data-type="combo" class="form_comboBox form_readonly" readonly/>
                        </td>
                        <th scope="row">后续跟踪担当 ID</th>
                        <td>
                            <input id="accountUserId" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row">后续跟踪担当</th>
                        <td>
                            <input id="accountUserName" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row">后续跟踪时间</th>
                        <td>
                            <input id="accountTime" data-type="maskDate" class="form_datepicker form_readonly" readonly/>
                        </td>
                    </tr>
                    <tr>

                        <th scope="row">5.后续跟踪(物流)</th>
                        <th scope="row">跟踪类型</th>
                        <td>
                            <input id="followTrackType"  data-type="combo" class="form_comboBox form_readonly" readonly/>
                        </td>
                        <th scope="row">后续跟踪担当 ID</th>
                        <td>
                            <input id="followUserId" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row">后续跟踪担当</th>
                        <td>
                            <input id="followUserName" class="form_input form_readonly" readonly />
                        </td>
                        <th scope="row">后续跟踪时间</th>
                        <td>
                            <input id="followTime" data-type="maskDate" class="form_datepicker form_readonly" readonly/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="table_grid mt5">
            <!-- 과부족클레임 그리드 -->
            <div id="grid" class="grid"></div>
        </div>
    </section>
    <!-- //부품선택 팝업 -->

 <script type="text/javascript">

 /************************************************************
 팝업옵션 설정
*************************************************************/
/**
* 팝업 옵션
*/
var options = parent.oversAndShortsClaimInfcPopupWindow.options.content.data,
    statusList            = [],
    strgeCdList           = [],
    auditTypeList         = [],
    confirmTypeList       = [],
    handleTypeList        = [],
    accountTrackTypeList  = [],
    followTrackTypeList   = [],
    isPassObj             = {},
    noPassReasonObj       = {},
    siteVerifyResultObj   = {},
    siteHandleViewObj     = {},
    handleModeObj         = {},
    noReparationReasonObj = {},
    isAccountArrivedObj   = {},
    followTrackObj        = {},
    claimTypeDropDownEditor,
    searchItemPopupWindow,
    sClaimantNo,
    toDt                  = "${toDt}";

    <c:forEach var="obj" items="${strgeCdList}" varStatus="status">
        strgeCdList.push({cmmCd:"${obj.strgeCd}", cmmCdNm:"${obj.strgeNm}"});
    </c:forEach>

    <c:forEach var="obj" items="${statusList}" varStatus="status">
        statusList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${auditTypeList}" varStatus="status">
        auditTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${confirmTypeList}" varStatus="status">
        confirmTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${handleTypeList}" varStatus="status">
        handleTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${accountTrackTypeList}" varStatus="status">
        accountTrackTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    <c:forEach var="obj" items="${followTrackTypeList}" varStatus="status">
        followTrackTypeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    isPassObj[' '] = "";
    <c:forEach var="obj" items="${isPassList}" varStatus="status">
        isPassObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    noPassReasonObj[' '] = "";
    <c:forEach var="obj" items="${noPassReasonList}" varStatus="status">
        noPassReasonObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    siteVerifyResultObj[' '] = "";
    <c:forEach var="obj" items="${siteVerifyResultList}" varStatus="status">
        siteVerifyResultObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    siteHandleViewObj[' '] = "";
    <c:forEach var="obj" items="${siteHandleViewList}" varStatus="status">
        siteHandleViewObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    handleModeObj[' '] = "";
    <c:forEach var="obj" items="${handleModeList}" varStatus="status">
        handleModeObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    noReparationReasonObj[' '] = "";
    <c:forEach var="obj" items="${noReparationReasonList}" varStatus="status">
        noReparationReasonObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    isAccountArrivedObj[' '] = "";
    <c:forEach var="obj" items="${isAccountArrivedList}" varStatus="status">
        isAccountArrivedObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>

    followTrackObj[' '] = "";
    <c:forEach var="obj" items="${followTrackList}" varStatus="status">
        followTrackObj["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>


    $(document).ready(function() {


        //처리상태
        $("#status").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:statusList
            ,index:0
        });
        $("#status").data("kendoExtDropDownList").enable(false);

        //심사유형
        $("#auditType").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:auditTypeList
            ,index:0
        });
        $("#auditType").data("kendoExtDropDownList").enable(false);

        //확정유형
        $("#confirmType").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:confirmTypeList
            ,index:0
        });
        $("#confirmType").data("kendoExtDropDownList").enable(false);

        //처리유형
        $("#handleType").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:handleTypeList
            ,index:0
        });
        $("#handleType").data("kendoExtDropDownList").enable(false);

        //추척유형
        $("#accountTrackType").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:accountTrackTypeList
            ,index:0
        });
        $("#accountTrackType").data("kendoExtDropDownList").enable(false);

        //추적유형
        $("#followTrackType").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:followTrackTypeList
            ,index:0
        });
        $("#followTrackType").data("kendoExtDropDownList").enable(false);

        //창고
        $("#enabled").kendoExtDropDownList({
             dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:strgeCdList
            ,index:0
        });
        $("#enabled").data("kendoExtDropDownList").enable(false);


        $("#auditTime").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#confirmTime").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#handleTime").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#accountTime").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        $("#followTime").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='par.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /************************************************************
                    기능버튼 설정
        *************************************************************/

        /************************************************************
                    조회조건 설정
        *************************************************************/
        // 조회조건 설정

        if(!dms.string.isEmpty(options.claimantNo)){
            sClaimantNo = options.claimantNo;
            $.ajax({
                url:"<c:url value='/par/pcm/claim/selectOversAndShortsClaimInfcByKey.do' />",
                data:JSON.stringify({ sClaimantNo:options.claimantNo}),
                type:"POST",
                dataType:"json",
                contentType:"application/json",
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                }

            }).done(function(result) {

                //[partsJs]:dms.parts-1.0.js 안에 정의 된 Object
                if (!partsJs.validate.getAllPluginObjInfo($("#claimForm")[0])) {
                    return false;
                }

                partsJs.validate.groupObjAllDataSet(result);
                $("#grid").data("kendoExtGrid").dataSource.read();

            });
        }


        // 클레임 관리 그리드
        $("#grid").kendoExtGrid({
            gridId:"G-PAR-0519-182701"
           ,dataSource:{
                transport:{
                    read:{
                         url:"<c:url value='/par/pcm/claim/selectOversAndShortsClaimInfcItemsByKey.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            // 입고확정대상 검색조건 코드.
                            params["sClaimantNo"]           = sClaimantNo;

                            return kendo.stringify(params);
                        }
                    }
                }
            ,schema:{
                     data:function (result){
                         return result.data;
                     }
                    ,total:"total"
                    ,model:{
                       id:"claimNo"
                      ,fields:{
                              dlrCd                :{ type:"string" }
                            , claimNo              :{ type:"string" }
                            , claimLine            :{ type:"number" }
                            , orderNo              :{ type:"string" }
                            , partNo               :{ type:"string" }
                            , isPass               :{ type:"number" }
                            , noPassReason         :{ type:"number" }
                            , partPrice            :{ type:"number" }
                            , siteVerifyResult     :{ type:"number" }
                            , siteHandleView       :{ type:"number" }
                            , respDetermin         :{ type:"string" }
                            , handleMode           :{ type:"number" }
                            , claimantAmount       :{ type:"number" }
                            , bmpPaymentAmount     :{ type:"number" }
                            , noReparationReason   :{ type:"number" }
                            , isAccountArrived     :{ type:"number" }
                            , followTrack          :{ type:"number" }
                        }
                    }
                }
            }
            , selectable :"row"
            , scrollable :true
            , sortable   :false
            , autoBind   :false
            , filterable:false
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , height     :150
            , pageable   :false
            , editable  :false
            , columns:[
                  {   //딜러코드
                      title:"<spring:message code='par.lbl.dlrCd' />"
                     ,field:"dlrCd"
                     ,width:80
                     ,hidden:true
                  }
                , {   //클레임번호
                      title:"<spring:message code='par.lbl.oversAndShortsClaimNo' />"
                     ,field:"claimNo"
                     ,width:100
                     ,hidden:true
                  }
                , {   //클레임라인번호
                      title:"<spring:message code='par.lbl.lineNm' />"
                     ,field:"claimLine"
                     ,width:100
                     ,hidden:true
                  }
                , {   //오더번호
                      title:"<spring:message code='par.lbl.purcOrdNo' />"
                     ,field:"orderNo"
                     ,width:100
                  }
                , {   //부품번호
                      title:"<spring:message code='par.lbl.itemCd' />"
                     ,field:"partNo"
                     ,width:140
                  }
                , {   //심사통과여부
                      title:"是否审通过"
                     ,field:"isPass"
                     ,template:'#= changeIsPass(isPass)#'
                     ,width:100
                  }
                , {   //불통과원인
                      title:"审核不通过原因"
                     ,field:"noPassReason"
                     ,template:'#= changeNoPassReason(noPassReason)#'
                     ,width:100
                  }
                , {   //단가
                      title:"<spring:message code='ser.lbl.itemUntPrc' />"
                     ,field:"partPrice"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                  }
                , {   //현장심사결과
                    title:"现场审核结果"
                   ,field:"siteVerifyResult"
                   ,template:'#= changeSiteVerifyResult(siteVerifyResult)#'
                   ,width:100
                }
                , {   //현장처리의견
                    title:"现场处理意见"
                   ,field:"siteHandleView"
                   ,template:'#= changeSiteHandleView(siteHandleView)#'
                   ,width:100
                }
                , {   //책임판정
                    title:"责任判定"
                   ,field:"respDetermin"
                   ,width:100
                }
                , {   //처리방식
                    title:"处理方式"
                   ,field:"handleMode"
                   ,template:'#= changeHandleMode(handleMode)#'
                   ,width:100
                }
              , {   //클레임금액
                      title:"索赔金额"
                     ,field:"claimantAmount"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                 }
              , {   //BMP배상금액
                      title:"BMP赔付金额"
                     ,field:"bmpPaymentAmount"
                     ,width:90
                     ,attributes:{ "style":"text-align:right"}
                     ,format:"{0:n2}"
                }
              , {   //미배상원인
                    title:"不赔偿原因"
                   ,field:"noReparationReason"
                   ,template:'#= changeNoReparationReason(noReparationReason)#'
                   ,width:100
                }
              , {   //입금여부
                    title:"赔付款已到预付款账户：是/否 "
                   ,field:"isAccountArrived"
                   ,template:'#= changeIsAccountArrived(isAccountArrived)#'
                   ,width:100
                }
              , {   //물류추적
                    title:"物流科后续跟踪"
                   ,field:"followTrack"
                   ,template:'#= changeFollowTrack(followTrack)#'
                   ,width:100
                }
            ]
        });

        // 심사통과여부
        changeIsPass = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = isPassObj[val];
            }
            return returnVal;
        };

        // 불통과원인
        changeNoPassReason = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = noPassReasonObj[val];
            }
            return returnVal;
        };

        // 현장심사결과
        changeSiteVerifyResult = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = siteVerifyResultObj[val];
            }
            return returnVal;
        };

        // 현장처리의견
        changeSiteHandleView = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = siteHandleViewObj[val];
            }
            return returnVal;
        };

        // 처리방식
        changeHandleMode = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = handleModeObj[val];
            }
            return returnVal;
        };

        // 미배상원인
        changeNoReparationReason = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = noReparationReasonObj[val];
            }
            return returnVal;
        };

        // 입금여부
        changeIsAccountArrived = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = isAccountArrivedObj[val];
            }
            return returnVal;
        };

        // 물류추적
        changeFollowTrack = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                returnVal = followTrackObj[val];
            }
            return returnVal;
        };


    });



 </script>

