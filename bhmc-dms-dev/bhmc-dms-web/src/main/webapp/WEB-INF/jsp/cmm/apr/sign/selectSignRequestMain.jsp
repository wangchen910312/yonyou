<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 결재상신목록 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.signList" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-11422" hasPermission="${dms:getPermissionMask('READ')}">
	            <button class="btn_m" id="btnDetail"><spring:message code="global.btn.detail" /><!-- 상세 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-11423" hasPermission="${dms:getPermissionMask('READ')}">
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
                <col>
                <col style="width:10%;">
                <col style="width:14%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.signReqTitle" /></th>
                    <td>
                        <input type="text" id="sReqTitleNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.signDocStat" /></th>
                    <td>
                        <input type="sSignStatCd" id="sSignStatCd" class="form_comboBox" />
                    </td>
                    <th scope="row"><spring:message code="global.lbl.signDt" /></th>
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
                    <th scope="row"><spring:message code="global.lbl.tempSaveYn" /></th>
                    <td>
                        <input type="text" id="sTempSaveYn" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 결재 요청 목록 그리드 기능버튼 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
</section>
</div>

<script type="text/javascript">
//결재진행상태
var signStatCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${signStatCdList}">
signStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var signStatCdMap = dms.data.arrayToMap(signStatCdList, function(obj){ return obj.cmmCd; });

//상세정보 팝업 오픈
function openDetailPopup(signDocNo, signDocId, tempSaveYn){
    //결재상신 문서가 임시저장 인 경우
    if(tempSaveYn == "Y") {
    	dms.window.popup({
            windowId:"signWritePopupWin"
            ,title:"<spring:message code='global.title.signWrite' />"
            ,content:{
                url:"<c:url value='/cmm/apr/sign/selectSignWritePopup.do?signDocNo="+signDocNo+"&signDocId="+signDocId+"' />"
                ,data:{
                    "callbackFunc":function(data){
                        //결재문서 상신취소시 그리드 재적용
                        $("#grid").data("kendoExtGrid").dataSource.page(1);
                    }
                }
            }
        });

    //결재상신 문서가 임시저장이 아닌 경우
    }else {
        dms.window.popup({
            windowId:"signViewPopupWin"
            ,title:"<spring:message code='global.title.signInfo' />"
            ,content:{
                url:"<c:url value='/cmm/apr/sign/selectSignViewPopup.do?signDocNo="+signDocNo+"' />"
                ,data:{
                    "callbackFunc":function(data){
                        //결재문서 상신취소시 그리드 재적용
                        $("#grid").data("kendoExtGrid").dataSource.page(1);
                    }
                }
            }
        });
    }
}

//기안문작성 팝업화면에서 결재선 변경 팝업 - 임시저장 인 결재문서
function changeSignLine(signLineGrid){
    var signLines = signLineGrid.dataSource.data();

    dms.window.popup({
        windowId:"changeSignLinePopupWin"
        ,title:"<spring:message code='global.title.signLineChange' />"
        ,width:900
        ,height:435
        ,modal:true
        ,content:{
            url:"<c:url value='/cmm/apr/sign/selectChangeSignLinePopup.do' />"
            ,data:{
                 "signLines":JSON.stringify({"total":signLines.length, "data":signLines})
                ,"callbackFunc":function(data){
                    signLineGrid.dataSource.data([]);

                    for (var i = 0; i < data.length; i++) {
                        signLineGrid.dataSource.insert(i, {
                            "signDocLineNo":(i + 1)
                            ,"signTp":data[i].signTp
                            ,"lastSignYn":data[i].lastSignYn
                            ,"signUsrId":data[i].signUsrId
                            ,"signUsrNm":data[i].signUsrNm
                        });
                    }
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

            var dataItem = grid.dataItem(rows);
            openDetailPopup(dataItem.signDocNo, dataItem.signDocId, dataItem.tempSaveYn);
        }
    });
    	
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //조회조건 - 결재진행상태
    $("#sSignStatCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:signStatCdList
    });

    //조회조건 - 기안일자 조회 시작일
    $("#sStartReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 기안일자 조회 종료일
    $("#sEndReqDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 임시저장여부
    $("#sTempSaveYn").kendoExtDropDownList({
        dataSource:["Y","N"]
        ,optionLabel:" "
        ,index:2
    });    

    //그리드 더블클릭시 상세정보 팝업창을 오픈한다.
    $("#grid").on("dblclick", "tr.k-state-selected", function(e){
        var grid = $(e.delegateTarget).data("kendoExtGrid");
        var rows = grid.select();

        if(rows.length > 0){
            var dataItem = grid.dataItem(rows);
            openDetailPopup(dataItem.signDocNo, dataItem.signDocId, dataItem.tempSaveYn);
        }
	});

    //결재상신목록 그리드
    $("#grid").kendoExtGrid({
    	gridId:"G-CMM-0118-092901"
        ,dataSource:{
        	transport:{
            	read:{
                	url:"<c:url value='/cmm/apr/sign/selectSignsRequest.do' />"
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
                     	params["sSignStatCd"] = $("#sSignStatCd").val();
                     	params["sStartReqDt"] = $("#sStartReqDt").data("kendoExtMaskedDatePicker").value();
                     	params["sEndReqDt"] = $("#sEndReqDt").data("kendoExtMaskedDatePicker").value();
                     	params["sTempSaveYn"] = $("#sTempSaveYn").val();

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
		                ,signDocId:{type:"string"}
		                ,signStatCd:{type:"string"}
		                ,reqTitleNm:{type:"string"}
		                ,signEndDt:{type:"date"}
		                ,tempSaveYn:{type:"string"}
		                ,reqEmpNo:{type:"string"}
		                ,reqUsrId:{type:"string"}
		                ,reqUsrNm:{type:"string"}
		                ,reqDt:{type:"date"}
		                ,reqDtFormat:{type:"date"}
		            }
		        }
		        ,parse:function(d) {
		            if(d.data){
		                $.each(d.data, function(idx, elem) {
		                    elem.reqDtFormat = kendo.parseDate(elem.reqDt, "<dms:configValue code='dateFormat' />");
		                });
		            }
		            return d;
		        }
		    }
	    }
        ,selectable:"row"
        ,editable:false
        ,multiSelectWithCheckbox:true
        ,columns:[
        	{field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false, attributes:{"class":"ac"}, _hidden:true}
         	,{field:"signStatCd", title:"<spring:message code='global.lbl.signDocStat' />", width:100, attributes:{"class":"ac"}
            	,template:"# if(signStatCdMap[signStatCd] != null) { # #= signStatCdMap[signStatCd].cmmCdNm# # }#"
           		,filterable:{
   	                cell:{
   	                    showOperators:false
   	                    ,template: function (e) {
   	                        e.element.kendoExtDropDownList({
   	                            dataSource:signStatCdList
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