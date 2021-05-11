<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 대행업무관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.menu.agencyBsiMgmt" /></h1><!-- 대행업무관리 -->
        <div class="btn_right">
            <button id="btnViewDetail" class="btn_m"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            <button class="btn_m btn_new" id="btnReset"><spring:message code="global.btn.new" /></button><!-- 신규 -->
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.proxyDt' /></th><!-- 대행일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" data-type="maskDate" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" data-type="maskDate" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                    <td>
                        <input id="sCarRegNo" type="text" class="form_input" >
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.proxyDstinTp' /></th><!-- 대행업무구분 -->
                    <td>
                        <input id="sAapWrkDstinCd" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.proxyNm' /></th><!-- 대행자 -->
                    <td>
                        <input id="sAapEmpNm" type="text"  class="form_input" >
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->


    <section id="aapMngWindow" class="pop_wrap">
        <!-- 개별정보 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='global.title.carInfo' /></h2><!-- 개별정보 -->
            <div class="btn_right">
                <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
            </div>
        </div>
        <form id="detailForm" name="detailForm" method="POST" action="/">

        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.proxyDt' /></span></th><!-- 대행일 -->
                        <td class="required_area">
                            <input id="aapDt" name="aapDt" class="form_datepicker" data-json-obj="true">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.proxyDstinTp' /></span></th><!-- 대행업무구분 -->
                        <td class="required_area">
                            <input id="aapWrkDstinCd" name="aapWrkDstinCd" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row">일련번호</th>   <!-- 일련번호 -->
                        <td>
                            <input id="seq" name="seq" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vinNo" /></span></th><!-- VIN NO -->
                        <td>
                            <div class="form_search" style="width:50%">
                            <input id="sVinNo" type="text" maxlength="17" class="form_input"/>
                                <a href="#" onclick="bf_searchVinNo();" ><spring:message code='global.lbl.search' /></a>   <!-- 검색 -->
                            </div>
                            <input type="text" id="vinNo" name="vinNo" readonly class="form_input form_readonly" data-json-obj="true" style="width:48%" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.carNo" /></th><!-- 차량번호 -->
                        <td>
                            <input id="carRegNo" name="carRegNo" type="text" readonly class="form_input form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.contractNo' /></th><!-- 계약번호 -->
                        <td>
                            <input id="contractNo" type="text" readonly class="form_input form_readonly" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="global.lbl.carLine" /></th><!-- 차종 -->
                        <td>
                            <input id="carlineNm" class="form_input form_disabled" disabled>
                            <input id="carlineCd" name="carlineCd" data-json-obj="true" type="hidden"/>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.model' /></th><!-- 모델 -->
                        <td>
                            <input id="modelNm" class="form_input form_disabled" disabled>
                            <input id="modelCd" name="modelCd" data-json-obj="true" type="hidden"/>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                        <td>
                            <input id="ocnNm" class="form_input form_disabled" disabled>
                            <input id="ocnCd" name="ocnCd" data-json-obj="true" type="hidden"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.proxyNm' /></th><!-- 대행자 -->
                        <td>
                            <input id="aapEmpNm" name="aapEmpNm" type="text"  class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row"><spring:message code='global.lbl.proxyNm' /></th><!-- 대행자 -->
                        <td>
                            <input id="aapEmpNm" name="aapEmpNm" type="text"  class="form_input" data-json-obj="true">
                        </td>
                        <th scope="row">대행업무 번호</th>
                        <td><input id="seq" name="seq" class="form_input form_readonly" type="text" data-json-obj="true"/></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.cstAmt' /></th><!-- 원가 -->
                        <td>
                            <input id="cstAmt" name="cstAmt" class="form_input" type="number" maxlength="19" data-name="<spring:message code="global.lbl.cstAmt" />" data-bind="value:cstAmt" value="0"  onblur="fnOnblur(this.id);" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.profitAmt" /></th><!-- 수익 -->
                        <td>
                            <input id="profitAmt" name="profitAmt" class="form_input" type="number" value="0" onblur="fnOnblur(this.id);" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.total" /></th><!-- 합계 -->
                        <td>
                            <input id="aapAmt" name="aapAmt" class="form_input form_disabled" disabled value="0" onblur="fnOnblur(this.id);" data-json-obj="true" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- TOBE : 계약처럼 변경요청됨. -->
        <div class="table_form mt10"  style="display:none;">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.sung' /></th><!-- 등록지 성 -->
                        <td>
                            <input id="sungCd" name="sungCd" type="text" class="form_comboBox" >
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.cityCd' /></th><!-- 시 -->
                        <td>
                            <input id="cityCd" name="cityCd" type="text" class="form_comboBox" >
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.dist' /></th><!-- 구 -->
                        <td>
                            <input id="distCd" name="distCd" type="text" class="form_comboBox" >
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>


        </form>
        <!-- //차량 상세정보 -->
    </section>
</section>
</div>

<!-- script -->
<script>
var oneDay = "${oneDay}";   // 해당월 1일
var lastDay = "${lastDay}"; // 해당월 마지막일자
var toDay = "${toDay}";     // 오늘 일자

//대행업무구분 Array
var aapWrkDstinCd = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${aapWrkDstinCdList}">
   aapWrkDstinCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//대행업무 Map
var aapWrkDstinCdMap = dms.data.arrayToMap(aapWrkDstinCd, function(obj){ return obj.cmmCd; });



/**
 * 성 콤보박스
 */
var sungCdDs = [];
<c:forEach var="obj" items="${sungCdList}">
    sungCdDs.push({sungNm:"${obj.sungNm}", sungCd:"${obj.sungCd}"});
</c:forEach>
//성 Map
var sungCdMap = dms.data.arrayToMap(sungCdDs, function(obj){ return obj.sungCd; });


$(document).ready(function() {

     $("#aapMngWindow").kendoWindow({
         animation:false
         ,draggable:false
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"<spring:message code='sal.lbl.detailSearch' />"      // 상세정보
         ,width:"950px"
         ,height:"268px"
     }).data("kendoWindow");


    //조회조건 - 대행업무구분
    $("#sAapWrkDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:dms.data.cmmCdFilter(aapWrkDstinCd)
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });


    //조회조건 - 대행일(기간)- START
    $("#sStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    //조회조건 - 대행일(기간)- END
    $("#sEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:lastDay
    });

    // 조회조건 - 시작일, 종료일
    $("#sStartDt").on('change', {from:$("#sStartDt"), to:$("#sEndDt")}, fnChkSearchDate);
    $("#sEndDt").on('change',   {from:$("#sStartDt"), to:$("#sEndDt")}, fnChkSearchDate);


    /*************************** 검색 조건 영역 END **************************************************/


    //개별정보 - 대행업무구분
    $("#aapWrkDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:aapWrkDstinCd
        //,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
        ,enabled:false
    });


    //개별정보 - 대행일
    $("#aapDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });




    /*************************** 개별정보 영역 END **************************************************/

    // 상세정보
    $("#btnViewDetail").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            var selectedItem = grid.dataItem(grid.select());
            if ( dms.string.isNotEmpty(selectedItem) ){

                viewDetail(selectedItem);

            } else {

                // {상세정보}을(를) 확인하여 주세요.
                dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
                return;
            }

        }
        , enable:false
    })

    //초기화
    $("#btnReset").kendoButton({
        click:function(e){

            var grid = $("#grid").data("kendoExtGrid");
            grid.clearSelection();

            $("#vinNo").val("");
            $("#carRegNo").val("");
            $("#carlineCd").val("");
            $("#carlineNm").val("");
            $("#aapWrkDstinCd").data("kendoExtDropDownList").value("");
            $("#modelCd").val("");
            $("#modelNm").val("");
            $("#ocnCd").val("");
            $("#ocnNm").val("");
            $("#aapEmpNm").val("");
            $("#aapDt").data("kendoExtMaskedDatePicker").value(toDay);
            $("#cstAmt").val(0);
            $("#profitAmt").val(0);
            $("#aapAmt").val(0);
            $("#seq").val("");

            viewPopup();

            //$("#searchYn").val("Y");//고객조회팝업에 대한 open여부
            //$(".form_search").removeClass("form_search_disabled");
            $("#aapWrkDstinCd").data("kendoExtDropDownList").enable(true);
            $("#aapDt").data("kendoExtMaskedDatePicker").enable(true);

        }
    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            // 조회조건 일자
            if( ($("#sStartDt").data("kendoExtMaskedDatePicker").value() != null && $("#sEndDt").data("kendoExtMaskedDatePicker").value() == null)
                ||($("#sEndDt").data("kendoExtMaskedDatePicker").value() != null && $("#sStartDt").data("kendoExtMaskedDatePicker").value() == null)){
                //적용일을 모두 입력해 주세요
                  dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                  return false;
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });




    // 저장/수정
    $("#btnSave").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#vinNo").val())){
                dms.notification.warning("<spring:message code='global.lbl.vinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#vinNo").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#aapWrkDstinCd").val())){
                dms.notification.warning("<spring:message code='global.lbl.proxyDstinTp' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#aapWrkDstinCd").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#aapDt").val())){
                dms.notification.warning("<spring:message code='global.lbl.proxyDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#aapDt").focus();
                return false;
            }


            var param = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));
            param.aapDt = $("#aapDt").data("kendoExtMaskedDatePicker").value();
            param.aapAmt = Number($("#cstAmt").val()) + Number($("#profitAmt").val());
            var grid = $("#grid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                param.seq = "";
            }else {
                var grid = $('#grid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

            }



            $.ajax({
                url:"<c:url value='/sal/aap/aapMng/saveAapMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    // 저장이 완료되었습니다.
                    dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                }
            });

        }
    });





    /*******************  //버튼   *******************************************/



    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113301"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/aap/aapMng/selectAapMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["sort"] = options.sort;

                        params["sStartDt"]  = $("#sStartDt").data("kendoExtMaskedDatePicker").value();          // 대행일 - 시작일
                        params["sEndDt"]    = $("#sEndDt").data("kendoExtMaskedDatePicker").value();            // 대행일 - 종료일
                        params["sVinNo"]    = $("#sVinNo").val();                                               // VIN NO
                        params["sCarRegNo"] = $("#sCarRegNo").val();                                            // 차량번호
                        params["sAapWrkDstinCd"]   = $("#sAapWrkDstinCd").data("kendoExtDropDownList").value();    // 대행업무구분
                        params["sAapEmpNm"] = $("#sAapEmpNm").val();                                            // 대행자

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    $("#vinNo").val("");
                    $("#carRegNo").val("");
                    $("#carlineCd").val("");
                    $("#carlineNm").val("");
                    $("#aapWrkDstinCd").data("kendoExtDropDownList").value("");
                    $("#modelCd").val("");
                    $("#modelNm").val("");
                    $("#ocnCd").val("");
                    $("#ocnNm").val("");
                    $("#aapEmpNm").val("");
                    $("#aapDt").data("kendoExtMaskedDatePicker").value(toDay);
                    $("#cstAmt").val(0);
                    $("#profitAmt").val(0);
                    $("#aapAmt").val(0);
                    $("#seq").val("");
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                        vinNo          :{type:"string"}
                        ,aapDt         :{type:"date"}
                        ,aapWrkDstinCd :{type:"string"}
                        ,vinNo         :{type:"string"}
                        ,carRegNo      :{type:"string"}
                        ,cstAmt        :{type:"number"}
                        ,profitAmt     :{type:"number"}
                        ,aapAmt        :{type:"number"}
                        ,carlineNm     :{type:"string"}
                        ,modelNm       :{type:"string"}
                        ,ocnCdNm       :{type:"string"}
                        ,aapEmpNm      :{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        //,autoBind:false
        //,height:450
        ,change:function(e) {
            if(this.select().length != 0){
                var selectedItem = this.dataItem(this.select());
                var aapDt = selectedItem.aapDt;

                if ( dms.string.isNotEmpty(aapDt) ) {
                    $("#btnViewDetail").data("kendoButton").enable(true);
                }


            };

        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,columns:[
                    {field:"aapDt"       ,title:"<spring:message code = 'global.lbl.proxyDt'/>"         ,width:80  ,attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}    //대행일
                    ,{field:"aapWrkDstinCd",title:"<spring:message code = 'global.lbl.proxyDstinTp'/>"  ,width:80  ,attributes:{"class":"ac"}     //대행업무구분
                      ,template:"# if(aapWrkDstinCdMap[aapWrkDstinCd] != null) { # #= aapWrkDstinCdMap[aapWrkDstinCd].cmmCdNm# # }#"
                     }
                    ,{field:"vinNo"      ,title:"<spring:message code = 'global.lbl.vinNo'/>"           ,width:150   ,attributes:{"class":"ac"}}    //VIN NO
                    ,{field:"carRegNo"   ,title:"<spring:message code = 'global.lbl.carRegNo'/>"        ,width:130  ,attributes:{"class":"ac"}}    //차량번호
                    ,{field:"cstAmt"     ,title:"<spring:message code = 'global.lbl.cstAmt'/>"          ,width:100  ,attributes:{"class":"ar"}, format:"{0:##,###.0}"} //원가
                    ,{field:"profitAmt"  ,title:"<spring:message code = 'global.lbl.profitAmt'/>"       ,width:100  ,attributes:{"class":"ar"}, format:"{0:##,###.0}"} //수익
                    ,{field:"aapAmt"     ,title:"<spring:message code = 'global.lbl.total'/>"           ,width:100  ,attributes:{"class":"ar"}, format:"{0:##,###.0}"} //합계
                    ,{field:"carlineNm"  ,title:"<spring:message code = 'global.lbl.carLine'/>"         ,width:200  ,attributes:{"class":"al"}}    //차종
                    ,{field:"modelNm"    ,title:"<spring:message code = 'global.lbl.model'/>"           ,width:300  ,attributes:{"class":"al"}}    //모델
                    ,{field:"ocnNm"      ,title:"<spring:message code = 'global.lbl.ocn'/>"             ,width:250  ,attributes:{"class":"al"}}    //OCN
                    ,{field:"aapEmpNm"   ,title:"<spring:message code = 'global.lbl.proxyNm'/>"         ,width:100  ,attributes:{"class":"ac"}}    //대행자
                   ]
    });



    /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/
     // 그리드 더블클릭 이벤트 ( 그리드 아이디 변경 )
     $("#grid").on("dblclick", "tr.k-state-selected", function (e) {

         var gridId = e.delegateTarget.id
           , grid = $("#"+gridId+"").data("kendoExtGrid")
           , selectedItem = grid.dataItem(grid.select())
         ;



         if ( dms.string.isNotEmpty(selectedItem) ){

             viewDetail(selectedItem);

         } else {

             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }



     });


     // 상세조회 후 팝업오픈
     function viewDetail(selectedVal){

         if( dms.string.isNotEmpty(selectedVal) ){
             // 팝업오픈;
             viewPopup();

             //$("#searchYn").val("N");//고객조회팝업에 대한 open여부
             //$(".form_search").addClass("form_search_disabled");

             $("#vinNo").val(selectedVal.vinNo);
             $("#carRegNo").val(selectedVal.carRegNo);
             $("#carlineCd").val(selectedVal.carlineCd);
             $("#carlineNm").val(selectedVal.carlineNm);
             $("#aapWrkDstinCd").data("kendoExtDropDownList").value(selectedVal.aapWrkDstinCd);
             $("#modelCd").val(selectedVal.modelCd);
             $("#modelNm").val(selectedVal.modelNm);
             $("#ocnCd").val(selectedVal.ocnCd);
             $("#ocnNm").val(selectedVal.ocnNm);
             $("#aapEmpNm").val(selectedVal.aapEmpNm);
             $("#aapDt").data("kendoExtMaskedDatePicker").value(selectedVal.aapDt);
             $("#aapDt").data("kendoExtMaskedDatePicker").enable(false);
             $("#cstAmt").val(selectedVal.cstAmt);
             $("#profitAmt").val(selectedVal.profitAmt);
             $("#aapAmt").val(selectedVal.cstAmt+selectedVal.profitAmt);
             $("#seq").val(selectedVal.seq);

         } else {
             // {상세정보}을(를) 확인하여 주세요.
             dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
             return;
         }


     }


     /*****************************************************************************
     ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
     *******************************************************************************/



});


//조회조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
  if(dms.string.isEmpty(e.data.from.val())){return;}
  if(dms.string.isEmpty(e.data.to.val())){return;}

  var startDt = e.data.from.data("kendoExtMaskedDatePicker").value();
  var endDt = e.data.to.data("kendoExtMaskedDatePicker").value();
  if(startDt > endDt){
      dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
      $(this).data("kendoExtMaskedDatePicker").value(new Date(''));
      $(this).focus();
  }
}

//vin 조회
bf_searchVinNo = function(){
    //if($("#searchYn").val() == 'Y'){
        popupWindow = dms.window.popup({
            windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
            ,title:"<spring:message code='global.title.vehicleMaster' />"
            ,content:{
                url:"<c:url value='/sal/cmm/selectVehicleMasterPopup.do'/>"
                ,data:{
                    "type"  :null
                    ,"autoBind":false
                    ,"callbackFunc":function(data){
                        //alert(kendo.stringify(data[0].carRegNo));
                        $("#vinNo").val(data[0].vinNo);
                        $("#sVinNo").val(data[0].vinNo);

                        $("#carRegNo").val(data[0].carRegNo);
                        $("#carlineNm").val(data[0].carlineNm);
                        $("#carlineCd").val(data[0].carlineCd);
                        $("#modelNm").val(data[0].modelNm);
                        $("#modelCd").val(data[0].modelCd);
                        $("#ocnNm").val(data[0].ocnNm);
                        $("#ocnCd").val(data[0].ocnCd);
                    }
                }
            }
        });
    //}
}


function fnOnblur(id){

    var aapAmt = Number($("#cstAmt").val()) + Number($("#profitAmt").val());

    $("#aapAmt").val(aapAmt);

}



//팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
function viewPopup(){
    var win = $("#aapMngWindow").data("kendoWindow");
    win.center();
    win.open();
}




</script>
<!-- //script -->