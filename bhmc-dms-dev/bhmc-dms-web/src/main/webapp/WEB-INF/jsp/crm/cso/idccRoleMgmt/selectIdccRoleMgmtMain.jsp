<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div id="resizableContainer">  <!--  resizableContainer Div -->
<!-- IDCC 역활관리 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.menu.idccRole" /></h1>
        <div class="btn_right">
        <dms:access viewId="VIEW-D-11136" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11137" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
        </dms:access>
        <dms:access viewId="VIEW-D-11138" hasPermission="${dms:getPermissionMask('READ')}">
            <button type="button" class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
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
                    <th scope="row"><spring:message code='crm.lbl.prsNm' /><!-- 책임자 --></th>
                    <td>
                        <input id="sUsrNmRemark" type="text" class="form_input">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
<!--     <div class="header_area"> -->
<!--         <div class="btn_right"> -->
<%--             <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button> --%>
<!--         </div> -->
<!--     </div> -->
    <!-- 그리드 기능 버튼 종료 -->

    <!-- 그리드 시작 -->
    <div class="table_grid mt10">
        <div id="grid" class="resizable_grid"></div>
    </div>
    <!-- 그리드 종료 -->
</section>
</div>   <!--  resizableContainer Div -->

<script type="text/javascript">

var gridData = new kendo.data.DataSource({data:[]});

var holdTpList = [];
var holdTpMap = [];

<c:forEach var="obj" items="${holdTpList}">
    holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
    holdTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";
</c:forEach>

var defaultDatasourceSetting = function(e){
    tagDS = [];
    console.log(e);

    var selectedTags = $("#custTagsC").data("kendoMultiSelect").value();

    if(selectedTags.length == 0){
        return;
    }

    $.each(custTagsC, function(index, data){
        if(selectedTags.indexOf(data.cmmCd) > -1){
            tagDS.push({"cmmCd":data.cmmCd,"cmmCdNm":data.cmmCdNm});
        }
    });

};

$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {

            //필터가 적용된 상태체크
            if($('#grid').data('kendoExtGrid').dataSource.filter()){
                dms.notification.info("<spring:message code='global.info.clearFilter'/>");
                return;
            }

            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                "holdTp":$("#sHoldTp").data("kendoExtDropDownList").value()
                ,"holdDetlTpNm":""
                ,"remark":""
                ,"sortOrder":""
                ,"delYn":""
             });
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            if (rows.length < 1) {
                //목록을 선택하여 주십시오.
                dms.notification.info("<spring:message code='global.info.required.select'/>");
                return;
            }

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#grid").data("kendoExtGrid");

            var holdMngTp = "";

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList", ["lstUpdtDtFormat"]);
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

//             if (saveData.insertList.length != 0 ){
//                 if (saveData.insertList.holdMngTp.length > 0) {
//                     for (var j=0; j<=saveData.insertList.holdMngTp.length ; j++){
//                         holdMngTp += saveData.insertList.holdMngTp[j];
//                         if (j != saveData.insertList.holdMngTp.length) {
//                             holdMngTp += ",";
//                         }
//                     }
//                 }
//             }

//             console.log(holdMngTp);
//             if (saveData.updateList.length != 0 ){
//                 for (var i=0; i<=saveData.updateList.length-1 ; i++){
//                     if (saveData.updateList[i].holdMngTp.length != 0){
//                         for (var j=0; j<=saveData.updateList[i].holdMngTp.length-1 ; j++){
//                             holdMngTp += saveData.updateList[i].holdMngTp[j];
//                             if (j != saveData.updateList[i].holdMngTp.length-1) {
//                                 holdMngTp += ",";
//                             }
//                         }
//                         saveData.updateList[i].holdMngTp.push(holdMngTp);
//                     }
//                 }
//             }
            console.log("btnSave  idcc !!!");
            console.log(saveData);

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/crm/cso/idccRoleMgmt/multiIdccRole.do' />"
                    ,data:JSON.stringify(saveData)
                    ,type:'POST'
                    ,dataType:'json'
                    ,contentType:'application/json'
                    ,error:function(jqXHR, status, error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    }
                    ,success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);

                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                });
            }else{
                //입력값을 확인하여 주십시오.
                dms.notification.warning("<spring:message code='global.info.check.input'/>");
            }
        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });


    //그리드 설정
    $("#grid").kendoExtGrid({
        //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
        gridId:"G-CRM-0811-114233"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cso/idccRoleMgmt/selectIdccRole.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sUsrNmRemark"] = $("#sUsrNmRemark").val();

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
                        ,usrId:{type:"string", editable:false}
                        ,usrNm:{type:"string", editable:false}
                        ,remark:{type:"string"}
                        ,holdMngTp:{type:"string"}
                        ,regDt:{type:"date", editable:false}
                        ,updtDt:{type:"date", editable:false}
                    }
                }
            }
        }
        ,indvColumnVisible:true           //컬럼 보이기/감추기 개인화 적용. default:true
        ,indvColumnReorderable:true       //컬럼순서 변경 개인화 적용. default:true
        ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
        ,multiSelectWithCheckbox:true     //멀티선택 적용. default:false
        ,multiSelectLocked:false          //멀티선택 컬럼 틀고정 default:false
        ,appendEmptyColumn:true           //빈컬럼 적용. default:false
        ,enableTooltip:true               //Tooltip 적용, default:false
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"usrId", title:"<spring:message code='crm.lbl.prsId' />", width:150} // 책임자 ID
            ,{field:"usrNm", title:"<spring:message code='crm.lbl.prsNm' />", width:150} // 책임자
            ,{field:"remark", title:"<spring:message code='crm.lbl.role' />", width:150}
            ,{field:"holdMngTp", title:"<spring:message code='crm.lbl.holdTpMng' />", width:450
                ,template:function(data){
                    var holdMngTpNames = [];

                    if(dms.string.isNotEmpty(data.holdMngTp)){
                        $.each(data.holdMngTp.split(","), function(idx, val){
                            holdMngTpNames.push(holdTpMap[val]);
                        });
                    }

                    return holdMngTpNames.join(",");
                }
                ,editor:function(container, options){
                    $('<select/>')
                    .appendTo(container).kendoMultiSelect({
                        dataTextField:"cmmCdNm",
                        dataValueField:"cmmCd",
                        valuePrimitive: true,
                        dataSource:holdTpList,
                        value:dms.string.isEmpty(options.model.holdMngTp)? []:options.model.holdMngTp.split(","),
                        change:function(e){
                            options.model.set("holdMngTp", this.value().join(","));
                        }
                    }).data("kendoMultiSelect").open();
                }
            }
        ]
    });
});

</script>
