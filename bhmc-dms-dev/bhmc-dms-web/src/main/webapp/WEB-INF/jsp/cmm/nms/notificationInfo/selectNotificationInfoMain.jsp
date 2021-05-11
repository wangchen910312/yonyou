<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.notificationList" /></h1>
        <div class="btn_right">
	        <dms:access viewId="VIEW-D-12839" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
	        </dms:access>
	        <dms:access viewId="VIEW-D-12840" hasPermission="${dms:getPermissionMask('READ')}">
	            <button type="button" class="btn_m btn_save" id="btnCompletion"><spring:message code="global.btn.completion" /><!-- 완료 --></button>
	        </dms:access>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
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
                    <th scope="row"><spring:message code="global.lbl.hndlYn" /></th>
                    <td>
                        <input id="sSendYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.hndlDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartSendDt" name="sStartSendDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndSendDt" name="sEndSendDt" class="form_datepicker" />
                            </div>
                        </div>
                    </td>
                    <th scope="row"><spring:message code="global.lbl.openYn" /></th>
                    <td>
                        <input id="sReceiveYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.openDt" /></th>
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartReceiveDt" name="sStartReceiveDt" class="form_datepicker" />
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndReceiveDt" name="sEndReceiveDt" class="form_datepicker" />
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
$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {          	
        	$('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 처리완료
    $("#btnCompletion").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var selectedRows = grid.select();
            var list = [];

            if (selectedRows.length == 0) {
                //목록을 선택하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.required.select' />");
                return;
            }

            selectedRows.each(function(idx, obj){
                list.push(grid.dataItem(obj).mesgId);
            });

            $.ajax({
                url:"<c:url value='/cmm/nms/notificationMessage/updateNotificationInfoRcve.do' />",
                data:JSON.stringify(list),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                },
                success:function(jqXHR, textStatus) {
                    grid.dataSource.page(1);

                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });
    
    //조회조건 - 처리여부
    $("#sSendYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
    });
    $("#sSendYn").data("kendoExtDropDownList").value("N");

    //조회조건 - 처리일자 조회시작일
    $("#sStartSendDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 처리일자 조회종료일
    $("#sEndSendDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 확인여부
    $("#sReceiveYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
    });

    //조회조건 - 확인일자 조회시작일
    $("#sStartReceiveDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });

    //조회조건 - 확인일자 조회종료일
    $("#sEndReceiveDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
    });    

    //그리드 설정
    $("#grid").kendoExtGrid({
        dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/nms/notificationMessage/selectNotifications.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sSendYn"] = $("#sSendYn").data("kendoExtDropDownList").value();                          //처리여부
                        params["sStartSendDt"] = $("#sStartSendDt").data("kendoExtMaskedDatePicker").value();         //처리일자 조회시작일
                        params["sEndSendDt"] = $("#sEndSendDt").data("kendoExtMaskedDatePicker").value();             //처리일자 조회종료일
                        params["sReceiveYn"] = $("#sReceiveYn").data("kendoExtDropDownList").value();                    //확인여부
                        params["sStartReceiveDt"] = $("#sStartReceiveDt").data("kendoExtMaskedDatePicker").value();   //확인일자 조회시작일
                        params["sEndReceiveDt"] = $("#sEndReceiveDt").data("kendoExtMaskedDatePicker").value();       //확인일자 조회종료일

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgId"
                    ,fields:{
                         rnum:{type:"number"}
                        ,mesgCont:{type:"string"}
                        ,mesgCreDt:{type:"date"}
                        ,mesgCreDtFormat:{type:"date"}
                        ,sendDt:{type:"date"}
                        ,sendDtFormat:{type:"date"}
                        ,receiveDt:{type:"date"}
                        ,receiveDtFormat:{type:"date"}
                    }
                }
	            ,parse:function(d) {
	                if(d.data){
	                    $.each(d.data, function(idx, elem) {
	                        elem.mesgCreDtFormat = kendo.parseDate(elem.mesgCreDt, "<dms:configValue code='dateFormat' />");
	                        elem.sendDtFormat = kendo.parseDate(elem.sendDt, "<dms:configValue code='dateFormat' />");
	                        elem.receiveDtFormat = kendo.parseDate(elem.receiveDt, "<dms:configValue code='dateFormat' />");
	                    });
	                }
	                return d;
	            }
            }
        }
        ,multiSelectWithCheckbox:true
        ,appendEmptyColumn:true
        ,editable:false
        ,dataBound:function(e) {
            var grid = e.sender;
            $(grid.tbody).on("click", "td", function (e) {
                var row = $(this).closest("tr");
                var colIdx = $("td", row).index(this);

                //Todo 내역을 클릭한 경우
                if(colIdx == 2){
                    var dataItem = grid.dataItem(row);

                    //확인여부/처리여부 등 Todo 정책에 따라 후 처리 진행한다.
                    $.ajax({
                        url:"<c:url value='/cmm/nms/notificationMessage/updateActionNotificationInfo.do' />",
                        data:"mesgId="+dataItem.mesgId,
                        type:'POST',
                        dataType:'json',
                        error:function(jqXHR,status,error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        },
                        success:function(jqXHR, textStatus) {

                            var viewId = jqXHR.viewId;
                            var viewNm = jqXHR.viewNm;
                            var viewUrl = jqXHR.viewUrl;
                            var tCd = jqXHR.tCd
                            var viewParams = jqXHR.viewParams;
                            var needReload = jqXHR.needReload;
                            var needPostAction = jqXHR.needPostAction;

                            //Todo 리스트 그리드 릴로드
                            if(needReload === true){
                                grid.dataSource.read();
                            }

                            //Todo 액션URL 메뉴 생성
                            if(needPostAction === true){
                                if(viewParams){
                                    viewUrl = viewUrl + (viewUrl.match( /[\?]/g ) ? '&' : '?' + viewParams);
                                }

                                parent._addTabMenu(viewNm, _contextPath + viewUrl, tCd, viewId, false, true);
                            }
                        }
                    });

                }
            });
        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"mesgCont", title:"<spring:message code='global.lbl.notificationList' />", width:500}
            ,{field:"mesgCreDtFormat", title:"<spring:message code='global.lbl.regDt' />", width:150
                ,attributes:{"class":"ac"}
                ,template:"#= dms.string.defaultString(kendo.toString(data.mesgCreDt, '<dms:configValue code='dateTimeFormat' />'), '') #"
            }
            ,{field:"sendDtFormat", title:"<spring:message code='global.lbl.hndlDt' />", width:150
                ,attributes:{"class":"ac"}
                ,template:"#= dms.string.defaultString(kendo.toString(data.sendDt, '<dms:configValue code='dateTimeFormat' />'), '') #"
            }
            ,{field:"receiveDtFormat", title:"<spring:message code='global.lbl.openDt' />", width:150
                ,attributes:{"class":"ac"}
            	,template:"#= dms.string.defaultString(kendo.toString(data.receiveDt, '<dms:configValue code='dateTimeFormat' />'), '') #"
            }
        ]
    });
});
</script>