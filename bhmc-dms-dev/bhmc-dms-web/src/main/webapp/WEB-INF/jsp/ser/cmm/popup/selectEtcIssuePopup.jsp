<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="window" class="pop_wrap"  >

    <div class="header_area" >
        <div class="btn_right">
            <%-- <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /><!-- 조회 --></button> --%>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /><!-- 선택 --></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button> --%>
        </div>
    </div>

    <div class="table_grid mt10">
        <!-- 그리드1 -->
         <div id=etcIssueGrid class="grid"></div>
        <!-- 그리드1 -->
    </div>

</section>


<script>

var parentJsonData = parent.etcIssuePopup.options.content.data;
var callback = parentJsonData.callbackFunc;


$(document).ready(function(){

    // 그리드 더블 클릭 이벤트.
    $("#etcIssueGrid").on("dblclick", "tr.k-state-selected", function (e) {
         $("#btnSelect").click();
    });


    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            var grid = $("#etcIssueGrid").data("kendoExtGrid");
            var rows = grid.select();

            if(rows.length != 0){
                var data = [];
                $.each(rows, function(idx, row){
                    data.push(grid.dataItem(row));
                });

                parentJsonData.callbackFunc(data);
                parent.etcIssuePopup.close();
            }else{
                dms.notification.info("선택한 정보가 없습니다.");
            }
        }
    });

    //그리드 설정
    $("#etcIssueGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/etcIssue/selectEtcIssueManages.do' />"
                }
                ,parameterMap:function(options , operation){
                    if(operation == "read"){

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]          = options.page;
                        params["firstIndex"]         = options.skip;
                        params["lastIndex"]          = options.skip + options.take;
                        params["sort"]               = options.sort;

                        params["sDlrCd"]             = $("#sDlrCd").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        dlrCd  :{type:"string"}
                        ,etcCd  :{type:"string", editable:false}
                        ,etcCdNm:{type:"string", validation:{required:true}}
                        ,prorVal:{type:"int", validation:{required:true}}
                        ,etcAmt :{type:"number", validation:{required:true}}
                    }
                }
            }
        }
        ,selectable:parentJsonData.selectable === "multiple"? "multiple,row":"row"
        ,navigatable:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,editable:false
        ,height:280
        ,columns:[
            {field:"etcCd", title:"<spring:message code='ser.lbl.etcCd' />", width:60, sortable:false, attributes:{"class":"ac"}}
            ,{field:"etcCdNm", title:"<spring:message code='ser.lbl.etcCdNm' />", width:120, sortable:false, attributes:{"class":"ac"}}
            ,{field:"prorVal", title:"<spring:message code='ser.lbl.prefRank' />", width:100, sortable:false, attributes:{"class":"ac"}
                ,format:"{0:n0}"
                ,decimal:0
                ,hidden:true
            }
            ,{field:"etcAmt", title:"<spring:message code='ser.lbl.etcAmt' />", width:100, sortable:false, attributes:{"class":"ar"}
                ,format:"{0:n2}"
                ,decimal:0
                ,spinners:false
            }
        ]
    });
});

</script>