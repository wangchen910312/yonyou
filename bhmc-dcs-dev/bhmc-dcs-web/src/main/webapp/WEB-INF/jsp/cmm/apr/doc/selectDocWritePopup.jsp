<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%//TODO[이인문] 파일업로드 플러그인으로 변경 필요 %>
<script src="<c:url value='/resources/js/resumableFileUpload/resumable.js' />"></script>
<div id="progressWindow" class="resumable-progress">
    <p class="progress-total-txt"><!-- 현재 <span class="current_num">3</span> / 전체 <span class="whole_num">4</span> (<span class="complete_size">10</span>MB / <span class="whole_size">65</span>MB) --></p>
    <table>
        <tr>
            <td width="100%">
                <div class="progress-container">
                    <div class="progress-bar"></div>
                    <div class="progress-txt">00%</div>
                </div>
            </td>
            <td class="progress-pause" nowrap="nowrap">
                <div class="progress-btn">
                    <a href="#" onclick="r.upload(); return(false);" class="progress-resume-link"><img src="<c:url value='/resources/img/btn_resume.png' />" title="Resume upload" /></a>
                    <a href="#" onclick="r.pause(); return(false);" class="progress-pause-link"><img src="<c:url value='/resources/img/btn_pause.png' />" title="Pause upload" /></a>
                </div>
            </td>
        </tr>
    </table>
    <ul class="resumable-list"></ul>
</div>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSave" class="btn_m btn_save"><spring:message code="global.btn.save" /></button>
            <button id="btnClose" class="btn_m btn_close"><spring:message code="global.btn.close" /></button>
        </div>
    </div>

    <input type="hidden" id="hidNttCont" name="hidNttCont" value="" />

    <div  class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <form id="saveForm">
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
                    <tr id="trUpdtUsrId">
                        <th scope="row"><spring:message code="global.lbl.signDocId" /><!-- 결재양식아이디--></th>
                        <td>
                            <input type="text" id="signDocId" name="signDocId" class="form_input">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.signDocNm" /><!-- 결재양식명 --></th>
                        <td>
                            <input type="text" id="signDocNm" name="signDocNm" class="form_input">
                        </td>
                    </tr>
                    <tr >
                        <th scope="row"><spring:message code="global.lbl.useYn" /><!-- 사용유무 --></th>
                        <td>
                            <input type="text" id="useYn" name="useYn" class="form_combo">
                        </td>
                        <th scope="row"><spring:message code="global.lbl.signAlrtYn" /><!-- 상신알람여부 --></th>
                        <td>
                            <input type="text" id="signAlrmYn" name="signAlrmYn" class="form_combo">
                        </td>
                    </tr>
                    <tr >
                        <th scope="row"><spring:message code="global.lbl.signCallBackAlrtYn" /><!-- 콜백알람여부 --></th>
                        <td>
                            <input type="text" id="signCallBackAlrmYn" name="signCallBackAlrmYn" class="form_combo">
                        </td>
                        <th></th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>

    <div class="header_area">
        <h2 class="title_basic"><spring:message code="global.title.signLine" /><!-- 결재선 --></h2>
        <div class="btn_right">

        </div>
    </div>

    <div class="clfix">
        <div class="left_areaStyle" style="width:45%">
            <div class="btn_right">
                <button id="btnUserSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            </div>
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
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
                            <th scope="row"><spring:message code="global.lbl.usrId" /></th>
                            <td>
                                <input id="sUsrId" name="sUsrId" class="form_input">
                            </td>
                            <th scope="row"><spring:message code="global.lbl.usrNm" /></th>
                            <td>
                                <input id="sUsrNm" name="sUsrNm" class="form_input">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid">
                <div class="table_grid">
                    <div id="gridUser"></div>
                </div>
            </div>
        </div>
        <div style="float:left; width:10%;">
            <spring:message code="global.lbl.signTp" />
            <input type="radio" id="signTp" name="signTp" value="" /> <spring:message code="global.lbl.signOk" /><!-- 합의 -->
            <input type="radio" id="signTp" name="signTp" value="" /> <spring:message code="cmm.menu.aprDocMng" /><!-- 결재 -->
            <button class="btn_s btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
            <button class="btn_s btn_del" id="btnDel"><spring:message code="global.btn.del" /></button>

        </div>

        <div class="right_areaStyle" style="width:45%">
            <div class="table_form form_width_70per" role="search" data-btnid="btnSearch">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:25%;">
                        <col style="width:24%;">

                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="global.lbl.signTpChange" /></th>
                            <td>
                                <input id="signTpChange" name="signTpChange" class="form_input">
                            </td>
                             <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="table_grid">
                <div class="table_grid">
                    <div id="gridSignLine"></div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">
    $(document).ready(function() {
        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.docWritePopupWin.options.content.data;

         // 상신 알람 여부
         $("#useYn").kendoExtDropDownList({
             dataSource:["Y", "N"]
         });

         $("#signCallBackAlrmYn").kendoExtDropDownList({
             dataSource:["Y", "N"]
         });

         // 상신 알람 여부
         $("#signAlrmYn").kendoExtDropDownList({
             dataSource:["Y", "N"]
         });

         /************************************************************
                    기능버튼 설정
        *************************************************************/


        // 닫기 버튼.
        $("#btnClose").kendoButton({
            click:function(e){
                parent.generalBoardPopupWin.close();
            }
        });

        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {
                var tempUrl     = "";
                var saveData    = "";

                if ($("#flag").val() != "U") {
                    if ($("#flag").val() == "R") {
                        $("#repLvlVal").val(parseInt($("#repLvlVal").val()) + 1);
                        $("#repSortOrderVal").val(parseInt($("#repSortOrderVal").val()) + 1);
                    }

                    tempUrl = "<c:url value='/cmm/board/generalBoard/inertDoc.do' />";
                }
                else {
                    tempUrl = "<c:url value='/cmm/board/generalBoard/updateGeneralBoard.do' />";
                }

                saveData = $("#saveForm").serializeObject();

                $.ajax({
                    url:tempUrl
                  , data:JSON.stringify(saveData)
                  , type:'POST'
                  , dataType:'json'
                  , async:false
                  , contentType:'application/json'
                  , error:function(jqXHR,status,error) {
                        //dms.notification.error(jqXHR.responseJSON.errors);
                    }
                  , success:function(jqXHR, textStatus) {
                        var data = [];
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");

                        options.callbackFunc(data);
                        parent.generalBoardPopupWin.close();
                    }
                });
            }
        });

        /************************************************************
                        기능버튼 설정
         *************************************************************/
        // 조회 버튼.
        $("#btnUserSearch").kendoButton({
            click:function(e){
                $("#gridUser").data("kendoExtGrid").dataSource.read();
            }
        });

        /************************************************************
                그리드 설정
        *************************************************************/
        //그리드 설정
        $("#gridUser").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/user/selectUsersForDealer.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sUsrId"] = $("#sUsrId").val();
                            params["sUsrNm"] = $("#sUsrNm").val();
                            params["sEmpNo"] = $("#sEmpNo").val();

                            return kendo.stringify(params);

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
                        id:"usrNm"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,usrId:{type:"string", validation:{required:true}}
                            ,usrNm:{type:"string", validation:{required:true}}
                            ,pstiNm:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            ,dataBound:function (e) {

              var dataItems = e.sender.dataSource.view();

              for (var j=0; j < dataItems.length; j++) {

                delete  dataItems[j]["usrPw"];

              }
            }
            ,multiSelectWithCheckbox:true
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,pageable:false
            ,height:305
            ,columns:[
                {field:"usrId", title:"<spring:message code='global.lbl.usrId' />", width:70 ,attributes:{"class":"ac"}}
                ,{field:"usrNm", title:"<spring:message code='global.lbl.usrNm' />", width:100}
                ,{field:"pstiNm", title:"<spring:message code='global.lbl.psitNm' />", width:100}
                ,{title:""}
            ]
        });

        //그리드 설정
        $("#gridSignLine").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/cmm/sci/user/selectUsersForDealer.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};


                            return kendo.stringify(params);

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
                        id:"usrNm"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,usrId:{type:"string", validation:{required:true}}
                            ,usrNm:{type:"string", validation:{required:true}}
                            ,pstiNm:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            ,dataBound:function (e) {
              var dataItems = e.sender.dataSource.view();

              for (var j=0; j < dataItems.length; j++) {

                delete  dataItems[j]["usrPw"];
              }
            }
            ,multiSelectWithCheckbox:true
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,autoBind:false
            ,pageable:false
            ,height:305
            ,columns:[
                {field:"lastSignYn", title:"<spring:message code='global.lbl.final' />", width:70 ,attributes:{"class":"ac"}}
                ,{field:"signTp", title:"<spring:message code='global.lbl.gubun' />", width:100}
                ,{field:"signUsrNm", title:"<spring:message code='global.lbl.prsNm' />", width:100}
                ,{title:""}
            ]
        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });
</script>