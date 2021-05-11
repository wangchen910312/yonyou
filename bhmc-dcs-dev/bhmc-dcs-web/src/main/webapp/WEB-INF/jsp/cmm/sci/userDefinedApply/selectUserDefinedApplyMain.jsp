<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 사용자정의신청 관리 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.userDefined" /></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_50per" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="global.lbl.docId" /><!-- 문서ID --></th>
                    <td>
                        <input type="text" id="sUsrDefReqDocId" name="sUsrDefReqDocId" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.docNm" /><!-- 문서명 --></th>
                    <td>
                        <input type="text" id="sUsrDefReqDocNm" name="sUsrDefReqDocNm" class="form_input" />
                    </td>
                    <th scope="row"></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" name="sStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" name="sEndDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- // 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid"></div>
    </div>
    <!-- // 그리드 종료 -->
</section>

<script type="text/javascript">
    //승인 여부  Array
    var arrPaymentStateTp = [];
    <c:forEach var="obj" items="${arrPaymentStateTp}">
        arrPaymentStateTp.push({
            "cmmCd":"${obj.cmmCd}"
          , "cmmCdNm":"${obj.cmmCdNm}"
        });
    </c:forEach>

    var paymentStateTpMap = dms.data.arrayToMap(arrPaymentStateTp, function(obj){ return obj.cmmCd; });

    // 사용자 정의 신청 승인 / 반려 팝업
    var surveyApplyPopupWin;

      //등록 시작일
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        // 등록 종료일
        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

    fnSurveyApplyPopup = function(selectedVal) {
        surveyApplyPopupWin = dms.window.popup({
           windowsId:"surveyApplyPopupWin"
         , title:"<spring:message code='global.title.userDefinedApply' />"
         , content:{
              url:"<c:url value='/cmm/sci/userDefinedApply/selectUserDefinedApplyPopup.do' />"
            , data:{
                 "autoBind":false
               , "sUsrDefReqDocId":selectedVal.usrDefReqDocId
               , "sDlrCd":selectedVal.dlrCd
               , "usrDefReqDocNm":selectedVal.usrDefReqDocNm
               , "usrDefReqCont":selectedVal.usrDefReqCont
               , "callbackFunc":function(data) {
                     dms.notification.success(data);

                     $('#grid').data('kendoExtGrid').dataSource.page(1);
                 }
              }
           }
        ,height:400
        });
    }

    $(document).ready(function() {
        // 버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e) {
                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        // 그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/userDefinedApply/selectUserDefinedApply.do' />"
                    }
                    , parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sUsrDefReqDocId"] = $("#sUsrDefReqDocId").val();
                            params["sUsrDefReqDocNm"] = $("#sUsrDefReqDocNm").val();
                            params["sStartDt"] = $("#sStartDt").val();
                            params["sEndDt"] = $("#sEndDt").val();

                            return kendo.stringify(params);
                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                , schema:{
                    model:{
                        id:"usrDefReqDocId"
                      , fields:{
                            rnum:{type:"number", editable:false}
                          , usrDefReqDocId:{type:"string", editable:false}
                          , usrDefReqDocNm:{type:"string", editable:false}
                          , startDt:{type:"string", editable:false}
                          , endDt:{type:"string", editable:false}
                          , dlrCd:{type:"string", editable:false}
                          , writer:{type:"string", editable:false}
                          , regDt:{type:"string", editable:false}
                          , approveStatCd:{type:"string", editable:false}
                          , approveUsrNm:{type:"string", editable:false}
                          , approveDt:{type:"string", editable:false}
                        }
                    }
                }
            }
            , height:250
            , editable:false
            , multiSelectWithCheckbox:true
            , change:function(e) {
                var selectedVal = this.dataItem(this.select());

                fnSurveyApplyPopup(selectedVal);
            }
            , columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />" , width:60, sortable:false, attributes:{"class":"ac"}}
              , {field:"usrDefReqDocId", title:"<spring:message code='global.lbl.docId' />", width:150, attributes:{"class":"ac"}}
              , {field:"usrDefReqDocNm", title:"<spring:message code='global.lbl.docNm' />", width:300}
              , {field:"startDt",  title:"<spring:message code='cmm.lbl.startDt' />", width:150, attributes:{"class":"ac"}}
              , {field:"endDt", title:"<spring:message code='cmm.lbl.endDt' />", width:150, attributes:{"class":"ac"}}
              , {field:"writer", title:"<spring:message code='global.lbl.wrtrNm' />", width:150, attributes:{"class":"ac"}}
              , {field:"regDt", title:"<spring:message code='global.lbl.wrtrDt' />", width:150, attributes:{"class":"ac"}}
              , {field:"approveStatCd", title:"<spring:message code='global.lbl.approveYn' />", width:150
                  , template:"# if(paymentStateTpMap[approveStatCd] != null) { # #= paymentStateTpMap[approveStatCd].cmmCdNm# # }#"
                  , attributes:{"class":"ac"}}
              , {field:"approveUsrNm", title:"<spring:message code='crm.lbl.applyUsr' />", width:150, attributes:{"class":"ac"}}
              , {field:"approveDt", title:"<spring:message code='global.lbl.approveDt' />", width:150, attributes:{"class":"ac"}}
              , {title:""}
            ]
        });
    });
</script>