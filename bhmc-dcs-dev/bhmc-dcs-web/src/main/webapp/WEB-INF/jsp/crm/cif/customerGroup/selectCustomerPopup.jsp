<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
    <!-- 그룹선택 팝업 -->
    <section id="windows" class="pop_wrap">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
        <h1 class="title_basic"><spring:message code="crm.title.custGrpMng" /></h1>
            <div class="btn_right">
                <!-- 조회 버튼 -->
                <!-- <button id="btnSearch" class="btn_m btn_Search"><spring:message code="global.btn.search" /></button> --> <!-- 조회 -->
                <button id="btnSelect" class="btn_m btn_Select"><spring:message code="global.btn.select" /></button> <!-- 선택 -->
                <button id="btnCancel" class="btn_m btn_Cancel"><spring:message code="global.btn.cancel" /></button> <!-- 취소 -->
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 -->

        <div class="table_grid">
            <div id="groupGridPopup"></div>
        </div>
    </section>
    <!-- //그룹선택 팝업 -->

 <script type="text/javascript">

    var jsonData = parent.dialog.options.content.data;

    console.log("jsonData:"+kendo.stringify(jsonData));

    var callbackFunc = jsonData.callbackFunc;


    /**
    * 선택된 값을 json 타입으로 변경 후 Call Back 함수로 넘겨준다.
    */
    rtnFunc = function(jsonObj){

        console.log($.type(callbackFunc));
        try{
            if ($.type(callbackFunc) == "string") {
                console.log("parent."+callbackFunc + "(" + JSON.stringify(jsonObj) + ")");
                eval("parent."+callbackFunc + "(" + JSON.stringify(jsonObj) + ")");
            } else if($.type(callbackFunc) == "function") {
                callbackFunc(jsonObj);
            }
        }
        catch(e){
            dms.notification.info(e);
        }

        var grid = $("#customerGrid").data("kendoExtGrid");
        //grid.setDataSource(new kendo.data.DataSource());
        //grid.refresh();
        parent.dialog.close();

    }

$(document).ready(function() {

    // 선택 버튼.
    $("#btnSelect").kendoButton({
        click:function(e){
            // 선택 데이타 가져오기.

            // 그리드 선택시 태그번호가 있을경우에만 디테일 호출
            var grid = $('#groupGridPopup').data('kendoExtGrid');
            var selectedItem = grid.dataItem(grid.select());

            if (selectedItem !== null){
                var rows = grid.select();
                if(rows !== null)
                {
                    var jsonObj = [];
                    $.each(rows, function(idx, row){
                        jsonObj.push(grid.dataItem(row));
                    });
                    rtnFunc(jsonObj);
                }
            } else {
                dms.notification.info("선택한 그룹이 없습니다.");
            }

        }
    });

    // 닫기 버튼.
    $("#btnCancel").kendoButton({
        click:function(e){
            // 팝업 닫기.
            parent.dialog.close();
        }
    });


    //그리드 설정 (그룹 CRUD)
    $("#groupGridPopup").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/crm/cif/customerGroup/selectCustomerGroup.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

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
                        }
                    }
            }

            ,requestEnd:function(e){
                if(e.type !== "read"){
             //       this.page(1);
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
                    ,{field:"grpNm", title:"그룹명",  width:100, attributes:{"class":"al"}}
                    //,{field:"groupCnt", title:"고객 수", width:40, attributes:{"class":"ac"}}
                ]
        ,navigatable:false
        ,sortable:false
        ,resizable:false
        ,height:250
    });

});

 </script>

