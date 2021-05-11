<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<!-- 화면정보 관리 -->
<section class="group">
    <div class="header_area">
        <h1 class="title_basic"><spring:message code="cmm.title.viewInfoMng" /><!-- 화면정보관리 --></h1>
        <div class="btn_right">
            <!-- 조회 버튼 -->
            <dms:access viewId="VIEW-I-12223" hasPermission="${dms:getPermissionMask('READ')}">
            	<button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /><!-- 조회 --></button>
            </dms:access>
        </div>
    </div>
    <div class="clfix">
        <div class="content_left">
            <section class="group">
                <div id="viewHierarchyTreeContainer" class="table_grid viewInfo_height">
                    <div id="viewHierarchyTree" class="treeview"></div>
                </div>
            </section>
        </div>

        <div class="content_right">
           <section class="group">
                <div id="resizableContainer" data-offsetheight="-43">
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
                            <col>
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row"><spring:message code="global.lbl.systemGubun" /><!-- 시스템구분 --></th>
                                <td>
                                    <input id="sSysCd" type="text" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code="cmm.lbl.webMobTp" /><!-- 웹/모바일구분 --></th>
                                <td>
                                    <input id="sWebMobileDstinCd" type="text" class="form_comboBox">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.displayYn' /><!-- 출력여부 --></th>
                                <td>
                                    <input id="sDisplayYn" type="text" value="" class="form_comboBox">
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <th scope="row"><spring:message code='global.lbl.viewId' /><!-- 화면ID --></th>
                                <td>
                                    <input id="sViewId" type="text" value="" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.viewNm' /><!-- 화면명 --></th>
                                <td>
                                    <input id="sViewNm" type="text" value="" class="form_input">
                                </td>
                                <th scope="row"><spring:message code='global.lbl.viewTp' /><!-- 화면유형 --></th>
                                <td>
                                    <input id="sViewTp" type="text" value="" class="form_comboBox">
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 조회 조건 종료 -->

                <!-- 그리드 기능 버튼 시작 -->
                <div class="header_area">
                    <div class="btn_right">
                    	<dms:access viewId="VIEW-I-12222" hasPermission="${dms:getPermissionMask('READ')}">
			            	<button type="button" class="btn_s" id="btnSave"><spring:message code="global.btn.save" /><!-- 저장 --></button>
			            </dms:access>
                        <dms:access viewId="VIEW-I-12220" hasPermission="${dms:getPermissionMask('READ')}">
                        	<button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /><!-- 행추가 --></button>
                        </dms:access>
                        <dms:access viewId="VIEW-I-12219" hasPermission="${dms:getPermissionMask('READ')}">
                        	<button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /><!-- 행삭제 --></button>
                        </dms:access>
			            <dms:access viewId="VIEW-I-12221" hasPermission="${dms:getPermissionMask('READ')}">
			            	<button type="button" class="btn_s" id="btnCancel"><spring:message code="global.btn.cancel" /><!-- 취소 --></button>
			            </dms:access>
                    </div>
                </div>
                <!-- 그리드 기능 버튼 종료 -->

                <!-- 그리드 시작 -->
                <div class="table_grid">
                    <div id="grid" class="resizable_grid"></div>
                </div>
                <!-- 그리드 종료 -->
                </div>
            </section>
        </div>
    </div>
</section>

<!-- script -->
<script type="text/javascript">
//메뉴트리 선택 화면ID
var selectedParentViewId = "";

//시스템구분  목록
var sysCdList = [];
<c:forEach var="obj" items="${sysCdList}">
sysCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//시스템구분 맵
var sysCdMap = dms.data.arrayToMap(sysCdList, function(obj){ return obj.cmmCd; });

//웹/모바일구분  목록
var webMobileDstinCdList = [];
<c:forEach var="obj" items="${webMobileDstinCdList}">
webMobileDstinCdList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
</c:forEach>
//웹/모바일구분 맵
var webMobileDstinCdMap = dms.data.arrayToMap(webMobileDstinCdList, function(obj){ return obj.cmmCd; });

//화면유형  목록
var viewTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
<c:forEach var="obj" items="${viewTpList}">
viewTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}" ,"useYn":"${obj.useYn}"});
</c:forEach>
//화면유형 맵
var viewTpMap = dms.data.arrayToMap(viewTpList, function(obj){ return obj.cmmCd; });

$(document).ready(function() {
    //버튼 - 조회
    $("#btnSearch").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').dataSource.page(1);
        }
    });

    //버튼 - 저장
    $("#btnSave").kendoButton({
        click:function(e) {
            var grid = $("#grid").data("kendoExtGrid");

            var saveData = grid.getCUDData("insertList", "updateList", "deleteList");
            if (grid.cudDataLength == 0) {
                //변경된 정보가 없습니다.
                dms.notification.info("<spring:message code='global.info.required.change'/>");
                return;
            }

            if (grid.gridValidation()) {
                $.ajax({
                    url:"<c:url value='/cmm/ath/viewInfo/multiViewInfos.do' />",
                    data:JSON.stringify(saveData),
                    type:'POST',
                    dataType:'json',
                    contentType:'application/json',
                    error:function(jqXHR,status,error) {
                        dms.notification.error(jqXHR.responseJSON.errors);
                    },
                    success:function(jqXHR, textStatus) {
                        grid.dataSource._destroyed = [];
                        grid.dataSource.read();

                        $("#viewHierarchyTree").data("kendoTreeView").dataSource.read();

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

    //버튼 - 추가
    $("#btnAdd").kendoButton({
        click:function(e) {
            if(selectedParentViewId == "") {
                dms.notification.info("<spring:message code='global.lbl.menu' var='menuMsg' /><spring:message code='global.info.validation.select' arguments='${menuMsg}' />");
                return;
            }

            var dataSource = $('#grid').data('kendoExtGrid').dataSource;
            var sortOrder = dataSource.data().length + 1;

            $.each(dataSource.data(), function(){
               if(this.sortOrder >= sortOrder){
                   sortOrder++;
               }
            });

			$.ajax({
				url:"<c:url value='/cmm/ath/viewInfo/selectNextViewId.do' />",
				data:"sysCd="+$("#sSysCd").data("kendoExtDropDownList").value(),
				type:'GET',
				dataType:'json',
				error:function(jqXHR,status,error) {
					dms.notification.error(jqXHR.responseJSON.errors);
				},
				success:function(jqXHR, textStatus) {
					dataSource.insert(0, {
						"sysCd":$("#sSysCd").data("kendoExtDropDownList").value()                         //시스템구분 'D':딜러, 'I':제조사
						,"parentViewId":selectedParentViewId                                              //상위화면ID
						,"viewId":jqXHR.viewId                                                            //화면ID
						,"viewNm":""                                                                      //화면명
						,"viewInfoCont":""                                                                //화면상세정보
						,"viewUrl":""                                                                     //URL
						,"viewTp":"01"                                                                    //화면유형 '01':화면, '02':버튼
						,"mesgKey":""                                                                     //화면명 메세지 코드
						,"sortOrder":sortOrder                                                            //정렬순서
						,"displayYn":"Y"                                                                  //표시여부 'Y':출력, 'N':출력안함
						,"tCd":""                                                                         //T코드
						,"iconNm":""                                                                      //아이콘 클래스명
						,"webMobileDstinCd":$("#sWebMobileDstinCd").data("kendoExtDropDownList").value()  //웹/모바일 구분 'W':웹, 'M':모바일
					});
				}
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

    //버튼 - 취소
    $("#btnCancel").kendoButton({
        click:function(e) {
            $('#grid').data('kendoExtGrid').cancelChanges();
        }
    });

    //조회조건 - 시스템구분
    $("#sSysCd").kendoExtDropDownList({
        dataSource:sysCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,value:"${sysCd}"
        ,change:function(e){
            viewHierarchyTree.dataSource.read();
            $("#grid").data("kendoExtGrid").dataSource.data([]);
        }
    });

    //조회조건 - 웹/모바일구분
    $("#sWebMobileDstinCd").kendoExtDropDownList({
        dataSource:webMobileDstinCdList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,value:"${webMobileDstinCd}"
        ,change:function(e){
            viewHierarchyTree.dataSource.read();
            $("#grid").data("kendoExtGrid").dataSource.data([]);
        }
    });

    //조회조건 - 화면유형
    $("#sViewTp").kendoExtDropDownList({
        dataSource:viewTpList
        ,dataValueField:"cmmCd"
        ,dataTextField:"cmmCdNm"
        ,index:0
    });

    //조회조건 - 출력여부
    $("#sDisplayYn").kendoExtDropDownList({
        dataSource:["", "Y", "N"]
        ,index:0
    });

    //메뉴트리 구성
    var viewHierarchyTree = $("#viewHierarchyTree").kendoTreeView({
        dataSource:{
            requestStart:function(e){
                dms.loading.show($("#viewHierarchyTreeContainer"));
            }
            ,requestEnd:function(e){
                dms.loading.hide($("#viewHierarchyTreeContainer"));
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
                    params["sSysCd"] = $("#sSysCd").data("kendoExtDropDownList").value();
                    params["sWebMobileDstinCd"] = $("#sWebMobileDstinCd").data("kendoExtDropDownList").value();
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
        ,dragAndDrop:true
        ,dataTextField:"data.childViewNm"
        ,dataValueField:"data.childViewId"
        ,loadOnDemand:false
        ,select:function(e){
            if(e.node){
                dataItem = this.dataItem(e.node)
                selectedParentViewId = dataItem.id;

                $('#grid').data('kendoExtGrid').dataSource.page(1);
            }
        }
        ,dataBound:function(e){
            if(dms.string.isNotEmpty(selectedParentViewId)){
                if(e.node){
                    dataItem = this.dataItem(e.node);
                    if(selectedParentViewId == dataItem.id){
                        this.select(this.findByUid(dataItem.uid));
                        this.expandTo(dataItem.id);
                    }
                }
            }else{
                $('#grid').data('kendoExtGrid').dataSource.data([]);
            }
        }
        ,drag:function(e){

            if(e.statusClass != "i-add"){
                e.setStatusClass("k-denied");
                return;
            }

            var srcItem = this.dataItem(e.sourceNode);
            var destItem = this.dataItem(e.dropTarget);

            // 폴더위로 드래그 하는 경우가 아니라면 제외한다.
            if(!destItem || destItem.spriteCssClass != "folder" || srcItem.data.parentViewId === destItem.id){
                e.setStatusClass("k-denied");
            }
        }
        ,drop:function(e){
            var srcData = {},
                destData = {},
                srcItem = this.dataItem(e.sourceNode),
                destItem = this.dataItem(e.dropTarget);

            // 드래그앤 드롭 정상수행 체크
            if(!srcItem || !destItem){
                e.setValid(false);
                return;
            }

            // 드롭 타켓이 폴더인 경우만 허용
            if(destItem.spriteCssClass != "folder"){
                e.setValid(false);
                return;
            }

            // 드롭 포지션이 OVER 인 경우만 허용
            if(e.dropPosition !== "over"){
                e.setValid(false);
                return;
            }

            // 같은계층 이동 금지
            if(srcItem.data.parentViewId === destItem.id){
                e.setValid(false);
                return;
            }

            // 버튼이동 금지
            if(srcItem.data.childViewTp !== "01"){
                e.setValid(false);
                return;
            }

            // 변경전
            srcData["parentViewId"] = srcItem.data.parentViewId;
            srcData["childViewId"] = srcItem.id;
            srcData["sysCd"] = srcItem.data.sysCd;

            // 변경후
            destData["parentViewId"] = destItem.id;
            destData["childViewId"] = srcItem.id;
            destData["sysCd"] = srcItem.data.sysCd;

            // 소스노드의 상위화면ID를 변경한다.
            srcItem.data.parentViewId = destItem.id;

            $.ajax({
                url:"<c:url value='/cmm/ath/viewInfo/updateViewInfoTree.do' />",
                data:JSON.stringify({"oldVO":srcData, "newVO":destData}),
                type:'POST',
                dataType:'json',
                contentType:'application/json',
                error:function(jqXHR,status,error){
                    e.preventDefault();
                    dms.notification.error(JSON.parse(jqXHR.responseText).error);
                },
                success:function(jqXHR, textStatus){
                    viewHierarchyTree.dataSource.read();
                    dms.notification.success("<spring:message code='global.info.success'/>");
                }
            });
        }
        ,dragstart:function(e) {
            var srcItem = this.dataItem(e.sourceNode);

            // 루트노드 이거나 화면유형이 화면이 아니 경우(버튼인경우) 드래그 금지
            if(srcItem.spriteCssClass === "rootFolder" || srcItem.data.childViewTp !== "01"){
                e.preventDefault();
                return;
            }
        }
     }).data("kendoTreeView");

    //화면 그리드 설정
    $("#grid").kendoExtGrid({
        gridId:"G-CMM-0720-103901"
        ,dataSource:{
            transport:{
                read:{
                    url:"<c:url value='/cmm/ath/viewInfo/selectViewInfos.do' />"
                }
                ,parameterMap:function(options, operation) {
                    if (operation === "read") {
                        var params = {};

                        params["sort"] = options.sort;

                        params["sSysCd"] = $("#sSysCd").data("kendoExtDropDownList").value();          //시스템코드 'D':딜러,'I':임포터
                        params["sParentViewId"] = selectedParentViewId;                             //상위 화면ID
                        params["sViewId"] = $("#sViewId").val();                                    //화면ID
                        params["sViewNm"] = $("#sViewNm").val();                                    //화면명
                        params["sViewTp"] = $("#sViewTp").data("kendoExtDropDownList").value();        //화면명
                        params["sDisplayYn"] = $("#sDisplayYn").data("kendoExtDropDownList").value();  //화면명
                        params["sWebMobileDstinCd"] = $("#sWebMobileDstinCd").data("kendoExtDropDownList").value();                        //웹/모바일 구분 'W':웹, 'M':모바일

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
                        rnum:{type:"string", editable:false}
                        ,parentViewId:{type:"string", editable:false}
                        ,viewId:{type:"string", validation:{required:true}}
                        ,viewNm:{type:"string", validation:{required:true}}
                        ,viewInfoCont:{type:"string"}
                        ,viewUrl:{type:"string"}
                        ,viewTp:{type:"string", validation:{required:true}}
                        ,mesgKey:{type:"string", validation:{required:true}}
                        ,sortOrder:{type:"number", validation:{required:true, min:1}}
                        ,displayYn:{type:"string", validation:{required:true}}
                        ,tCd:{type:"string"}
                        ,iconNm:{type:"string"}
                    }
                }
                ,parse:function(d) {
                    if(d.data){
                        $.each(d.data, function(idx, elem) {
                            elem.rnum = idx+1;
                        });
                    }
                    return d;
                }
            }
        }
        ,autoBind:false
        ,pageable:false
        ,height:341
        ,multiSelectWithCheckbox:true
        ,editableOnlyNew:true
        ,editableOnlyNewExcludeColumns:["viewNm","viewInfoCont","viewUrl","viewTp","mesgKey","sortOrder","displayYn","tCd","iconNm"]
        ,columns:[
            {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60
                ,filterable:false
                ,sortable:false
                ,attributes:{"class":"ac"}
            }
            ,{field:"parentViewId", title:"<spring:message code='global.lbl.parentViewId' />", width:100}
            ,{field:"viewId", title:"<spring:message code='global.lbl.viewId' />", width:100}
            ,{field:"viewNm", title:"<spring:message code='global.lbl.viewNm' />", width:150}
//             ,{field:"viewInfoCont", title:"<spring:message code='global.lbl.viewInfoCont' />", width:150}
            ,{field:"viewUrl", title:"<spring:message code='global.lbl.URL' />"}
            ,{field:"viewTp", title:"<spring:message code='global.lbl.viewTp' />", width:80, attributes:{"class":"ac"}
                ,template:"# if(viewTpMap[viewTp] != null) { # #= viewTpMap[viewTp].cmmCdNm# # }#"
                ,editor:function(container, options) {
                    $('<input required name="viewTp" data-bind="value:' + options.field + '"/>')
                    .appendTo(container)
                    .kendoExtDropDownList({
                        autoBind:false
                        ,dataTextField:"cmmCdNm"
                        ,dataValueField:"cmmCd"
                        ,dataSource:dms.data.cmmCdFilter(viewTpList)
                    });
                    $('<span class="k-invalid-msg" data-for="viewTp"></span>').appendTo(container);
                }
            }
            ,{field:"mesgKey", title:"<spring:message code='global.lbl.mesgKey' />", width:200}
            ,{field:"sortOrder", title:"<spring:message code='global.lbl.sortOrder' />", width:80, attributes:{"class":"ac"}}
            ,{field:"displayYn", title:"<spring:message code='global.lbl.displayYn' />", width:80, attributes:{"class":"ac"}
                ,editor:function(container, options) {
                $('<input required name="displayYn" data-bind="value:' + options.field + '"/>')
                .appendTo(container)
                .kendoExtDropDownList({
                    autoBind:true
                    ,dataSource:['Y','N']
                    ,index:0
                });
                $('<span class="k-invalid-msg" data-for="displayYn"></span>').appendTo(container);
            }
            }
            ,{field:"tCd", title:"<spring:message code='global.lbl.tCd' />", width:80, attributes:{"class":"ac"}}
            ,{field:"iconNm", title:"<spring:message code='global.lbl.iconNm' />", width:100}
        ]
    });

    $("#viewHierarchyTreeContainer").height($(window).innerHeight()-65);
});
</script>