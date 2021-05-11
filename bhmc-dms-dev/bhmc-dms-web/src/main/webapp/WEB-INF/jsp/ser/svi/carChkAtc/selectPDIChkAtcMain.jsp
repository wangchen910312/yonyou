<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>

<!-- PDI점검마스터 -->
<section class="group">

    <!-- 조회 조건 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.pDiMng" /></h1><!-- PDI점검마스터 -->
        <div class="btn_right">
            <button class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
        </div>
    </div>
    <!-- 조회 조건 타이틀 종료 -->

    <!-- 조회 조건 시작 -->
    <div class="table_form ">
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:12%;">
                <col style="width:21%;">
                <col style="width:12%;">
                <col style="width:21%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.carChkTp" /></th><!--분류  -->
                    <td>
                        <input id="sCarTpCd" type="text" style="width:100%">
                        <input id="model" type="hidden" value="INSERT">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.carChkAtcCd" /></th><!--점검항목코드  -->
                    <td>
                        <input id="sCarChkAtcCd" type="text" value="" class="form_input" style="width:100%">
                    </td>

                    <th scope="row"><spring:message code="ser.lbl.carChkAtcNm" /></th><!--점검현지명  -->
                    <td>
                        <input id="sCarChkAtcLocalNm" type="text"  class="form_input" style="width:100%">
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
        <div id="grid"></div>
    </div>
    <!-- 그리드 종료 -->

<section class="group">

    <!-- 점검 상세 타이틀 시작 -->
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="ser.title.pDiInfo" /></h1><!-- PDI점검 상세내역 -->
        <div class="btn_right">
            <button class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button><!--저장  -->
            <button class="btn_m btn_reset" id="btnReset"><spring:message code="global.btn.init" /></button><!--초기화  -->
            <button class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /></button><!-- 삭제 -->
        </div>
    </div>
    <!-- 점검 상세 타이틀 종료 -->

    <div id="detailForm">
    <!-- 점검 상세 시작 -->
    <div class="table_form " >
        <table>
            <caption></caption>
            <colgroup>
                <col style="width:12%;">
                <col style="width:22%;">
                <col style="width:12%;">
                <col style="width:54%;">
            </colgroup>
            <tbody>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.carChkTp" /></th><!-- 분류 -->
                    <td>
                        <input id="carTpCd" name="carTpCd"   type="text" style="width:100%" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.carChkAtcNm" /></th><!--점검현지명  -->
                    <td >
                        <input id="carChkAtcLocalNm" name="carChkAtcLocalNm" type="text"  class="form_input"  style="width:70%" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.carChkAtcCd" /></th><!--점검항목코드  -->
                    <td>
                        <input id="carChkAtcCd" name="carChkAtcCd" type="text" class="form_input" style="width:100%" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.carChkAtcEnNm" /></th><!--점검영문명  -->
                    <td >
                        <input id="carChkAtcEnNm" name="carChkAtcEnNm" type="text"  class="form_input"  style="width:70%" data-json-obj="true">
                    </td>
                </tr>
                <tr>
                    <th scope="row"><spring:message code="ser.lbl.useYn" /></th><!-- 사용유무 -->
                    <td>
                        <input id="useYn" name="useYn" type="text"  style="width:100%" data-json-obj="true">
                    </td>
                    <th scope="row"><spring:message code="ser.lbl.remark" /></th><!--비고  -->
                    <td >
                        <input id="remark" name="remark" type="text"  class="form_input"  style="width:70%" data-json-obj="true">
                        <input id="dlrCd" name="dlrCd" type="hidden" data-json-obj="true">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    </div>
    <!-- 점검 상세 종료 -->

</section>

<script type="text/javascript">

//분류유형 Array
var carTpCdList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${carTpCdList}">
carTpCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//분류유형 Map
var carTpCdMap = dms.data.arrayToMap(carTpCdList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {

    //조회조건 - 분류
    $("#sCarTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carTpCdList
        ,index:2
    });

    $("#carTpCd").kendoExtDropDownList({
        dataTextField:"cmmCdNm"
        ,dataValueField:"cmmCd"
        ,dataSource:carTpCdList
        ,index:0
    });

    $("#useYn").kendoExtDropDownList({
        dataSource:["","Y","N"]
        ,index:0
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

           var json = $("#detailForm").serializeObject($("#detailForm").serializeArrayInSelector("[data-json-obj='true']"));
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
                   $("#grid").data("kendoExtGrid").dataSource.read();
                   if($("#model").val()=="INSERT"){
                       $("#btnReset").click();
                   }
               }
           });
       }
    });

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e){
            var json = $("form").serializeObject();
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
            });
        }
    });

    $("#btnReset").kendoButton({
        click:function(e){
            $("#carTpCd").data("kendoExtDropDownList").value("");
            $("#carChkAtcCd").val("");
            $("#carChkAtcLocalNm").val("");
            $("#carChkAtcEnNm").val("");
            $("#useYn").data("kendoExtDropDownList").value("");
            $("#remark").val("");
            $("#dlrCd").val("");
            $("#carTpCd").data("kendoExtDropDownList").enable(true);
            $("#carChkAtcCd").prop("readOnly", false).removeClass("form_readonly");
            $("#model").val("INSERT");
        }
    })

    //그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-SER-1011-000116"
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
        ,autoBind:false
        ,selectable:"row"
        ,filterable:false                 // 필터링 기능 사용안함
        ,change:function(e){
            var dataItem = this.dataItem(this.select());
            $("#carTpCd").data("kendoExtDropDownList").value(dataItem.carTpCd);
            $("#carChkAtcCd").val(dataItem.carChkAtcCd);
            $("#carChkAtcLocalNm").val(dataItem.carChkAtcLocalNm);
            $("#carChkAtcEnNm").val(dataItem.carChkAtcEnNm);
            $("#useYn").data("kendoExtDropDownList").value(dataItem.useYn);
            $("#remark").val(dataItem.remark);
            $("#dlrCd").val(dataItem.dlrCd);
            $("#model").val("UPDATE");
            $("#carChkAtcCd").prop("readOnly", true).addClass("form_readonly");


        }
        ,columns:[
            {field:"rnum", title:"<spring:message code='ser.lbl.no' />", width:40, sortable:false, attributes:{"class":"ac"}}
            ,{field:"carTpCd", title:"<spring:message code='ser.lbl.carChkTp' />", width:100//분류
                ,attributes:{"class":"ac"}
                ,template:"#=carTpCdMap[carTpCd].cmmCdNm#"
            }
            ,{field:"carChkAtcCd", title:"<spring:message code='ser.lbl.carChkAtcCd' />", width:100//점검항목코드
                ,attributes:{"class":"ac"}
            }
            ,{field:"carChkAtcLocalNm", title:"<spring:message code='ser.lbl.carChkAtcNm' />", width:80, attributes:{"class":"ac"}}//점검현지명
            ,{field:"carChkAtcEnNm", title:"<spring:message code='ser.lbl.carChkAtcEnNm' />", width:80, attributes:{"class":"ac"}}//점검영문명
            ,{field:"useYn", title:"<spring:message code='ser.lbl.useYn' />", width:100//사용유무
                ,attributes:{"class":"ac"}
            }
            ,{field:"remark", title:"<spring:message code='ser.lbl.remark' />", attributes:{"class":"ac"}, width:100}//비고
        ]

    });

});

</script>







