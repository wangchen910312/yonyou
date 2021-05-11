<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.crm-1.0.js' />"></script>
<div id="resizableContainer">
    <!-- 판매기회 중복 관리 -->
    <section class="group">
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.title.opportunityRepetition" /><!-- 판매기회 중복 관리 --></h1>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-13218" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
             </dms:access>
             <dms:access viewId="VIEW-D-13217" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" id="btnCtlExcelExport" class="btn_m btn_excel "><spring:message code='global.btn.excelExport' /><!-- 엑셀다운로드 Excel下?--></button>
            </dms:access>
            </div>
        </div>
        <div class="table_form" role="search" data-btnid="btnSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:8%;">
                            <col style="width:23%;">
                            <col>
                            <col style="width:9%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.customer' /></th> <!-- 고객 客?-->
                                <td>
                                    <input type="text" id="sCust" value="" class="form_input" placeholder="<spring:message code='crm.lbl.custNmHpNo' />"  />
                                </td>
                                <td class="ar">
                                    <button type="button" id="btnHidden" class="btn_xs2 btn_detail"><spring:message code='crm.lbl.more' /></button> <!-- 더많음  ?件?情-->
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
        <div class="table_form mt5" id="hiddenTable" role="search" data-btnid="btnSearch" >
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:8%;">
                    <col style="width:15%;">
                    <col style="width:10%;">
                    <col style="width:20%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="crm.lbl.approchLocation" /><!-- 리드출처 --></th>
                        <td>
                            <input id="sHoldTp" name="sHoldTp" class="form_comboBox" maxlength="20" />
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.infoType" /><!-- 리드유형 --></th>
                        <td>
                            <input id="sInfoTp" name="sInfoTp" class="form_comboBox" maxlength="14" />
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.opptRegistDt" /><!-- 일시  --></th>
                        <td>
                            <div class="form_float">
                                <div class="date_left">
                                    <input type="text" id="sStartDt" name="sStartDt" class="form_datepicker" />
                                    <span class="txt_from">~</span>
                                </div>
                                    <div class="date_right">
                                    <input type="text" id="sEndDt" name="sEndDt" class="form_datepicker" />
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.purposeTag' /></th> <!-- 판매채널 -->
                        <td>
                             <input type="text" id="sPurposeTag" value="" class="form_comboBox" />
                        </td>
                        <th scope="row"><spring:message code="crm.lbl.intentionCarline" /><!-- 의향차종 --></th>
                        <td>
                            <input id="sIntrCarlineCd" name="sIntrCarlineCd" class="form_comboBox" maxlength="20" />
                        </td> 
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10" >
            <div id="grid" class="resizable_grid"></div>
        </div>
    </section>
</div>

<script type="text/javascript">

var toDt = kendo.parseDate("<c:out value='${sysDate}' />", "<dms:configValue code='dateFormat' />");
var year = toDt.getFullYear();
var month = toDt.getMonth()+1;
var twoMthAgo = (toDt.getMonth()+1) -3;
var day = toDt.getDate();

var holdTpList = [];
var infoTpList = [];
var holdDetlTpSeqList = [];
var intrCarlineList = [];
var intrModelList = [];
var carlineCdMap = [];

var purposeTagList = [];
var purposeTagMap = [];

<c:forEach var="obj" items="${holdTpList}" >
holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

<c:forEach var="obj" items="${infoTpList}" >
infoTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//차종조회
<c:forEach var="obj" items="${intrCarlineList}">
    intrCarlineList.push({carlineNm:"${obj.carlineNm}", carlineCd:"${obj.carlineCd}"});
    carlineCdMap["${obj.carlineCd}"] = "${obj.carlineNm}";
</c:forEach>

<c:forEach var="obj" items="${purposeTagList}">
purposeTagList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
purposeTagMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>
function gridCommonParams() {
    // 그리드 상세 조회 및 엑셀export 수량 확인을 위한 공통 param
    var params = {};
    params["sCust"]                = $("#sCust").val();
    params["sHoldTp"]              = $("#sHoldTp").data("kendoExtDropDownList").value();        //정보수집경로(리드출처)
    params["sInfoTp"]              = $("#sInfoTp").val();    //리드유형(리드유형)
    params["sIntrCarlineCd"]       = $("#sIntrCarlineCd").data("kendoExtDropDownList").value(); //의향차종
    params["sStartDt"]             = $("#sStartDt").data("kendoExtMaskedDatePicker").value();
    params["sEndDt"]               = $("#sEndDt").data("kendoExtMaskedDatePicker").value();
    params["sPurposeTag"]       = $("#sPurposeTag").data("kendoExtDropDownList").value();
    return params;
};

setKendoDate = function( dtValue){
    return kendo.toString(kendo.parseDate(dtValue),"<dms:configValue code='dateFormat' />");
};

    $(document).ready(function() {
    	$("#sPurposeTag").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , optionLabel:" "   // 전체
            , dataSource:dms.data.cmmCdFilter(purposeTagList)
            , index:0
        });
      //의향차종
        $("#sIntrCarlineCd").kendoExtDropDownList({
            dataTextField:"carlineNm"
            , dataValueField:"carlineCd"
            , dataSource:intrCarlineList
            , optionLabel:" "
         });

      //리드유형(리드유형)
        $("#sInfoTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:infoTpList
            , optionLabel:" "
         });
        //정보수집경로(리드출처)
        $("#sHoldTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            , dataValueField:"cmmCd"
            , dataSource:holdTpList
            , optionLabel:" "
         });

        // 시작일 & 완료일짜
        $("#sStartDt,#sEndDt").kendoExtMaskedDatePicker({
            format:"<dms:configValue code='dateFormat' />"
            ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        });

        if ( month == "1") {
            twoMthAgo = '10';
            year  = parseInt(year) - 1;
        } else if (month == '2') {
            towMthAgo = '11';
            year  = parseInt(year) - 1;
        }

        if(dms.string.isEmpty($("#sStartDt").data("kendoExtMaskedDatePicker").value())){
            $("#sStartDt").data("kendoExtMaskedDatePicker").value(new Date(year,twoMthAgo,'01'));
         }
        if(dms.string.isEmpty($("#sEndDt").data("kendoExtMaskedDatePicker").value())){
            $("#sEndDt").data("kendoExtMaskedDatePicker").value(toDt);
         }

        //버튼 - 엑셀저장
        $("#btnCtlExcelExport").kendoButton({
            click:function(e) {
                if(crmJs.isDateValidPeriod($("#sStartDt").data("kendoExtMaskedDatePicker").value()
                        ,$("#sEndDt").data("kendoExtMaskedDatePicker").value(),'<spring:message code="global.err.checkDateValue"/>')){
                    $("#grid").data("kendoExtGrid").dataSource.page(1);
                }else{
                    $("#sEndDt").data("kendoExtMaskedDatePicker").value(new Date(''));
                    $("#sEndDt").focus();
                    return false;
                }

                var params = {};
                params = gridCommonParams();

                //예치금 충전 결과 목록 엑셀Export 수량 데이터를 조회한다.
                $.ajax({
                    url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectLeadRepetitionExcelExportCnt.do' />",
                    data:JSON.stringify(params),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(resultCnt){
                        <c:set value="100000" var="maxCnt" />;
                        var excelMaxExportCnt = <c:out value="${maxCnt}"/>;

                        if ( resultCnt > excelMaxExportCnt ) {
                            // {엑셀Export}는 { *** 个数} 를 초과할 수 없습니다.
                            dms.notification.warning("<spring:message code='crm.info.excelExport' var='returnMsg1' /><spring:message code='crm.info.maxExcelExportCnt' arguments='${maxCnt}' var='returnMsg2' /><spring:message code='crm.info.maxInfoChk' arguments='${returnMsg1}, ${returnMsg2}' />");
                            return;
                        };

                        var grid = $("#grid").data("kendoExtGrid");
                        var sysDateExcelNm = new Date();
                        var sysDtVal;
                        sysDtVal = sysDateExcelNm.getFullYear()+"-";
                        sysDtVal += sysDateExcelNm.getMonth()+1;
                        sysDtVal += "-"+sysDateExcelNm.getDate();
                        sysDtVal += "-"+sysDateExcelNm.getHours()+sysDateExcelNm.getMinutes()+sysDateExcelNm.getSeconds();

                        dms.ajax.excelExport({
                            "beanName":"salesOpptProcessMgmtService"
                            ,"templateFile":"LeadRepetitionExp_Tpl.xlsx"
                            ,"fileName":"重复商机"+sysDtVal+".xlsx"
                            ,"sCust":$("#sCust").val()
                            ,"sHoldTp":$("#sHoldTp").data("kendoExtDropDownList").value()
                            ,"sInfoTp":$("#sInfoTp").val()
                            ,"sIntrCarlineCd":$("#sIntrCarlineCd").data("kendoExtDropDownList").value()
                            ,"sStartDt":setKendoDate($("#sStartDt").data("kendoExtMaskedDatePicker").value())
                            ,"sEndDt":setKendoDate($("#sEndDt").data("kendoExtMaskedDatePicker").value())
                            ,"whichExcel":"01"
                            ,"sPurposeTag":$("#sPurposeTag").data("kendoExtDropDownList").value()
                        });
                    }
                    ,beforeSend:function(xhr) {
                        dms.loading.hide();
                    }
                    ,complete:function(xhr, status) {
                        dms.loading.hide();
                    }
                });
            }
        });

    //조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $("#grid").data("kendoExtGrid").dataSource.page(1);
        }
    });

    //show/hide
    $("#btnHidden").kendoButton({
        click:function(e){
            $("#hiddenTable").toggle();
            resizeGrid();
        }
    });
    // 판매 기회 중복 grid
     $("#grid").kendoExtGrid({
         gridId:""
         , dataSource:{
             transport:{
                 read:{
                     url:"<c:url value='/crm/cso/salesOpptProcessMgmt/selectLeadRepetition.do' />"
                 }
                 ,parameterMap:function(options, operation) {
                     if (operation === "read") {

                         var params = {};

                         params["recordCountPerPage"]   = options.pageSize;
                         params["pageIndex"]            = options.page;
                         params["firstIndex"]           = options.skip;
                         params["lastIndex"]            = options.skip + options.take;
                         params["sort"]                 = options.sort;

                         params = $.extend(params, gridCommonParams());

                         return kendo.stringify(params);
                     }else if (operation !== "read" && options.models) {
                         return kendo.stringify(options.models);
                     }
                 }
             }
             ,schema:{
                 errors:"error"
                 ,data:"data"
                 ,total:"total"
                 ,model:{
                     id:"seq"
                     ,fields:{
                         seq:{type:"string", editable:false}
                         ,regDt:{type:"date", editable:false}
                         ,regDtFormat:{type:"date", editable:false}
                         ,purposeTagNm:{type:"String", editable:false}
                     }
                 }
                 ,parse:function(d) {
                     if(d.data){
                         $.each(d.data, function(idx, elem) {
                             elem.regDtFormat = kendo.parseDate(elem.regDt, "<dms:configValue code='dateFormat' />");
                         });
                     }
                     return d;
                 }
             }
         }
         ,filterable:false
         ,enableTooltip:true               //Tooltip 적용, default:false
         ,editable:false
         ,navigatable:false
         ,autoBind:true
         ,resizable:true
         ,sortable:true
         ,height:330
         ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
         ,appendEmptyColumn:true
         ,dataBound:function (e) {
             var dataItems = e.sender.dataSource.view();

             if ( dataItems.length > 0 ) {
                 $("#btnCtlExcelExport").data("kendoButton").enable(true);
             } else {
                 $("#btnCtlExcelExport").data("kendoButton").enable(false);
             };
         }
         ,columns:[

            {field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:100 // 리드유형
                ,attributes:{"class":"ac"}
            }
            , {field:"hpNo", title:"<spring:message code='global.lbl.hpNo' />", width:100 // 리드유형
                ,attributes:{"class":"ac"}
            }
            , {field:"infoTpNm", title:"<spring:message code='crm.lbl.infoType' />", width:70 // 리드유형
                ,attributes:{"class":"ac"}
                ,sortable:false
            }
            , {field:"purposeTagNm", title:"<spring:message code='crm.lbl.purposeTag' />", width:90 // 线索标签
                ,attributes:{"class":"ac"}
                ,sortable:true
            }
            , {field:"holdTpNm", title:"<spring:message code='crm.lbl.approchLocation' />", width:70 // 정보경로
                ,attributes:{"class":"al"}
                ,sortable:false
            }
            , {field:"holdDetlTpSeqNm", title:"<spring:message code='global.lbl.sourceSub' />", width:150 // 정보경로상세
                ,attributes:{"class":"al"}
                ,sortable:false
            }
            , {field:"intrCarlineNm", title:"<spring:message code='crm.lbl.intentionCarline' />", width:100 // 의향차종
                ,attributes:{"class":"al"}
                ,sortable:false
            }
            , {field:"intrModelNm", title:"<spring:message code='crm.lbl.intentionModel' />", width:200 // 의향모델
                ,attributes:{"class":"al"}
                ,sortable:false
            }
            ,{field:"regDtFormat", title:"<spring:message code='global.lbl.dateTime' />", width:130, attributes:{"class":"ac"}
                ,attributes:{"class":"ac tooltip-disabled"}
                ,template:"#if (regDtFormat !== null ){# #= kendo.toString(data.regDt, '<dms:configValue code='dateFormat' /> HH:mm') # #} else {# #= '' # #}#"
            }
         ]
     });



});

</script>