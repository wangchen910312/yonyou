<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>


<div id="resizableContainer">
    <!-- 블루멤버십 정산 -->
    <section class="group">
    <div class="header_area">
        <h1 class="title_basic">
            <spring:message code="crm.title.blueMembershipCalc" />
        </h1>
        <!-- 블루멤버십 정산(蓝缤会员清算) -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-13200" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnResponse"> <!-- 응답 -->
                    <spring:message code="crm.lbl.BMResponse" />
                </button>
            </dms:access>
            <div class="btn_right">
                <dms:access viewId="VIEW-D-13202" hasPermission="${dms:getPermissionMask('READ')}">
                   <button type="button" class="btn_m" id="btnExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
                </dms:access>
            </div>
            <dms:access viewId="VIEW-D-13201" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"> <!-- 조회 -->
                    <spring:message code="global.btn.search" />
                </button>
            </dms:access>
        </div>
    </div>
    <div class="table_form">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width: 10%;">
                <col style="width: 24%;">
                <col style="width: 66%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message
                            code='crm.lbl.calcRequestDt' />
                    </th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" name="sStartDt" class="form_datepicker ac" data-type="maskDate">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" name="sEndDt" class="form_datepicker ac" data-type="maskDate">
                            </div>
                        </div>
                    </td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="table_grid mt10">
        <div id="bmBhmcCalcGrid"></div>
    </div>
    </section>
    <!-- //블루멤버십 정산 -->

    <!-- 조회 결과 -->
    <section class="group">
    <div class="header_area">
        <h2 class="title_basic">
            <spring:message code="global.title.searchResult" /><!-- 조회결과 -->
        </h2>
    </div>
    <div class="table_grid">
        <div id="blueMemResultGrid" class="resizable_grid"></div>
    </div>


    </section>
    <!-- //조회 결과 -->

    <!--  ************************** assignDiv **************************** -->
    <section id="approvalDiv" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnApproval" class="btn_s"> <!-- 동의함 -->
                <spring:message code='crm.btn.agree' />
            </button>
            <button id="btnReject" class="btn_s"> <!-- 동의하지않음 -->
                <spring:message code='crm.btn.disagree' />
            </button>
        </div>
    </div>
    <div>
        <div class="table_form form_width_100per">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message
                                code='global.lbl.cont' />
                            <!-- 내용 -->
                        </th>
                        <td colspan="7"><textarea id="remark"
                                name="remark" type="testarea"
                                class="form_textarea" rows="5"
                                data-json-obj="true" maxlength="1000"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    </section>
</div>

<!-- script -->
<script>

    // BM 정산 응답요청.
    function updateBlueMembershipCalcAcceptInfo(type) {

        var param = {};
        var grid = $('#bmBhmcCalcGrid').data('kendoExtGrid');
        var selectedItem = grid.dataItem(grid.select());
        var calcSeq = selectedItem.calcSeq;

        if(selectedItem.calcAcceptDt!=null){
            //이미 응답한 정산입니다.
            dms.notification.warning("<spring:message code='crm.lbl.alreadyBMResponse' />");
            var assignDiv = $("#approvalDiv").data("kendoWindow");
            assignDiv.close();
            return;
        };

        if(dms.string.isEmpty(type)){
            // {정산 동의 여부}을 확인해주세요
            dms.notification.warning("<spring:message code='crm.lbl.calcAcceptYn' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
            return false;
        };

        var remark = $("#remark").val();

        if(dms.string.isEmpty(remark)){
            // {내용}을(를) 입력해주세요.
            dms.notification.warning("<spring:message code='global.lbl.cont' var='returnMsg' /><spring:message code='global.info.emptyCheckParam' arguments='${returnMsg}' />");
            return false;
        };

        param["calcSeq"] = calcSeq;
        param["calcAcceptYn"] = type;
        param["calcAcceptYnCont"] = remark;
        //console.log("BM 정산 요청 param : ",JSON.stringify(param));
        //return;

        $.ajax({
            url:"<c:url value='/crm/dmm/blueMembershipCalc/updateBlueMembershipBhmcCalcAcceptInfo.do' />",
            data:JSON.stringify(param),
            type:'POST',
            dataType:'json',
            contentType:'application/json',
            error:function(jqXHR,status,error) {
                dms.notification.error(jqXHR.responseJSON.errors);
            },
            success:function(result) {

                //console.log("result : ",result)
                if ( result ) {

                    dms.notification.success("<spring:message code='crm.info.blueMembershipCalc' var='arguMsg' /><spring:message code='global.info.successMsg' arguments='${arguMsg}'/>");
                    var assignDiv = $("#approvalDiv").data("kendoWindow");
                    assignDiv.close();

                } else {

                    dms.notification.error("<spring:message code='crm.info.blueMembershipCalc' var='arguMsg' /><spring:message code='global.info.failedMsg' arguments='${arguMsg}'/>");

                }

            }//end success
            ,beforeSend:function(xhr) {
                dms.loading.show();
            }
            ,complete:function(xhr, status) {
                dms.loading.hide();
            }
        })//end ajax

    };

    /*************************************************************
     * 데이터 셋업
     *************************************************************/


    // 검색조건 : 정산요청일 시작일-종료일 날짜 비교
    fnChkSearchDate = function(e){
        //if(dms.string.isEmpty($(this).val())){return;}
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

    function gridCommonParams() {

        var grid = $("#bmBhmcCalcGrid").data("kendoExtGrid");
        var selectedVal = grid.dataItem(grid.select());
        var params = {};

        if ( dms.string.isNotEmpty(selectedVal) ) {

            params["sCalcSeq"] = selectedVal.calcSeq;

        }

        return params;

    };

    $(document).ready(function() {

        $("#sStartDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });
        $("#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        /*************************************************************
         * 버튼 영역
         *************************************************************/

         //응답
         $("#btnResponse").kendoButton({
             click:function(e){

                 var grid = $("#bmBhmcCalcGrid").data("kendoExtGrid");
                 var selectedItem = grid.dataItem(grid.select());
                 if(selectedItem!=null) {
                     var approvalDiv = $("#approvalDiv").data("kendoWindow");
                     $("#remark").val("");
                     approvalDiv.center();
                     approvalDiv.open();

                 }else{
                     // {정산 동의여부 일}을(를) 확인하여 주세요.
                     dms.notification.warning("<spring:message code='crm.lbl.calcAcceptDt' var='returnMsg' /><spring:message code='global.info.confirmMsgParam' arguments='${returnMsg}' />");
                     return;
                 };

             }
             , enable:false
         });

        //엑셀Export
        $("#btnExcelExport").kendoButton({
            click:function(e) {

                // 블루멤버십 정산 그리드의 선택된 정산일련번호
                var grid = $("#bmBhmcCalcGrid").data("kendoExtGrid");
                var selectedVal = grid.dataItem(grid.select());

                if ( dms.string.isNotEmpty(selectedVal) ) {

                    var params = {};
                    params = gridCommonParams();

                    // 블루멤버십 정산 상세  엑셀Export 수량 데이터를 조회한다.
                    $.ajax({
                        url:"<c:url value='/crm/dmm/blueMembershipCalc/selectBlueMembershipBhmcCalcDetailsExcelExportCnt.do' />",
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
                                "beanName":"blueMembershipBhmcCalcService"
                                ,"templateFile":"BlueMembershipCalcDetails_Tpl.xlsx"
                                ,"fileName":"<spring:message code='crm.title.blueMembershipCalc' />_<spring:message code='global.title.searchResult' />_"+kendo.toString(new Date(), "yyyy-MM-dd-HHmmss")+".xlsx"
                                ,"sCalcSeq":selectedVal.calcSeq
                            });

                        }
                    });

                } else {
                    //목록을 선택하여 주십시오.
                    dms.notification.info("<spring:message code='global.info.required.select'/>");
                    return;
                }

            }
            , enable:false
        });

        //조회
        $("#btnSearch").kendoButton({
            click:function(e){
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                    return false;
                }
                $("#bmBhmcCalcGrid").data('kendoExtGrid').dataSource.page(1);
                $("#blueMemResultGrid").data("kendoExtGrid").dataSource.data([]);
                $("#btnResponse").data("kendoButton").enable(false);
                $("#btnApproval").data("kendoButton").enable(false);
                $("#btnReject").data("kendoButton").enable(false);
            }
        });

        //동의하지 않음
        $("#btnReject").kendoButton({
            click:function(e){
                var param = {};
                var grid = $('#bmBhmcCalcGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());
                var calcSeq = selectedItem.calcSeq;

                if(selectedItem.calcAcceptDt!=null){
                    //이미 응답한 정산입니다.
                    dms.notification.warning("<spring:message code='crm.lbl.alreadyBMResponse' />");
                    var assignDiv = $("#approvalDiv").data("kendoWindow");
                    assignDiv.close();
                    return;
                }else{
                    updateBlueMembershipCalcAcceptInfo("N");
                };
            }
            , enable:false
        });

        //동의함
        $("#btnApproval").kendoButton({
            click:function(e){
                var param = {};
                var grid = $('#bmBhmcCalcGrid').data('kendoExtGrid');
                var selectedItem = grid.dataItem(grid.select());
                var calcSeq = selectedItem.calcSeq;
                if(selectedItem.calcAcceptDt!=null){
                    //이미 응답한 정산입니다.
                    dms.notification.warning("<spring:message code='crm.lbl.alreadyBMResponse' />");
                    var assignDiv = $("#approvalDiv").data("kendoWindow");
                    assignDiv.close();
                    return;
                }else{
                    updateBlueMembershipCalcAcceptInfo("Y");
                };
            }
            , enable:false
        });

        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        // 블루멤버십 정산 대기 그리드 설정
        $("#bmBhmcCalcGrid").kendoExtGrid({
            gridId:"G-CRM-1208-141600"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/blueMembershipCalc/selectBlueMembershipBhmcCalcs.do' />"
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
                            return kendo.stringify(params);

                        }else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"calcSeq"
                        ,fields:{
                            rnum:{type:"number"}
                            ,calcSeq:{type:"string", editable:false} //정신 일련번호
                            ,calcStartDt:{type:"date", editable:false} //정산 기준 START DAY
                            ,calcEndDt:{type:"date", editable:false} //정산 기준 END DAY
                            ,calcReqDt:{type:"date", editable:false} //정산 요청일
                            ,calcReqAmt:{type:"number", editable:false}//정산 요청 금액
                            ,calcTotAmt:{type:"number", editable:false} //정산 딜러 금액
                            ,calcAcceptYn:{type:"string", editable:false}//동의 여부
                            ,calcAcceptDt:{type:"date", editable:false}//동의,미동의 일
                            ,calcAcceptYnCont:{type:"string", editable:false}//비고
                            ,calcLastDt:{type:"date", editable:false} //정산 최종일
                            ,calcLastAmt:{type:"number", editable:false} //정산 최종 금액
                            ,calcLastCont:{type:"string", editable:false}//정산 최종 비고
                        }
                    }
                }
            }
            ,change:function(e){
                $("#blueMemResultGrid").data("kendoExtGrid").dataSource.read();
                var selectedRows = this.select();
                if(selectedRows.length == 1){
                    var dataItem = this.dataItem(selectedRows[0]);

                    if(dataItem.calcAcceptDt==null){
                        $("#btnResponse").data("kendoButton").enable(true);
                        $("#btnApproval").data("kendoButton").enable(true);
                        $("#btnReject").data("kendoButton").enable(true);

                    }else{
                        $("#btnResponse").data("kendoButton").enable(false);
                        $("#btnApproval").data("kendoButton").enable(false);
                        $("#btnReject").data("kendoButton").enable(false);
                    }
                }
            }
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                    ,attributes:{"class":"ac"}
                    ,filterable:false
                }
               ,{field:"dlrCd", title:"<spring:message code='crm.lbl.dlrCd'/>", hidden:true}// 딜러코드
               ,{field:"calcReqDt", title:"<spring:message code='crm.lbl.calcRequestDt' />", width:100      //정산 요청일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (calcReqDt!== null ){# #= kendo.toString(calcReqDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"calcStartDt", title:"<spring:message code='crm.lbl.startDt' />", width:100      //시작일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (calcStartDt!== null ){# #= kendo.toString(calcStartDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"calcEndDt", title:"<spring:message code='crm.lbl.endDt' />", width:100      //시작일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (calcEndDt !== null ){# #= kendo.toString(calcEndDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"calcReqAmt", title:"<spring:message code='crm.lbl.calcRequestAmt'/>"
                   , attributes:{"class":"ar"}
                   ,format:"{0:n2}"
               }// 정산  요청 금액
               ,{field:"calcTotAmt", title:"<spring:message code='crm.lbl.calcTotalAmt'/>"
                   , attributes:{"class":"ar"}
                   ,format:"{0:n2}"
               }// 딜러 정산  금액
               ,{field:"calcAcceptYn", title:"<spring:message code='crm.lbl.calcAcceptYn'/>", attributes:{"class":"ac"}
                   ,template:"#if (data.calcAcceptDt!== null ){# #= calcAcceptYn # #} else {# #= '' # #}#"}// 딜러 정산  동의 여부
               ,{field:"calcAcceptDt", title:"<spring:message code='crm.lbl.calcAcceptDt' />", width:100      //딜러 정산 동의 여부일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (calcAcceptDt!== null ){# #= kendo.toString(calcAcceptDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"calcAcceptYnCont", title:"<spring:message code='crm.lbl.remark'/>", attributes:{"class":"al"}}// 딜러 정산   동의 여부 비고
               ,{field:"calcLastDt", title:"<spring:message code='crm.lbl.calcLastDt' />", width:100      //최종 정산일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (calcLastDt!== null ){# #= kendo.toString(calcLastDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"calcLastAmt", title:"<spring:message code='crm.lbl.calcLastAmt'/>", attributes:{"class":"ar"}
                   ,format:"{0:n2}"
               }//정산 최종 금액
               ,{field:"calcLastCont", title:"<spring:message code='crm.lbl.remark'/>", attributes:{"class":"al"}}//정산 최종 비고
            ]
            ,autoBind:true
            ,editable:false
            ,height:173
            ,navigatable:false
            ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,enableTooltip:true               //Tooltip 적용, default:false
        }); /* end bmBhmcCalcGrid */

        /*************************************************************
         *   그리드 셋팅
        *************************************************************/
        // 블루멤버십 정산 완료 그리드 설정
        $("#blueMemResultGrid").kendoExtGrid({
            gridId:"G-CRM-1208-141700"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/dmm/blueMembershipCalc/selectBlueMembershipBhmcCalcDetails.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {
                            var params = {};

                            params = gridCommonParams();

                            //console.log("bmResult param : ",kendo.stringify(params))
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
                            rnum:{type:"number"}
                            ,dlrCd:{type:"string"}
                            ,pointHisSeq:{type:"number", validation:{required:true}} //
                            ,custNo:{type:"string", validation:{required:true}} //고객번호
                            ,custNm:{type:"string", validation:{required:true} } //고객명
                            ,col1:{type:"string",  validation:{required:true}} // 타입
                            ,blueMembershipNo:{type:"string", validation:{required:true}} //블루멤버십카드
                            ,pointTp:{type:"string", validation:{required:true}} //유형
                            ,pointCd:{type:"string", validation:{required:true}} //내용
                            ,occrPointVal:{type:"number", validation:{required:true}} //사용포인트
                            ,occrPointCost:{type:"number", validation:{required:true}} //사용포인트환산금액
                            ,occrDt:{type:"date", validation:{required:true}} //날짜
                        }
                    }
                }
                ,aggregate:[
                            { field: "occrPointVal", aggregate: "sum" }
                           ,{ field: "occrPointCost", aggregate: "sum" }
                       ]
            }
            ,dataBound:function(e) {

                var targetCnt = e.sender.dataSource._total;
                if ( targetCnt > 0 ) {
                    $("#btnExcelExport").data("kendoButton").enable(true);
                }else {
                    $("#btnExcelExport").data("kendoButton").enable(false);
                };

            }
            ,columns:[
               {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                    ,attributes:{"class":"ac"}
                    ,filterable:false
                    ,footerTemplate:"<div class='ar'><spring:message code='global.lbl.total' /></div>"  //합계
                }
               ,{field:"occrDt", title:"<spring:message code='global.lbl.date'/>", width:100      //포인트 발생일
                   ,attributes:{"class":"ac tooltip-disabled"}
                   ,template:"#if (occrDt!== null ){# #= kendo.toString(occrDt, '<dms:configValue code='dateFormat' />') # #} else {# #= '' # #}#"
               }
               ,{field:"occrPointVal", title:"<spring:message code='crm.lbl.employPoint'/>",attributes:{"class":"ar"}
                   ,aggregates:["sum"]
                   ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n0')#</div>"
               }// 사용포인트
               ,{field:"occrPointCost", title:"<spring:message code='crm.lbl.PointCost'/>",attributes:{"class":"ar"}
                   ,format:"{0:n2}"
                   ,aggregates:["sum"]
                   ,footerTemplate:"<div class='ar'>#=kendo.toString(sum,'n2')#</div>"
               }// 사용포인트환산금액
               ,{field:"pointCdNm", title:"<spring:message code='global.lbl.cont'/>", attributes:{"class":"ac"},width:120 }// 내용
               ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo'/>", attributes:{"class":"ac"}}// RO 번호
               ,{field:"contractNo", title:"<spring:message code='global.lbl.contractNo'/>", attributes:{"class":"ac"}}// 계약 번호
               ,{field:"custNo", title:"<spring:message code='global.lbl.custNo'/>", hidden:true}// 고객번호
               ,{field:"custNm", title:"<spring:message code='global.lbl.custNm'/>",attributes:{"class":"al"}}// 고객명
               ,{field:"blueMembershipNo", title:"<spring:message code='crm.lbl.blueMemCard'/>", attributes:{"class":"ac"}}// 블루멤버십 카드
            ]
            , autoBind:false
            , indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
            , indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
            , appendEmptyColumn:true           //빈컬럼 적용. default:false
            , enableTooltip:true               //Tooltip 적용, default:false
            , editable:false
            , navigatable:false
            //, sortable:false
        }); /* end blueMemResultGrid */

        $("#approvalDiv").kendoWindow({
            animation:false
            ,draggable: true
            ,modal: false
            ,resizable: false
            ,visible: false
            ,title: "<spring:message code='crm.lbl.bmCalcResponse' />" // 정산요청
            ,width:"950px"
            ,height:"150px"
        }).data("kendoWindow");

    }); /* end ready */
</script>
<!-- //script -->