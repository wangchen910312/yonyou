<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<script type="text/javascript" src="<c:url value='/resources/js/dms/dms.sales-1.0.js' />"></script>

<!-- 수선시스템 - 인증리스트 -->
<div id="resizableContainer">
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="sal.lbl.shenheList" /></h1><!-- 중고차인증리스트 -->
        <div class="btn_right">
            <dms:access viewId="VIEW-D-11004" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
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
                    <th scope="row"><spring:message code="sal.lbl.requestStat" /></th><!-- 신청상태 -->
                    <td>
                        <input type="text" id="sShenheState" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.oldCarVinNo" /></th><!-- (구)VIN NO -->
                    <td>
                        <input type="text" id="sVinNo" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="sal.lbl.requestTime" /></th><!-- 신청시간 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sCreateStartTime" type="text" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sCreateEndTime" type="text" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->

</section>
<!-- //수선시스템 - 인증리스트 -->
</div>


<script type="text/javascript">
var selectTabId;

//신청상태(인증정보상태)
var shenheStateDs = [];
<c:forEach var="obj" items="${shenheStatList}">
shenheStateDs.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//신청상태(인증정보상태) Map
var shenheStateMap = dms.data.arrayToMap(shenheStateDs, function(obj){ return obj.cmmCd; });

function goCarInfo(carId,id){
	parent._createOrReloadTabMenu("<spring:message code = 'ser.title.carInfo'/>"
    ,"<c:url value='/sal/usc/topSelection/selectVehicleMain.do'/>?carId="+carId+"&id="+id ,"VIEW-D-13031");
}

$(document).ready(function() {
    //신청상태
    $("#sShenheState").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:shenheStateDs
        ,optionLabel:" "  // 전체
    });

    //신청시간 - 시작일
    $("#sCreateStartTime").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:oneDay
    });
    //신청시간 - 종료일
    $("#sCreateEndTime").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        //,value:toDay
    });
    /*************************** 검색 조건 영역 END **************************************************/

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            var fromDt = $("#sCreateStartTime").data("kendoExtMaskedDatePicker").value();
            var toDt = $("#sCreateEndTime").data("kendoExtMaskedDatePicker").value();

            if(salesJs.validate.isFromDateValid(fromDt, toDt)) {
               dms.notification.warning("<spring:message code='global.lbl.startDt' var='globalLblStartDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblStartDt}' />");
               $("#sCreateStartTime").focus();
               return false;
            }
            if(salesJs.validate.isFromDateValid(toDt, fromDt)) {
               dms.notification.warning("<spring:message code='global.lbl.EndDt' var='globalLblEndDt' /><spring:message code='global.info.emptyParamInfo' arguments='${globalLblEndDt}' />");
               $("#sCreateEndTime").focus();
               return false;
            }

            if(!salesJs.validate.isDateValidPeriod(fromDt, toDt)){
               dms.notification.warning("<spring:message code='global.err.checkDateValue' />");
               $("#sCreateEndTime").data("kendoExtMaskedDatePicker").value(new Date(''));
               $("#sCreateEndTime").focus();
               return false;
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    /*************************** 버튼  영역 END **************************************************/

    $("#vehicleOptionPrintPopup").kendoWindow({
   		modal:true
    	,visible:false
    	,iframe:true
	});

    //그리드 설정
    $("#grid").kendoExtGrid({
    	dataSource:{
       		transport:{
                read:{
                    url:"<c:url value='/sal/usc/topSelection/selectCreditList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sShenheStat"] = $("#sShenheState").data("kendoExtDropDownList").value();                       	// CAR ID
                        params["sVinNo"] = $("#sVinNo").val();                                                         			// VIN NO
                        params["sCreateStartTime"]= $("#sCreateStartTime").data("kendoExtMaskedDatePicker").value();            // 신청시간 - 시작일자
                        params["sCreateEndTime"]  = $("#sCreateEndTime").data("kendoExtMaskedDatePicker").value();              // 신청시간 - 종료일자

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    fields:{
                        vin:{type:"string"}
                        ,id:{type:"string"}
                        ,carId:{type:"string"}
                        ,carstyle:{type:"string"}
                        ,shenhesubmittimes:{type:"number"}
                        ,createtime:{type:"date"}
                        ,shenhestate:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,appendEmptyColumn:true
        ,dataBound:function(e){
        	//원인보기
        	$(".cause", e.sender.tbody).click(function(){
        		var breason = $(this).data("breason");

        		var vehicleOptionCausePopup = dms.window.popup({
        	        windowId:"VehicleOptionCausePopup"
        	        ,title:"<spring:message code='global.lbl.viewCause' />"
        	        ,width:400
        	        ,height:200
        	    });

        		vehicleOptionCausePopup.content("<p style='padding:10px;'>"+breason+"</p>");
        	});

        	//출력
        	$(".print", e.sender.tbody).click(function(){
        		var carId = $(this).data("carId");

        		dms.window.popup({
        	        windowId:"VehicleOptionPrintPopup"
        	        ,title:"<spring:message code='global.lbl.print' />"
        	        ,width:970
        	        ,height:613
        	        ,content:{
        	            url:"http://zhihuan.xd2sc.com/Admin/CarExApp/PrintZhengshu1.aspx?carid="+carId
        	        }
        	        ,open:function(e){
                        //팝업창을 오픈할때 iframe이 로드 될때까지 로딩 이미지를 출력한다.
                        if(e.sender.options.iframe){
                            var iframeLoader = $("<div/>");
                            iframeLoader.css({
                                position:"absolute"
                                ,top:0
                                ,left:0
                                ,width:e.sender.options.width
                                ,height:e.sender.options.height
                                ,background:"#ffffff url('"+_contextPath+"/resources/img/loading-image.gif') no-repeat scroll 50% 50%"
                            });

                            var iframe = $("iframe", e.sender.element);

                            iframe.load(function(){
                                iframeLoader.remove();
                            });

                            iframeLoader.appendTo(e.sender.element);
                        }
                    }
        	    });
        	});
        }
        ,columns:[
        	 {field:"vin", title:"<spring:message code = 'sal.lbl.oldCarVinNo'/>", width:150}											//VIN
        	,{field:"carstyle", title:"<spring:message code = 'sal.lbl.oldCarNm'/>", width:300											//중고차명칭
            	,template:"<a class='k-link' onclick=\"goCarInfo('#= carId #','#= id #'); \">#= carstyle #</a>"
           	}
           	,{field:"shenhesubmittimes", title:"<spring:message code = 'sal.lbl.submitCount'/>", width:80, attributes:{"class":"ac"}		//제출회수
               	,template:function(dataItem){
               		if(dataItem.shenhesubmittimes > 1){
               			return "<spring:message code='sal.lbl.someSubmitTime'/>";
               		}else if(dataItem.shenhesubmittimes == 1){
               			return "<spring:message code='sal.lbl.submitFirstTime'/>";
               		}else{
               			return "<spring:message code='sal.lbl.noSubmit'/>";
               		}
               	}
            }
           	,{field:"createtime", title:"<spring:message code = 'sal.lbl.requestTime'/>", width:100, attributes:{"class":"ac"}			//신청시간
               	,format:"{0:<dms:configValue code='dateFormat' />}"
            }
           	,{field:"shenhestate", title:"<spring:message code = 'global.lbl.reqStat'/>", width:80, attributes:{"class":"ac"}			//대출진행진도
	        	,template:function(dataItem){
	        		var shenheStateNm = "";

	        		if(dms.string.isNotEmpty(shenheStateMap[dataItem.shenhestate])){
	        			shenheStateNm = shenheStateMap[dataItem.shenhestate].cmmCdNm;
	        		}

	        		return shenheStateNm;
	        	}
	        }
           	,{_field:"_shenhestate", title:"<spring:message code = 'global.lbl.operation'/>", width:80, attributes:{"class":"ac"}		//조작
            	,template:function(dataItem){
            		var shenheStateNm = "";

            		if(dataItem.shenhestate == 3){
            			return "<span style='cursor:pointer' class='print' data-car-id="+dataItem.carId+"><spring:message code='global.lbl.print' /></span>";
            		}else if(dataItem.shenhestate == 4 || dataItem.shenhestate == 5){
            			return "<span style='cursor:pointer' class='cause' data-breason="+dms.string.defaultString(dataItem.breason, "test")+"><spring:message code='global.lbl.viewCause' /></span>";
            		}

            		return shenheStateNm;
            	}
            }
    	]
    });
});

</script>