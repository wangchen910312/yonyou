<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<%--
    JSP Name : selectSaleSlv2DlrOrgMgmt.jsp
    Description : 기준정보 > 2급딜러 관리
    author chibeom.song
    since 2017. 2. 17.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 2. 17.   chibeom.song     최초 생성
--%>

<!-- [DMS] 2급딜러 관리 -->
<div id="resizableContainer">
<section class="group" >
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.Slv2DlrOrgMgmt" /></h1><!-- 2급딜러 관리 -->
        <div class="btn_right">
            <dms:access viewId="" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_new" id="btnNew" onClick="registPopup();"><spring:message code="global.btn.new" /><!-- 신규 --></button>
            </dms:access>
            <!-- <button class="btn_m btn_detail" id="btnDetail"><spring:message code="global.btn.detail" /></button> --><!-- 상세 -->
            <dms:access viewId="VIEW-D-12799" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.Slv2DlrType" /></th><!-- 2급망 유형 -->
                    <td>
                        <input id="sSlv2DlrType" name="sSlv2DlrType" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.lv2DlrCd" /></th><!-- 2급 딜러코드 -->
                    <td>
                        <input id="sLv2DlrCd" name="sLv2DlrCd" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.PayTaxPinNo" /></th><!-- 납세자 식별번호 -->
                    <td>
                        <input id="sPayTaxPinNo" name="sPayTaxPinNo" class="form_input">
                    </td>
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

    <!-- 등록 -->
    <section id="registWindow" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12798" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                </dms:access>
        </div>
        </div>
        <form id="registForm" name="registForm" method="POST" action="/">
        <div class="table_form">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sar.lbl.dlrCd' /></span></th><!-- 본 딜러코드 -->
                        <td class="required_area">
                            <input id="dlrCd" name="dlrCd" readonly class="form_input form_readonly" data-json-obj="true">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.Slv2DlrType" /></span></th><!-- 2급망 유형 -->
                        <td class="required_area">
                            <input id="slv2DlrType" name="slv2DlrType" class="form_comboBox" data-json-obj="true" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.lv2DlrNm" /></th>   <!-- 2급 딜러명칭 -->
                        <td>
                            <input id="slv2DlrNm" name="slv2DlrNm" class="form_input" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.PayTaxPinNo" /></span></th><!-- 납세자 식별번호 -->
                        <td>
                            <input id="payTaxPinNo" name="payTaxPinNo" class="form_input" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ownRgstNm" /></th><!-- 대표자명 -->
                        <td>
                            <input id="ownRgstNm" name="ownRgstNm" class="form_input" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.telNo' /></th><!-- 전화번호 -->
                        <td>
                            <input id="telNo" name="telNo" class="form_input" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.addr" /></th><!-- 주소 -->
                        <td colspan="5">
                            <input id="sdlrAddr" name="sdlrAddr" class="form_input" data-json-obj="true" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        </form>
    </section>

    <!-- 수정 -->
    <section id="updateWindow" class="pop_wrap">
        <div class="header_area">
            <div class="btn_right">
                <dms:access viewId="VIEW-D-12797" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_s btn_save" id="btnUpdate"><spring:message code="global.btn.save" /></button><!-- 저장 -->
                </dms:access>
            </div>
        </div>
        <form id="updateForm" name="updateForm" method="POST" action="/">
        <div class="table_form" id="formContainer">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:24%;">
                    <col style="width:10%;">
                    <col style="width:23%;">
                    <col style="width:10%;">
                    <col style="width:21%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sar.lbl.dlrCd' /></span></th><!-- 본 딜러코드 -->
                        <td class="required_area">
                            <input id="uDlrCd" name="uDlrCd" readonly class="form_input form_readonly" data-json-obj="true" data-bind="value:data.uDlrCd" />
                            <input id="uSdlrCd" name="uSdlrCd" readonly class="form_input form_readonly" data-json-obj="true" data-bind="value:data.uSdlrCd" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.Slv2DlrType" /></span></th><!-- 2급망 유형 -->
                        <td class="required_area">
                            <input id="uslv2DlrType" name="uslv2DlrType" class="form_comboBox" data-json-obj="true" data-bind="value:data.uSdldrTp" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.lv2DlrNm" /></th>   <!-- 2급 딜러명칭 -->
                        <td>
                            <input id="uSlv2DlrNm" name="uSlv2DlrNm" class="form_input" data-json-obj="true" data-bind="value:data.uSdlrNm" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.PayTaxPinNo" /></span></th><!-- 납세자 식별번호 -->
                        <td>
                            <input id="uPayTaxPinNo" name="uPayTaxPinNo" class="form_input" data-json-obj="true" data-bind="value:data.uTaxpayerIdCd" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ownRgstNm" /></th><!-- 대표자명 -->
                        <td>
                            <input id="uOwnRgstNm" name="uOwnRgstNm" class="form_input" data-json-obj="true" data-bind="value:data.uOwnNm" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.telNo' /></th><!-- 전화번호 -->
                        <td>
                            <input id="uTelNo" name="uTelNo" class="form_input" data-json-obj="true" data-bind="value:data.uTelNo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.addr" /></th><!-- 주소 -->
                        <td colspan="5">
                            <input id="uSdlrAddr" name="uSdlrAddr" class="form_input" data-json-obj="true" data-bind="value:data.uSdlrAddr" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        </form>
    </section>
</section>
</div>

<script type="text/javascript">
var slv2DlrOrgCdList = [];
<c:forEach var="obj" items="${slv2DlrOrgCdList}">
slv2DlrOrgCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

$(document).ready(function() {

    $("#dlrCd").val('${dlrCd}');

    $("#sSlv2DlrType").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:slv2DlrOrgCdList
    });

    $("#slv2DlrType").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:slv2DlrOrgCdList
    });

    $("#uslv2DlrType").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:slv2DlrOrgCdList
    });

    // 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
           }
    });

    // 신규등록
    $("#registWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.lbl.lv2DlrOrg' /><spring:message code='global.lbl.registration' />"
        ,width:"950px"
        ,height:"130px"
    }).data("kendoWindow");

    //게시물 데이터
    var viewModel = kendo.observable({
        data:{}
        ,uSdldrTp:slv2DlrOrgCdList
        ,reset:function(){
            this.set("data", {
                uSdlrCd:""
                ,uSdldrTp:""
                ,uSdldrTpNm:""
                ,udlrCd:""
                ,uSdlrNm:""
                ,uTaxpayerIdCd:""
                ,uOwnNm:""
                ,uTelNo:""
                ,uSdlrAddr:""
            });
        }
    });
    kendo.bind($("#formContainer"), viewModel);

    // 수정
    $("#updateWindow").kendoWindow({
        animation:false
        ,draggable:false
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.lbl.lv2DlrOrg' /><spring:message code='global.lbl.update' />"
        ,width:"950px"
        ,height:"130px"
    }).data("kendoWindow");

    // 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#slv2DlrNm").val())){
                dms.notification.warning("<spring:message code='sal.lbl.lv2DlrNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#slv2DlrNm").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#payTaxPinNo").val())){
                dms.notification.warning("<spring:message code='sal.lbl.PayTaxPinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#payTaxPinNo").focus();
                return false;
            }

            var param = $("#registForm").serializeObject($("#registForm").serializeArrayInSelector("[data-json-obj='true']"));

            $.ajax({
                url:"<c:url value='/sal/veh/receipt/insertSaleSlv2DlrOrgMgmtSave.do' />",
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
                    $("#registWindow").data("kendoWindow").close();
                }
            });

        }
    });

    // 2급딜러 상세정보 팝업
    $("#grid").on("dblclick", "tr.k-state-selected", function(e){
        var grid = $(e.delegateTarget).data("kendoExtGrid");

        if(grid.select().length > 0){
            var dataItem = grid.dataItem(grid.select());

            $.ajax({
                url:"<c:url value='/sal/veh/receipt/selectSaleSlv2DlrOrgMgmtSaveByKey.do' />"
                ,data:JSON.stringify({"sDlrCd":dataItem.dlrCd, "sSdldrTp":dataItem.sdldrTp, "sSdlrCd":dataItem.sdlrCd})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    viewModel.set("data", jqXHR);
                    $("#updateWindow").data("kendoWindow").center().open();
                }
            });
        }
    });

    // 수정
    $("#btnUpdate").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#uSlv2DlrNm").val())){
                dms.notification.warning("<spring:message code='sal.lbl.lv2DlrNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#uSlv2DlrNm").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#uPayTaxPinNo").val())){
                dms.notification.warning("<spring:message code='sal.lbl.PayTaxPinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#uPayTaxPinNo").focus();
                return false;
            }

            var param = $("#updateForm").serializeObject($("#updateForm").serializeArrayInSelector("[data-json-obj='true']"));

            $.ajax({
                url:"<c:url value='/sal/veh/receipt/updateSaleSlv2DlrOrgMgmtSave.do' />",
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
                    $("#updateWindow").data("kendoWindow").close();
                }
            });

        }
    });

    // 2급딜러 관리 그리드 시작
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-2017-051901"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/veh/receipt/selectSaleSlv2DlrOrgMgmtSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSlv2DlrType"] = $("#sSlv2DlrType").val();
                        params["sLv2DlrCd"] = $("#sLv2DlrCd").val();
                        params["sPayTaxPinNo"] = $("#sPayTaxPinNo").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    };
                }
            }
            ,schema:{
                model:{
                    id:"sdlrCd"
                    ,fields:{
                         sdlrCd:{type:"string", editable:false }
                        ,sdldrTp:{type:"string", editable:false }
                        ,sdldrTpNm:{type:"string", editable:false }
                        ,dlrCd:{type:"string", editable:false }
                        ,sdlrNm:{type:"string", editable:false }
                        ,taxpayerIdCd:{type:"string", editable:false }
                        ,ownNm:{type:"string", editable:false }
                        ,telNo:{type:"string", editable:false }
                        ,sdlrAddr:{type:"string", editable:false }
                        ,useYn:{type:"string", editable:false }
                        ,regUsrId:{type:"string", editable:false }
                        ,regDt:{type:"date", editable:false}
                        ,updtUsrId:{type:"string", editable:false}
                        ,upDt:{type:"date", editable:false}
                    }
                }
            }
        }
        ,navigatable:false
        ,pageable:false
        ,selectable:"row"
        , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        , multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        , appendEmptyColumn:true           //빈컬럼 적용. default:false
        , enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"sdldrTpNm", title:"<spring:message code='sal.lbl.Slv2DlrType' />", width:150, attributes:{"class":"ac"}}     /* 2급망 유형 */
            ,{field:"sdlrCd", title:"<spring:message code='sal.lbl.lv2DlrCd' />", width:100, attributes:{"class":"ac"}}           /* 2급 딜러코드 */
            ,{field:"sdlrNm", title:"<spring:message code='sal.lbl.lv2DlrNm' />", width:250}           /* 2급 딜러명칭 */
            ,{field:"taxpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo' />", width:150, attributes:{"class":"ac"}}  /* 납세자식별번호 */
            ,{field:"ownNm", title:"<spring:message code='global.lbl.ownRgstNm' />", width:150, attributes:{"class":"ac"}}        /* 대표자명 */
            ,{field:"telNo", title:"<spring:message code='sal.lbl.telNo' />", width:150, attributes:{"class":"ac"}}               /* 전화번호 */
            ,{field:"sdlrAddr", title:"<spring:message code='sal.lbl.addr' />", width:450}                                        /* 주소 */

        ]
    });
    // 2급딜러 관리 그리드 종료

});

// 신규등록 팝업 오픈
function registPopup(){
    var win = $("#registWindow").data("kendoWindow");
    win.center();
    win.open();
}

</script>
<!-- [DMS] 2급딜러 관리 -->