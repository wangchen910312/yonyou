<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%-- <c:set value="01" var="membershipStan" /> --%> <!-- 고객 -->
<c:set value="02" var="membershipStan" /> <!-- 자동차 -->


            <section class="group">
                <div class="header_area">
                <h1 class="title_basic"> <spring:message code='crm.menu.membershipGradeChg'/></h1><!-- 멤버십 등급조건 설정 -->
                    <div class="btn_right">
                      <button class="btn_m btn_search" id="btnGradeChgSearch"><spring:message code="crm.btn.gradeSearch" /></button> <!-- 등급조회 -->
                      <button class="btn_m btn_save" id="btnGradeChgSave"><spring:message code="crm.btn.gradeApply" /></button> <!-- 등급적용 -->
                    </div>
                </div>
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
                                    <th scope="row"> <spring:message code='crm.lbl.gradeApplyStandard'/></th><!-- 등급적용기준 -->
                                    <td>
                                        <input id="sMembershipGradeChgSeq" name="sMembershipGradeChgSeq" class="form_comboBox" data-json-obj='true'>
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

                <div class="table_grid mt10">
                    <div id="gradeChgGrid"></div>
                </div>
            </section>

      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
    /*************************************************************
     *드랍다운 리스트 셋팅
     *************************************************************/
    //1.등급적용기준 콤보 DataSource
    var membershipGradeChgSeqList = [];
    <c:forEach var="obj" items="${gradeSeqList}">
    membershipGradeChgSeqList.push({
        "membershipGradeChgSeq":"${obj.membershipGradeChgSeq}"
        ,"membershipGradeChgDt":"${obj.membershipGradeChgDtStr}"
        //,"membershipGradeChgDt":"${obj.membershipGradeChgDt}"
        });
    </c:forEach>
    var membershipGradeChgSeqMap = dms.data.arrayToMap(membershipGradeChgSeqList, function(obj){ return obj.membershipGradeChgSeq; });


    //2.등급 콤보 DataSource
    /* var gradeCodeList = [{"cmmCd":"", "cmmCdNm":""}];
    <c:forEach var="obj" items="${gradeCodeList}">
    gradeCodeList.push({
        "cmmCd":"${obj.gradeSeq}"
        ,"cmmCdNm":"${obj.gradeNm}"
        });
    </c:forEach>
    var gradeCodeListMap = dms.data.arrayToMap(gradeCodeList, function(obj){ return obj.gradeSeq; });
 */
    var gradeCodeList = [{"gradeSeq":"", "gradeNm":""}];
    <c:forEach var="obj" items="${gradeCodeList}">
    gradeCodeList.push({
     "gradeSeq":"${obj.gradeSeq}"
     ,"gradeNm":"${obj.gradeNm}"
     });
    </c:forEach>
    var gradeCodeListMap = dms.data.arrayToMap(gradeCodeList, function(obj){ return obj.gradeSeq; });

    var membershipCardUploadPopupWin;


    /*************************************************************
    jQuery시작
    *************************************************************/
    $(document).ready(function() {

        $("#sMembershipGradeChgSeq").kendoExtDropDownList({
            dataTextField:"membershipGradeChgDt"
            , dataValueField:"membershipGradeChgSeq"
            , dataSource:membershipGradeChgSeqList
            , optionLabel:" "
            //, index:0
        });

        $("#befGradeCd").kendoExtDropDownList({
            dataSource:gradeCodeList
            ,template:"[#:data.gradeSeq#] #:data.gradeSeqNm#"
            ,dataValueField:"gradeSeq"
            ,dataTextField:"gradeSeqNm"
            , optionLabel:" "
        });


        /*************************************************************
         * 버튼 영역
         *************************************************************/
         //버튼 - 저장
         $("#btnGradeChgSave").kendoButton({
             click:function(e){
                 var grid = $("#gradeChgGrid").data("kendoExtGrid");
                 //var saveData = grid.getCUDData("insertList","updateList","deleteList");
                 var saveData = grid.getCUDData("insertList","updateList","deleteList");
                 /* if (grid.cudDataLength == 0) {
                     //변경된 정보가 없습니다.
                     dms.notification.info("<spring:message code='global.info.required.change'/>");
                     return;
                 } */

                 /* var updateList      = [],
                     rows = grid.tbody.find("tr");
                 rows.each(function(index,row){
                     var gridData = grid.dataSource.at(index);
                     //alert(gridData.aftGradeCd);
                 });
                 return; */

                 var updateList = [];
                 $.each(grid.dataSource._data , function(i , gradeData){
                     if(gradeData.applyYn == "N"){
                         obj = {};
                         obj["dlrCd"] = gradeData.dlrCd;
                         obj["membershipNo"] = gradeData.membershipNo;
                         obj["membershipGradeChgSeq"] = gradeData.membershipGradeChgSeq;
                         obj["aftGradeCd"] = gradeData.aftGradeCd;
                         obj["befGradeCd"] = gradeData.befGradeCd;
                         obj["applyYn"] = gradeData.applyYn;
                         //alert(gradeData.aftGradeCd);
                         updateList.push(obj);
                     }
                 });

                 //console.log("updateList::::::"+updateList)
                 if (updateList.length == 0) {
                   //변경된 정보가 없습니다.
                     dms.notification.info("<spring:message code='global.info.required.change'/>");
                     return;
                 }

                 var data = {"updateList":updateList}
                 if (grid.gridValidation()) {
                     $.ajax({
                         url:"<c:url value='/crm/dmm/membershipGradeChg/multiMembershipGrades.do' />",
                         //data:JSON.stringify(saveData),
                         data:kendo.stringify(data),
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
         })

        ////버튼 - 조회
        $("#btnGradeChgSearch").kendoButton({
            click:function(e){
                //$('#gradeChgGrid').data('kendoExtGrid').dataSource.insert(0, {});
                if(dms.string.isEmpty($('#sMembershipGradeChgSeq').val())){
                    //등급적용기준(은)를 선택해주세요.
                    dms.notification.info("<spring:message code='crm.lbl.gradeApplyStandard' var='gradeApplyStandard' /><spring:message code='global.info.chkSelectItemMsg' arguments='${gradeApplyStandard}' />");
                    $('#sMembershipGradeChgSeq').focus();
                    //alert("등급적용기준 기준일을 선택해 주세요.");
                    return;
                }

                $('#gradeChgGrid').data('kendoExtGrid').dataSource.read(1);
            }
        });

        ////버튼 - 행삭제
        $("#btnDelGrade").kendoButton({
            click:function(e) {
                var grid = $("#gradeChgGrid").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        ////버튼 - 취소
        $("#btnCancelGrade").kendoButton({
            click:function(e) {
                $('#gradeChgGrid').data('kendoExtGrid').cancelChanges();
            }
        });

        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#gradeChgGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipGradeChg/selectMembershipGradeChgs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sMembershipGradeChgSeq"] = $("#sMembershipGradeChgSeq").val();

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
                                ,custNo:{type:"string", editable:false}
                                ,membershipGradeChgSeq:{type:"number", editable:false}
                                ,membershipGradeChgDt:{type:"date", editable:false}
                                ,custNm:{type:"string",editable:false} //등급순서
                                ,membershipNo:{type:"string", editable:false} //멤버십 번호
                                ,befGradeCd:{type:"string",editable:false, validation:{required:true}} //이전 회원 등급
                                ,rchgAmt:{type:"number",editable:false, validation:{required:true}}//충전금액
                                ,purcAmt:{type:"number",editable:false, validation:{required:true}}//소비금액
                                ,vsitCnt:{type:"number",editable:false, validation:{required:true}}//방문횟수
                                ,purcCnt:{type:"number",editable:false, validation:{required:true}}//구매횟수
                                ,aftGradeCd:{type:"string",editable:true, validation:{required:true}} //예상 회원 등급
                                ,applyYn:{type:"string",editable:false} //적용여부
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
//            ,editable:false
            ,dataBound:function(e){
                var that = this;
                var rows = that.tbody.find("tr");
                rows.each(function(idx,row){
                    var dataItem = that.dataItem(row);
                    if(dataItem.applyYn == "N"){
                        //$("input.grid-checkbox-item", row).prop("disabled", true);
                        //$(row).removeClass('k-state-selected k-state-selecting');
                        $("input.aftGradeCd", row).prop("disabled", false);
                    }else{
                        //this.closeCell();
                        $("input.aftGradeCd", row).prop("disabled", true);
                    }
                });

            }
            /* ,editableOnlyNew:true
            ,editableOnlyNewExcludeColumns:["aftGradeCd"] */
            //,navigatable:true
            ,autoBind:false
            ,sortable:true
            ,pageable:false
            ,columns:[
               {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
               ,{field:"custNo", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}//고객번호
               ,{field:"membershipGradeChgSeq", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}//고객번호
               ,{field:"membershipGradeChgDt", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}//고객번호
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",width:100 }//고객명
               ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>",width:150,attributes:{"class":"ac"}}// 멤버십 번호
               ,{field:"befGradeCd", title:"<spring:message code='crm.lbl.befGradeCd'/>",width:120
                   ,validation:{required:true}
                   ,attributes:{"class":"ac"}
                   ,editor:function(container, options) {
                       $('<input required name="befGradeCd" data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"gradeNm"
                           ,dataValueField:"gradeSeq"
                           ,dataSource:gradeCodeList
                           , change:function(e){

                           }
                       });
                       $('<span class="k-invalid-msg" data-for="befGradeCd"></span>').appendTo(container);
                   }
                   ,template:"# if(gradeCodeListMap[befGradeCd] != null) { # #= gradeCodeListMap[befGradeCd].gradeNm# # }#"
               }// 이전등급
               ,{field:"rchgAmt", title:"<spring:message code='crm.lbl.rchgAmt'/>",width:90,attributes:{"class":"ar"}}// 충전금액
               ,{field:"purcAmt", title:"<spring:message code='crm.lbl.purcAmt'/>",width:90,attributes:{"class":"ar"}}// 소비금액
               ,{field:"vsitCnt", title:"<spring:message code='crm.lbl.vsitCnt'/>",width:90,attributes:{"class":"ar"}}// 방문횟수
               ,{field:"purcCnt", title:"<spring:message code='crm.lbl.purcCnt'/>",width:90,attributes:{"class":"ar"}}// 구매횟수
               ,{field:"aftGradeCd", title:"<spring:message code='crm.lbl.expcMbsGrade'/>",width:120
                   ,validation:{required:true}
                   ,attributes:{"class":"ac"}
                   ,editor:function(container, options) {
                       if( options.model.applyYn == "N" ){
                           $('<input required name="aftGradeCd" data-bind="value:' + options.field + '"  />')
                           .appendTo(container)
                           .kendoExtDropDownList({
                               dataTextField:"gradeNm"
                               ,dataValueField:"gradeSeq"
                               ,dataSource:gradeCodeList
    /*                            , change:function(e){

                               } */
                           });
                           $('<span class="k-invalid-msg" data-for="aftGradeCd"></span>').appendTo(container);
                       }else{
                           //container.context.innerText = gradeCodeListMap[options.model.aftGradeCd].gradeNm;
                           $('<input required name="aftGradeCd" readonly="readonly" data-bind="value:' + options.field + '"  />')
                           .appendTo(container)
                           .kendoExtDropDownList({
                               dataTextField:"gradeNm"
                               ,dataValueField:"gradeSeq"
                               ,dataSource:gradeCodeList
    /*                            , change:function(e){

                               } */
                           });
                           $('<span class="k-invalid-msg" data-for="aftGradeCd"></span>').appendTo(container);
                       }
                   }
                   ,template:"# if(gradeCodeListMap[aftGradeCd] != null) { # #= gradeCodeListMap[aftGradeCd].gradeNm# # }#"
               }// 예상회원등급
               ,{field:"applyYn", title:"<spring:message code='global.lbl.applyYn'/>",width:90,attributes:{"class":"ac"}}// 적용여부
               ,{title:"&nbsp;"}
            ]
        });
    }); /* end ready */



</script>