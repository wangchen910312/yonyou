<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">

    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
            <%-- <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> --%>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:18%;">
                <col style="width:32%;">
                <col style="width:18%;">
                <col style="width:32%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.tecId' /></th>
                    <td>
                        <input id="sTecId" name="sTecId" class="form_input" style="width:100%">
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.tecNm' /></th>
                    <td>
                        <input id="sTecNm" name="sTecNm" class="form_input" style="width:100%">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="tabstrip" class="tab_area">
        <!-- 탭메뉴 -->
        <ul>
            <li id="techTab"><spring:message code='ser.lbl.tecId' /><!-- 테크니션 --></li>
            <li id="workGrpTab" class="k-state-active"><spring:message code='ser.lbl.wkgrpNo' /><!-- 소조 --></li>
        </ul>
        <!-- //탭메뉴 -->
        <div class="table_grid mt10">
            <div id="tech" class="grid"></div>
        </div>

        <div class="table_grid mt10">
            <div id="workGrp" class="grid"></div>
        </div>
    </div>

</section>

<script type="text/javascript">

    /************************************************************
    팝업옵션 설정
    *************************************************************/
    /**
    * 팝업 옵션
    */
    var options = parent.wkgrpSearchPopup.options.content.data;
    var tabId = "workGrpTab"; // 탭아이디

//기능유형 Array
var fnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${fnList}">
fnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//기능 Map
var fnMap = dms.data.arrayToMap(fnList, function(obj){ return obj.cmmCd; });

// 테크니션 구분
fnTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(fnMap[val] != undefined)
            returnVal = fnMap[val].cmmCdNm;
    }
    return returnVal;
};

    $(document).ready(function() {

        $("#tabstrip").kendoExtTabStrip({
            animation:false
           ,select:function(e){
                tabId = e.item.id;
            }
        });

        // 테크니션 그리드 더블 클릭 이벤트.
        $("#tech").on("dblclick", "tr.k-state-selected", function (e) {
            getRowData(tabId);
        });

        // 소조 그리드 더블 클릭 이벤트.
        $("#workGrp").on("dblclick", "tr.k-state-selected", function (e) {
            getRowData(tabId);
        });


        /************************************************************
                    기능버튼 설정
        *************************************************************/
        // 조회 버튼.
        $("#btnSearch").kendoButton({
            click:function(e){
                $("#tech").data("kendoExtGrid").dataSource.read();
            }
        });

        // 선택 버튼.
        $("#btnSelect").kendoButton({
            click:function(e){
                getRowData(tabId);
            }
        });

        // 닫기 버튼.
        $("#btnCancel").kendoButton({
            click:function(e){
                parent.wkgrpSearchPopup.close();
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
        $("#tech").kendoExtGrid({
            gridId:"G-SER-1011-000108"
            ,dataSource:{
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
                            ,tecSfnNm1:{type:"string", validation:{required:true}}
                        }
                    }
                }
            }
            //,multiSelectWithCheckbox:true
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,pageable:false
            ,height:260
            ,filterable:false                 // 필터링 기능 사용안함
            ,columns:[
                {field:"tecId", title:"<spring:message code='ser.lbl.tecId' />", width:100 ,attributes:{"class":"ac"}}//테크멘id
                ,{field:"tecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:150}//테크멘명
                ,{field:"tecMfnNm", title:"<spring:message code='ser.lbl.fnNm' />", width:230
                    ,template:"#=fnTpCdGrid(tecMfnNm)#"
                }//테크멘주기능명
                ,{title:"tecSfnNm1", title:"<spring:message code='ser.lbl.sFnNm' />", width:230
                    ,template:"#=fnTpCdGrid(tecSfnNm1)#"
                }//테크멘부기능1
            ]
        });

        //소조 그리드 설정
        $("#workGrp").kendoExtGrid({
            gridId:"G-SER-1011-000109"
            ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/svi/workGroupManage/selectWorkGroupManages.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sWkgrpNo"] = $("#sWkgrpNo").val();
                            params["sMngSaNm"] = $("#sMngSaNm").val();

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
                           rnum:{type:"number"}
                           ,wkgrpNo:{ type:"string" }
                           ,wkgrpNm:{ type:"string" }
                           ,dlrCd:{ type:"string" }
                           ,useYn:{ type:"string" }
                           ,mngSaId:{ type:"string" }
                           ,mngSaNm:{ type:"string" }
                      }
                   }
                }
            }
            //,multiSelectWithCheckbox:true
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,pageable:false
            ,height:260
            ,filterable:false                 // 필터링 기능 사용안함
            ,columns:[
                {field:"wkgrpNo", title:"<spring:message code='ser.lbl.wkgrpNo' />", width:100}    // 소조번호
                ,{field:"mngSaNm", title:"<spring:message code='ser.lbl.mngSaNm' />", width:100
                    ,editor:function(container, options) {
                        $('<div class="form_search"><input type="text" name="mngSaNm" class="form_input" readonly="readonly" /><a href="#" onclick="mngSaPopup()"></a></div>')
                        .appendTo(container);
                        $('<span class="k-invalid-msg" data-for="mngSaNm"></span>')
                        .appendTo(container);
                    }
                }   // 소조관리자
                ,{field:"wkgrpNm", title:"<spring:message code='ser.lbl.dtiInfo' />", width:100}    // 내역
                ,{field:"mngSaId", hidden:true}
            ]

        });

        if(options.autoBind){
            $("#tech").data("kendoExtGrid").dataSource.read();
            $("#workGrp").data("kendoExtGrid").dataSource.read();
        }

        getRowData = function(tabId) {
            var selectGrid = tabId.replace("Tab", "");
            var grid = $("#"+selectGrid).data("kendoExtGrid");
            var rows = grid.select();

            if(rows !== null)
            {
                var data = [];
                $.each(rows, function(idx, row){
                    var gridData = grid.dataItem(row);
                    gridData.tabId = tabId
                    data.push(gridData);
                });

                options.callbackFunc(data);
                //parent.wkgrpSearchPopup.close();
            }
        }
    });

</script>









