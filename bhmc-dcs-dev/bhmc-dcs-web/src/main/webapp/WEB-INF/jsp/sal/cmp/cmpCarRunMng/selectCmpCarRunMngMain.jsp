<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 회사차운행관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.title.comVehicleDrvMgmt" /></h1><!-- 대행업무관리 -->
        <div class="btn_right">
            <button class="btn_m btn_modify" id="btnViewDetail" ><spring:message code='global.btn.update' /><!-- 수정 --></button>
            <button class="btn_m btn_new" id="btnReset"><spring:message code="global.btn.new" /></button><!-- 신규 -->
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            <button class="btn_m btn_delete" id="btnDelete" ><spring:message code='global.btn.del' /></button><!-- 삭제 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:17%;">
                <col style="width:10%;">
                <col style="width:17%;">
                <col style="width:10%;">
                <col style="width:36%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.vinNo' /></th><!-- VIN NO -->
                    <td>
                        <input id="sVinNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carNo' /></th><!-- 차량번호 -->
                    <td>
                        <input id="sCarRegNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code='global.lbl.useTime' /></th><!-- 사용일시 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sUseStartDt" data-type="maskDate" class="form_datetimepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sUseEndDt" data-type="maskDate" class="form_datetimepicker">
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.cmpCarDstinCd' /></th><!-- 회사차유형 -->
                    <td>
                        <input id="sCmpCarDstinCd" type="text" class="form_comboBox" >
                    </td>
                    <td colspan="4"></td>
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


    <section id="cmpCarRunMngWindow" class="pop_wrap">
        <!-- 개별정보 -->
        <div class="header_area">
            <%-- <h2 class="title_basic"><spring:message code='global.title.carInfo' /></h2><!-- 개별정보 --> --%>
            <div class="btn_right">
                <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
            </div>
        </div>
        <form id="detailForm" name="detailForm" method="POST" action="/">
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:15%;">
                    <col style="width:35%;">
                    <col style="width:15%;">
                    <col style="width:35%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.vinNo" /></span></th><!-- VIN NO -->
                        <td class="required_area">
                            <div id="searchVinNo" class="form_search">
                                <input id="vinNo" name="vinNo" type="text" class="form_input" data-json-obj="true" >
                                <a href="javascript:;"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                            </div>
                        </td>
                        <th scope="row"><spring:message code="global.lbl.carNo" /></th><!-- 차량번호 -->
                        <td>
                            <input id="carRegNoOut" name="carRegNoOut" class="form_input form_disabled" disabled>
                            <input id="carRegNo" name="carRegNo"  type="hidden" data-json-obj="true" />
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
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='global.lbl.ocn' /></th><!-- OCN -->
                        <td>
                            <input id="ocnNm" class="form_input form_disabled" disabled>
                            <input id="ocnCd" name="ocnCd" data-json-obj="true" type="hidden"/>
                        </td>
                        <th scope="row"><spring:message code='global.lbl.cmpCarDstinCd' /></th><!-- 회사차구분 -->
                        <td >
                            <input id="cmpCarDstinCdOut" name="cmpCarDstinCdOut" class="form_comboBox form_disabled" disabled>
                            <input id="cmpCarDstinCd" name="cmpCarDstinCd" type="hidden" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.useStartDt' /></span></th><!-- 사용시작일시 -->
                        <td >
                            <input id="useStartDt" name="useStartDt" class="form_datetimepicker" data-json-obj="true" >
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.useEndDt' /></span></th><!-- 사용종료일시 -->
                        <td >
                            <input id="useEndDt" name="useEndDt" class="form_datetimepicker" data-json-obj="true" >
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.startKmVal" /></span></th><!-- 시작km -->
                        <td >
                            <input id="useStartKmVal" name="useStartKmVal" class="form_input"  type="number" value="0" onblur="fnOnblur(this.id);" data-json-obj="true" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="global.lbl.endKmVal" /></span></th><!-- 종료km -->
                        <td >
                            <input id="useEndKmVal" name="useEndKmVal" class="form_input"  type="number" value="0" onblur="fnOnblur(this.id);" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='global.lbl.user' /></span></th><!-- 사용자 -->
                        <td >
                            <div id="searchUsrId" class="form_search">
                                <input id="usrNm" name="usrNm" type="text"  class="form_input">
                                <a href="javascript:;"><spring:message code='global.lbl.search' /></a><!-- 검색 -->
                            </div>
                            <input id="usrId" name="usrId" type="hidden"  class="form_input" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.remark" /></th><!-- 비고 -->
                        <td colspan="3">
                            <input id="remark" name="remark" class="form_input" data-json-obj="true" />
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
var oneDay = "${oneDay}"+" 00:00:00";   // 해당월 1일
var lastDay = "${lastDay}"+" 00:00:00"; // 해당월 마지막일자
var toDay = "${toDay}"+" 00:00:00";     // 오늘 일자


//회사차구분 Array
var cmpCarDstinCd = [];
<c:forEach var="obj" items="${cmpCarDstinCdList}">
    cmpCarDstinCd.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//회사차구분 Map
var cmpCarDstinCdMap = dms.data.arrayToMap(cmpCarDstinCd, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    /*
     * max 500으로 지정. 여백이 있는경우는 줄여야함
     */

     $("#cmpCarRunMngWindow").kendoWindow({
         animation:false
         ,draggable:false
         ,modal:true
         ,resizable:false
         ,visible:false
         ,title:"<spring:message code='sal.lbl.detailSearch' />"      // 상세정보
         ,width:"750px"
         ,height:"500px"
     }).data("kendoWindow");


    //조회조건 - 회사차유형
    $("#sCmpCarDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:cmpCarDstinCd,
        optionLabel:" "                        // 전체
    });

    //조회조건 - 사용일시(기간)- START
    $("#sUseStartDt").kendoDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:oneDay
    });

    //조회조건 - 대행일(기간)- END
    $("#sUseEndDt").kendoDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:lastDay
    });

    // 조회조건 - 시작일, 종료일
    $("#sUseStartDt").on('change', {from:$("#sUseStartDt"), to:$("#sUseEndDt")}, fnChkSearchDate);
    $("#sUseEndDt").on('change',   {from:$("#sUseStartDt"), to:$("#sUseEndDt")}, fnChkSearchDate);


    /*************************** 검색 조건 영역 END **************************************************/


    //개별정보 - 회사차구분
    $("#cmpCarDstinCdOut").kendoExtDropDownList({
        dataTextField:"cmmCdNm",
        dataValueField:"cmmCd",
        dataSource:cmpCarDstinCd,
        index:-1
    });


    //개별정보 - 시작일시
    $("#useStartDt").kendoDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:toDay
    });


    //개별정보 - 종료일시
    $("#useEndDt").kendoDateTimePicker({
        format:"<dms:configValue code='dateFormat' /> HH:mm"
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
            viewPopup();

            $("#useStartDt").data("kendoDateTimePicker").enable(true);
            $("#useEndDt").data("kendoDateTimePicker").enable(true);
            $("#useStartKmVal").prop("disabled","").removeClass("form_disabled");
            $("#useEndKmVal").prop("disabled","").removeClass("form_disabled");

            var grid = $("#grid").data("kendoExtGrid");
            grid.clearSelection();

            $("#vinNo").val("");
            $("#carRegNoOut").val("");
            $("#carRegNo").val("");
            $("#carlineCd").val("");
            $("#carlineNm").val("");
            $("#cmpCarDstinCdOut").data("kendoExtDropDownList").value("");
            $("#cmpCarDstinCd").val("");
            $("#modelCd").val("");
            $("#modelNm").val("");
            $("#ocnCd").val("");
            $("#ocnNm").val("");
            $("#usrId").val("");
            $("#usrNm").val("");
            $("#useStartDt").data("kendoDateTimePicker").value(toDay);
            $("#useEndDt").data("kendoDateTimePicker").value(toDay);
            $("#useStartKmVal").val(0);
            $("#useEndKmVal").val(0);
            $("#remark").val("");

            $("#btnSave").show();
        }

    });


    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){

            // 조회조건 일자
            if( ($("#sUseStartDt").data("kendoDateTimePicker").value() != null && $("#sUseEndDt").data("kendoDateTimePicker").value() == null)
                ||($("#sUseEndDt").data("kendoDateTimePicker").value() != null && $("#sUseStartDt").data("kendoDateTimePicker").value() == null)){
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

            //vinNo 필수입력
            if ( dms.string.isEmpty($("#vinNo").val())){
                dms.notification.warning("<spring:message code='global.lbl.vinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#vinNo").focus();
                return false;
            }

            //사용자 필수입력
            if ( dms.string.isEmpty($("#usrId").val())){
                dms.notification.warning("<spring:message code='global.lbl.user' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#usrId").focus();
                return false;
            }

            //시작일시 필수입력
            if ( dms.string.isEmpty($("#useStartDt").val())){
                dms.notification.warning("<spring:message code='global.lbl.useStartDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#useStartDt").focus();
                return false;
            }

            //종료일시 필수입력
            if ( dms.string.isEmpty($("#useEndDt").val())){
                dms.notification.warning("<spring:message code='global.lbl.useEndDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#useEndDt").focus();
                return false;
            }

            //시작km 필수입력
            if ( $("#useStartKmVal").val() == 0){
                dms.notification.warning("<spring:message code='global.lbl.startKmVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#useStartKmVal").focus();
                return false;
            }

            //종료km 필수입력
            if ( $("#useEndKmVal").val() == 0){
                dms.notification.warning("<spring:message code='global.lbl.endKmVal' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#useEndKmVal").focus();
                return false;
            }

            var param = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));
            param.useStartDt = $("#useStartDt").data("kendoDateTimePicker").value();
            param.useEndDt = $("#useEndDt").data("kendoDateTimePicker").value();

            var grid = $("#grid").data("kendoExtGrid");
            if(grid.select().index() == -1){
                param.gb = "I";
            }else {
                param.gb = "U";
            }


            $.ajax({
                url:"<c:url value='/sal/cmp/cmpCarRunMng/saveCmpCarRunMng.do' />",
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                data:JSON.stringify(param),
                error:function(jqXHR,status,error){
                    console.log(jqXHR);
                },
                success:function(data){
                    if(data == '1'){
                        $("#grid").data("kendoExtGrid").dataSource.read();
                        // 저장이 완료되었습니다.
                        dms.notification.success("<spring:message code='global.lbl.save' var='globalLblSave' /><spring:message code='global.info.successMsg' arguments='${globalLblSave}' />");
                    }else if(data == '0'){
                        //dms.notification.warning("선택된 차량은 해당 시간에 이미 운행되였습니다.차량/시간을 다시 확인해주세요.");
                        dms.notification.warning("<spring:message code='sal.err.chkOverlapTime'/>");
                    }else if(data == '2'){
                        //dms.notification.success("선택된 차량은 이미 입력한 시작km보다 더 운행되였습니다. 시작 km를 확인해주세요.");
                        dms.notification.warning("<spring:message code='sal.err.chkMaxKmVal'/>");
                    }
                }
            });

        }
    });


    // 삭제
    $("#btnDelete").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var selectIdx = grid.select().index();
            var selectedItem = grid.dataItem(grid.select());

            if(selectIdx ==  -1 ){
              //삭제할 데이터가 존재하지 않습니다.
                dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.notExistData' arguments='${del},' />");
                return false;
            }

            // 삭제하시겠습니까?
            if (confirm("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.cnfrmMsg' arguments='${del},' />") == false ){    //삭제하시겠습니까?
                return false;
            }else{

                var data = {};
                data["vinNo"] = selectedItem.vinNo;                                             // VIN NO
                data["useStartDt"] = selectedItem.useStartDt;                                   // 사용일시 - 시작일

                $.ajax({
                    url:"<c:url value='/sal/cmp/cmpCarRunMng/deleteCmpCarRunMng.do' />",
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    data:JSON.stringify(data),
                    error:function(jqXHR,status,error){
                        console.log(jqXHR);
                    },
                    success:function(data){
                        dms.notification.warning("<spring:message code='global.lbl.del' var='del' /><spring:message code='global.info.successMsg' arguments='${del},' />");
                        //삭제가 완료되었습니다.
                        grid.dataSource.read();
                    }
                });

            }

        }
    });

    /*******************  //버튼   *******************************************/



    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-113306"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/cmp/cmpCarRunMng/selectCmpCarRunMng.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sUseStartDt"]= $("#sUseStartDt").data("kendoDateTimePicker").value();           // 사용일시 - 시작일
                        params["sUseEndDt"]  = $("#sUseEndDt").data("kendoDateTimePicker").value();             // 사용일시 - 종료일
                        params["sVinNo"]     = $("#sVinNo").val();                                              // VIN NO
                        params["sCarRegNo"]  = $("#sCarRegNo").val();                                           // 차량번호
                        params["sCmpCarDstinCd"] = $("#sCmpCarDstinCd").data("kendoExtDropDownList").value()       // 회사차유형

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {

                    $("#useStartDt").data("kendoDateTimePicker").enable(true);
                    $("#useEndDt").data("kendoDateTimePicker").enable(true);
                    $("#useStartKmVal").prop("disabled","").removeClass("form_disabled");
                    $("#useEndKmVal").prop("disabled","").removeClass("form_disabled");

                    $("#vinNo").val("");
                    $("#carRegNoOut").val("");
                    $("#carRegNo").val("");
                    $("#carlineCd").val("");
                    $("#carlineNm").val("");
                    $("#cmpCarDstinCdOut").data("kendoExtDropDownList").value("");
                    $("#modelCd").val("");
                    $("#modelNm").val("");
                    $("#ocnCd").val("");
                    $("#ocnNm").val("");
                    $("#usrId").val("");
                    $("#usrNm").val("");
                    $("#useStartDt").data("kendoDateTimePicker").value(toDay);
                    $("#useEndDt").data("kendoDateTimePicker").value(toDay);
                    $("#useStartKmVal").val(0);
                    $("#useEndKmVal").val(0);
                    $("#remark").val("");


                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                        vinNo          :{type:"string"}
                        ,carRegNo      :{type:"string"}
                        ,cmpCarDstinCd :{type:"string"}
                        ,usrNm         :{type:"string"}
                        ,useStartDt    :{type:"date"}
                        ,useEndDt      :{type:"date"}
                        ,useStartKmVal :{type:"number"}
                        ,useStartKmVal :{type:"number"}
                        ,carlineNm     :{type:"string"}
                        ,modelNm       :{type:"string"}
                        ,ocnNm         :{type:"string"}
                        ,remark        :{type:"string"}
                        ,regUsrId      :{type:"string"}
                        ,regDt         :{type:"date"}
                    }
                }
            }
        }
        ,editable:false
        //,autoBind:false
        //,height  :450
        ,change:function(e) {

            if(this.select().length != 0){
                var selectedItem = this.dataItem(this.select());
                var vinNo = selectedItem.vinNo;

                if ( dms.string.isNotEmpty(vinNo) ) {
                    $("#btnViewDetail").data("kendoButton").enable(true);
                }

            };
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
                    {field:"vinNo"         ,title:"<spring:message code = 'global.lbl.vinNo'/>"       ,width:150 ,attributes:{"class":"ac"}}    //VIN NO
                    ,{field:"carRegNo"     ,title:"<spring:message code = 'global.lbl.carRegNo'/>"    ,width:130 ,attributes:{"class":"ac"}}    //차량번호
                    ,{field:"cmpCarDstinCd",title:"<spring:message code = 'global.lbl.cmpCarDstinCd'/>",width:80  ,attributes:{"class":"ac"}    //회사차구분
                        ,template:"# if(cmpCarDstinCdMap[cmpCarDstinCd] != null) { # #= cmpCarDstinCdMap[cmpCarDstinCd].cmmCdNm# # }#"
                     }
                    ,{field:"usrNm"        ,title:"<spring:message code = 'global.lbl.user'/>"        ,width:80 ,attributes:{"class":"ac"}}    //사용자
                    ,{field:"useStartDt"   ,title:"<spring:message code = 'global.lbl.useStartDt'/>"  ,width:150 ,attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateTimeFormat' />}"}   //시작일시
                    ,{field:"useEndDt"     ,title:"<spring:message code = 'global.lbl.useEndDt'/>"    ,width:150 ,attributes:{"class":"ac"}, format:"{0:<dms:configValue code='dateTimeFormat' />}"}   //종료일시
                    ,{field:"useStartKmVal",title:"<spring:message code = 'global.lbl.startKmVal'/>"  ,width:70 ,attributes:{"class":"ar"}, format:"{0:##,###}"} //시작km
                    ,{field:"useEndKmVal"  ,title:"<spring:message code = 'global.lbl.endKmVal'/>"    ,width:70 ,attributes:{"class":"ar"}, format:"{0:##,###}"} //종료km
                    ,{field:"carlineNm"    ,title:"<spring:message code = 'global.lbl.carLine'/>"     ,width:100 ,attributes:{"class":"al"}}    //차종
                    ,{field:"modelNm"      ,title:"<spring:message code = 'global.lbl.model'/>"       ,width:150 ,attributes:{"class":"al"}}    //모델
                    ,{field:"ocnNm"        ,title:"<spring:message code = 'global.lbl.ocn'/>"         ,width:150 ,attributes:{"class":"al"}}    //OCN
                    ,{field:"remark"       ,title:"<spring:message code = 'global.lbl.remark'/>"      ,width:200 ,attributes:{"class":"al"}}    //비고
                    ,{field:"regDt"        ,title:"<spring:message code = 'global.lbl.regDt'/>"       ,width:80  ,attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"}    //등록일
                    ,{field:"regUsrId"     ,title:"<spring:message code = 'global.lbl.regUsrId'/>"    ,width:80 ,attributes:{"class":"ac"}}    //등록자
                   ]
    });


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

         $("#vinNo").val(selectedVal.vinNo);
         $("#carRegNoOut").val(selectedVal.carRegNo);
         $("#carRegNo").val(selectedVal.carRegNo);
         $("#carlineCd").val(selectedVal.carlineCd);
         $("#carlineNm").val(selectedVal.carlineNm);
         $("#cmpCarDstinCdOut").data("kendoExtDropDownList").value(selectedVal.cmpCarDstinCd);
         $("#cmpCarDstinCd").val(selectedVal.cmpCarDstinCd);
         $("#modelCd").val(selectedVal.modelCd);
         $("#modelNm").val(selectedVal.modelNm);
         $("#ocnCd").val(selectedVal.ocnCd);
         $("#ocnNm").val(selectedVal.ocnNm);
         $("#usrId").val(selectedVal.usrId);
         $("#usrNm").val(selectedVal.usrNm);
         $("#useStartDt").data("kendoDateTimePicker").value(selectedVal.useStartDt);
         $("#useEndDt").data("kendoDateTimePicker").value(selectedVal.useEndDt);
         $("#useStartKmVal").val(selectedVal.useStartKmVal);
         $("#useEndKmVal").val(selectedVal.useEndKmVal);
         $("#remark").val(selectedVal.remark);

         $("#useStartKmVal").prop("disabled","disabled").removeClass("form_disabled");
         $("#useEndKmVal").prop("disabled","disabled").removeClass("form_disabled");
         $("#useStartDt").data("kendoDateTimePicker").enable(false);
         $("#useEndDt").data("kendoDateTimePicker").enable(false);

         $("#btnSave").hide();

         //$("#searchVinNo").addClass("form_search_disabled");

     } else {
         // {상세정보}을(를) 확인하여 주세요.
         dms.notification.success("<spring:message code='global.lbl.dtlInfo' var='arguMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${arguMsg}'/>");
         return;
     }


 }


 /*****************************************************************************
 ************************** 그리드 팝업 호출 / 더블클릭 이벤트 ****************************
 *******************************************************************************/






//조회조건:시작일-종료일 날짜 비교
fnChkSearchDate = function(e){
  if(dms.string.isEmpty(e.data.from.val())){return;}
  if(dms.string.isEmpty(e.data.to.val())){return;}

  var startDt = e.data.from.data("kendoDateTimePicker").value();
  var endDt = e.data.to.data("kendoDateTimePicker").value();
  if(startDt > endDt){
      dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
      $(this).data("kendoDateTimePicker").value(new Date(''));
      $(this).focus();
  }
}




//차량마스터팝업 열기 함수.
$("#searchVinNo").click(function(){

    popupWindow = dms.window.popup({
        windowId:"vehicleMasterStsPopupWin"    // 판매 - 차량마스터관리 조회 팝업
        ,title:"<spring:message code='global.title.vehicleMaster' />"
        ,height:"410px"
        ,width :"650px"
        ,content:{
            url:"<c:url value='/sal/cmm/selectVehicleMasterPopup.do'/>"
            ,data:{
                "type"  :null
                ,"autoBind":false
                ,"pageGubun":"cmpRunMng"
                ,"cmpCarYn":"Y"
                ,"callbackFunc":function(data){
                    //alert(kendo.stringify(data[0].carRegNo));
                    //alert(data[0].cmpCarYn);

                    if(data[0].cmpCarYn == 'Y'){
                        $("#vinNo").val(data[0].vinNo);
                        $("#carRegNoOut").val(data[0].carRegNo);
                        $("#carRegNo").val(data[0].carRegNo);
                        $("#carlineNm").val(data[0].carlineNm);
                        $("#carlineCd").val(data[0].carlineCd);
                        $("#modelNm").val(data[0].modelNm);
                        $("#modelCd").val(data[0].modelCd);
                        $("#ocnNm").val(data[0].ocnNm);
                        $("#ocnCd").val(data[0].ocnCd);
                        $("#cmpCarDstinCdOut").data("kendoExtDropDownList").value(data[0].cmpCarDstinCd);
                        $("#cmpCarDstinCd").val(data[0].cmpCarDstinCd);
                    }else {
                        //dms.notification.warning("회사차여부가 Y인 차량만 선택가능 합니다.");
                        dms.notification.warning("<spring:message code='sal.err.checkCmpCarYn'/>");
                        return false;
                    }
                }
            }
        }
    });
});


var userSearchPopupWin;
//고객 팝업 열기 함수.
$("#searchUsrId").click(function(){

    userSearchPopupWin = dms.window.popup({
        windowId:"userSearchPopupWin"
        ,title:"<spring:message code='cmm.title.user.search'/>"   // 사용자 조회
        ,height:"400px"
        ,width :"650px"
        ,content:{
            url:"<c:url value='/cmm/sci/commonPopup/selectUserPopup.do'/>"
            , data:{
                "autoBind":false
                ,"usrNm":""
                ,"callbackFunc":function(data){
                    if(data[0] != undefined){
                        $("#usrId").val(data[0].usrId);
                        $("#usrNm").val(data[0].usrNm);
                    }
                }
            }
        }

    });
});



function fnOnblur(id){
    var startVal = Number($("#useStartKmVal").val());
    var endVal = Number($("#useEndKmVal").val());


    if(startVal >= endVal && startVal != 0 && endVal != 0 ){

        if(id == 'useStartKmVal'){
            dms.notification.error("<spring:message code='global.lbl.startKmVal' var='useStartKmVal' /><spring:message code='global.lbl.endKmVal' var='useEndKmVal' /><spring:message code='sal.info.chkMin' arguments='${useStartKmVal},${useEndKmVal}'/>");
            $("#useStartKmVal").val(0);
            $("#useStartKmVal").focus();
        }else {
            dms.notification.error("<spring:message code='global.lbl.startKmVal' var='useStartKmVal' /><spring:message code='global.lbl.endKmVal' var='useEndKmVal' /><spring:message code='sal.info.chkMax' arguments='${useEndKmVal},${useStartKmVal}'/>");
            $("#useEndKmVal").val(0);
            $("#useEndKmVal").focus();
        }
    }
}



//팝업 오픈 ( 상세조회 후 팝업오픈 / 신규등록 팝업오픈)
function viewPopup(){
    var win = $("#cmpCarRunMngWindow").data("kendoWindow");
    win.center();
    win.open();
}


</script>
<!-- //script -->