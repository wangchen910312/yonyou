<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%-- <c:set value="01" var="membershipStan" /> --%> <!-- 고객 -->
<c:set value="02" var="membershipStan" /> <!-- 자동차 -->


            <section class="group">
                <div class="header_area">
                <h1 class="title_basic"> <spring:message code='global.title.membershipGradeMng'/></h1><!-- 멤버십 등급조건 설정 -->
                    <div class="btn_right">
                      <button class="btn_m btn_save" id="btnGradeSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                    </div>
                </div>
                <%-- <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.gradeSetting" /></h2><!-- 등급설정 -->
                    <div class="btn_right">

                    </div>
                </div> --%>
                <div class="table_form form_width_70per">
                    <form id="gradeForm" >
                        <table>
                            <caption></caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:10%;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row"><spring:message code="global.lbl.latelyStandard"/> </th><!-- 기준최근 -->
                                    <td>
                                        <input id="stdPridMonth" name="stdPridMonth" class="form_comboBox" data-json-obj='true'>
                                    </td>
                                    <th scope="row"></th>
                                    <td>
                                    </td>
                                    <th scope="row"></th>
                                    <td>
                                    </td>
                                    <th scope="row"></th>
                                    <td>
                                    </td>

                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div> <!-- end table -->

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.gradeDefine" /></h2><!-- 등급정의 -->
                    <div class="btn_right">
                        <button class="btn_s btn_save" id="btnSaveGrade"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                        <button class="btn_s btn_add" id="btnAddGrade"><spring:message code='global.btn.rowAdd' /></button> <!-- 행추가 -->
                        <button class="btn_s btn_del" id="btnDelGrade"><spring:message code='global.btn.rowDel' /></button> <!-- 행삭제 -->
                        <button class="btn_s btn_cancel" id="btnCancelGrade"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                    </div>
                </div>

                <div class="table_grid mt10">
                    <div id="gradeGrid"></div>
                </div>
            </section>

      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
    /*************************************************************
     *드랍다운 리스트 셋팅
     *************************************************************/
     //적용 기준 날짜 Array
     var stdPridMonthCdList = [{"cmmCd":"", "cmmCdNm":""}];
     <c:forEach var="obj" items="${stdPridMonthCdList}">
     stdPridMonthCdList.push({
         "cmmCd":"${obj.cmmCd}"
         , "cmmCdNm":"${obj.cmmCdNm}"
     });
     </c:forEach>
     //적용 기준 날짜 Map
     var stdPridMonthCdMap = [];
     $.each(stdPridMonthCdList, function(idx, obj){
         stdPridMonthCdMap[obj.cmmCd] = obj.cmmCdNm;
     });

     //$("#stdPridMonth").data("kendoExtDropDownList").value('<c:out value="${stdPridMonthCd}"/>')//선호연락방법


     var membershipCardUploadPopupWin;

    /*************************************************************
    jQuery시작
    *************************************************************/
    $(document).ready(function() {

        $("#stdPridMonth").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:stdPridMonthCdList
            , index:0
        });


        /*************************************************************
         * 버튼 영역
         *************************************************************/
         //버튼 - 저장
         $("#btnGradeSave").kendoButton({
             click:function(e){
              // form 데이터
                 var param =
                     $("#gradeForm").serializeObject(
                         $("#gradeForm").serializeArrayInSelector("[data-json-obj='true']")
                     );

                 if(dms.string.isEmpty($('#stdPridMonth').val())){
                     //기준최근(은)를 선택해주세요.
                     dms.notification.info("<spring:message code='crm.lbl.stdPridMonth' var='stdPridMonth' /><spring:message code='global.info.chkSelectItemMsg' arguments='${stdPridMonth}' />");
                     return;
                 }

                 var url = "<c:url value='/crm/dmm/membershipGradeMng/updateMembershipGradeMng.do' />";

                 $.ajax({
                     url:url
                     ,data:JSON.stringify(param)
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,error:function(jqXHR,status,error){
                         console.log(jqXHR);
                         dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                     },
                     success:function(result){
                         //console.log(result);
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $('#gradeGrid').data('kendoExtGrid').dataSource.page(1);
                     }
                 }).done(function(result) {
                     console.log("membershipGradeMngSave Done!!!!");
                 });
             }
         })

        ////버튼 - 행추가
        $("#btnAddGrade").kendoButton({
            click:function(e){
                $('#gradeGrid').data('kendoExtGrid').dataSource.insert(0, {});
            }
        });

        ////버튼 - 행삭제
        $("#btnDelGrade").kendoButton({
            click:function(e) {
                var grid = $("#gradeGrid").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        ////버튼 - 취소
        $("#btnCancelGrade").kendoButton({
            click:function(e) {
                $('#gradeGrid').data('kendoExtGrid').cancelChanges();
            }
        });

        ////버튼 - 저장
        $("#btnSaveGrade").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($('#stdPridMonth').data("kendoExtDropDownList").value())){
                    //기준최근(은)를 선택해주세요.
                    dms.notification.info("<spring:message code='crm.lbl.stdPridMonth' var='stdPridMonth' /><spring:message code='global.info.chkSelectItemMsg' arguments='${stdPridMonth}' />");
                    return;
                }

                var grid = $("#gradeGrid").data("kendoExtGrid");
                var items = grid.dataItems();
                var ord = [];

                $.each(items, function(idx, row){
                    //alert(idx);
                    ord[idx] = Number(row.gradeOrderNo);
                });

                for(var i = 0; i <= ord.length ; i++){
                    if(ord[i] == 0){
                        //등급순서(은)는 필수 입력사항 입니다.
                        dms.notification.info("<spring:message code='crm.lbl.gradeOrderNo' var='gradeOrderNo' /><spring:message code='global.info.required.field' arguments='${gradeOrderNo}' />");
                        return;
                    }

                    for(var j = i+1; j < ord.length; j++){
                        if(ord[i] == ord[j]){
                            //등급순서(은)는 중복될 수 없습니다.
                            dms.notification.info("<spring:message code='crm.lbl.gradeOrderNo' var='gradeOrderNo' /><spring:message code='global.info.duplicateCheck' arguments='${gradeOrderNo}' />");
                            return;
                        }
                    }
                }

                //최근기준 SETTING
                $.each(items, function(idx, row){
                    row.stdPridMonth = $('#stdPridMonth').data("kendoExtDropDownList").value();
                });

                var saveData = grid.getCUDData("insertList","updateList","deleteList");
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/crm/dmm/membershipGradeMng/multiMembershipGradeMngs.do' />",
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
            }
        });

        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#gradeGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipGradeMng/selectMembershipGradeMngs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"gradeSeq"
                            ,fields:{
                                dlrCd:{type:"string"}
                                ,gradeSeq:{type:"string", editable:false, hidden:true}
                                ,gradeOrderNo:{type:"string", editable:true} //등급순서
                                ,gradeNm:{type:"string", validation:{required:true}} //등급명
                                ,vsitStartCnt:{type:"number", validation:{required:true}}//방문시작횟수
                                ,vsitEndCnt:{type:"number", validation:{required:true}}//방문종료횟수
                                ,vsitTermCd:{type:"string", validation:{required:true}}//방문조건코드
                                ,purcStartCnt:{type:"number", validation:{required:true}}//구매시작횟수
                                ,purcEndCnt:{type:"number", validation:{required:true}}//구매종료횟수
                                ,purcTermCd:{type:"string", validation:{required:true}}//구매조건코드
                                ,purcStartAmt:{type:"number", validation:{required:true}}//구매시작금액
                                ,purcEndAmt:{type:"number", validation:{required:true}}//구매종료금액
                                ,purcTermAmtCd:{type:"string", validation:{required:true}}//구매조건 코드
                                ,rchgStartAmt:{type:"number", validation:{required:true}}//충전시작금액
                                ,rchgEndAmt:{type:"number", validation:{required:true}}//충전종료금액
                                ,serLbrDcRate:{type:"number", validation:{required:true}}//정비공임할인율
                                ,serParDcRate:{type:"number", validation:{required:true}}//정비부품할인율
                                ,serTotDcRate:{type:"number", validation:{required:true}}//정비총금액할인율
                                ,accuRate:{type:"number", validation:{required:true}}//적립율
                                ,stdPridMonth:{type:"number", validation:{required:true}, editable:false}//기준최근
                            }
                        }
                }
            }
            ,multiSelectWithCheckbox:true
            ,height:354
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,navigatable:true
            ,sortable:true
            ,pageable:true
            /* ,toolbar:["create","save","cancel"]
            ,editable:"popup" */
            ,columns:[
               {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
               ,{field:"gradeSeq", title:"<spring:message code='global.lbl.gradeSeq' />", hidden:true}//등급일련번호
               ,{field:"gradeOrderNo", title:"<spring:message code='crm.lbl.gradeOrderNo' />",width:90}//등급순서
               ,{field:"gradeNm", title:"<spring:message code='global.lbl.gradeNm' />",width:130}//등급명
               ,{field:"rchgStartAmt", title:"<spring:message code='global.lbl.rchgStartAmt' />",width:90,attributes:{"class":"ar"}
                   ,editor:editNumber // 제일하단 참조
               }//충전금액From
               ,{field:"rchgEndAmt", title:"<spring:message code='global.lbl.rchgEndAmt' />",width:90,attributes:{"class":"ar"}
                   ,editor:editNumber // 제일하단 참조
               }//충전금액To
               ,{field:"vsitTermCd", title:"<spring:message code='global.lbl.vsitTermCd' />",width:100
                   ,attributes:{"class":"ac"}
                   ,format:"{0:n0}"
                   ,decimal:0
                   ,spinners:false
                   ,editor:function(container, options) {
                       $('<input required name="vsitTermCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:true
                           ,dataSource:['OR']
                           ,index:1
                       });
                       $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                   }
               }//방문조건코드
               ,{field:"purcStartCnt", title:"<spring:message code='global.lbl.purcStartCnt' />",width:90,attributes:{"class":"ar"}
                   ,editor:editNumber // 제일하단 참조
               }//구매횟수From
               ,{field:"purcEndCnt", title:"<spring:message code='global.lbl.purcEndCnt' />",width:90,attributes:{"class":"ar"}
                   ,editor:editNumber // 제일하단 참조
               }//구매횟수To
               ,{field:"purcTermCd", title:"<spring:message code='global.lbl.purcTermCd' />",width:90
                   ,attributes:{"class":"ac"}
                   ,editor:function(container, options) {
                       $('<input required name="purcTermCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:true
                           ,dataSource:['OR']
                           ,index:1
                       });
                       $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                   }
               }//구매조건코드
               ,{field:"purcStartAmt", title:"<spring:message code='global.lbl.purcStartAmt' />",width:110,attributes:{"class":"ar"}
                   ,editor:editNumber // 제일하단 참조
               }//구매금액From
               ,{field:"purcEndAmt", title:"<spring:message code='global.lbl.purcEndAmt' />",width:110,attributes:{"class":"ar"}
                   ,editor:editNumber // 제일하단 참조
               }//구매금액To
               ,{field:"purcTermAmtCd", title:"<spring:message code='global.lbl.purcTermAmtCd' />",width:130
                   ,attributes:{"class":"ac"}
                   ,editor:function(container, options) {
                       $('<input required name="purcTermAmtCd" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           autoBind:true
                           ,dataSource:['OR']
                           ,index:1
                       });
                       $('<span class="k-invalid-msg" data-for="resourceTp"></span>').appendTo(container);
                   }
               }//구매조건금액코드
               ,{field:"vsitStartCnt", title:"<spring:message code='global.lbl.vsitStartCnt' />",width:90,attributes:{"class":"ar"}
                   ,editor:editNumber // 제일하단 참조
               }//방문횟수From
               ,{field:"vsitEndCnt", title:"<spring:message code='global.lbl.vsitEndCnt' />",width:90,attributes:{"class":"ar"}
                   ,editor:editNumber // 제일하단 참조
               }//방문횟수To
               ,{field:"accuRate", title:"<spring:message code='global.lbl.accuRate' />",width:60,attributes:{"class":"ar"}
                   ,editor:editNumber // 제일하단 참조
               }//적립율
               ,{field:"serLbrDcRate", title:"<spring:message code='crm.lbl.serLbrDcRate' />",width:100,attributes:{"class":"ar"}
                   ,format:"{0:n0}"
                   ,decimal:0
                   ,editor:function(container, options){ //editor:editNumber 사용안한 이유는 max값 때문
                       var input = $("<input/>");

                       input.attr("name", options.field);
                       input.appendTo(container);
                       input.kendoExtNumericTextBox({
                           min:0
                           ,max:100
                           ,decimal:0
                           ,spinners:false
                       });
                   }
               }//정비공임할인율
               ,{field:"serParDcRate", title:"<spring:message code='crm.lbl.serParDcRate' />",width:100,attributes:{"class":"ar"}
                   ,format:"{0:n0}"
                   ,decimal:0
                   ,editor:function(container, options){//editor:editNumber 사용안한 이유는 max값 때문
                       var input = $("<input/>");

                       input.attr("name", options.field);
                       input.appendTo(container);
                       input.kendoExtNumericTextBox({
                           min:0
                           ,max:100
                           ,decimal:0
                           ,spinners:false
                       });
                   }
               }//정비부품할인율
               ,{field:"serTotDcRate", title:"<spring:message code='crm.lbl.serTotDcRate' />",width:100,attributes:{"class":"ar"}
                   ,format:"{0:n0}"
                   ,decimal:0
                   ,editor:function(container, options){//editor:editNumber 사용안한 이유는 max값 때문
                       var input = $("<input/>");

                       input.attr("name", options.field);
                       input.appendTo(container);
                       input.kendoExtNumericTextBox({
                           min:0
                           ,max:100
                           ,decimal:0
                           ,spinners:false
                       });
                   }
               }//정비총금액할인율
               ,{field:"stdPridMonth", title:"<spring:message code='crm.lbl.stdPridMonth' />",width:90,attributes:{"class":"ac"}}//기준최근
               ,{title:"&nbsp;"}
            ]
        });
    }); /* end ready */

    function editNumber(container, options){
        $('<input data-bind="value:' + options.field + '"/>').appendTo(container).kendoExtNumericTextBox({
            spinners:false
            ,format:"{0:n0}"
            ,decimal:0
            ,min:0
        });
    }

</script>