<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 결재목록 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.signWatiList" /></h1>
        <div class="btn_right">
            <dms:access viewId="VIEW-I-12252" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m" id="btnDetail"><spring:message code='global.btn.detail' /><!-- 상세 --></button>
            </dms:access>
            <dms:access viewId="VIEW-I-12251" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
        </div>
    </div>
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col style="width:14%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.signReqTitle' /></th>
                    <td>
                        <input type="text" id="sReqTitleNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.signDocStat" /></th>
                    <td>
                        <input type="text" id="sSignRsltCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.signUsrNm' /></th>
                    <td>
                        <input type="text" id="sReqUsrNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.signDt' /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input type="text" id="sStartReqDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input type="text" id="sEndReqDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 결재목록 그리드-->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
</section>
</div>

<script type="text/javascript">
//결재선 - 결재처리유형
var signRsltCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${signRsltCdList}">
signRsltCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var signRsltCdMap = dms.data.arrayToMap(signRsltCdList, function(obj){ return obj.cmmCd; });

//상세정보 팝업 오픈
function openDetailPopup(signDocNo){
    dms.window.popup({
        windowId:"signApprPopupWin"
        ,title:"<spring:message code='global.title.signInfo' />"
        ,content:{
            url:"<c:url value='/cmm/apr/sign/selectSignApprPopup.do?signDocNo="+signDocNo+"' />"
            ,data:{
                "callbackFunc":function(data){
                    $("#grid").data("kendoExtGrid").dataSource.page(1);
                }
            }
        }
    });
}

$(document).ready(function() {
    //버튼 - 상세
    $("#btnDetail").kendoButton({
        click:function(e){
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            openDetailPopup(grid.dataItem(rows).signDocNo);
        }
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });
    
    //조회조건 - 결재처리유형
    $("#sSignRsltCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:dms.data.cmmCdFilter(signRsltCdList)
        ,value:"01" //미결
    });

    //조회조건 - 기안일자 조회시작일
    $("#sStartReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 기안일자 조회종료일
    $("#sEndReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //그리드 더블클릭시 상세정보 팝업창을 오픈한다.
    $("#grid").on("dblclick", "tr.k-state-selected", function(e){
        var grid = $(e.delegateTarget).data("kendoExtGrid");
        var rows = grid.select();

        if(rows.length > 0){
            openDetailPopup(grid.dataItem(rows).signDocNo);
        }
    });

    //결재대기목록 그리드
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/apr/sign/selectSignWaitList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sReqTitleNm"] = $("#sReqTitleNm").val();
                        params["sSignRsltCd"] = $("#sSignRsltCd").data("kendoExtDropDownList").value();
                        params["sReqUsrNm"] = $("#sReqUsrNm").val();
                        params["sStartReqDt"] = $("#sStartReqDt").data("kendoExtMaskedDatePicker").value();
                        params["sEndReqDt"] = $("#sEndReqDt").data("kendoExtMaskedDatePicker").value();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"signDocNo"
                    ,fields:{
                         signDocNo:{type:"string"}
                        ,"signLine.signRsltCd":{type:"string"}
                        ,reqTitleNm:{type:"string"}
                        ,reqUsrNm:{type:"string"}
                        ,reqDt:{type:"date"}
                        ,reqDtFormat:{type:"date"}
                        ,signEndDt:{type:"date"}
                        ,signEndDtFormat:{type:"date"}
                    }
                }
	            ,parse:function(d) {
	                if(d.data){
	                    $.each(d.data, function(idx, elem) {
	                        elem.reqDtFormat = kendo.parseDate(elem.reqDt, "<dms:configValue code='dateFormat' />");
	                        elem.signEndDtFormat = kendo.parseDate(elem.signEndDt, "<dms:configValue code='dateFormat' />");
	                    });
	                }
	                return d;
	            }
            }
        }
        ,selectable:"row"
        ,editable:false
        ,columns:[
        	{field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false, attributes:{"class":"ac"}, _hidden:true}
            ,{field:"signLine.signRsltCd", title:"<spring:message code='global.lbl.signRsltCd' />", width:100, attributes:{"class":"ac"}
                ,template:"# if(signRsltCdMap[signLine.signRsltCd] != null) { # #= signRsltCdMap[signLine.signRsltCd].cmmCdNm# # }#"
               	,filterable:{
  	                cell:{
  	                    showOperators:false
  	                    ,template: function (e) {
  	                        e.element.kendoExtDropDownList({
  	                            dataSource:signRsltCdList
  	                            ,dataTextField:"cmmCdNm"
  	                            ,dataValueField:"cmmCd"
  	                            ,valuePrimitive:true
  	                        });
  	                    }
  	                }
  	        	}
            }
            ,{field:"reqTitleNm", title:"<spring:message code='global.lbl.signReqTitle' />"}
            ,{field:"reqUsrNm", title:"<spring:message code='global.lbl.signUsrNm' />", width:150, attributes:{"class":"ac"}}
            ,{field:"reqDtFormat", title:"<spring:message code='global.lbl.signDt' />", width:100, attributes:{"class":"ac"}
                ,template:"#= kendo.toString(data.reqDt, '<dms:configValue code='dateFormat' />') #"
            }
        ]
    });
});
</script>