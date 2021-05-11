<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 메세지소스 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.messageSourceMng" /></h1>
        <div class="btn_right">
        	<dms:access viewId="VIEW-D-10855" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
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
                    <th scope="row"><spring:message code="global.lbl.bundle" /></th>
                    <td>
                        <input id="sBundleNm" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.mesgKey" /></th>
                    <td>
                        <input id="sMesgKey" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.mesgTxt" /></th>
                    <td>
                        <input id="sMesgTxt" type="text" class="form_input" >
                    </td>
                    <th scope="row"><spring:message code="global.lbl.langCd" /></th>
                    <td>
                        <input id="sLangCd" type="text" class="form_comboBox">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
        	<dms:access viewId="VIEW-D-10861" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_s" id="btnExcelExport"><spring:message code="global.btn.excelExport" /><!-- 엑셀Export --></button>
			</dms:access>
        </div>
    </div>
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>

<script type="text/javascript">
var dbMessageSourceBatchUploadPopupWin;

//지원언어
var supportedLangs = [{"langCd":"", "langNm":""}];
<c:forEach var="obj" items="${supportedLangs}">
supportedLangs.push({"langCd":"${obj}", "langNm":"${obj}"});
</c:forEach>

//번들목록
var baseNames = [{"bundleNm":""}];
<c:forEach var="obj" items="${baseNames}">
baseNames.push({"bundleNm":"${obj}"});
</c:forEach>

$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
        	//조회시 필터 초기화 예제
            //$("#grid").data('kendoExtGrid').dataSource.filter([]);
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 엑셀저장
    $("#btnExcelExport").kendoButton({
        click:function(e) {
            dms.ajax.excelExport({
                "beanName":"dbMessageSourceService"
                ,"templateFile":"MessageSource_Tpl.xlsx"
                ,"fileName":"MessageSource.xlsx"
                ,"sBundleNm":$("#sBundleNm").val()
                ,"sMesgKey":$("#sMesgKey").val()
                ,"sMesgTxt":$("#sMesgTxt").val()
                ,"sLangCd":$("#sLangCd").val()
            });
        }
    });

    //조회조건 - 번들선택
    $("#sBundleNm").kendoExtDropDownList({
        dataSource:baseNames
        ,dataTextField:"bundleNm"
        ,dataValueField:"bundleNm"
        ,index:0
    });

    //조회조건 - 언어선택
    $("#sLangCd").kendoExtDropDownList({
        dataSource:supportedLangs
        ,dataTextField:"langNm"
        ,dataValueField:"langCd"
        ,index:0
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-CMM-0720-103824"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/sci/dbMessageSource/selectDBMessageSources.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBundleNm"] = $("#sBundleNm").val();
                        params["sMesgKey"] = $("#sMesgKey").val();
                        params["sMesgTxt"] = $("#sMesgTxt").val();
                        params["sLangCd"] = $("#sLangCd").val();

                        return kendo.stringify(params);

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"mesgSeq"
                    ,fields:{
                        rnum:{type:"number", editable:false}
                        ,mesgSeq:{type:"number", editable:false}
                        ,bundleNm:{type:"string", validation:{required:true}}
                        ,langCd:{type:"string", validation:{required:true}}
                        ,cntryCd:{type:"string"}
                        ,mesgKey:{type:"string", validation:{required:true}}
                        ,mesgTxt:{type:"string", validation:{required:true}}
                        ,lstUpdtDt:{type:"date", editable:false}
                        ,lstUpdtDtFormat:{type:"date", editable:false}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = d.total - elem.rnum + 1;
                            elem.lstUpdtDtFormat = kendo.parseDate(elem.lstUpdtDt, "<dms:configValue code='dateFormat' />");
                        });
                    }
                    return d;
                }
            }

        }

//그리드 멀티체크박스 활성화하고 데이터에 따라 멀티체크 박스를 컨트롤 하는 경우 예제
//         ,dataBound:function(e) {
//             var dataItems = e.sender.dataSource.view();

//             for (var j=0; j < dataItems.length; j++) {
//                 var mesgKey = dataItems[j].mesgKey;

//                 if (mesgKey == "cmm.lbl.resourceDetlCont") {
//                     var multiCheckBox = e.sender.tbody.find(".grid-checkbox-item[data-uid='" + dataItems[j].uid + "']");
//                     multiCheckBox.remove();
//                 }
//             }
//         }
//         ,change:function(e) {
//             var grid = $("#grid").data("kendoExtGrid");
//             var dataItem = grid.dataItem(grid.select());

//             if (dataItem.mesgKey == "cmm.lbl.resourceDetlCont") {
//                 $(grid.select()).removeClass("k-state-selected");
//             }
//         }
//         ,change:function(e) {
//         }
//         ,edit:function(e) {
//         }
//         ,editableOnlyNew:true
//         ,editableOnlyNewExcludeColumns:["bundleNm"]
//         ,columnReorder:function(e) {
//         }
//         ,filterable:{
//             mode:"row"
//         }
//        ,filterable:false
//        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
//        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
//        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
// 		  ,selectable:"multiple, row"
//        ,visibleCheckAll:false            //전체 선택/해제 체크박스 출력여부
        ,multiSelectWithCheckbox:true       //멀티선택 적용. default:false
//        ,multiSelectLocked:false          //멀티선택 컬럼 틀고정 default:false
//        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true                 //컬럼 툴팁 출력 여부(마우스오버시), default:false
        ,showAfterTooltip:2000				//컬럼 툴팁 딜레이 시간(밀리초), default:1500
//        ,visibleFilterRow:false           //필터로우 출력여부, default:false
//        ,columnResize:function(e){        //특정컬럼 리사이즈 제한 기능
//        ,enableDragToSelectRows:false     	//드래그 컬럼 선택 default:false, 드래그 컬럼 선택이 false 인 경우 멀티선택 그리드는 ctrl+drag로 선택가능 하다.
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false, filterable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"bundleNm", title:"<spring:message code='global.lbl.bundle' />", width:100
                ,attributes:{"class":"ac"}
	            ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
                            e.element.kendoExtDropDownList({
                                dataSource:baseNames
                                ,dataTextField:"bundleNm"
                                ,dataValueField:"bundleNm"
                                ,valuePrimitive:true
                            });
                        }
	                }
	        	}
                ,editor:function(container, options) {
                    $('<input required name="bundleNm" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:baseNames
                        ,dataTextField:"bundleNm"
                        ,dataValueField:"bundleNm"
                    });
                    $('<span class="k-invalid-msg" data-for="bundleNm"></span>').appendTo(container);
                }
            }
            ,{field:"langCd", title:"<spring:message code='global.lbl.langCd' />", width:60
                ,attributes:{"class":"ac"}
	            ,filterable:{
	                cell:{
	                    showOperators:false
	                    ,template: function (e) {
	                        e.element.kendoExtDropDownList({
	                            dataSource:supportedLangs
	                            ,dataTextField:"langNm"
	                            ,dataValueField:"langCd"
	                            ,valuePrimitive:true
	                        });
	                    }
	                }
	        	}
                ,editor:function(container, options) {
                    $('<input required name="langCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:supportedLangs
                        ,dataTextField:"langNm"
                        ,dataValueField:"langCd"
                    });
                    $('<span class="k-invalid-msg" data-for="langCd"></span>').appendTo(container);
                }
            }
            ,{field:"mesgKey", title:"<spring:message code='global.lbl.mesgKey' />", width:400
                ,attributes:{"class":"tooltip-enabled"}
            }
            ,{field:"mesgTxt", title:"<spring:message code='global.lbl.mesgTxt' />"
                ,attributes:{"class":"tooltip-enabled"}
            }
            ,{field:"lstUpdtDtFormat", title:"<spring:message code='global.lbl.lstUpdtDt' />", width:150
                ,attributes:{"class":"ac tooltip-enabled"}
                ,template:"#= kendo.toString(data.lstUpdtDt, '<dms:configValue code='dateTimeFormat' />') #"
            }
        ]
    });
});
</script>