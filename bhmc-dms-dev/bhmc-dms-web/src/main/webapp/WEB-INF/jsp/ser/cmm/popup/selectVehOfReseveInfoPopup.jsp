<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.resvInfoSearch" /></h1>
        <div class="btn_right">
            <button id="btnNew" class="btn_m btn_Select"><spring:message code="global.btn.new" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div class="table_form form_width_100per" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.resvDocNo' /></th><!-- VIN -->
                    <td>
                        <input id="sResvDocNo" name="sResvDocNo" class="form_input"/>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

    <div class="table_grid mt10">
        <div id="resvPartGrid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">
//RO유형
var roTpCdList = [];
<c:forEach var="obj" items="${roTpCdList}">
    roTpCdList.push({
       cmmCdNm:"${obj.cmmCdNm}"
      ,cmmCd:"${obj.cmmCd}"
    });
</c:forEach>

var roTpCdMap = [];
$.each(roTpCdList, function(idx, obj){
    roTpCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//공통코드:예약상태
var resvStatCdList = [];
<c:forEach var="obj" items="${resvStatCdList}">
resvStatCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var resvStatCdMap = [];
$.each(resvStatCdList, function(idx, obj){
    resvStatCdMap[obj.cmmCd] = obj.cmmCdNm;
});

//공통코드:접수구분
var resvTpCdList = [];
<c:forEach var="obj" items="${resvTpCdList}">
resvTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

var resvTpCdMap = [];
$.each(resvTpCdList, function(idx, obj){
    resvTpCdMap[obj.cmmCd] = obj.cmmCdNm;
});

    $(document).ready(function() {


        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var parentData = parent.vehOfReserveInfoSearchPopup.options.content.data;

        // 그리드 더블 클릭 이벤트.
        $("#grid, #resvPartGrid").on("dblclick", "tr.k-state-selected", function (e) {
            $("#btnSelect").click();
        });

        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#grid").data("kendoExtGrid").dataSource.read();
            }
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                var grid = $("#grid").data("kendoExtGrid");
                var rows = grid.select();

                var resvPartGrid = $("#resvPartGrid").data("kendoExtGrid");
                var resvPartRows = resvPartGrid.select();

                if(rows.length > 0) {
                    var data = [];
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });
                    parentData.callbackFunc(data);
                    parent.vehOfReserveInfoSearchPopup.close();

                } else if(resvPartRows.length > 0){
                    var partData = [];
                    $.each(resvPartRows, function(idx, row){
                        partData.push(resvPartGrid.dataItem(row));
                    });

                    parentData.callbackFunc(partData);
                    parent.vehOfReserveInfoSearchPopup.close();
                }
            }
        });

        // 신규 버튼.
        $("#btnNew").kendoButton({
            click:function(e){
                var data = [{"vinNo":parentData.vinNo, "type":"new"}];
                parentData.callbackFunc(data);
                parent.vehOfReserveInfoSearchPopup.close();
            }
        });

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-SER-1011-000042"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/cmm/vehOfCustInfo/selectVehOfReseveInfos.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sVinNo"] = parentData.vinNo;
                            params["sPreFixId"] = "RE";
                            params["sSerResvStartDt"] = new Date("${sysDate}");
                            params["sResvDocNo"] = $("#sResvDocNo").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                             dlrCd:{type:"string"}
                            ,vinNo:{type:"string"}
                            ,resvDocNo:{type:"string"}
                            ,diagDocNo:{type:"string"}
                            ,roDocNo:{type:"string"}
                            ,roGrpNo:{type:"string"}
                            ,serResvStartDt:{type:"date"}
                            ,serResvEndDt:{type:"date"}
                            ,carOwnerId:{type:"string"}
                            ,carOwnerNm:{type:"string"}
                            ,driverId:{type:"string"}
                            ,dirverNm:{type:"string"}
                            ,roStatCd:{type:"string"}
                            ,roTp:{type:"string"}
                        }
                    }
                }
            }
            ,autoBind:false
            ,selectable:parentData.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,pageable:{
                         pageSize:30
                        ,pageSizes:[ "30", "50", "100", "200" ]
                        }
            ,height:146
            ,columns:[
                 {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:120}
                 ,{field:"resvTp", title:"<spring:message code='ser.lbl.resvChannel' />", width:100
                     ,template:"#if(resvTp != null){# #= resvTpCdMap[resvTp]# #}#"
                 }   // 예약채널
                 ,{field:"resvStatCd", title:"<spring:message code='ser.lbl.resvStat' />", width:100
                     ,template:"#if(resvStatCd != null){# #= resvStatCdMap[resvStatCd]# #}#"
                 }   // 예약상태
                 ,{field:"resvDocNo", title:"<spring:message code='ser.lbl.resvDocNo' />", width:120}
                 ,{field:"serResvStartDt", title:"<spring:message code='ser.lbl.serResvDt' />", width:150 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"   }
            ]

        });

        //그리드 설정
        $("#resvPartGrid").kendoExtGrid({
            gridId:"G-SER-1011-000043"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/rev/partReservation/selectPartReservations.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};
                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sVinNo"] = parentData.vinNo;
                            params["sParResvDt"] = new Date("${sysDate}");
                            params["sParResvDocNo"] = $("#sParResvDocNo").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                             dlrCd:{type:"string"}
                            ,vinNo:{type:"string"}
                            ,resvDocNo:{type:"string"}
                            ,diagDocNo:{type:"string"}
                            ,roDocNo:{type:"string"}
                            ,roGrpNo:{type:"string"}
                            ,serResvStartDt:{type:"date"}
                            ,serResvEndDt:{type:"date"}
                            ,carOwnerId:{type:"string"}
                            ,carOwnerNm:{type:"string"}
                            ,driverId:{type:"string"}
                            ,dirverNm:{type:"string"}
                            ,roStatCd:{type:"string"}
                            ,roTp:{type:"string"}
                        }
                    }
                }
            }
            ,autoBind:false
            ,selectable:parentData.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,filterable:false                 // 필터링 기능 사용안함
            ,pageable:{
                         pageSize:30
                        ,pageSizes:[ "30", "50", "100", "200" ]
                        }
            ,height:146
            ,columns:[
                 {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:120}
                 ,{field:"driverNm", title:"<spring:message code='ser.lbl.partResveNm' />", width:120}
                 ,{field:"parResvStatCd", title:"<spring:message code='ser.lbl.partResvStat' />", width:100
                     ,template:"#if(parResvStatCd != null){# #= resvStatCdMap[parResvStatCd]# #}#"
                 }   // 예약상태
                 ,{field:"parResvDocNo", title:"<spring:message code='ser.lbl.partReserveNo' />", width:120}     // 부품예약번호
                 ,{field:"realArryDt", title:"<spring:message code='ser.lbl.actArrivalTime' />", width:150 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"   }
            ]

        });

         if(parentData.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
            $("#resvPartGrid").data("kendoExtGrid").dataSource.read();
         }else{
             $.each(parentData.data , function ( i , data){
                 $("#grid").data("kendoExtGrid").dataSource.add(data);
             });
         }
    });

</script>
