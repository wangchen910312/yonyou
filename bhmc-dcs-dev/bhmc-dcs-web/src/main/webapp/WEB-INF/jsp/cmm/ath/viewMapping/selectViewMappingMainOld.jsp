<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.viewMapping" /></h1>
        <div class="btn_right">
            <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
        </div>
    </div>

    <!-- 탭영역 -->
    <div style="margin-top:-10px;position:relative;float:left;width:550px;">
        <div style="position:absolute;top:10px;right:0;z-index:10000;">
            <input id="sWebMobileDstinCd" type="text" class="form_comboBox" style="width:80px;">
        </div>

        <!-- 시스템구분 탭 -->
        <div id="tabstrip" class="tab_area">
            <ul>
                <li id="deptViewMappingTab" class="k-state-active">DCS</li>
                <li id="taskViewMappingTab">DMS</li>
            </ul>

            <!-- 법인탭[부서] -->
            <div class="mt0">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_s btn_search" id="btnDeptSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </div>
                </div>

                <!-- 부서 조회조건 -->
                <div class="table_form" role="search" data-btnid="btnDeptSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:18%;">
                            <col style="width:32%;">
                            <col style="width:18%;">
                            <col style="width:32%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.deptCd' /><!-- 부서코드 --></th>
                                <td>
                                    <input type="text" id="sDeptCd" name="sDeptCd" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.deptNm' /><!-- 부서명 --></th>
                                <td>
                                    <input type="text" id="sDeptNm" name="sDeptNm" class="form_input" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 부서 그리드 -->
                <div class="table_grid mt10">
                    <div id="deptGrid" class="resizable-container-custom" data-offset-height="-11"></div>
                </div>
            </div>

            <!-- 딜러탭[직무] -->
            <div class="mt0">
                <div class="header_area">
                    <div class="btn_right">
                        <button type="button" class="btn_s btn_search" id="btnTaskSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
                    </div>
                </div>

                <!-- 직무 조회조건 -->
                <div class="table_form" role="search" data-btnid="btnTaskSearch">
                    <table>
                        <caption></caption>
                        <colgroup>
                            <col style="width:18%;">
                            <col style="width:32%;">
                            <col style="width:18%;">
                            <col style="width:32%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.tskCd' /><!-- 직무코드 --></th>
                                <td>
                                    <input type="text" id="sTskCd" name="sTskCd" class="form_input" />
                                </td>
                                <th scope="row"><spring:message code='global.lbl.tskNm' /><!-- 직무명 --></th>
                                <td>
                                    <input type="text" id="sTskNm" name="sTskNm" class="form_input" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- 직무 그리드 -->
                <div class="table_grid mt10">
                    <div id="taskGrid" class="resizable-container-custom" data-offset-height="-157"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- 트리영역 -->
    <div id="viewHierarchyTreeContainer" class="resizable-container-custom" style="border:1px solid #bfcad6;overflow:auto;min-height:500px;margin-left:560px;">
        <div id="viewHierarchyTree" class="treeview" style="margin-top:10px;margin-left:10px;"></div>
    </div>
</section>

<script type="text/javascript">
//시스템코드-DCS(I), DMS(D)
var sysCd = "I";
//웹-모바일 구분-웹(W), 모바일(M)
var webMobileDstinCd = "${webMobileDstinCd}"
//참조유형-부서(D), 직무(T)
var refTp = "D";
//참조ID-부서코드, 직무코드
var refId = "";

//웹-모바일구분
var webMobileDstinCdList = [];
<c:forEach var="obj" items="${webMobileDstinCdList}">
webMobileDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>

//화면-부서/직무 매핑 정보를 메뉴트리에 반영한다.
function applyTreeViewMapping(options){
    //화면-부서/직무 매핑 적용
    //1.메뉴트리 기존선택 목록 취소
    //2.화면-부서/직무 매핑을 메뉴트리에 적용한다.

    var viewHierarchyTree = $("#viewHierarchyTree").data("kendoTreeView");

    //1.메뉴트리 기존선택 목록 취소
    viewHierarchyTree.element.find(".tree-checkbox").prop("checked", false);
    viewHierarchyTree.updateIndeterminate();

    //2.직무-화면 매핑을 메뉴트리에 적용한다.
    $.ajax({
        url:"<c:url value='/cmm/ath/viewInfo/selectViewsByUser.do' />"
        ,data:JSON.stringify({
            "sSysCd":options.sysCd                          //시스템구분
            ,"sWebMobileDstinCd":options.webMobileDstinCd   //웹-모바일구분
            ,"sRefTp":options.refTp                         //참조유형
            ,"sRefId":options.refId                         //참조ID
        })
        ,type:'POST'
        ,dataType:'json'
        ,contentType:'application/json'
        ,beforeSend:function(){
            dms.loading.show();
        }
        ,complete:function(jqXHR, textStatus){
            dms.loading.hide();
        }
        ,error:function(jqXHR, status, error) {
            dms.notification.error(jqXHR.responseJSON.errors);
        }
        ,success:function(data, textStatus, jqXHR) {
            //체크박스 체크
            for(i=0; i<data.length; i++){
                var checkbox = viewHierarchyTree.element.find("input[id='"+data[i].viewId+"']");
                if(checkbox && checkbox.length == 1){
                    checkbox.prop("checked", true);
                }
            }
            viewHierarchyTree.updateIndeterminate();
        }
    });
}

$(document).ready(function() {
    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            if(dms.string.isEmpty(refId)){
                if(refTp == "D"){
                    dms.notification.info("<spring:message code='global.lbl.dept' var='args' /><spring:message code='global.info.validation.select' arguments='${args}' />");
                }else{
                    dms.notification.info("<spring:message code='global.lbl.task' var='args' /><spring:message code='global.info.validation.select' arguments='${args}' />");
                }
                return;
            }

            //화면-직무/부서 매핑 정보를 저장한다.
            var viewAuthorities = [];
            var viewHierarchyTree = $("#viewHierarchyTree").data("kendoTreeView");
            var checkedViews = $("input.tree-checkbox:checked", viewHierarchyTree.element);

            //화면 트리에서 체크박스가 선택된 목록중 spriteCssClass 데이터가  item, btn인 목록만을 추가한다.
            //spriteCssClass 폴더(folder), item(화면), btn(버튼)
            $.each(checkedViews, function(idx, obj){
                var spriteCssClass = $(this).data("spriteCssClass");
                if(spriteCssClass == "item"){
                    viewAuthorities.push({
                        "viewId":$(this).data("viewId")
                        ,"permissions":"SEARCHIND"
                    });
                }else if(spriteCssClass == "btn"){
                    viewAuthorities.push({
                        "viewId":$(this).data("viewId")
                        ,"permissions":"READ"
                    });
                }
            });

            $.ajax({
                url:"<c:url value='/cmm/ath/viewInfo/deleteAndInsertViewMappings.do' />"
                ,data:JSON.stringify({
                    "sysCd":sysCd
                    ,"webMobileDstinCd":webMobileDstinCd
                    ,"refTp":refTp
                    ,"refId":refId
                    ,"viewAuthorities":viewAuthorities
                })
                ,type:'POST'
                ,dataType:'json'
                ,contentType:'application/json'
                ,beforeSend:function(jqXHR, settings){
                    dms.loading.show();
                }
                ,complete:function(jqXHR, textStatus){
                    dms.loading.hide();
                }
                ,error:function(jqXHR, status, error) {
                    dms.notification.error(jqXHR.responseJSON.errors);
                }
                ,success:function(data, textStatus, jqXHR) {
                    //정상적으로 반영 되었습니다.
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
    });

    //버튼 - 부서조회
    $("#btnDeptSearch").kendoButton({
        click:function(e) {
            $('#deptGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    //버튼 - 직무조회
    $("#btnTaskSearch").kendoButton({
        click:function(e) {
            $('#taskGrid').data('kendoExtGrid').dataSource.read();
        }
    });

    //조회조건 - 웹/모바일구분
    $("#sWebMobileDstinCd").kendoExtDropDownList({
        dataSource:webMobileDstinCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,value:webMobileDstinCd
        ,change:function(e){
            //메뉴트리 재적용
            $("#viewHierarchyTree").data("kendoTreeView").dataSource.read();
            //부서그리드 선택 초기화
            $("#deptGrid").data('kendoExtGrid').clearSelection();
            //직무그리드 선택 초기화
            $("#taskGrid").data('kendoExtGrid').clearSelection();
        }
    });

    $("#tabstrip").kendoExtTabStrip({
        animation:false
        ,select:function(e) {
            var kendoTab = $("#tabstrip").kendoExtTabStrip().data("kendoExtTabStrip");

            if(e.item.id == "deptViewMappingTab"){
                kendoTab.select(0);
                refTp = "D";    //참조유형-부서
                sysCd = "I";    //시스템구분-법인
            }else{
                kendoTab.select(1);
                refTp = "T";    //참조유형-직무
                sysCd = "D";    //시스템구분-딜러
            }

            //메뉴트리 재적용
            $("#viewHierarchyTree").data("kendoTreeView").dataSource.read();
            //부서그리드 선택 초기화
            $("#deptGrid").data('kendoExtGrid').clearSelection();
            //직무그리드 선택 초기화
            $("#taskGrid").data('kendoExtGrid').clearSelection();
        }
    });

    //부서그리드
    $("#deptGrid").kendoExtGrid({
        gridId:"G-CMM-0303-115201"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ath/viewMapping/selectDepartmentList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sort"] = options.sort;
                        params["sCmpTp"] = "${cmpTpCorp}";
                        params["sDeptCd"] = $("#sDeptCd").val();
                        params["sDeptNm"] = $("#sDeptNm").val();
                        params["sUseYn"] = "Y";

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"deptCd"
                    ,fields:{
                         deptCd:{type:"string"}         //부서코드
                        ,deptNm:{type:"string"}         //부서명
                    }
                }
            }
        }
        ,editable:false
        ,pageable:false
        ,selectable:"single"
        ,sortable:false
        ,change:function(e){
            //부서 선택 체크
            if(this.select().length == 0){
                refId = "";
                return;
            }

            //참조유형-부서
            refTp = "D";
            //참조ID-부서코드
            refId = this.dataItem(this.select()).tskCd ;

            applyTreeViewMapping({
                "sysCd":sysCd                                                                   //시스템구분
                ,"webMobileDstinCd":$("#sWebMobileDstinCd").data("kendoExtDropDownList").value()   //웹-모바일구분
                ,"refTp":refTp                                                                  //참조유형-부서
                ,"refId":refId                                                                  //참조ID-부서코드
            });
        }
        ,columns:[
             {field:"deptCd", title:"<spring:message code='global.lbl.deptCd' />", width:100}
            ,{field:"deptNm", title:"<spring:message code='global.lbl.deptNm' />"}
        ]
    });

    //직무그리드
    $("#taskGrid").kendoExtGrid({
        gridId:"G-CMM-0303-115202"
        ,dataSource:{
             transport:{
                read:{
                    url:"<c:url value='/cmm/ath/viewMapping/selectTaskList.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sort"] = options.sort;
                        params["sCmpTp"] = "${cmpTpDlr}";
                        params["sTskCd"] = $("#sTskCd").val();
                        params["sTskNm"] = $("#sTskNm").val();

                        return kendo.stringify(params);
                    } else if (operation !== "read" && options.models) {
                        return kendo.stringify(options.models);
                    }
                }
            }
            ,schema:{
                model:{
                    id:"tskCd"
                    ,fields:{
                         tskCd:{type:"string"}         //직무코드
                        ,tskNm:{type:"string"}         //직무명
                    }
                }
            }
        }
        ,editable:false
        ,pageable:false
        ,selectable:"single"
        ,sortable:false
        ,change:function(e){
            //직무 선택 체크
            if(this.select().length == 0){
                refId = "";
                return;
            }

            //참조유형-직무
            refTp = "T";
            //참조ID-직무코드
            refId = this.dataItem(this.select()).tskCd ;

            applyTreeViewMapping({
                "sysCd":sysCd                                                                   //시스템구분
                ,"webMobileDstinCd":$("#sWebMobileDstinCd").data("kendoExtDropDownList").value()   //웹-모바일구분
                ,"refTp":refTp                                                                  //참조유형-직무
                ,"refId":refId                                                                  //참조ID-직무코드
            });
        }
        ,columns:[
             {field:"tskCd", title:"<spring:message code='global.lbl.tskCd' />", width:100}
            ,{field:"tskNm", title:"<spring:message code='global.lbl.tskNm' />"}
        ]
    });

    //메뉴트리
    $("#viewHierarchyTree").kendoTreeView({
        dataSource:{
            requestStart:function(e){
                dms.loading.show();
            }
            ,requestEnd:function(e){
                dms.loading.hide();
            }
            ,transport:{
                 read:{
                    url:"<c:url value='/cmm/ath/viewInfo/selectViewInfoTree.do' />"
                    ,dataType:"json"
                    ,type:"POST"
                    ,contentType:"application/json"
                 }
                ,parameterMap:function(options, operation) {
                    var params = {};
                    params["sSysCd"] = sysCd;
                    params["sWebMobileDstinCd"] = $("#sWebMobileDstinCd").data("kendoExtDropDownList").value();
                    params["sDisplayYn"] = "Y";

                    return kendo.stringify(params);
                }
             }
             ,schema:{
                 model:{
                     id:"id"
                     ,children:"subNodes"
                     ,data:"data"
                 }
             }
        }
        ,checkboxes: {
            checkChildren:true
            ,template: "<input type='checkbox' class='tree-checkbox' id='#=item.data.childViewId#' data-view-id='#=item.data.childViewId#' data-sprite-css-class='#=item.spriteCssClass#' />"
        }
        ,dataTextField:"data.childViewNm"
        ,dataValueField:"data.childViewId"
        ,loadOnDemand:false
        ,dataBound:function(e){
            $("#viewHierarchyTree").data("kendoTreeView").updateIndeterminate();
        }
    });

    //높이 자동맞춤 적용
    var resizableElements = $(".resizable-container-custom");
    var windowHeight = $(window).innerHeight();

    $.each(resizableElements, function(idx, element){
        var resizableElement = $(element);
        var resizableElementOffset = resizableElement.offset();
        var offsetHeight = (resizableElement.data("offsetHeight")||0) - 12;

        //그리드인 경우
        if($("div.k-grid-header", element).length != 0){
            var gridOffsetHeight = 0;
            gridOffsetHeight = gridOffsetHeight + $("div.k-grid-header", element).height();
            gridOffsetHeight = gridOffsetHeight + ($("div.k-grid-pager", element).length == 0? 0:$("div.k-grid-pager", element).height());

            resizableElement.height(windowHeight - resizableElementOffset.top + offsetHeight);
            $("div.k-grid-content", resizableElement).height(windowHeight - resizableElementOffset.top - gridOffsetHeight - 12 + offsetHeight);
        }else{
            resizableElement.height(windowHeight - resizableElementOffset.top + offsetHeight);
        }
    });
});
</script>
