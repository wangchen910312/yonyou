<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

    <!-- 주간계획-->
    <section class="group">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <h1 class="title_basic"><spring:message code='sal.lbl.weeklySchedule' /></h1><!-- 주간계획 -->
            <div class="btn_right">
			<dms:access viewId="VIEW-I-12389" hasPermission="${dms:getPermissionMask('READ')}">
                <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
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
                    <col style="width:14%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.ordYyMm" /></th> <!-- 년월 -->
                        <td>
                            <input name="sBtoYyMmDt" id="sBtoYyMmDt"  class="form_datepicker" >
                        </td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    <!-- 조회 조건 종료 -->
    <!-- 그리드 시작 -->
        <div class="table_grid mt10">
            <div id="grid"></div>
        </div>
    <!-- 상세정보 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code="sal.title.discountInfo" /></h2> <!-- 상세정보 -->
        </div>
        <div class="table_form form_width_100per mt10">
            <table>
                <caption></caption>
                <colgroup>
                    <col style="width:12%;">
                    <col style="width:16%;">
                    <col style="width:12%;">
                    <col style="width:16%;">
                    <col style="width:12%;">
                    <col style="width:16%;">
                    <col style="width:16%;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.weekStartDt" /></th> <!-- 주시작일 -->
                        <td>
                            <input id="weekStartDt" type="text" class="form_datepicker form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.weekEndDt" /></th> <!-- 주종료일 -->
                        <td>
                            <input id="weekEndDt" type="text" class="form_datepicker form_readonly" readonly>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row"><spring:message code="sal.lbl.weekFstStockDt" /></th> <!-- 주초재고일 -->
                        <td>
                            <input id="weekFstStockDt" type="text" class="form_datepicker form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.pfpExamDt" /></th> <!-- 납기예시일 -->
                        <td>
                            <input id="pfpExamDt" type="text" value="" class="form_datepicker form_readonly" readonly>
                        </td>
                        <th scope="row"><spring:message code="sal.lbl.w1" /></th> <!-- W-1 -->
                        <td>
                            <input id="befWeekDt" type="text" class="form_datepicker form_readonly" readonly>
                        </td>
                        <td></td>
                    </tr>
                    <tr style="display:none">
                        <th scope="row"><spring:message code='global.lbl.policyCont' /></th>         <!-- 정책설명 -->
                        <td colspan="6">
                            <textarea id="remark" name="remark" rows="5" cols="" class="form_textarea form_readonly"></textarea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="table_grid mt10">
            <div id="grid2"></div>
        </div>
    </section><!-- 그리드 종료 -->

<!-- script -->
<script  type="text/javascript">
    var sysDate = "${sysDate}";

    /************* 업무구분 SELECT BOX  *******************/
    var btoWrkTpList = [];
    <c:forEach var="obj" items="${btoWrkTpInfo}">
    btoWrkTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var btoWrkTpArr = dms.data.arrayToMap(btoWrkTpList, function(obj){return obj.cmmCd});
    /************* 업무구분 SELECT BOX  *******************/

    /************* 작업상태 SELECT BOX  *******************/
    var operStatCdList = [];
    <c:forEach var="obj" items="${operStatCdInfo}">
    operStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>

    var operStatCdArr = dms.data.arrayToMap(operStatCdList, function(obj){return obj.cmmCd});
    /************* 작업상태 SELECT BOX  *******************/



$(document).ready(function () {

    /**
     * 년월
     */
     $("#sBtoYyMmDt").kendoExtMaskedDatePicker({
        format:"yyyy/MM"
        ,start:"year"
        ,depth:"year"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
        ,value:sysDate
     });

    // 주시작일
     $("#weekStartDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });

     // 주종료일
     $("#weekEndDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });

     // 주초재고일
     $("#weekFstStockDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });

     // 납기예시일
     $("#pfpExamDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });

     // W-1
     $("#befWeekDt").kendoExtMaskedDatePicker({
         format:"<dms:configValue code='dateFormat' />"
        ,dateValidMessage:"<spring:message code='global.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
     });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            /*
            if( $("#sBtoYyMmDt").data('kendoExtMaskedDatePicker').value() == null ){
                //적용일을 모두 입력해 주세요
                dms.notification.warning("<spring:message code='global.info.frToDate.input' />");
                return false;
            }
            */

            $("#weekStartDt").val("");
            $("#weekEndDt").val("");
            $("#weekFstStockDt").val("");
            $("#pfpExamDt").val("");
            $("#befWeekDt").val("");
            //$("#remark").val("");


            $('#grid').data('kendoExtGrid').dataSource.page(1);
            $('#grid2').data('kendoExtGrid').dataSource.data([]);
        }
    });

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SAL-0721-114106"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/sal/mst/weeklySchedule/selectWeeklySchedule.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sBtoYyMmDt"] = $("#sBtoYyMmDt").val();

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
                    id:"btoYyMmDt"
                    ,fields:{
                        weekFstStockDt:{type:"date", hidden:true}
                        ,pfpExamDt:{type:"date", hidden:true}
                        ,befWeekDt:{type:"date", hidden:true}
                        ,crePlanApplyYyMmDt:{type:"string", hidden:true}
                        ,crePlanApplyCnt:{type:"string", hidden:true}
                        ,btoYyMmDt  :{type:"string", editable:false}
                        ,btoCnt    :{type:"string", editable:false}
                        ,weekStartDt:{type:"date", editable:false}
                        ,weekEndDt:{type:"date", editable:false}


                    }
                }
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,height:220
        ,autoBind:false
        ,change:function(e){

            var grid = e.sender;
            var selectRow = grid.dataItem(grid.select());

            if( selectRow != null ){
                $("#weekStartDt").data("kendoExtMaskedDatePicker").value(selectRow.weekStartDt);
                $("#weekEndDt").data("kendoExtMaskedDatePicker").value(selectRow.weekEndDt);
                $("#weekFstStockDt").data("kendoExtMaskedDatePicker").value(selectRow.weekFstStockDt);
                $("#pfpExamDt").data("kendoExtMaskedDatePicker").value(selectRow.pfpExamDt);
                $("#befWeekDt").data("kendoExtMaskedDatePicker").value(selectRow.befWeekDt);
                //$("#remark").val(selectRow.remark);

                $('#grid2').data('kendoExtGrid').dataSource.page(1);
            }
        }
        ,columns:[
             {field:"weekFstStockDt",  hidden:true} //주초재고일
            ,{field:"pfpExamDt",  hidden:true} //납기예시일
            ,{field:"befWeekDt",  hidden:true} //W-1

            ,{field:"crePlanApplyYyMmDt",  hidden:true} //주초재고일
            ,{field:"crePlanApplyCnt",  hidden:true} //주초재고일
            ,{field:"btoYyMmDt", title:"<spring:message code = 'sal.lbl.ordYyMm'/>"
                , width:180, attributes:{"class":"ac"}
             }//년월
            ,{field:"btoCnt", title:"<spring:message code = 'global.lbl.week'/>"
                , width:180, attributes:{"class":"ac"}
             }//주차

             ,{field:"weekStartDt", title:"<spring:message code='sal.lbl.weekStartDt' />"
                , width:250
                , attributes:{"class":"ac"}
                , format:"{0:<dms:configValue code='dateFormat' />}"
             }//주시작일
            ,{field:"weekEndDt", title:"<spring:message code='sal.lbl.weekEndDt' />"
                , width:250
                , attributes:{"class":"ac"}
                , format:"{0:<dms:configValue code='dateFormat' />}"
             }//주종료일
        ]
    });


   //그리드 2번
    $("#grid2").kendoExtGrid({
        gridId:"G-SAL-0721-114107"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/sal/mst/weeklySchedule/selectWeeklyScheduleDet.do' />",
                }
               ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var grid = $("#grid").data('kendoExtGrid');
                        var selectRow = grid.dataItem(grid.select());

                        var params = {};
                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["btoYyMmDt"] = selectRow.btoYyMmDt;// 년월
                        params["btoCnt"] = selectRow.btoCnt;// 주차
                        params["weekStartDt"] = selectRow.weekStartDt;// 주시작일
                        params["weekEndDt"] = selectRow.weekEndDt;// 주종료일
                        params["weekFstStockDt"] = selectRow.weekFstStockDt;// 주초재고일
                        params["pfpExamDt"] = selectRow.pfpExamDt;// 납기예시일
                        params["befWeekDt"] = selectRow.befWeekDt;// W-1
                        params["crePlanApplyYyMmDt"] = selectRow.crePlanApplyYyMmDt;// 생산계획 적용 년월일자
                        params["crePlanApplyCnt"] = selectRow.crePlanApplyCnt;// 생산계획 적용 주차

                        return kendo.stringify(params);
                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
           ,error:function(e){

            }
           ,schema:{
                data:"data"
               ,model:{
                    id:"dlrCd"
                   ,fields:{
                        btoWrkTp:{type:"string", editable:false}
                       ,startDt:{type:"string", editable:false}
                       ,startTime:{type:"string", editable:false}
                       ,endDt:{type:"string", editable:false}
                       ,endTime:{type:"string", editable:false}
                       ,operStatCd:{type:"string", editable:false}
                    }
                }
            }
        }
       ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
       ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
       ,appendEmptyColumn:false           //빈컬럼 적용. default:false
       ,enableTooltip:true               //Tooltip 적용, default:false
       ,height:220
       ,autoBind:false
       ,scrollable:true
       ,columns:[
            {field:"btoWrkTp", title:"<spring:message code='sal.lbl.btoWrkTp' />"
               , width:80, headerAttributes:{"class":"ac"}, attributes:{"class":"al"}
               ,template:"#=btoWrkTpArr[btoWrkTp].cmmCdNm#"
            }// 업무구분
           ,{field:"startDt", title:"<spring:message code='sal.lbl.orgStartDt' />"
               , width:150, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
            }// 시작일자
           ,{field:"startTime", title:"<spring:message code='global.lbl.startHm' />"
               , width:150, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
            }// 시작시간
           ,{field:"endDt", title:"<spring:message code = 'sal.lbl.orgEndDt'/>"
               , width:80, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
            }//종료일자
           ,{field:"endTime", title:"<spring:message code = 'global.lbl.endHm'/>"
               , width:80, headerAttributes:{"class":"ac"}, attributes:{"class":"ac"}
            }//종료시간
           ,{field:"operStatCd", title:"<spring:message code='global.lbl.statNm' />"
                , width:80, headerAttributes:{"class":"ac"}, attributes:{"class":"al"}
                , template:"#if(operStatCd != null){operStatCdArr[operStatCd].cmmCdNm}else{''}#"
            }//상태(작업상태)
        ]
    });


});

</script>
<!-- //script -->

