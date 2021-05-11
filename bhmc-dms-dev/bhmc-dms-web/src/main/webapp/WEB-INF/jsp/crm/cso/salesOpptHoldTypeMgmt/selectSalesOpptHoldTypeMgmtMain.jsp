<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="dms" uri="/WEB-INF/tlds/taglibs-dms"%>
<div id="resizableContainer">  <!--  resizableContainer Div -->
    <!-- 판매기회 유입 유형관리 -->
    <section class="group">
        <!-- 조회 조건 타이틀 시작 -->
        <div class="header_area">
            <h1 class="title_basic"><spring:message code="crm.menu.approchLocationMng" /></h1>
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11131" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_search" id="btnSearch"><spring:message code="global.btn.search" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11132" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_save" id="btnSave"><spring:message code="global.btn.save" /></button>
            </dms:access>
            <dms:access viewId="VIEW-D-11133" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_m btn_cancel" id="btnCancel"><spring:message code="global.btn.cancel" /></button>
            </dms:access>
            </div>
        </div>
        <!-- 조회 조건 타이틀 종료 -->

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
                    <col style="width:10%;">
                    <col>
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row"><spring:message code='crm.lbl.approchLocation' /></th> <!-- 리드출처 -->
                        <td>
                            <input id="sHoldTp" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.approchLocationDetl' /></th> <!-- 상세정보경로 -->
                        <td>
                            <input id="sHoldDetlTpNm" type="text" class="form_comboBox">
                        </td>
                        <th scope="row"><spring:message code='crm.lbl.bhmcYn' /></th> <!-- BHMC 여부 -->
                        <td>
                            <input id="sSiebelHoldRowIdYn" type="text" class="form_comboBox">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <!-- 조회 조건 종료 -->

        <!-- 그리드 기능 버튼 시작 -->
        <div class="header_area">
            <div class="btn_right">
            <dms:access viewId="VIEW-D-11134" hasPermission="${dms:getPermissionMask('READ')}">
                <button type="button" class="btn_s" id="btnAdd"><spring:message code="global.btn.rowAdd" /></button>
            </dms:access>
                <!--
                <button type="button" class="btn_s" id="btnDel"><spring:message code="global.btn.rowDel" /></button>
                -->
            </div>
        </div>
        <!-- 그리드 기능 버튼 종료 -->

        <!-- 그리드 시작 -->
        <div class="table_grid">
            <div id="grid" class="resizable_grid"></div>
        </div>
        <!-- 그리드 종료 -->
    </section>
</div> <!--  // resizableContainer Div -->
<script type="text/javascript">

    var holdTpList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var holdTpGridList = [{"cmmCd":"", "cmmCdNm":"", "useYn":""}];
    var holdTpMap = [];
    <c:forEach var="obj" items="${holdTpList}">

        holdTpList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        holdTpMap["${obj.cmmCd}"] = "${obj.cmmCdNm}";

        <c:if test="${obj.cmmCd != '03'}">
            holdTpGridList.push({"cmmCd":"${obj.cmmCd}", "cmmCdNm":"${obj.cmmCdNm}", "useYn":"${obj.useYn}"});
        </c:if>

    </c:forEach>

    var yesNoList = [];
    var yesNoMap = [];
    yesNoList.push({"cmmCd":"Y" , "cmmCdNm":"<spring:message code='global.lbl.yes' />"});
    yesNoList.push({"cmmCd":"N" , "cmmCdNm":"<spring:message code='global.lbl.n' />"});
    yesNoMap["Y"] = "<spring:message code='global.lbl.yes' />";
    yesNoMap["N"] = "<spring:message code='global.lbl.n' />";


    var gridData = new kendo.data.DataSource({data:[]});


    $(document).ready(function() {

        //조회조건 - 번들선택
        $("#sHoldTp").kendoExtDropDownList({
            dataSource:dms.data.cmmCdFilter(holdTpList)
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            ,index:0
        });

        //조회조건 - 번들선택
        $("#sSiebelHoldRowIdYn").kendoExtDropDownList({
            dataSource:yesNoList
            ,dataTextField:"cmmCdNm"
            ,dataValueField:"cmmCd"
            , optionLabel:" "
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

                //필터가 적용된 상태체크
                if($('#grid').data('kendoExtGrid').dataSource.filter()){
                    dms.notification.info("<spring:message code='global.info.clearFilter'/>");
                    return;
                }

                $('#grid').data('kendoExtGrid').dataSource.insert(0, {
                    "holdTp":$("#sHoldTp").data("kendoExtDropDownList").value()
                    ,"holdDetlTpNm":""
                    ,"remark":""
                    ,"sortOrder":""
                    ,"delYn":""
                    ,"siebelHoldRowId":"N"
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

        //버튼 - 저장
        $("#btnSave").kendoButton({
            click:function(e) {

                var grid = $("#grid").data("kendoExtGrid");

                var saveData = grid.getCUDData("insertList", "updateList", "deleteList", ["lstUpdtDtFormat"]);
                if (grid.cudDataLength == 0) {
                    //변경된 정보가 없습니다.
                    dms.notification.info("<spring:message code='global.info.required.change'/>");
                    return;
                }

             // 그리드 무결성 점검
                var dataValidate = false;
                $.each(saveData.insertList, function(idx, row){
                    if(row.holdTp == ""){
                       // 선택하지 않은 주소유형이 있습니다.
                       dms.notification.info("<spring:message code='crm.lbl.approchLocation' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
                       dataValidate = true;
                    }
                    if(row.holdDetlTpNm == ""){
                       // 선택하지 않은 주소유형이 있습니다.
                       dms.notification.info("<spring:message code='crm.lbl.approchLocationDetl' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
                       dataValidate = true;
                    }
                    if(row.delYn == ""){
                       // 선택하지 않은 주소유형이 있습니다.
                       dms.notification.info("<spring:message code='crm.lbl.useYn' var='globalLblAddress' /><spring:message code='global.info.nonSelectItem' arguments='${globalLblAddress}' />");
                       dataValidate = true;
                    }
                 });

                if(dataValidate){ return false;}

                if (grid.gridValidation()) {
                    $.ajax({
                        url:"<c:url value='/crm/cso/salesOpptHoldTypeMgmt/multiSalesOpptHoldType.do' />"
                        ,data:JSON.stringify(saveData)
                        ,type:'POST'
                        ,dataType:'json'
                        ,contentType:'application/json'
                        ,error:function(jqXHR, status, error) {
                            dms.notification.error(jqXHR.responseJSON.errors);
                        }
                        ,success:function(jqXHR, textStatus) {

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
            //그리드 개인화를 위하여 반드시 그리드 ID를 설정하여야 합니다.
            gridId:"G-CRM-0811-104033"
            ,dataSource:{
                transport:{
                    read:{
                        url:"<c:url value='/crm/cso/salesOpptHoldTypeMgmt/selectSalesOpptHoldType.do' />"
                    }
                    ,parameterMap:function(options, operation) {
                        if (operation === "read") {

                            var params = {};

                            params["recordCountPerPage"] = options.pageSize;
                            params["pageIndex"] = options.page;
                            params["firstIndex"] = options.skip;
                            params["lastIndex"] = options.skip + options.take;
                            params["sort"] = options.sort;

                            params["sHoldTp"] = $("#sHoldTp").data("kendoExtDropDownList").value();
                            params["sHoldDetlTpNm"] = $("#sHoldDetlTpNm").val();
                            params["sDtSearchFlag"] = "N";
                            params["sSiebelHoldRowIdYn"] = $("#sSiebelHoldRowIdYn").data("kendoExtDropDownList").value();

                            return kendo.stringify(params);

                        } else if (operation !== "read" && options.models) {
                            return kendo.stringify(options.models);
                        }
                    }
                }
                ,schema:{
                    model:{
                        id:"holdSeq"
                        ,fields:{
                            rnum:{type:"number", editable:false}
                            ,holdTp:{type:"string", validation:{required:true}}
                            ,regDt:{type:"date", editable:false}
                            ,updtDt:{type:"date", editable:false}
                            ,siebelHoldRowId:{type:"string", editable:false}
                            ,startDt:{type:"date", editable:false}
                            ,endDt:{type:"date", editable:false}
                        }
                    }
                }

            }
            , edit:function(e){

                var fieldName = e.container.find("input").attr("name");

                // 질문유형이 체크박스일경우 답변개수 입력 가능.
                if ( (fieldName == "holdDetlTpNm" && e.model.holdTp == "03")
                        || (fieldName == "remark" && e.model.holdTp == "03")
                        || (fieldName == "holdTp" && e.model.holdTp == "03")
                        ) {
                    this.closeCell();
                };

            }
            ,indvColumnVisible:false           //컬럼 보이기/감추기 개인화 적용. default:true
            ,indvColumnReorderable:false       //컬럼순서 변경 개인화 적용. default:true
            ,indvColumnRows:10                //컬럼개인화 컨텍스트 메뉴를 구성을 위한 출력 갯수 default:10
            ,multiSelectWithCheckbox:false     //멀티선택 적용. default:false
            ,multiSelectLocked:false          //멀티선택 컬럼 틀고정 default:false
            ,appendEmptyColumn:true           //빈컬럼 적용. default:false
            ,sortable:true
            ,enableTooltip:true               //Tooltip 적용, default:false
            ,columns:[
                {field:"rnum", title:"<spring:message code='global.lbl.no' />", width:60, sortable:false
                    ,attributes:{"class":"ac"}
                }
                ,{field:"holdTp", title:"<spring:message code='crm.lbl.approchLocation' />", width:100
                    ,attributes:{"class":"ac"}
                    ,sortable:false
                    ,editor:function(container, options) {
                        $('<input required name="holdTp" data-bind="value:' + options.field + '"/>')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            autoBind:false
                            ,dataSource:holdTpGridList
                            ,dataTextField:"cmmCdNm"
                            ,dataValueField:"cmmCd"
                            ,change:function(e){

                                if (this.value() == "03"){
                                    dms.notification.info("<spring:message code='crm.info.salesOpptHoldTpDeDeny'/>");
                                    this.value("01");
                                    this.trigger("change");
                                }
                            }
                        })
                        $('<span class="k-invalid-msg" data-for="holdTp"></span>').appendTo(container);
                    }
                    , template:'#if (holdTp !== ""){# #= holdTpMap[holdTp]# #}#'
                }
                ,{field:"holdDetlTpNm", title:"<spring:message code='crm.lbl.approchLocationDetl' />", width:200
                    ,sortable:true
                }
                ,{field:"remark", title:"<spring:message code='crm.lbl.remark' />", width:150
                    ,sortable:true
                }
                ,{field:"delYn", title:"<spring:message code='crm.lbl.useYn' />", width:70
                    ,attributes:{"class":"ac"}
                    ,sortable:true
                    ,editor:function(container, options){
                        $('<input data-bind="value:' + options.field + '"  />')
                        .appendTo(container)
                        .kendoExtDropDownList({
                            dataTextField:"cmmCdNm"
                            , dataValueField:"cmmCd"
                            , dataSource:yesNoList
                        });
                    }
                    ,template:'#if (delYn !== ""){# #= yesNoMap[delYn]# #}#'
                }
                ,{field:"siebelHoldRowId", title:"<spring:message code='crm.lbl.bhmcYn' />", width:90
                    ,attributes:{"class":"ac"}
                    ,sortable:true
                    ,template:function(dataItem){
                        var spanObj = "";
                        if (dataItem.siebelHoldRowId=='N') {
                            spanObj = "<spring:message code='global.lbl.n' />";
                        } else {
                            spanObj = "<spring:message code='global.lbl.yes' />";
                        }
                        return spanObj;
                    }
                }
                ,{field:"startDt", title:"<spring:message code='crm.lbl.startDt' />", width:120
                    ,attributes:{"class":"ac"}
                    ,sortable:true
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                }
                ,{field:"endDt", title:"<spring:message code='crm.lbl.endDt' />", width:120
                    ,attributes:{"class":"ac"}
                    ,sortable:true
                    ,format:"{0:<dms:configValue code='dateFormat' />}"
                }
            ]
        });
    });

</script>
