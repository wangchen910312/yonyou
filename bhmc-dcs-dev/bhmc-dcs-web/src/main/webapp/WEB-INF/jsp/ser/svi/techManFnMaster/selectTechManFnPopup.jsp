<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

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
                    <th scope="row"><spring:message code='ser.lbl.tecId' /></th>
                    <td>
                        <input id="sTecId" name="sTecId" class="form_input">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.tecNm' /></th>
                    <td>
                        <input id="sTecNm" name="sTecNm" class="form_input">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">


//기능유형 Array
var fnList = [{"cmmCd":"", "cmmCdNm":""}];
<c:forEach var="obj" items="${fnList}">
fnList.push({
  "cmmCd":"${obj.cmmCd}"
  , "cmmCdNm":"${obj.cmmCdNm}"
});
</c:forEach>
//기능 Map
var fnMap = dms.data.arrayToMap(fnList, function(obj){ return obj.cmmCd; });

    $(document).ready(function() {


        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
         var options = parent.tecSearchPopup.options.content.data;


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

                    options.callbackFunc(data);
                    parent.tecSearchPopup.close();
                }
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.tecSearchPopup.close();
            }
        });

        /************************************************************
                    조회조건 설정
        *************************************************************/
        if (options.tecId) {
            $("#sTecId").val(options.tecId);
        }
        if (options.tecNm) {
            $("#sTecNm").val(options.tecNm);
        }

        /************************************************************
                    그리드 설정
        *************************************************************/
        //그리드 설정
        $("#grid").kendoExtGrid({
            dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/svi/techManFnMaster/selectTechManFnMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sTecId"] = $("#sTecId").val();
                            params["sTecNm"] = $("#sTecNm").val();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,navigatable:false
                ,serverPaging:false
                ,pageSize:0
                ,schema:{
                    model:{
                        id:"rnum"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,tecId:{type:"string", validation:{required:true}}
                            ,tecNm:{type:"string", validation:{required:true}}
                            ,tecMfnNm:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,pageable:false
            ,height:280
            ,columns:[
                {field:"tecId", title:"<spring:message code='ser.lbl.tecId' />", width:100 ,attributes:{"class":"ac"}}//테크멘id
                ,{field:"tecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:200}//테크멘명
                ,{field:"tecMfnNm", title:"<spring:message code='ser.lbl.fnNm' />", width:250
                    ,template:"#=fnTpCdGrid(tecMfnNm)#"
                }//테크멘주기능명
                ,{title:""}
            ]

        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

    // 테크니션 구분
    fnTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = fnMap[val].cmmCdNm;
        }
        return returnVal;
    }
</script>









