<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>

<div id="resizableContainer">
    <section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='crm.menu.membershipPointExtMng'/><!-- 포인트 소멸관리--></h1>
        <div class="btn_right">
        </div>
    </div>

    <!-- 탭메뉴 전체 영역 -->
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="pointExtTab" class="k-state-active"><spring:message code='crm.menu.membershipPointExt'/><!-- 포인트소멸 예정관리 --></li>
            <li id="pointHisTab" ><spring:message code='crm.menu.membershipPointHisMng'/><!-- 포인트 소멸 이력관리 --></li>
        </ul>
        <div class="mt0">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11354" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s" id="btnExcelExportExt"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11355" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_search" id="btnSearchExt"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnSearchExt" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.pointExtcExpcDt'/></span></th><!-- 포인트소멸예정일 -->
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartPointExtcExpcDt" name="sStartPointExtcExpcDt" value="" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndPointExtcExpcDt" name="sEndPointExtcExpcDt" value="" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"> </th>
                                <td>
                                </td>
                                <th scope="row"> </th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div> <!-- end table -->
                <div class="numberOf_box_left mt10">
                    <ul>
                        <li class="ico02"><p style="padding-top: 2px;"><spring:message code="crm.lbl.pointExtUsrCnt" /> : <span id="pointCnt1"><strong>0</strong></span><spring:message code="global.lbl.cnt" /><!-- 대상고객수 : {}건 --></p></li>
                        <li class="ico03"><p style="padding-top: 2px;"><spring:message code="crm.lbl.rmnPointVal" /> : <span id="pointCnt2"><strong>0</strong></span><spring:message code="crm.lbl.point" /><!-- 현시점 포인트 : {}포인트 --></p></li>
                        <li class="ico05"><p style="padding-top: 2px;"><spring:message code="crm.lbl.pointExpecExtincVal" /> : <span id="pointCnt3"><strong>0</strong></span><spring:message code="crm.lbl.point" /><!-- 소멸 예상 포인트 : {}포인트 --></p></li>
                    </ul>
                </div>
                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.extcCustList' /><!-- 소멸고객목록 --></h2>
                </div>
                <div class="table_grid">
                    <div id="pointExtGrid" class="resizable_grid"></div>
                </div>
            </section>
        </div>
        <div class="mt0">
            <section class="group">
                <div class="header_area">
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11357" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s" id="btnExcelExportHis"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11358" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_s btn_search" id="btnSearchHis"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnSearchHis" >
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:10%;">
                            <col style="width:20%;">
                            <col style="width:10%;">
                            <col style="width:23%;">
                            <col style="width:10%;">
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><span class="bu_required"><spring:message code='crm.lbl.pointExtcDt'/></span><!-- 소멸일 --></th>
                                <td>
                                    <div class="form_float">
                                        <div class="date_left">
                                            <input id="sStartDt" name="sStartDt" value="" class="form_datepicker">
                                            <span class="txt_from">~</span>
                                        </div>
                                        <div class="date_right">
                                            <input id="sEndDt" name="sEndDt" value="" class="form_datepicker">
                                        </div>
                                    </div>
                                </td>
                                <th scope="row"></th>
                                <td>
                                </td>
                                <th scope="row"> </th>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div> <!-- end table -->

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.extcHistory' /><!-- 소멸 이력 --></h2>
                </div>

                <div class="table_grid">
                    <div id="pointHisGrid" ></div>
                </div>

                <div class="header_area">
                    <h2 class="title_basic"><spring:message code='crm.title.extcCustList' /><!-- 소멸고객 목록 --></h2>
                </div>

                <div class="table_grid">
                    <div id="pointUsrGrid"  class="resizable_grid" data-offset="-279"></div>
                </div>
            </section>
        </div>
    </div>

    </section>
      <!-- //기본정보 -->
</div> <!-- // resizableContainer Div -->


<!-- script 시작  -->
<script type="text/javascript" charset="UTF-8">

    function gridPointExtCommonParams() {
        // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
        var params = {};

        params["sExtcDt"] = $("#sStartPointExtcExpcDt").data("kendoExtMaskedDatePicker").value();
        params["sExtcEndDt"] = $("#sEndPointExtcExpcDt").data("kendoExtMaskedDatePicker").value();

        return params;

    };


    function gridPointHisCommonParams() {
        // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
        var params = {};

        var grid = $("#pointHisGrid").data('kendoExtGrid');
        var selectedItem = grid.dataItem(grid.select());

        if ( dms.string.isNotEmpty(selectedItem) ) {

            params["sPointExtcDt"] = kendo.parseDate(selectedItem.pointExtcDtStr, "<dms:configValue code='dateFormat' />");

        }

        return params;

    };


    $(document).ready(function() {

        // 탭영역 지정
        $("#tabstrip").kendoExtTabStrip({
            animation:false
            ,select: function(e){

                var selectedTabId = $(e.item).attr("id");

                if ( selectedTabId === "pointExtTab" ) {//소멸고객 목록

                    $("#pointExtGrid").data("kendoExtGrid").dataSource.page(1);

                } else if ( selectedTabId === "pointHisTab" ) { //소멸이력

                    $("#pointHisGrid").data("kendoExtGrid").dataSource.page(1);

                };


            }
        });

        //포인트 소멸예정일
        $("#sStartPointExtcExpcDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:new Date("${year}","${month}","${day}")
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sEndPointExtcExpcDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:new Date("${year}","${month}","${lastDay}")
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sStartPointExtcExpcDt").data("kendoExtMaskedDatePicker").min(new Date("${year}","${month}","${day}"));
        $("#sEndPointExtcExpcDt").data("kendoExtMaskedDatePicker").min(new Date("${year}","${month}","${day}"));

        //소멸일
        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:new Date("${year}","${month}",1)
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        //소멸일
        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,value:new Date("${year}","${month}","${lastDay}")
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        //버튼 - 소멸예정 - 조회
        $("#btnSearchExt").kendoButton({
            click:function(e){

                var params = {};
                params["sExtcDt"] = $("#sStartPointExtcExpcDt").data("kendoExtMaskedDatePicker").value();
                params["sExtcEndDt"] = $("#sEndPointExtcExpcDt").data("kendoExtMaskedDatePicker").value();

                var url = "<c:url value='/crm/dmm/membershipPointExt/selectMembershipPointExtTotalCnt.do' />";

                if(dms.string.isEmpty($("#sStartPointExtcExpcDt").data("kendoExtMaskedDatePicker").value())){
                    //dms.notification.info("소멸예정일은(는) 필수 입력사항 입니다.");
                    dms.notification.info("<spring:message code='crm.lbl.pointExtcExpcDt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                    return;
                }
                if(dms.string.isEmpty($("#sEndPointExtcExpcDt").data("kendoExtMaskedDatePicker").value())){
                    //dms.notification.info("소멸예정일은(는) 필수 입력사항 입니다.");
                    dms.notification.info("<spring:message code='crm.lbl.pointExtcExpcDt' var='init' /><spring:message code='global.info.required.field' arguments='${init}' />");
                    return;
                }
                $("#pointExtGrid").data("kendoExtGrid").dataSource.page(1);

            }
        });

        setKendoDate = function( dtValue){
            return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
        };

        //버튼 - 소멸예정 - 엑셀
        $("#btnExcelExportExt").kendoButton({
            click:function(e) {

                var params = {};
                params = gridPointExtCommonParams();

                // 포인트 소멸예정 엑셀Export 수량 데이터를 조회한다.
                $.ajax({
                    url:"<c:url value='/crm/dmm/membershipPointExt/selectMembershipPointExtsExcelExportCnt.do' />",
                    data:JSON.stringify(params),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(resultCnt) {

                        //console.log("resultCnt : ",resultCnt)
                        <c:set value="10000" var="maxCnt" />;
                        var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                        if ( resultCnt > excelMaxExportCnt ) {
                            // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                            dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                            return;
                        } else if ( resultCnt < 1 ) {

                            // {목록} 정보가 없습니다.
                            dms.notification.warning("<spring:message code='global.title.list' var='returnMsg' /><spring:message code='crm.info.noinfoData' arguments='${returnMsg}' />");
                            return;
                        }

                        dms.ajax.excelExport({
                            "beanName":"membershipPointExtService"
                            ,"sStartPointExtcExpcDt":setKendoDate($("#sStartPointExtcExpcDt").data("kendoExtMaskedDatePicker").value())
                            ,"sEndPointExtcExpcDt":setKendoDate($("#sEndPointExtcExpcDt").data("kendoExtMaskedDatePicker").value())
                            ,"templateFile":"MembershipPointExt_Tpl.xlsx"
                            ,"fileName":"预计积分失效客户目录.xlsx"
                        });

                    }
                });

            }
            ,enable:false
        });

        //버튼 - 소멸이력관리 조회
        $("#btnSearchHis").kendoButton({
            click:function(e){

                if(dms.string.isEmpty($("#sStartDt").val())){
                    //시작일을 입력해 주세요.
                    dms.notification.warning("<spring:message code='crm.lbl.startDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }

                if(dms.string.isEmpty($("#sEndDt").val())){
                    //종료일을 입력해 주세요.
                    dms.notification.warning("<spring:message code='crm.lbl.endDt' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                    return;
                }
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    $("#pointHisGrid").data("kendoExtGrid").dataSource.page(1);
                    $("#pointUsrGrid").data("kendoExtGrid").dataSource.data([]);
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                    return false;
                }
            }
        });

        //버튼 - 소멸이력관리 - 엑셀저장
        $("#btnExcelExportHis").kendoButton({
            click:function(e) {

                var grid = $("#pointHisGrid").data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());

                if ( dms.string.isEmpty(selectedItem) ) {
                    //소멸이력을(를) 선택하세요.
                    dms.notification.warning("<spring:message code='crm.title.extcHistory' var='returnMsg' /><spring:message code='global.info.check.field' arguments='${returnMsg}' />");
                    return;
                } else {

                    var params = {};
                    params = gridPointHisCommonParams();

                    // 포인트 소멸 이력 엑셀Export 수량 데이터를 조회한다.
                    $.ajax({
                        url:"<c:url value='/crm/dmm/membershipPointHisMng/selectMembershipPointHisMngUsrsExcelExportCnt.do' />",
                        data:JSON.stringify(params),
                        type:'POST',
                        dataType:'json',
                        contentType:'application/json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(resultCnt) {

                            //console.log("resultCnt : ",resultCnt)
                            <c:set value="10000" var="maxCnt" />;
                            var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                            if ( resultCnt > excelMaxExportCnt ) {
                                // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                                dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                                return;
                            } else if ( resultCnt < 1 ) {
                                // {목록} 정보가 없습니다.
                                dms.notification.warning("<spring:message code='global.title.list' var='returnMsg' /><spring:message code='crm.info.noinfoData' arguments='${returnMsg}' />");
                                return;
                            }

                            dms.ajax.excelExport({
                                "beanName":"membershipPointHisMngService"
                                ,"templateFile":"MembershipPointDel_Tpl.xlsx"
                                ,"fileName":"积分失效记录.xlsx"
                                ,"sPointExtcDt":selectedItem.pointExtcDtStr
                            });

                        }

                    });

                }

            }
            ,enable:false
        });

        // 소멸고객 목록 그리드
        $("#pointExtGrid").kendoExtGrid({
            gridId:"G-CRM-0316-093900"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipPointExt/selectMembershipPointExts.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;
                            params = $.extend(params, gridPointExtCommonParams());
//                            console.log(params);
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                        model:{
                            id:"pointHisSeq"
                            ,fields:{
                                rnum:{type:"number", editable:false}
                                ,occrDt:{type:"date"}   // 발생일
                                ,occrDtFormat:{type:"date"}   // 발생일
                                ,extcDt:{type:"date"}   // 포인트소멸예정일
                                ,extcDtFormat:{type:"date"}   // 포인트소멸예정일
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.occrDtFormat  = kendo.parseDate(elem.occrDt, "<dms:configValue code='dateFormat' />");
                                    elem.extcDtFormat  = kendo.parseDate(elem.extcDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,dataBound:function (e) {

                if ( e.sender.dataSource._total > 0  ) {
                    $("#btnExcelExportExt").data("kendoButton").enable(true);
                } else {
                    $("#btnExcelExportExt").data("kendoButton").enable(false);
                };

                var params = {};
                params["sExtcDt"] = $("#sStartPointExtcExpcDt").data("kendoExtMaskedDatePicker").value();
                params["sExtcEndDt"] = $("#sEndPointExtcExpcDt").data("kendoExtMaskedDatePicker").value();

                $.ajax({
                    url:"<c:url value='/crm/dmm/membershipPointExt/selectMembershipPointExtTotalCnt.do' />"
                    ,data:JSON.stringify(params)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR,status,error){
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(result){

                        var pointExtUsrCnt = result.totalScore.pointExtUsrCnt;
                        var totalExtcPointVal = result.totalScore.totalExtcPointVal;
                        var totalRmnPointVal = result.totalScore.totalRmnPointVal;

                        pointExtUsrCnt == 0 ? "0":pointExtUsrCnt;
                        totalExtcPointVal == 0 ? "0":totalExtcPointVal;
                        totalRmnPointVal == 0 ? "0":totalRmnPointVal;

                        $("#pointCnt1").html("<strong>"+pointExtUsrCnt+"</strong>");
                        $("#pointCnt2").html("<strong>"+totalExtcPointVal+"</strong>");
                        $("#pointCnt3").html("<strong>"+totalRmnPointVal+"</strong>");

                    }
                });


            }
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:380
            ,editable:false
            ,autoBind:true
            ,selectable:"row"
            ,columns:[
                 {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, attributes:{"class":"ac"}} //번호
                ,{field:"dlrCd", title:"<spring:message code='global.lbl.pointCont'/>", attributes:{"class":"ac"}, hidden:true } //딜러코드
                ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo'/>", attributes:{"class":"ac"}, width:150 } //멤버십 번호
                ,{field:"pointCdNm", title:"<spring:message code='crm.lbl.pointCdCont'/>", attributes:{"class":"ac"}, width:100   //포인트 출처
                    ,sortable:false
                }
                ,{field:"occrDtFormat", title:"<spring:message code='global.lbl.arDt' />", width:100   //발생일
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (occrDtFormat !== null ){# #= kendo.toString(data.occrDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"occrPointVal", title:"<spring:message code='global.lbl.arPoint'/>", width:100,attributes:{"class":"ar"}    //발생포인트
                    ,format:"{0:n0}"
                    ,decimal:0
                }
                ,{field:"extcDtFormat", title:"<spring:message code='crm.lbl.pointExtcExpcDt' />", width:100   //포인트소멸예정일
                    ,attributes:{"class":"ac tooltip-disabled"}
                    ,template:"#if (extcDtFormat !== null ){# #= kendo.toString(data.extcDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                }
                ,{field:"extcTargPointVal", title:"<spring:message code='crm.lbl.extcPointVal'/>", width:100,attributes:{"class":"ar"}  //소멸 포인트
                    ,format:"{0:n0}"
                    ,decimal:0
                }
                ,{field:"prsnNm", title:"<spring:message code='crm.lbl.prsNm'/>", width:100,attributes:{"class":"ac"} } //책임자
                ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100,attributes:{"class":"ac"}} //고객명
                ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", width:100,attributes:{"class":"ac"}} //이동전화
                ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo'/>", width:100,attributes:{"class":"ac"}}//고전(유선)전화
            ]
        });

        // 소멸이력 그리드
        $("#pointHisGrid").kendoExtGrid({
            gridId:"G-CRM-0828-182904"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipPointHisMng/selectMembershipPointHisMngs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params["sStartDt"]    = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
                            params["sEndDt"]      = $("#sEndDt").data("kendoExtMaskedDatePicker").value();

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
                                ,dlrCd:{type:"string"}
                                ,pointExtcDtStr:{type:"string"}
                                ,pointExtUsrCnt:{type:"number"}
                                ,extcPointVal:{type:"number"}
                            }
                        }
                }
            }
            ,change:function(e){
                $("#pointUsrGrid").data("kendoExtGrid").dataSource.read();
                $("#btnExcelExportHis").data("kendoButton").enable(true);
            }
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            ,height:300
            ,editable:false
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,selectable:"row"
            ,columns:[
               {field:"rnum", title:"no" ,width:100,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", width:100, hidden:true}// 딜러코드
               ,{field:"pointExtcDtStr", title:"<spring:message code='crm.lbl.pointExtcDt' />", width:100,attributes:{"class":"ac"}}// 소멸일
               ,{field:"pointExtUsrCnt", title:"<spring:message code='crm.lbl.pointExtUsrCnt'/>", width:100, attributes:{"class":"ar"}
                   ,format:"{0:n0}"
               }// 대상고객수
               ,{field:"extcPointVal", title:"<spring:message code='crm.lbl.extcPointVal' />", width:100, attributes:{"class":"ar"}
                   ,format:"{0:n0}"
               }// 소멸 포인트
            ]
        });


        // 소멸고객 목록 그리드
        $("#pointUsrGrid").kendoExtGrid({
            gridId:"G-CRM-0828-182843"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/membershipPointHisMng/selectMembershipPointHisMngUsrs.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            var grid = $("#pointHisGrid").data('kendoExtGrid');
                            var selectedItem = grid.dataItem(grid.select());

                            params["recordCountPerPage"]    = options.pageSize;
                            params["pageIndex"]             = options.page;
                            params["firstIndex"]            = options.skip;
                            params["lastIndex"]             = options.skip + options.take;
                            params["sort"]                  = options.sort;

                            params = $.extend(params, gridPointHisCommonParams());

                            //console.log(params);
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
                                ,regDt:{type:"date"}
                                ,extcPointVal:{type:"number"}
                                ,regDtFormat:{type:"date",   editable:false} //수정일자
                            }
                        }
                        ,parse:function(d) {
                            if(d.data){
                                $.each(d.data, function(idx, elem) {
                                    elem.regDtFormat  = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                                });
                            }
                            return d;
                        }
                }
            }
            ,multiSelectWithCheckbox:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:fa
            //,height:300
            ,editable:false
            /* ,editable:{
                 mode:"incell"
                ,confirmation:false
            } */
            ,autoBind:false
            ,selectable:"row"
            ,columns:[
               {field:"rnum", title:"no" ,width:100,attributes:{"class":"ac"}}// 캠페인코드
               ,{field:"dlrCd", title:"<spring:message code='global.lbl.dlrCd' />", hidden:true}// 딜러코드
               ,{field:"membershipNo", title:"<spring:message code='global.lbl.membershipNo' />",attributes:{"class":"ac"},width:150}// 멤버십 번호
               ,{field:"regDtFormat", title:"<spring:message code='global.lbl.joinDt' />", width:100   // 가입일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"extcPointVal", title:"<spring:message code='crm.lbl.extcPointVal' />",width:100,attributes:{"class":"ar"} // 소멸 포인트
                   ,format:"{0:n0}"
               }
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:150,attributes:{"class":"al"}} //고객명
               ,{field:"hpNo", title:"<spring:message code='global.lbl.hpNo'/>", width:150,attributes:{"class":"ac"}} //이동전화
               ,{field:"telNo", title:"<spring:message code='global.lbl.homeTelNo'/>", width:150,attributes:{"class":"ac"}}//고전(유선)전화
            ]
        });

        /*******************************포인트 소멸 이력관리 탭 종료**********************************/
    }); /* end ready */

</script>