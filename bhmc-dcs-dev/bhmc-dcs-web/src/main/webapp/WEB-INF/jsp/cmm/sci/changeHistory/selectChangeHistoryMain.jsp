<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 시스템변경이력 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.systemChangeHistory" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12202" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_50per" role="search" data-btnid="btnSearch">
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
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.system" /><!-- 시스템 --></th>
                    <td>
                        <input type="text" id="sSysDstinCd" name="sSysDstinCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.workType" /><!-- 작업유형 --></th>
                    <td>
                        <input type="text" id="sChgTp" name="sChgTp" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.worker" /><!-- 작업자 --></th>
                    <td>
                        <input type="text" id="sChgUsrNm" name="sChgUsrNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="cmm.lbl.stdDt" /><!-- 기준기간 --></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sChgStartDt" name="sChgStartDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sChgEndDt" name="sChgEndDt" class="form_datepicker" />
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
//시스템
var arrSystemTp = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${arrSystemTp}">
arrSystemTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var systemTpMap = dms.data.arrayToMap(arrSystemTp, function(obj){ return obj.cmmCd; });

//실행유형
var arrWorkTp = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${arrWorkTp}">
arrWorkTp.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}"});
</c:forEach>
var workTpMap = dms.data.arrayToMap(arrWorkTp, function(obj){ return obj.cmmCd; });

// 상세정보 팝업
var detailPopupWin;
fnDetailPopup = function(sChgHisSeq) {
    detailPopupWin = dms.window.popup({
       windowsId:"detailPopupWin"
     , title:"<spring:message code='ser.title.campaign.detailInfo' />"
     , content:{
          url:"<c:url value='/cmm/sci/changeHistory/selectChangeHistoryDetailPopup.do' />"
        , data:{
             "autoBind":false
           , "sChgHisSeq":sChgHisSeq
           , "callbackFunc":function(data){
               /* // 정상적으로 반영 되었습니다.
               dms.notification.success("<spring:message code='global.info.success'/>"); */
             }
          }
       }
    });
}

$(document).ready(function() {
    // 버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });
    
    //조회조건 - 시스템
    $("#sSysDstinCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
      , dataValueField:"cmmCd"
      , dataSource:arrSystemTp
    });

    //조회조건 - 실행유형
    $("#sChgTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
      , dataValueField:"cmmCd"
      , dataSource:arrWorkTp
    });
    
  	//조회조건 - 기준기간 조회 시작일
    $("#sChgStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

    //조회조건 - 기준기간 조회 종료일
    $("#sChgEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    });

 	// 그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/sci/changeHistory/selectChangeHistory.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSysDstinCd"] = $("#sSysDstinCd").val();
                        params["sChgTp"] = $("#sChgTp").val();
                        params["sChgUsrNm"] = $("#sChgUsrNm").val();
                        params["sChgStartDt"] = $("#sChgStartDt").val();
                        params["sChgEndDt"] = $("#sChgEndDt").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
            	model:{
                	id:"chgHisSeq"
                  	,fields:{
                    	 rnum:{type:"number", editable:false}
                      	,chgHisSeq:{type:"number", editable:false}
                      	,chgDt:{type:"date", editable:false}
                      	,chgDtFormat:{type:"date", editable:false}
                      	,chgUsrNm:{type:"string", editable:false}
                      	,sysDstinCd:{type:"string"}
                      	,chgTp:{type:"string", editable:false}
                    }
                }
	            ,parse:function(d) {
	                if(d.data){
	                    $.each(d.data, function(idx, elem) {
	                        elem.chgDtFormat = kendo.parseDate(elem.chgDt, "<dms:configValue code='dateFormat' />");
	                    });
	                }
	                return d;
	            }
            }
        }
        ,editable:false
        ,selectable:"row"
        ,change:function(e) {
            var selectedVal = this.dataItem(this.select());
            fnDetailPopup(selectedVal.chgHisSeq);
        }
        ,height:428
        ,appendEmptyColumn:true
        ,columns:[
        	{field:"rnum", title:"<spring:message code='global.lbl.no' />" , width:60, sortable:false, filterable:false, attributes:{"class":"ac"}}
          	,{field:"chgDtFormat", title:"<spring:message code='global.lbl.workDt' />", width:150, attributes:{"class":"ac"}
          		,template:"#= kendo.toString(data.chgDt, '<dms:configValue code='dateTimeFormat' />') #"
          	}
          	,{field:"chgUsrNm",  title:"<spring:message code='global.lbl.worker' />", width:120}
          	,{field:"sysDstinCd",  title:"<spring:message code='global.lbl.system' />", width:150, attributes:{"class":"ac"}
            	,template:"# if(systemTpMap[sysDstinCd] != null) { # #= systemTpMap[sysDstinCd].cmmCdNm# # }#"
           		,filterable:{
   	                cell:{
   	                    showOperators:false
   	                    ,template: function (e) {
   	                        e.element.kendoExtDropDownList({
   	                            dataSource:arrSystemTp
   	                            ,dataTextField:"cmmCdNm"
   	                            ,dataValueField:"cmmCd"
   	                            ,valuePrimitive:true
   	                        });
   	                    }
   	                }
   	        	}
          	}
          	,{field:"chgTp",  title:"<spring:message code='global.lbl.workType' />", width:70, attributes:{"class":"ac"}
            	,template:"# if(workTpMap[chgTp] != null) { # #= workTpMap[chgTp].cmmCdNm# # }#"
           		,filterable:{
   	                cell:{
   	                    showOperators:false
   	                    ,template: function (e) {
   	                    	e.element.kendoExtDropDownList({
   	                            dataSource:arrWorkTp
   	                            ,dataTextField:"cmmCdNm"
   	                            ,dataValueField:"cmmCd"
   	                            ,valuePrimitive:true
   	                        });
   	                    }
   	                }
   	        	}
          	}
        ]
    });
});
</script>