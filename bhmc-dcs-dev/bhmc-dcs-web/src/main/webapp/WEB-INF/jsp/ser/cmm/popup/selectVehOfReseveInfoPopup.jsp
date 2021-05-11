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
var roTpCdMap = dms.data.arrayToMap(roTpCdList , function(obj){return obj.cmmCd;});

//공통코드:예약상태
var resvStatCdList = [];
<c:forEach var="obj" items="${resvStatCdList}">
resvStatCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var resvStatCdArr = dms.data.arrayToMap(resvStatCdList, function(obj){return obj.cmmCd});

//공통코드:접수구분
var resvTpCdList = [];
<c:forEach var="obj" items="${resvTpCdList}">
resvTpCdList.push({
    "cmmCd":"${obj.cmmCd}"
    , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
var resvTpCdArr = dms.data.arrayToMap(resvTpCdList, function(obj){return obj.cmmCd});

    $(document).ready(function() {


        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var parentData = parent.vehOfReserveInfoSearchPopup.options.content.data;

        // 그리드 더블 클릭 이벤트.
        $("#grid").on("dblclick", "tr.k-state-selected", function (e) {
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


                if(rows !== null)
                {
                    var data = [];
                    $.each(rows, function(idx, row){
                        data.push(grid.dataItem(row));
                    });

                    parentData.callbackFunc(data);
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

        // 예약상태
        resvStatCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(resvStatCdArr[val] != undefined)
                returnVal = resvStatCdArr[val].cmmCdNm;
            }
            return returnVal;
        }

        // 예약접수상태
        resvTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(resvTpCdArr[val] != undefined)
                returnVal = resvTpCdArr[val].cmmCdNm;
            }
            return returnVal;
        }

        // RO유형
        roTpCdGrid = function(val){
            var returnVal = "";
            if(val != null && val != ""){
                if(roTpCdMap[val] != undefined)
                returnVal = roTpCdMap[val].cmmCdNm;
            }
            return returnVal;
        }

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
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
                            params["sPreFixId"] = parentData.preFixId;
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
            ,pageable:{
                         pageSize:30
                        ,pageSizes:[ "30", "50", "100", "200" ]
                        }
            ,height:146
            ,columns:[
                 {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:120}
                 ,{field:"resvTp", title:"<spring:message code='ser.lbl.resvChannel' />", width:100
                     ,template:"#=resvTpCdGrid(resvTp)#"
                     ,editor:function(container, options){
                         $('<input required name="resvTp" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             ,dataValueField:"cmmCd"
                             ,dataSource:resvTpCdList
                         });
                     }
                 }   // 예약채널
                 ,{field:"resvStatCd", title:"<spring:message code='ser.lbl.resvStat' />", width:100
                     ,template:"#=resvStatCdGrid(resvStatCd)#"
                     ,editor:function(container, options){
                         $('<input required name="resvStatCd" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             ,dataValueField:"cmmCd"
                             ,dataSource:resvStatCdList
                         });
                     }
                 }   // 예약상태
                 ,{field:"resvDocNo", title:"<spring:message code='ser.lbl.resvDocNo' />", width:120}
                 ,{field:"serResvStartDt", title:"<spring:message code='ser.lbl.serResvDt' />", width:150 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"   }
                 /* ,{field:"diagDocNo", title:"<spring:message code='ser.lbl.preInsNo' />", width:120}
                 ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:120}
                 ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:120
                         ,template:"#=roTpCdGrid(roTp)#"
                         ,editor:function(container, options){
                             $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                             .appendTo(container)
                             .kendoExtDropDownList({
                                 valuePrimitive:true
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,dataSource:roTpCdList
                             });
                         }
                 } */
            ]

        });

        //그리드 설정
        $("#resvPartGrid").kendoExtGrid({
            dataSource:{
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
            ,pageable:{
                         pageSize:30
                        ,pageSizes:[ "30", "50", "100", "200" ]
                        }
            ,height:146
            ,columns:[
                 {field:"carRegNo", title:"<spring:message code='ser.lbl.carRegNo' />", width:120}
                 ,{field:"dirverNm", title:"配件预约者", width:120}
                 ,{field:"parResvStatCd", title:"配件预约状态", width:100
                     ,template:"#=resvStatCdGrid(parResvStatCd)#"
                     ,editor:function(container, options){
                         $('<input required name="parResvStatCd" data-bind="value:' + options.field + '"/>')
                         .appendTo(container)
                         .kendoExtDropDownList({
                             dataTextField:"cmmCdNm"
                             ,dataValueField:"cmmCd"
                             ,dataSource:resvStatCdList
                         });
                     }
                 }   // 예약상태
                 ,{field:"parResvDocNo", title:"配件预约号码", width:120}
                 ,{field:"realArryDt", title:"实际到货时间", width:150 ,format:"{0:<dms:configValue code='dateFormat' /> HH:mm}"   }
                 /* ,{field:"diagDocNo", title:"<spring:message code='ser.lbl.preInsNo' />", width:120}
                 ,{field:"roDocNo", title:"<spring:message code='ser.lbl.roDocNo' />", width:120}
                 ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:120
                         ,template:"#=roTpCdGrid(roTp)#"
                         ,editor:function(container, options){
                             $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                             .appendTo(container)
                             .kendoExtDropDownList({
                                 valuePrimitive:true
                                 ,dataTextField:"cmmCdNm"
                                 ,dataValueField:"cmmCd"
                                 ,dataSource:roTpCdList
                             });
                         }
                 } */
            ]

        });

         if(parentData.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
         }else{
             $.each(parentData.data , function ( i , data){
                 $("#grid").data("kendoExtGrid").dataSource.add(data);
             });
         }
    });

</script>
