<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code='crm.menu.satisFactionPresent'/></h1><!-- 만족도 조사 현황 -->
                    <div class="btn_right">
                      <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>  <!-- 조회 -->
                    </div>
                </div>

                <div class="table_form">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:12%;">
                            <col style="width:22%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstNm"/></th><!-- 만족도 조사명 -->
                                <td>
                                    <input type="text" id="sStsfIvstNm" name="sStsfIvstNm" maxlength="33" value="" class="form_input">
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstTpCd"/></th><!-- 조사 타입 -->
                                <td>
                                    <input value="" id="sStsfIvstTpCd" name="sStsfIvstTpCd" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstMthCd"/></th><!-- 만족도 조사유형 -->
                                <td>
                                    <input value="" id="sStsfIvstMthCd" name="sStsfIvstMthCd" class="form_comboBox">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code="crm.lbl.stsfIvstExpdCd"/></th><!-- 만족도 조사수단 -->
                                <td>
                                    <input value="" id="sStsfIvstExpdCd" name="sStsfIvstExpdCd" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.regDt"/></th><!-- 등록일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt" name="sStartDt" class="form_datepicker" data-type="maskDate" >
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt" name="sEndDt" class="form_datepicker" data-type="maskDate">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"></th>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>



                <div class="table_grid mt10">
                    <div id="stsfGrid"></div>
                </div>



                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.rcpeList'/></h2><!-- 대상자 목록 -->
                    <div class="btn_right">
                      <%-- <button type="button" class="btn_s btn_add" id="callTransfer"><spring:message code="global.btn.callTransfer" /></button> --%>  <!-- 콜센터 이관 -->
                      <button type="button" class="btn_s btn_save" id="btnSave"><spring:message code='global.btn.save' /></button><!-- 저장 -->
                      <button type="button" class="btn_s btn_del" id="btnDel"><spring:message code='global.btn.rowDel' /></button> <!-- 행삭제 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="presentDetailGrid"></div>
                </div>

            </section>

      <!-- //기본정보 -->

<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">
/*************************************************************
데이터 셋업
*************************************************************/
    //$("#callTransfer").hide(); //콜센터 이관
    $("#btnSave").hide(); //저장
    $("#btnDel").hide(); //행삭제

    //1.그리드 만족도조사 유형 콤보  DataSource
    var stsfIvstMthCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstMthCdList}">
    stsfIvstMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var stsfIvstMthCdListMap = dms.data.arrayToMap(stsfIvstMthCdList, function(obj){ return obj.cmmCd; });

    //2.그리드 만족도조사 수단 콤보  DataSource
    var stsfIvstExpdCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var stsfIvstExpdCdListMap = [];
    <c:forEach var="obj" items="${stsfIvstExpdCdList}">
    stsfIvstExpdCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    stsfIvstExpdCdListMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
    </c:forEach>
    //var stsfIvstExpdCdListMap = dms.data.arrayToMap(stsfIvstExpdCdList, function(obj){ return obj.cmmCd; });

    //3.그리드 만족도조사 타입 콤보  DataSource
    var stsfIvstTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    <c:forEach var="obj" items="${stsfIvstTpCdList}">
    stsfIvstTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var stsfIvstTpCdListMap = dms.data.arrayToMap(stsfIvstTpCdList, function(obj){ return obj.cmmCd; });

    //조회조건 - 불만족 원인여부
    $("#sCmplReasonContYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,index:0
    });


    $(document).ready(function() {

        // 유형
        $("#sStsfIvstMthCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
            , dataSource:stsfIvstMthCdList
        });

        // 수단
        $("#sStsfIvstExpdCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
            , dataSource:stsfIvstExpdCdList
        });

        // 타입
        $("#sStsfIvstTpCd").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            //, optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
            , dataSource:stsfIvstTpCdList
        });

        //시간 template
        /* $(".form_datepicker").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        }); */

        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });

        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
           ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
           ,change:fnChkDateValue
        });


        /*************************************************************
         *   버튼 셋팅
        *************************************************************/
        ////버튼 - 조회
        $("#btnSearch").kendoButton({
            click:function(e){
                $('#stsfGrid').data('kendoExtGrid').dataSource.read();
                $("#presentDetailGrid").data("kendoExtGrid").dataSource.data([]);
                /* $("#cmplReasonCont").val("");
                $('#presentUsrGrid').data('kendoExtGrid').dataSource.read(1); */
            }
        });

        //버튼 - 행삭제
        $("#btnDel").kendoButton({
            click:function(e) {
                var grid = $("#presentDetailGrid").data("kendoExtGrid");
                var rows = grid.select();

                var that = this;
                var stsfIvstDtCnt = 0;
                var callCenSendDtCnt = 0;

                rows.each(function(index, row) {
                    var dataItem = grid.dataItem(row)
                    if(dataItem.stsfIvstDt != ""){
                        stsfIvstDtCnt = stsfIvstDtCnt + 1;
                    };
                    if(dataItem.callCenSendDt != ""){
                        callCenSendDtCnt = callCenSendDtCnt + 1;
                    };



                });

                if(stsfIvstDtCnt == 0 && callCenSendDtCnt == 0){
                    grid.removeRow(row);
                }else{
                    //이미 만족도조사가 되었거나, 콜센터에 전송 되었습니다.
                    dms.notification.info("<spring:message code='crm.info.satisFactionUserNoDelete'/>");
                    return;
                }
            }
        });

        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {
                //설문조사결과가 있는 대상자를 제외한 인원만 삭제 가능합니다. 진행하시겠습니까?
                //if (confirm("<spring:message code='crm.info.presentUsrDel'/>") == true ){
                    var grid = $("#presentDetailGrid").data("kendoExtGrid");
                    var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
                    if (grid.cudDataLength == 0) {
                        //변경된 정보가 없습니다.
                        dms.notification.info("<spring:message code='global.info.required.change'/>");
                        return;
                    }

                    if (grid.gridValidation()) {
                        $.ajax({
                            url:"<c:url value='/crm/css/satisFactionManage/multiExtrUsrs.do' />",
                            data:JSON.stringify(saveData),
                            type:'POST',
                            dataType:'json',
                            contentType:'application/json',
                            error:function(jqXHR,status,error) {
                                dms.notification.error(jqXHR.responseJSON.errors);
                            },
                            success:function(jqXHR, textStatus) {
                                grid.dataSource.page(1);
                                //정상적으로 반영 되었습니다.
                                dms.notification.success("<spring:message code='global.info.success'/>");
                                $('#presentDetailGrid').data('kendoExtGrid').dataSource.page(1);
                            }
                        });
                    }else{
                        //입력값을 확인하여 주십시오.
                        dms.notification.warning("<spring:message code='global.info.check.input'/>");
                    }//end if
                //}//end if
            }//end click
        });


        //버튼 - 콜센터 이관(버튼 기능 종료-요구사항, 혹시나 다시 버튼 만들어야할 때를 대비해 남겨둠)
        /*
        $("#callTransfer").kendoButton({
           click:function(e){
               var stsfGrid = $("#stsfGrid").data("kendoExtGrid");
               var selectedItem = stsfGrid.dataItem(stsfGrid.select());
               if(selectedItem != null){
                   if(selectedItem.stsfIvstExpdCd == '01'){

                        var params = {};
                        params["sDlrCd"] = selectedItem.dlrCd;
                        params["sSeq"] = selectedItem.seq;
                        params["sRcpeExtrSeq"] = selectedItem.rcpeExtrSeq;
                        var url = "<c:url value='/crm/css/satisFactionManage/selectCallSenProc.do' />";

                        $.ajax({
                            url:url
                            ,data:JSON.stringify(params)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(jqXHR,status,error){
                                console.log(jqXHR);
                                dms.notification.error(jqXHR.responseJSON.errors[0].errorMessage);
                            },
                            success:function(result){
                                dms.notification.success("<spring:message code='global.info.success'/>");
                            }
                        }).done(function(result) {
                            console.log("callProc Done!!!!");
                        });
                   }else{
                       //만족도 조사수단이 '전화'인 유형만 콜센터 이관이 가능합니다.
                       dms.notification.info("<spring:message code='crm.err.stsfIvstExpdCd'/>");
                       return;
                   }
               }else{
                   //만족도 조사를 선택하세요.
                   dms.notification.info("<spring:message code='global.lbl.custStsfSurvey' var='custStsfSurvey' /><spring:message code='global.info.check.field' arguments='${custStsfSurvey}' />");
                   return;
               } //end if
           }
        });
        */



        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#stsfGrid").kendoExtGrid({
            gridId:"G-CRM-0726-160852"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/css/satisFactionPresent/selectSatisFactionPresents.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sStartDt"] = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"] = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
                            params["sStsfIvstMthCd"] = $("#sStsfIvstMthCd").data("kendoExtDropDownList").value();
                            params["sStsfIvstExpdCd"] = $("#sStsfIvstExpdCd").data("kendoExtDropDownList").value();
                            params["sStsfIvstTpCd"] = $("#sStsfIvstTpCd").data("kendoExtDropDownList").value();
                            params["sStsfIvstNm"] = $("#sStsfIvstNm").val();
                            //params["sCmplReasonContYn"] = $("#sCmplReasonContYn").data("kendoExtDropDownList").value();
                            //params["sStsfIvstScoreVal"] = $("#sStsfIvstScoreVal").val();
/*                             params["sStsfIvstMthCd"]       = $("#sStsfIvstExpdCd").val();
                            params["sStsfIvstExpdCd"]       = $("#sStsfIvstExpdCd").val();
                            params["sStsfIvstTpCd"]   = $("#sStsfIvstTpCd").val(); */

//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"seq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,seq:{type:"number"} //만족도조사 일련번호
                                ,dlrCd:{type:"string"}
                                ,stsfIvstNm:{type:"string",  validation:{required:true}} // 만족도 조사명
                                ,stsfIvstTpCd:{type:"string", validation:{required:true}} //만족도 조사 타입코드
                                ,stsfIvstTpCdNm:{type:"string", validation:{required:true}} //만족도 조사 타입코드
                                ,stsfIvstMthCd:{type:"string", validation:{required:true}} //만족조조사 유형코드
                                ,stsfIvstMthCdNm:{type:"string", validation:{required:true}} //만족조조사 유형코드
                                ,stsfIvstExpdCd:{type:"string", validation:{required:true}} //만족도조사 수단코드
                                ,stsfIvstExpdNm:{type:"string", validation:{required:true}} //만족도조사 수단코드
                                ,startDt:{type:"date", validation:{required:true}} //만족도 조사 시작일
                                ,startDtFormat:{type:"date", editable:false}
                                ,endDt:{type:"date", validation:{required:true}} //만족도 조사 종료일
                                ,endDtFormat:{type:"date", editable:false}
                                ,rcpeExtrSeq:{type:"string", validation:{required:true}} //대상자추출일련번호
                                ,stsfCustCnt:{type:"number", validation:{required:true}} //대상자수
                                ,surveyUsrCnt:{type:"number", validation:{required:true}} //설문 완료수
                                ,avgScore:{type:"number", validation:{required:true}} //평균점수
                                ,regDt:{type:"date", validation:{required:true}} //등록일
                                ,regDtFormat:{type:"date", editable:false}
                                ,editYn:{type:"string", validation:{required:true}} //수정가능여부(버튼컨트롤)
                                //,col2:{type:"date", validation:{required:true}} //낮은점수 조치일
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.startDtFormat = kendo.parseDate(elem.startDt, "<dms:configValue code='dateFormat' />");
                                    elem.endDtFormat = kendo.parseDate(elem.endDt, "<dms:configValue code='dateFormat' />");
                                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
/*             ,change:function(e){
                var dataItem = this.dataItem(this.select());

                if(dataItem != null){
                    $("#presentDetailGrid").data("kendoExtGrid").dataSource.read(1);
                }
            } */
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:280
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,editable:false
            ,sortable:true
            ,change:function(e){
                $("#presentDetailGrid").data("kendoExtGrid").dataSource.read(1);
                var selectedItem = this.dataItem(this.select());
                /*
                if(selectedItem.editYn == "Y" && selectedItem.stsfIvstExpdCd == "01"){
                    $("#callTransfer").show(); //콜센터 이관
                }else{
                    $("#callTransfer").hide(); //콜센터 이관
                }
                */
                $("#btnSave").show(); //저장
                $("#btnDel").show(); //행삭제

                /* var now = new Date();
                var year = now.getFullYear();
                var mon = (now.getMonth()+1) > 9 ? '' + (now.getMonth()+1):'0' + (now.getMonth()+1);
                var day = now.getDate() > 9 ? '' + now.getDate():'0' + now.getDate();

                var chan_val = year + '-' + mon + '-' + day;
                alert(chan_val); */

                //selectedItem.startDt
            }
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}}//
               ,{field:"seq", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 만족도 일련번호
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"stsfIvstNm", title:"<spring:message code='crm.lbl.stsfIvstNm'/>", attributes:{"class":"al"}, width:150}// 만족도 조사명
               ,{field:"stsfIvstMthCd", title:"<spring:message code='crm.lbl.stsfIvstMthCd'/>", attributes:{"class":"ac"}
                   ,hidden:true
                   , width:100
                   ,template:"#=stsfIvstMthCdListMap[stsfIvstMthCd].cmmCdNm#"
                   ,editor:function(container, options) {
                       $('<input required name="stsfIvstMthCd" data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:stsfIvstMthCdList
                       });
                       $('<span class="k-invalid-msg" data-for="stsfIvstMthCd"></span>').appendTo(container);
                       //,template:'#if(qestTpCd !== ""){# #= qestTpCdMap[cmmCd]# #}#'
                   }
               }// 수단코드
               ,{field:"stsfIvstMthCdNm", title:"<spring:message code='crm.lbl.stsfIvstMthCd'/>", attributes:{"class":"ac"}, width:150}// 만족도 조사명
               ,{field:"stsfIvstExpdCd", title:"<spring:message code='crm.lbl.stsfIvstExpdCd'/>", attributes:{"class":"ac"}
                   ,hidden:true
                   , width:100
                   //,template:"#=stsfIvstExpdCdListMap[stsfIvstExpdCd].cmmCdNm#"
                   ,template:'#if(stsfIvstExpdCd !== ""){# #= stsfIvstExpdCdListMap[stsfIvstExpdCd]# #}#'
                   ,editor:function(container, options) {
                       $('<input required name="stsfIvstExpdCd" data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:stsfIvstExpdCdList
                       });
                       $('<span class="k-invalid-msg" data-for="stsfIvstExpdCd"></span>').appendTo(container);
                       //,template:'#if(qestTpCd !== ""){# #= qestTpCdMap[cmmCd]# #}#'
                   }
               }// 타입코드
               ,{field:"stsfIvstExpdCdNm", title:"<spring:message code='crm.lbl.stsfIvstExpdCd'/>", attributes:{"class":"ac"}, width:150}// 만족도 조사명
               ,{field:"stsfIvstTpCd", title:"<spring:message code='crm.lbl.stsfIvstTpCd'/>", attributes:{"class":"ac"}
                   ,hidden:true
                   ,template:"#=stsfIvstTpCdListMap[stsfIvstTpCd].cmmCdNm#"
                   ,editor:function(container, options) {
                       $('<input required name="stsfIvstTpCd" data-bind="value:' + options.field + '"  />')
                       .appendTo(container)
                       .kendoExtDropDownList({
                           dataTextField:"cmmCdNm"
                           ,dataValueField:"cmmCd"
                           ,dataSource:stsfIvstTpCdList
                       });
                       $('<span class="k-invalid-msg" data-for="stsfIvstTpCd"></span>').appendTo(container);
                       //,template:'#if(qestTpCd !== ""){# #= qestTpCdMap[cmmCd]# #}#'
                   }
               }// 조사타입
               ,{field:"stsfIvstTpCdNm", title:"<spring:message code='crm.lbl.stsfIvstTpCd'/>", attributes:{"class":"ac"}, width:150}// 만족도 조사명
               /* ,{field:"startDt", title:"<spring:message code='crm.lbl.startDt'/>",attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               } */
               ,{field:"startDtFormat", title:"<spring:message code='global.lbl.startDt' />"
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#= kendo.toString(data.startDt, '<dms:configValue code='dateTimeFormat' />') #"
               }// 시작일
               /* ,{field:"endDt", title:"<spring:message code='crm.lbl.endDt'/>",attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               } */
               ,{field:"endDtFormat", title:"<spring:message code='global.lbl.endDt' />"
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#= kendo.toString(data.endDt, '<dms:configValue code='dateTimeFormat' />') #"
               }// 종료일
               ,{field:"rcpeExtrSeq", title:"<spring:message code='crm.lbl.rcpeExtrSeq'/>",attributes:{"class":"ac"},hidden:true}//대상자추출
               ,{field:"stsfCustCnt", title:"<spring:message code='crm.lbl.stsfCustCnt'/>",attributes:{"class":"ac"}}//대상자수
               ,{field:"surveyUsrCnt", title:"<spring:message code='crm.lbl.surveyUsrCnt'/>",attributes:{"class":"ac"}}//설문완료수
               ,{field:"avgScore", title:"<spring:message code='crm.lbl.avgScore'/>",attributes:{"class":"ac"}//평균점수
                   ,format:"{0:####,##}"
               }// 평균점수
               /* ,{field:"regDt", title:"<spring:message code='global.lbl.regDt'/>",attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               } */
               ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />"
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') #"
               }// 등록일
               ,{field:"editYn", title:"수정가능여부",attributes:{"class":"ac"}, hidden:true}// 수정가능여부(버튼컨트롤)

            ]
        });


        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        //그리드 설정
        $("#presentDetailGrid").kendoExtGrid({
            gridId:"G-CRM-0726-161257"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/css/satisFactionPresent/selectSurveyCustResults.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            var grid = $('#stsfGrid').data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());
                            params["sDlrCd"] = selectedItem.dlrCd;
                            params["sSeq"] = selectedItem.seq;
                            /* params["sStsfIvstSeq"] = selectedItem.stsfIvstSeq;
                            params["sStsfIvstTpCd"] = selectedItem.stsfIvstTpCd;
                            params["sStsfIvstMthCd"] = selectedItem.stsfIvstMthCd;
                            params["sStsfIvstExpdCd"] = selectedItem.stsfIvstExpdCd;
                            params["sSubyTmplSeq"] = selectedItem.subyTmplSeq; */


//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"seq"
                            ,fields:{
                                rnum:{type:"string", editable:false}
                                ,dlrCd:{type:"string"} //딜러코드
                                ,seq:{type:"number"} // 일련번호
                                ,custNm:{type:"string"} //고객명
                                ,custNo:{type:"string"} //고객번호
                                ,hpNo:{type:"string"} //전화번호
                                ,stsfIvstEmpId:{type:"string"} //조사담당자
                                ,stsfIvstDt:{type:"date"} //만족도조사일
                                ,stsfIvstDtFormat:{type:"date", editable:false}
                                ,stsfIvstScoreVal:{type:"number"} //만족도 조사점수
                                ,callCenSendDt:{type:"date"}//콜센터 전송일
                                ,callCenSendDtFormat:{type:"date", editable:false}
                                ,regDt:{type:"date"} //등록일
                                ,regDtFormat:{type:"date", editable:false}
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.stsfIvstDtFormat = kendo.parseDate(elem.stsfIvstDt, "<dms:configValue code='dateFormat' />");
                                    elem.callCenSendDtFormat = kendo.parseDate(elem.callCenSendDt, "<dms:configValue code='dateFormat' />");
                                    elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,multiSelectWithCheckbox:true
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:280
            ,editable:false
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,sortable:true

            /* ,dataBound:function(e){
                var that = this;
                var rows = that.tbody.find("tr");
                rows.each(function(idx,row){
                    var dataItem = that.dataItem(row);
                    if(dataItem.stsfIvstDt == null || dataItem.stsfIvstDt == ""){
                        $("input.stsfIvstDt", row).prop("미실시");
                    }else{
                        //this.closeCell();
                        $("input.stsfIvstDt", row).prop("미실시");
                    }
                });

            } */
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />" ,width:50,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"seq", title:"", attributes:{"class":"ac"}, hidden:true}//만족도 일련번호
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>", attributes:{"class":"ac"}}//고격명
               ,{field:"custNo", title:"<spring:message code='global.lbl.custNo'/>", attributes:{"class":"ac"}, hidden:true}//고객번호
               ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", attributes:{"class":"ac"}}//전화번호
               ,{field:"stsfIvstEmpId", title:"<spring:message code='global.lbl.stsfIvstEmpId'/>", attributes:{"class":"ac"}}//만족도 조사인
               /* ,{field:"stsfIvstDt", title:"<spring:message code='crm.lbl.stsfIvstDt'/>", attributes:{"class":"ac"}//만족도 조사일
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               } */
               ,{field:"stsfIvstDtFormat", title:"<spring:message code='crm.lbl.stsfIvstDt' />"
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:'#if(data.stsfIvstDt !== "" && data.stsfIvstDt !== null){# #= kendo.toString(data.stsfIvstDt, "<dms:configValue code="dateTimeFormat" />") # #}#'
//                   ,template:"#= kendo.toString(data.stsfIvstDt, '<dms:configValue code='dateTimeFormat' />') #"
               }
               ,{field:"stsfIvstScoreVal", title:"<spring:message code='crm.lbl.stsfIvstScoreVal'/>", attributes:{"class":"ac"}}//만족도 조사점수
               /* ,{field:"callCenSendDt", title:"<spring:message code='crm.lbl.callCenSendDt'/>", attributes:{"class":"ac"}//콜센터 전송일
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               } *///
               ,{field:"callCenSendDtFormat", title:"<spring:message code='crm.lbl.callCenSendDt' />"
                   ,attributes:{"class":"ac tooltip-disabled"}
                   //,template:"#= kendo.toString(data.callCenSendDt, '<dms:configValue code='dateTimeFormat' />') #"
                   ,template:'#if(data.callCenSendDt !== "" && data.callCenSendDt !== null){# #= kendo.toString(data.callCenSendDt, "<dms:configValue code="dateTimeFormat" />") # #}#'
               }
               /* ,{field:"regDt", title:"<spring:message code='global.lbl.regDt'/>", attributes:{"class":"ac"} //등록일
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               } *///
               ,{field:"regDtFormat", title:"<spring:message code='global.lbl.regDt' />"
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#= kendo.toString(data.regDt, '<dms:configValue code='dateTimeFormat' />') #"
                   //,template:'#if(data.regDt !== "" data.regDt !== null){# #= kendo.toString(data.regDt, "<dms:configValue code="dateTimeFormat" />") # #}#'
               }
            ]
        });


    }); //end ready

    // 날짜 검증
    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

          //등록시작일
          if(id === 'sStartDt'){
              frYY = this.value().getFullYear();
              frMM = this.value().getMonth();
              frDD = this.value().getDate();
              $("#sEndDt").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
          }else if(id === 'sEndDt'){//등록종료일
              toYY = this.value().getFullYear();
              toMM = this.value().getMonth();
              toDD = this.value().getDate();
              $("#sStartDt").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
          }
     }
</script>