<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 사용자정의신청 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.userDefined" /></h1>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnMasterSearch"><spring:message code="global.btn.search" /></button>
            <button class="btn_m btn_save" id="btnMasterSave"><spring:message code="global.btn.save" /></button>
            <button class="btn_m btn_cancel" id="btnMasterCancel"><spring:message code="global.btn.cancel" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:50%;">
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
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- // 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_add" id="btnMasterAdd"><spring:message code="global.btn.rowAdd" /></button>
            <button class="btn_s btn_del" id="btnMasterDel"><spring:message code="global.btn.rowDel" /></button>
        </div>
    </div>
    <!-- // 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="masterGrid" class="resizable_grid"></div>
    </div>
    <!-- // 그리드 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <iframe id="subGridFrame" name="subGridFrame" src="" height="250" width="100%" frameborder="0" framespacing="0" marginheihgt="0" marginwidth="0">

        </iframe>
    </div>
    <!-- // 그리드 종료 -->
</section>
</div>

<script type="text/javascript">
    // 사용자 정의 신청 승인 / 반려 팝업
    var surveyAnswerDetailPopupWin;

    fnUserDefinedPreviewPopup = function(selectedVal) {
        surveyAnswerDetailPopupWin = dms.window.popup({
           windowsId:"surveyAnswerDetailPopupWin"
         , title:"<spring:message code='global.title.userDefinedDetail' />"/* 사용자 정의 신청 승인 / 반려 팝업 */
         , content:{
              url:"<c:url value='/cmm/sci/userDefined/selectSurveyAnswerDetailPopup.do' />"
            , data:{
                 "autoBind":false
               , "sUsrDefReqDocId":selectedVal.usrDefReqDocId
               , "sDlrCd":selectedVal.dlrCd
               , "callbackFunc":function(data){
                   dms.notification.success(data);
                 }
              }
           }
         , height:400
        });
    }

    $(document).ready(function() {
        $("#subGridFrame").hide();

        // 버튼 - 조회
        $("#btnMasterSearch").kendoButton({
            click:function(e) {
                $('#masterGrid').data('kendoExtGrid').dataSource.page(1);
            }
        });

        $("#btnMasterSave").kendoButton({
            click:function(e) {
                var masterGrid = $("#masterGrid").data("kendoExtGrid");
                var masterRows = masterGrid.select();

                var saveData = masterGrid.getCUDData("insertList", "updateList", "deleteList");

                $.ajax({
                    url:"<c:url value='/cmm/sci/userDefined/deleteUserDefined.do' />"
                  , data:JSON.stringify(saveData)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");

                        $('#masterGrid').data('kendoExtGrid').dataSource.page(1);
                    }
                });
            }
        });

        // 버튼 - 추가
        $("#btnMasterAdd").kendoButton({
            click:function(e) {
                // Tab Open
                parent._createOrReloadTabMenu("<spring:message code='cmm.title.userDefinedInsert' />", "<c:url value='/cmm/sci/userDefined/selectUserDefinedWrite.do' />?usrDefReqDocId=");
            }
        });

        // 버튼 - 삭제
        $("#btnMasterDel").kendoButton({
            click:function(e) {
                var grid = $("#masterGrid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        // 버튼 - 취소
        $("#btnMasterCancel").kendoButton({
            click:function(e) {
                $('#masterGrid').data('kendoExtGrid').cancelChanges();
            }
        });

        // 그리드 설정
        $("#masterGrid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/userDefined/selectUserDefined.do' />"
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
                          , tempYn:{type:"string", editable:false}
                          , usrNm:{type:"string", editable:false}
                          , regDt:{type:"string", editable:false}
                        }
                    }
                }
            }
            , height:242
            , editableOnlyNew:true
            , multiSelectWithCheckbox:true
            , change:function(e) {
                var selectedVal = this.dataItem(this.select());
                var url = "<c:url value='/cmm/sci/userDefined/selectUserDefinedSubMain.do?sUsrDefReqDocId=" + selectedVal.usrDefReqDocId + "' />";

                // Tab Open
                parent._createOrReloadTabMenu("<spring:message code='cmm.title.userDefinedUpdate' />", "<c:url value='/cmm/sci/userDefined/selectUserDefinedWrite.do' />?usrDefReqDocId=" + selectedVal.usrDefReqDocId);

                $("#subGridFrame").show();
                $("#subGridFrame").attr("src", url);
            }
            , columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />" , width:60, sortable:false, attributes:{"class":"ac"}}
              , {field:"usrDefReqDocId", title:"<spring:message code='global.lbl.docId' />", width:150, attributes:{"class":"ac"}}
              , {field:"usrDefReqDocNm", title:"<spring:message code='global.lbl.docNm' />", width:300}
              , {field:"startDt",  title:"<spring:message code='cmm.lbl.startDt' />", width:150, attributes:{"class":"ac"}}
              , {field:"endDt", title:"<spring:message code='cmm.lbl.endDt' />", width:150, attributes:{"class":"ac"}}
              , {field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:150, attributes:{"class":"ac"}}
              , {field:"regDt", title:"<spring:message code='global.lbl.regDt' />", width:150, attributes:{"class":"ac"}}
              , {title:""}
            ]
        });
    });
</script>