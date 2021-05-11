<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.resvInfoSearch" /></h1>
        <div class="btn_right">
            <%-- <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button> --%>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">

    $(document).ready(function() {


        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
        var parentData = parent.vehOfPartReserveInfoSearchPopup.options.content.data;

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
                    parent.vehOfPartReserveInfoSearchPopup.close();
                }
            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/


        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            gridId:"G-SER-1011-000041"
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

                            params["sVinNo"] = parentData.params.vinNo;

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
                             rnum:{type:"number", editable:false}
                            ,dlrCd:{type:"string"}
                            ,vinNo:{type:"string"}
                            ,parResvDocNo:{type:"string"}
                            ,carOwnerId:{type:"string"}
                            ,carOwnerNm:{type:"string"}
                            ,driverId:{type:"string"}
                            ,dirverNm:{type:"string"}
                            ,parResvStatCd:{type:"string"}
                        }
                    }
                }
            }
            ,multiSelectWithCheckbox:true
            ,filterable:false                 // 필터링 기능 사용안함
            ,selectable:parentData.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,pageable:{
                         pageSize:30
                        ,pageSizes:[ "30", "50", "100", "200" ]
                        }
            ,height:320
            ,columns:[
                  {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
                 ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.carOwner' />", width:120  }
                 ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150 ,attributes:{"class":"ac"}}
                 ,{field:"parResvDocNo", title:"<spring:message code='ser.lbl.resvDocNo' />", width:120}
                 ,{field:"parResvDt", title:"<spring:message code='ser.lbl.serResvDt' />", width:150 ,format:"{0:<dms:configValue code='dateFormat' />}"   }
                 ,{field:"carOwnerNm", title:"<spring:message code='ser.lbl.preInsNo' />", width:120}
                 ,{field:"parResvStatCd", title:"<spring:message code='ser.lbl.roDocNo' />", width:120}
            ]

        });
     });

</script>
