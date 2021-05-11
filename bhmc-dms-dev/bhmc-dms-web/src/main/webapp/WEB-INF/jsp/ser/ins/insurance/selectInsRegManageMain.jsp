<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 보험등록  -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">
        <form id="insForm">
            <div class="header_area">
                <h1 class="title_basic"><spring:message code='ser.title.incReg' /></h1><!-- 보험등록 -->
                <div class="btn_right">
                    <button type="button" class="btn_m" id="btnInit"><spring:message code='global.btn.init' /></button><!-- 초기화 -->
                    <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code='global.btn.search' /></button><!-- 조회 -->
                </div>
            </div>
            <div class="table_form" role="search" data-btnid="btnSearch">
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
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.incCmpCd'/></th><!-- 보험사코드 -->
                            <td>
                                <input type="text" id="sIncCmpCd" name="sIncCmpCd" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.carRegNo' /></th><!-- 번호판번호 -->
                            <td>
                                <input type="text" id="sCarRegNo" name="sCarRegNo" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.incDistin' /></th><!-- 보험구분 -->
                            <td>
                                <input type="text" id="sIncDstinCd" name="sIncDstinCd" class="form_input">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.incStartDt' /></th><!-- 보험시작일 -->
                            <td>
                                <input type="text" id="sIncStartDt" name="sIncStartDt" class="form_datetimepicker ac" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.incCmpAcronym' /> </th><!-- 보험사약칭 -->
                            <td>
                                <input type="text" id="sIncCmpShtCd" name="sIncCmpShtCd" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN번호 -->
                            <td>
                                <input type="text" id="sVinNo" name="sVinNo" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.bizIncTp' /></th><!-- 상업보험유형 -->
                            <td>
                                <input type="text" id="sCmcIncTp" name="sCmcIncTp" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.incEndDt' /></th><!-- 보험만료일 -->
                            <td>
                                <input type="text" id="sIncEndDt" name="sIncEndDt" class="form_datetimepicker ac" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code='ser.lbl.incDocNo' /></th><!-- 보험문서번호 -->
                            <td>
                                <input type="text" id="sIncDocNo" name="sIncDocNo" class="form_input" />
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.insured' /> </th><!-- 피보험자 -->
                            <td>
                                <input type="text" id="sRincPrsnId" name="sRincPrsnId" class="form_input"/>
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.bizIncTpNm'/></th><!-- 상업보험유형명 -->
                            <td>
                                <input type="text" id="sCmcIncNm" name="sCmcIncNm" class="form_comboBox">
                            </td>
                            <th scope="row"><spring:message code='ser.lbl.incTotAmt' /> </th><!-- 보험비용 총계 -->
                            <td>
                                <input type="text" id="sIncTotAmt" name="sIncTotAmt" class="form_numeric ar">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" id="btnInsSave" class="btn_s btn_save btn_s_min5"><spring:message code="global.btn.save" /></button>
                        <button type="button" id="btnInsAdd" class="btn_s btn_add btn_s_min5"><spring:message code="global.btn.add" /></button><!-- 추가 -->
                        <button type="button" id="btnInsDel" class="btn_s btn_delete btn_s_min5"><spring:message code="global.btn.rowDel" /></button><!-- 삭제 -->
                        <button type="button" id="btnExcelImport" class="btn_s btn_s_min5" ><spring:message code="ser.lbl.excelUpload" /></button><!-- 파일업로드 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="gridMaster" class="grid"></div>
                </div>

                <div class="header_area  mt10">
                    <div class="btn_right">
                        <button type="button" id="btnCmcSave" class="btn_s btn_save btn_s_min5" disabled><spring:message code="global.btn.save" /></button>
                        <button type="button" id="btnCmcAdd" class="btn_s btn_add btn_s_min5" disabled><spring:message code="global.btn.add" /></button><!-- 추가 -->
                        <button type="button" id="btnCmcDel" class="btn_s btn_delete btn_s_min5" disabled><spring:message code="global.btn.rowDel" /></button><!-- 삭제 -->
                        <%-- <button type="button" id="btnCmcFile" class="btn_s btn_file btn_s_min5" disabled><spring:message code="global.btn.fileUpload" /></button> --%><!-- 파일업로드 -->
                    </div>
                </div>
                <div class="table_grid">
                    <div id="gridDetail" class="resizable_grid"></div>
                </div>
                <div class="header_area" style="display:none">
                    <div class="btn_right">
                        <button type="button" class="btn_m" disabled><spring:message code="ser.btn.insRegAlarm" /></button><!-- 보험등록알람 -->
                    </div>
                </div>
                <input type="hidden" id="incDocNo" name="incDocNo"/>
            </form>
        </section>
    </div>
</div>
    <!-- //保险承保 -->

<!-- script -->
<script type="text/javascript">

var gridRow = 0;
var selectedYn = false;



//공통코드:상업보험유형명
var cmcIncTpNmList = [];
<c:forEach var="obj" items="${cmcIncTpNmDs}">
cmcIncTpNmList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var cmcIncTpNmMap = dms.data.arrayToMap(cmcIncTpNmList, function(obj){return obj.cmmCd});

//공통코드:상업보험유형
var cmcIncTpList = [];
<c:forEach var="obj" items="${cmcIncTpDs}">
cmcIncTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var cmcIncTpMap = dms.data.arrayToMap(cmcIncTpList, function(obj){return obj.cmmCd});

var execelFileUploadPopupWin;

$(document).ready(function() {

    setCmcIncTpNmMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
           if(cmcIncTpNmMap[value] != undefined)
            resultVal =  cmcIncTpNmMap[value].cmmCdNm;
        }
        return resultVal;
    };

    setCmcIncTpMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
           if(cmcIncTpMap[value] != undefined)
            resultVal =  cmcIncTpMap[value].cmmCdNm;
        }
        return resultVal;
    };


    //보험 시작일자
    $("#sIncStartDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //보험종료일자
    $("#sIncEndDt").kendoExtMaskedDatePicker({
        format:"{0:<dms:configValue code='dateFormat' />}"
       ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    /**보험비용총계**/
    $("#sIncTotAmt").kendoExtNumericTextBox({
       min:0.00
      ,value:0.00
      ,format:"n2" //"{0:##,###}"
      ,spinners:false             // 증,감 화살표

    });

    // 상업보험유형
    $("#sCmcIncTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:cmcIncTpList
        ,optionLabel:" "
    });

    // 상업보험명
    $("#sCmcIncNm").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:cmcIncTpNmList
        ,optionLabel:" "
    });


    // 보험등록관리 저장
    $("#btnInsSave").kendoButton({

        click:function(e){

            var grid = $("#gridMaster").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList", "deleteList",["regDt"]);
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }
            if(grid.gridValidation()){

                $.ajax({

                    url:"<c:url value='/ser/ins/insurance/multiInsRegManage.do' />"
                   ,data:JSON.stringify({"insReqVO":saveData})
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR, status, error) {
                       dms.notification.error(jqXHR.responseJSON.errors);
                   }
                   ,success:function(jqXHR, textStatus) {

                       grid.dataSource._destroyed = [];
                       grid.dataSource.page(1);

                       //정상적으로 반영 되었습니다.
                       dms.notification.success("<spring:message code='global.info.success'/>");
                   }
                   ,beforeSend:function(xhr){
                       dms.loading.show($("#resizableContainer"));
                   }
                   ,complete:function(xhr,status){
                       dms.loading.hide($("#resizableContainer"));
                   }

                });

            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }

        }
    });

    //초기화
    $("#btnInit").kendoButton({

       click:function(e){

           $("#insForm").get(0).reset();

           $("#gridMaster").data("kendoExtGrid").dataSource.data([]);
           $("#gridDetail").data("kendoExtGrid").dataSource.data([]);


       }
    });

    //조회
    $("#btnSearch").kendoButton({

       click:function(e){
           var grid = $("#gridMaster").data("kendoExtGrid");

           grid.dataSource.read();
           $("#gridDetail").data("kendoExtGrid").dataSource.data([]);

       }
    });

    // 보험등록관리 상세 저장
    $("#btnCmcSave").kendoButton({

        click:function(e){

            var grid = $("#gridDetail").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }
            if(grid.gridValidation()){

                $.ajax({

                    url:"<c:url value='/ser/ins/insurance/multiInsRegDetailManage.do' />"
                   ,data:JSON.stringify({"insDetailVO":saveData})
                   ,type:'POST'
                   ,dataType:'json'
                   ,contentType:'application/json'
                   ,error:function(jqXHR, status, error) {
                       dms.notification.error(jqXHR.responseJSON.errors);
                   }
                   ,success:function(jqXHR, textStatus) {

                       grid.dataSource._destroyed = [];
                       grid.dataSource.page(1);

                       //정상적으로 반영 되었습니다.
                       dms.notification.success("<spring:message code='global.info.success'/>");
                   }
                   ,beforeSend:function(xhr){
                       dms.loading.show($("#resizableContainer"));
                   }
                   ,complete:function(xhr,status){
                       dms.loading.hide($("#resizableContainer"));
                   }

                });

            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }

        }
    });



    // 보험 마스터 등록
    $("#btnInsAdd").kendoButton({

        click:function(e){

            $('#gridMaster').data('kendoExtGrid').dataSource.insert(0,
               {
                 'carRegNo'    :''
                ,'vinNo'       :''
                ,'rincPrsnId'  :''
                ,'incDstinCd'  :''
                ,'incCmpCd'    :''
                ,'incCmpShtCd' :''
                ,'incDocNo'    :''
                ,'incCmpShtCd' :''
                ,'incTotAmt'   :0.00
                ,'incStartDt'  :''
                ,'incEndDt'    :''
                ,'regDt'       :''
                ,'regUsrId'    :''
                ,'cmcIncCd'    :''
                ,'cmcIncTp'    :''
                ,'cmcIncNm'    :''
                ,'cmcIncRemark':''
             });

        }
    });
    // 보험 마스터 삭제
    $("#btnInsDel").kendoButton({

        click:function(e){

            var grid = $("#gridMaster").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

        }
    });



 // 보험 마스터 파일업로드
    $("#btnExcelImport").kendoButton({
        click:function(e) {

            execelFileUploadPopupWin = dms.window.popup({
                title:"<spring:message code='ser.lbl.excelUpload' />"
                ,windowId:"execelFileUploadPopupWin"
                ,height : 340
                ,content:{
                    url:"<c:url value='/ser/ins/insurance/selectInsRegExcelUploadPopup.do'/>"
                    ,data:{
                        "callbackFunc":function(){
                            $('#gridMaster').data('kendoExtGrid').dataSource.read();
                        }
                    }
                }
            });
        }
    });


    // 보험 상세 등록
    $("#btnCmcAdd").kendoButton({

        click:function(e){

            var grid = $("#gridMaster").data("kendoExtGrid");
            var selectedVal = grid.dataItem(grid.select());

            $('#gridDetail').data('kendoExtGrid').dataSource.insert(0,
                {
                     'incDocNo'     :$("#incDocNo").val()
                    ,'lineNo'       :''
                    ,'cmcIncTpCd'   :selectedVal.cmcIncCd
                    ,'cmcIncTp'     :selectedVal.cmcIncTp
                    ,'cmcIncTpNm'   :selectedVal.cmcIncNm
                    ,'chgAmtRate'   :0.00
                    ,'incAmt'       :0.00
                    ,'incCostSumAmt':0.00
                    ,'incDcRate'    :0.00
                    ,'incFeeAmt'    :0.00
              });


        }
    });
    // 보험 상세 삭제
    $("#btnCmcDel").kendoButton({

        click:function(e){
            var grid = $("#gridDetail").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });

        }
    });
    // 보험 마스터 파일업로드
    $("#btnCmcFile").kendoButton({

        click:function(e){

        }
    });

    setButtonEnable = function (sFlag){

        switch(sFlag){
            case "Y" :

                $("#btnCmcSave").data("kendoButton").enable(true);
                $("#btnCmcAdd").data("kendoButton").enable(true);
                $("#btnCmcDel").data("kendoButton").enable(true);
                //$("#btnCmcFile").data("kendoButton").enable(true);
                      break;
            case "N" :
                $("#btnCmcSave").data("kendoButton").enable(false);
                $("#btnCmcAdd").data("kendoButton").enable(false);
                $("#btnCmcDel").data("kendoButton").enable(false);
                //$("#btnCmcFile").data("kendoButton").enable(false);
                      break;
            default :
                $("#btnInsSave").data("kendoButton").enable(true);
                $("#btnInsAdd").data("kendoButton").enable(true);
                $("#btnInsDel").data("kendoButton").enable(true);
                //$("#btnInsFile").data("kendoButton").enable(true);

                $("#btnCmcSave").data("kendoButton").enable(false);
                $("#btnCmcAdd").data("kendoButton").enable(false);
                $("#btnCmcDel").data("kendoButton").enable(false);
                //$("#btnCmcFile").data("kendoButton").enable(false);

                break;
        }
    };


    $("#gridMaster").kendoExtGrid({
        gridId:"G-SER-1011-000077"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/ins/insurance/selectInRegManages.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                         params["sIncCmpCd"] = $("#sIncCmpCd").val();
                         params["sCarRegNo"] = $("#sCarRegNo").val();
                         params["sIncDstinCd"] = $("#sIncDstinCd").val();
                         params["sIncCmpShtCd"] = $("#sIncCmpShtCd").val();
                         params["sVinNo"] = $("#sVinNo").val();
                         params["sCmcIncTp"] = $("#sCmcIncTp").val();
                         params["sIncDocNo"] = $("#sIncDocNo").val();
                         params["sRincPrsnId"] = $("#sRincPrsnId").val();
                         params["sCmcIncNm"] = $("#sCmcIncNm").val();
                         params["sIncTotAmt"] = $("#sIncTotAmt").data("kendoExtNumericTextBox").value();
                         params["sIncStartDt"] = $("#sIncStartDt").data("kendoExtMaskedDatePicker").value();
                         params["sIncEndDt"] = $("#sIncEndDt").data("kendoExtMaskedDatePicker").value();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false }
                       ,carRegNo:{type:"string" } // 번호판번호
                       ,vinNo:{type:"string"} // VIN번호
                       ,rincPrsnId:{type:"string" }//피보험자
                       ,incCmpCd:{type:"string"}//보험사코드
                       ,incCmpShtCd:{type:"string"}//보험사약칭
                       ,incDocNo:{type:"string", editable:false }//보험문서번호
                       ,incCmpShtCd:{type:"string" }//보험구분
                       ,incTotAmt:{type:"number" }//보험비용합계
                       ,incStartDt:{type:"date"}//보험시작일
                       ,incEndDt:{type:"date"}//보험만료일
                       ,regDt:{type:"date", editable:false }//보험등록일
                       ,regUsrId:{type:"string", editable:false }//보험등록작성자
                       ,cmcIncCd:{type:"string" }//상업보험코드
                       ,cmcIncTp:{type:"string" }//상업보험유형
                       ,cmcIncNm:{type:"string"}//상업보험명칭
                       ,cmcIncRemark:{type:"string" }//상업보험비고
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,filterable:true
        ,autoBind:false
        ,height:200
        ,resizable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,appendEmptyColumn:true           //빈컬럼 적용
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["carRegNo","rincPrsnId","incDstinCd","incCmpCd","incCmpShtCd","incTotAmt","incStartDt","incEndDt","cmcIncRemark"]
        ,change:function(e){

            var selectedVal = this.dataItem(this.select());
            $("#incDocNo").val(selectedVal.incDocNo);
            if(dms.string.isNotEmpty($("#incDocNo").val())){
                setButtonEnable("Y");
                $("#gridDetail").data("kendoExtGrid").dataSource.read();
            }

        }
        ,columns:[
                {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
               ,{field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="carRegNo" name="carRegNo" maxLength=30 class="form_input" data-name="<spring:message code="ser.lbl.carRegNo" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="carRegNo"></span>')
                       .appendTo(container);
                   }
               }//차량등록번호
               ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:200
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="vinNo" name="vinNo" maxLength=17 class="form_input" data-name="<spring:message code="ser.lbl.vinNo" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="vinNo"></span>')
                       .appendTo(container);
                   }
               }//vinNo
               ,{field:"rincPrsnId", title:"<spring:message code='ser.lbl.insured' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="rincPrsnId" name="rincPrsnId" maxLength=30 class="form_input" data-name="<spring:message code="ser.lbl.insured" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="rincPrsnId"></span>')
                       .appendTo(container);
                   }
               }//피보험자
               ,{field:"incDstinCd", title:"<spring:message code='ser.lbl.incDistin' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="incDstinCd" name="incDstinCd" maxLength=30 class="form_input" data-name="<spring:message code="ser.lbl.incDistin" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="incDstinCd"></span>')
                       .appendTo(container);
                   }
               }//보험구분코드
               ,{field:"incCmpCd", title:"<spring:message code='ser.lbl.incCmpCd' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="incCmpCd" name="incCmpCd" maxLength=30 class="form_input" data-name="<spring:message code="ser.lbl.incCmpCd" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="incCmpCd"></span>')
                       .appendTo(container);
                   }

               }//보험회사코드
               ,{field:"incCmpShtCd", title:"<spring:message code='ser.lbl.incCmpAcronym' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="incCmpShtCd" name="incCmpShtCd" maxLength=30 class="form_input" data-name="<spring:message code="ser.lbl.incCmpAcronym" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="incCmpShtCd"></span>')
                       .appendTo(container);
                   }
               }//보험사약칭
               ,{field:"incDocNo", title:"<spring:message code='ser.lbl.incDocNo' />", width:100, attributes :{"class":"al"}}//보험문서번호
               ,{field:"incTotAmt", title:"<spring:message code='ser.lbl.incTotAmt' />", width:80
                   , attributes :{"class":"ar"}
                   , format:"{0:n0}"
                   , editor:function(container, options){
                       $('<input name="incTotAmt" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtNumericTextBox({
                           format:"n2"                // n0:###,###, n2:###,###.##
                          ,decimals:2                // 소숫점
                          ,min:0.00
                          ,value:0.00
                          ,spinners:false
                       });
                       $('<span class="k-invalid-msg" data-for="incTotAmt"></span>').appendTo(container);
                    }
               }//보험비용총계
               ,{field:"incStartDt", title:"<spring:message code='ser.lbl.incStartDt' />", width:100
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input id="incStartDt" name="incStartDt" data-name="<spring:message code="ser.lbl.incStartDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                          ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                          ,value:""
                       });
                       $('<span class="k-invalid-msg" data-for="incStartDt"></span>').appendTo(container);
                   }
               }//보험시작일
               ,{field:"incEndDt", title:"<spring:message code='ser.lbl.incEndDt' />", width:100
                   ,attributes:{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
                   ,editor:function (container, options){
                       $('<input id="incEndDt" required name="incEndDt" data-name="<spring:message code="ser.lbl.incEndDt" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtMaskedDatePicker({
                           format:"{0:<dms:configValue code='dateFormat' />}"
                          ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                          ,value:""
                       });
                       $('<span class="k-invalid-msg" data-for="incEndDt"></span>').appendTo(container);
                   }
               }//보험종료일
               ,{field:"regDt", title:"<spring:message code='ser.lbl.incRegDt' />", width:100
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }//보험등록일
               ,{field:"regUsrId", title:"<spring:message code='ser.lbl.incRegNm' />", width:100, attributes :{"class":"al"}}//보험등록자
               ,{field:"cmcIncCd", title:"<spring:message code='ser.lbl.cmcIncCd' />", width:100
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="cmcIncTpCd" name="cmcIncCd" maxLength=300 class="form_input" data-name="<spring:message code="ser.lbl.cmcIncCd" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="cmcIncCd"></span>')
                       .appendTo(container);
                   }

               }
               ,{field:"cmcIncTp", title:"<spring:message code='ser.lbl.bizIncTp' />", width:100
                   , attributes :{"class":"ac"}
                   , template:"#= setCmcIncTpMap(cmcIncTp) #"
                   , editor:function(container, options){
                       $('<input required name="cmcIncTp" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,valuePrimitive:true
                           ,dataValueField:"cmmCd"
                           ,dataSource:cmcIncTpList
                       });
                       $('<span class="k-invalid-msg" data-for="cmcIncTp"></span>').appendTo(container);
                    }
               }//상업 보험 유형
               ,{field:"cmcIncNm", title:"<spring:message code='ser.lbl.bizIncTpNm' />", width:150//
                   , attributes :{"class":"ac"}
                   , template:"#= setCmcIncTpNmMap(cmcIncNm) #"
                   , editor:function(container, options){
                       $('<input required name="cmcIncTpNm" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                           ,valuePrimitive:true
                           ,dataValueField:"cmmCd"
                           ,dataSource:cmcIncTpNmList
                       });
                       $('<span class="k-invalid-msg" data-for="cmcIncNm"></span>').appendTo(container);
                    }
               }//상업 보험 유형명
               ,{field:"cmcIncRemark", title:"<spring:message code='ser.lbl.cmcIncRemark' />", width:300
                   ,attributes :{"class":"al"}
                   ,editor:function(container, options){
                       $('<input id="cmcIncRemark" name="cmcIncRemark" maxLength=300 class="form_input" data-name="<spring:message code="ser.lbl.cmcIncRemark" />" data-bind="value:' + options.field + '"/>')
                       .appendTo(container)
                       $('<span class="k-invalid-msg" data-for="cmcIncRemark"></span>')
                       .appendTo(container);
                   }
               }
             ]

    });


    $("#gridDetail").kendoExtGrid({
        gridId:"G-SER-1011-000078"
        ,dataSource:{
            transport:{
                   read :{
                       url:"<c:url value='/ser/ins/insurance/selectInRegDetailManages.do' />"
                   }
                 ,parameterMap:function(options , operation){
                     if(operation == "read"){

                      // 검색 조건을 파라미터로 담는다.
                         var params = {};
                         params["recordCountPerPage"] = options.pageSize;
                         params["pageIndex"] = options.page;
                         params["firstIndex"] = options.skip;
                         params["lastIndex"] = options.skip + options.take;
                         params["sort"] = options.sort;

                        // params["sRoDocNo"] = $("#roDocNo").val();
                         params["sIncDocNo"] = $("#incDocNo").val();
                        // params["sDlrCd"] = $("#dlrCd").val();

                         return kendo.stringify(params);
                     }else if(operation != "read" && options.models){
                         return kendo.stringify(options.models);
                     }
                 }//parameterMap
            }//transport
           ,schema:{
                 model:{
                     id:"rnum"
                    ,fields:{
                        rnum:{type:"number", editable:false }
                       ,incDocNo:{type:"string", editable:false }//보험문서번호
                       ,lineNo:{type:"number", editable:false }//lineNo
                       ,cmcIncTpCd:{type:"string" , editable:false }//상업보험코드
                       ,cmcIncTp:{type:"string" , editable:false}//상업보험유형
                       ,cmcIncTpNm:{type:"string" , editable:false}//상업보험명칭
                       ,chgAmtRate:{type:"number" }//요금율변동
                       ,incAmt:{type:"number" }//보험금액/책임제한 금액
                       ,incCostSumAmt:{type:"number"}//보험비용소계
                       ,incDcRate:{type:"number" }//보험할인율
                       ,incFeeAmt:{type:"number"}//보험수수료
                    }

                 }//model
           }//schema
        }//dataSource
        ,pageable:false
        ,autoBind:false
        ,height:200
        ,resizable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,multiSelectWithCheckbox:true
        ,edit:function(e){
            var fieldName = $(e.container.find("input")[0]).attr("name");
            if(fieldName=="itemAmt" ){
                this.closeCell();
            }
        }

        ,columns:[
                    {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                   ,{field:"cmcIncTpCd", title:"<spring:message code='ser.lbl.cmcIncCd' />", width:100
                       ,attributes :{"class":"al"}
                       ,editor:function(container, options){
                           $('<input id="cmcIncTpCd" name="cmcIncTpCd" maxLength=300 class="form_input" data-name="<spring:message code="ser.lbl.cmcIncCd" />" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           $('<span class="k-invalid-msg" data-for="cmcIncTpCd"></span>')
                           .appendTo(container);
                       }

                   }
                   ,{field:"cmcIncTp", title:"<spring:message code='ser.lbl.bizIncTp' />", width:100
                       , attributes :{"class":"ac"}
                       , template:"#= setCmcIncTpMap(cmcIncTp) #"
                       , editor:function(container, options){
                           $('<input required name="cmcIncTp" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,valuePrimitive:true
                               ,dataValueField:"cmmCd"
                               ,dataSource:cmcIncTpList
                           });
                           $('<span class="k-invalid-msg" data-for="cmcIncTp"></span>').appendTo(container);
                        }
                   }
                   ,{field:"cmcIncTpNm", title:"<spring:message code='ser.lbl.bizIncTpNm' />", width:150//
                       , attributes :{"class":"ac"}
                       , template:"#= setCmcIncTpNmMap(cmcIncTpNm) #"
                       , editor:function(container, options){
                           $('<input required name="cmcIncTpNm" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                               ,valuePrimitive:true
                               ,dataValueField:"cmmCd"
                               ,dataSource:cmcIncTpNmList
                           });
                           $('<span class="k-invalid-msg" data-for="cmcIncTpNm"></span>').appendTo(container);
                        }
                   }
                   ,{field:"chgAmtRate", title:"<spring:message code='ser.lbl.chgAmtRate' />", width:100
                       , attributes :{"class":"ar"}
                       , editor:function(container, options){
                           $('<input name="chgAmtRate" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                               format:"n2"                // n0:###,###, n2:###,###.##
                              ,decimals:2                // 소숫점
                              ,min:0.00
                              ,value:0.00
                              ,spinners:false
                           });
                           $('<span class="k-invalid-msg" data-for="chgAmtRate"></span>').appendTo(container);
                        }
                   }
                   ,{field:"incAmt", title:"<spring:message code='ser.lbl.incAmt' />", width:100
                       , attributes :{"class":"ar"}
                       , editor:function(container, options){
                           $('<input name="incAmt" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                               format:"n2"                // n0:###,###, n2:###,###.##
                              ,decimals:2                // 소숫점
                              ,min:0.00
                              ,value:0.00
                              ,spinners:false
                           });
                           $('<span class="k-invalid-msg" data-for="incAmt"></span>').appendTo(container);
                        }
                   }
                   ,{field:"incCostSumAmt", title:"<spring:message code='ser.lbl.incCostSumAmt' />", width:100
                       , attributes :{"class":"ar"}
                       , editor:function(container, options){
                           $('<input name="incCostSumAmt" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                               format:"n2"                // n0:###,###, n2:###,###.##
                              ,decimals:2                // 소숫점
                              ,min:0.00
                              ,value:0.00
                              ,spinners:false
                           });
                           $('<span class="k-invalid-msg" data-for="incCostSumAmt"></span>').appendTo(container);
                        }
                   }
                   ,{field:"incDcRate", title:"<spring:message code='ser.lbl.incDcRate' />", width:100
                       , attributes :{"class":"ar"}
                       , editor:function(container, options){
                           $('<input name="incDcRate" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                               format:"n2"                // n0:###,###, n2:###,###.##
                              ,decimals:2                // 소숫점
                              ,min:0.00
                              ,value:0.00
                              ,spinners:false
                           });
                           $('<span class="k-invalid-msg" data-for="incDcRate"></span>').appendTo(container);
                        }
                   }
                   ,{field:"incFeeAmt", title:"<spring:message code='ser.lbl.incFeeAmt' />", width:100
                       , attributes :{"class":"ar"}
                       , editor:function(container, options){
                           $('<input name="incFeeAmt" data-bind="value:' + options.field + '"/>')
                           .appendTo(container)
                           .kendoExtNumericTextBox({
                               format:"n2"                // n0:###,###, n2:###,###.##
                              ,decimals:2                // 소숫점
                              ,min:0.00
                              ,value:0.00
                              ,spinners:false
                           });
                           $('<span class="k-invalid-msg" data-for="incFeeAmt"></span>').appendTo(container);
                        }
                   }
                 ]

    });

    <c:if test="${vinNo ne '' }">
       $("#sVinNo").val("${vinNo}");
       $("#sIncDocNo").val("${incDocNo}");
       $("#btnSearch").click();
    </c:if>

});

</script>
<!-- //script -->


