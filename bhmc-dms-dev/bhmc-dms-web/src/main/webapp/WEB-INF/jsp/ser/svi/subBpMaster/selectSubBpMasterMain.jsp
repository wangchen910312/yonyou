<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 외주거래처 마스터 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">

            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
                <h1 class="title_basic"><spring:message code='ser.title.subBpMaster' /></h1><!-- 외주거래처마스터 -->
                <div class="btn_right">
                    <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
                    <button class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
                    <button class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /></button>
                    <button class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
                </div>
            </div>
            <!-- 그리드 기능 버튼 종료 -->

            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="grid" class="resizable_grid"></div>
            </div>
            <!-- 그리드 종료 -->
        </section>
    </div>
</div>
<script type="text/javascript">
 var useYnList = [{"cmmCd":"Y","cmmCdNm":"<spring:message code='ser.lbl.use' />"},{"cmmCd":"N","cmmCdNm":"<spring:message code='ser.lbl.notUse' />"}];
 var useYnMap = dms.data.arrayToMap(useYnList, function(obj){return obj.cmmCd});

 useYnGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         if(useYnMap[val] != undefined)
             returnVal = useYnMap[val].cmmCdNm;
     }
     return returnVal;
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
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {"useYn":"Y"
             });
        }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //globalNotification.show("저장할 정보가 없습니다.", "info");
                return;
            }

            //if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/subBpMaster/multiSubBpMasters.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {

                        grid.dataSource._destroyed = [];
                        grid.dataSource.page(1);
                        //정상적으로 반영 되었습니다.
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#resizableContainer"));
                    }
                });
            //}else{
                //입력값을 확인하여 주십시오.
                //dms.notification.warning("<spring:message code='global.info.check.input'/>");
            //}



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
        gridId:"G-SER-1011-000137"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/svi/subBpMaster/selectSubBpMasters.do' />"
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

                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"rnum"
                    ,fields:{
                        dlrCd:{type:"string"}
                        ,subBpCd:{type:"string", validation:{required:true}}
                        ,subBpNm:{type:"string", validation:{required:true},editable:false}
                        ,subLbrDcRate:{type:"number",validation:{ max:99}}
                        ,subParDcRate:{type:"number",validation:{max:99}}
                        ,useYn:{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,columns:[
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"subBpCd", title:"<spring:message code='ser.lbl.subBpCd' />", width:120//외주거래처코드
                ,attributes:{"class":"ac"}
                ,editor:function(container, options) {
                     if(!options.model.isNew()){
                         container.context.innerText = options.model.subBpCd
                         return ;
                        }
                    $('<div class="form_search"><input required class="form_input" data-bind="value:' + options.field + '"/><a href="#" onclick="javascript:selectVenderMasterPopupWindow();"></a></div>')
                    .appendTo(container)
                }
            }
            ,{field:"subBpNm", title:"<spring:message code='ser.lbl.subBpNm' />", width:200, attributes:{"class":"ac"}}//외주거래처명
            ,{field:"subLbrDcRate", title:"<spring:message code='ser.lbl.lbrDcRate' />(%)", width:100//공임할인율
                ,attributes:{"class":"ar"}
            }
            ,{field:"subParDcRate", title:"<spring:message code='ser.lbl.parDcRate' />(%)", width:100//부품할인율
                ,attributes:{"class":"ar"}
            }
            ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:80
                ,attributes:{"class":"ac"}
                ,template:"#=useYnGrid(useYn)#"
                ,editor:function(container, options) {
                    $('<input data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                        ,dataSource:useYnList
                        ,index:1
                    });
                }
            }
            ,{title:""}
        ]

    });

});

//거래처 팝업 열기 함수.
var venderSearchPopupWin;
function selectVenderMasterPopupWindow(){

    venderSearchPopupWin = dms.window.popup({
        windowId:"venderSearchPopupWin"
        ,title:"<spring:message code = 'ser.title.venderSelect'/>"   // 거래처 조회
        ,content:{
            url:"<c:url value='/par/pmm/venderMaster/selectVenderMasterPopup.do'/>"
            ,data:{
                "type":"custom1"
                ,"autoBind":true
                ,"callbackFunc":function(data){
                    var grid = $('#grid').data('kendoExtGrid');
                    var dataItems = grid.dataSource._data;
                    var checkVal = true;

                    // 중복값 체크
                    $.each(dataItems, function(idx, obj){
                        if(data[0].bpCd == obj.subBpCd){
                            checkVal = false;
                        }
                    });
                    if(checkVal){
                        var dataItem = grid.dataItem(grid.select());
                        dataItem.subBpCd = data[0].bpCd;
                        dataItem.subBpNm = data[0].bpNm;
                        grid.refresh();
                    }

                    venderSearchPopupWin.close();
                }
            }
        }
    });
}

</script>







