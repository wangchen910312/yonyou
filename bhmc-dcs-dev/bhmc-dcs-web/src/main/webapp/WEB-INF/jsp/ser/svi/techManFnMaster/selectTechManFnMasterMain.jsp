<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 테크멘 기능관리 마스터 -->
<section class="group">

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.teckFnMng" /></h1><!-- 테크멘 기능관리마스터 -->
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
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->
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

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {
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

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/ser/svi/techManFnMaster/multiTechManFnMasters.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        //globalNotification.show(JSON.parse(jqXHR.responseText).error, "error");
                    },
                    success:function(jqXHR, textStatus) {

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


    validationCheck = function(e){

        var masterGrid = $("#gridMaster").data("kendoExtGrid");
        var msgText = "";
        var result = false;
        $.each(masterGrid.dataSource._data, function(idx, obj){
            if( dms.string.isEmpty(obj.wkgrpNo)){
                msgText = "<spring:message code='ser.lbl.wkgrpNo' var='wkgrpNo' />"+
                              "<spring:message code='global.info.required.field' arguments='${wkgrpNo}' />";
                result = true;
            }else if( dms.string.isEmpty(obj.mngSaNm) ){
                msgText = "<spring:message code='ser.lbl.mngSaNm' var='mngSaNm' />"+
                              "<spring:message code='global.info.required.field' arguments='${mngSaNm}' />";
                result = true;
            }else if( dms.string.isEmpty(obj.wkgrpNm) ){
                msgText = "<spring:message code='ser.lbl.dtiInfo' var='dtiInfo' />"+
                              "<spring:message code='global.info.required.field' arguments='${dtiInfo}' />";
                result = true;
            }else if( dms.string.isEmpty(obj.useYn) ){
                msgText = "<spring:message code='ser.lbl.wrkgrpStat' var='wrkgrpStat' />"+
                              "<spring:message code='global.info.required.field' arguments='${wrkgrpStat}' />";
                result = true;
            }
            return result;
        });

        if(result) dms.notification.warning(msgText);
        return result;
    };

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
                        dlrCd:{type:"string", validation:{required:true}}
                        ,rnum:{type:"string", editable:false}
                        ,tecId:{type:"string", validation:{required:true}}
                        ,tecNm:{type:"string", validation:{required:true}}
                        ,tecMfnNm:{type:"string"}
                        ,tecSfnNm1:{type:"string"}
                        ,tecSfnNm2:{type:"string"}
                        ,tecSfnNm3:{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,edit:onEdit
        ,height:600
        ,columns:[
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"tecId", title:"<spring:message code='ser.lbl.tecId' />", width:100//테크니션ID
                ,attributes:{"class":"ac"}
            }
            ,{field:"tecNm", title:"<spring:message code='ser.lbl.tecNm' />", width:150, attributes:{"class":"ac"}}//테크니션명
            ,{field:"tecMfnNm", title:"<spring:message code='ser.lbl.fnNm' />", width:150, attributes:{"class":"ac"}
                ,template:"#=fnTpCdGrid(tecMfnNm)#"
                ,editor:function(container, options) {
                    $('<input required name="tecMfnNm" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:fnList
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                    });
                }
            }//테크멘 주기능명
            ,{
                title:"<spring:message code='ser.lbl.sFnNm' />"  // 부기능
               ,headerAttributes:{ "class":"hasBob" }
               ,width:200
               ,columns:[
                     {   title:"1"
                        ,field:"tecSfnNm1"
                        ,headerAttributes:{"class":"hasBol"}
                        ,attributes:{"class":"ac"}
                        ,sortable:false
                        ,width:150
                        ,template:"#=fnTpCdGrid(tecSfnNm1)#"
                        ,editor:function(container, options) {
                            $('<input required name="tecSfnNm1" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                valuePrimitive:true
                                ,dataSource:fnList
                                ,dataValueField:"cmmCd"
                                ,dataTextField:"cmmCdNm"
                            });
                        }
                    }
                    ,{   title:"2"
                        ,field:"tecSfnNm2"
                        ,attributes:{"class":"ac"}
                        ,sortable:false
                        ,width:150
                        ,template:"#=fnTpCdGrid(tecSfnNm2)#"
                        ,editor:function(container, options) {
                            $('<input required name="tecSfnNm2" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                valuePrimitive:true
                                ,dataSource:fnList
                                ,dataValueField:"cmmCd"
                                ,dataTextField:"cmmCdNm"
                            });
                        }
                    }
                    ,{   title:"3"
                        ,field:"tecSfnNm3"
                        ,attributes:{"class":"ac"}
                        ,sortable:false
                        ,width:150
                        ,template:"#=fnTpCdGrid(tecSfnNm3)#"
                        ,editor:function(container, options) {
                            $('<input required name="tecSfnNm3" data-bind="value:' + options.field + '"/>')
                            .appendTo(container)
                            .kendoExtDropDownList({
                                valuePrimitive:true
                                ,dataSource:fnList
                                ,dataValueField:"cmmCd"
                                ,dataTextField:"cmmCdNm"
                            });
                        }
                    }
                   ]
            }
           ,{title:""}
        ]

    });

    // 테크니션 구분
    fnTpCdGrid = function(val){
        var returnVal = "";
        if(val != null && val != ""){
            returnVal = fnMap[val].cmmCdNm;
        }
        return returnVal;
    }

});


function onEdit(e){
    var fieldName = e.container.find("input").attr("name");
    if(!e.model.isNew()){
        if(fieldName=="tecId"||fieldName=="tecNm"){
            this.closeCell();
        }
    }
}
</script>







