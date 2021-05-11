<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!--  //khskhs  문제시 삭제 -->
<%@ page import="org.springframework.mobile.device.Device" %>
<%@ page import="org.springframework.mobile.device.DeviceUtils" %>
<c:set var="isTablet" value="<%=DeviceUtils.getCurrentDevice(request).isTablet()|| DeviceUtils.getCurrentDevice(request).isMobile()%>" />
<!-- //khskhs  문제시 삭제 -->

<!-- 서비스설정화면 -->
<div id="resizableContainer">
    <div class="content">
        <section class="group">

            <!-- 그리드 기능 버튼 시작 -->
            <div class="header_area">
                <div class="btn_left">
                    <button class="btn_m btn_reset" id="btnCancel"><spring:message code="global.btn.init" /></button><!-- 초기화 -->
                </div>
                <div class="btn_right">
                    <dms:access viewId="VIEW-D-12096" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button><!-- 조회 -->
                    </dms:access>
                    <dms:access viewId="VIEW-D-12094" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_add" id="btnAdd"><spring:message code="global.btn.add" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12093" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_del" id="btnDel"><spring:message code="global.btn.del" /></button>
                    </dms:access>
                    <dms:access viewId="VIEW-D-12095" hasPermission="${dms:getPermissionMask('READ')}">
                        <button type="button" class="btn_m btn_s_min5" id="btnSave"><spring:message code="global.btn.confirm" /></button><!-- 저장 -->
                    </dms:access>
                </div>
            </div>
            <!-- 그리드 시작 -->
            <div class="table_grid">
                <div id="etcIssueGrid" class="resizable_grid"></div>
            </div>
            <!-- 그리드 종료 -->
        </section>
    </div>
</div>
<script type="text/javascript">

var isTablet="${isTablet}";
var selectable="";

if(isTablet=="true"){
    selectable = "row"
}else{
    selectable = "multiple"
}

var etcIssueRegPopupWindow;


$(document).ready(function() {

    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $("#etcIssueGrid").data("kendoExtGrid").dataSource.read();
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {

            var grid = $("#etcIssueGrid").data("kendoExtGrid");
            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");

                $.ajax({
                    url:"<c:url value='/ser/svi/etcIssue/multiEtcIssueMangages.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        //정상적으로 반영 되었습니다.
                        $("#etcIssueGrid").data("kendoExtGrid").dataSource.read();
                        dms.notification.success("<spring:message code='global.info.success'/>");
                    }
                    ,beforeSend:function(xhr){
                        dms.loading.show($("#resizableContainer"));
                    }
                    ,complete:function(xhr,status){
                        dms.loading.hide($("#resizableContainer"));
                    }
                });
            //}
        }
    });

    //취소
    $("#btnReset").kendoButton({
        click:function(e) {
            $("#saveForm").get(0).reset();
        }
    });

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            etcIssuePopup();
        }
    });

    etcIssuePopup = function(){
        etcIssueRegPopupWindow = dms.window.popup({
            windowId:"etcIssueRegPopupWindow"
           ,width:750
           ,height:350
           ,modal:false
           ,title:"<spring:message code='ser.menu.etcIssueMng' />"   // 기타사항관리
           ,content:{
               url:"<c:url value='/ser/cmm/popup/selectetcIssueRegPopup.do'/>"
               ,data:{
                    "autoBind"    :true
                   ,"callbackFunc":function(data){
                       var gridData = $("#etcIssueGrid").data("kendoExtGrid").dataSource;
                       gridData.insert(0,{
                            "etcCdNm":data.etcCdNm
                           ,"etcAmt":data.etcAmt
                       });
                       etcIssueRegPopupWindow.close();
                   }
               }
           }
       });
    };

    //버튼 - 삭제
    $("#btnDel").kendoButton({
        click:function(e) {
            var grid = $("#etcIssueGrid").data("kendoExtGrid");
            var rows = grid.select();

            rows.each(function(index, row) {
                grid.removeRow(row);
            });
            $("#checkAll").prop("checked", false);
        }
    });

    //취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $("#etcIssueGrid").data("kendoExtGrid").cancelChanges();
            $("#checkAll").prop("checked", false);
        }
    });

    //그리드 설정
    $("#etcIssueGrid").kendoExtGrid({
        dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/ser/svi/etcIssue/selectEtcIssueManages.do' />"
                }
                ,parameterMap:function(options , operation){
                    if(operation == "read"){

                        var params = {};

                        params["recordCountPerPage"] = options.pageSize;
                        params["pageIndex"]          = options.page;
                        params["firstIndex"]         = options.skip;
                        params["lastIndex"]          = options.skip + options.take;
                        params["sort"]               = options.sort;

                        params["sDlrCd"]             = $("#sDlrCd").val();

                        return kendo.stringify(params);

                    }else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
           ,schema:{
               model:{
                   id:"rnum"
                  ,fields:{
                      dlrCd  :{type:"string"}
                     ,etcCd  :{type:"string", editable:false}
                     ,etcCdNm:{type:"string", validation:{required:true}}
                     ,prorVal:{type:"int", validation:{required:true}}
                     ,etcAmt :{type:"number", validation:{required:true}}
                   }
               }
           }
        }
       ,selectable:selectable
       ,multiSelectWithCheckbox:true
       ,navigatable:true
       ,reorderable:false
       ,filterable:false                 // 필터링 기능 사용안함
       ,columns:[
            {field:"etcCd", title:"<spring:message code='ser.lbl.etcCd' />", width:60, sortable:false, attributes:{"class":"ac"}}
           ,{field:"etcCdNm", title:"<spring:message code='ser.lbl.etcCdNm' />", width:120, sortable:false, attributes:{"class":"ac"}}
           ,{field:"prorVal", title:"<spring:message code='ser.lbl.prefRank' />", width:100, sortable:false, attributes:{"class":"ac"}
               ,format:"{0:n0}"
               ,decimal:0
               ,hidden:true
           }
           ,{field:"etcAmt", title:"<spring:message code='ser.lbl.etcAmt' />", width:100, sortable:false, attributes:{"class":"ar"}
               ,format:"{0:n2}"
               ,decimal:0
               ,spinners:false
           }
        ]
    });
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제
    if(${isTablet}){
        if(window.matchMedia('(max-width:1024px)').matches){
            $(".table_grid").attr("style","width:958px !important; max-width:958px !important");
        }
    }
 // tablet 사이즈 맞추는거 khskhs 문제시 삭제

});

</script>

