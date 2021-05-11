<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
        <div id="resizableContainer">
            <section class="group">
                <div class="header_area">
                <h1 class="title_basic"> <spring:message code='global.title.membershipGradeMng'/></h1><!-- 멤버십 등급조건 설정 -->
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11342" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m" id="btnDetailGrade"><spring:message code='global.btn.detail' /></button> <!-- 상세 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11343" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_add" id="btnAddGrade"><spring:message code='global.btn.add' /></button> <!-- 추가 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11344" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_save" id="stdPridMonthSave"><spring:message code="global.btn.save" /></button> <!-- 기준최근저장 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-11345" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button> <!-- 조회 -->
                    </dms:access>
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
                                    <th scope="row"><spring:message code="global.lbl.latelyStandard"/> </th><!-- 기준최근 -->
                                    <td colspan="7">
                                        <c:if test="${stdPridMonthCdList.size() != 0}">
                                            <c:forEach var="obj" items="${stdPridMonthCdList}">
                                                <c:if test="${obj.useYn == 'Y'}">
                                                    <button type="button" class="btn_s" id="cmmCd_${obj.cmmCd}" name="cmmCd_${obj.cmmCd}" onclick="javascript:pridMonthSetting('${obj.cmmCd}')" value="${obj.cmmCd}" >${obj.cmmCdNm}</button>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        <input type="hidden" id="stdPridMonth" name="stdPridMonth" data-json-obj="true" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div> <!-- end table -->

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code="global.title.gradeDefine" /></h2><!-- 등급정의 -->
                    <div class="btn_right"></div>
                </div>
                <div class="table_grid">
                    <div id="gradeGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
    /*************************************************************
     *드랍다운 리스트 셋팅
     *************************************************************/
     //적용 기준 날짜 Array
     var stdPridMonthCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
     <c:forEach var="obj" items="${stdPridMonthCdList}">
     stdPridMonthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
     </c:forEach>
     var stdPridMonthCdMap = dms.data.arrayToMap(stdPridMonthCdList, function(obj){ return obj.cmmCd; });

     var initData ='<c:out value="${stdPridMonthCd}"/>';
     pridMonthSetting(initData);
     $("#stdPridMonth").val(initData);
     //$("#stdPridMonth").data("kendoExtDropDownList").value('<c:out value="${stdPridMonthCd}"/>')//선호연락방법


     var membershipCardUploadPopupWin;

    /*************************************************************
    jQuery시작
    *************************************************************/
    $(document).ready(function() {

        /* $("#stdPridMonth").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:stdPridMonthCdList
            , index:0
        }); */


        /*************************************************************
         * 버튼 영역
         *************************************************************/

       //버튼 - 만족도 조사 조회
         $("#btnSearch").kendoButton({
             click:function(e) {
                 $('#gradeGrid').data('kendoExtGrid').dataSource.page(1);
             }
         });

         //버튼 - 저장
//         $("#btnGradeSave").kendoButton({
         $("#stdPridMonthSave").kendoButton({
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

                 var gradeGrid = $("#gradeGrid").data("kendoExtGrid");
                 var data = gradeGrid.dataSource.view();

                 if(data.length == 0){
                     //딜러멤버십등급 정보가 없습니다.
                     dms.notification.info("<spring:message code='global.lbl.dlrMbrShipReg' var='dlrMbrShipReg' /><spring:message code='crm.info.noinfoData' arguments='${dlrMbrShipReg}' />");
                     return false;
                 }

                 var url = "<c:url value='/crm/dmm/membershipGradeMng/updateStdPridMonth.do' />";

                 $.ajax({
                     url:url
                     ,data:JSON.stringify(param)
                     ,type:'POST'
                     ,dataType:'json'
                     ,contentType:'application/json'
                     ,error:function(jqXHR,status,error){
                         //console.log(jqXHR);
                         dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                     },
                     success:function(result){
                         //console.log(result);
                         dms.notification.success("<spring:message code='global.info.success'/>");
                         $('#gradeGrid').data('kendoExtGrid').dataSource.page(1);
                         pridMonthSetting($("#stdPridMonth").val());
                         //$('#stdPridMonth').data("kendoExtDropDownList").value(stdPridMonth3);
                     }
                     ,beforeSend:function(xhr) {
                         dms.loading.show();
                     }
                     ,complete:function(xhr, status) {
                         dms.loading.hide();
                     }
                 }).done(function(result) {
                     //console.log("membershipGradeMngSave Done!!!!");
                 });
             }
         })

      // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
         $("#gradeGrid").on("dblclick", "tr.k-state-selected", function (e) {
             $("#btnDetailGrade").click();
        });

        ////버튼 - 상세
        $("#btnDetailGrade").kendoButton({
            click:function(e){
                //$('#gradeGrid').data('kendoExtGrid').dataSource.insert(0, {}); 2016.07.12 행추가에서 팝업추가로 변경

                if(dms.string.isEmpty($("#stdPridMonth").val())){
                    //기준최근(은)를 선택해주세요.
                    dms.notification.info("<spring:message code='crm.lbl.stdPridMonth' var='stdPridMonth' /><spring:message code='global.info.chkSelectItemMsg' arguments='${stdPridMonth}' />");
                    return;
                }

                var grid = $("#gradeGrid").data("kendoExtGrid");
                var rows = grid.select();

                if (rows.length < 1) {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

                var stdPridMonth = $('#stdPridMonth').val();

                var selectedItem = grid.dataItem(grid.select());
                var gradeSeq = selectedItem.gradeSeq;

                popupWindow = dms.window.popup({
                    windowId:"selectMembershipGradeMngPopup"
                , title:"<spring:message code='global.title.membershipGradeMng'/>"   // 멤버십 등급조건 설정
                    ,width:950
                    , content:{
                        url:"<c:url value='/crm/dmm/membershipGradeMng/selectMembershipGradeMngPopup.do?stdPridMonth="+ stdPridMonth +"&gradeSeq="+gradeSeq+"'/>"
                        , data:{
                            "autoBind":false
                            , "type"  :null
                            , "callbackFunc":function(data){
                                if(data.length >= 1) {
                                    //endorseInfoSet(data[0]);
                                    //searchPointInfo(); 멤버심 마스터 테이블에 있는 LAST_POINT_VAL로 사용함
                                }//end if
                            }//end callbackFunc
                        }//end data
                    }// end content
                });
            }
        });

        ////버튼 - 취소
        $("#btnCancelGrade").kendoButton({
            click:function(e) {
                $('#gradeGrid').data('kendoExtGrid').cancelChanges();
            }
        });

        ////버튼 - 추가
        $("#btnAddGrade").kendoButton({
            click:function(e){
                //$('#gradeGrid').data('kendoExtGrid').dataSource.insert(0, {}); 2016.07.12 행추가에서 팝업추가로 변경

                if(dms.string.isEmpty($('#stdPridMonth').val())){
                    //기준최근(은)를 선택해주세요.
                    dms.notification.info("<spring:message code='crm.lbl.stdPridMonth' var='stdPridMonth' /><spring:message code='global.info.chkSelectItemMsg' arguments='${stdPridMonth}' />");
                    return;
                }

                var stdPridMonth = $('#stdPridMonth').val();

                popupWindow = dms.window.popup({
                    windowId:"selectMembershipGradeMngPopup"
                , title:"<spring:message code='global.title.membershipGradeMng'/>"   // 멤버십 등급조건 설정
                    ,width:950
                    , content:{
                        url:"<c:url value='/crm/dmm/membershipGradeMng/selectMembershipGradeMngPopup.do?stdPridMonth="+ stdPridMonth +"'/>"
                        , data:{
                            "autoBind":false
                            , "type"  :null
                            , "callbackFunc":function(data){
                                if(data.length >= 1) {
                                    //endorseInfoSet(data[0]);
                                    //searchPointInfo(); 멤버심 마스터 테이블에 있는 LAST_POINT_VAL로 사용함
                                }//end if
                            }//end callbackFunc
                        }//end data
                    }// end content
                });
            }
        });

        ////버튼 - 저장
        $("#btnSaveGrade").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#stdPridMonth").val())){
                    //기준최근(은)를 선택해주세요.
                    dms.notification.info("<spring:message code='crm.lbl.stdPridMonth' var='stdPridMonth' /><spring:message code='global.info.chkSelectItemMsg' arguments='${stdPridMonth}' />");
                    return;
                }

                var grid = $("#gradeGrid").data("kendoExtGrid");
                var items = grid.dataItems();
                var ord = [];

                $.each(items, function(idx, row){
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
                //var stdPridMonth2 = $("#stdPridMonth").val();;
                $.each(items, function(idx, row){
                    row.stdPridMonth = $("#stdPridMonth").val();
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
            gridId:"G-CRM-0726-133915",
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
                                ,rchgStartAmt:{type:"number", validation:{required:true}}//충전금액From
                                ,rchgEndAmt:{type:"number", validation:{required:true}}//충전금액To
                                ,purcStartCnt:{type:"number", validation:{required:true}}//구매횟수From
                                ,purcEndCnt:{type:"number", validation:{required:true}}//구매횟수To
                                ,purcStartAmt:{type:"number", validation:{required:true}}//구매금액From
                                ,purcEndAmt:{type:"number", validation:{required:true}}//구매금액to
                                ,saleStartDt:{type:"date", validation:{required:true}}//판매구매기간일From
                                ,saleEndDt:{type:"date", validation:{required:true}}//판매구매기간일To
                                ,serStartCnt:{type:"number", validation:{required:true}}//정비횟수From
                                ,serEndCnt:{type:"number", validation:{required:true}}//정비횟수To
                                ,serStartAmt:{type:"number", validation:{required:true}}//정비금액From
                                ,serEndAmt:{type:"number", validation:{required:true}}//정비금액To
                                ,accuRate:{type:"number", validation:{required:true}}//적립율
                                ,serLbrDcRate:{type:"number", validation:{required:true}}//정비공임할인율
                                ,serParDcRate:{type:"number", validation:{required:true}}//정비부품할인율
                                ,serTotDcRate:{type:"number", validation:{required:true}}//정비총금액할인율
                                ,stdPridMonth:{type:"number", validation:{required:true}, editable:false}//기준최근
                                ,gradeOrderNo:{type:"string", editable:true} //등급순서
                                ,gradeNm:{type:"string", validation:{required:true}} //등급명
                                ,serTermCd:{type:"string", validation:{required:true}}//방문조건코드
                                ,purcTermCd:{type:"string", validation:{required:true}}//구매조건코드
                                ,purcTermAmtCd:{type:"string", validation:{required:true}}//구매조건 코드
                                ,saleEndDtCd:{type:"string", validation:{required:true}}//판매구매기간조건코드
                            }
                        }
                }
            }
            ,filterable:false
            ,sortable:false
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:false          //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,editable:false
            ,dataBound:function(e) {
                var stdPridMonthCd = '';
                if(dms.string.isEmpty($("#stdPridMonth").val())){
                    var data ='<c:out value="${stdPridMonthCd}"/>';
                    stdPridMonthCd =data;
                }else{
                    stdPridMonthCd = $("#stdPridMonth").val();
                }
                    $("#stdPridMonth").val(stdPridMonthCd);

            }
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            //,navigatable:true
            //,sortable:true
            //,pageable:true
            /* ,toolbar:["create","save","cancel"]
            ,editable:"popup" */
            ,columns:[
               {field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
               ,{field:"gradeOrderNo", title:"<spring:message code='crm.lbl.gradeOrderNo' />",width:90}//등급순서
               ,{field:"gradeSeq", title:"<spring:message code='global.lbl.gradeSeq' />",width:90}//등급일련번호
               ,{field:"gradeNm", title:"<spring:message code='global.lbl.gradeNm' />",width:100}//등급명
               ,{
                   title:"<spring:message code='crm.lbl.rchgAmt'/>"
                  ,columns:[{
                      field:"rchgStartAmt", title:"<spring:message code='crm.lbl.from' />",width:90,attributes:{"class":"ar"}, format:"{0:c}",editor:editNumber  //충전금액From
                  },{
                      field:"rchgEndAmt", title:"<spring:message code='crm.lbl.to' />",width:90,attributes:{"class":"ar"}, format:"{0:c}",editor:editNumber //충전금액To
                  }]
               }
               ,{
                   title:"<spring:message code='crm.lbl.purcCnt'/>"
                  ,columns:[{
                      field:"purcStartCnt", title:"<spring:message code='crm.lbl.from' />",width:90,attributes:{"class":"ar"},editor:editNumber  //구매건수From
                  },{
                      field:"purcEndCnt", title:"<spring:message code='crm.lbl.to' />",width:90,attributes:{"class":"ar"},editor:editNumber //구매건수To
                  }]
               }
               ,{
                   title:"<spring:message code='crm.lbl.gradePurcAmt'/>"
                  ,columns:[{
                      field:"purcStartAmt", title:"<spring:message code='crm.lbl.from' />",width:90,attributes:{"class":"ar"}, format:"{0:c}", editor:editNumber  //차량구매From
                  },{
                      field:"purcEndAmt", title:"<spring:message code='crm.lbl.to' />",width:90,attributes:{"class":"ar"}, format:"{0:c}",editor:editNumber //차량구매To
                  }]
               }
               ,{
                   title:"<spring:message code='crm.lbl.saleDt'/>"
                  ,columns:[{
                          field:"saleStartDt",title:"<spring:message code='crm.lbl.from' />",width:100,attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"//자동차 구매시간 From
                      }
                      ,{
                          field:"saleEndDt",title:"<spring:message code='crm.lbl.to' />",width:100,attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"//자동차 구매시간 To
                  }]
               }
               ,{
                   title:"<spring:message code='crm.lbl.serCnt'/>"
                  ,columns:[{
                      field:"serStartCnt", title:"<spring:message code='crm.lbl.from' />",width:90,attributes:{"class":"ar"},editor:editNumber  //정비건수From
                  },{
                      field:"serEndCnt", title:"<spring:message code='crm.lbl.to' />",width:90,attributes:{"class":"ar"},editor:editNumber //정비건수To
                  }]
               }
               ,{
                   title:"<spring:message code='crm.lbl.serAmt'/>"
                  ,columns:[{
                      field:"serStartAmt", title:"<spring:message code='crm.lbl.from' />",width:90,attributes:{"class":"ar"}, format:"{0:c}",editor:editNumber  //정비금액From
                  },{
                      field:"serEndAmt", title:"<spring:message code='crm.lbl.to' />",width:90,attributes:{"class":"ar"}, format:"{0:c}",editor:editNumber //정비금액To
                  }]
               }
/*                ,{field:"vsitTermCd", title:"<spring:message code='global.lbl.vsitTermCd' />",width:100
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
               } */

 /*               ,{field:"purcTermCd", title:"<spring:message code='global.lbl.purcTermCd' />",width:90
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
               } */

               /* ,{field:"purcTermAmtCd", title:"<spring:message code='global.lbl.purcTermAmtCd' />",width:130
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
               } */

               /*   ,{field:"saleEndDtCd", title:"<spring:message code='crm.lbl.saleDt' />",width:130
               ,attributes:{"class":"ac"}
               ,editor:function(container, options) {
                   $('<input required name="saleEndDtCd" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtDropDownList({
                       autoBind:true
                       ,dataSource:['OR']
                       ,index:1
                   });
                   $('<span class="k-invalid-msg" data-for="saleEndDtCd"></span>').appendTo(container);
               }
           }//판매구매 조건코드 */

               ,{field:"accuRate", title:"<spring:message code='crm.label.accuRate' />",width:60,attributes:{"class":"ar"}
                   ,editor:editNumber // 제일하단 참조
               }//회원등급포인트율
               ,{
                   title:"<spring:message code='crm.title.dcRate'/>"
                  ,columns:[
                      {field:"serLbrDcRate", title:"<spring:message code='crm.lbl.serLbrDcRate' />",width:100,attributes:{"class":"ar"}
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
//                       ,{field:"serTotDcRate", title:"<spring:message code='crm.lbl.serTotDcRate' />",width:100,attributes:{"class":"ar"}
//                           ,format:"{0:n0}"
//                           ,decimal:0
//                           ,editor:function(container, options){//editor:editNumber 사용안한 이유는 max값 때문
//                               var input = $("<input/>");

//                               input.attr("name", options.field);
//                               input.appendTo(container);
//                               input.kendoExtNumericTextBox({
//                                   min:0
//                                   ,max:100
//                                   ,decimal:0
//                                   ,spinners:false
//                               });
//                           }
//                       }//정비총금액할인율
                  ]
               }
               ,{field:"stdPridMonth", title:"<spring:message code='crm.lbl.stdPridMonth' />",width:90,attributes:{"class":"ac"}
                   ,attributes:{"class":"ac"}
                   ,template:"# if(stdPridMonthCdMap[stdPridMonth] != null) { # #= stdPridMonthCdMap[stdPridMonth].cmmCdNm# # }#"
                   ,editor:function(container, options) {
                       $('<input required name="stdPridMonth" data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:stdPridMonthCdList
                       });
                       $('<span class="k-invalid-msg" data-for="stdPridMonth"></span>').appendTo(container);
                   }
               }//기준최근
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

    function pridMonthSetting(month){
        $.each(stdPridMonthCdList, function(idx,obj){
            if(obj.cmmCd == $("#cmmCd_"+month).val()){
                $("#cmmCd_"+month).addClass("btn_active");
                $("#stdPridMonth").val($("#cmmCd_"+month).val());
            }else{
                $("#cmmCd_"+obj.cmmCd).removeClass("btn_active");
            }
        })
        /*
        if(month == 00){
            $("[id ^= cmmCd_").removeClass("btn_active");
            $("#cmmCd_00").addClass("btn_active");
        }else{
            $.each(stdPridMonthCdList, function(idx,obj){
                if(obj.cmmCd == $("#cmmCd_"+month).val()){
                    $("#cmmCd_"+month).addClass("btn_active");
                    $("#stdPridMonth").val($("#cmmCd_"+month).val());
                }else{
                    $("#cmmCd_"+obj.cmmCd).removeClass("btn_active");
                }
                $("#cmmCd_00").removeClass("btn_active");
            })
        }
        */
    }

</script>