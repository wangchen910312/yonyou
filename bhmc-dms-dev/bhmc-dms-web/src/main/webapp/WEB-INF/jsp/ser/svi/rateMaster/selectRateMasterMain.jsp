<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>


<!-- 임률관리 마스터 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <%-- <h1 class="title_basic"><spring:message code="ser.title.rateMasterMng" /></h1><!-- 임률관리마스터 --> --%>
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form" role="search" data-btnid="btnSearch">
        <table>
            <caption></caption>
                <col style="width:10%;">
                <col style="width:24%;">
                <col style="width:10%;">
                <col style="width:23%;">
                <col style="width:10%;">
                <col>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.rateCd" /></th><!--임률코드  -->
                    <td>
                        <input id="sRteCd" type="text" value="" class="form_input">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.roTp" /></th><!--RO유형  -->
                    <td>
                        <input id="sRoTp" type="text"  class="form_comboBox">
                    </td>
                    <th scope="row"></th>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- 조회 조건 종료 -->

    <!-- 그리드 기능 버튼 시작 -->
    <div class="header_area">
        <div class="btn_right">
            <button class="btn_s btn_add btn_s_min5" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>
            <button class="btn_s btn_del btn_s_min5" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
            <button class="btn_s btn_cancel btn_s_min5" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
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

//RO유형 Array
var roTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${roTpList}">
roTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//RO유형 Map
var roTpMap = dms.data.arrayToMap(roTpList, function(obj){ return obj.cmmCd; });

//브랜드 Array
var brandCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${brandCdList}">
brandCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//브랜드 Map
var brandCdMap = dms.data.arrayToMap(brandCdList, function(obj){ return obj.cmmCd; });

 var useYnList = [{"cmmCd":"Y","cmmCdNm":"<spring:message code='ser.lbl.use' />"},{"cmmCd":"N","cmmCdNm":"<spring:message code='ser.lbl.notUse' />"}];
 var useYnMap = dms.data.arrayToMap(useYnList, function(obj){return obj.cmmCd});

//브랜드 구분
 brandCdGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         if(brandCdMap[val] != undefined)
             returnVal = brandCdMap[val].cmmCdNm;
     }
     return returnVal;
 };

 // RO유형
 roTpGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         if(roTpMap[val] != undefined)
             returnVal = roTpMap[val].cmmCdNm;
     }
     return returnVal;
 };

 useYnGrid = function(val){
     var returnVal = "";
     if(val != null && val != ""){
         if(useYnMap[val] != undefined)
             returnVal = useYnMap[val].cmmCdNm;
     }
     return returnVal;
 };

$(document).ready(function() {

    //조회조건 - RO유형
    $("#sRoTp").kendoExtDropDownList({
         dataSource:roTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.insert(0, {'roTp':'','brandCd':'','useYn':'Y'
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
                    url:"<c:url value='/ser/svi/rateMaster/multiRateMasters.do' />",
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
        gridId:"G-SER-1011-000132"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/svi/rateMaster/selectRateMasters.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sRteCd"] = $("#sRteCd").val();
                        params["sRoTp"] = $("#sRoTp").val();

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
                        ,dlrCd:{type:"string", validation:{required:true}}
                        ,rteCd:{type:"string", editable:false}
                        ,roTp:{type:"string", validation:{required:true}}
                        ,rteAmt:{type:"number", validation:{required:true}}
                        ,applyStartDt:{type:"date"}
                        ,applyEndDt:{type:"date"}
                        ,useYn:{type:"string"}
                        ,useCd:{type:"string"}
                        ,useNm:{type:"string"}
                        ,brandCd:{type:"string"}
                    }
                }
            }
        }
        ,multiSelectWithCheckbox:true
        ,filterable:false                 // 필터링 기능 사용안함
        ,edit:onEditRteCd
        ,columns:[
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"rteCd", title:"<spring:message code='ser.lbl.rateCd' />", width:100//임률코드
                ,attributes:{"class":"ac"}
            }
            ,{field:"roTp", title:"<spring:message code='ser.lbl.roTp' />", width:80, attributes:{"class":"ac"}
                ,template:"#=roTpGrid(roTp)#"
                ,editor:function(container, options) {
                    if(!options.model.isNew()){
                        container.context.innerText = roTpGrid(options.model.roTp)
                         return ;
                        }
                    $('<input required name="roTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:roTpList
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                    });
                    $('<span class="k-invalid-msg" data-for="roTp"></span>').appendTo(container);
                }
            }//RO유형
            ,{field:"rteAmt", title:"<spring:message code='ser.lbl.rateAmt' />", width:80, attributes:{"class":"ar"}}//임률금액
            ,{field:"brandCd", title:"<spring:message code='ser.lbl.brand' />", attributes:{"class":"ac"}, width:70
                ,template:"#=brandCdGrid(brandCd)#"
                ,editor:function(container, options) {
                    if(!options.model.isNew()){
                        container.context.innerText = brandCdGrid(options.model.brandCd)
                         return ;
                        }
                    $('<input required name="brandCd" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataSource:brandCdList
                        ,dataValueField:"cmmCd"
                        ,dataTextField:"cmmCdNm"
                    });
                    $('<span class="k-invalid-msg" data-for="brandCd"></span>').appendTo(container);
                }
            }//브랜드
            ,{field:"applyStartDt", title:"<spring:message code='ser.lbl.applyStartDt' />", width:100//적용시작일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                   $('<input id="applyStartDt" required name="applyStartDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                   .kendoExtMaskedDatePicker({
                      format:"<dms:configValue code='dateFormat' />"
                     ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                   });
                   $('<span class="k-invalid-msg" data-for="applyStartDt"></span>').appendTo(container);
               }
            }
            ,{field:"applyEndDt", title:"<spring:message code='ser.lbl.applyEndDt' />", width:100//적용종료일자
                ,attributes:{"class":"ac"}
                ,format:"{0:<dms:configValue code='dateFormat' />}"
                ,editor:function (container, options){
                   $('<input id="applyEndDt" required name="applyEndDt" data-bind="value:' + options.field + '"/>')
                   .appendTo(container)
                  .kendoExtMaskedDatePicker({
                      format:"<dms:configValue code='dateFormat' />"
                     ,dateValidMessage:"<spring:message code='ser.lbl.date' var='dateMsg' /><spring:message code='global.err.invalid' arguments='${dateMsg}' />"
                  });
                   $('<span class="k-invalid-msg" data-for="applyEndDt"></span>').appendTo(container);
               }
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
        ]

    });

});

function onEditRteCd(e){
    var fieldName = e.container.find("input").attr("name");
    if(!e.model.isNew()){
        if(fieldName=="rteCd"){
            this.closeCell();
        }
    }
}
</script>







