<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.tagMng" /></h1>
        <div class="btn_right">
		<dms:access viewId="VIEW-I-12511" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
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
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col style="width:15%;">
                <col style="width:10%;">
                <col>
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="global.lbl.type" /></th>
                    <td>
                        <input id="sGrpTp" type="text" class="form_comboBox">
                    </td>
                    <th scope="row"><spring:message code="global.lbl.cont" /></th>
                    <td>
                        <input id="sGrpNm" type="text" class="form_input" >
                    </td>
                    <th scope="row"></th>
                    <td></td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->
    <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <h2 class="title_basic"><spring:message code='global.title.list' /></h2>
        </div>
        <div class="table_grid">
            <div id="tagGrid"></div>
        </div>
    <!-- 그리드 기능 버튼 종료 -->
</section>


<script type="text/javascript">

var grpTpList = [];
var grpTpMap = [];

<c:forEach var="obj" items="${grpTpList}">
grpTpList.push({"cmmCd":"${obj.cmmCd}" , "cmmCdNm":"${obj.cmmCdNm}"});
grpTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

$(document).ready(function() {

    //조회조건 - 유형선택
    $("#sGrpTp").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        , dataValueField:"cmmCd"
        , optionLabel:" "
        , dataSource:grpTpList
        , index:0
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#tagGrid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 태그 추가
    $("#btnAddTagGrid").kendoButton({
        click:function(e){
            $('#tagGrid').data('kendoExtGrid').dataSource.insert(0,{
                  "grpNm":""
                , "sortOrder":""
             });
        }
    });

    //버튼 - 태그 저장
    $("#btnSaveTagGrid").kendoButton({
        click:function(e){

            var grid = $("#tagGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if(grid.cudDataLength == 0){
                dms.notification.info("<spring:message code='global.info.check.input' />");
                return;
            }

            console.log(saveData);

            if(grid.gridValidation()){
                $.ajax({
                    url:"<c:url value='/crm/cif/customerGroup/multiCustomerGroup.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error){
                        //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                    },
                    success:function(jqXHR, textStatus){

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
                        dms.notification.info("<spring:message code='global.info.success' />");
                    }
                });
            }else{
                dms.notification.info("<spring:message code='global.info.check.input' />");
            }
        }
    });

    //태그 그리드 설정
    $("#tagGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerGroup/selectCustomerGroup.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"]    = options.pageSize;
                        params["pageIndex"]             = options.page;
                        params["firstIndex"]            = options.skip;
                        params["lastIndex"]             = options.skip + options.take;
                        params["sort"]                  = options.sort;

                        params["sGrpNm"]                = $("#sGrpNm").val();
                        params["sGrpTp"]                = $("#sGrpTp").data("kendoExtDropDownList").value();

                        console.log(params);

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                errors:"error"
                    ,data:"data"
                    ,total:"total"
                    ,model:{
                        id:"grpSeq"
                        ,fields:{
                            grpSeq     :{type:"number", editable:false}
                            , rnum     :{type:"number", editable:false}
                            , grpNm    :{type:"string", editable:false}
                            , sortOrder:{type:"number", editable:false}
                            , groupCnt :{type:"string", editable:false}
                            , grpTp    :{type:"string", editable:false}
                            //, delYn    :{type:"string", validation:{required:true}}
                        }
                    }
            }
            ,batch:true
            ,pageSize:10
            ,serverPaging:true
            ,serverSorting:false
        }
        ,multiSelectWithCheckbox:false
        ,columns:[
                     {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                    ,{field:"grpTp", title:"<spring:message code='global.lbl.type' />", width:100
                        , editor:function(container, options){
                            $('<input data-bind="value:' + options.field + '"  />')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                dataTextField:"cmmCdNm"
                                , dataValueField:"cmmCd"
                                , dataSource:grpTpList
                            });
                        }
                        , template:'#if (grpTp !== ""){# #= grpTpMap[grpTp]# #}#'
                    }
                    ,{field:"grpNm", title:"<spring:message code='global.lbl.cont' />",  width:200, attributes:{"class":"al"}}
                    ,{field:"groupCnt", title:"<spring:message code='global.lbl.custCnt' />", width:40, attributes:{"class":"ac"}, hidden:true}
                    ,{title:""}
                ]
        ,navigatable:false
    });



});

</script>








