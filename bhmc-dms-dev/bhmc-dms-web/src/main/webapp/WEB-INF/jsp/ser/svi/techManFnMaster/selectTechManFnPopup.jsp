<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<section id="windows" class="pop_wrap">
    <div class="header_area">
        <div class="btn_right">
            <button id="btnSearch" class="btn_m btn_search"><spring:message code="global.btn.search" /></button>
            <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button>
        </div>
    </div>

    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code='ser.lbl.systemId' /></th><!-- 시스템번호 -->
                    <td>
                        <input type="text" id="sTecId" class="form_input"/>
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.empNm' /></th><!-- 직원이름 -->
                    <td>
                        <input type="text" id="sTecNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='ser.lbl.deptNm' /></th><!-- 부서명 -->
                    <td>
                        <input type="text" id="sDeptNm" class="form_input" />
                    </td>
                    <th scope="row"><spring:message code='sal.lbl.btoWrkTp' /></th><!-- 업무구분 -->
                    <td>
                        <input type="sWrkTp" id="sWrkTp" class="form_comboBox" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="table_grid mt10">
        <div id="grid" class="grid"></div>
    </div>

</section>

<script type="text/javascript">
var id5 = "<spring:message code='ser.lbl.tecId' />";
var nm5 = "<spring:message code='ser.lbl.tecNm' />";
var id1 = "<spring:message code='ser.lbl.saId' />";
var nm1 = "<spring:message code='ser.lbl.saNm' />";

//기능유형 Array
var fnList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${fnList}">
fnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//기능 Map
var fnMap = dms.data.arrayToMap(fnList, function(obj){ return obj.cmmCd; });

//업무구분 Array
var wrkTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${wrkTpCdList}">
wrkTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//기능 Map
var wrkTpCdMap = dms.data.arrayToMap(wrkTpCdList, function(obj){ return obj.cmmCd; });

// 테크니션 구분
fnTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(fnMap[val] != undefined)
            returnVal = fnMap[val].cmmCdNm;
    }
    return returnVal;
};

//업무 구분
wrkTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(wrkTpCdMap[val] != undefined)
            returnVal = wrkTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

    $(document).ready(function() {
        // 조회조건 : 업무유형
        $("#sWrkTp").kendoExtDropDownList({
            dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,dataSource:wrkTpCdList
            ,optionLabel:" "
            ,index:0
        });


        /************************************************************
                    팝업옵션 설정
        *************************************************************/
        /**
         * 팝업 옵션
         */
        var options = parent.tecSearchPopup.options.content.data;

        var wrkTp = options.wrkTp;

        if(wrkTp == "01"){
            $("#mTecId").text(id1)
            $("#mTecNm").text(nm1)

        } else if(wrkTp == "05") {
            $("#mTecId").text(id5)
            $("#mTecNm").text(nm5)

        }

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
           gridId:"G-SER-1011-000139"
           ,dataSource:{
                 transport:{
                    read:{
                        url:"<c:url value='/ser/svi/techManFnMaster/selectTechManFnMasters.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["sTecId"]  = $("#sTecId").val();
                            params["sTecNm"]  = $("#sTecNm").val();
                            params["sDeptNm"] = $("#sDeptNm").val();
                            params["sWrkTp"]  = $("#sWrkTp").val();

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
            ,multiSelectWithCheckbox:true
            ,selectable:options.selectable === "multiple"? "multiple,row":"row"
            ,editable:false
            ,pageable:false
            ,height:280
            ,filterable:false                 // 필터링 기능 사용안함
            ,columns:[
                 {field:"tecId", title:wrkTp == '05' ? "<spring:message code='ser.lbl.tecId' />":"<spring:message code='ser.lbl.systemId' />", width:100 ,attributes:{"class":"ac"}}//테크멘id
                ,{field:"sysNo", title:"<spring:message code='ser.lbl.staffNo' />", width:100, attributes:{"class":"al"}}
                ,{field:"tecNm", title:wrkTp == '05' ? "<spring:message code='ser.lbl.tecNm' />":"<spring:message code='ser.lbl.empNm' />", width:200}//테크멘명
                ,{field:"sexCd", title:"<spring:message code='ser.lbl.userSex' />", width:80}                      // 성별
                ,{field:"deptCd", title:"<spring:message code='ser.lbl.deptCd' />", width:150}                     // 부서코드
                ,{field:"deptNm", title:"<spring:message code='ser.lbl.deptNm' />", width:150}                     // 부서코드
                ,{field:"tskCd", title:"<spring:message code='ser.lbl.tskCd' />", width:150}                       // 직무코드
                ,{field:"tskNm", title:"<spring:message code='ser.lbl.tskNm' />", width:150}                       // 직무명칭
                ,{field:"tecMfnNm", title:"<spring:message code='ser.lbl.fnNm' />", width:250
                    ,template:"#=fnTpCdGrid(tecMfnNm)#"
                    ,hidden:true
                }//테크멘주기능명
                ,{field:"wrkTp", title:"<spring:message code='sal.lbl.btoWrkTp' />", width:150, attributes:{"class":"ac"}
                    ,template:"#=wrkTpCdGrid(wrkTp)#"
                    ,editor:function(container, options) {
                        $('<input required name="wrkTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            autoBind:false
                            ,dataSource:fnList
                            ,dataValueField:"cmmCd"
                            ,dataTextField:"cmmCdNm"
                        });
                    }
                }//업무구분
            ]

        });

        if(options.autoBind){
            $("#grid").data("kendoExtGrid").dataSource.read();
        }
    });

</script>









