<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- PDI점검마스터 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">

            <!-- 조회 조건 타이틀 시작 -->
            <div class="header_area">
                <div class="btn_left">
                    <button type="button" class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
                </div>
                <div class="btn_right">
                    <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                    <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!--저장  -->
                    <button type="button" class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /></button><!-- 삭제 -->
                </div>
            </div>
            <!-- 조회 조건 타이틀 종료 -->

            <!-- 조회 조건 시작 -->
            <div class="table_form ">
                <table>
                    <caption></caption>
                    <colgroup>
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:10%;">
                        <col style="width:17%;">
                        <col style="width:10%;">
                        <col style="width:15%;">
                        <col style="width:10%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.pdiChkFlag"/></th><!--점검구분  -->
                            <td>
                                <input id="sCarChkCd" type="text" class="form_comboBox" />
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carChkTp" /></th><!--분류  -->
                            <td>
                                <input id="sCarTpCd" type="text" class="form_comboBox" />
                                <input id="model" type="hidden" value="INSERT">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carChkAtcCd" /></th><!--점검항목코드  -->
                            <td>
                                <input id="sCarChkAtcCd" type="text" value="" class="form_input" maxlength="30" />
                            </td>

                            <th scope="row"><spring:message code="ser.lbl.carChkAtcNm" /></th><!--점검현지명  -->
                            <td>
                                <input id="sCarChkAtcLocalNm" type="text" class="form_input" />
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- 조회 조건 종료 -->
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
        </div>
        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>
        <!-- 그리드 종료 -->

        <section class="group">

            <!-- 점검 상세 타이틀 시작 -->
            <div class="header_area">
                <%-- <h2 class="title_basic"><spring:message code="global.title.pDiInfo" /></h2><!-- PDI점검 상세내역 --> --%>
            </div>
            <!-- 점검 상세 타이틀 종료 -->

            <div id="detailForm">
            <!-- 점검 상세 시작 -->
            <div class="table_form" >
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
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.pdiChkFlag"/></th><!-- 점검구분 -->
                            <td class="required_area" >
                                <input id="carChkCd" name="carChkCd" type="text" data-json-obj="true" class="form_comboBox"/>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.carChkTp" /></th><!-- 분류 -->
                            <td class="required_area" >
                                <input id="carTpCd" name="carTpCd" type="text" data-json-obj="true" class="form_comboBox"/>
                            </td>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.carChkAtcNm" /></th><!--점검현지명  -->
                            <td class="required_area">
                                <input id="carChkAtcLocalNm" name="carChkAtcLocalNm" type="text" class="form_input" data-json-obj="true"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span class="bu_required"><spring:message code="ser.lbl.carChkAtcCd" /></th><!--점검항목코드  -->
                            <td class="required_area">
                                <input id="carChkAtcCd" name="carChkAtcCd" type="text" class="form_input" data-json-obj="true" maxlength="30"/>
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.carChkAtcEnNm" /></th><!--점검영문명  -->
                            <td >
                                <input id="carChkAtcEnNm" name="carChkAtcEnNm" type="text" class="form_input" data-json-obj="true">
                            </td>
                            <th scope="row"><spring:message code="ser.lbl.useYn" /></th><!-- 사용유무 -->
                            <td>
                                <input id="useYn" name="useYn" type="text" data-json-obj="true" class="form_comboBox"/>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><spring:message code="ser.lbl.remark" /></th><!--비고  -->
                            <td rowspan="2">
                                <input id="remark" name="remark" type="text" class="form_input" data-json-obj="true"/>
                                <input id="dlrCd" name="dlrCd" type="hidden" data-json-obj="true"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
            <!-- 점검 상세 종료 -->

        </section>
    </div>
</div>
<script type="text/javascript">

//분류유형 Array
var carTpCdList = [];
<c:forEach var="obj" items="${carTpCdList}">
carTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//분류유형 Map
var carTpCdMap = dms.data.arrayToMap(carTpCdList, function(obj){ return obj.cmmCd; });

//사용여부 Array
var useYnList = [];
<c:forEach var="obj" items="${useYnList}">
useYnList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//점검구분 Map
var useYnMap = dms.data.arrayToMap(useYnList, function(obj){ return obj.cmmCd; });

var carChkCdList = [];
<c:forEach var="obj" items="${carChkCdList}">
carChkCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//점검구분 Map
var carChkCdMap = dms.data.arrayToMap(carChkCdList, function(obj){ return obj.cmmCd; });

//분류 구분
carTpCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(carTpCdMap[val] != undefined)
            returnVal = carTpCdMap[val].cmmCdNm;
    }
    return returnVal;
};

// 사용여부
useYnGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(useYnMap[val] != undefined)
            returnVal = useYnMap[val].cmmCdNm;
    }
    return returnVal;
};

// 점검구분
carChkCdGrid = function(val){
    var returnVal = "";
    if(val != null && val != ""){
        if(carChkCdMap[val] != undefined)
            returnVal = carChkCdMap[val].cmmCdNm;
    }
    return returnVal;
};

//그리드 선택 Row
var gridSelectedRow = 0;
var selectedYn = false;
$(document).ready(function() {

    //조회조건 - 점검구분
    $("#sCarChkCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carChkCdList
        ,optionLabel:" "
        ,index:1
    });

    //조회조건 - 분류
    $("#sCarTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carTpCdList
        ,optionLabel:" "

    });

    //조회조건 - 점검구분
    $("#carChkCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carChkCdList
        ,optionLabel:" "
    });

    $("#carTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carTpCdList
        ,optionLabel:" "
    });

    $("#useYn").kendoExtDropDownList({
         dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:useYnList
        ,index:1
    });

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });


    //버튼 - 저장
    $("#btnSave").kendoButton({
       click:function(e){
           if($("#carTpCd").val() == "" || $("#carTpCd").val() == null){
                dms.notification.info("<spring:message code='ser.lbl.carChkTp' var='carChkTp' /><spring:message code='global.info.required.field' arguments='${carChkTp},' />");
                return;
            }
           if($("#carChkAtcLocalNm").val() == "" || $("#carChkAtcLocalNm").val() == null){
                dms.notification.info("<spring:message code='ser.lbl.carChkAtcNm' var='carChkAtcNm' /><spring:message code='global.info.required.field' arguments='${carChkAtcNm},' />");
                return;
            }
           if($("#carChkAtcCd").val() == "" || $("#carChkAtcCd").val() == null){
                dms.notification.info("<spring:message code='ser.lbl.carChkAtcCd' var='carChkAtcCd' /><spring:message code='global.info.required.field' arguments='${carChkAtcCd},' />");
                return;
            }

           var json = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));
           json.carTpCd = $("#carTpCd").data("kendoExtDropDownList").value();
           json.carChkCd = $("#carChkCd").data("kendoExtDropDownList").value();


           var url = "";
           if($("#model").val()=="INSERT"){
               url = "<c:url value='/ser/svi/pDIChkAtc/insertPDIChkAtc.do' />";
           }else{
               url = "<c:url value='/ser/svi/pDIChkAtc/updatePDIChkAtc.do' />";
           }
           $.ajax({
               url:url
               ,dataType:"json"
               ,type:"POST"
               ,contentType:"application/json"
               ,data:JSON.stringify(json)
               ,error:function(jqXHR,status,error) {
                   dms.notification.error(jqXHR.responseJSON.errors);
               }
               ,success:function(data) {
                   dms.notification.success("<spring:message code='global.info.success'/>");
                   selectedYn = true;
                   gridSelectedRow = $("#grid").data("kendoExtGrid").select().index();

                   $("#grid").data("kendoExtGrid").dataSource.read();
                   if($("#model").val()=="INSERT"){
                       $("#btnReset").click();
                   }
               }
               ,beforeSend:function(xhr){
                   dms.loading.show($("#resizableContainer"));
               }
               ,complete:function(xhr,status){
                   dms.loading.hide($("#resizableContainer"));
               }
           });
       }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e){
            var json = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));
            json.carTpCd = $("#carTpCd").data("kendoExtDropDownList").value()
            $.ajax({
                url:"<c:url value='/ser/svi/pDIChkAtc/deletePDIChkAtc.do' />"
                ,dataType:"json"
                ,type:"POST"
                ,contentType:"application/json"
                ,data:JSON.stringify(json)
                ,error:function(jqXHR,status,error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data) {
                    dms.notification.success("<spring:message code='global.info.success'/>");
                    $("#grid").data("kendoExtGrid").dataSource.read();
                    $("#btnReset").click();
                }
                ,beforeSend:function(xhr){
                    dms.loading.show($("#resizableContainer"));
                }
                ,complete:function(xhr,status){
                    dms.loading.hide($("#resizableContainer"));
                }
            });
        }
    });

    $("#btnReset").kendoButton({
        click:function(e){
            $("#carTpCd").data("kendoExtDropDownList").value("");
            $("#carChkAtcCd").val("");
            $("#carChkAtcLocalNm").val("");
            $("#carChkAtcEnNm").val("");
            $("#remark").val("");
            $("#dlrCd").val("");
            $("#carChkCd").data("kendoExtDropDownList").enable(true);
            $("#carTpCd").data("kendoExtDropDownList").enable(true);
            $("#carChkAtcCd").prop("readOnly", false).removeClass("form_readonly");
            $("#model").val("INSERT");
        }
    })

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000129"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/ser/svi/pDIChkAtc/selectPDIChkAtcs.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"] = options.page;
                        params["firstIndex"] = options.skip;
                        params["lastIndex"] = options.skip + options.take;
                        params["sort"] = options.sort;

                        params["sCarChkCd"] = $("#sCarChkCd").val();
                        params["sCarTpCd"] = $("#sCarTpCd").val();
                        params["sCarChkAtcCd"] = $("#sCarChkAtcCd").val();
                        params["sCarChkAtcLocalNm"] = $("#sCarChkAtcLocalNm").val();

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
                        ,carTpCd:{type:"string"}
                        ,carChkAtcCd:{type:"string"}
                        ,carChkAtcTpNm:{type:"string"}
                        ,carChkAtcLocalNm:{type:"string"}
                        ,carChkAtcEnNm:{type:"string"}
                        ,remark:{type:"string"}
                        ,useYn:{type:"string"}
                    }
                }
            }
        }
        ,editable:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,dataBound:function(e) {
           if(selectedYn ){
              e.sender.select(e.sender.tbody.find("tr")[gridSelectedRow]);
           }
        }
        ,change:function(e){
            var dataItem = this.dataItem(this.select());

            $("#carChkCd").data("kendoExtDropDownList").value(dataItem.carChkCd);
            $("#carTpCd").data("kendoExtDropDownList").value(dataItem.carTpCd);
            $("#carChkAtcCd").val(dataItem.carChkAtcCd);
            $("#carChkAtcLocalNm").val(dataItem.carChkAtcLocalNm);
            $("#carChkAtcEnNm").val(dataItem.carChkAtcEnNm);
            $("#useYn").data("kendoExtDropDownList").value(dataItem.useYn);
            $("#remark").val(dataItem.remark);
            $("#dlrCd").val(dataItem.dlrCd);
            $("#model").val("UPDATE");
            $("#carChkAtcCd").prop("readOnly", true).addClass("form_readonly");
            $("#carChkCd").data("kendoExtDropDownList").enable(false);
            $("#carTpCd").data("kendoExtDropDownList").enable(false);


        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"carChkCd", title:"<spring:message code="ser.lbl.pdiChkFlag"/>", width:100//분류
                ,attributes:{"class":"ac"}
                ,template:"#=carChkCdGrid(carChkCd)#"
            }
            ,{field:"carTpCd", title:"<spring:message code='ser.lbl.carChkTp' />", width:100//분류
                ,attributes:{"class":"ac"}
                ,template:"#=carTpCdGrid(carTpCd)#"
            }
            ,{field:"carChkAtcCd", title:"<spring:message code='ser.lbl.carChkAtcCd' />", width:100//점검항목코드
                ,attributes:{"class":"ac"}
            }
            ,{field:"carChkAtcLocalNm", title:"<spring:message code='ser.lbl.carChkAtcNm' />", width:80, attributes:{"class":"ac"}}//점검현지명
            ,{field:"carChkAtcEnNm", title:"<spring:message code='ser.lbl.carChkAtcEnNm' />", width:80, attributes:{"class":"ac"}}//점검영문명
            ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:100//사용유무
                ,attributes:{"class":"ac"}
                ,template:"#=useYnGrid(useYn)#"
            }
            ,{field:"remark", title:"<spring:message code='ser.lbl.remark' />", attributes:{"class":"ac"}, width:100}//비고
        ]

    });

});

</script>







