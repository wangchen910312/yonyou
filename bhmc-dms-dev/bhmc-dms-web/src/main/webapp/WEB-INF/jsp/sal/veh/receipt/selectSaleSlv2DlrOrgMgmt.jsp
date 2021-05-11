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
            <dms:access viewId="VIEW-D-12800" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_new" id="btnNew" onClick="registPopup();"><spring:message code="global.btn.new" /></button>    <!-- 신규 -->
            </dms:access>
            <!-- <button class="btn_m btn_detail" id="btnDetail"><spring:message code="global.btn.detail" /></button> -->           <!-- 상세 -->
            <dms:access viewId="VIEW-D-12799" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>                    <!-- 조회 -->
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
                    <th scope="row"><spring:message code="sal.lbl.Slv2DlrType" /></th><!-- 2급망 유형 -->
                    <td>
                        <input id="sSdlrTp" name="sSdlrTp" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.lv2DlrCd" /></th><!-- 2급 딜러코드 -->
                    <td>
                        <input id="sSdlrCd" name="sSdlrCd" class="form_input" maxlength="5" >
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.PayTaxPinNo" /></th><!-- 납세자 식별번호 -->
                    <td>
                        <input id="sTaxpayerIdCd" name="sTaxpayerIdCd" class="form_input" maxlength="20" >
                    </td>
                    <th></th>
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
        <div class="table_form" id="registFormContainer">
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
                            <input id="rDlrCd" name="rDlrCd" readonly class="form_input form_readonly" data-json-obj="true">
                        </td>
                        <th></th>
                        <td></td>
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.lv2DlrCd' /></span></th><!-- 2급 딜러코드 -->
                        <td class="required_area">
                            <input id="rSdlrCd" name="rSdlrCd" readonly class="form_input form_readonly" data-json-obj="true">
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.Slv2DlrType" /></span></th><!-- 2급망 유형 -->
                        <td class="readonly_area">
                            <input id="rSdlrTp" name="rSdlrTp" readonly class="form_comboBox form_readonly" data-json-obj="true" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.lv2DlrNm" /></th>   <!-- 2급 딜러명칭 -->
                        <td>
                            <input id="rSdlrNm" name="rSdlrNm" class="form_input" maxlength="30" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.PayTaxPinNo" /></span></th><!-- 납세자 식별번호 -->
                        <td>
                            <input id="rTaxpayerIdCd" name="rTaxpayerIdCd" class="form_input" maxlength="20" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ownRgstNm" /></th><!-- 대표자명 -->
                        <td>
                            <input id="rOwnNm" name="rOwnNm" class="form_input" maxlength="30" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.telNo' /></th><!-- 전화번호 -->
                        <td>
                            <input id="rTelNo" name="rTelNo" class="form_input" maxlength="20" data-json-obj="true" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.addr" /></th><!-- 주소 -->
                        <td colspan="3">
                            <input id="rAddr" name="rAddr" class="form_input" maxlength="80" data-json-obj="true" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.useYn' /></th><!-- 사용여부 -->
                        <td>
                            <input id="rUseYn" name="rUseYn" class="form_comboBox" data-json-obj="true" />
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
                <button class="btn_s btn_save" id="btnUpdate"><spring:message code="global.btn.update" /></button>  <!-- 수정 -->
                </dms:access>
            </div>
        </div>
        <form id="updateForm" name="updateForm" method="POST" action="/">
        <div class="table_form" id="updateFormContainer">
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
                        </td>
                        <th></th>
                        <td></td>
                        <th></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code='sal.lbl.lv2DlrCd' /></span></th><!-- 2급 딜러코드 -->
                        <td class="required_area">
                            <input id="uSdlrCd" name="uSdlrCd" readonly class="form_input form_readonly" data-json-obj="true" data-bind="value:data.uSdlrCd" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.Slv2DlrType" /></span></th><!-- 2급망 유형 -->
                        <td class="readonly_area">
                            <input id="uSdlrTp" name="uSdlrTp" readonly class="form_comboBox" data-json-obj="true" data-bind="value:data.uSdlrTp" />
                        </td>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.lv2DlrNm" /></th>   <!-- 2급 딜러명칭 -->
                        <td>
                            <input id="uSdlrNm" name="uSdlrNm" class="form_input" data-json-obj="true" maxlength="30" data-bind="value:data.uSdlrNm" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.PayTaxPinNo" /></span></th><!-- 납세자 식별번호 -->
                        <td>
                            <input id="uTaxpayerIdCd" name="uTaxpayerIdCd" class="form_input" data-json-obj="true" maxlength="20" data-bind="value:data.uTaxpayerIdCd" />
                        </td>
                        <th scope="row"><spring:message code="global.lbl.ownRgstNm" /></th><!-- 대표자명 -->
                        <td>
                            <input id="uOwnNm" name="uOwnNm" class="form_input" data-json-obj="true" maxlength="30" data-bind="value:data.uOwnNm" />
                        </td>
                        <th scope="row"><spring:message code='sal.lbl.telNo' /></th><!-- 전화번호 -->
                        <td>
                            <input id="uTelNo" name="uTelNo" class="form_input" data-json-obj="true" maxlength="20" data-bind="value:data.uTelNo" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.addr" /></th><!-- 주소 -->
                        <td colspan="3">
                            <input id="uAddr" name="uAddr" class="form_input" data-json-obj="true" maxlength="80" data-bind="value:data.uAddr" />
                        </td>
                        <th scope="row"><spring:message code='global.lbl.useYn' /></th><!-- 사용여부 -->
                        <td>
                            <input id="uUseYn" name="uUseYn" class="form_comboBox" data-json-obj="true" data-bind="value:data.uUseYn" />
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

var sdlrTpList = [];
<c:forEach var="obj" items="${sdlrTpList}">
sdlrTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>

$(document).ready(function() {

    $("#rDlrCd").val('${dlrCd}');

    $("#sSdlrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:sdlrTpList
    });

    $("#rSdlrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:sdlrTpList
    });

    $("#uSdlrTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:sdlrTpList
    });

    // 사용여부
    $("#uUseYn, #rUseYn").kendoExtDropDownList({
        dataSource:["Y", "N"]
        ,index:0
    });

    // 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
           }
    });

    //게시물 데이터
    var viewModel = kendo.observable({
        data:{}
        ,uSdlrTp:sdlrTpList
        ,reset:function(){
            this.set("data", {
                 uSdlrCd:""
                ,uSdlrTp:""
                ,uSdlrTpNm:""
                ,udlrCd:""
                ,uSdlrNm:""
                ,uTaxpayerIdCd:""
                ,uOwnNm:""
                ,uTelNo:""
                ,uAddr:""
                ,uUseYn:""
            });
        }
    });
    kendo.bind($("#updateFormContainer"), viewModel);

    // 신규등록
    $("#registWindow").kendoWindow({
        animation:false
        ,draggable:true
        ,modal:true
        ,resizable:false
        ,visible:false
        ,title:"<spring:message code='sal.lbl.lv2DlrOrg' /><spring:message code='global.lbl.registration' />"
        ,width:"950px"
        ,height:"130px"
    }).data("kendoWindow");

    // 수정
    $("#updateWindow").kendoWindow({
        animation:false
        ,draggable:true
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

            if ( dms.string.isEmpty($("#rSdlrNm").val())){
                dms.notification.warning("<spring:message code='sal.lbl.lv2DlrNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#rSdlrNm").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#rTaxpayerIdCd").val())){
                dms.notification.warning("<spring:message code='sal.lbl.PayTaxPinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#rTaxpayerIdCd").focus();
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
                    dms.notification.error(jqXHR.responseJSON.errors);
                    $("#rTaxpayerIdCd").focus();
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
                url:"<c:url value='/sal/veh/receipt/selectSaleSlv2DlrOrgMgmtDetail.do' />"
                ,data:JSON.stringify({"sDlrCd":dataItem.dlrCd, "sSdlrTp":dataItem.sdlrTp, "sSdlrCd":dataItem.sdlrCd})
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(jqXHR, textStatus) {
                    console.log(jqXHR);
                    viewModel.set("data", jqXHR);
                    $("#updateWindow").data("kendoWindow").center().open();
                }
            });
        }
    });

    // 수정
    $("#btnUpdate").kendoButton({
        click:function(e) {

            if ( dms.string.isEmpty($("#uSdlrNm").val())){
                dms.notification.warning("<spring:message code='sal.lbl.lv2DlrNm' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#uSdlrNm").focus();
                return false;
            }

            if ( dms.string.isEmpty($("#uTaxpayerIdCd").val())){
                dms.notification.warning("<spring:message code='sal.lbl.PayTaxPinNo' var='returnMsg' /><spring:message code='global.info.required.field' arguments='${returnMsg}' />");
                $("#uTaxpayerIdCd").focus();
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
                    dms.notification.error(jqXHR.responseJSON.errors);
                    $("#uTaxpayerIdCd").focus();
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
        gridId:"G-SAL-2017-051904"
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

                        params["sSdlrTp"] = $("#sSdlrTp").val();
                        params["sSdlrCd"] = $("#sSdlrCd").val();
                        params["sTaxpayerIdCd"] = $("#sTaxpayerIdCd").val();

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
                        ,sdlrTp:{type:"string", editable:false }
                        ,sdlrTpNm:{type:"string", editable:false }
                        ,dlrCd:{type:"string", editable:false }
                        ,sdlrNm:{type:"string", editable:false }
                        ,taxpayerIdCd:{type:"string", editable:false }
                        ,ownNm:{type:"string", editable:false }
                        ,telNo:{type:"string", editable:false }
                        ,addr:{type:"string", editable:false }
                        ,useYn:{type:"string", editable:false }
                        ,regUsrId:{type:"string", editable:false }
                        ,regDt:{type:"date", editable:false}
                        ,updtUsrId:{type:"string", editable:false}
                        ,upDt:{type:"date", editable:false}
                    }
                }
            }
        }
        ,navigatable:true
        ,pageable:true
        ,selectable:"row"
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"sdlrTpNm", title:"<spring:message code='sal.lbl.Slv2DlrType' />", width:150, attributes:{"class":"ac"}}      /* 2급망 유형 */
            ,{field:"sdlrCd", title:"<spring:message code='sal.lbl.lv2DlrCd' />", width:100, attributes:{"class":"ac"}}           /* 2급 딜러코드 */
            ,{field:"sdlrNm", title:"<spring:message code='sal.lbl.lv2DlrNm' />", width:250}                                      /* 2급 딜러명칭 */
            ,{field:"taxpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo' />", width:150, attributes:{"class":"ac"}}  /* 납세자식별번호 */
            ,{field:"ownNm", title:"<spring:message code='global.lbl.ownRgstNm' />", width:200}                                   /* 대표자명 */
            ,{field:"telNo", title:"<spring:message code='sal.lbl.telNo' />", width:150, attributes:{"class":"ac"}}               /* 전화번호 */
            ,{field:"addr", title:"<spring:message code='sal.lbl.addr' />", width:450}                                            /* 주소 */
            ,{field:"useYn", title:"<spring:message code='global.lbl.useYn' />", width:80, attributes:{"class":"ac"}}             /* 사용여부 */
        ]
    });
    // 2급딜러 관리 그리드 종료

});

// 신규등록 팝업 오픈
function registPopup(){
    // 기존정보 리셋
    $("#rSdlrCd").val("");
    $("#rSdlrTp").data("kendoExtDropDownList").value("2");
    $("#rSdlrTpNm").val("");
    $("#rSdlrNm").val("");
    $("#rTaxpayerIdCd").val("");
    $("#rOwnNm").val("");
    $("#rTelNo").val("");
    $("#rAddr").val("");
    $("#rUseYn").data("kendoExtDropDownList").value("Y");

    var win = $("#registWindow").data("kendoWindow");
    win.center();
    win.open();
}

</script>
<!-- [DMS] 2급딜러 관리 -->