<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section id="windows" class="pop_wrap">
<form id="incForm" name="incForm" method="POST">

    <div class="tab_area" id="tabstrip"> <!-- 탭메뉴 시작-->
        <ul>
            <li id="activeAddTab" class="k-state-active" ><spring:message code="crm.lbl.activeAdd" /> <!-- 추적추가 增加跟踪--></li>
            <li id="historyTab"><spring:message code="crm.lbl.historyRecord" /> <!-- 이력기록--></li>
        </ul>
        <span class="btn_right_absolute2">
            <button type="button" id="btnCtlSaveTrace" class="btn_m activeAddTab"><spring:message code="crm.btn.activeSave" /><!-- 추적 저장 --></button>
            <button type="button" id="btnCtlCancel" class="btn_m btn_Cancel activeAddTab"><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
        </span>

        <div class="mt0">
            <div class="table_form form_width_100per"> <!-- 추적 시작-->
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
                            <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.traceMth" /></span></th> <!-- 추적방식 -->
                            <td>
                                <input id="traceMthCd" name="traceMthCd" type="text" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.traceDt" /></span></th> <!-- 추적시간 -->
                            <td colspan="2">
                                <input id="traceDt" name="traceDt" type="text" class="form_datetimepicker"  data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="crm.lbl.nextTraceMthCd" /></th> <!-- 다음추적방식 -->
                            <td>
                                <input id="nextTraceMthCd" name="nextTraceMthCd" type="text" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <th scope="row"><spring:message code="crm.lbl.nextTraceDt" /></th> <!-- 다음추적시간 -->
                            <td colspan="2">
                                <input id="nextTraceDt" name="nextTraceDt" type="text" class="form_datetimepicker"  data-json-obj="true" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="crm.lbl.traceCont" /></span></th> <!-- 추적상황 -->
                            <td colspan="7">
                                <textarea id="traceCont" name="traceCont" rows="5" class="form_textarea" maxlength="500" data-json-obj="true" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="sal.lbl.incIsStats" /></span></th> <!-- 처리상태 -->
                            <td>
                                <input id="traceGradeCd" name="traceGradeCd" type="text" class="form_comboBox"  data-json-obj="true" />
                            </td>
                            <td colspan="6"></td>
                        </tr>
                    </tbody>
                </table>
            </div> <!-- 추적 끝-->                
        </div>
        <div class="mt0">
            <div class="table_grid">
                <div id="historyTabGrid"></div>
            </div>
        </div>
    </div>
    
    <!-- hidden값  -->
    <span style="display:none">
        <input id="incNo" name="incNo" data-json-obj="true"  />
        <input id="dlrCd" name="dlrCd" data-json-obj="true"  />
    </span>    
</form>
</section>



<!-- #스크립트 영역# --> 
<script type="text/javascript">
<!--

var dlrCd  = "${dlrCd}";
var userId = "${userId}";
var toDay = "${toDay}";         // 현재일자

//팝업 설정값
var options = parent.popupWindow.options.content.data;

var selectTabId = "activeAddTab";
$("#tabstrip").kendoExtTabStrip({
    animation:false
    , select:function(e) {
        selectTabId = e.item.id;
        
        if(selectTabId == "historyTab"){
            $(".activeAddTab").hide();
            $("#historyTabGrid").data("kendoExtGrid").dataSource.page(1);
        }else{
            $(".activeAddTab").show();
        }
    }
});

// 추적방식 (CRM377)
var traceMthCdList = [];
var traceMthCdMap = {};
<c:forEach var="obj" items="${traceMthCdList}">
    traceMthCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    traceMthCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

// 추적등급 (SAL209)
var traceGradeCdList = [];
var traceGradeCdMap = {};
<c:forEach var="obj" items="${traceGradeCdList}">
    traceGradeCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    traceGradeCdMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

/******************************************
 * ready ()
 ******************************************/
$(document).ready(function() {
    
    if(dms.string.isEmpty(options.sIncNo)){
        options.callbackFunc();
        parent.popupWindow.close();
    }
    
    $("#incNo").val(options.sIncNo);
    $("#dlrCd").val(options.sDlrCd);
    
    // 추적저장
    $("#btnCtlSaveTrace").kendoButton({
        click:function(e) {
            
            var saveData = {};
            saveData = $("#incForm").serializeObject($("#incForm").serializeArrayInSelector("[data-json-obj='true']")) ;
            saveData.traceMthCd     = $("#traceMthCd").data("kendoExtDropDownList").value();
            saveData.nextTraceMthCd = $("#nextTraceMthCd").data("kendoExtDropDownList").value();
            saveData.traceGradeCd   = $("#traceGradeCd").data("kendoExtDropDownList").value();
            saveData.traceDt        = $("#traceDt").data("kendoExtMaskedDatePicker").value();
            saveData.nextTraceDt    = $("#nextTraceDt").data("kendoExtMaskedDatePicker").value();
            saveData.useYn          = "Y";
            
            if(dms.string.isEmpty(saveData.traceMthCd)){
                dms.notification.info("<spring:message code='crm.lbl.traceMth' var='crmLblTraceMth' /><spring:message code='global.info.chkSelectItemMsg' arguments='${crmLblTraceMth}' />");
                $("#traceMthCd").focus();
                return false;
            }
            if(dms.string.isEmpty(saveData.traceDt)){
                dms.notification.info("<spring:message code='crm.lbl.traceDt' var='crmLblTraceDt' /><spring:message code='global.info.chkSelectItemMsg' arguments='${crmLblTraceDt}' />");
                $("#traceDt").focus();
                return false;
            }
            if(dms.string.isEmpty(saveData.traceCont)){
                dms.notification.info("<spring:message code='crm.lbl.traceCont' var='crmLblTraceCont' /><spring:message code='global.info.chkSelectItemMsg' arguments='${crmLblTraceCont}' />");
                $("#traceCont").focus();
                return false;
            }
            if(dms.string.isEmpty(saveData.traceGradeCd)){
                dms.notification.info("<spring:message code='crm.lbl.activeGrade' var='crmLblActiveGrade' /><spring:message code='global.info.chkSelectItemMsg' arguments='${crmLblActiveGrade}' />");
                $("#traceGradeCd").focus();
                return false;
            }
            
            dms.window.confirm({
                message:"<spring:message code='crm.btn.activeSave' var='save' /><spring:message code='global.info.andMsg' arguments='${save}' />"
                ,title :"<spring:message code='crm.btn.activeSave' />"
                ,callback:function(result){
                    if(result){
                        $.ajax({
                            url:"<c:url value='/sal/inc/incJoinInfo/multiIncProcess.do' />"
                            ,data:JSON.stringify(saveData)
                            ,type:'POST'
                            ,dataType:'json'
                            ,contentType:'application/json'
                            ,error:function(request,status,error){
                                dms.notification.error(request.responseJSON.errors[0].errorMessage);
                            }
                        }).done(function(result) {
                            var grid = $("#historyTabGrid").data("kendoExtGrid");
                            refreshAll();
                            grid.dataSource.page(1);

                            $("#tabstrip").data("kendoExtTabStrip").select(1);
                            selectTabId = "historyTab";
                    
                            //정상적으로 반영 되었습니다.
                            dms.notification.success("<spring:message code='global.info.success'/>");
                        });
                        
                    }else{
                        return false;
                    }
                }
            });
        }
    });    

    // 취소
    $("#btnCtlCancel").kendoButton({
        click:function(e) {
            parent.popupWindow.close();
        }
    });
    
    // 추적방식
    $("#traceMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:dms.data.cmmCdFilter(traceMthCdList)
        , index:0
    });

    // 추적시간
    $("#traceDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });
    $("#traceDt").data("kendoExtMaskedDatePicker").value(toDay);

    // 다음추적방식
    $("#nextTraceMthCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:dms.data.cmmCdFilter(traceMthCdList)
        , index:0
    });

    // 다음추적시간
    $("#nextTraceDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
       ,dateValidMessage :"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    // 추적등급
    $("#traceGradeCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:dms.data.cmmCdFilter(traceGradeCdList)
        , index:0
    });
    
    // 이력
    $("#historyTabGrid").kendoExtGrid({
        gridId :"G-SAL-0204-150202"
        ,dataSource :{
            transport :{
                read :{
                    url :"<c:url value='/sal/inc/incJoinInfo/selectIncProcessPopupSearch.do' />"
                },
                parameterMap :function(options, operation) {
                    if (operation == "read") {

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        // 딜러코드
                        params["sDlrCd"] = dlrCd;
                        params["sIncNo"] = $("#incNo").val();
                        
                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,batch :false
            ,schema :{
                model :{
                    id :"seq",
                    fields :{
                        seq:{type:"string", editable:false}
                        ,rnum  :{type:"number" , editable:false}
                        ,mngScNm:{type:"string", editable:true}
                        ,traceMthNm:{type:"string", editable:false}
                        ,traceGradeNm:{type:"string", editable:false}
                        ,traceCont:{type:"string", editable:false}
                        ,nextTraceMthNm:{type:"string", editable:false}
                        ,traceDt:{type:"date", editable:false}
                        ,nextTraceDt:{type:"date", editable:false}
                        ,traceDtFormat:{type:"date", editable:false}
                        ,nextTraceDtFormat:{type:"date", editable:false}               //할인레벨코드
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.traceDtFormat = kendo.parseDate(elem.traceDt, "<dms:configValue code='dateFormat' />");
                            elem.nextTraceDtFormat = kendo.parseDate(elem.nextTraceDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }
        }
       ,filterable:false
       ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,editable:false
       ,navigatable:false
       ,autoBind:false
       ,sortable:false
       ,resizable:true
       ,height:230
       ,columns:[
          {field:"mngScNm", title:"<spring:message code='crm.lbl.tracer' />", width:70, attributes:{"class":"ac"}}
         ,{field:"traceDtFormat", title:"<spring:message code='crm.lbl.traceDt' />", width:80, attributes:{"class":"ac"}
             ,attributes:{"class":"ac tooltip-disabled"}
             ,template:"#= dms.string.strNvl(kendo.toString(data.traceDt, '<dms:configValue code='dateFormat' />')) #"
         }
         ,{field:"traceMthNm", title:"<spring:message code='crm.lbl.traceMth' />", width:70, attributes:{"class":"ac"}}
         ,{field:"traceGradeNm", title:"<spring:message code='sal.lbl.incIsStats' />", width:70, attributes:{"class":"ac"}}
         ,{field:"traceCont", title:"<spring:message code='crm.lbl.traceCont' />", width:200, attributes:{"class":"al"}}
         ,{field:"nextTraceDtFormat", title:"<spring:message code='crm.lbl.nextTraceDt' />", width:80, attributes:{"class":"ac"}
             ,attributes:{"class":"ac tooltip-disabled"}
             ,template:"#= dms.string.strNvl(kendo.toString(data.nextTraceDt, '<dms:configValue code='dateFormat' />')) #"
         }
         ,{field:"nextTraceMthNm", title:"<spring:message code='crm.lbl.nextTraceMthCd' />", width:70, attributes:{"class":"ac"}}
      ]
   });

});
/******************************************
 * ready () = End =
 ******************************************/

function refreshAll() {
    
}

//-->
</script>