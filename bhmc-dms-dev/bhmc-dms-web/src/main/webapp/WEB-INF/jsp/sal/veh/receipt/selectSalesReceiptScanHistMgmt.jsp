<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<%--
    JSP Name : selectSalesReceiptScanHistMgmt.jsp
    Description : 기준정보 > 영수증스캔이력관리
    author chibeom.song
    since 2017. 2. 17.
    version 1.0
    Modification Information
       since          author              description
    ===========    =============    ===========================
    2017. 2. 17.   chibeom.song     최초 생성
--%>

<!-- [DMS] 영수증스캔이력관리 -->
<div id="resizableContainer">
<section class="group" >
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.title.ReceiptScanHistMgmt" /></h1><!-- 영수증스캔이력관리 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-12806" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col style="width:8%;">
                <col style="width:12%;">
                <col style="width:8%;">
                <col style="width:12%;">
                <col style="width:8%;">
                <col style="width:12%;">
                <col style="width:8%;">
                <col style="width:12%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="sal.lbl.uploadDt" /></th> <!-- 업로드 일자 -->
                        <td class="required_area">
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sUploadStDt" class="form_datepicker ac" />
                                    <span class="txt_from">~</span>
                                </div>
                                <div class="date_right">
                                    <input type="text" id="sUploadEdDt" class="form_datepicker ac" />
                                </div>
                            </div>
                        </td>
                    <th scope="row"><spring:message code="sal.lbl.carVinNo" /></th><!-- VIN -->
                    <td>
                        <input id="sVinNo" name="sVinNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.rcptNo" /></th><!-- 영수증번호 -->
                    <td>
                        <input id="sReceiptNo" name="sReceiptNo" class="form_input">
                    </td>
                    <th>
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

</section>
</div>

<script type="text/javascript">

/** 업로드상태 **/
var uploadStatList = [];
<c:forEach var="obj" items="${uploadStatList}">
uploadStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var uploadStatCdArr = dms.data.arrayToMap(uploadStatList, function(obj){return obj.cmmCd;});

$(document).ready(function() {

    $("#sUploadStDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sFromDt}"
    });

    $("#sUploadEdDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:"${sToDt}"
    });

    uploadStatCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            if(uploadStatCdArr[val] != undefined)
            returnVal = uploadStatCdArr[val].cmmCdNm;
        }
        return returnVal;
    };

    // 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
           }
    });

    // 영수증스캔이력관리 그리드 시작
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0217-180541"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/veh/receipt/selectSalesReceiptScanHistMgmtSearch.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sUploadStDt"] = $("#sUploadStDt").data("kendoExtMaskedDatePicker").value();
                        params["sUploadEdDt"] = $("#sUploadEdDt").data("kendoExtMaskedDatePicker").value();
                        params["sVinNo"] = $("#sVinNo").val();
                        params["sReceiptNo"] = $("#sReceiptNo").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    };
                }
            }
            ,schema:{
                model:{
                    id:"vinNo"
                    ,fields:{
                         dlrCd:{type:"string", editable:false }
                        ,upDt:{type:"string", editable:false }
                        ,receiptNo:{type:"string", editable:false }
                        ,receiptType:{type:"string", editable:false }
                        ,vinNo:{type:"string", editable:false }
                        ,vinNo1:{type:"string", editable:false }
                        ,vinNo2:{type:"string", editable:false }
                        ,uploadStat:{type:"string", editable:false }
                        ,taxpayerIdCd:{type:"string", editable:false }
                        ,receiptCd:{type:"string", editable:false }
                        ,receiptCustNm:{type:"string", editable:false }
                        ,ssnCrnNo:{type:"string", editable:false}
                        ,receiptIssDt:{type:"date", editable:false}
                        ,scanVinNo:{type:"string", editable:false}
                        ,sumAmt:{type:"string", editable:false}
                        ,certNo:{type:"string", editable:false}
                        ,engnNo:{type:"string", editable:false}
                        ,sumIncTax:{type:"string", editable:false}
                        ,sumExcTax:{type:"string", editable:false}
                        ,taxRt:{type:"string", editable:false}
                        ,taxAmt:{type:"string", editable:false}
                        ,merchNm:{type:"string", editable:false}
                        ,custAddr:{type:"string", editable:false}
                        ,tmrCd:{type:"string", editable:false}
                        ,regUsrId:{type:"string", editable:false}
                        ,regDt:{type:"string", editable:false}
                        ,custSaleDt:{type:"date", editable:false}
                    }
                }
            }
        }
        ,navigatable:true
        ,pageable:true
        ,selectable:"row"
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,multiSelectWithCheckbox:false    //멀티선택 적용. default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
             {field:"upDt", title:"<spring:message code='sal.lbl.uploadDt' />", width:150,attributes:{"class":"ac"}}                /* 업로드일자 */
            ,{field:"receiptNo", title:"<spring:message code='sal.lbl.ReceiptNo' />", width:150,attributes:{"class":"ac"}}          /* 영수증번호 */
            ,{field:"vinNo", title:"<spring:message code='sal.lbl.carVinNo' />", width:200,attributes:{"class":"ac"}}               /* VIN */
            ,{field:"uploadStat", title:"<spring:message code='sal.lbl.statNm' />", width:150
                ,attributes:{"class":"ac"}
                ,template:function(dataItem){
                    var returnObj = "";
                    if(dataItem.uploadStat != undefined){
                        returnObj = uploadStatCdGrid(dataItem.uploadStat);
                    }
                    return returnObj ;
                }
                ,editor:function(container, options) {

                    $('<input name="uploadStat" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataSource:uploadStatList
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,optionLabel:" "
                    })
                    $('<span class="k-invalid-msg" data-for="uploadStat"></span>').appendTo(container);
                }
            }       /* 상태 */
            ,{field:"taxpayerIdCd", title:"<spring:message code='sal.lbl.PayTaxPinNo' />", width:150,attributes:{"class":"ac"}}     /* 식별번호 */
            ,{field:"receiptCustNm", title:"<spring:message code='sal.lbl.publsNm' />", width:150,attributes:{"class":"ac"}}        /* 영수증발행자 */
            ,{field:"custSaleDt", title:"<spring:message code='sal.lbl.retlDt' />", width:150
                ,format: "{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac"}
             }      /* 소매일자 */
            ,{field:"receiptIssDt", title:"<spring:message code='sal.lbl.ReceiptPubDt' />", width:150
                ,format: "{0:<dms:configValue code='dateFormat' />}"
                ,attributes:{"class":"ac"}
             }      /* 발행일자 */
            //,{field:"receiptStat", title:"<spring:message code='sal.lbl.UnUploadCause' />", width:100,attributes:{"class":"ac"}}    /* 미업로드 원인 */

        ]
    });
    // 영수증스캔이력관리 그리드 종료

});


</script>
<!-- [DMS] 영수증스캔이력관리 -->