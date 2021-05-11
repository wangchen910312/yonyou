<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%-- <c:set value="01" var="membershipStan" /> --%> <!-- 고객 -->
<c:set value="02" var="membershipStan" /> <!-- 자동차 -->


            <section class="group">
                <div class="header_area">
                <h1 class="title_basic"> <spring:message code='crm.menu.membershipCardMng'/> </h1><!-- 멤버십 카드관리 -->
                    <div class="btn_right">
                      <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                      <%-- <button class="btn_m btn_batch_upload" id="btnCardUpload"><spring:message code="global.btn.batchUpload" /></button> --%> <!-- 일괄등록 -->
                      <button class="btn_m btn_batch_upload" id="btnCardUpload"><spring:message code="global.btn.upload" /></button> <!-- 업로드 -->
                      <button class="btn_m btn_save" id="btnCardSave"><spring:message code="global.btn.save" /></button> <!-- 저장 -->
                      <button class="btn_m btn_add" id="btnCardAdd"><spring:message code="global.btn.rowAdd" /></button> <!-- 행추가 -->
                      <button class="btn_m btn_del" id="btnCardDel"><spring:message code="global.btn.rowDel" /></button> <!-- 행삭제 -->
                      <button class="btn_m btn_cancel" id="btnCardCancel"><spring:message code='global.btn.cancel' /></button><!-- 취소 -->
                    </div>
                </div>
                <div class="table_form form_width_70per">
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
                                <th scope="row"> <spring:message code='global.lbl.cardNo'/> </th> <!-- 카드번호 -->
                                <td>
                                    <input type="text" id="sCardNo" name="sCardNo" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.regDt'/></th> <!-- 등록일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt" name="sStartDt" class="form_datepicker ac" data-type="maskDate" >
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt" name="sEndDt" class="form_datepicker ac" data-type="maskDate">
                                        </div>
                                    </div>
                                </td>

                                <th scope="row"><spring:message code='global.lbl.cardTpCd'/></th> <!-- 카드종류 -->
                                <td>
                                    <input id="sCardTpCd" name="sCardTpCd" class="form_comboBox">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div> <!-- end table -->

                <div class="table_grid mt10">
                    <div id="cardGrid"></div>
                </div>
            </section>

      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
    /*************************************************************
     *드랍다운 리스트 셋팅
     *************************************************************/
     //카드종류구분 Array
     var cardTpList = [];
     <c:forEach var="obj" items="${cardTpCdList}">
     cardTpList.push({
         "cmmCd":"${obj.cmmCd}"
         , "cmmCdNm":"${obj.cmmCdNm}"
     });
     </c:forEach>
     //카드종류구분 Map
     var cardTpMap = [];
     $.each(cardTpList, function(idx, obj){
         cardTpMap[obj.cmmCd] = obj.cmmCdNm;
     });

     //카드형태구분 Array
     var cardFormList = [{"cmmCd":"", "cmmCdNm":""}];
     <c:forEach var="obj" items="${cardFormCdList}">
     cardFormList.push({
         "cmmCd":"${obj.cmmCd}"
         , "cmmCdNm":"${obj.cmmCdNm}"
     });
     </c:forEach>
     //카드형태구분 Map
     var cardFormMap = [];
     $.each(cardFormList, function(idx, obj){
         cardFormMap[obj.cmmCd] = obj.cmmCdNm;
     });


     var membershipCardUploadPopupWin;

    /*************************************************************
    jQuery시작
    *************************************************************/
    $(document).ready(function() {

        $("#sCardTpCd").kendoExtDropDownList({
            dataSource:cardTpList
            ,dataValueField:"cmmCd"
            ,dataTextField:"cmmCdNm"
            , optionLabel:" "
        });

        //시간 template
        $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /*************************************************************
         * 버튼 영역
         *************************************************************/
        ////버튼 - 행추가
        $("#btnCardAdd").kendoButton({
            click:function(e){
                $('#cardGrid').data('kendoExtGrid').dataSource.insert(0, {});
            }
        });

        ////버튼 - 행삭제
        $("#btnCardDel").kendoButton({
            click:function(e) {
                var grid = $("#cardGrid").data("kendoExtGrid");
                var rows = grid.select();

                rows.each(function(index, row) {
                    grid.removeRow(row);
                });
            }
        });

        ////버튼 - 취소
        $("#btnCardCancel").kendoButton({
            click:function(e) {
                $('#cardGrid').data('kendoExtGrid').cancelChanges();
            }
        });

        ////버튼 - 저장
        $("#btnCardSave").kendoButton({
            click:function(e){
                var grid = $("#cardGrid").data("kendoExtGrid");
                var saveData = grid.getCUDData("insertList","updateList","deleteList");
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/crm/dmm/membershipCard/multiMembershipCards.do' />",
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

        //버튼 - 고객등록이동
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#cardGrid").data("kendoExtGrid").dataSource._destroyed = [];
                $("#cardGrid").data("kendoExtGrid").dataSource.page(1);
            }
        });

        //버튼 - 일괄등록
        $("#btnCardUpload").kendoButton({
            click:function(e) {
                membershipCardUploadPopupWin = dms.window.popup({
                    title:"<spring:message code='global.title.card.cardUpload' />"
                    ,windowId:"membershipCardUploadPopupWin"
                    ,content:{
                        url:"<c:url value='/crm/dmm/membershipCard/selectMembershipCardUploadPopup.do'/>"
                        ,data:{
                            "callbackFunc":function(){
                                $('#cardGrid').data('kendoExtGrid').dataSource.read();
                                membershipCardUploadPopupWin.close();
                            }
                        }
                    }
                });
            }
        });


        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#cardGrid").kendoExtGrid({
            dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipCard/selectMembershipCards.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sCardNo"]       = $("#sCardNo").val();
                            params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sCardTpCd"]   = $("#sCardTpCd").data("kendoExtDropDownList").value();
                            //params["sCardTpCd"]   = $("#sCardTpCd").val();

//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"dlrCd"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,dlrCd:{type:"string"}
                                ,cardTpCd:{type:"string", validation:{required:true}} //카드종류
                                ,cardNo:{type:"string", validation:{required:true}} //카드번호
                                ,cardUseDt:{type:"date",  validation:{required:true}} // 카드사용기한
                                ,cardFormCd:{type:"string", validation:{required:true}} //카드형태
                            }
                        }
                }
            }
            ,multiSelectWithCheckbox:true
            ,height:380
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,navigatable:true
            ,sortable:true
            ,pageable:true
            ,columns:[
               {field:"rnum", title:"no" ,width:100,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
               ,{field:"cardNo"
                   ,title:"<spring:message code='global.lbl.cardNo'/>"
                   ,editor:function(container, options) {
                       $('<input type="text" required name="cardNo" maxlength="30" style="width:100%" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="cardNo"></span>').appendTo(container);
                   }
               }
               ,{field:"cardTpCd", title:"<spring:message code='global.lbl.cardTpCd'/>" //카드종류
                   ,width:120
                   ,editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:cardTpList
                       });
                    }
                   ,template:'#if(cardTpCd !== ""){# #= cardTpMap[cardTpCd]# #}#'
               }// 카드종류
               ,{field:"cardUseDt", title:"<spring:message code='global.lbl.cardUseDt'/>"
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function(container, options) {
                       $('<input required name="cardUseDt" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"<dms:configValue code='dateFormat' />"
                           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                           ,value:""
                       });
                       $('<span class="k-invalid-msg" data-for="cardUseDt"></span>').appendTo(container);
                   }
               }// 사용기한
               ,{field:"cardFormCd", title:"<spring:message code='global.lbl.cardFormCd'/>"
                   ,width:120
                   ,editor:function(container, options){
                       $('<input data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:cardFormList
                       });
                    }
                   ,template:'#if(cardFormCd !== ""){# #= cardFormMap[cardFormCd]# #}#'
               }// 카드형태
            ]
        });
    }); /* end ready */



</script>