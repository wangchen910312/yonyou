<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<style>
.form_numberic { width:100%;}
</style>
<!-- 메세지소스 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.bmRegStat" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13239" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
            <dms:access viewId="VIEW-D-13240" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_excel" id="btnExcelExport"><spring:message code='global.btn.excelExport' /><!-- 엑셀다운로드 Excel下?--></button>
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:15%;">
                <col style="width:8%;">
                <col style="width:23%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.custNm" /></th>
                    <td>
                        <input id="sCustNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.ssnCrnNo" /></th>
                    <td>
                        <input id="sSsnCrnNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.hpNo" /></th>
                    <td>
                        <input id="sHpNo" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.joinDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sBlueMembershipJoinDtFrom" name="sBlueMembershipJoinDtFrom" class="form_datepicker" data-type="maskDate"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sBlueMembershipJoinDtTo" name="sBlueMembershipJoinDtTo" class="form_datepicker" data-type="maskDate"/>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.BlueMbrShipReg" /></th>
                    <td>
                        <input id="sBlueGradeNm" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="crm.lbl.regChannel" /></th>
                    <td>
                        <input id="sBlueMembershipJoinDlrCd" type="text" class="form_comboBox" >
                    </td>
                    <th scope="row"><spring:message code="crm.lbl.bmLoginId" /></th>
                    <td>
                        <input id="sBlueLoginId" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.savePointAble" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sBlueAvlbPointValFrom" name="sBlueAvlbPointValFrom" class="form_numberic ar" data-type="number" min="0"/>
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sBlueAvlbPointValTo" name="sBlueAvlbPointValTo" class="form_numberic ar" data-type="number" min="0"/>
                            </div>
                        </div>
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
</section>
</div>

<script type="text/javascript">

//bm regist source
var regHoldList = [];
regHoldList.push({"value":"OWNDLR", "title":"<spring:message code='crm.lbl.dealer' />"});
regHoldList.push({"value":"OTHDLR", "title":"<spring:message code='crm.lbl.othDlr' />"});
regHoldList.push({"value":"ETC", "title":"<spring:message code='crm.lbl.othChannel' />"});

//bm Grade
var bmGradeList = [];
var bmGradeMap = {};
<c:forEach var="obj" items="${gradeList}">
bmGradeList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
bmGradeMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

function gridCommonParams() {
    // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
    var params = {};

    params["sCustNm"] = $("#sCustNm").val();
    params["sSsnCrnNo"] = $("#sSsnCrnNo").val();
    params["sHpNo"] = $("#sHpNo").val();
    params["sBlueGradeNm"] = $("#sBlueGradeNm").data("kendoExtDropDownList").value();
    params["sBlueMembershipJoinDlrCd"] = $("#sBlueMembershipJoinDlrCd").val();
    params["sBlueMembershipJoinDtFrom"] = $("#sBlueMembershipJoinDtFrom").data("kendoExtMaskedDatePicker").value();
    params["sBlueMembershipJoinDtTo"] = $("#sBlueMembershipJoinDtTo").data("kendoExtMaskedDatePicker").value();
    if($("#sBlueAvlbPointValFrom").val() != ""){
        params["sBlueAvlbPointValFrom"] = $("#sBlueAvlbPointValFrom").data("kendoExtNumericTextBox").value();
    }
    if($("#sBlueAvlbPointValTo").val() != ""){
        params["sBlueAvlbPointValTo"] = $("#sBlueAvlbPointValTo").data("kendoExtNumericTextBox").value();
    }
    params["sBlueLoginId"] = $("#sBlueLoginId").val();

    return params;

};

$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    setKendoDate = function( dtValue){
        return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
    };
    //버튼 - 엑셀저장
    $("#btnExcelExport").kendoButton({
        click:function(e) {

            var params = {};
            params = gridCommonParams();

            // BM회원현황 엑셀Export 수량 데이터를 조회한다.
            $.ajax({
                url:"<c:url value='/crm/dmm/blueMembershipJoin/selectBlueMembershipListExcelExportCnt.do' />",
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
                    };

                    dms.ajax.excelExport({
                        "beanName":"blueMembershipJoinService"
                        ,"templateFile":"BlueMembershipStatusList_Tpl.xlsx"
                        ,"fileName":"BlueMembershipStatusList.xlsx"
                        ,"sCustNm":$("#sCustNm").val()
                        ,"sSsnCrnNo":$("#sSsnCrnNo").val()
                        ,"sHpNo":$("#sHpNo").val()
                        ,"sBlueGradeNm":$("#sBlueGradeNm").data("kendoExtDropDownList").value()
                        ,"sBlueMembershipJoinDlrCd":$("#sBlueMembershipJoinDlrCd").val()
                        ,"sBlueMembershipJoinDtFrom":setKendoDate($("#sBlueMembershipJoinDtFrom").data("kendoExtMaskedDatePicker").value())
                        ,"sBlueMembershipJoinDtTo":setKendoDate($("#sBlueMembershipJoinDtTo").data("kendoExtMaskedDatePicker").value())
                        ,"sBlueAvlbPointValFrom":($("#sBlueAvlbPointValFrom").val()== "")? -1 : $("#sBlueAvlbPointValFrom").data("kendoExtNumericTextBox").value()
                        ,"sBlueAvlbPointValTo":($("#sBlueAvlbPointValTo").val()== "")? -1:$("#sBlueAvlbPointValTo").data("kendoExtNumericTextBox").value()
                        ,"sBlueLoginId":$("#sBlueLoginId").val()
                    });

                }
            });
        }
    });

    //조회조건 - 등급
    $("#sBlueGradeNm").kendoExtDropDownList({
        dataSource:bmGradeList
        ,dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,optionLabel:" "
    });

    //조회조건 - 가입 출처
    $("#sBlueMembershipJoinDlrCd").kendoExtDropDownList({
        dataSource:regHoldList
        ,dataTextField:"title"
        ,dataValueField:"value"
        ,optionLabel:" "
    });

    //조회조건 - 가입일 From-To
    $("#sBlueMembershipJoinDtFrom, #sBlueMembershipJoinDtTo").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //조회조건 - 포인트 From-To
    $("#sBlueAvlbPointValFrom, #sBlueAvlbPointValTo").kendoExtNumericTextBox({
        min:0
       ,format:"n0" //"{0:##,###}"
       ,spinners:false // 증,감 화살표
     });

    //그리드 설정
    $("#grid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-CRM-0922-113828"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/dmm/blueMembershipJoin/selectBlueMembershipList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params = $.extend(params, gridCommonParams());

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                errors:"error"
                ,data:"data"
                ,total:"total"
                ,model:{
                    id:"dlrCd"
                   ,fields:{
                    }
                }
            }
        }
        ,editable:false
        ,autoBind:true
        ,appendEmptyColumn:true
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:50, sortable:false, filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"blueLoginId"   , title:"<spring:message code='crm.lbl.bmLoginId' />", width:110,attributes:{"class":"ac"}}
            ,{field:"custNm" , title:"<spring:message code='global.lbl.custNm' />", width:120
                ,attributes:{"class":"ac"}
                ,template:function(data){
                    var spanObj = "<a href='#' class='linkCustBlueMembership'>"+data.custNm+"</a>";
                    return spanObj;
                }
            }
            ,{field:"hpNo"   , title:"<spring:message code='global.lbl.hpNo' />", width:100,attributes:{"class":"ac"} }
            ,{field:"ssnCrnNo" , title:"<spring:message code='global.lbl.ssnCrnNo' />", width:150,attributes:{"class":"ac"} }
            ,{field:"blueMembershipNo"   , title:"<spring:message code='crm.lbl.blueMembershipNo' />", width:110,attributes:{"class":"ac"}}
            ,{field:"blueAvlbPointVal", title:"<spring:message code='global.lbl.savePointAble' />", width:100
                ,attributes:{"class":"ar"}, format:"{0:n0}" }
            ,{field:"blueGradeCdNm", title:"<spring:message code='global.lbl.BlueMbrShipReg' />", width:100
                ,attributes:{"class":"ac"},sortable:false, filterable:false}
            ,{field:"blueMembershipJoinDlrCd", title:"<spring:message code='crm.lbl.regChannel' />", attributes:{"class":"ac"}}
            ,{field:"blueMembershipJoinDt", title:"<spring:message code='global.lbl.joinDt' />", width:100
                , attributes:{"class":"ac"}, filterable:false
                , template:"#= dms.string.strNvl(kendo.toString(kendo.parseDate(data.blueMembershipJoinDt), '<dms:configValue code='dateFormat'/>')) #" }
        ]
    });

    $(document).on("click", ".linkCustBlueMembership", function(e){
        var grid = $("#grid").data("kendoExtGrid"),
        row = $(e.target).closest("tr");
        var dataItem = grid.dataItem(row);
        window.parent._createOrReloadTabMenu("<spring:message code='crm.menu.custInfo' />", "<c:url value='/crm/cif/customerInfo/selectCustomerInfoMain.do' />?custNo="+dataItem.custNo, "VIEW-D-10272"); // CUST NO
   });


});
</script>