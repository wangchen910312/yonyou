<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.returnReasonList" /></h1><!-- 반송사유 List -->
    </div>
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>
<input type="hidden" id="sClaimDocNo" name="sClaimDocNo"/>
<input type="hidden" id="sRoDocNo" name="sRoDocNo"/>
</section>
<script type="text/javascript">

$(document).ready( function(){

  //공통코드:클레임 상태
    var claimStatList = [];
    <c:forEach var ="obj" items="${claimStatDs}">
    claimStatList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    </c:forEach>
    var claimStatMap = dms.data.arrayToMap(claimStatList , function(obj){return obj.cmmCd;});


    setClaimStatMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(claimStatMap[value] != undefined)
            resultVal =  claimStatMap[value].cmmCdNm;
        }
        return resultVal;
    };

    /************************************************************
        팝업옵션 설정
    *************************************************************/

    var parentData = parent.claimRequestReturnPopupWindow.options.content.data;
    $("#sClaimDocNo").val(parentData.sClaimDocNo);
    $("#sRoDocNo").val(parentData.sRoDocNo);

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
                parent.pwaApprovePopupWindow.close();
            }
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
              parent.pwaApprovePopupWindow.close();
        }
    });


/************************************************************
    그리드 설정
*************************************************************/
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000013"
        ,dataSource:{
         transport:{
            read:{
                url:"<c:url value='/ser/cmm/popup/selectClaimRequestReturns.do' />"
            }
            ,parameterMap:function(options, operation) {
                if (operation === "read") {

                    var params = {};

                    params["recordCountPerPage"] = options.pageSize;
                    params["pageIndex"] = options.page;
                    params["firstIndex"] = options.skip;
                    params["lastIndex"] = options.skip + options.take;
                    params["sort"] = options.sort;

                    params["sClaimDocNo"] = $("#sClaimDocNo").val();
                    params["sRoDocNo"] = $("#sRoDocNo").val();

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
                    ,claimDocNo:{type:"string"}
                    ,roDocNo:{type:"string"}
                    ,claimYy:{type:"string"}
                    ,claimVerCd:{type:"string"}
                    ,claimStatCd:{type:"string"}
                    ,errCd:{type:"string"}
                    ,errNm:{type:"string"}
                }
            }
         }
        }
        ,pageable:false
        ,sortable:false
        ,filterable:false                 // 필터링 기능 사용안함
        ,selectable:parentData.selectable === "multiple"? "multiple,row":"row"
        ,editable:false
        ,height:280
        ,columns:[
            {field:"rnum",title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
            ,{field:"claimStatCd", title:"<spring:message code='ser.lbl.claimStatNm' />", width:60
                ,attributes:{"class":"ac"}
                ,template:"#= setClaimStatMap(claimStatCd)#"
                ,editor:function(container, options){
                    $('<input required name="claimStatCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:claimStatList
                        ,optionLabel:" "
                        ,valuePrimitive:true
                    });
                    $('<span class="k-invalid-msg" data-for="claimStatCd"></span>').appendTo(container);
                }
            }
            ,{field:"errCd", title:"<spring:message code='ser.lbl.returnCd' />", width:60, attributes:{"class":"ac"}}
            ,{field:"errNm", title:"<spring:message code='ser.lbl.returnReasonCont' />", width:200}
        ]
    });

    if(parentData.autoBind){
      $("#grid").data("kendoExtGrid").dataSource.read();
    }

});
</script>