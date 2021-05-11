<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 메세지소스 관리 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="global.lbl.carLineInfo" /></h1><!-- VehicleSpec - 차종 -->
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12015" hasPermission="${dms:getPermissionMask('READ')}">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
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
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.carLine' /></th><!-- 차종 -->
                    <td>
                        <input id="sCarline" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='global.lbl.carlineNm' /></th><!-- 차종명 -->
                    <td>
                        <input id="sCarlineNm" type="text"  class="form_input">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.pcDstinTp' /></th><!-- 승/상용 -->
                    <td>
                        <input id="sPcDstinNm" type="text" class="form_comboBox">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.useYn" /></th><!-- 사용여부 -->
                    <td>
                        <input id="sUseYn" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.applyDate' /></th><!-- 적용일 -->
                    <td>
                        <div class="form_float">
                            <div class="date_left">
                                <input id="sStartDt" type="text" class="form_datepicker">
                                <span class="txt_from">~</span>
                            </div>
                            <div class="date_right">
                                <input id="sEndDt" type="text" class="form_datepicker">
                            </div>
                        </div>
                    </td>
                    <th scope="row"></th>
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




<!-- script -->
<script>
var carlineList = [{"userCd":"", "userCdNm":""}];
<c:forEach var="obj" items="${carlineNames}">
carlineList.push({userCdNm:"${obj.carlineCdNm}", userCd:"${obj.carlineCd}"});
</c:forEach>


//승/상용구분 Array
var pcDstinTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${pcDstinTpList}">
    pcDstinTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//승/상용구분 Map
var pcDstinTpMap = dms.data.arrayToMap(pcDstinTpList, function(obj){ return obj.cmmCd; });



$(document).ready(function() {

    //조회조건 - 차종선택
    $("#sCarline").kendoExtDropDownList({
        dataTextField:"userCdNm"
        ,dataValueField:"userCd"
        ,dataSource:carlineList
        ,optionLabel:" "  //전체
        ,index:0
    });


    //조회조건 - 승/상용선택

    $("#sPcDstinNm").kendoExtDropDownList({
        dataSource:pcDstinTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,optionLabel:" "  // 전체
    });


    //조회조건 - 승/상용선택
    /*
    $("#sPcDstinNm").kendoExtDropDownList({
        dataTextField:"codeNm",
        dataValueField:"codeCd",
        dataSource:[{"codeCd":"P","codeNm":"승용"} //승용
                    ,{"codeCd":"S","codeNm":"상용"} //사용
                    ]
        ,optionLabel:"<spring:message code='global.lbl.all' />"  // 전체
    });
    */


    //조회조건 - 사용여부선택
    $("#sUseYn").kendoExtDropDownList({
        dataTextField:"codeNm",
        dataValueField:"codeCd",
        dataSource:[{"codeCd":"","codeNm":""}
                    ,{"codeCd":"Y","codeNm":"Y"}
                    ,{"codeCd":"N","codeNm":"N"}
                    ]
        ,optionLabel:" "  // 전체
    });



    //조회조건 - 적용시작일
    var sStartDtPicker = $("#sStartDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    }).data("kendoDatePicker");


    //조회조건 - 적용종료일
    var sEndDtPicker = $("#sEndDt").kendoExtMaskedDatePicker({
        format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
    }).data("kendoDatePicker");



    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            if( !($("#sStartDt").data('kendoExtMaskedDatePicker').value() == null && $("#sEndDt").data('kendoExtMaskedDatePicker').value() == null ) ){
                if($("#sStartDt").data('kendoExtMaskedDatePicker').value() == null || $("#sEndDt").data('kendoExtMaskedDatePicker').value() == null){
                    //적용일을 모두 입력해 주세요
                    dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                    return false;
                }
            }

            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-115907"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/veh/vehicleSpec/selectVehicleSpecCarline.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["carlineCd"] = $("#sCarline").val();
                        params["carlineNm"] = $("#sCarlineNm").val();
                        params["pcDstinCd"] = $("#sPcDstinNm").val();
                        params["useYn"] = $("#sUseYn").val();
                        params["startDt"] = $("#sStartDt").data('kendoExtMaskedDatePicker').value();
                        params["endDt"] = $("#sEndDt").data('kendoExtMaskedDatePicker').value();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"carlineCd"
                    ,fields:{
                        carlineCd  :{type:"string"}
                        ,carlineNm :{type:"string"}
                        ,carlineEnNm:{type:"string"}
                        ,startDt   :{type:"date"}
                        ,endDt     :{type:"date"}
                        ,pcDstinCd :{type:"string"}
                        ,useYn     :{type:"string"}
                        ,regUsrId  :{type:"string"}
                        ,regDt     :{type:"date"}
                    }
                }
            }
        }
        ,editable:false
        //,autoBind:false
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
            {field:"carlineCd",    title:"<spring:message code='global.lbl.carLine' />",    width:50, attributes:{"class":"ac"}} //차종
            ,{field:"carlineNm",   title:"<spring:message code='global.lbl.carlineNm' />",  width:200,attributes:{"class":"al"}} //차종명
            ,{field:"carlineEnNm", title:"<spring:message code='global.lbl.carlineEnNm' />",width:150,attributes:{"class":"al"}} //차종영문명
            ,{field:"startDt",     title:"<spring:message code='sal.lbl.startDt' />",       width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //적용시작일
            ,{field:"endDt",       title:"<spring:message code='sal.lbl.endDt' />",         width:80, attributes:{"class":"ac"},format:"{0:<dms:configValue code='dateFormat' />}"} //적용종료일
            ,{field:"pcDstinCd",   title:"<spring:message code='sal.lbl.pcDstinTp' />",     width:80, attributes:{"class":"ac"}
              ,template:"# if(pcDstinCd !== ''){# #= pcDstinTpMap[pcDstinCd].cmmCdNm# #}#"
             } //승/상용
            ,{field:"useYn",       title:"<spring:message code='global.lbl.useYn' />",      width:60, attributes:{"class":"ac"}} //사용여부
         ]
    });



});
</script>
<!-- //script -->










