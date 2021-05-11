<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- 고객그룹소스 관리 -->
<section class="group">
    <!-- 조회 조건 타이틀 시작 -->

    <div class="header_area">
    </div>
    <!-- 조회 조건 타이틀 종료 -->
</section>

<div class="clfix">
<!-- 왼쪽 시작 -->
<section class="location_left">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='crm.title.custGrpMng' /></h1>
        <div class="btn_right">
            <button class="btn_s btn_add" id="btnAddGroupGrid"><spring:message code="global.btn.rowAdd" /></button> <!-- 그룹추가 -->
            <button class="btn_s btn_save" id="btnSaveGroupGrid"><spring:message code="global.btn.save" /></button> <!-- 그룹저장 -->
        </div>
    </div>
    <div class="table_grid">
        <div id="groupGrid"></div>
    </div>
</section>
<!-- 왼쪽 종료 -->
<!-- 오른쪽 시작 -->
<section class="location_right">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code='global.lbl.customer' /></h1>
        <!--
        <div class="btn_right">
            <button class="btn_s btn_save" id="btnPopupCustomerGroup">그룹선택</button>
            <button class="btn_s btn_save" id="btnSaveRightCustomerGrid">그룹변경</button>
        </div>
         -->
    </div>
    <div class="table_grid">
        <div id="customerGrid"></div>
        <input type="hidden" id="chgGrpSeq" value="">
    </div>

</section>
<!-- 오른쪽 종료 -->
</div>


<script type="text/javascript">

$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e){
            $('#groupGrid').data('kendoGrid').dataSource.page(1);
        }
    });

    //버튼 - 그룹 추가
    $("#btnAddGroupGrid").kendoButton({
        click:function(e){
            $('#groupGrid').data('kendoExtGrid').dataSource.insert(0,{
                  "grpNm":""
                , "sortOrder":""
                , "grpTp":"001"
             });
        }
    });

    //버튼 - 그룹 저장
    $("#btnSaveGroupGrid").kendoButton({
        click:function(e){

            var grid = $("#groupGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if(grid.cudDataLength == 0){
                dms.notification.info("<spring:message code='global.info.required.change' />");
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

    //버튼 - 그룹선택 팝업
    $("#btnPopupCustomerGroup").kendoButton({
        click:function(e){
            selectGroupPopup();
        }
    });

    //버튼 - 그룹선택 변경 저장
    $("#btnSaveRightCustomerGrid").kendoButton({
        click:function(e){

            var grid = $("#customerGrid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

            if(grid.cudDataLength == 0){
                dms.notification.info("<spring:message code='global.info.required.change' />");
                return;
            }
            //saveData.selGrpSeq = $("#chgGrpSeq").val();
            //console.log(saveData);
            //console.log(JSON.stringify(saveData));

            if(grid.gridValidation()){
                $.ajax({
                    url:"<c:url value='/crm/cif/customerGroup/multiCustomerGroupChg.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error){
                        //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                    },
                    success:function(jqXHR, textStatus){

                        grid.dataSource._destroyed = [];
                        dms.notification.info("<spring:message code='global.info.success' />");
                        grid.dataSource.page(1);
                        $("#groupGrid").data("kendoExtGrid").dataSource.page(1);

                    }
                });
            }else{
                globalNotification.show("<spring:message code='global.info.check.input' />", "error");
            }
        }
    });


    //취소
    $("#btnCancel").kendoButton({
        click:function(e){
            $('#groupGrid').data('kendoExtGrid').cancelChanges();
        }
    });

    //그룹 그리드 설정
    $("#groupGrid").kendoExtGrid({
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
                        params["sGrpTp"]                 = "001";

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
                            , grpNm    :{type:"string", validation:{required:true}}
                            , sortOrder:{type:"number", editable:false}
                            , groupCnt :{type:"string", editable:false}
                            , grpTp    :{type:"string", editable:false}
                            //, delYn    :{type:"string", validation:{required:true}}
                        }
                    }
            }
            ,batch:true
            ,serverPaging:true
            ,serverSorting:false
            ,requestEnd:function(e) {

                if (e.type !== "read") {
                    //this.page(1);
                }
            }
        }
        ,multiSelectWithCheckbox:false
        ,columns:[
                     {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                    ,{field:"grpNm", title:"<spring:message code='global.lbl.groupName' />",  width:100, attributes:{"class":"al"}}
                    ,{field:"groupCnt", title:"<spring:message code='global.lbl.custCnt' />", width:40, attributes:{"class":"ac"}}
                    //,{field:"grpTp", title:"타입", width:40, attributes:{"class":"ac"}}
                ]
        ,navigatable:false
        ,editable:{
            mode:"incell"
            ,confirmation:false
        }
        //,sortable:true
        //,height:700
        //,selectable:"multiple, row"
        ,resizable:false
        ,change:function(e){

            if(!e.sender.dataItem(e.sender.select()).isNew()){
                var selectedVal = this.dataItem(this.select());
                var grpSeq = selectedVal.grpSeq;
                // $("#customerGrid").data("kendoExtGrid").dataSource.page(1);
            }
        }
    });

    //고객정보 그리드 설정
    $("#customerGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerGroup/selectCustomerInGroup.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        var groupGrid = $("#groupGrid").data("kendoExtGrid");
                        var selectedItem = groupGrid.dataItem(groupGrid.select());

                        if( selectedItem != null && selectedItem != 'undefined'){
                            params["sGrpSeq"] = selectedItem.grpSeq;
                        }
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
                        id:"custNo"
                        ,fields:{
                            custNo      :{type:"string", editable:false}
                            , rnum      :{type:"number", editable:false}
                            , custNm    :{type:"string", editable:false}
                            , telNo     :{type:"string", editable:false}
                            , hpNo      :{type:"string", editable:false}
                            , grpSeq    :{type:"number", editable:true}
                        }
                    }
            }
            ,batch:true
            ,serverPaging:true
            ,serverSorting:false
            ,requestEnd:function(e) {

                if (e.type !== "read") {
                    //this.page(1);
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,columns:[
                     {field:"rnum",   title:"<spring:message code='global.lbl.no' />", width:30, sortable:false, attributes:{"class":"ac"}}
                    , {field:"custNm", title:"<spring:message code='global.lbl.custNm' />", width:80, attributes:{"class":"al"}}
                    , {field:"telNo",  title:"<spring:message code='global.lbl.homeTelNo' />", width:50, attributes:{"class":"ac"}}
                    , {field:"hpNo",   title:"<spring:message code='global.lbl.hpNo' />", width:50, attributes:{"class":"ac"}}
                    <!-- ,{field:"grpSeq",   title:"그룹SEQ", width:50, attributes:{"class":"ac"}} -->
                ]
        ,navigatable:false
        ,editable:{
            mode:"incell"
            ,confirmation:false
        }
        ,sortable:false
        //,height:768
        ,resizable:false
        ,change:function(e){

            //var rows = $("#customerGrid").data("kendoExtGrid").tbody.find("tr");
/*
            rows.each(function(index, row) {
                if($(this).hasClass("k-state-selected")){
                    $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", true);
                }else{
                    $(".grid-checkbox-item[data-uid=" + $(this).attr("data-uid") + "]").prop("checked", false);
                }
            });
*/

        }
    });

 // 고객그룹변경 팝업 열기 함수.
    var popupWindow;
    function selectGroupPopup(){
        popupWindow = dms.window.popup({
            windowId:"groupSearchPopup"
            , title:"<spring:message code = 'global.title.custGrpSearch'/>"   // 고객그룹 조회
            , content:{
                url:"<c:url value='/crm/cif/customerGroup/selectGroupPopup.do'/>"
                , data:{
                    "autoBind":false
                    , "type"  :null
                    , "callbackFunc":function(data){
                        //console.log(JSON.stringify(data));

                        var chgGrpSeq = data[0].grpSeq;

                        var grid = $("#customerGrid").data("kendoExtGrid");
                        var selectedItems = grid.select();

                        selectedItems.each(function (index, row){
                           var selectedItem = grid.dataItem(row);
                           selectedItem.set("grpSeq",chgGrpSeq);
                        });
                        $("#chgGrpSeq").val(data[0].grpSeq);
                    }
                }
            }
        })

    }

});

</script>








