<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.sanboTecApr" /></h1><!-- 삼보기술처리 -->
        <div class="btn_right">
            <%-- <button type="button" id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button> --%>
            <button type="button" id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>
<%--
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
                    <th scope="row"><spring:message code='ser.lbl.vinNo' /></th><!-- VIN -->
                    <td>
                        <input id="sVinNo" name="sVinNo" class="form_input"/>
                    </td>
                    <th scope="row"></th>
                    <td class="bor_none">
                    </td>
                    <th scope="row"></th>
                    <td class="bor_none">
                    </td>
                </tr>
            </tbody>
        </table>
    </div> --%>
    <input type="hidden" id="sVinNo" name="sVinNo" class="form_input"/>
    <input type="hidden" id="sDlrCd" name="sDlrCd" class="form_input"/>
    <input type="hidden" id="sRoDocNo" name="sRoDocNo" class="form_input"/>
    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>
<script type="text/javascript">

//PWA 유형코드 pwaTpDs
var pwaTpList = [];
<c:forEach var ="obj" items="${pwaTpDs}">
pwaTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
var pwaTpMap = dms.data.arrayToMap(pwaTpList , function(obj){return obj.cmmCd;});


$(document).ready( function(){


    setPwaMap = function(value){
        var resultVal = "";
        if( dms.string.strNvl(value) != ""){
            if(pwaTpMap[value] != undefined)
            resultVal =  pwaTpMap[value].cmmCdNm;
        }
        return resultVal;
    };

    /************************************************************
        팝업옵션 설정
    *************************************************************/

    var parentData = parent.sanbaoTechApproveSearchPopup.options.content.data;
    $("#sVinNo").val(parentData.vinNo);
    $("#sDlrCd").val(parentData.dlrCd);

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
                parent.sanbaoTechApproveSearchPopup.close();
            }
        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
              parent.sanbaoTechApproveSearchPopup.close();
        }
    });


/************************************************************
    그리드 설정
*************************************************************/
/** 그리드 **/
$("#grid").kendoExtGrid({
    gridId:"G-SER-1011-000038"
    ,dataSource:{
        transport:{
               read :{
                   url:"<c:url value='/ser/wac/sanbaoTechAppr/selectSanbaoTechApproveMains.do' />"
               }
             ,parameterMap:function(options , operation){
                 if(operation == "read"){

                  // 검색 조건을 파라미터로 담는다.
                     var params = {};
                     params["recordCountPerPage"] = options.pageSize;
                     params["pageIndex"] = options.page;
                     params["firstIndex"] = options.skip;
                     params["lastIndex"] = options.skip + options.take;
                     params["sort"] = options.sort;

                     params["sVinNo"] = $("#sVinNo").val();
                     params["sStatCd"] = 'A';
                     params["sUseYn"] = 'N';

                     return kendo.stringify(params);
                 }else if(operation != "read" && options.models){
                     return kendo.stringify(options.models);
                 }
             }//parameterMap
        }//transport
       ,schema:{
             model:{
                 id:"rnum"
                ,fields:{
                    rnum:{type:"number" }
                   ,vin:{type:"string" }
                   ,approveNo:{type:"string"}
                   ,dlrSignReqDt:{type:"date" }
                   ,judgDt:{type:"date"}
                   ,judgNm:{type:"number"}
                   ,delayDay:{type:"number"}
                }

             }//model
       }//schema
    }//dataSource
    ,autoBind:false
    ,editable:false
    ,sortable:false
    ,height:300
    ,resizable:false
    ,filterable:false                 // 필터링 기능 사용안함
    ,columns:[
                {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:50, attributes:{"class":"ac"}}
               ,{field:"docNo", title:"<spring:message code='ser.lbl.docNo' />", width:120, attributes :{"class":"al"}}
               ,{field:"vinNo", title:"<spring:message code='ser.lbl.vinNo' />", width:150, attributes :{"class":"al"}}
               ,{field:"approveNo", title:"<spring:message code='ser.lbl.approveNo' />", width:120, attributes :{"class":"al"}}
               ,{field:"dlrSignReqDt", title:"<spring:message code='ser.lbl.fincReqDt' />", width:80
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }
               ,{field:"judgDt", title:"<spring:message code='ser.lbl.judgDt' />", width:80
                   ,attributes :{"class":"ac"}
                   ,format:"{0:<dms:configValue code='dateFormat' />}"
               }
               ,{field:"judgNm", title:"<spring:message code='ser.lbl.hqApproveNm' />", width:100, attributes :{"class":"ar"}}
               ,{field:"delayDay", title:"<spring:message code='ser.lbl.delayDay' />", width:50, attributes :{"class":"ar"} , hidden:true}
             ]

    });

    if(parentData.autoBind){
      $("#grid").data("kendoExtGrid").dataSource.read();
    }

});
</script>