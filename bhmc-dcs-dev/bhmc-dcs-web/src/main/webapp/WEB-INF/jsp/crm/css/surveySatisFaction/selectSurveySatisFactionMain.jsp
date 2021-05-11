<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

      <!-- 기본정보 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.serveyMng" /></h1> <!-- 설문 템플릿 관리 -->
                    <div class="btn_right">
                        <button type="button" class="btn_m btn_info" id="btnViewQuestion"><spring:message code="global.title.preview"/></button><!-- 설문 미리보기 -->
                        <button type="button" class="btn_m btn_search" id="btnSurveySearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                        <%-- <button type="button" class="btn_m btn_add" id="btnAddSurvey"><spring:message code='global.btn.rowAdd'/></button> <!-- 행추가 -->
                        <button type="button" class="btn_m btn_save" id="btnSaveSurvey"><spring:message code='global.btn.save'/></button>
                        <button type="button" class="btn_m btn_cancel" id="btnCancelSurvey"><spring:message code='global.btn.cancel' /></button> --%>
                    </div>
                </div>

                <!-- 조회 조건 시작 -->
                <div class="table_form form_width_50per" role="search" data-btnid="btnSurveySearch">
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
                                <th scope="row"><spring:message code='crm.lbl.subyTmplNm' /></th> <!-- 설문템플릿 -->
                                <td>
                                    <input id="sSubyTmplNm" class="form_input" type="text" maxlength="33">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.useYn" /></th> <!-- 사용여부 -->
                                <td>
                                    <input id="sDelYn" class="form_comboBox">
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 조회 조건 종료 -->

                <!-- 설문 템플릿 관리 그리드 기능버튼 -->
                <div class="header_area">
                    <div class="btn_right">
                        <button class="btn_s btn_save" id="btnSaveSurvey"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                        <button class="btn_s btn_add" id="btnAddSurvey"><spring:message code='global.btn.rowAdd' /></button> <!-- 행추가 -->
                        <button class="btn_s btn_del" id="btnDelSurvey"><spring:message code='global.btn.rowDel' /></button> <!-- 행삭제 -->
                        <button class="btn_s btn_cancel" id="btnCancelSurvey"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                    </div>
                </div>

                <div class="table_grid">
                    <div id="surveyGrid"></div>
                </div>
            </section>

            <section id="group">
                <div class="clfix">
                    <!-- 좌측 설문 질문 영역 시작-->
                    <section class="left_areaStyle">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="crm.title.surveyQuestionList" /></h2> <!-- 설문 질문-->
                            <div class="btn_right">
                                <button class="btn_s btn_save" id="btnSaveQuestion"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                                <button class="btn_s btn_add" id="btnAddQuestion"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
                                <button class="btn_s btn_delete" id="btnDelQuestion"><spring:message code='global.btn.rowDel' /></button><!-- 행삭제 -->
                                <button class="btn_s btn_cancel" id="btnCancelQuestion"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="questionGrid"></div>
                        </div>
                    </section>
                    <!-- 좌측 설문 질문 영역 종료-->

                    <!-- 우측 답변  영역 시작-->
                    <section class="right_areaStyle">
                        <div class="header_area">
                            <h2 class="title_basic"><spring:message code="crm.title.surveyAnswerList" /></h2> <!-- 설문 답변-->
                            <div class="btn_right">
                                <button class="btn_s btn_save" id="btnSaveAnswer"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                                <button class="btn_s btn_add" id="btnAddAnswer"><spring:message code='global.btn.rowAdd' /></button><!-- 행추가 -->
                                <button class="btn_s btn_delete" id="btnDelAnswer"><spring:message code='global.btn.rowDel' /></button><!-- 행삭제 -->
                                <button class="btn_s btn_cancel" id="btnCancelAnswer"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                            </div>
                        </div>
                        <div class="table_grid">
                            <div id="answerGrid"></div>
                        </div>
                    </section>
                    <!-- 우측 답변  영역 종료-->
                </div>

            </section>
      <!-- //기본정보 -->
<script type="text/javascript">

var supportedLangs = [""];
<c:forEach var="obj" items="${supportedLangs}">
supportedLangs.push("${obj}");
</c:forEach>

/*************************************************************
데이터 셋업
*************************************************************/
//그리드 질문유형 콤보 DataSource
var qestTpCdDSList = [];
var qestTpCdObj = {};

<c:forEach var="obj" items="${qestTpCdList}">
qestTpCdDSList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
;
//그리드 질문유형 Map
var qestTpCdMap = [];
$.each(qestTpCdDSList, function(idx, obj){
    qestTpCdMap[obj.cmmCd] = obj.cmmCdNm;
});



$(document).ready(function() {


    // 가중치
    $("#qestWgtVal").kendoExtNumericTextBox({
        format:"###"
    });

    //조회조건 - 활성여부
    $("#sDelYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,index:0
    });

    //버튼 - 조회
    $("#btnSurveySearch").kendoButton({
        click:function(e) {
            $('#surveyGrid').data('kendoExtGrid').dataSource.page(1);
            $('#questionGrid').data('kendoExtGrid').dataSource.data([]);
            $('#answerGrid').data('kendoExtGrid').dataSource.data([]);
        }
    });

    //버튼 - 행추가
     $("#btnAddSurvey").kendoButton({
        click:function(e) {
            //$('#surveyGrid').data('kendoExtGrid').dataSource.insert(0, {"delYn":"N","subyTmplNm":{type:"string" , editable:false}});
            $('#surveyGrid').data('kendoExtGrid').dataSource.insert(0, {"delYn":"N", "tmplResultCnt":0});
        }
    });


    //설문 버튼 - 행삭제
    $("#btnDelSurvey").kendoButton({
        click:function(e) {
            var grid = $("#surveyGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //취소
    $("#btnCancelSurvey").kendoButton({
        click:function(e){
            $('#surveyGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //버튼 - 저장
    $("#btnSaveSurvey").kendoButton({
        click:function(e) {

            //진행된 설문이 있는지 부터 확인
            var grid = $('#surveyGrid').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            var sSubyTmplSeq = "";
            var sDlrCd = "";
            if(selectedItem!=null){
                sSubyTmplSeq = selectedItem.subyTmplSeq;
                sDlrCd = selectedItem.dlrCd;
            }

            var paramData = {};
            var rst = 0;
            paramData["sSubyTmplSeq"] = sSubyTmplSeq;
            paramData["sDlrCd"] = sDlrCd;

            $.ajax({
                url:"<c:url value='/crm/css/surveySatisFaction/selectUseSurvey.do' />",
                data:JSON.stringify(paramData),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(result) {
                    var count = result["total"];
                    if(count>0){
                        //이미 진행이된 설문 결과가 있기때문에 수정할 수 없습니다.
                        dms.notification.error("<spring:message code='crm.err.noSurveySave'/>");
                        return false;
                    }else{
                        var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                        if (grid.cudDataLength == 0) {
                            //변경된 정보가 없습니다.
                            dms.notification.info("<spring:message code='global.info.required.change'/>");
                            return;
                        }

                        var flag = true;
                        var items = grid.dataItems();
                        $.each(items, function(idx, row){
                            //alert(row.subyTmplNm);
                            if(row.subyTmplNm == null){
                                flag = false;
                                return;
                            }
                        });

                        if(flag){
                            if (grid.gridValidation()) {
                                $.ajax({
                                    url:"<c:url value='/crm/css/surveySatisFaction/multiSurveySatisFactions.do' />",
                                    data:JSON.stringify(saveData),
                                    type:'POST',
                                    dataType:'json',
                                    contentType:'application/json',
                                    error:function(jqXHR,status,error) {
                                        dms.notification.error(jqXHR.responseJSON.errors);
                                    },
                                    success:function(jqXHR, textStatus) {
                                        grid.dataSource._destroyed = [];
                                        grid.dataSource.page(1);
                                        //정상적으로 반영 되었습니다.
                                        dms.notification.success("<spring:message code='global.info.success'/>");
                                        $('#questionGrid').data('kendoExtGrid').dataSource.page(1);
                                        $('#answerGrid').data('kendoExtGrid').dataSource.page(1);
                                    }
                                });
                            }else{
                                //입력값을 확인하여 주십시오.
                                dms.notification.warning("<spring:message code='global.info.check.input'/>");
                            }
                        }else{
                            //설문템플릿명을(를) 입력하여 주십시오.
                            dms.notification.warning("<spring:message code='crm.lbl.subyTmplNm' var='subyTmplNm' /><spring:message code='global.info.validation.required' arguments='${subyTmplNm}' />");
                        }
                    }//end else
                }//end success
            })//end ajax
        }//end event
    });

    //그리드 설정
    $("#surveyGrid").kendoExtGrid({
        gridId:"G-CRM-0722-151500"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/crm/css/surveySatisFaction/selectSurveySatisFactions.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSubyTmplNm"] = $("#sSubyTmplNm").val();
                        params["sDelYn"] = $("#sDelYn").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"subyTmplSeq"
                    ,fields:{
                        dlrCd:{type:"string", editable:false}
                        ,subyTmplSeq:{type:"string", editable:false}
                        ,rnum:{type:"number", editable:false}
                        ,subyTmplNm:{type:"string"}
                        ,delYn:{type:"string"}
                        ,usrNm:{type:"string", editable:false}
                        ,regDt:{type:"string", editable:false}
                        ,usrNm:{type:"string", editable:false}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:fa
        ,dataBound:function(e) {
            //$("#btnAddSurvey").click();
        }
        //,editable:true
        /* ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:[""] //수정시 바뀌어야 하는 컬럼만 기재함 */
        ,columns:[
            {//번호
                field:"rnum"
                ,title:"<spring:message code='global.lbl.no' />"
                ,width:50
                ,sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{//설문템플릿
                field:"subyTmplNm"
                ,width:250
                ,title:"<spring:message code='crm.lbl.subyTmplNm' />"
                ,validation:{required:true}
                ,editor:function(container, options) {
                    $('<input required name="subyTmplNm" maxlength="33" style="width:100%" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    $('<span class="k-invalid-msg" data-for="subyTmplNm"></span>').appendTo(container);
                }
            }
            ,{//사용여부
                field:"delYn"
                ,title:"<spring:message code='global.lbl.useYn' />"
                ,width:150
                ,validation:{required:true}
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="delYn" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:true
                        ,dataSource:['Y','N']
                        ,index:1
                    });
                    $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                }
            }
            ,{//등록자
                field:"usrNm"
                ,title:"<spring:message code='global.lbl.regUsrId'/>"
                ,width:150
                ,attributes:{"class":"ac"}

            }
            ,{//등록일자
                field:"regDt"
                ,title:"<spring:message code='global.lbl.carRegDt'/>"
                ,width:150
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
            }
            ,{//설문 사용수
                field:"usrNm"
                ,title:"<spring:message code='global.lbl.statNm'/>"
                ,width:150
                ,sortable:false
                //,template:"<input type='checkbox' data-uid='#= uid #' class='grid-checkbox-item' #if(tmplResultCnt > 0){#disabled#}# />"
                ,template:"#if(tmplResultCnt > 0){# <spring:message code='global.info.noDelAndNoUpd'/> #}#"
                ,attributes:{style:"text-align:center;", "class":"ac"}
            }
        ]
        ,change:function(e){
            //설문 템플릿 클릭시 설문질문 목록 그리드 나타냄
            var dataItem = this.dataItem(this.select());

            if(dataItem != null){
//                if(dataItem.subyTmplSeq !== lastSelectedSurveySeq){
                    //lastSelectedSurveySeq = dataItem.subyTmplSeq;
                    $("#questionGrid").data("kendoExtGrid").dataSource.read();
                    $("#answerGrid").data("kendoExtGrid").dataSource.data([]);
//                }
            }
         }
    });


    //설문 질문 그리드 설정
    $("#questionGrid").kendoExtGrid({
        gridId:"G-CRM-0722-151600"
        ,dataSource:{
             transport:{
                dataType:"json",
                read:{
                    url:"<c:url value='/crm/css/surveySatisFaction/selectSurveyQuestions.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        var grid = $('#surveyGrid').data('kendoExtGrid');
                        var selectedItem = grid.dataItem(grid.select());

                        var sSubyTmplSeq = "";
                        if(selectedItem!=null)  {
                            sSubyTmplSeq = selectedItem.subyTmplSeq;
                        }
                        params["sSubyTmplSeq"] = sSubyTmplSeq;

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"subyTmplQestSeq"
                    ,fields:{
                        dlrCd:{type:"string", editable:false}
                        ,subyTmplSeq:{type:"number", editable:false}
                        ,qestCont:{type:"string", editable:true}
                        ,qestWgtVal:{type:"string", editable:true}
                        ,qestTpCd:{type:"string", editable:true}
                        ,answSelCnt:{type:"number", editable:true}
                        ,remark:{type:"string", editable:true}
                        ,sortOrder:{type:"number", editable:true}
                        ,subyTmplQestSeq:{type:"number", editable:false}
                    }
                }
            }
        }
        ,height:250
        ,multiSelectWithCheckbox:true
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:fa
        ,scrollable:true
        ,pageable:false
        ,sortable:true
        ,autoBind:false
        ,columns:[
            {//질문내용
                field:"qestCont"
                ,title:"<spring:message code='crm.lbl.qestCont'/>"
                ,width:250 ,validation:{required:true}
                ,editor:function(container, options) {
                    $('<input required name="qestCont" maxlength="333" style="width:100%" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    $('<span class="k-invalid-msg" data-for="qestCont"></span>').appendTo(container);
                }
            }
            ,{//가중치
                field:"qestWgtVal"
                ,title:"<spring:message code='crm.lbl.qestWgtVal'/>"
                ,width:70
                ,validation:{required:true}
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="qestWgtVal" maxlength="3" style="width:100%" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    $('<span class="k-invalid-msg" data-for="qestWgtVal"></span>').appendTo(container);
                }
            }
            ,{//질문유형
                field:"qestTpCd"
                ,title:"<spring:message code='crm.lbl.qestTpCd'/>"
                ,width:85
                ,validation:{required:true}
                ,editor:function(container, options) {
                    $('<input required name="qestTpCd" data-bind="value:' + options.field + '"  />')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:qestTpCdDSList
                        , change:function(e){
                            var grid = $('#questionGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());
                            var selectedVal = this.dataItem(this.select());
                            var cmmCd = selectedVal.cmmCd;

                            if(cmmCd == "03"){
                                selectedItem.set("qestWgtVal", 0);
                            }
                        }
                    });
                    $('<span class="k-invalid-msg" data-for="qestTpCd"></span>').appendTo(container);
                    //,template:'#if(qestTpCd !== ""){# #= qestTpCdMap[cmmCd]# #}#'
                }
                ,template:'#if(qestTpCd !== ""){# #= qestTpCdMap[qestTpCd]# #}#'
            }
            ,{//답변개수
                field:"answSelCnt"
                ,title:"<spring:message code='crm.lbl.answSelCnt'/>"
                ,width:70
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="answSelCnt" maxlength="3" style="width:100%" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    $('<span class="k-invalid-msg" data-for="answSelCnt"></span>').appendTo(container);
                }
             }
            ,{//비고
                field:"remark",
                title:"<spring:message code='global.lbl.remark'/>",
                width:70
             }
            ,{//정렬순서
                field:"sortOrder"
                ,title:"<spring:message code='global.lbl.sortOrder'/>"
                ,width:70
                ,validation:{required:true}
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                    $('<input required name="sortOrder" maxlength="3" style="width:100%" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    $('<span class="k-invalid-msg" data-for="sortOrder"></span>').appendTo(container);
                }
             }
        ]
        ,change:function(e){
            //설문 질문 클릭시 설문 보기 목록 그리드 나타냄
            var dataItem = this.dataItem(this.select());
            if(dataItem != null){
                if(dataItem.subyTmplSeq !== "" && dataItem.subyTmplQestSeq !== ""){
                    $("#answerGrid").data("kendoExtGrid").dataSource.read();
                }
            }
         }
    });

    //설문 질문 버튼 - 추가
    $("#btnAddQuestion").kendoButton({
       click:function(e) {
           //$('#surveyGrid').data('kendoExtGrid').dataSource.insert(0, {"delYn":"N","subyTmplNm":{type:"string" , editable:false}});
          var grid = $('#surveyGrid').data('kendoExtGrid');
          var selectedItem = grid.dataItem(grid.select());

          if(selectedItem!=null) {
              var subyTmplSeq = selectedItem.subyTmplSeq;
              if(subyTmplSeq!="") {
                  $('#questionGrid').data('kendoExtGrid').dataSource.insert(0, {

                      "qestTpCd":""
                      ,"subyTmplSeq":subyTmplSeq
                      ,"answSelCnt":"0"

                  });
              }
          } else {
              //설문 템플릿을(를) 선택하세요.;
              dms.notification.info("<spring:message code='crm.lbl.subyTmplNm' var='subyTmplNm' /><spring:message code='global.info.check.field' arguments='${subyTmplNm}' />");
          }
       }
   });

   //설문 질문 버튼 - 취소
   $("#btnCancelQuestion").kendoButton({
       click:function(e){
           $('#questionGrid').data('kendoExtGrid').cancelChanges();
       }
   });

   //설문 질문 버튼 - 삭제
   $("#btnDelQuestion").kendoButton({
       click:function(e) {
           var grid = $("#questionGrid").data("kendoExtGrid");
           var rows = grid.select();

           rows.each(function(index, row) {
               grid.removeRow(row);
           });
       }
   });

   //설문 질문 버튼 - 저장
   $("#btnSaveQuestion").kendoButton({
       click:function(e) {

           //진행된 설문이 있는지 부터 확인
           var surveyGrid = $('#surveyGrid').data('kendoExtGrid');
           var selectedItem = surveyGrid.dataItem(surveyGrid.select());

           var sSubyTmplSeq = "";
           var sDlrCd = "";
           if(selectedItem!=null){
               sSubyTmplSeq = selectedItem.subyTmplSeq;
               sDlrCd = selectedItem.dlrCd;
           }

           var paramData = {};
           paramData["sSubyTmplSeq"] = sSubyTmplSeq;
           paramData["sDlrCd"] = sDlrCd;

           $.ajax({
               url:"<c:url value='/crm/css/surveySatisFaction/selectUseSurvey.do' />",
               data:JSON.stringify(paramData),
               type:'POST',
               dataType:'json',
               contentType:'application/json',
               error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors);
               },
               success:function(result) {
                   var count = result["total"];
                   if(count > 0){
                       //이미 진행이된 설문 결과가 있기때문에 수정할 수 없습니다.
                       dms.notification.error("<spring:message code='crm.err.noSurveySave'/>");
                       return false;
                   }else{
                       var grid = $("#questionGrid").data("kendoExtGrid");
                       var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                       if (grid.cudDataLength == 0) {
                           //변경된 정보가 없습니다.
                           dms.notification.info("<spring:message code='global.info.required.change'/>");
                           return;
                       }

                       var items = grid.dataItems();

                       var sumQestWgtVal = 0;
                       $.each(items, function(idx, row){
                           sumQestWgtVal += Number(row.qestWgtVal);
                       });

                       if (sumQestWgtVal > 100 ) {
                           //설문에 대한 모든 가중치의 합산 값이 100점을 초과할 수 없습니다.
                           dms.notification.info("<spring:message code='crm.info.sumQestWgtVal'/>");
                           return;
                       }

                       if (grid.gridValidation()) {
                           $.ajax({
                               url:"<c:url value='/crm/css/surveySatisFaction/multiSurveyQuestions.do' />",
                               data:JSON.stringify(saveData),
                               type:'POST',
                               dataType:'json',
                               contentType:'application/json',
                               error:function(jqXHR,status,error) {
                                   dms.notification.error(jqXHR.responseJSON.errors);
                               },
                               success:function(jqXHR, textStatus) {

                                   grid.dataSource._destroyed = [];
                                   grid.dataSource.page(1);

                                   //정상적으로 반영 되었습니다.
                                   dms.notification.success("<spring:message code='global.info.success'/>");
                               }
                           });
                       }else{
                           //입력값을 확인하여 주십시오.
                           dms.notification.warning("<spring:message code='global.info.check.input'/>");
                       }
                   }//end else
               }//end success
           })//end ajax
       }
   });

   //설문 질문 버튼 - 설문 미리보기
   $("#btnViewQuestion").kendoButton({
       click:function(e) {
           var grid = $('#surveyGrid').data('kendoExtGrid');
           var selectedItem = grid.dataItem(grid.select());

           if(selectedItem != null) {
               var subyTmplSeq = selectedItem.subyTmplSeq;
               var dlrCd = selectedItem.dlrCd;
               selectItemPopupWindow(dlrCd,subyTmplSeq);
           }
       }
   });


   //설문 답변 그리드 설정
   $("#answerGrid").kendoExtGrid({
       gridId:"G-CRM-0722-151700"
       ,dataSource:{
            transport:{
               dataType:"local",
               read:{
                   url:"<c:url value='/crm/css/surveySatisFaction/selectSurveyAnswers.do' />"
               }
               ,parameterMap:function(options, operation) {
                   if (operation === "read") {
                       var params = {};
                       var grid = $('#questionGrid').data('kendoExtGrid');
                       var selectedItem = grid.dataItem(grid.select());

                       var sSubyTmplSeq = "";
                       var sSubyTmplQestSeq = "";
                       if(selectedItem!=null)  {
                           sSubyTmplSeq = selectedItem.subyTmplSeq;
                           sSubyTmplQestSeq = selectedItem.subyTmplQestSeq;
                       }
                       params["sSubyTmplSeq"] = sSubyTmplSeq;
                       params["sSubyTmplQestSeq"] = sSubyTmplQestSeq;

                       return kendo.stringify(params);

                   } else if (operation !== "read" && options.models) {
                       return kendo.stringify(options.models);
                   }
               }
           }
           ,schema:{
               model:{
                   id:"itemSeq"
                   ,fields:{
                       dlrCd:{type:"string", editable:false}
                       ,subyTmplSeq:{type:"number", editable:false}
                       ,subyTmplQestSeq:{type:"number", editable:false}
                       ,itemSeq:{type:"number", editable:false}
                       ,answCont:{type:"string", editable:true}
                       ,answScoreVal:{type:"number", editable:true}
                       ,remark:{type:"string", editable:true}
                       ,sortOrder:{type:"number", editable:true}
                   }
               }
           }
       }
       ,height:250
       ,multiSelectWithCheckbox:true
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:true           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:fa
       ,scrollable:true
       ,pageable:false
       ,sortable:true
       ,autoBind:false
       ,columns:[
           { //문항내용
               field:"answCont"
               ,title:"<spring:message code='crm.lbl.answCont'/>"
               ,width:250
               ,validation:{required:true}
               ,editor:function(container, options) {
                   $('<input required name="answCont" maxlength="100" style="width:100%" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   $('<span class="k-invalid-msg" data-for="answCont"></span>').appendTo(container);
               }
           }
           ,{ //문항점수
                field:"answScoreVal"
                , title:"<spring:message code='crm.lbl.answScoreVal'/>"
                , width:70
                ,validation:{required:true}
                ,editor:function(container, options) {
                    $('<input required name="answScoreVal" maxlength="3" style="width:100%" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    $('<span class="k-invalid-msg" data-for="answScoreVal"></span>').appendTo(container);
                }
           }
           ,{ //비고
               field:"remark"
               , title:"<spring:message code='global.lbl.remark'/>"
               , width:200
           }
           ,{//정렬순서
               field:"sortOrder"
               , title:"<spring:message code='global.lbl.sortOrder'/>"
               , width:70
               ,editor:function(container, options) {
                   $('<input required name="sortOrder" maxlength="3" style="width:100%" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   $('<span class="k-invalid-msg" data-for="sortOrder"></span>').appendTo(container);
               }
           }
       ]
       ,change:function(e){
           //$("#questionGrid").data("kendoExtGrid").dataSource.read();
        }
   });

   //설문 보기 버튼 - 추가
   $("#btnAddAnswer").kendoButton({
      click:function(e) {
          //$('#surveyGrid').data('kendoExtGrid').dataSource.insert(0, {"delYn":"N","subyTmplNm":{type:"string" , editable:false}});
         var grid = $('#questionGrid').data('kendoExtGrid');
         var selectedItem = grid.dataItem(grid.select());

         if(selectedItem!=null) {
            if(selectedItem.qestTpCd=="03"){
                //alert("주관식일 경우에는 답변내용을 등록할 수 없습니다.");
                dms.notification.info("<spring:message code='crm.info.noAddAnswCont' />");
                return;
            }
             var subyTmplSeq = selectedItem.subyTmplSeq;
             var subyTmplQestSeq = selectedItem.subyTmplQestSeq;
             if(subyTmplSeq != null && subyTmplQestSeq != null) {
                 $('#answerGrid').data('kendoExtGrid').dataSource.insert(0, {
                     "subyTmplSeq":subyTmplSeq
                     ,"subyTmplQestSeq":subyTmplQestSeq
                 });
             }else{
                 //질문목록을(를) 입력하여 주십시오.
                 dms.notification.info("<spring:message code='crm.title.surveyQuestionList' var='surveyQuestion' /><spring:message code='global.info.validation.required' arguments='${surveyQuestion}' />");
             }
         } else {
             //설문 질문을(를) 선택하세요.;
            dms.notification.info("<spring:message code='crm.title.surveyQuestionList' var='surveyQuestion' /><spring:message code='global.info.check.field' arguments='${surveyQuestion}' />");
         }
      }
  });

  //설문 보기 버튼 - 취소
  $("#btnCancelAnswer").kendoButton({
      click:function(e){
          $('#answerGrid').data('kendoExtGrid').cancelChanges();
      }
  });

  //설문 보기 버튼 - 삭제
  $("#btnDelAnswer").kendoButton({
      click:function(e) {
          var grid = $("#answerGrid").data("kendoExtGrid");
          var rows = grid.select();

          rows.each(function(index, row) {
              grid.removeRow(row);
          });
      }
  });

  //설문 보기 버튼 - 저장
  $("#btnSaveAnswer").kendoButton({
      click:function(e) {
          //진행된 설문이 있는지 부터 확인
          var surveyGrid = $('#surveyGrid').data('kendoExtGrid');
          var selectedItem = surveyGrid.dataItem(surveyGrid.select());

          var sSubyTmplSeq = "";
          var sDlrCd = "";
          if(selectedItem!=null){
              sSubyTmplSeq = selectedItem.subyTmplSeq;
              sDlrCd = selectedItem.dlrCd;
          }

          var paramData = {};
          paramData["sSubyTmplSeq"] = sSubyTmplSeq;
          paramData["sDlrCd"] = sDlrCd;

          $.ajax({
              url:"<c:url value='/crm/css/surveySatisFaction/selectUseSurvey.do' />",
              data:JSON.stringify(paramData),
              type:'POST',
              dataType:'json',
              contentType:'application/json',
              error:function(jqXHR,status,error) {
                  dms.notification.error(jqXHR.responseJSON.errors);
              },
              success:function(result) {
                  var count = result["total"];
                  if(count > 0){
                      //이미 진행이된 설문 결과가 있기때문에 수정할 수 없습니다.
                      dms.notification.error("<spring:message code='crm.err.noSurveySave'/>");
                      return false;
                  }else{

                      var grid = $("#answerGrid").data("kendoExtGrid");

                      var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                      if (grid.cudDataLength == 0) {
                          //변경된 정보가 없습니다.
                          dms.notification.info("<spring:message code='global.info.required.change'/>");
                          return;
                      }

                      if (grid.gridValidation()) {
                          $.ajax({
                              url:"<c:url value='/crm/css/surveySatisFaction/multiSurveyAnswers.do' />",
                              data:JSON.stringify(saveData),
                              type:'POST',
                              dataType:'json',
                              contentType:'application/json',
                              error:function(jqXHR,status,error) {
                                  dms.notification.error(jqXHR.responseJSON.errors);
                              },
                              success:function(jqXHR, textStatus) {

                                  grid.dataSource._destroyed = [];
                                  grid.dataSource.page(1);

                                  //정상적으로 반영 되었습니다.
                                  dms.notification.success("<spring:message code='global.info.success'/>");

                                  $("#questionGrid").data("kendoExtGrid").dataSource.read();
                                  $("#answerGrid").data("kendoExtGrid").dataSource.read();
                              }
                          });
                      }else{
                          //입력값을 확인하여 주십시오.
                          dms.notification.warning("<spring:message code='global.info.check.input'/>");
                      }
                  }//end else
              }//end success
          })//end ajax
      }
  });

  $("btnSurveySearch").click();

  //설문 미리보기
  function selectItemPopupWindow(dlrCd,subyTmplSeq){
//alert(subyTmplSeq);
      popupWindow = dms.window.popup({
          //windowId:"ItemMasterPopup"
          windowId:"ServeyViewPopup"
          , title:"<spring:message code='global.title.preview'/>"
          ,height:510
          , content:{
              url:"<c:url value='/crm/css/surveySatisFaction/selectSurveyViewPopup.do?subyTmplSeq="+subyTmplSeq+"&dlrCd="+dlrCd+"'/>"
                  /* /par/cmm/selectItemPopup.do */
              , data:{
                  "subyTmplSeq":subyTmplSeq
              }
          }
      });
  }

});


</script>