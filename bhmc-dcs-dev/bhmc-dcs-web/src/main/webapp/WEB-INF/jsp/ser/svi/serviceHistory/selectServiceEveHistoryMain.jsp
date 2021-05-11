<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<script type="text/javascript">

// 인터페이스처리상태:COM073
var lastAchkResCdTpList = [];
<c:forEach var="obj" items="${lastAchkResCdTpDS}">
lastAchkResCdTpList.push({cmmCdNm:"${obj.cmmCdNm}", cmmCd:"${obj.cmmCd}"});
</c:forEach>

</script>
<!-- 전일자 정비 현황 -->
<div id="resizableContainer">
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.roEveHist" /></h1><!-- 전일자 정비 현황 -->
        <div class="btn_right">
        <%-- <dms:access viewId="VIEW-I-13232" hasPermission="${dms:getPermissionMask('READ')}"> --%>
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        <%-- </dms:access> --%>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form form_width_100per">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col>
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='global.lbl.dlrCd' /> </th> <!-- 딜러코드 -->
                    <td>
                        <input id="sDlrCd" type="text" value="" maxlength="5" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.ifDate' /></th> <!-- 인터페이스일자 -->
                    <td>
                        <input type="text" id="sRoDt" class="form_datepicker ac" />
                    </td>
                    <th scope="row"><spring:message code='global.lbl.lastAchkResCd'/></th>  <!-- 상태코드 -->
                    <td>
                        <input id="sSearchGubun" name="sSearchGubun" data-json-obj="true" class="form_comboBox">
                    </td>
                    <th scope="row"> </th>
                    <td> </td>
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

<section id="viewTpVehicleMonitoringPopup" class="pop_wrap">
   <section class="group">
        <div class="header_area">
        </div>
        <div class="table_grid">
            <div id="subGrid"></div>
        </div>
    </section>
</section>
</div>

<!-- script -->
<script>

//인터페이스 일자 : 전일
var previousDay = "${previousDay}";

$(document).ready(function() {

    // 인터페이스 일자
    $("#sRoDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
         ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
         ,value:previousDay
    });

    // 상태확인결과
    $("#sSearchGubun").kendoExtDropDownList({
        dataTextField :"cmmCdNm"
       ,dataValueField:"cmmCd"
       ,dataSource:lastAchkResCdTpList
       ,optionLabel:{cmmCdNm:'', cmmCd:''}
    });

     //버튼 - 조회
     $("#btnSearch").kendoButton({
        click:function(e){
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-0621-095902"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/ro/repairOrder/selectRepairOrdersEveStatus.do'/>"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        /*Paging Param Start~!*/
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;
                        /*Paging Param End~!*/

                        /*Screen Param Start~!*/
                        params["sDlrCd"] = $("#sDlrCd").val();  //딜러코드
                        params["sRoDt"] = $("#sRoDt").data("kendoExtMaskedDatePicker").value(); //인터페이스일자
                        params["sSearchGubun"] = $("#sSearchGubun").data("kendoExtDropDownList").value();   //상태코드
                        /*Screen Param End~!*/

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,requestEnd:function(e) {
                if (e.type == "read") {
                    //조회가 완료 되였습니다.
                    //dms.notification.info("<spring:message code='global.info.searchSuccess' />");
                }
            }
            ,schema:{
                model:{
                    id:"roCnt"
                    ,fields:{
                         ifDate:{type:"string"}
                        ,dlrCd:{type:"string"}
                        ,dlrNm:{type:"string"}
                        ,roCnt:{type:"string"}
                    }
                }
            }
        }
        ,pageable:{
            refresh:true
            ,pageSize:50
            ,pageSizes:[ "50", "100", "200", "300"]
            ,buttonCount:5
            ,input:false
            ,numeric:true
            ,info:true
            ,messages:{
                itemsPerPage:""
                ,display:"{0}-{1} of {2}"
                ,empty:""
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:false           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,height:450
        ,editable:false
        ,autoBind:false
        ,selectable:"row"
        ,columns:[
            {field:"ifDate",     title:"<spring:message code='ser.lbl.ifDate' />",  width:100,  attributes:{"class":"ac"}}
            ,{field:"dlrCd",     title:"<spring:message code='global.lbl.dlrCd' />",    width:100,  attributes:{"class":"ac"}}  // 딜러코드
            ,{field:"dlrNm",     title:"<spring:message code='sal.lbl.dlrNm' />",   width:100,  attributes:{"class":"al"}}  // 딜러이름
            ,{field:"roCnt",     title:"<spring:message code='ser.lbl.roCnt' />",  width:100,   attributes:{"class":"ar"}}    // RO count
        ]
    });

});

</script>