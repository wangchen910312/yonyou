<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>
        <div id="resizableContainer">
            <!-- 유일정보수정목록 -->
            <section class="group">
                <div class="header_area">
                    <h1 class="title_basic"><spring:message code="crm.menu.custInfoUpdtReqList" /></h1><!-- 유일정보수정목록 -->
                    <div class="btn_right">
                    <dms:access viewId="VIEW-D-11047" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m" id="btnViewDetail" ><spring:message code='global.btn.detail' /><!-- 상세 --></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-11048" hasPermission="${dms:getPermissionMask('READ')}">
                        <button class="btn_m btn_search" id="btnCustSearch"><spring:message code='global.btn.search' /></button><!-- 조회 -->
                    </dms:access>
                    </div>
                </div>
                <div class="table_form" role="search" data-btnid="btnCustSearch">
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
                                <th scope="row"><spring:message code='global.lbl.custNm' /></th><!-- 고객명 -->
                                <td>
                                    <input type="text" id="sCustNm" name="sCustNm" class="form_input" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.statNm' /></th><!--  이메일 -->
                                <td>
                                    <input type="text" id="sStatCd" name="sStatCd"  value="" class="form_comboBox" data-json-obj="true">
                                </td>
                                <th scope="row"><spring:message code="global.lbl.reqDt" /></th><!-- 등록일자 -->
                                <td colspan="2">
                                    <div class="form_float">
                                    <div class="date_left">
                                        <input id="sReqDtFrom" name="sReqDtFrom" class="form_datepicker" data-json-obj="true">
                                        <span class="txt_from">~</span>
                                    </div>
                                    <div class="date_right">
                                        <input id="sReqDtTo" name="sReqDtTo" class="form_datepicker" data-json-obj="true">
                                    </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="table_grid mt10">
                    <div id="customerReqGrid" class="resizable_grid"></div>
                </div>
            </section>
            <section id="window" class="pop_wrap">
                    <!-- unique info pop contents start -->
                    <div id="defaultInfoTabDiv" class="mt10">
                        <div class="table_form">
                            <form id="defaultInfoForm" >
                                <table>
                                    <caption></caption>
                                    <colgroup>
                                        <col style="width:14%;">
                                        <col style="width:22%;">
                                        <col style="width:10%;">
                                        <col style="width:23%;">
                                        <col style="width:10%;">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><span><spring:message code="crm.lbl.befMathDocTp" /></span><!-- 이전 증서 유형 --></th>
                                                <td>
                                                    <input id="befMathDocTp" name="befMathDocTp" value="" class="form_comboBox" style="width:100%" readonly="readonly" />
                                                </td>
                                            <th scope="row"><spring:message code="crm.lbl.befSsnCrnNo" /><!-- 이전 증서 번호 --></th>
                                            <td>
                                                <input id="befSsnCrnNo" name="befSsnCrnNo" class="form_numeric"  style="width:100%" readonly="readonly"/>
                                            </td>
                                            <th scope="row"><spring:message code="global.lbl.statNm" /><!-- 처리 상태 --></th>
                                            <td>
                                                <input id="statNm" name="statNm" class="form_numeric"  style="width:100%" readonly="readonly"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span><spring:message code="global.lbl.mathDocTp" /></span><!-- 증서 유형 --></th>
                                                <td>
                                                    <input id="idTp" name="idTp" value="" class="form_comboBox" style="width:100%" readonly="readonly" />
                                                </td>
                                            <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /><!-- 증서 번호 --></th>
                                                <td>
                                                    <input id="idNm" name="idNm" class="form_numeric"  style="width:100%" readonly="readonly"/>
                                                </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><span><spring:message code="global.lbl.cont" /></span><!-- 내용 --></th>
                                            <td colspan="5" class="required_area">
                                                <textarea id="makCont" name="makCont" rows="5" cols="" class="form_textarea" style="width:100%" readonly="readonly"></textarea>
                                            </td>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.requester" /><!-- 요청자 --></th>
                                                <td>
                                                    <input id="reqUsrNm" name="reqUsrNm" class="form_numeric"  style="width:100%" readonly="readonly"/>
                                                </td>
                                            <th scope="row"><spring:message code="crm.lbl.requestDate" /><!-- 요청일자 --></th>
                                                <td>
                                                    <input id="reqDtFormat" name="reqDtFormat" class="form_numeric"  style="width:100%" readonly="readonly"/>
                                                </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><spring:message code="crm.lbl.pprocNm" /><!-- 처리자 --></th>
                                                <td>
                                                    <input id="evalUsrNm" name="evalUsrNm" class="form_numeric"  style="width:100%" readonly="readonly"/>
                                                </td>
                                            <th scope="row"><spring:message code="crm.lbl.reqProcDt" /><!-- 처리일자 --></th>
                                                <td>
                                                    <input id="evalDtFormat" name="evalDtFormat" class="form_numeric"  style="width:100%" readonly="readonly"/>
                                                </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                  <section class="group">
                    <div class="header_area">
                        <h2 class="title_basic"><spring:message code='global.lbl.document' /></h2><!-- 추출 실행 목록 -->
                    </div>
                    <div class="table_grid">
                        <div id="fileGrid"></div>
                    </div>
                </section>
            </section><!-- unique info pop contents end -->
        </div>

<!-- script start  -->
<script type="text/javascript" charset="UTF-8">

    var toDt            = new Date();

    var year = toDt.getFullYear();
    var month = toDt.getMonth()+1;
    var twoMthAgo = (toDt.getMonth()+1)-1;

     var statCdList = [];

    <c:forEach var="obj" items="${statCdList}" >
    statCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

$(document).ready(function() {

     $("#window").kendoWindow({
         pinned:true,
         modal:true,
         resizable:false,
         visible:false,
         animation:false,
         title:"<spring:message code='global.btn.custInfoModify' />",
         width:"950px",
         height:"270px"
     }).data("kendoWindow");



    $("#sStatCd").kendoExtDropDownList({
       dataTextField:"cmmCdNm"
       , dataValueField:"cmmCd"
       , dataSource:statCdList
       , optionLabel:" "
    });

    // From - To
    $("#sReqDtFrom").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,change:fnChkDateValue
    });
    $("#sReqDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,change:fnChkDateValue
    });

    if ( month == "1") {
        twoMthAgo = '10';
        year  = parseInt(year) - 1;
    } else if (month == '2') {
        towMthAgo = '11';
        year  = parseInt(year) - 1;
    }

    if(dms.string.isEmpty($("#sReqDtFrom").data("kendoExtMaskedDatePicker").value())){
        $("#sReqDtFrom").data("kendoExtMaskedDatePicker").value(new Date(year,twoMthAgo,'01'));
        //$("#sReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(year,twoMthAgo,'01'));
     }
    if(dms.string.isEmpty($("#sReqDtTo").data("kendoExtMaskedDatePicker").value())){
        $("#sReqDtTo").data("kendoExtMaskedDatePicker").value(toDt);
        //$("#sReqDtFrom").data("kendoExtMaskedDatePicker").max(toDt);
     }

    // 검색 버튼.
    $("#btnCustSearch").kendoButton({
        click:function(e){

            var sReqDtTo = $("#sReqDtTo").data("kendoExtMaskedDatePicker").value();
            var sReqDtFrom = $("#sReqDtFrom").data("kendoExtMaskedDatePicker").value();

            if ( dms.string.isEmpty($("#sReqDtFrom").data("kendoExtMaskedDatePicker").value())){
                if (dms.string.isNotEmpty(sReqDtTo)) {
                    dms.notification.warning("<spring:message code='global.lbl.reqDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sReqDtFrom").focus();
                    return false;
                }
            }
            if ( dms.string.isEmpty($("#sReqDtTo").data("kendoExtMaskedDatePicker").value())){
                if (dms.string.isNotEmpty(sReqDtFrom)) {
                    dms.notification.warning("<spring:message code='global.lbl.reqDt' var='returnMsg' /><spring:message code='global.info.emptyParamInfo' arguments='${returnMsg}' />");
                    $("#sReqDtTo").focus();
                    return false;
                }
            }
            if(crmJs.isDateValidPeriod($("#sReqDtFrom").data("kendoExtMaskedDatePicker").value()
                    ,$("#sReqDtTo").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                $("#customerReqGrid").data("kendoExtGrid").dataSource.page(1);
            }else{
                $("#sReqDtTo").data("kendoExtMaskedDatePicker").value(new Date(''));
                $("#sReqDtTo").focus();
            }
        }
    });

    // 상세바튼정보
    $("#btnViewDetail").kendoButton({click:function(e){
            var grid = $("#customerReqGrid").data("kendoExtGrid")
                , dataItem = grid.dataItem(grid.select())
            ;
                 dbClickDetailInfoInPop();
        }
    });

    // 그리드 더블클릭 이벤트
    $("#customerReqGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#customerReqGrid").data("kendoExtGrid")
            , dataItem = grid.dataItem(grid.select())
        ;
        var statCd = dataItem.statCd;
             dbClickDetailInfoInPop();

        $("#fileGrid").data("kendoExtGrid").dataSource.page(1);
    });


    function fnChkDateValue(e){

        var  elmt  = e.sender.element[0],
             id    = elmt.id,
             toYY,
             toMM,
             toDD,
             frYY,
             frMM,
             frDD;

        if(this.value() == null){
            if(id === 'sReqDtFrom'){
                $("#sReqDtFrom").data("kendoExtMaskedDatePicker").max(new Date(2200,12,31));
                $("#sReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
            }else if(id === 'sReqDtTo'){
                $("#sReqDtFrom").data("kendoExtMaskedDatePicker").max(new Date(2200,12,31));
                $("#sReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(1900,1,1));
            }
        }else{
            if(id === 'sReqDtFrom'){
                frYY = this.value().getFullYear();
                frMM = this.value().getMonth();
                frDD = this.value().getDate();
                $("#sReqDtTo").data("kendoExtMaskedDatePicker").min(new Date(frYY,frMM,frDD));
            }else if(id === 'sReqDtTo'){
                toYY = this.value().getFullYear();
                toMM = this.value().getMonth();
                toDD = this.value().getDate();
                $("#sReqDtFrom").data("kendoExtMaskedDatePicker").max(new Date(toYY,toMM,toDD));
            }
        }

     }
    // show detail information in the pop
    function dbClickDetailInfoInPop(){
        var row = $("#customerReqGrid").data("kendoExtGrid").select();
        var data = $("#customerReqGrid").data("kendoExtGrid").dataItem(row);
        var win = $("#window").data("kendoWindow");
        win.center();
        win.open();

        if(dms.string.isNotEmpty(data)){
            //$("#befMathDocTp").val(data.befMathDocTp);
            $("#befMathDocTp").val(data.befMathDocTpNm);
            $("#befSsnCrnNo").val(data.befSsnCrnNo);
            $("#idTp").val(data.mathDocTpNm);
            $("#idNm").val(data.ssnCrnNo);
            $("#statNm").val(data.statNm);
            $("#makCont").val(data.remark);
            $("#reqUsrNm").val(data.reqUsrNm);
            $("#reqDtFormat").val(kendo.toString(data.reqDt, 'yyyy-MM-dd HH:mm'));
            $("#evalUsrNm").val(data.evalUsrNm);
            $("#evalDtFormat").val(kendo.toString(data.evalDt, 'yyyy-MM-dd HH:mm'));

        }
    }

    $("#fileGrid").on("dblclick", "tr.k-state-selected", function (e) {
        var grid = $("#fileGrid").data("kendoExtGrid");
        var dataItem = grid.dataItem(grid.select());

        if(dms.string.isNotEmpty(dataItem)){
            dms.fileManager.download(dataItem.fileDocNo, dataItem.fileNo);
        }
    });

    //파일 그리드 시작 //
    $("#fileGrid").kendoExtGrid({
        gridId:"G-CRM-1128-183800"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/fileUpload/selectFiles.do' />"
                },
                parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        var customerReqGrid = $("#customerReqGrid").data("kendoExtGrid");
                        var selectedItem = customerReqGrid.dataItem(customerReqGrid.select());
                          if ( dms.string.isNotEmpty(selectedItem) ) {
                                   params["sFileDocNo"]= selectedItem.docId;

                                   return kendo.stringify(params);
                          }
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }

            ,schema:{
                model:{
                    fields:{
                        fileDocNo:{type:"string", editable:false}
                        ,fileNo:{type:"number", editable:false}
                        ,fileNm:{type:"string", editable:false}
                        ,fileSize:{type:"number", editable:false}
                    }
                }
            }
        }
       ,autoBind:false
       ,editable:false
       ,height:100
       ,indvColumnVisible:true         //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
       ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:false              //Tooltip 적용, default:false
       ,navigatable:false
       ,pageable:false
       ,sortable:false
       ,filterable:false
       ,selectable:"multiple"
       ,columns:[
                 {field:"fileNm", title:"<spring:message code='global.lbl.fileNm' />"
                     ,template:"<span style=\"text-decoration:underline;cursor:pointer;\" onclick=\"dms.fileManager.download('#=fileDocNo#','#=fileNo#')\">#=fileNm#</span>"
                 }
                 ,{field:"fileSize", title:"<spring:message code='global.lbl.fileSize' />", width:150    // 파일크기
                     ,attributes:{"class":"ar"}
                     ,template:"#= dms.string.formatFileSize(fileSize) #"
                 }
       ]
    });


    //그리드 설정 (그룹 CRUD)
    $("#customerReqGrid").kendoExtGrid({
        gridId:"G-CRM-0519-173301"
        , dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerInfo/selectCustomerInfoReqEval.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        var sReqDtFrom = $("#sReqDtFrom").data("kendoExtMaskedDatePicker").value();
                        var sReqDtTo = $("#sReqDtTo").data("kendoExtMaskedDatePicker").value();
                        var sCustNm = $("#sCustNm").val();

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sCustNm"]               = sCustNm;
                        params["sReqDtFrom"]            = sReqDtFrom;
                        params["sReqDtTo"]              = sReqDtTo;
                        params["sStatCd"]               = $("#sStatCd").data("kendoExtDropDownList").value();

                        if ( (dms.string.isNotEmpty(sReqDtFrom) && dms.string.isEmpty(sReqDtTo)) ||
                                (dms.string.isEmpty(sReqDtFrom) && dms.string.isNotEmpty(sReqDtTo))
                        ){
                            dms.notification.warning("<spring:message code='sal.lbl.saleDt' var='returnMsg' /><spring:message code='global.info.chkSelectItemMsg' arguments='${returnMsg}' />");
                            return false;
                        }
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                errors:"error"
                , model:{
                    id:"rnum"
                    , fields:{
                        rnum:{type:"number"}
                        , regDtFormat:{type:"date"}
                        , reqDtFormat:{type:"date"}
                        , evalDtFormat:{type:"date"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                            elem.reqDtFormat = kendo.parseDate(elem.reqDt, "<dms:configValue code='dateFormat' />");
                            elem.evalDtFormat = kendo.parseDate(elem.evalDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }

        }
        ,columns:[
                    {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:30, sortable:false
                                ,attributes:{"class":"ac"}
                    }
                    , {field:"statNm" , title:"<spring:message code='global.lbl.statNm' />", width:60, sortable:false, attributes:{"class":"ac"} }
                    , {field:"custNo" , title:"<spring:message code='global.lbl.custNo' />",  width:140, attributes:{"class":"ac"}
                    }
                    , {field:"custNm" , title:"<spring:message code='global.lbl.custNm' />",  width:60, attributes:{"class":"ac"}
                    }
                    , {field:"mathDocTpNm" , title:"<spring:message code='global.lbl.mathDocTp' />", width:60, sortable:false, attributes:{"class":"ac"} }
                    , {field:"befMathDocTpNm" , title:"<spring:message code='crm.lbl.befMathDocTp' />", width:70, sortable:false, attributes:{"class":"ac"} }
                    , {field:"ssnCrnNo" , title:"<spring:message code='global.lbl.ssnCrnNo' />", width:120, attributes:{"class":"ac"} }
                    , {field:"befSsnCrnNo" , title:"<spring:message code='crm.lbl.befSsnCrnNo' />", width:120, attributes:{"class":"ac"} }
                    , {field:"remark" , title:"<spring:message code='global.lbl.cont' />", width:130, attributes:{"class":"al"} }
                    , {field:"reqUsrNm" , title:"<spring:message code='crm.lbl.requester' />", width:60, sortable:false, attributes:{"class":"ac"} }
                    , {field:"reqDtFormat"  , title:"<spring:message code='crm.lbl.requestDate' />", width:70, attributes:{"class":"ac"}
                        ,template:"#if (reqDtFormat !== null ){# #= kendo.toString(data.reqDtFormat, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
                    }
                    , {field:"evalUsrNm" , title:"<spring:message code='crm.lbl.pprocNm' />", width:60, attributes:{"class":"ac"} }
                    , {field:"evalDtFormat"  , title:"<spring:message code='crm.lbl.reqProcDt' />", width:70, attributes:{"class":"ac"}
                        ,template:"#if (evalDtFormat !== null ){# #= kendo.toString(data.evalDtFormat, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"

                    }
                ]
//           ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
             ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
             ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
             ,appendEmptyColumn:false           //빈컬럼 적용. default:false
             ,enableTooltip:true               //Tooltip 적용, default:false
             ,navigatable:false
             ,sortable:true
             ,editable:false
             ,selectable:"row"
             ,autoBind:true
    });

});

</script>
<!-- //script end -->